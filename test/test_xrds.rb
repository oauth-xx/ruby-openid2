# test helpers
require_relative "test_helper"
require_relative "testutil"

# this library
require "ruby-openid2"
require "openid/yadis/xrds"

module OpenID
  module Yadis
    module XRDSTestMixin
      include TestDataMixin

      XRD_FILE = "valid-populated-xrds.xml"
      NOXRDS_FILE = "not-xrds.xml"
      NOXRD_FILE = "no-xrd.xml"

      XRDS_DATA_DIR = TEST_DATA_DIR.join("test_xrds")

      def read_xrds_data_file(filename)
        read_data_file(filename, false, XRDS_DATA_DIR)
      end
    end

    class ParseXRDSTestCase < Minitest::Test
      include XRDSTestMixin

      # Check that parsing succeeds at all.
      def test_parse
        result = Yadis.parseXRDS(read_xrds_data_file(XRD_FILE))

        refute_nil(result)
      end

      def test_parse_no_xrds_xml
        xmldoc = read_xrds_data_file(NOXRDS_FILE)
        assert_raises(Yadis::XRDSError) do
          Yadis.parseXRDS(xmldoc)
        end
      end

      def test_parse_no_xrds_empty
        assert_raises(Yadis::XRDSError) do
          Yadis.parseXRDS("")
        end
      end

      def test_is_xrds
        isnt = REXML::Document.new(read_xrds_data_file(NOXRDS_FILE))
        should_be = Yadis.parseXRDS(read_xrds_data_file(XRD_FILE))

        assert_equal(false, Yadis.is_xrds?(isnt))
        assert(Yadis.is_xrds?(should_be))
      end
    end

    class GetYadisXRDTestCase < Minitest::Test
      include XRDSTestMixin

      # XXX: Test to make sure this really gets the _right_ XRD.
      def test_get_xrd
        doc = Yadis.parseXRDS(read_xrds_data_file(XRD_FILE))
        result = Yadis.get_yadis_xrd(doc)

        refute_nil(result)
        assert_equal("XRD", result.name)
        assert_equal(Yadis::XRD_NS_2_0, result.namespace)
      end

      def test_no_xrd
        xmldoc = read_xrds_data_file(NOXRD_FILE)
        doc = Yadis.parseXRDS(xmldoc)
        assert_raises(Yadis::XRDSError) do
          Yadis.get_yadis_xrd(doc)
        end
      end
    end

    class EachServiceTestCase < Minitest::Test
      include XRDSTestMixin

      def test_get_xrd
        doc = Yadis.parseXRDS(read_xrds_data_file(XRD_FILE))
        count = 0
        result = Yadis.each_service(doc) do |e|
          assert_equal("Service", e.name)
          count += 1
        end

        refute_nil(result)
        assert_equal(5, count)
      end

      def test_no_xrd
        xmldoc = read_xrds_data_file(NOXRD_FILE)
        doc = Yadis.parseXRDS(xmldoc)
        assert_raises(Yadis::XRDSError) do
          Yadis.each_service(doc)
        end
      end

      def test_equal_j3h
        doc = Yadis.parseXRDS(read_xrds_data_file("=j3h.2007.11.14.xrds"))
        count = 0
        result = Yadis.each_service(doc) do |e|
          assert_equal("Service", e.name)
          count += 1
        end

        refute_nil(result)
        assert_equal(2, count)
      end
    end

    # XXX: test prioSort!

    class ExpandServiceTestCase < Minitest::Test
      @@service_xml = <<~END
        <Service>
        <Type>urn://foo</Type>
        <Type>urn://bar</Type>
        <URI priority='2'>http://2.invalid/</URI>
        <URI>http://0.invalid/</URI>
        <URI priority='1'>http://1.invalid/</URI>
        </Service>
      END

      # XXX - not sorted!
      def test_expand_service
        service_element = REXML::Document.new(@@service_xml).root
        result = Yadis.expand_service(service_element)

        assert_equal(3, result.length)
        types, uri, result_element = result[0]

        assert_same(service_element, result_element)
        assert_equal("http://0.invalid/", uri)
        assert_equal(["urn://foo", "urn://bar"], types)
        types, uri, result_element = result[1]

        assert_equal("http://1.invalid/", uri)
        types, uri, result_element = result[2]

        assert_equal("http://2.invalid/", uri)
      end
    end

    class PrioSortTestCase < Minitest::Test
      def new_uri(priority)
        e = REXML::Element.new("URI")
        e.add_attribute("priority", priority.to_s) unless e.nil?
        e
      end

      def test_sorting
        l = [
          e7 = new_uri(7),
          e1 = new_uri(1),
          e0 = new_uri(nil),
          e2 = new_uri(2),
        ]
        sorted = Yadis.prio_sort(l)

        assert_same(e0, sorted[0])
        assert_same(e1, sorted[1])
        assert_same(e2, sorted[2])
        assert_same(e7, sorted[3])
      end
    end

    class GetCanonicalIDTestCase < Minitest::Test
      include XRDSTestMixin

      def test_multisegment_xri
        xmldoc = Yadis.parseXRDS(read_xrds_data_file("subsegments.xrds"))
        Yadis.get_canonical_id("xri://=nishitani*masaki", xmldoc)
      end
    end
  end
end
