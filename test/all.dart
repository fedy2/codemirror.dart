// Copyright (c) 2014, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library codemirror.tests;

import 'dart:html';

import 'package:codemirror/codemirror.dart';
import 'package:unittest/html_config.dart';
import 'package:unittest/unittest.dart';

// TODO: get the tests running in content_shell

// TODO: test double click

// TODO: test mode types

// TODO: document mutation

final Element editorHost = new DivElement();

void main() {
  useHtmlConfiguration();

  document.body.children.add(editorHost);

  group('simple', _simpleTests);
  group('CodeMirror', _codeMirrorTests);
}

_simpleTests() {
  test('create works', () {
    CodeMirror editor = new CodeMirror.fromElement(editorHost);
    expect(editor, isNotNull);
    expect(editorHost.parent, isNotNull);
    editor.dispose();
    editorHost.children.clear();
  });
}

_codeMirrorTests() {
  CodeMirror editor;

  setUp(() {
    editor = new CodeMirror.fromElement(editorHost);
  });

  tearDown(() {
    editor.dispose();
    editorHost.children.clear();
  });

  test('simple', () {
    expect(editor, isNotNull);
    expect(editorHost.parent, isNotNull);
  });

  test('set / get', () {
    Doc doc = editor.getDoc();
    expect(doc.getValue(), '');
    doc.setValue('foo bar');
    expect(doc.getValue(), 'foo bar');
  });

  test('getOption / setOption', () {
    expect(editor.getOption('lineWrapping'), false);
    editor.setOption('lineWrapping', true);
    expect(editor.getOption('lineWrapping'), true);
  });
}
