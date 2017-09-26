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

module Jaeger_Types where
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


data TagType = STRING|DOUBLE|BOOL|LONG|BINARY  deriving (P.Show, P.Eq, G.Generic, TY.Typeable, P.Ord, P.Bounded)
instance P.Enum TagType where
  fromEnum t = case t of
    STRING -> 0
    DOUBLE -> 1
    BOOL -> 2
    LONG -> 3
    BINARY -> 4
  toEnum t = case t of
    0 -> STRING
    1 -> DOUBLE
    2 -> BOOL
    3 -> LONG
    4 -> BINARY
    _ -> X.throw T.ThriftException
instance H.Hashable TagType where
  hashWithSalt salt = H.hashWithSalt salt P.. P.fromEnum
instance QC.Arbitrary TagType where
  arbitrary = QC.elements (P.enumFromTo P.minBound P.maxBound)
data SpanRefType = CHILD_OF|FOLLOWS_FROM  deriving (P.Show, P.Eq, G.Generic, TY.Typeable, P.Ord, P.Bounded)
instance P.Enum SpanRefType where
  fromEnum t = case t of
    CHILD_OF -> 0
    FOLLOWS_FROM -> 1
  toEnum t = case t of
    0 -> CHILD_OF
    1 -> FOLLOWS_FROM
    _ -> X.throw T.ThriftException
instance H.Hashable SpanRefType where
  hashWithSalt salt = H.hashWithSalt salt P.. P.fromEnum
instance QC.Arbitrary SpanRefType where
  arbitrary = QC.elements (P.enumFromTo P.minBound P.maxBound)
data Tag = Tag  { tag_key :: LT.Text
  , tag_vType :: TagType
  , tag_vStr :: P.Maybe LT.Text
  , tag_vDouble :: P.Maybe P.Double
  , tag_vBool :: P.Maybe P.Bool
  , tag_vLong :: P.Maybe I.Int64
  , tag_vBinary :: P.Maybe LBS.ByteString
  } deriving (P.Show,P.Eq,G.Generic,TY.Typeable)
instance H.Hashable Tag where
  hashWithSalt salt record = salt   `H.hashWithSalt` tag_key record   `H.hashWithSalt` tag_vType record   `H.hashWithSalt` tag_vStr record   `H.hashWithSalt` tag_vDouble record   `H.hashWithSalt` tag_vBool record   `H.hashWithSalt` tag_vLong record   `H.hashWithSalt` tag_vBinary record  
instance QC.Arbitrary Tag where 
  arbitrary = M.liftM Tag (QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(M.liftM P.Just QC.arbitrary)
          `M.ap`(M.liftM P.Just QC.arbitrary)
          `M.ap`(M.liftM P.Just QC.arbitrary)
          `M.ap`(M.liftM P.Just QC.arbitrary)
          `M.ap`(M.liftM P.Just QC.arbitrary)
  shrink obj | obj == default_Tag = []
             | P.otherwise = M.catMaybes
    [ if obj == default_Tag{tag_key = tag_key obj} then P.Nothing else P.Just $ default_Tag{tag_key = tag_key obj}
    , if obj == default_Tag{tag_vType = tag_vType obj} then P.Nothing else P.Just $ default_Tag{tag_vType = tag_vType obj}
    , if obj == default_Tag{tag_vStr = tag_vStr obj} then P.Nothing else P.Just $ default_Tag{tag_vStr = tag_vStr obj}
    , if obj == default_Tag{tag_vDouble = tag_vDouble obj} then P.Nothing else P.Just $ default_Tag{tag_vDouble = tag_vDouble obj}
    , if obj == default_Tag{tag_vBool = tag_vBool obj} then P.Nothing else P.Just $ default_Tag{tag_vBool = tag_vBool obj}
    , if obj == default_Tag{tag_vLong = tag_vLong obj} then P.Nothing else P.Just $ default_Tag{tag_vLong = tag_vLong obj}
    , if obj == default_Tag{tag_vBinary = tag_vBinary obj} then P.Nothing else P.Just $ default_Tag{tag_vBinary = tag_vBinary obj}
    ]
from_Tag :: Tag -> T.ThriftVal
from_Tag record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v2 -> P.Just (1, ("key",T.TString $ E.encodeUtf8 _v2))) $ tag_key record
  , (\_v2 -> P.Just (2, ("vType",T.TI32 $ P.fromIntegral $ P.fromEnum _v2))) $ tag_vType record
  , (\_v2 -> (3, ("vStr",T.TString $ E.encodeUtf8 _v2))) <$> tag_vStr record
  , (\_v2 -> (4, ("vDouble",T.TDouble _v2))) <$> tag_vDouble record
  , (\_v2 -> (5, ("vBool",T.TBool _v2))) <$> tag_vBool record
  , (\_v2 -> (6, ("vLong",T.TI64 _v2))) <$> tag_vLong record
  , (\_v2 -> (7, ("vBinary",T.TString _v2))) <$> tag_vBinary record
  ]
