# test/features/this_blog_post_test.rb
require 'test_helper'

class CaffetTest < CapybaraTestCase
  def test_describes_how_to_write_tests
    visit '/'
    assert page.has_content?('DVRI')

    click_link 'Caffè dell\'Innovazione'
    assert page.has_content?('4° Edizione')


    click_link 'Edizione Giugno 2016'
    editions_assertions

    click_link 'Edizione Settembre 2016'
    editions_assertions

    click_link 'Edizione 2017'
    editions_assertions

    click_link 'Edizione 2018'
    editions_assertions
  end

  private

  def editions_assertions
    page.execute_script "location.href = '#caffe-editions'"
    assert page.has_content? 'Le edizioni'
    assert page.has_content? 'Edizione Giugno 2016'
    assert page.has_content? 'Edizione Settembre 2016'
    assert page.has_content? 'Edizione 2017'
    assert page.has_content? 'Edizione 2018'
  end
end
