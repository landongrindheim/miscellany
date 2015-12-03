

This code is largely pulled from a 2009 post on the [XPlayer blog](https://xplayer.wordpress.com/2009/10/02/ruby-how-to-spot-slow-tests-in-your-test-suite/).

To use it, issue `tracking=on rake test`

It will slow down the test suite, so commenting out `include TestTimeTracking` in test_helper.rb is wise until you need to look for slow tests.