write_Tag :: (T.Protocol p, T.Transport t) => p t -> Tag -> P.IO ()
write_Tag oprot record = T.writeVal oprot $ from_Tag record
encode_Tag :: (T.Protocol p, T.Transport t) => p t -> Tag -> LBS.ByteString
encode_Tag oprot record = T.serializeVal oprot $ from_Tag record
to_Tag :: T.ThriftVal -> Tag
to_Tag (T.TStruct fields) = Tag{
  tag_key = P.maybe (P.error "Missing required field: key") (\(_,_val4) -> (case _val4 of {T.TString _val5 -> E.decodeUtf8 _val5; _ -> P.error "wrong type"})) (Map.lookup (1) fields),
  tag_vType = P.maybe (P.error "Missing required field: vType") (\(_,_val4) -> (case _val4 of {T.TI32 _val6 -> P.toEnum $ P.fromIntegral _val6; _ -> P.error "wrong type"})) (Map.lookup (2) fields),
  tag_vStr = P.maybe (P.Nothing) (\(_,_val4) -> P.Just (case _val4 of {T.TString _val7 -> E.decodeUtf8 _val7; _ -> P.error "wrong type"})) (Map.lookup (3) fields),
  tag_vDouble = P.maybe (P.Nothing) (\(_,_val4) -> P.Just (case _val4 of {T.TDouble _val8 -> _val8; _ -> P.error "wrong type"})) (Map.lookup (4) fields),
  tag_vBool = P.maybe (P.Nothing) (\(_,_val4) -> P.Just (case _val4 of {T.TBool _val9 -> _val9; _ -> P.error "wrong type"})) (Map.lookup (5) fields),
  tag_vLong = P.maybe (P.Nothing) (\(_,_val4) -> P.Just (case _val4 of {T.TI64 _val10 -> _val10; _ -> P.error "wrong type"})) (Map.lookup (6) fields),
  tag_vBinary = P.maybe (P.Nothing) (\(_,_val4) -> P.Just (case _val4 of {T.TString _val11 -> _val11; _ -> P.error "wrong type"})) (Map.lookup (7) fields)
  }
to_Tag _ = P.error "not a struct"
read_Tag :: (T.Transport t, T.Protocol p) => p t -> P.IO Tag
read_Tag iprot = to_Tag <$> T.readVal iprot (T.T_STRUCT typemap_Tag)
decode_Tag :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> Tag
decode_Tag iprot bs = to_Tag $ T.deserializeVal iprot (T.T_STRUCT typemap_Tag) bs
typemap_Tag :: T.TypeMap
typemap_Tag = Map.fromList [(1,("key",T.T_STRING)),(2,("vType",T.T_I32)),(3,("vStr",T.T_STRING)),(4,("vDouble",T.T_DOUBLE)),(5,("vBool",T.T_BOOL)),(6,("vLong",T.T_I64)),(7,("vBinary",T.T_STRING))]
default_Tag :: Tag
default_Tag = Tag{
  tag_key = "",
  tag_vType = (P.toEnum 0),
  tag_vStr = P.Nothing,
  tag_vDouble = P.Nothing,
  tag_vBool = P.Nothing,
  tag_vLong = P.Nothing,
  tag_vBinary = P.Nothing}
data Log = Log  { log_timestamp :: I.Int64
  , log_fields :: (Vector.Vector Tag)
  } deriving (P.Show,P.Eq,G.Generic,TY.Typeable)
instance H.Hashable Log where
  hashWithSalt salt record = salt   `H.hashWithSalt` log_timestamp record   `H.hashWithSalt` log_fields record  
