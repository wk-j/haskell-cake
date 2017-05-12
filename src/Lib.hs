module Lib
    ( someFunc
    ) where

import Network.Curl.Download
import System.Directory (doesFileExist)
import System.Process (callCommand)

download :: String -> String -> IO()
download url target = do
    osxDoc <- openURIString url
    case osxDoc of
        Left  err  -> do
            putStrLn $ "-- error downloading url "
            putStrLn $ "-- " ++ err
        Right html -> do
            writeFile target html

someFunc :: IO ()
someFunc = do
    exist <- doesFileExist "build.sh" 
    if not exist then do
        download "https://raw.githubusercontent.com/cake-build/resources/master/build.sh" "build.sh"
        callCommand "chmod u+x build.sh"
    else
        putStrLn "-- build.sh already exist"
    -- let win = "http://cakebuild.net/download/bootstrapper/windows"



