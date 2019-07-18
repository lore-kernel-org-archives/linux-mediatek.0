From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v1 02/11] drm: drop uapi dependency from
 drm_print.h
Date: Thu, 18 Jul 2019 13:40:28 -0400
Message-ID: <20190718174028.GE31819@art_vandelay>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190718161507.2047-3-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>, Stefan Agner <stefan@agner.ch>, Maxime Ripard <maxime.ripard@bootlin.com>, CK Hu <ck.hu@mediatek.com>, Thierry Reding <treding@nvidia.com>, Chunming Zhou <david1.zhou@amd.com>, Jani Nikula <jani.nikula@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Philipp Zabel <p.zabel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
List-Id: linux-mediatek@lists.infradead.org

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDY6MTQ6NThQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IGRybV9wcmludC5oIHVzZWQgRFJNX05BTUUgLSB0aHVzIGFkZGluZyBhIGRlcGVuZGVu
Y3kgZnJvbQo+IGluY2x1ZGUvZHJtL2RybV9wcmludC5oID0+IHVhcGkvZHJtL2RybS5oCj4gCj4g
SGFyZGNvZGUgdGhlIG5hbWUgImRybSIgdG8gYnJlYWsgdGhpcyBkZXBlbmRlbmN5Lgo+IFRoZSBp
ZGVhIGlzIHRoYXQgdGhlcmUgc2hhbGwgYmUgYSBtaW5pbWFsIGRlcGVuZGVuY3kKPiBiZXR3ZWVu
IGluY2x1ZGUvZHJtLyogYW5kIHVhcGkvKgoKWW91IG1pZ2h0IGFsc28gd2FudCB0byBjbGVhbiB1
cCB0aGUgb3RoZXIgdXNlcyBvZiBEUk1fTkFNRSBpbiBhcm1hZGEgYW5kIGk5MTUKd2hpbGUgeW91
J3JlIGF0IGl0LiBUaGUgZWFzaWVzdCB3YXkgdG8gc2F0aXNmeSBDaHJpcycgdXNlY2FzZSBhbmQg
cmVtb3ZlIHRoZQpkZXBlbmRlbmN5IHdvdWxkIGJlIHRvIGFkZCAjZGVmaW5lIERSTV9QUklOVF9O
QU1FICJkcm0iIGluIGRybV9wcmludC5oIGFuZCB1c2UKdGhhdC4KClNlYW4KCj4gCj4gU2lnbmVk
LW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IFN1Z2dlc3RlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhp
bWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4K
PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BnbWFpbC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
Pgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IC0tLQo+ICBpbmNsdWRlL2RybS9kcm1fcHJp
bnQuaCB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oIGIvaW5jbHVk
ZS9kcm0vZHJtX3ByaW50LmgKPiBpbmRleCBhNWQ2ZjJmM2U0MzAuLjc2MGQxYmQwZWFmMSAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2Ry
bV9wcmludC5oCj4gQEAgLTMyLDggKzMyLDYgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPgo+ICAKPiAtI2luY2x1ZGUgPGRybS9kcm0u
aD4KPiAtCj4gIC8qKgo+ICAgKiBET0M6IHByaW50Cj4gICAqCj4gQEAgLTI4Nyw3ICsyODUsNyBA
QCB2b2lkIGRybV9lcnIoY29uc3QgY2hhciAqZm9ybWF0LCAuLi4pOwo+ICAvKiBNYWNyb3MgdG8g
bWFrZSBwcmludGsgZWFzaWVyICovCj4gIAo+ICAjZGVmaW5lIF9EUk1fUFJJTlRLKG9uY2UsIGxl
dmVsLCBmbXQsIC4uLikJCQkJXAo+IC0JcHJpbnRrIyNvbmNlKEtFUk5fIyNsZXZlbCAiWyIgRFJN
X05BTUUgIl0gIiBmbXQsICMjX19WQV9BUkdTX18pCj4gKwlwcmludGsjI29uY2UoS0VSTl8jI2xl
dmVsICJbZHJtXSAiIGZtdCwgIyNfX1ZBX0FSR1NfXykKPiAgCj4gICNkZWZpbmUgRFJNX0lORk8o
Zm10LCAuLi4pCQkJCQkJXAo+ICAJX0RSTV9QUklOVEsoLCBJTkZPLCBmbXQsICMjX19WQV9BUkdT
X18pCj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwg
R29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ2Z4
