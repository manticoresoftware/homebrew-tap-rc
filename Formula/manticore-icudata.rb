require_relative 'manticore-icudata-dev'
require_relative 'manticore_helper'

class ManticoreIcudata < ManticoreIcudataDev
  filepath, sha256 = ManticoreHelper.download_file(
    'manticore-icudata',
    'https://repo.manticoresearch.com/repository/manticoresearch_macos/release/manticore-icudata-65l.tar.gz'
  )

  url "file://#{filepath}"
  version "65l"
  sha256 sha256
end