instance QC.Arbitrary Log where 
  arbitrary = M.liftM Log (QC.arbitrary)
          `M.ap`(QC.arbitrary)
  shrink obj | obj == default_Log = []
             | P.otherwise = M.catMaybes
    [ if obj == default_Log{log_timestamp = log_timestamp obj} then P.Nothing else P.Just $ default_Log{log_timestamp = log_timestamp obj}
    , if obj == default_Log{log_fields = log_fields obj} then P.Nothing else P.Just $ default_Log{log_fields = log_fields obj}
    ]
from_Log :: Log -> T.ThriftVal
from_Log record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v14 -> P.Just (1, ("timestamp",T.TI64 _v14))) $ log_timestamp record
  , (\_v14 -> P.Just (2, ("fields",T.TList (T.T_STRUCT typemap_Tag) $ P.map (\_v16 -> from_Tag _v16) $ Vector.toList _v14))) $ log_fields record
  ]
write_Log :: (T.Protocol p, T.Transport t) => p t -> Log -> P.IO ()
write_Log oprot record = T.writeVal oprot $ from_Log record
encode_Log :: (T.Protocol p, T.Transport t) => p t -> Log -> LBS.ByteString
encode_Log oprot record = T.serializeVal oprot $ from_Log record
to_Log :: T.ThriftVal -> Log
to_Log (T.TStruct fields) = Log{
  log_timestamp = P.maybe (P.error "Missing required field: timestamp") (\(_,_val18) -> (case _val18 of {T.TI64 _val19 -> _val19; _ -> P.error "wrong type"})) (Map.lookup (1) fields),
  log_fields = P.maybe (P.error "Missing required field: fields") (\(_,_val18) -> (case _val18 of {T.TList _ _val20 -> (Vector.fromList $ P.map (\_v21 -> (case _v21 of {T.TStruct _val22 -> (to_Tag (T.TStruct _val22)); _ -> P.error "wrong type"})) _val20); _ -> P.error "wrong type"})) (Map.lookup (2) fields)
  }
to_Log _ = P.error "not a struct"
read_Log :: (T.Transport t, T.Protocol p) => p t -> P.IO Log
read_Log iprot = to_Log <$> T.readVal iprot (T.T_STRUCT typemap_Log)
decode_Log :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> Log
decode_Log iprot bs = to_Log $ T.deserializeVal iprot (T.T_STRUCT typemap_Log) bs
typemap_Log :: T.TypeMap
typemap_Log = Map.fromList [(1,("timestamp",T.T_I64)),(2,("fields",(T.T_LIST (T.T_STRUCT typemap_Tag))))]
default_Log :: Log
default_Log = Log{
  log_timestamp = 0,
  log_fields = Vector.empty}
data SpanRef = SpanRef  { spanRef_refType :: SpanRefType
  , spanRef_traceIdLow :: I.Int64
  , spanRef_traceIdHigh :: I.Int64
  , spanRef_spanId :: I.Int64
  } deriving (P.Show,P.Eq,G.Generic,TY.Typeable)
instance H.Hashable SpanRef where
  hashWithSalt salt record = salt   `H.hashWithSalt` spanRef_refType record   `H.hashWithSalt` spanRef_traceIdLow record   `H.hashWithSalt` spanRef_traceIdHigh record   `H.hashWithSalt` spanRef_spanId record  
instance QC.Arbitrary SpanRef where 
  arbitrary = M.liftM SpanRef (QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(QC.arbitrary)
  shrink obj | obj == default_SpanRef = []
             | P.otherwise = M.catMaybes
    [ if obj == default_SpanRef{spanRef_refType = spanRef_refType obj} then P.Nothing else P.Just $ default_SpanRef{spanRef_refType = spanRef_refType obj}
    , if obj == default_SpanRef{spanRef_traceIdLow = spanRef_traceIdLow obj} then P.Nothing else P.Just $ default_SpanRef{spanRef_traceIdLow = spanRef_traceIdLow obj}
    , if obj == default_SpanRef{spanRef_traceIdHigh = spanRef_traceIdHigh obj} then P.Nothing else P.Just $ default_SpanRef{spanRef_traceIdHigh = spanRef_traceIdHigh obj}
    , if obj == default_SpanRef{spanRef_spanId = spanRef_spanId obj} then P.Nothing else P.Just $ default_SpanRef{spanRef_spanId = spanRef_spanId obj}
    ]
from_SpanRef :: SpanRef -> T.ThriftVal
from_SpanRef record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v25 -> P.Just (1, ("refType",T.TI32 $ P.fromIntegral $ P.fromEnum _v25))) $ spanRef_refType record
  , (\_v25 -> P.Just (2, ("traceIdLow",T.TI64 _v25))) $ spanRef_traceIdLow record
  , (\_v25 -> P.Just (3, ("traceIdHigh",T.TI64 _v25))) $ spanRef_traceIdHigh record
  , (\_v25 -> P.Just (4, ("spanId",T.TI64 _v25))) $ spanRef_spanId record
  ]
