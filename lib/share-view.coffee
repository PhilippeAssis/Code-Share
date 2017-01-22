{$, $$$, View, TextEditorView} = require 'atom-space-pen-views'
{CompositeDisposable} = require 'atom'
buildTextEditor = require './build-text-editor'

module.exports =
class ShareView extends View
    @content: (main, shareBuffer, sendPortBuffer) ->
      shareEditor = buildTextEditor
        mini: true
        tabLength: 2
        softTabs: true
        softWrapped: false
        buffer: shareBuffer
        placeholderText: "Receiver's IP"

      sendPortEditor = buildTextEditor
        mini: true
        tabLength: 2
        softTabs: true
        softWrapped: false
        buffer: sendPortBuffer
        placeholderText: "Receiver's port"

      @div tabIndex: -1, class: 'share', =>
        @header class: 'header', =>
          @span outlet: 'descriptionLabel', class: 'header-item description', 'Please provide receiver IP and port'

        @section class: 'input-block IP', =>
          @div class: 'input-block-item input-block-item--flex editor-container', =>
            @subview 'shareEditor', new TextEditorView(editor: shareEditor)
          @div class: 'input-block-item input-block-item--flex editor-container', =>
            @subview 'sendPortEditor', new TextEditorView(editor: sendPortEditor)
          @div class: 'input-block-item', =>
            @div class: 'btn-group btn-group-port', =>
              @button outlet: 'sendButton', class: 'btn btn-next', 'Send'
            @div class: 'btn-group btn-group-port', =>
              @button outlet: 'createReceiver', class: 'btn btn-next', 'Create New Receiver'
        @section class: 'header', =>
          @span outlet: 'Port Number', class: 'header-item description', 'Your Receiving Port Number is:  '
          @span outlet: 'PortN', class: 'header-item description', ''

        @raw '<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
          <symbol id="share-icon-regex" viewBox="0 0 20 16" stroke="none" fill-rule="evenodd">
            <rect x="3" y="10" width="3" height="3" rx="1"></rect>
            <rect x="12" y="3" width="2" height="9" rx="1"></rect>
            <rect transform="translate(13.000000, 7.500000) rotate(60.000000) translate(-13.000000, -7.500000) " x="12" y="3" width="2" height="9" rx="1"></rect>
            <rect transform="translate(13.000000, 7.500000) rotate(-60.000000) translate(-13.000000, -7.500000) " x="12" y="3" width="2" height="9" rx="1"></rect>
          </symbol>

          <symbol id="share-icon-case" viewBox="0 0 20 16" stroke="none" fill-rule="evenodd">
            <path d="M10.919,13 L9.463,13 C9.29966585,13 9.16550052,12.9591671 9.0605,12.8775 C8.95549947,12.7958329 8.8796669,12.6943339 8.833,12.573 L8.077,10.508 L3.884,10.508 L3.128,12.573 C3.09066648,12.6803339 3.01716722,12.7783329 2.9075,12.867 C2.79783279,12.9556671 2.66366746,13 2.505,13 L1.042,13 L5.018,2.878 L6.943,2.878 L10.919,13 Z M4.367,9.178 L7.594,9.178 L6.362,5.811 C6.30599972,5.66166592 6.24416701,5.48550102 6.1765,5.2825 C6.108833,5.07949898 6.04233366,4.85900119 5.977,4.621 C5.91166634,4.85900119 5.84750032,5.08066564 5.7845,5.286 C5.72149969,5.49133436 5.65966697,5.67099923 5.599,5.825 L4.367,9.178 Z M18.892,13 L18.115,13 C17.9516658,13 17.8233338,12.9755002 17.73,12.9265 C17.6366662,12.8774998 17.5666669,12.7783341 17.52,12.629 L17.366,12.118 C17.1839991,12.2813341 17.0055009,12.4248327 16.8305,12.5485 C16.6554991,12.6721673 16.4746676,12.7759996 16.288,12.86 C16.1013324,12.9440004 15.903001,13.0069998 15.693,13.049 C15.4829989,13.0910002 15.2496679,13.112 14.993,13.112 C14.6896651,13.112 14.4096679,13.0711671 14.153,12.9895 C13.896332,12.9078329 13.6758342,12.7853342 13.4915,12.622 C13.3071657,12.4586658 13.1636672,12.2556679 13.061,12.013 C12.9583328,11.7703321 12.907,11.4880016 12.907,11.166 C12.907,10.895332 12.9781659,10.628168 13.1205,10.3645 C13.262834,10.100832 13.499665,9.8628344 13.831,9.6505 C14.162335,9.43816561 14.6033306,9.2620007 15.154,9.122 C15.7046694,8.9819993 16.3883292,8.90266676 17.205,8.884 L17.205,8.464 C17.205,7.98333093 17.103501,7.62750116 16.9005,7.3965 C16.697499,7.16549885 16.4023352,7.05 16.015,7.05 C15.7349986,7.05 15.5016676,7.08266634 15.315,7.148 C15.1283324,7.21333366 14.9661673,7.28683292 14.8285,7.3685 C14.6908326,7.45016707 14.5636672,7.52366634 14.447,7.589 C14.3303327,7.65433366 14.2020007,7.687 14.062,7.687 C13.9453327,7.687 13.8450004,7.65666697 13.761,7.596 C13.6769996,7.53533303 13.6093336,7.46066711 13.558,7.372 L13.243,6.819 C14.0690041,6.06299622 15.0653275,5.685 16.232,5.685 C16.6520021,5.685 17.0264983,5.75383264 17.3555,5.8915 C17.6845016,6.02916736 17.9633322,6.22049877 18.192,6.4655 C18.4206678,6.71050122 18.5944994,7.00333163 18.7135,7.344 C18.8325006,7.68466837 18.892,8.05799797 18.892,8.464 L18.892,13 Z M15.532,11.922 C15.7093342,11.922 15.8726659,11.9056668 16.022,11.873 C16.1713341,11.8403332 16.3124993,11.7913337 16.4455,11.726 C16.5785006,11.6606663 16.7068327,11.5801671 16.8305,11.4845 C16.9541673,11.3888329 17.0789993,11.2756673 17.205,11.145 L17.205,9.934 C16.7009975,9.95733345 16.279835,10.0004997 15.9415,10.0635 C15.603165,10.1265003 15.3313343,10.2069995 15.126,10.305 C14.9206656,10.4030005 14.7748337,10.5173327 14.6885,10.648 C14.6021662,10.7786673 14.559,10.9209992 14.559,11.075 C14.559,11.3783349 14.6488324,11.5953327 14.8285,11.726 C15.0081675,11.8566673 15.2426652,11.922 15.532,11.922 L15.532,11.922 Z"></path>
          </symbol>

          <symbol id="share-icon-selection" viewBox="0 0 20 16" stroke="none" fill-rule="evenodd">
            <rect opacity="0.6" x="17" y="9" width="2" height="4"></rect>
            <rect opacity="0.6" x="14" y="9" width="2" height="4"></rect>
            <rect opacity="0.6" x="1" y="3" width="2" height="4"></rect>
            <rect x="1" y="9" width="11" height="4"></rect>
            <rect x="5" y="3" width="14" height="4"></rect>
          </symbol>

          <symbol id="share-icon-word" viewBox="0 0 20 16" stroke="none" fill-rule="evenodd">
            <rect opacity="0.6" x="1" y="3" width="2" height="6"></rect>
            <rect opacity="0.6" x="17" y="3" width="2" height="6"></rect>
            <rect x="6" y="3" width="2" height="6"></rect>
            <rect x="12" y="3" width="2" height="6"></rect>
            <rect x="9" y="3" width="2" height="6"></rect>
            <path d="M4.5,13 L15.5,13 L16,13 L16,12 L15.5,12 L4.5,12 L4,12 L4,13 L4.5,13 L4.5,13 Z"></path>
            <path d="M4,10.5 L4,12.5 L4,13 L5,13 L5,12.5 L5,10.5 L5,10 L4,10 L4,10.5 L4,10.5 Z"></path>
            <path d="M15,10.5 L15,12.5 L15,13 L16,13 L16,12.5 L16,10.5 L16,10 L15,10 L15,10.5 L15,10.5 Z"></path>
          </symbol>
        </svg>'

    initialize: (@main, @shareBuffer, @sendPortBuffer) ->
      @sendButton.on 'click', (e) => @main.send(@shareBuffer.getText(), @sendPortBuffer.getText())
      @createReceiver.on 'click', (e) => @main.receive(this)

    # Returns an object that can be retrieved when package is activated
    serialize: ->

    # Tear down any state and detach
    destroy: ->
      @element.remove()

    getElement: ->
      @element