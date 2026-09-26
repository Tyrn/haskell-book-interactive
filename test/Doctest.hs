module Main (main) where

import Control.Monad (forM)
import System.Directory (doesDirectoryExist, listDirectory)
import System.FilePath (takeExtension, (</>))
import Test.DocTest (doctest)

-- | Recursively collect all .hs files under a directory.
findHsFiles :: FilePath -> IO [FilePath]
findHsFiles dir = do
  entries <- listDirectory dir
  paths <- forM entries $ \e -> do
    let p = dir </> e
    isDir <- doesDirectoryExist p
    if isDir
      then findHsFiles p
      else pure [p | takeExtension p == ".hs"]
  pure (concat paths)

main :: IO ()
main = do
  srcs <- findHsFiles "src"
  doctest ("-isrc" : srcs)