write_SpanRef :: (T.Protocol p, T.Transport t) => p t -> SpanRef -> P.IO ()
write_SpanRef oprot record = T.writeVal oprot $ from_SpanRef record
encode_SpanRef :: (T.Protocol p, T.Transport t) => p t -> SpanRef -> LBS.ByteString
encode_SpanRef oprot record = T.serializeVal oprot $ from_SpanRef record
to_SpanRef :: T.ThriftVal -> SpanRef
to_SpanRef (T.TStruct fields) = SpanRef{
  spanRef_refType = P.maybe (P.error "Missing required field: refType") (\(_,_val27) -> (case _val27 of {T.TI32 _val28 -> P.toEnum $ P.fromIntegral _val28; _ -> P.error "wrong type"})) (Map.lookup (1) fields),
  spanRef_traceIdLow = P.maybe (P.error "Missing required field: traceIdLow") (\(_,_val27) -> (case _val27 of {T.TI64 _val29 -> _val29; _ -> P.error "wrong type"})) (Map.lookup (2) fields),
  spanRef_traceIdHigh = P.maybe (P.error "Missing required field: traceIdHigh") (\(_,_val27) -> (case _val27 of {T.TI64 _val30 -> _val30; _ -> P.error "wrong type"})) (Map.lookup (3) fields),
  spanRef_spanId = P.maybe (P.error "Missing required field: spanId") (\(_,_val27) -> (case _val27 of {T.TI64 _val31 -> _val31; _ -> P.error "wrong type"})) (Map.lookup (4) fields)
  }
to_SpanRef _ = P.error "not a struct"
read_SpanRef :: (T.Transport t, T.Protocol p) => p t -> P.IO SpanRef
read_SpanRef iprot = to_SpanRef <$> T.readVal iprot (T.T_STRUCT typemap_SpanRef)
decode_SpanRef :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> SpanRef
decode_SpanRef iprot bs = to_SpanRef $ T.deserializeVal iprot (T.T_STRUCT typemap_SpanRef) bs
typemap_SpanRef :: T.TypeMap
typemap_SpanRef = Map.fromList [(1,("refType",T.T_I32)),(2,("traceIdLow",T.T_I64)),(3,("traceIdHigh",T.T_I64)),(4,("spanId",T.T_I64))]
default_SpanRef :: SpanRef
default_SpanRef = SpanRef{
  spanRef_refType = (P.toEnum 0),
  spanRef_traceIdLow = 0,
  spanRef_traceIdHigh = 0,
  spanRef_spanId = 0}
data Span = Span  { span_traceIdLow :: I.Int64
  , span_traceIdHigh :: I.Int64
  , span_spanId :: I.Int64
  , span_parentSpanId :: I.Int64
  , span_operationName :: LT.Text
  , span_references :: P.Maybe (Vector.Vector SpanRef)
  , span_flags :: I.Int32
  , span_startTime :: I.Int64
  , span_duration :: I.Int64
  , span_tags :: P.Maybe (Vector.Vector Tag)
  , span_logs :: P.Maybe (Vector.Vector Log)
  } deriving (P.Show,P.Eq,G.Generic,TY.Typeable)
instance H.Hashable Span where
  hashWithSalt salt record = salt   `H.hashWithSalt` span_traceIdLow record   `H.hashWithSalt` span_traceIdHigh record   `H.hashWithSalt` span_spanId record   `H.hashWithSalt` span_parentSpanId record   `H.hashWithSalt` span_operationName record   `H.hashWithSalt` span_references record   `H.hashWithSalt` span_flags record   `H.hashWithSalt` span_startTime record   `H.hashWithSalt` span_duration record   `H.hashWithSalt` span_tags record   `H.hashWithSalt` span_logs record  
