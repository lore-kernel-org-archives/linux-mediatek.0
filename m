From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v10 10/13] drm/mediatek: add dsi ulp mode control
Date: Thu, 1 Dec 2016 09:10:40 +0800
Message-ID: <1480554640.25380.4.camel@mtksdaap41>
References: <1480070076-6196-1-git-send-email-yt.shen@mediatek.com>
 <1480070076-6196-11-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1480070076-6196-11-git-send-email-yt.shen@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YT Shen <yt.shen@mediatek.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jie Qiu <jie.qiu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, yingjoe.chen@mediatek.com, Dan Carpenter <dan.carpenter@oracle.com>, Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, shaoming chen <shaoming.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

SGksIFlUOgoKT24gRnJpLCAyMDE2LTExLTI1IGF0IDE4OjM0ICswODAwLCBZVCBTaGVuIHdyb3Rl
Ogo+IG1vZGlmeSBkc2kgZW50ZXIgdWx0cmEgbG93IHBvd2VyIG1vZGUgbWV0aG9kCj4gCgpUaGlz
IGxvb2tzIGxpa2UgYSBwb3dlci1zYXZpbmcgcGF0Y2guIEkgdGhpbmsgd2l0aG91dCB0aGlzLCBN
VDI3MDEgY291bGQKc3RpbGwgd29yayBjb3JyZWN0bHkuIFRoZSBjb21taXQgbWVzc2FnZSBpcyB0
b28gc2ltcGxlLCBwbGVhc2UgZGVzY3JpYmUKd2h5IHRoaXMgcGF0Y2ggaXMgcmVsYXRlZCB0byBN
VDI3MDEuIElmIGl0IGlzIG5vdCByZWxhdGVkIHRvIE1UMjcwMSwKbW92ZSB0aGlzIHBhdGNoIG91
dCBvZiBNVDI3MDEgc2VyaWVzIGFuZCBzZW5kIGl0IGluZGVwZW5kZW50bHkuCgpSZWdhcmRzLApD
SwoKPiBTaWduZWQtb2ZmLWJ5OiBzaGFvbWluZyBjaGVuIDxzaGFvbWluZy5jaGVuQG1lZGlhdGVr
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZVCBTaGVuIDx5dC5zaGVuQG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDQgKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYwo+IGluZGV4IGQwM2EwZjEuLjAxZGY4MjkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBAQCAtMjg5LDcgKzI4OSw3IEBAIHN0YXRpYyBpbnQg
bXRrX2RzaV9wb3dlcm9uKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gIHN0YXRpYyB2b2lkIG10a19k
c2lfY2xrX3VscF9tb2RlX2VudGVyKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gIHsKPiAgCW10a19k
c2lfbWFzayhkc2ksIERTSV9QSFlfTENDT04sIExDX0hTX1RYX0VOLCAwKTsKPiAtCW10a19kc2lf
bWFzayhkc2ksIERTSV9QSFlfTENDT04sIExDX1VMUE1fRU4sIDApOwo+ICsJbXRrX2RzaV9tYXNr
KGRzaSwgRFNJX1BIWV9MQ0NPTiwgTENfVUxQTV9FTiwgTENfVUxQTV9FTik7Cj4gIH0KPiAgCj4g
IHN0YXRpYyB2b2lkIG10a19kc2lfY2xrX3VscF9tb2RlX2xlYXZlKHN0cnVjdCBtdGtfZHNpICpk
c2kpCj4gQEAgLTMwMiw3ICszMDIsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX2Nsa191bHBfbW9k
ZV9sZWF2ZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICBzdGF0aWMgdm9pZCBtdGtfZHNpX2xhbmUw
X3VscF9tb2RlX2VudGVyKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gIHsKPiAgCW10a19kc2lfbWFz
ayhkc2ksIERTSV9QSFlfTEQwQ09OLCBMRDBfSFNfVFhfRU4sIDApOwo+IC0JbXRrX2RzaV9tYXNr
KGRzaSwgRFNJX1BIWV9MRDBDT04sIExEMF9VTFBNX0VOLCAwKTsKPiArCW10a19kc2lfbWFzayhk
c2ksIERTSV9QSFlfTEQwQ09OLCBMRDBfVUxQTV9FTiwgTEQwX1VMUE1fRU4pOwo+ICB9Cj4gIAo+
ICBzdGF0aWMgdm9pZCBtdGtfZHNpX2xhbmUwX3VscF9tb2RlX2xlYXZlKHN0cnVjdCBtdGtfZHNp
ICpkc2kpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
