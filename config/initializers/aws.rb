CarrierWave.configure do |config|
  
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJ2U2GCGESUNSXLOQ',       # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
 
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'themeplate'                          # required
  config.fog_attributes = {} # optional, defaults to {}
end