instance QC.Arbitrary Span where 
  arbitrary = M.liftM Span (QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(M.liftM P.Just QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(M.liftM P.Just QC.arbitrary)
          `M.ap`(M.liftM P.Just QC.arbitrary)
  shrink obj | obj == default_Span = []
             | P.otherwise = M.catMaybes
    [ if obj == default_Span{span_traceIdLow = span_traceIdLow obj} then P.Nothing else P.Just $ default_Span{span_traceIdLow = span_traceIdLow obj}
    , if obj == default_Span{span_traceIdHigh = span_traceIdHigh obj} then P.Nothing else P.Just $ default_Span{span_traceIdHigh = span_traceIdHigh obj}
    , if obj == default_Span{span_spanId = span_spanId obj} then P.Nothing else P.Just $ default_Span{span_spanId = span_spanId obj}
    , if obj == default_Span{span_parentSpanId = span_parentSpanId obj} then P.Nothing else P.Just $ default_Span{span_parentSpanId = span_parentSpanId obj}
    , if obj == default_Span{span_operationName = span_operationName obj} then P.Nothing else P.Just $ default_Span{span_operationName = span_operationName obj}
    , if obj == default_Span{span_references = span_references obj} then P.Nothing else P.Just $ default_Span{span_references = span_references obj}
    , if obj == default_Span{span_flags = span_flags obj} then P.Nothing else P.Just $ default_Span{span_flags = span_flags obj}
    , if obj == default_Span{span_startTime = span_startTime obj} then P.Nothing else P.Just $ default_Span{span_startTime = span_startTime obj}
    , if obj == default_Span{span_duration = span_duration obj} then P.Nothing else P.Just $ default_Span{span_duration = span_duration obj}
    , if obj == default_Span{span_tags = span_tags obj} then P.Nothing else P.Just $ default_Span{span_tags = span_tags obj}
    , if obj == default_Span{span_logs = span_logs obj} then P.Nothing else P.Just $ default_Span{span_logs = span_logs obj}
    ]
from_Span :: Span -> T.ThriftVal
from_Span record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v34 -> P.Just (1, ("traceIdLow",T.TI64 _v34))) $ span_traceIdLow record
  , (\_v34 -> P.Just (2, ("traceIdHigh",T.TI64 _v34))) $ span_traceIdHigh record
  , (\_v34 -> P.Just (3, ("spanId",T.TI64 _v34))) $ span_spanId record
  , (\_v34 -> P.Just (4, ("parentSpanId",T.TI64 _v34))) $ span_parentSpanId record
  , (\_v34 -> P.Just (5, ("operationName",T.TString $ E.encodeUtf8 _v34))) $ span_operationName record
  , (\_v34 -> (6, ("references",T.TList (T.T_STRUCT typemap_SpanRef) $ P.map (\_v36 -> from_SpanRef _v36) $ Vector.toList _v34))) <$> span_references record
  , (\_v34 -> P.Just (7, ("flags",T.TI32 _v34))) $ span_flags record
  , (\_v34 -> P.Just (8, ("startTime",T.TI64 _v34))) $ span_startTime record
  , (\_v34 -> P.Just (9, ("duration",T.TI64 _v34))) $ span_duration record
  , (\_v34 -> (10, ("tags",T.TList (T.T_STRUCT typemap_Tag) $ P.map (\_v38 -> from_Tag _v38) $ Vector.toList _v34))) <$> span_tags record
  , (\_v34 -> (11, ("logs",T.TList (T.T_STRUCT typemap_Log) $ P.map (\_v40 -> from_Log _v40) $ Vector.toList _v34))) <$> span_logs record
  ]
