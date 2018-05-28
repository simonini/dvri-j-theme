require 'test_helper'
require 'nokogiri'

class SitemapTest < CapybaraTestCase
  def test_sitemap_and_extensions
    path = File.join(DvriSettingTest.root_path, "_site", "sitemap.xml")
    File.open(path) do |file|
      docs = Nokogiri::XML(file)
      docs.remove_namespaces!
      locs = docs.xpath("//loc")
      contents =  locs.map{|loc|loc.content}
      assert_includes contents, 'http://distrettovenezianoricerca.it/irene-scarpa.html'
      assert_includes contents, 'http://distrettovenezianoricerca.it/progetti/caffe-2018.html'
    end
  end
end
