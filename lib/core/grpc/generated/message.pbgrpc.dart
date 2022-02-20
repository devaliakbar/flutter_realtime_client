///
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'message.pb.dart' as $1;
export 'message.pb.dart';

class MessageServiceClient extends $grpc.Client {
  static final _$createMessageRoom =
      $grpc.ClientMethod<$1.CreateMessageRoomRequest, $1.MessageRoom>(
          '/message.MessageService/CreateMessageRoom',
          ($1.CreateMessageRoomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.MessageRoom.fromBuffer(value));
  static final _$getMessageRooms =
      $grpc.ClientMethod<$1.GetMessageRoomsRequest, $1.GetMessageRoomsResponse>(
          '/message.MessageService/GetMessageRooms',
          ($1.GetMessageRoomsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetMessageRoomsResponse.fromBuffer(value));
  static final _$getMessageRoomDetails =
      $grpc.ClientMethod<$1.GetMessageRoomDetailsRequest, $1.MessageRoom>(
          '/message.MessageService/GetMessageRoomDetails',
          ($1.GetMessageRoomDetailsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.MessageRoom.fromBuffer(value));
  static final _$sendMessage =
      $grpc.ClientMethod<$1.SendMessageRequest, $1.Message>(
          '/message.MessageService/SendMessage',
          ($1.SendMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Message.fromBuffer(value));
  static final _$getMessages =
      $grpc.ClientMethod<$1.GetMessagesRequest, $1.GetMessagesResponse>(
          '/message.MessageService/GetMessages',
          ($1.GetMessagesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetMessagesResponse.fromBuffer(value));
  static final _$listenToNewMessage = $grpc.ClientMethod<
          $1.ListenToNewMessageRequest, $1.ListenToNewMessageResponse>(
      '/message.MessageService/ListenToNewMessage',
      ($1.ListenToNewMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.ListenToNewMessageResponse.fromBuffer(value));

  MessageServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.MessageRoom> createMessageRoom(
      $1.CreateMessageRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMessageRoom, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetMessageRoomsResponse> getMessageRooms(
      $1.GetMessageRoomsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMessageRooms, request, options: options);
  }

  $grpc.ResponseFuture<$1.MessageRoom> getMessageRoomDetails(
      $1.GetMessageRoomDetailsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMessageRoomDetails, request, options: options);
  }

  $grpc.ResponseFuture<$1.Message> sendMessage($1.SendMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetMessagesResponse> getMessages(
      $1.GetMessagesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMessages, request, options: options);
  }

  $grpc.ResponseStream<$1.ListenToNewMessageResponse> listenToNewMessage(
      $1.ListenToNewMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listenToNewMessage, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class MessageServiceBase extends $grpc.Service {
  $core.String get $name => 'message.MessageService';

  MessageServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.CreateMessageRoomRequest, $1.MessageRoom>(
        'CreateMessageRoom',
        createMessageRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.CreateMessageRoomRequest.fromBuffer(value),
        ($1.MessageRoom value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetMessageRoomsRequest,
            $1.GetMessageRoomsResponse>(
        'GetMessageRooms',
        getMessageRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetMessageRoomsRequest.fromBuffer(value),
        ($1.GetMessageRoomsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.GetMessageRoomDetailsRequest, $1.MessageRoom>(
            'GetMessageRoomDetails',
            getMessageRoomDetails_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.GetMessageRoomDetailsRequest.fromBuffer(value),
            ($1.MessageRoom value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SendMessageRequest, $1.Message>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.SendMessageRequest.fromBuffer(value),
        ($1.Message value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.GetMessagesRequest, $1.GetMessagesResponse>(
            'GetMessages',
            getMessages_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.GetMessagesRequest.fromBuffer(value),
            ($1.GetMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ListenToNewMessageRequest,
            $1.ListenToNewMessageResponse>(
        'ListenToNewMessage',
        listenToNewMessage_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $1.ListenToNewMessageRequest.fromBuffer(value),
        ($1.ListenToNewMessageResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.MessageRoom> createMessageRoom_Pre($grpc.ServiceCall call,
      $async.Future<$1.CreateMessageRoomRequest> request) async {
    return createMessageRoom(call, await request);
  }

  $async.Future<$1.GetMessageRoomsResponse> getMessageRooms_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetMessageRoomsRequest> request) async {
    return getMessageRooms(call, await request);
  }

  $async.Future<$1.MessageRoom> getMessageRoomDetails_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetMessageRoomDetailsRequest> request) async {
    return getMessageRoomDetails(call, await request);
  }

  $async.Future<$1.Message> sendMessage_Pre($grpc.ServiceCall call,
      $async.Future<$1.SendMessageRequest> request) async {
    return sendMessage(call, await request);
  }

  $async.Future<$1.GetMessagesResponse> getMessages_Pre($grpc.ServiceCall call,
      $async.Future<$1.GetMessagesRequest> request) async {
    return getMessages(call, await request);
  }

  $async.Stream<$1.ListenToNewMessageResponse> listenToNewMessage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ListenToNewMessageRequest> request) async* {
    yield* listenToNewMessage(call, await request);
  }

  $async.Future<$1.MessageRoom> createMessageRoom(
      $grpc.ServiceCall call, $1.CreateMessageRoomRequest request);
  $async.Future<$1.GetMessageRoomsResponse> getMessageRooms(
      $grpc.ServiceCall call, $1.GetMessageRoomsRequest request);
  $async.Future<$1.MessageRoom> getMessageRoomDetails(
      $grpc.ServiceCall call, $1.GetMessageRoomDetailsRequest request);
  $async.Future<$1.Message> sendMessage(
      $grpc.ServiceCall call, $1.SendMessageRequest request);
  $async.Future<$1.GetMessagesResponse> getMessages(
      $grpc.ServiceCall call, $1.GetMessagesRequest request);
  $async.Stream<$1.ListenToNewMessageResponse> listenToNewMessage(
      $grpc.ServiceCall call, $1.ListenToNewMessageRequest request);
}