write_Span :: (T.Protocol p, T.Transport t) => p t -> Span -> P.IO ()
write_Span oprot record = T.writeVal oprot $ from_Span record
encode_Span :: (T.Protocol p, T.Transport t) => p t -> Span -> LBS.ByteString
encode_Span oprot record = T.serializeVal oprot $ from_Span record
to_Span :: T.ThriftVal -> Span
to_Span (T.TStruct fields) = Span{
  span_traceIdLow = P.maybe (P.error "Missing required field: traceIdLow") (\(_,_val42) -> (case _val42 of {T.TI64 _val43 -> _val43; _ -> P.error "wrong type"})) (Map.lookup (1) fields),
  span_traceIdHigh = P.maybe (P.error "Missing required field: traceIdHigh") (\(_,_val42) -> (case _val42 of {T.TI64 _val44 -> _val44; _ -> P.error "wrong type"})) (Map.lookup (2) fields),
  span_spanId = P.maybe (P.error "Missing required field: spanId") (\(_,_val42) -> (case _val42 of {T.TI64 _val45 -> _val45; _ -> P.error "wrong type"})) (Map.lookup (3) fields),
  span_parentSpanId = P.maybe (P.error "Missing required field: parentSpanId") (\(_,_val42) -> (case _val42 of {T.TI64 _val46 -> _val46; _ -> P.error "wrong type"})) (Map.lookup (4) fields),
  span_operationName = P.maybe (P.error "Missing required field: operationName") (\(_,_val42) -> (case _val42 of {T.TString _val47 -> E.decodeUtf8 _val47; _ -> P.error "wrong type"})) (Map.lookup (5) fields),
  span_references = P.maybe (P.Nothing) (\(_,_val42) -> P.Just (case _val42 of {T.TList _ _val48 -> (Vector.fromList $ P.map (\_v49 -> (case _v49 of {T.TStruct _val50 -> (to_SpanRef (T.TStruct _val50)); _ -> P.error "wrong type"})) _val48); _ -> P.error "wrong type"})) (Map.lookup (6) fields),
  span_flags = P.maybe (P.error "Missing required field: flags") (\(_,_val42) -> (case _val42 of {T.TI32 _val51 -> _val51; _ -> P.error "wrong type"})) (Map.lookup (7) fields),
  span_startTime = P.maybe (P.error "Missing required field: startTime") (\(_,_val42) -> (case _val42 of {T.TI64 _val52 -> _val52; _ -> P.error "wrong type"})) (Map.lookup (8) fields),
  span_duration = P.maybe (P.error "Missing required field: duration") (\(_,_val42) -> (case _val42 of {T.TI64 _val53 -> _val53; _ -> P.error "wrong type"})) (Map.lookup (9) fields),
  span_tags = P.maybe (P.Nothing) (\(_,_val42) -> P.Just (case _val42 of {T.TList _ _val54 -> (Vector.fromList $ P.map (\_v55 -> (case _v55 of {T.TStruct _val56 -> (to_Tag (T.TStruct _val56)); _ -> P.error "wrong type"})) _val54); _ -> P.error "wrong type"})) (Map.lookup (10) fields),
  span_logs = P.maybe (P.Nothing) (\(_,_val42) -> P.Just (case _val42 of {T.TList _ _val57 -> (Vector.fromList $ P.map (\_v58 -> (case _v58 of {T.TStruct _val59 -> (to_Log (T.TStruct _val59)); _ -> P.error "wrong type"})) _val57); _ -> P.error "wrong type"})) (Map.lookup (11) fields)
  }
to_Span _ = P.error "not a struct"
read_Span :: (T.Transport t, T.Protocol p) => p t -> P.IO Span
read_Span iprot = to_Span <$> T.readVal iprot (T.T_STRUCT typemap_Span)
decode_Span :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> Span
decode_Span iprot bs = to_Span $ T.deserializeVal iprot (T.T_STRUCT typemap_Span) bs
typemap_Span :: T.TypeMap
typemap_Span = Map.fromList [(1,("traceIdLow",T.T_I64)),(2,("traceIdHigh",T.T_I64)),(3,("spanId",T.T_I64)),(4,("parentSpanId",T.T_I64)),(5,("operationName",T.T_STRING)),(6,("references",(T.T_LIST (T.T_STRUCT typemap_SpanRef)))),(7,("flags",T.T_I32)),(8,("startTime",T.T_I64)),(9,("duration",T.T_I64)),(10,("tags",(T.T_LIST (T.T_STRUCT typemap_Tag)))),(11,("logs",(T.T_LIST (T.T_STRUCT typemap_Log))))]
default_Span :: Span
default_Span = Span{
  span_traceIdLow = 0,
  span_traceIdHigh = 0,
  span_spanId = 0,
  span_parentSpanId = 0,
  span_operationName = "",
  span_references = P.Nothing,
  span_flags = 0,
  span_startTime = 0,
  span_duration = 0,
  span_tags = P.Nothing,
  span_logs = P.Nothing}
data Process = Process  { process_serviceName :: LT.Text
  , process_tags :: P.Maybe (Vector.Vector Tag)
  } deriving (P.Show,P.Eq,G.Generic,TY.Typeable)
instance H.Hashable Process where
  hashWithSalt salt record = salt   `H.hashWithSalt` process_serviceName record   `H.hashWithSalt` process_tags record  
