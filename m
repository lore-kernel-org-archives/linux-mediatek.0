From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 02/11] drm: drop uapi dependency from
 drm_print.h
Date: Mon, 29 Jul 2019 16:35:55 +0200
Message-ID: <20190729143555.GA16927@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
 <156346840026.24728.936589728458336617@skylake-alporthouse-com>
 <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com>
 <87tvb5nh5c.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <87tvb5nh5c.fsf@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime.ripard@bootlin.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

PiA+Pgo+ID4+IEV2ZW4gdGhlbiBpdCBzbyB1c2VsZXNzICh3aGljaCBkcm0gZHJpdmVyIGlzIHRo
aXMgbWVzc2FnZSBmb3I/Pz8pIHRoYXQgSQo+ID4+IHdhbnQgdG8gcmVtb3ZlIHRoZW0gYWxsIDoo
Cj4gPgo+ID4gWWVhaCwgYWdyZWUuIEkgbWVhbiBpdCBpcyBuaWNlIGlmIHRoZSBjb3JlIGRybSBm
dW5jdGlvbnMgdXNlIGEgcHJlZml4IAo+ID4gZm9yIGRlYnVnIG91dHB1dC4KPiA+Cj4gPiBCdXQg
SSBhY3R1YWxseSBkb24ndCBzZWUgdGhlIHBvaW50IGZvciBpbmRpdmlkdWFsIGRyaXZlcnMuCj4g
Cj4gV2Ugc2hvdWxkIGFsbCBtaWdyYXRlIHRvIHRoZSB2ZXJzaW9ucyB3aXRoIGRldmljZS4uLgoK
SnVzdCB0byBkbyBhbiB4a2RjLmNvbS85MjcgSSBoYXZlIGNvbnNpZGVyZWQ6Cgpkcm1fZXJyKGNv
bnN0IHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIC4uLikKZHJtX2luZm8oY29uc3Qgc3RydWN0IGRy
bV9kZXZpY2UgKmRybSwgLi4uKQoKZHJtX2ttc19lcnIoY29uc3Qgc3RydWN0IGRybV9kZXZpY2Ug
KmRybSwgLi4uKQpkcm1fa21zX2luZm8oY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybSwgLi4u
KSkKCkFuZCBzbyBvbiBmb3IgdmJsLCBwcmltc2UuIGxlYXNlLCBzdGF0ZSBldGMuCgpUaGVuIHdl
IGNvdWxkIGZpc2ggb3V0IHJlbGV2YW50IGluZm8gZnJvbSB0aGUgZHJtIGRldmljZSBhbmQgcHJl
c2VudAp0aGlzIG5pY2VseS4KCkZvciB0aGUgY2FzZXMgd2hlcmUgbm8gZHJtX2RldmljZSBpcyBh
dmFpbGFibGUgdGhlIGZhbGxiYWNrIGlzOgpkcm1fZGV2X2Vycihjb25zdCBzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtLCAuLi4pCmRybV9kZXZfaW5mbyhjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
LCAuLi4pKQoKV2UgY291bGQgbW9kaWZ5IHRoZSBleGlzdGluZyBVUFBFUkNBU0UgbWFjcm9zIHRv
IGJlIHBsYWNlaG9sZGVycyBmb3IKdGhlIG1vcmUgcmVhZGVyIGZyaWVuZGx5IGxvd2VyIGNhc2Vz
IHZhcmlhbnRzIGFuZCBiYXNlIGl0IGFsbCBvbiB0aGUKZXN0YWJsaXNoZWQgaW5mcmFzdHJ1Y3R1
cmUuCgpCdXQgdGhpcyBpcyBqdXN0IGlkbGUgdGhpbmtpbmcsIGFzIG9ubHkgYSBzZXJpb3VzIHBh
dGNoIHdvdWxkIHN0aXIgdGhlCnJlbGV2YW50IGRpc2N1c3Npb25zLgoKRm9yIG5vdyB0aGlzIGlz
IGZhciBmcm9tIHRoZSB0b3Agb2YgbXkgVE9ETyBsaXN0LgoKCglTYW0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJ
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
