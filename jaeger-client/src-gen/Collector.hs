{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-missing-fields #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-----------------------------------------------------------------
-- Autogenerated by Thrift Compiler (0.9.3)                      --
--                                                             --
-- DO NOT EDIT UNLESS YOU ARE SURE YOU KNOW WHAT YOU ARE DOING --
-----------------------------------------------------------------

module Collector where
import Prelude (($), (.), (>>=), (==), (++))
import qualified Prelude as P
import qualified Control.Exception as X
import qualified Control.Monad as M ( liftM, ap, when )
import Data.Functor ( (<$>) )
import qualified Data.ByteString.Lazy as LBS
import qualified Data.Hashable as H
import qualified Data.Int as I
import qualified Data.Maybe as M (catMaybes)
import qualified Data.Text.Lazy.Encoding as E ( decodeUtf8, encodeUtf8 )
import qualified Data.Text.Lazy as LT
import qualified GHC.Generics as G (Generic)
import qualified Data.Typeable as TY ( Typeable )
import qualified Data.HashMap.Strict as Map
import qualified Data.HashSet as Set
import qualified Data.Vector as Vector
import qualified Test.QuickCheck.Arbitrary as QC ( Arbitrary(..) )
import qualified Test.QuickCheck as QC ( elements )

import qualified Thrift as T
import qualified Thrift.Types as T
import qualified Thrift.Arbitraries as T


import Jaeger_Types
import qualified Collector_Iface as Iface
-- HELPER FUNCTIONS AND STRUCTURES --

data SubmitBatches_args = SubmitBatches_args  { submitBatches_args_batches :: (Vector.Vector Batch)
  } deriving (P.Show,P.Eq,G.Generic,TY.Typeable)
instance H.Hashable SubmitBatches_args where
  hashWithSalt salt record = salt   `H.hashWithSalt` submitBatches_args_batches record  
instance QC.Arbitrary SubmitBatches_args where 
  arbitrary = M.liftM SubmitBatches_args (QC.arbitrary)
  shrink obj | obj == default_SubmitBatches_args = []
             | P.otherwise = M.catMaybes
    [ if obj == default_SubmitBatches_args{submitBatches_args_batches = submitBatches_args_batches obj} then P.Nothing else P.Just $ default_SubmitBatches_args{submitBatches_args_batches = submitBatches_args_batches obj}
    ]
from_SubmitBatches_args :: SubmitBatches_args -> T.ThriftVal
from_SubmitBatches_args record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v90 -> P.Just (1, ("batches",T.TList (T.T_STRUCT typemap_Batch) $ P.map (\_v92 -> from_Batch _v92) $ Vector.toList _v90))) $ submitBatches_args_batches record
  ]
write_SubmitBatches_args :: (T.Protocol p, T.Transport t) => p t -> SubmitBatches_args -> P.IO ()
write_SubmitBatches_args oprot record = T.writeVal oprot $ from_SubmitBatches_args record
encode_SubmitBatches_args :: (T.Protocol p, T.Transport t) => p t -> SubmitBatches_args -> LBS.ByteString
encode_SubmitBatches_args oprot record = T.serializeVal oprot $ from_SubmitBatches_args record
to_SubmitBatches_args :: T.ThriftVal -> SubmitBatches_args
to_SubmitBatches_args (T.TStruct fields) = SubmitBatches_args{
  submitBatches_args_batches = P.maybe (submitBatches_args_batches default_SubmitBatches_args) (\(_,_val94) -> (case _val94 of {T.TList _ _val95 -> (Vector.fromList $ P.map (\_v96 -> (case _v96 of {T.TStruct _val97 -> (to_Batch (T.TStruct _val97)); _ -> P.error "wrong type"})) _val95); _ -> P.error "wrong type"})) (Map.lookup (1) fields)
  }
to_SubmitBatches_args _ = P.error "not a struct"
read_SubmitBatches_args :: (T.Transport t, T.Protocol p) => p t -> P.IO SubmitBatches_args
read_SubmitBatches_args iprot = to_SubmitBatches_args <$> T.readVal iprot (T.T_STRUCT typemap_SubmitBatches_args)
decode_SubmitBatches_args :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> SubmitBatches_args
decode_SubmitBatches_args iprot bs = to_SubmitBatches_args $ T.deserializeVal iprot (T.T_STRUCT typemap_SubmitBatches_args) bs
typemap_SubmitBatches_args :: T.TypeMap
typemap_SubmitBatches_args = Map.fromList [(1,("batches",(T.T_LIST (T.T_STRUCT typemap_Batch))))]
default_SubmitBatches_args :: SubmitBatches_args
default_SubmitBatches_args = SubmitBatches_args{
  submitBatches_args_batches = Vector.empty}
