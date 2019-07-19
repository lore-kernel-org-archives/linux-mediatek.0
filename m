From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v1 10/11] drm/mediatek: direct include of
 drm.h in mtk_drm_gem.c
Date: Fri, 19 Jul 2019 09:34:49 +0800
Message-ID: <1563500089.5889.0.camel@mtksdaap41>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-11-sam@ravnborg.org>
 <1563499801.3884.0.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <1563499801.3884.0.camel@mtksdaap41>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>, Stefan Agner <stefan@agner.ch>, Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>, Chunming Zhou <david1.zhou@amd.com>, Jani Nikula <jani.nikula@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Philipp Zabel <p.zabel@pengutronix.de>, Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
List-Id: linux-mediatek@lists.infradead.org

SGksIFNhbToKCllvdSBjb3VsZCBhcHBseSB0aGlzIHBhdGNoIGludG8gZHJtLW1pc2MtbmV4dCBi
eSB5b3Vyc2VsZiwgdGhhbmtzLgoKUmVnYXJkcywKQ0sKCk9uIEZyaSwgMjAxOS0wNy0xOSBhdCAw
OTozMCArMDgwMCwgQ0sgSHUgd3JvdGU6Cj4gT24gVGh1LCAyMDE5LTA3LTE4IGF0IDE4OjE1ICsw
MjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiBEbyBub3QgcmVseSBvbiBpbmNsdWRpbmcgZHJt
LmggZnJvbSBkcm1fZmlsZS5oLAo+ID4gYXMgdGhlIGluY2x1ZGUgaW4gZHJtX2ZpbGUuaCB3aWxs
IGJlIGRyb3BwZWQuCj4gPiAKPiAKPiBBY2tlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
PiA+IENjOiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4gQ2M6IFBoaWxpcHAgWmFiZWwg
PHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gPiBDYzogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhp
YXMuYmdnQGdtYWlsLmNvbT4KPiA+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiA+IENjOiBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiAtLS0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyB8IDEgKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9nZW0uYwo+ID4gaW5kZXggOTQzNGY4OGM2MzQxLi5jYTY3MmYxZDE0MGQgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiA+IEBAIC01LDYg
KzUsNyBAQAo+ID4gIAo+ID4gICNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLmg+Cj4gPiAgCj4gPiAr
I2luY2x1ZGUgPGRybS9kcm0uaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4KPiA+
ICAjaW5jbHVkZSA8ZHJtL2RybV9nZW0uaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcmltZS5o
Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCklu
dGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeA==
