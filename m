From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH v2 -next] net: mediatek: remove set but not used
 variable 'status'
Date: Mon, 26 Aug 2019 07:10:48 +0000
Message-ID: <20190826071048.Horde.gwS9nzceYYiYGJLnJ6-x2hz@www.vdorst.com>
References: <20190824.142158.1506174328495468705.davem@davemloft.net>
 <20190826013118.22720-1-maowenan@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190826013118.22720-1-maowenan@huawei.com>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mao Wenan <maowenan@huawei.com>, sr@denx.de
Cc: nbd@openwrt.org, nelson.chang@mediatek.com, netdev@vger.kernel.org, sean.wang@mediatek.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

TGV0J3MgYWRkIFN0ZWZhbiB0byB0aGUgY29udmVyc2F0aW9uLgpIZSBpcyB0aGUgYXV0aG9yIG9m
IHRoaXMgY29tbWl0LgoKUXVvdGluZyBNYW8gV2VuYW4gPG1hb3dlbmFuQGh1YXdlaS5jb20+OgoK
PiBGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gZHJpdmVy
cy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuYzogSW4gZnVuY3Rpb24gbXRrX2hh
bmRsZV9pcnE6Cj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuYzox
OTUxOjY6IHdhcm5pbmc6ICAKPiB2YXJpYWJsZSBzdGF0dXMgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IEZpeGVzOiAyOTZjOTEyMDc1MmIgKCJuZXQ6IGV0
aGVybmV0OiBtZWRpYXRlazogQWRkIE1UNzYyOC84OCBTb0Mgc3VwcG9ydCIpCj4gU2lnbmVkLW9m
Zi1ieTogTWFvIFdlbmFuIDxtYW93ZW5hbkBodWF3ZWkuY29tPgo+IC0tLQo+ICB2MjogY2hhbmdl
IGZvcm1hdCBvZiAnRml4ZXMnIHRhZy4KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsv
bXRrX2V0aF9zb2MuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2Mu
YyAgCj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jCj4gaW5k
ZXggOGRkYmI4ZC4uYmI3ZDYyMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9t
ZWRpYXRlay9tdGtfZXRoX3NvYy5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0
ZWsvbXRrX2V0aF9zb2MuYwo+IEBAIC0xOTQ4LDkgKzE5NDgsNyBAQCBzdGF0aWMgaXJxcmV0dXJu
X3QgbXRrX2hhbmRsZV9pcnFfdHgoaW50IGlycSwgIAo+IHZvaWQgKl9ldGgpCj4gIHN0YXRpYyBp
cnFyZXR1cm5fdCBtdGtfaGFuZGxlX2lycShpbnQgaXJxLCB2b2lkICpfZXRoKQo+ICB7Cj4gIAlz
dHJ1Y3QgbXRrX2V0aCAqZXRoID0gX2V0aDsKPiAtCXUzMiBzdGF0dXM7Cj4KPiAtCXN0YXR1cyA9
IG10a19yMzIoZXRoLCBNVEtfUERNQV9JTlRfU1RBVFVTKTsKCkhpIFN0ZWZhbiwKCllvdSBhZGRl
ZCBhbiBleHRyYSBNVEtfUERNQV9JTlRfU1RBVFVTIHJlYWQgaW4gbXRrX2hhbmRsZV9pcnEoKQpJ
cyB0aGF0IHJlYWQgbmVjZXNzYXJ5IHRvIHdvcmsgcHJvcGVybHk/CgpHcmVhdHMsCgpSZW7DqQoK
Cj4gIAlpZiAobXRrX3IzMihldGgsIE1US19QRE1BX0lOVF9NQVNLKSAmIE1US19SWF9ET05FX0lO
VCkgewo+ICAJCWlmIChtdGtfcjMyKGV0aCwgTVRLX1BETUFfSU5UX1NUQVRVUykgJiBNVEtfUlhf
RE9ORV9JTlQpCj4gIAkJCW10a19oYW5kbGVfaXJxX3J4KGlycSwgX2V0aCk7Cj4gLS0KPiAyLjcu
NAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK
