From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [v2, PATCH] net: stmmac: add support for hash table size
 128/256 in dwmac4
Date: Fri, 24 May 2019 08:24:26 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B92CDA0@DE02WEMBXB.internal.synopsys.com>
References: <1557802843-31718-1-git-send-email-biao.huang@mediatek.com>
         <1557802843-31718-2-git-send-email-biao.huang@mediatek.com>
 <1558679617.24897.43.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558679617.24897.43.camel@mhfsdcap03>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: biao huang <biao.huang@mediatek.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.comi" <jianguo.zhang@mediatek.comi>, "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogYmlhbyBodWFuZyA8Ymlhby5odWFuZ0BtZWRpYXRlay5jb20+DQpEYXRlOiBGcmksIE1h
eSAyNCwgMjAxOSBhdCAwNzozMzozNw0KDQo+IGFueSBjb21tZW50cyBhYm91dCB0aGlzIHBhdGNo
Pw0KDQpDYW4geW91IHBsZWFzZSB0ZXN0IHlvdXIgc2VyaWVzIG9uIHRvcCBvZiB0aGlzIG9uZSBb
MV0gYW5kIGxldCBtZSBrbm93IA0KdGhlIG91dHB1dCBvZiA6DQojIGV0aHRvb2wgLXQgZXRoMA0K
DQpKdXN0IHRvIG1ha2Ugc3VyZSB0aGF0IHRoaXMgcGF0Y2ggZG9lcyBub3QgaW50cm9kdWNlIGFu
eSByZWdyZXNzaW9ucy4gVGhlIA0KcmVtYWluaW5nIG9uZXMgb2YgdGhlIHNlcmllcyBsb29rIGZp
bmUgYnkgbWUhDQoNClsxXSANCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0K
DQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoN
Cg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0K
DQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoN
Cg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0K
DQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoN
Cg0KDQoNCg0KDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbmV0ZGV2L2xp
c3QvP3Nlcmllcz0xMDk2OTkNCg0KVGhhbmtzLA0KSm9zZSBNaWd1ZWwgQWJyZXUNCg==
