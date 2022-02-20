///
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use messageRoomDescriptor instead')
const MessageRoom$json = const {
  '1': 'MessageRoom',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'room_name', '3': 2, '4': 1, '5': 9, '10': 'roomName'},
    const {'1': 'is_one_to_one', '3': 3, '4': 1, '5': 8, '10': 'isOneToOne'},
    const {'1': 'members', '3': 4, '4': 3, '5': 11, '6': '.user.User', '10': 'members'},
  ],
};

/// Descriptor for `MessageRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageRoomDescriptor = $convert.base64Decode('CgtNZXNzYWdlUm9vbRIOCgJpZBgBIAEoCVICaWQSGwoJcm9vbV9uYW1lGAIgASgJUghyb29tTmFtZRIhCg1pc19vbmVfdG9fb25lGAMgASgIUgppc09uZVRvT25lEiQKB21lbWJlcnMYBCADKAsyCi51c2VyLlVzZXJSB21lbWJlcnM=');
@$core.Deprecated('Use createMessageRoomRequestDescriptor instead')
const CreateMessageRoomRequest$json = const {
  '1': 'CreateMessageRoomRequest',
  '2': const [
    const {'1': 'room_name', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    const {'1': 'is_one_to_one', '3': 2, '4': 1, '5': 8, '10': 'isOneToOne'},
    const {'1': 'members', '3': 3, '4': 3, '5': 9, '10': 'members'},
  ],
};

/// Descriptor for `CreateMessageRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMessageRoomRequestDescriptor = $convert.base64Decode('ChhDcmVhdGVNZXNzYWdlUm9vbVJlcXVlc3QSGwoJcm9vbV9uYW1lGAEgASgJUghyb29tTmFtZRIhCg1pc19vbmVfdG9fb25lGAIgASgIUgppc09uZVRvT25lEhgKB21lbWJlcnMYAyADKAlSB21lbWJlcnM=');
@$core.Deprecated('Use getMessageRoomsRequestDescriptor instead')
const GetMessageRoomsRequest$json = const {
  '1': 'GetMessageRoomsRequest',
  '2': const [
    const {'1': 'search', '3': 1, '4': 1, '5': 9, '10': 'search'},
    const {'1': 'skip', '3': 2, '4': 1, '5': 5, '10': 'skip'},
    const {'1': 'take', '3': 3, '4': 1, '5': 5, '10': 'take'},
    const {'1': 'get_group_members', '3': 4, '4': 1, '5': 8, '10': 'getGroupMembers'},
  ],
};

/// Descriptor for `GetMessageRoomsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessageRoomsRequestDescriptor = $convert.base64Decode('ChZHZXRNZXNzYWdlUm9vbXNSZXF1ZXN0EhYKBnNlYXJjaBgBIAEoCVIGc2VhcmNoEhIKBHNraXAYAiABKAVSBHNraXASEgoEdGFrZRgDIAEoBVIEdGFrZRIqChFnZXRfZ3JvdXBfbWVtYmVycxgEIAEoCFIPZ2V0R3JvdXBNZW1iZXJz');
@$core.Deprecated('Use getMessageRoomsResponseDescriptor instead')
const GetMessageRoomsResponse$json = const {
  '1': 'GetMessageRoomsResponse',
  '2': const [
    const {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.message.MessageRoom', '10': 'rooms'},
  ],
};

/// Descriptor for `GetMessageRoomsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessageRoomsResponseDescriptor = $convert.base64Decode('ChdHZXRNZXNzYWdlUm9vbXNSZXNwb25zZRIqCgVyb29tcxgBIAMoCzIULm1lc3NhZ2UuTWVzc2FnZVJvb21SBXJvb21z');
@$core.Deprecated('Use getMessageRoomDetailsRequestDescriptor instead')
const GetMessageRoomDetailsRequest$json = const {
  '1': 'GetMessageRoomDetailsRequest',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `GetMessageRoomDetailsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessageRoomDetailsRequestDescriptor = $convert.base64Decode('ChxHZXRNZXNzYWdlUm9vbURldGFpbHNSZXF1ZXN0EhcKB3Jvb21faWQYASABKAlSBnJvb21JZA==');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'sender', '3': 3, '4': 1, '5': 11, '6': '.user.User', '10': 'sender'},
    const {'1': 'time', '3': 4, '4': 1, '5': 3, '10': 'time'},
    const {'1': 'body', '3': 5, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEg4KAmlkGAEgASgJUgJpZBIXCgdyb29tX2lkGAIgASgJUgZyb29tSWQSIgoGc2VuZGVyGAMgASgLMgoudXNlci5Vc2VyUgZzZW5kZXISEgoEdGltZRgEIAEoA1IEdGltZRISCgRib2R5GAUgASgJUgRib2R5');
@$core.Deprecated('Use sendMessageRequestDescriptor instead')
const SendMessageRequest$json = const {
  '1': 'SendMessageRequest',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'body', '3': 2, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `SendMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageRequestDescriptor = $convert.base64Decode('ChJTZW5kTWVzc2FnZVJlcXVlc3QSFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEhIKBGJvZHkYAiABKAlSBGJvZHk=');
@$core.Deprecated('Use getMessagesRequestDescriptor instead')
const GetMessagesRequest$json = const {
  '1': 'GetMessagesRequest',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'skip', '3': 2, '4': 1, '5': 5, '10': 'skip'},
    const {'1': 'take', '3': 3, '4': 1, '5': 5, '10': 'take'},
  ],
};

/// Descriptor for `GetMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesRequestDescriptor = $convert.base64Decode('ChJHZXRNZXNzYWdlc1JlcXVlc3QSFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEhIKBHNraXAYAiABKAVSBHNraXASEgoEdGFrZRgDIAEoBVIEdGFrZQ==');
@$core.Deprecated('Use getMessagesResponseDescriptor instead')
const GetMessagesResponse$json = const {
  '1': 'GetMessagesResponse',
  '2': const [
    const {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.message.Message', '10': 'messages'},
  ],
};

/// Descriptor for `GetMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesResponseDescriptor = $convert.base64Decode('ChNHZXRNZXNzYWdlc1Jlc3BvbnNlEiwKCG1lc3NhZ2VzGAEgAygLMhAubWVzc2FnZS5NZXNzYWdlUghtZXNzYWdlcw==');
@$core.Deprecated('Use listenToNewMessageRequestDescriptor instead')
const ListenToNewMessageRequest$json = const {
  '1': 'ListenToNewMessageRequest',
};

/// Descriptor for `ListenToNewMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listenToNewMessageRequestDescriptor = $convert.base64Decode('ChlMaXN0ZW5Ub05ld01lc3NhZ2VSZXF1ZXN0');
@$core.Deprecated('Use listenToNewMessageResponseDescriptor instead')
const ListenToNewMessageResponse$json = const {
  '1': 'ListenToNewMessageResponse',
  '2': const [
    const {'1': 'newMessage', '3': 1, '4': 1, '5': 11, '6': '.message.Message', '10': 'newMessage'},
  ],
};

/// Descriptor for `ListenToNewMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listenToNewMessageResponseDescriptor = $convert.base64Decode('ChpMaXN0ZW5Ub05ld01lc3NhZ2VSZXNwb25zZRIwCgpuZXdNZXNzYWdlGAEgASgLMhAubWVzc2FnZS5NZXNzYWdlUgpuZXdNZXNzYWdl');
