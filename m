From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: hdmi: Filter interlaced resolutions
Date: Wed, 24 May 2017 17:20:45 +0800
Message-ID: <1495617645.15919.6.camel@mtksdaap41>
References: <1485234604-19889-1-git-send-email-bibby.hsieh@mediatek.com>
 <1495531695.20811.19.camel@mtksdaap41>
 <20170523131243.5bjz5n4uv73r2l7j@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170523131243.5bjz5n4uv73r2l7j@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>, Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, Cawa Cheng =?UTF-8?Q?=28=E9=84=AD=E6=9B=84=E7=A6=A7=29?= <cawa.cheng@mediatek.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Mao Huang <littlecvr@chromium.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?= <Yingjoe.Chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

T24gVHVlLCAyMDE3LTA1LTIzIGF0IDE1OjEyICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
IE9uIFR1ZSwgTWF5IDIzLCAyMDE3IGF0IDA1OjI4OjE1UE0gKzA4MDAsIENLIEh1IHdyb3RlOgo+
ID4gSGksIEJpYmJ5Ogo+ID4gCj4gPiBJJ3ZlIGFwcGxpZWQgdGhpcyBwYXRjaCB0byBteSBicmFu
Y2ggbWVkaWF0ZWstZHJtLWZpeGVzLTQuMTItcmMxLAo+ID4gdGhhbmtzLgo+ID4gCj4gPiBSZWdh
cmRzLAo+ID4gQ0sKPiA+IAo+ID4gT24gVHVlLCAyMDE3LTAxLTI0IGF0IDEzOjEwICswODAwLCBC
aWJieSBIc2llaCB3cm90ZToKPiA+ID4gQ3VycmVudCBNZWRpYXRlayBEUk0gZHJpdmVyIGRvZXMg
bm90IHN1cHBvcnQgaW50ZXJsYWNlZCBtb2RlLCBhbmQKPiA+ID4gd2lsbCBoYW5nIGlmIHN1Y2gg
cmVzb2x1dGlvbiBpcyB1c2VkOiBGaWx0ZXIgdGhvc2UgdG8gcHJldmVudAo+ID4gPiBrZXJuZWwg
aGFuZ3MsIHVudGlsIHRoZSBEUk0gZHJpdmVyIGlzIGZpeGVkIHByb3Blcmx5Lgo+ID4gPiAKPiA+
ID4gU2lnbmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4K
PiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDIg
KysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gPiA+IGluZGV4IDBlOGM0ZDkuLmUzMzY3OGQg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gPiA+IEBAIC0x
MjQ0LDYgKzEyNDQsOCBAQCBzdGF0aWMgaW50IG10a19oZG1pX2Nvbm5fbW9kZV92YWxpZChzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubiwKPiA+ID4gIAkJCXJldHVybiBNT0RFX0JBRDsKPiA+ID4g
IAl9Cj4gPiA+ICAKPiA+ID4gKwlpZiAobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX0lOVEVS
TEFDRSkKPiA+ID4gKwkJcmV0dXJuIE1PREVfTk9fSU5URVJMQUNFOwo+ID4gPiAgCWlmIChtb2Rl
LT5jbG9jayA8IDI3MDAwKQo+ID4gPiAgCQlyZXR1cm4gTU9ERV9DTE9DS19MT1c7Cj4gPiA+ICAJ
aWYgKG1vZGUtPmNsb2NrID4gMjk3MDAwKQo+IAo+IFlvdSBwcm9iYWJseSB3YW50IHRvIGNoZWNr
IG91dCBKb3NlJ3MgbW9kZV92YWxpZCB3b3JrLCBzaW5jZSBvbmx5Cj4gZmlsdGVyaW5nIGluIHRo
ZSBjb25uZWN0b3IncyAtPm1vZGVfdmFsaWQgY2FsbGJhY2sgaXNuJ3QgZW5vdWdoLiBZb3UgYWxz
bwo+IG5lZWQgdG8gZmlsdGVyIGluIC0+bW9kZV9maXh1cCAob3Igc29tZSBvdGhlciBwbGFjZSBj
YWxsZWQgYXQgYXRvbWljX2NoZWNrCj4gdGltZSkuCj4gLURhbmllbAoKSGksIERhbmllbDoKClll
cywgSSBzdGlsbCBuZWVkIHRvIGZpbHRlciBpbiAtPm1vZGVfZml4dXAuCgpIaSwgQmliYnk6CgpC
ZWNhdXNlIEpvc2UncyB3b3JrIHBsYW4gdG8gdXNlIG1vZGVfdmFsaWQgdG8gcmVwbGFjZSBtb2Rl
X2ZpeHVwLCBzbwppdCdzIGJldHRlciB0byByZWZpbmUgdGhpcyBwYXRjaCBhZnRlciBKb3NlJ3Mg
d29yayBpcyBkb25lLiBBbmQgSSB3b3VsZApub3cgcmVtb3ZlIHRoaXMgcGF0Y2ggZnJvbSBteSBi
cmFuY2guCgpSZWdhcmRzLApDSwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