instance QC.Arbitrary Process where 
  arbitrary = M.liftM Process (QC.arbitrary)
          `M.ap`(M.liftM P.Just QC.arbitrary)
  shrink obj | obj == default_Process = []
             | P.otherwise = M.catMaybes
    [ if obj == default_Process{process_serviceName = process_serviceName obj} then P.Nothing else P.Just $ default_Process{process_serviceName = process_serviceName obj}
    , if obj == default_Process{process_tags = process_tags obj} then P.Nothing else P.Just $ default_Process{process_tags = process_tags obj}
    ]
from_Process :: Process -> T.ThriftVal
from_Process record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v62 -> P.Just (1, ("serviceName",T.TString $ E.encodeUtf8 _v62))) $ process_serviceName record
  , (\_v62 -> (2, ("tags",T.TList (T.T_STRUCT typemap_Tag) $ P.map (\_v64 -> from_Tag _v64) $ Vector.toList _v62))) <$> process_tags record
  ]
write_Process :: (T.Protocol p, T.Transport t) => p t -> Process -> P.IO ()
write_Process oprot record = T.writeVal oprot $ from_Process record
encode_Process :: (T.Protocol p, T.Transport t) => p t -> Process -> LBS.ByteString
encode_Process oprot record = T.serializeVal oprot $ from_Process record
to_Process :: T.ThriftVal -> Process
to_Process (T.TStruct fields) = Process{
  process_serviceName = P.maybe (P.error "Missing required field: serviceName") (\(_,_val66) -> (case _val66 of {T.TString _val67 -> E.decodeUtf8 _val67; _ -> P.error "wrong type"})) (Map.lookup (1) fields),
  process_tags = P.maybe (P.Nothing) (\(_,_val66) -> P.Just (case _val66 of {T.TList _ _val68 -> (Vector.fromList $ P.map (\_v69 -> (case _v69 of {T.TStruct _val70 -> (to_Tag (T.TStruct _val70)); _ -> P.error "wrong type"})) _val68); _ -> P.error "wrong type"})) (Map.lookup (2) fields)
  }
to_Process _ = P.error "not a struct"
read_Process :: (T.Transport t, T.Protocol p) => p t -> P.IO Process
read_Process iprot = to_Process <$> T.readVal iprot (T.T_STRUCT typemap_Process)
decode_Process :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> Process
decode_Process iprot bs = to_Process $ T.deserializeVal iprot (T.T_STRUCT typemap_Process) bs
typemap_Process :: T.TypeMap
typemap_Process = Map.fromList [(1,("serviceName",T.T_STRING)),(2,("tags",(T.T_LIST (T.T_STRUCT typemap_Tag))))]
default_Process :: Process
default_Process = Process{
  process_serviceName = "",
  process_tags = P.Nothing}
data Batch = Batch  { batch_process :: Process
  , batch_spans :: (Vector.Vector Span)
  } deriving (P.Show,P.Eq,G.Generic,TY.Typeable)
instance H.Hashable Batch where
  hashWithSalt salt record = salt   `H.hashWithSalt` batch_process record   `H.hashWithSalt` batch_spans record  
instance QC.Arbitrary Batch where 
  arbitrary = M.liftM Batch (QC.arbitrary)
          `M.ap`(QC.arbitrary)
  shrink obj | obj == default_Batch = []
             | P.otherwise = M.catMaybes
    [ if obj == default_Batch{batch_process = batch_process obj} then P.Nothing else P.Just $ default_Batch{batch_process = batch_process obj}
    , if obj == default_Batch{batch_spans = batch_spans obj} then P.Nothing else P.Just $ default_Batch{batch_spans = batch_spans obj}
    ]
from_Batch :: Batch -> T.ThriftVal
from_Batch record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v73 -> P.Just (1, ("process",from_Process _v73))) $ batch_process record
  , (\_v73 -> P.Just (2, ("spans",T.TList (T.T_STRUCT typemap_Span) $ P.map (\_v75 -> from_Span _v75) $ Vector.toList _v73))) $ batch_spans record
  ]
