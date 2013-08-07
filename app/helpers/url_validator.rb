class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless starts_properly(attribute) #&& valid_uri(attribute)
      record.errors[attribute] << (options[:message] || "is not a url")
    end

  end

  def starts_properly(attribute)
    return true if attribute =~ /http:\/\// || attribute =~ /https:\/\//
  end

  def valid_uri(attribute)
    attribute =~ /^#{URI::regexp}$/
  end
end