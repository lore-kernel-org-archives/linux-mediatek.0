From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: fix
 mtk_hdmi_setup_vendor_specific_infoframe mistake
Date: Mon, 22 May 2017 14:07:16 +0800
Message-ID: <1495433236.20811.13.camel@mtksdaap41>
References: <1490084823-3968-1-git-send-email-nickey.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1490084823-3968-1-git-send-email-nickey.yang@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Nickey Yang <nickey.yang@rock-chips.com>
Cc: junzhi.zhao@mediatek.com, jie.qiu@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

SGksIE5pY2tleToKClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4gSSd2ZSBhcHBsaWVkIHRoaXMg
cGF0Y2ggdG8gbXkgYnJhbmNoCm1lZGlhdGVrLWRybS1maXhlcy00LjEyLXJjMS4KClJlZ2FyZHMs
CkNLCgpPbiBUdWUsIDIwMTctMDMtMjEgYXQgMTY6MjcgKzA4MDAsIE5pY2tleSBZYW5nIHdyb3Rl
Ogo+IG10a19oZG1pX3NldHVwX3ZlbmRvcl9zcGVjaWZpY19pbmZvZnJhbWUgd2lsbCByZXR1cm4g
YmVmb3JlIGhhbmRsZQo+IG10a19oZG1pX2h3X3NlbmRfaW5mb19mcmFtZS5CZWNhdXNlIGhkbWlf
dmVuZG9yX2luZm9mcmFtZV9wYWNrCj4gcmV0dXJucyB0aGUgbnVtYmVyIG9mIGJ5dGVzIHBhY2tl
ZCBpbnRvIHRoZSBiaW5hcnkgYnVmZmVyIG9yCj4gYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZh
aWx1cmUuCj4gU28gY29ycmVjdCBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaWNrZXkgWWFuZyA8
bmlja2V5LnlhbmdAcm9jay1jaGlwcy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IGluZGV4
IGMyNjI1MTIuLmI0M2FhMjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+
IEBAIC0xMDYyLDcgKzEwNjIsNyBAQCBzdGF0aWMgaW50IG10a19oZG1pX3NldHVwX3ZlbmRvcl9z
cGVjaWZpY19pbmZvZnJhbWUoc3RydWN0IG10a19oZG1pICpoZG1pLAo+ICAJfQo+ICAKPiAgCWVy
ciA9IGhkbWlfdmVuZG9yX2luZm9mcmFtZV9wYWNrKCZmcmFtZSwgYnVmZmVyLCBzaXplb2YoYnVm
ZmVyKSk7Cj4gLQlpZiAoZXJyKSB7Cj4gKwlpZiAoZXJyIDwgMCkgewo+ICAJCWRldl9lcnIoaGRt
aS0+ZGV2LCAiRmFpbGVkIHRvIHBhY2sgdmVuZG9yIGluZm9mcmFtZTogJXpkXG4iLAo+ICAJCQll
cnIpOwo+ICAJCXJldHVybiBlcnI7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