write_Batch :: (T.Protocol p, T.Transport t) => p t -> Batch -> P.IO ()
write_Batch oprot record = T.writeVal oprot $ from_Batch record
encode_Batch :: (T.Protocol p, T.Transport t) => p t -> Batch -> LBS.ByteString
encode_Batch oprot record = T.serializeVal oprot $ from_Batch record
to_Batch :: T.ThriftVal -> Batch
to_Batch (T.TStruct fields) = Batch{
  batch_process = P.maybe (P.error "Missing required field: process") (\(_,_val77) -> (case _val77 of {T.TStruct _val78 -> (to_Process (T.TStruct _val78)); _ -> P.error "wrong type"})) (Map.lookup (1) fields),
  batch_spans = P.maybe (P.error "Missing required field: spans") (\(_,_val77) -> (case _val77 of {T.TList _ _val79 -> (Vector.fromList $ P.map (\_v80 -> (case _v80 of {T.TStruct _val81 -> (to_Span (T.TStruct _val81)); _ -> P.error "wrong type"})) _val79); _ -> P.error "wrong type"})) (Map.lookup (2) fields)
  }
to_Batch _ = P.error "not a struct"
read_Batch :: (T.Transport t, T.Protocol p) => p t -> P.IO Batch
read_Batch iprot = to_Batch <$> T.readVal iprot (T.T_STRUCT typemap_Batch)
decode_Batch :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> Batch
decode_Batch iprot bs = to_Batch $ T.deserializeVal iprot (T.T_STRUCT typemap_Batch) bs
typemap_Batch :: T.TypeMap
typemap_Batch = Map.fromList [(1,("process",(T.T_STRUCT typemap_Process))),(2,("spans",(T.T_LIST (T.T_STRUCT typemap_Span))))]
default_Batch :: Batch
default_Batch = Batch{
  batch_process = default_Process,
  batch_spans = Vector.empty}
data BatchSubmitResponse = BatchSubmitResponse  { batchSubmitResponse_ok :: P.Bool
  } deriving (P.Show,P.Eq,G.Generic,TY.Typeable)
instance H.Hashable BatchSubmitResponse where
  hashWithSalt salt record = salt   `H.hashWithSalt` batchSubmitResponse_ok record  
instance QC.Arbitrary BatchSubmitResponse where 
  arbitrary = M.liftM BatchSubmitResponse (QC.arbitrary)
  shrink obj | obj == default_BatchSubmitResponse = []
             | P.otherwise = M.catMaybes
    [ if obj == default_BatchSubmitResponse{batchSubmitResponse_ok = batchSubmitResponse_ok obj} then P.Nothing else P.Just $ default_BatchSubmitResponse{batchSubmitResponse_ok = batchSubmitResponse_ok obj}
    ]
from_BatchSubmitResponse :: BatchSubmitResponse -> T.ThriftVal
from_BatchSubmitResponse record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v84 -> P.Just (1, ("ok",T.TBool _v84))) $ batchSubmitResponse_ok record
  ]
write_BatchSubmitResponse :: (T.Protocol p, T.Transport t) => p t -> BatchSubmitResponse -> P.IO ()
write_BatchSubmitResponse oprot record = T.writeVal oprot $ from_BatchSubmitResponse record
encode_BatchSubmitResponse :: (T.Protocol p, T.Transport t) => p t -> BatchSubmitResponse -> LBS.ByteString
encode_BatchSubmitResponse oprot record = T.serializeVal oprot $ from_BatchSubmitResponse record
to_BatchSubmitResponse :: T.ThriftVal -> BatchSubmitResponse
to_BatchSubmitResponse (T.TStruct fields) = BatchSubmitResponse{
  batchSubmitResponse_ok = P.maybe (P.error "Missing required field: ok") (\(_,_val86) -> (case _val86 of {T.TBool _val87 -> _val87; _ -> P.error "wrong type"})) (Map.lookup (1) fields)
  }
to_BatchSubmitResponse _ = P.error "not a struct"
read_BatchSubmitResponse :: (T.Transport t, T.Protocol p) => p t -> P.IO BatchSubmitResponse
read_BatchSubmitResponse iprot = to_BatchSubmitResponse <$> T.readVal iprot (T.T_STRUCT typemap_BatchSubmitResponse)
decode_BatchSubmitResponse :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> BatchSubmitResponse
decode_BatchSubmitResponse iprot bs = to_BatchSubmitResponse $ T.deserializeVal iprot (T.T_STRUCT typemap_BatchSubmitResponse) bs
typemap_BatchSubmitResponse :: T.TypeMap
typemap_BatchSubmitResponse = Map.fromList [(1,("ok",T.T_BOOL))]
default_BatchSubmitResponse :: BatchSubmitResponse
default_BatchSubmitResponse = BatchSubmitResponse{
  batchSubmitResponse_ok = P.False}