cask 'r' do
  version '3.6.2'
  sha256 '96bdb2a2017bd34f5ead2f7a7b537073e76a212ffdf1df25dddbe93d03bba843'

  url "https://cloud.r-project.org/bin/macosx/R-#{version}.pkg"
  appcast 'https://cloud.r-project.org/bin/macosx/'
  name 'R'
  homepage 'https://www.r-project.org/'

  depends_on macos: '>= :el_capitan'

  pkg "R-#{version}.pkg"

  uninstall pkgutil: 'org.r-project*',
            delete:  [
                       '/Library/Frameworks/R.Framework',
                       '/usr/bin/R',
                       '/usr/bin/Rscript',
                     ]

  zap trash: [
               '~/.R',
               '~/.Rapp.history',
               '~/.RData',
               '~/.Rhistory',
               '~/.Rprofile',
               '~/Library/R',
               '~/Library/Caches/org.R-project.R',
             ]

  caveats do
    files_in_usr_local
  end
end
