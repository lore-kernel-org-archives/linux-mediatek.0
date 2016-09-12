From: YT Shen <yt.shen@mediatek.com>
Subject: Re: [PATCH v7 9/9] drm/mediatek: add support for Mediatek SoC MT2701
Date: Mon, 12 Sep 2016 18:16:53 +0800
Message-ID: <1473675413.12398.29.camel@mtksdaap41>
References: <1472815484-43821-1-git-send-email-yt.shen@mediatek.com>
 <1472815484-43821-10-git-send-email-yt.shen@mediatek.com>
 <1473226653.11736.33.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1473226653.11736.33.camel@mtksdaap41>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jie Qiu <jie.qiu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, yingjoe.chen@mediatek.com, Dan Carpenter <dan.carpenter@oracle.com>, Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, shaoming chen <shaoming.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

SGkgQ0ssCgpPbiBXZWQsIDIwMTYtMDktMDcgYXQgMTM6MzcgKzA4MDAsIENLIEh1IHdyb3RlOgo+
IEhpLCBZVDoKPiAKPiBPbiBGcmksIDIwMTYtMDktMDIgYXQgMTk6MjQgKzA4MDAsIFlUIFNoZW4g
d3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGFkZCBzdXBwb3J0IGZvciB0aGUgTWVkaWF0ZWsgTVQyNzAx
IERJU1Agc3Vic3lzdGVtLgo+ID4gVGhlcmUgaXMgb25seSBvbmUgT1ZMIGVuZ2luZSBpbiBNVDI3
MDEuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFlUIFNoZW4gPHl0LnNoZW5AbWVkaWF0ZWsuY29t
Pgo+IAo+IFtzbmlwLi4uXQo+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHBfY29tcC5jCj4gPiBpbmRleCA0YjRlNDQ5Li40NjU4MTliIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ID4gQEAgLTExMiw2ICsx
MTIsNyBAQCBzdHJ1Y3QgbXRrX2RkcF9jb21wX21hdGNoIHsKPiA+ICAKPiA+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IG10a19kZHBfY29tcF9tYXRjaCBtdGtfZGRwX21hdGNoZXNbRERQX0NPTVBPTkVO
VF9JRF9NQVhdID0gewo+ID4gIAlbRERQX0NPTVBPTkVOVF9BQUxdCT0geyBNVEtfRElTUF9BQUws
CTAsIE5VTEwgfSwKPiA+ICsJW0REUF9DT01QT05FTlRfQkxTXQk9IHsgTVRLX0RJU1BfUFdNLAkw
LCBOVUxMIH0sCj4gCj4gSSB0aGluayBCTFMgaXMgZGlmZmVyZW50IHRoYW4gUFdNLCBzbyB0aGlz
IHN0YXRlbWVudCBzaG91bGQgYmUKPiAKPiBbRERQX0NPTVBPTkVOVF9CTFNdID0geyBNVEtfRElT
UF9CTFMsIDAsIE5VTEwgfTsKVGhlIEJMUyBtb2R1bGUgYWN0dWFsbHkgaXMgYSBtdWx0aWZ1bmN0
aW9uIGRldmljZSwgb25lIG9mIHRoZW0gaXMgdGhlClBXTSBmdW5jdGlvbi4gIFdlIG9ubHkgdXBz
dHJlYW0gUFdNIGZ1bmN0aW9uIFsxXSBub3csIGFuZCBpdCBpcwphY2NlcHRlZC4gIFdoZW4gdGhl
cmUgYXJlIHJlYWwgdXNlIGNhc2UgKGdhbW1hIGZ1bmN0aW9uKSwgd2Ugd2lsbCB1cGRhdGUKdGhp
cyBwYXJ0LiAgV2hhdCBkbyB5b3UgdGhpbms/CgpSZWdhcmRzLAp5dC5zaGVuCgpbMV0gaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85MjIzMDAxLwoKPiAKPiAKPiA+ICAJW0REUF9D
T01QT05FTlRfQ09MT1IwXQk9IHsgTVRLX0RJU1BfQ09MT1IsCTAsICZkZHBfY29sb3IgfSwKPiA+
ICAJW0REUF9DT01QT05FTlRfQ09MT1IxXQk9IHsgTVRLX0RJU1BfQ09MT1IsCTEsICZkZHBfY29s
b3IgfSwKPiA+ICAJW0REUF9DT01QT05FTlRfRFBJMF0JPSB7IE1US19EUEksCQkwLCBOVUxMIH0s
Cj4gCj4gUmVnYXJkcywKPiBDSwo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
