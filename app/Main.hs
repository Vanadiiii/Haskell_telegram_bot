{-# LANGUAGE OverloadedStrings #-}

module Main where

import Network.HTTP.Client     (newManager)
import Network.HTTP.Client.TLS (tlsManagerSettings)
import Web.Telegram.API.Bot

main :: IO ()
main = do
  manager <- newManager tlsManagerSettings
  res <- getMe token manager
  case res of
    Left e -> do
      putStrLn "Request failed"
      print e
    Right Response {result = u} -> do
      putStrLn "Request succeded"
      print $ user_first_name u
  where token = Token "1379206109:AAHuXjCEs52KvF6xxmVvvZODRwn8EE0YQh8"
