require 'test_helper'

describe Collector do
  # http://www.thestranger.com/blogs/slog/2015/09/03/22809715/beyond-these-boots-are-made-for-walkinlee-hazlewoods-10-best-songs
  let(:blog_url) { "#{Rails.root}/test/fixtures/blogs/lee_hazlewood.html" }

  describe '#links' do
    let(:expected_song_urls) do
      [
        '<iframe width="500" height="315" src="https://www.youtube.com/embed/j1sq_fdq_Ps" frameborder="0" allowfullscreen></iframe>',
        '<iframe width="500" height="315" src="https://www.youtube.com/embed/QTeeNb9G7Is" frameborder="0" allowfullscreen></iframe>',
        '<iframe width="500" height="315" src="https://www.youtube.com/embed/0SY_oMxchjM" frameborder="0" allowfullscreen></iframe>',
        '<iframe width="500" height="315" src="https://www.youtube.com/embed/o_aMIqX0cZM" frameborder="0" allowfullscreen></iframe>',
        '<iframe width="500" height="315" src="https://www.youtube.com/embed/WN-vJL6gKsU" frameborder="0" allowfullscreen></iframe>',
        '<iframe width="500" height="315" src="https://www.youtube.com/embed/5EIDSR9N9a8" frameborder="0" allowfullscreen></iframe>',
        '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/173462017&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&visual=true"></iframe>',
        '<iframe width="500" height="315" src="https://www.youtube.com/embed/Ba1uTCW-J1k" frameborder="0" allowfullscreen></iframe>',
        '<iframe width="500" height="315" src="https://www.youtube.com/embed/pSi4m4Yx4kg" frameborder="0" allowfullscreen></iframe>',
        '<iframe width="500" height="315" src="https://www.youtube.com/embed/4Zh2TDbjLeg" frameborder="0" allowfullscreen></iframe>'
      ]
    end

    it 'should grab links from url' do
      collector = Collector.new(blog_url)
      assert_equal(expected_song_urls, collector.links)
    end
  end

  describe '#ids' do
    let(:expected_song_ids) do
      [
        'j1sq_fdq_Ps',
        'QTeeNb9G7Is',
        '0SY_oMxchjM',
        'o_aMIqX0cZM',
        'WN-vJL6gKsU',
        '5EIDSR9N9a8',
        # TODO - soundcloud, not supported yet:
        # '173462017',
        'Ba1uTCW-J1k',
        'pSi4m4Yx4kg',
        '4Zh2TDbjLeg'
      ]
    end

    it 'should grab ids from url' do
      collector = Collector.new(blog_url)
      assert_equal(expected_song_ids, collector.ids)
    end
  end
end
