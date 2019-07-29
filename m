From: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH v1 02/11] drm: drop uapi dependency from
 drm_print.h
Date: Mon, 29 Jul 2019 15:28:15 +0000
Message-ID: <67c2807f-582c-49a9-5699-a8baab3d3a0f@amd.com>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
 <156346840026.24728.936589728458336617@skylake-alporthouse-com>
 <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com> <87tvb5nh5c.fsf@intel.com>
 <20190729143555.GA16927@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190729143555.GA16927@ravnborg.org>
Content-Language: en-US
Content-ID: <84E71931003A7145BA52528F26BA144F@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime.ripard@bootlin.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

QW0gMjkuMDcuMTkgdW0gMTY6MzUgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+Pj4+IEV2ZW4gdGhl
biBpdCBzbyB1c2VsZXNzICh3aGljaCBkcm0gZHJpdmVyIGlzIHRoaXMgbWVzc2FnZSBmb3I/Pz8p
IHRoYXQgSQ0KPj4+PiB3YW50IHRvIHJlbW92ZSB0aGVtIGFsbCA6KA0KPj4+IFllYWgsIGFncmVl
LiBJIG1lYW4gaXQgaXMgbmljZSBpZiB0aGUgY29yZSBkcm0gZnVuY3Rpb25zIHVzZSBhIHByZWZp
eA0KPj4+IGZvciBkZWJ1ZyBvdXRwdXQuDQo+Pj4NCj4+PiBCdXQgSSBhY3R1YWxseSBkb24ndCBz
ZWUgdGhlIHBvaW50IGZvciBpbmRpdmlkdWFsIGRyaXZlcnMuDQo+PiBXZSBzaG91bGQgYWxsIG1p
Z3JhdGUgdG8gdGhlIHZlcnNpb25zIHdpdGggZGV2aWNlLi4uDQo+IEp1c3QgdG8gZG8gYW4geGtk
Yy5jb20vOTI3IEkgaGF2ZSBjb25zaWRlcmVkOg0KPg0KPiBkcm1fZXJyKGNvbnN0IHN0cnVjdCBk
cm1fZGV2aWNlICpkcm0sIC4uLikNCj4gZHJtX2luZm8oY29uc3Qgc3RydWN0IGRybV9kZXZpY2Ug
KmRybSwgLi4uKQ0KPg0KPiBkcm1fa21zX2Vycihjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
LCAuLi4pDQo+IGRybV9rbXNfaW5mbyhjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCAuLi4p
KQ0KDQpXaHkgbm90IGdldCBjb21wbGV0ZWx5IHJpZCBvZiB0aG9zZSBhbmQganVzdCB1c2UgZGV2
X2VyciwgZGV2X3dhcm4sIA0KcHJfZXJyLCBwcl93YXJuIGV0Yz8NCg0KSSBtZWFuIGlzIGl0IHVz
ZWZ1bCB0byBoYXZlIHRoaXMgZXh0cmEgcHJpbnRpbmcgc3Vic3lzdGVtIGluIERSTSB3aGlsZSAN
CnRoZSBzdGFuZGFyZCBMaW51eCBvbmUgYWN0dWFsbHkgZG9lcyBhIGJldHRlciBqb2I/DQoNCkNo
cmlzdGlhbi4NCg0KPg0KPiBBbmQgc28gb24gZm9yIHZibCwgcHJpbXNlLiBsZWFzZSwgc3RhdGUg
ZXRjLg0KPg0KPiBUaGVuIHdlIGNvdWxkIGZpc2ggb3V0IHJlbGV2YW50IGluZm8gZnJvbSB0aGUg
ZHJtIGRldmljZSBhbmQgcHJlc2VudA0KPiB0aGlzIG5pY2VseS4NCj4NCj4gRm9yIHRoZSBjYXNl
cyB3aGVyZSBubyBkcm1fZGV2aWNlIGlzIGF2YWlsYWJsZSB0aGUgZmFsbGJhY2sgaXM6DQo+IGRy
bV9kZXZfZXJyKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIC4uLikNCj4gZHJtX2Rldl9p
bmZvKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIC4uLikpDQo+DQo+IFdlIGNvdWxkIG1v
ZGlmeSB0aGUgZXhpc3RpbmcgVVBQRVJDQVNFIG1hY3JvcyB0byBiZSBwbGFjZWhvbGRlcnMgZm9y
DQo+IHRoZSBtb3JlIHJlYWRlciBmcmllbmRseSBsb3dlciBjYXNlcyB2YXJpYW50cyBhbmQgYmFz
ZSBpdCBhbGwgb24gdGhlDQo+IGVzdGFibGlzaGVkIGluZnJhc3RydWN0dXJlLg0KPg0KPiBCdXQg
dGhpcyBpcyBqdXN0IGlkbGUgdGhpbmtpbmcsIGFzIG9ubHkgYSBzZXJpb3VzIHBhdGNoIHdvdWxk
IHN0aXIgdGhlDQo+IHJlbGV2YW50IGRpc2N1c3Npb25zLg0KPg0KPiBGb3Igbm93IHRoaXMgaXMg
ZmFyIGZyb20gdGhlIHRvcCBvZiBteSBUT0RPIGxpc3QuDQo+DQo+DQo+IAlTYW0NCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxp
bmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
