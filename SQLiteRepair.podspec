# pod lib lint --verbose --skip-import-validation --allow-warnings SQLiteRepair.podspec
# pod trunk push --verbose --skip-import-validation --allow-warnings SQLiteRepair.podspec
Pod::Spec.new do |sqliterk|
  sqliterk.name         = "SQLiteRepair"
  sqliterk.version      = "1.2.2"
  sqliterk.summary      = "Repair kit for SQLite based database"
  sqliterk.description  = <<-DESC
                          sqliterk is a efficient, self-contain repair kit for restoring corrupted SQLite based database.

                          It's basically used in WCDB, which is an efficient, complete, easy-to-use mobile database framework.
                          DESC
  sqliterk.homepage     = "https://github.com/wujianguo/SQLiteRepair"
  sqliterk.license      = { :type => "BSD", :file => "LICENSE" }
  sqliterk.author             = { "wujianguo" => "lsjustin89@gmail.com" }
  sqliterk.module_name = "sqliterk"
  sqliterk.watchos.deployment_target = "2.0"
  sqliterk.tvos.deployment_target = "9.0"
  sqliterk.osx.deployment_target = "10.10"
  sqliterk.ios.deployment_target = "9.0"
  sqliterk.dependency 'OptimizedSQLCipher'
  sqliterk.source       = { :git => "https://github.com/wujianguo/SQLiteRepair.git", :tag => sqliterk.version }
  sqliterk.public_header_files = "repair/SQLiteRepairKit.h"
  sqliterk.source_files  = "repair/*.{h,c,cpp}"
  sqliterk.libraries = "z", "c++"
  sqliterk.pod_target_xcconfig = {
    "GCC_PREPROCESSOR_DEFINITIONS" => "SQLITE_HAS_CODEC WCDB_BUILTIN_SQLCIPHER",
    "LIBRARY_SEARCH_PATHS[sdk=macosx*]" => "$(SDKROOT)/usr/lib/system",
    "CLANG_CXX_LANGUAGE_STANDARD" => "gnu++0x",
    "CLANG_CXX_LIBRARY" => "libc++",
    "APPLICATION_EXTENSION_API_ONLY" => "YES",
  }
  sqliterk.header_dir = "sqliterk"
end
