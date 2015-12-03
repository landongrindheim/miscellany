module TestTimeTracking
  class ActiveSupport::TestCase
    def self.should_track_timing?
      not(ENV["tracking"].nil?)
    end

    setup :mark_test_start_time if should_track_timing?
    teardown :record_test_duration if should_track_timing?

    def mark_test_start_time
      @start_time = Time.now
    end

    def record_test_duration
      File.open("#{Rails.root}/tmp/test_metrics.csv", "a") do |f|
        duration = Time.now - @start_time
        if duration > 0.2
          f.puts "#{duration}, #{self.class}, #{name().gsub(/,/, '_')}"
        end
      end
    end
  end
end