data SubmitBatches_result = SubmitBatches_result  { submitBatches_result_success :: (Vector.Vector BatchSubmitResponse)
  } deriving (P.Show,P.Eq,G.Generic,TY.Typeable)
instance H.Hashable SubmitBatches_result where
  hashWithSalt salt record = salt   `H.hashWithSalt` submitBatches_result_success record  
instance QC.Arbitrary SubmitBatches_result where 
  arbitrary = M.liftM SubmitBatches_result (QC.arbitrary)
  shrink obj | obj == default_SubmitBatches_result = []
             | P.otherwise = M.catMaybes
    [ if obj == default_SubmitBatches_result{submitBatches_result_success = submitBatches_result_success obj} then P.Nothing else P.Just $ default_SubmitBatches_result{submitBatches_result_success = submitBatches_result_success obj}
    ]
from_SubmitBatches_result :: SubmitBatches_result -> T.ThriftVal
from_SubmitBatches_result record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v100 -> P.Just (0, ("success",T.TList (T.T_STRUCT typemap_BatchSubmitResponse) $ P.map (\_v102 -> from_BatchSubmitResponse _v102) $ Vector.toList _v100))) $ submitBatches_result_success record
  ]
write_SubmitBatches_result :: (T.Protocol p, T.Transport t) => p t -> SubmitBatches_result -> P.IO ()
write_SubmitBatches_result oprot record = T.writeVal oprot $ from_SubmitBatches_result record
encode_SubmitBatches_result :: (T.Protocol p, T.Transport t) => p t -> SubmitBatches_result -> LBS.ByteString
encode_SubmitBatches_result oprot record = T.serializeVal oprot $ from_SubmitBatches_result record
to_SubmitBatches_result :: T.ThriftVal -> SubmitBatches_result
to_SubmitBatches_result (T.TStruct fields) = SubmitBatches_result{
  submitBatches_result_success = P.maybe (submitBatches_result_success default_SubmitBatches_result) (\(_,_val104) -> (case _val104 of {T.TList _ _val105 -> (Vector.fromList $ P.map (\_v106 -> (case _v106 of {T.TStruct _val107 -> (to_BatchSubmitResponse (T.TStruct _val107)); _ -> P.error "wrong type"})) _val105); _ -> P.error "wrong type"})) (Map.lookup (0) fields)
  }
to_SubmitBatches_result _ = P.error "not a struct"
read_SubmitBatches_result :: (T.Transport t, T.Protocol p) => p t -> P.IO SubmitBatches_result
read_SubmitBatches_result iprot = to_SubmitBatches_result <$> T.readVal iprot (T.T_STRUCT typemap_SubmitBatches_result)
decode_SubmitBatches_result :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> SubmitBatches_result
decode_SubmitBatches_result iprot bs = to_SubmitBatches_result $ T.deserializeVal iprot (T.T_STRUCT typemap_SubmitBatches_result) bs
typemap_SubmitBatches_result :: T.TypeMap
typemap_SubmitBatches_result = Map.fromList [(0,("success",(T.T_LIST (T.T_STRUCT typemap_BatchSubmitResponse))))]
default_SubmitBatches_result :: SubmitBatches_result
default_SubmitBatches_result = SubmitBatches_result{
  submitBatches_result_success = Vector.empty}
process_submitBatches (seqid, iprot, oprot, handler) = do
  args <- read_SubmitBatches_args iprot
  (X.catch
    (do
      val <- Iface.submitBatches handler (submitBatches_args_batches args)
      let res = default_SubmitBatches_result{submitBatches_result_success = val}
      T.writeMessageBegin oprot ("submitBatches", T.M_REPLY, seqid)
      write_SubmitBatches_result oprot res
      T.writeMessageEnd oprot
      T.tFlush (T.getTransport oprot))
    ((\_ -> do
      T.writeMessageBegin oprot ("submitBatches", T.M_EXCEPTION, seqid)
      T.writeAppExn oprot (T.AppExn T.AE_UNKNOWN "")
      T.writeMessageEnd oprot
      T.tFlush (T.getTransport oprot)) :: X.SomeException -> P.IO ()))
proc_ handler (iprot,oprot) (name,typ,seqid) = case name of
  "submitBatches" -> process_submitBatches (seqid,iprot,oprot,handler)
  _ -> do
    _ <- T.readVal iprot (T.T_STRUCT Map.empty)
    T.writeMessageBegin oprot (name,T.M_EXCEPTION,seqid)
    T.writeAppExn oprot (T.AppExn T.AE_UNKNOWN_METHOD ("Unknown function " ++ LT.unpack name))
    T.writeMessageEnd oprot
    T.tFlush (T.getTransport oprot)
process handler (iprot, oprot) = do
  (name, typ, seqid) <- T.readMessageBegin iprot
  proc_ handler (iprot,oprot) (name,typ,seqid)
  T.readMessageEnd iprot
  P.return P.True
