From: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH v1 11/11] drm: drop uapi dependency from drm_file.h
Date: Fri, 19 Jul 2019 06:56:47 +0000
Message-ID: <57ad927c-4b7f-d6e2-edda-720386190054@amd.com>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-12-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190718161507.2047-12-sam@ravnborg.org>
Content-Language: en-US
Content-ID: <FB76C18FB64AFB478EFAFE7250E3D9A2@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <Liviu.Dudau@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

QW0gMTguMDcuMTkgdW0gMTg6MTUgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IGRybV9maWxlIHVz
ZWQgZHJtX21hZ2ljX3QgZnJvbSB1YXBpL2RybS9kcm0uaC4NCj4gVGhpcyBpcyBhIHNpbXBsZSB1
bnNpZ25lZCBpbnQuDQo+IEp1c3Qgb3BlbmNvZGUgaXQgYXMgc3VjaCB0byBicmVhayB0aGUgZGVw
ZW5kZW5jeSBmcm9tIHRoaXMgaGVhZGVyIGZpbGUNCj4gdG8gdWFwaS4NCg0KTWhtLCB3aHkgZG8g
eW91IHdhbnQgdG8gcmVtb3ZlIFVBUEkgZGVwZW5kZW5jeSBoZXJlIGluIHRoZSBmaXJzdCBwbGFj
ZT8NCg0KSSBtZWFuIHRoZSB0eXBlIGNhbid0IGNoYW5nZSBiZWNhdXNlIGl0IGlzIFVBUEksIGJ1
dCBpdCBpcyByYXRoZXIgYmFkIA0KZm9yIGEgZG9jdW1lbnRhdGlvbiBwb2ludCBvZiB2aWV3Lg0K
DQpDaHJpc3RpYW4uDQoNCj4NCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPg0KPiBTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+DQo+IENjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4NCj4gQ2M6
IExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBhcm0uY29tPg0KPiBDYzogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1l
LnJpcGFyZEBib290bGluLmNvbT4NCj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gQ2M6IEphbmkgTmlr
dWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0Bhbmhv
bHQubmV0Pg0KPiAtLS0NCj4gICBpbmNsdWRlL2RybS9kcm1fZmlsZS5oIHwgNCArLS0tDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaCBiL2luY2x1ZGUvZHJtL2RybV9maWxlLmgN
Cj4gaW5kZXggNjdhZjYwYmI1MjdhLi4wNDZjZDFiZjkxZWIgMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9maWxlLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaA0KPiBAQCAt
MzQsOCArMzQsNiBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9jb21wbGV0aW9uLmg+DQo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L2lkci5oPg0KPiAgIA0KPiAtI2luY2x1ZGUgPHVhcGkvZHJtL2RybS5oPg0K
PiAtDQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbWUuaD4NCj4gICANCj4gICBzdHJ1Y3QgZG1h
X2ZlbmNlOw0KPiBAQCAtMjI3LDcgKzIyNSw3IEBAIHN0cnVjdCBkcm1fZmlsZSB7DQo+ICAgCXN0
cnVjdCBwaWQgKnBpZDsNCj4gICANCj4gICAJLyoqIEBtYWdpYzogQXV0aGVudGljYXRpb24gbWFn
aWMsIHNlZSBAYXV0aGVudGljYXRlZC4gKi8NCj4gLQlkcm1fbWFnaWNfdCBtYWdpYzsNCj4gKwl1
bnNpZ25lZCBpbnQgbWFnaWM7DQo+ICAgDQo+ICAgCS8qKg0KPiAgIAkgKiBAbGhlYWQ6DQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
