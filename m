From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: hdmi: Filter interlaced resolutions
Date: Tue, 24 Jan 2017 14:12:45 +0800
Message-ID: <1485238365.30572.5.camel@mtksdaap41>
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
Cc: linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

SGksIEJpYmJ5OgoKT24gVHVlLCAyMDE3LTAxLTI0IGF0IDEzOjEwICswODAwLCBCaWJieSBIc2ll
aCB3cm90ZToKPiBDdXJyZW50IE1lZGlhdGVrIERSTSBkcml2ZXIgZG9lcyBub3Qgc3VwcG9ydCBp
bnRlcmxhY2VkIG1vZGUsIGFuZAo+IHdpbGwgaGFuZyBpZiBzdWNoIHJlc29sdXRpb24gaXMgdXNl
ZDogRmlsdGVyIHRob3NlIHRvIHByZXZlbnQKPiBrZXJuZWwgaGFuZ3MsIHVudGlsIHRoZSBEUk0g
ZHJpdmVyIGlzIGZpeGVkIHByb3Blcmx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJpYmJ5IEhzaWVo
IDxiaWJieS5oc2llaEBtZWRpYXRlay5jb20+CgpBY2tlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlh
dGVrLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwg
MiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pLmMKPiBpbmRleCAwZThjNGQ5Li5lMzM2NzhkIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiBAQCAtMTI0NCw2ICsxMjQ0LDggQEAgc3RhdGljIGlu
dCBtdGtfaGRtaV9jb25uX21vZGVfdmFsaWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm4sCj4g
IAkJCXJldHVybiBNT0RFX0JBRDsKPiAgCX0KPiAgCj4gKwlpZiAobW9kZS0+ZmxhZ3MgJiBEUk1f
TU9ERV9GTEFHX0lOVEVSTEFDRSkKPiArCQlyZXR1cm4gTU9ERV9OT19JTlRFUkxBQ0U7Cj4gIAlp
ZiAobW9kZS0+Y2xvY2sgPCAyNzAwMCkKPiAgCQlyZXR1cm4gTU9ERV9DTE9DS19MT1c7Cj4gIAlp
ZiAobW9kZS0+Y2xvY2sgPiAyOTcwMDApCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
