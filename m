From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 11/11] drm: drop uapi dependency from drm_file.h
Date: Fri, 19 Jul 2019 13:08:00 +0200
Message-ID: <20190719110800.GA3247@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-12-sam@ravnborg.org>
 <57ad927c-4b7f-d6e2-edda-720386190054@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <57ad927c-4b7f-d6e2-edda-720386190054@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <Liviu.Dudau@arm.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

SGkgQ2hyaXN0aWFuLgoKVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIGFuZCB2ZXJ5IHZhbGlkIHF1
ZXN0aW9uLgoKT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDY6NTY6NDdBTSArMDAwMCwgS29lbmln
LCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMTguMDcuMTkgdW0gMTg6MTUgc2NocmllYiBTYW0gUmF2
bmJvcmc6Cj4gPiBkcm1fZmlsZSB1c2VkIGRybV9tYWdpY190IGZyb20gdWFwaS9kcm0vZHJtLmgu
Cj4gPiBUaGlzIGlzIGEgc2ltcGxlIHVuc2lnbmVkIGludC4KPiA+IEp1c3Qgb3BlbmNvZGUgaXQg
YXMgc3VjaCB0byBicmVhayB0aGUgZGVwZW5kZW5jeSBmcm9tIHRoaXMgaGVhZGVyIGZpbGUKPiA+
IHRvIHVhcGkuCj4gCj4gTWhtLCB3aHkgZG8geW91IHdhbnQgdG8gcmVtb3ZlIFVBUEkgZGVwZW5k
ZW5jeSBoZXJlIGluIHRoZSBmaXJzdCBwbGFjZT8KClRoZSBpZGVhIGlzIHRvIG1ha2UgaW5jbHVk
ZS9kcm0vKiBpbmRlcGVuZGVudCBvZiB1YXBpL2RybS8qIHNvIHRoZQpoZWFkZXIgZmlsZXMgYXJl
IGxlc3MgdGFuZ2xlZCB1cCB0aHVzIGVhc2llciB0byByZWFkIGFuZCBjb21wcmVoZW5kLgoKLmMg
ZmlsZXMgdGhhdCByZXF1aXJlcyB1YXBpIGNhbiB0aGVuIGluY2x1ZGUgdGhlIHVhcGkgaGVhZGVy
cy4KCkZvciBub3cgbXkgZm9jdXMgd2FzIHNvbGVseSBvbiB1YXBpL2RybS9kcm0uaCAtIHNvIEkg
ZHVubm8gaWYgdGhpcwppcyBhbiBhY2hpZXZhYmxlIGdvYWwgZm9yIGluY2x1ZGUvZHJtLyouCgpG
b3IgdWFwaS9kcm0vKiBoZWFkZXJzIHRoaW5ncyBhcmUgbW9yZSBjbGVhci4gVGhleSBzaGFsbCBi
ZQppbmRlcGVuZGVudCBvZiBpbmNsdWRlL2RybS8qIGFzIHRoZXkgYXJlIGV4cG9ydGVkLgoKPiBJ
IG1lYW4gdGhlIHR5cGUgY2FuJ3QgY2hhbmdlIGJlY2F1c2UgaXQgaXMgVUFQSSwgYnV0IGl0IGlz
IHJhdGhlciBiYWQgCj4gZm9yIGEgZG9jdW1lbnRhdGlvbiBwb2ludCBvZiB2aWV3LgoKRm9yIGEg
d2lkZWx5IHVzZWQgdHlwZSBJIHdvdWxkIGFncmVlLgpGb3Igc3RydWN0IGF1dGgsIHRoYXQgaXMg
b255IHVzZWQgaW4gZHJtX2F1dGguYyB0aGVuIHRoZSBkb2N1bWVudGF0aW9uCmltcGFjdCBpcyBt
aW5vci4gQnV0IHlvdXIgcG9pbnQgaXMgaW5kZWVkIHZhbGlkLgooc3RydWN0IGF1dGggaGFzIG9u
ZSBmaWVsZCBvZiB0eXBlIG1hZ2ljX3QpLgoKSSB3aWxsIGF3YWl0IGZ1cnRoZXIgZmVlZGJhY2sg
YmVmb3JlIHdlIGRlY2lkZSB0byBhcHBseSB0aGlzIHBhdGNoIG9yCm5vdC4KVGhlIHBhdGNoZXMg
dGhhdCBwdXNoZXMgaW5jbHVkZSBvZiBkcm0vZHJtLmggdG8gdGhlIHJlc3BlY3RpdmUgLmMKZmls
ZXMgYXJlIGxlZ2l0IGFzIHdlIGRyb3AgdGhlIGRlcGVuZGVuY3kgb24gYW4gaW5kaXJlY3RseSBp
bmNsdWRlZApoZWFkZXIgZmlsZS4gSSB3aWxsIHByb2Nlc3MgdGhlc2UgcGF0Y2hlcy4KCglTYW0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
