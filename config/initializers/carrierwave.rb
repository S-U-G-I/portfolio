unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIATOU2VTEZJ3YJ6XMQ',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'port--folio'
    config.cache_storage = :fog
  end
end
