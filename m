From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 04/11] drm/ati_pcigart: drop dependency on
 drm_os_linux.h
Date: Thu, 18 Jul 2019 20:11:35 +0200
Message-ID: <20190718181135.GA5612@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-5-sam@ravnborg.org>
 <20190718174905.GG31819@art_vandelay>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190718174905.GG31819@art_vandelay>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
List-Id: linux-mediatek@lists.infradead.org

SGkgU2Vhbi4KPiAKPiBBbnkgcGxhbnMgZm9yIHRoZSBvdGhlciB1c2VycyBvZiBEUk1fV1JJVEU8
Tj4oKT8gSXQgc2VlbXMgbGlrZSBpdCdkIGJlIHRyaXZpYWwKPiB0byBmaXggaXQgdXAgZm9yIHZp
YSBhbmQgbWdhLiBJIGRvbid0IHJlYWxseSBoYXZlIGFueSBiYWNrZ3JvdW5kIG9uCj4gZHJtX29z
X2xpbnV4LmgsIGJ1dCBpdCBkb2Vzbid0IHNlZW0gbGlrZSBpdCdkIGJlIHRoYXQgbXVjaCBtb3Jl
IGVmZm9ydCB0byBqdXN0Cj4gcmVtb3ZlIHRoZSB3aG9sZSB0aGluZy4KCkR1cmluZyB0aGUgZHJt
UC5oIHJlbW92YWwgSSBhbHNvIHRvb2sgY2FyZSBvZiBkcm1fb3NfbGludXguaCwKc28gd2hlbiB0
aGUgcGF0Y2hlcyBsYW5kIHRoZW4gdGhlcmUgd2lsbCBiZSBubyB1c2VycyBsZWZ0LgpJIGxvb2sg
Zm9yd2FyZCB0byBkZWxldGUgdGhhdCBmaWxlLgoKRm9yIHZpYSBJIG9ubHkganVzdCBwb3N0ZWQg
dGhlIHBhdGNoZXMgdG9kYXkuCkZvciBtZ2EgdGhleSBhbHJlYWR5IGxhbmRlZCBpbiBkcm0tbWlz
Yy1uZXh0LgoKSSBleHBlY3QgdGhhdCB3ZSBhZnRlciBuZXh0IG1lcmdlIHdpbmRvdyBjYW4gZGVs
ZXRlCmJvdGggZHJtX29zX2xpbnV4LmggYW5kIGRybVAuaC4KCglTYW0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
