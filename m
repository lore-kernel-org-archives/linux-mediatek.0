From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
Date: Mon, 29 Jul 2019 19:50:11 +0200
Message-ID: <20190729175011.GA1753@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
 <156346840026.24728.936589728458336617@skylake-alporthouse-com>
 <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com>
 <87tvb5nh5c.fsf@intel.com> <20190729143555.GA16927@ravnborg.org>
 <67c2807f-582c-49a9-5699-a8baab3d3a0f@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <67c2807f-582c-49a9-5699-a8baab3d3a0f@amd.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Boris Brezillon <bbrezillon@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Liviu Dudau <Liviu.Dudau@arm.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>, Sean Paul <sean@poorly.run>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

SGkgQ2hyaXN0aWFuLgoKT24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDM6Mjg6MTVQTSArMDAwMCwg
S29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMjkuMDcuMTkgdW0gMTY6MzUgc2NocmllYiBT
YW0gUmF2bmJvcmc6Cj4gPj4+PiBFdmVuIHRoZW4gaXQgc28gdXNlbGVzcyAod2hpY2ggZHJtIGRy
aXZlciBpcyB0aGlzIG1lc3NhZ2UgZm9yPz8/KSB0aGF0IEkKPiA+Pj4+IHdhbnQgdG8gcmVtb3Zl
IHRoZW0gYWxsIDooCj4gPj4+IFllYWgsIGFncmVlLiBJIG1lYW4gaXQgaXMgbmljZSBpZiB0aGUg
Y29yZSBkcm0gZnVuY3Rpb25zIHVzZSBhIHByZWZpeAo+ID4+PiBmb3IgZGVidWcgb3V0cHV0Lgo+
ID4+Pgo+ID4+PiBCdXQgSSBhY3R1YWxseSBkb24ndCBzZWUgdGhlIHBvaW50IGZvciBpbmRpdmlk
dWFsIGRyaXZlcnMuCj4gPj4gV2Ugc2hvdWxkIGFsbCBtaWdyYXRlIHRvIHRoZSB2ZXJzaW9ucyB3
aXRoIGRldmljZS4uLgo+ID4gSnVzdCB0byBkbyBhbiB4a2RjLmNvbS85MjcgSSBoYXZlIGNvbnNp
ZGVyZWQ6Cj4gPgo+ID4gZHJtX2Vycihjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCAuLi4p
Cj4gPiBkcm1faW5mbyhjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCAuLi4pCj4gPgo+ID4g
ZHJtX2ttc19lcnIoY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybSwgLi4uKQo+ID4gZHJtX2tt
c19pbmZvKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIC4uLikpCj4gCj4gV2h5IG5vdCBn
ZXQgY29tcGxldGVseSByaWQgb2YgdGhvc2UgYW5kIGp1c3QgdXNlIGRldl9lcnIsIGRldl93YXJu
LCAKPiBwcl9lcnIsIHByX3dhcm4gZXRjPwo+IAo+IEkgbWVhbiBpcyBpdCB1c2VmdWwgdG8gaGF2
ZSB0aGlzIGV4dHJhIHByaW50aW5nIHN1YnN5c3RlbSBpbiBEUk0gd2hpbGUgCj4gdGhlIHN0YW5k
YXJkIExpbnV4IG9uZSBhY3R1YWxseSBkb2VzIGEgYmV0dGVyIGpvYj8KVGhlIGFkZGVkIGZ1bmN0
aW9uYWxpdHkgb2YgZHJtX3h4eF9lcnIgd291bGQgYmUgdG8ga2VlcCB0aGUgY3VycmVudApkcm0u
ZGVidWc9MHgxZiBmaWx0ZXJpbmcgb24gdGhlIGNvbW1hbmQtbGluZS4KSSBkbyBub3QgdGhpbmsg
d2UgY2FuIGRvIHRoaXMgd2l0aCB0aGUgc3RhbmRhcmQgbG9nZ2luZy4KCkFuZCB0aGVuIHdlIGNh
biBwcmVmaXggZXZlcnkgbG9nZ2luZyB3aXRoIGRyaXZlciBuYW1lIGFuZCBkZXZpY2UgbmFtZS4K
ClRoZSBpZGVhIGlzIHRvIG1ha2UgYSB0aGluIGxheWVyIG9uIHRvcCBvZiB0aGUgZXhpc3Rpbmcg
cHJfeHh4KCkgZnVuY3Rpb25zLgpTbyBub3QgYSBmdWxsIHN1YnN5c3RlbSwgb25seSBhIHdyYXBw
ZXIgb24gdG9wIG9mIHdoYXQgd2UgYWxyZWFkeSBoYXZlLgoKQW55d2F5LCBpZGxlIHRhbGsgb25s
eS4gV2UgbmVlZCBwYXRjaGVzIGFuZCBzYW1wbGUgb3V0cHV0IGlmIHdlIHNob3VsZApkaXNjdXNz
IG1vcmUuCgoJU2FtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
