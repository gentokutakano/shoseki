require "refile/s3"

aws = {
  access_key_id: "AKIA4CFOAJIU7SM2DOMG",
  secret_access_key: "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",
  region: "ap-northeast-1",
  bucket: "shoseki-app",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)