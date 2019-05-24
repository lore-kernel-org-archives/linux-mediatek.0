From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [v2, PATCH] net: stmmac: add support for hash table size
 128/256 in dwmac4
Date: Fri, 24 May 2019 09:24:31 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B92D26F@DE02WEMBXB.internal.synopsys.com>
References: <1557802843-31718-1-git-send-email-biao.huang@mediatek.com>
         <1557802843-31718-2-git-send-email-biao.huang@mediatek.com>
         <1558679617.24897.43.camel@mhfsdcap03>
         <78EB27739596EE489E55E81C33FEC33A0B92CDA0@DE02WEMBXB.internal.synopsys.com>
 <1558686704.24897.45.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558686704.24897.45.camel@mhfsdcap03>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: biao huang <biao.huang@mediatek.com>, Jose Abreu <Jose.Abreu@synopsys.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.comi" <jianguo.zhang@mediatek.comi>, "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogYmlhbyBodWFuZyA8Ymlhby5odWFuZ0BtZWRpYXRlay5jb20+DQpEYXRlOiBGcmksIE1h
eSAyNCwgMjAxOSBhdCAwOTozMTo0NA0KDQo+IE9uIEZyaSwgMjAxOS0wNS0yNCBhdCAwODoyNCAr
MDAwMCwgSm9zZSBBYnJldSB3cm90ZToNCj4gPiBGcm9tOiBiaWFvIGh1YW5nIDxiaWFvLmh1YW5n
QG1lZGlhdGVrLmNvbT4NCj4gPiBEYXRlOiBGcmksIE1heSAyNCwgMjAxOSBhdCAwNzozMzozNw0K
PiA+IA0KPiA+ID4gYW55IGNvbW1lbnRzIGFib3V0IHRoaXMgcGF0Y2g/DQo+ID4gDQo+ID4gQ2Fu
IHlvdSBwbGVhc2UgdGVzdCB5b3VyIHNlcmllcyBvbiB0b3Agb2YgdGhpcyBvbmUgWzFdIGFuZCBs
ZXQgbWUga25vdyANCj4gPiB0aGUgb3V0cHV0IG9mIDoNCj4gPiAjIGV0aHRvb2wgLXQgZXRoMA0K
PiAiZXRodG9sIC1UIGV0aDAiPyBUaGlzIHBhdGNoIG9ubHkgYWZmZWN0IGhhc2ggdGFibGUgZmls
dGVyLCBzZWVtcyBubw0KPiByZWxhdGlvbiB0byB0aW1lc3RhbXAuDQo+ID4gDQo+ID4gSnVzdCB0
byBtYWtlIHN1cmUgdGhhdCB0aGlzIHBhdGNoIGRvZXMgbm90IGludHJvZHVjZSBhbnkgcmVncmVz
c2lvbnMuIFRoZSANCj4gPiByZW1haW5pbmcgb25lcyBvZiB0aGUgc2VyaWVzIGxvb2sgZmluZSBi
eSBtZSENCj4gPiANCj4gPiBbMV0gDQo+IHdoaWNoIG9uZT8gRGlkIEkgbWlzcyBhbnl0aGluZyBo
ZXJlPw0KDQpTb3JyeSwgbXkgbWFpbCBjbGllbnQgdHJpZWQgdG8gd3JhcCB0aGUgbG9uZyBsaW5r
IGFuZCBlbmRlZCB1cCBpbiBhIA0KbG9vb29uZyBlbWFpbC4NCg0KWzFdIGh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9uZXRkZXYvbGlzdC8/c2VyaWVzPTEwOTY5OQ0KDQpUaGFu
a3MsDQpKb3NlIE1pZ3VlbCBBYnJldQ0K
