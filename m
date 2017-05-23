From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: hdmi: Filter interlaced resolutions
Date: Tue, 23 May 2017 17:28:15 +0800
Message-ID: <1495531695.20811.19.camel@mtksdaap41>
References: <1485234604-19889-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1485234604-19889-1-git-send-email-bibby.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, Cawa Cheng =?UTF-8?Q?=28=E9=84=AD=E6=9B=84=E7=A6=A7=29?= <cawa.cheng@mediatek.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Mao Huang <littlecvr@chromium.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?= <Yingjoe.Chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

SGksIEJpYmJ5OgoKSSd2ZSBhcHBsaWVkIHRoaXMgcGF0Y2ggdG8gbXkgYnJhbmNoIG1lZGlhdGVr
LWRybS1maXhlcy00LjEyLXJjMSwKdGhhbmtzLgoKUmVnYXJkcywKQ0sKCk9uIFR1ZSwgMjAxNy0w
MS0yNCBhdCAxMzoxMCArMDgwMCwgQmliYnkgSHNpZWggd3JvdGU6Cj4gQ3VycmVudCBNZWRpYXRl
ayBEUk0gZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgaW50ZXJsYWNlZCBtb2RlLCBhbmQKPiB3aWxs
IGhhbmcgaWYgc3VjaCByZXNvbHV0aW9uIGlzIHVzZWQ6IEZpbHRlciB0aG9zZSB0byBwcmV2ZW50
Cj4ga2VybmVsIGhhbmdzLCB1bnRpbCB0aGUgRFJNIGRyaXZlciBpcyBmaXhlZCBwcm9wZXJseS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBCaWJieSBIc2llaCA8YmliYnkuaHNpZWhAbWVkaWF0ZWsuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDIgKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfaGRtaS5jCj4gaW5kZXggMGU4YzRkOS4uZTMzNjc4ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jCj4gQEAgLTEyNDQsNiArMTI0NCw4IEBAIHN0YXRpYyBpbnQgbXRrX2hk
bWlfY29ubl9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uLAo+ICAJCQlyZXR1
cm4gTU9ERV9CQUQ7Cj4gIAl9Cj4gIAo+ICsJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxB
R19JTlRFUkxBQ0UpCj4gKwkJcmV0dXJuIE1PREVfTk9fSU5URVJMQUNFOwo+ICAJaWYgKG1vZGUt
PmNsb2NrIDwgMjcwMDApCj4gIAkJcmV0dXJuIE1PREVfQ0xPQ0tfTE9XOwo+ICAJaWYgKG1vZGUt
PmNsb2NrID4gMjk3MDAwKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
