RSpec::Matchers.define :have_output do  |content|
  match do |array|
    array.last =~ content
  end
  failure_message_for_should do |array|
    "Expected \"#{array.last}\" to match #{content}."
  end
  failure_message_for_should_not do |array|
    "Expected \"#{array.last}\" not to match #{content}."
  end
end
