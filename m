From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v1 04/11] drm/ati_pcigart: drop dependency on
 drm_os_linux.h
Date: Thu, 18 Jul 2019 14:30:50 -0400
Message-ID: <20190718183050.GA104440@art_vandelay>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-5-sam@ravnborg.org>
 <20190718174905.GG31819@art_vandelay>
 <20190718181135.GA5612@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190718181135.GA5612@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
List-Id: linux-mediatek@lists.infradead.org

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDg6MTE6MzVQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIFNlYW4uCj4gPiAKPiA+IEFueSBwbGFucyBmb3IgdGhlIG90aGVyIHVzZXJzIG9m
IERSTV9XUklURTxOPigpPyBJdCBzZWVtcyBsaWtlIGl0J2QgYmUgdHJpdmlhbAo+ID4gdG8gZml4
IGl0IHVwIGZvciB2aWEgYW5kIG1nYS4gSSBkb24ndCByZWFsbHkgaGF2ZSBhbnkgYmFja2dyb3Vu
ZCBvbgo+ID4gZHJtX29zX2xpbnV4LmgsIGJ1dCBpdCBkb2Vzbid0IHNlZW0gbGlrZSBpdCdkIGJl
IHRoYXQgbXVjaCBtb3JlIGVmZm9ydCB0byBqdXN0Cj4gPiByZW1vdmUgdGhlIHdob2xlIHRoaW5n
Lgo+IAo+IER1cmluZyB0aGUgZHJtUC5oIHJlbW92YWwgSSBhbHNvIHRvb2sgY2FyZSBvZiBkcm1f
b3NfbGludXguaCwKPiBzbyB3aGVuIHRoZSBwYXRjaGVzIGxhbmQgdGhlbiB0aGVyZSB3aWxsIGJl
IG5vIHVzZXJzIGxlZnQuCj4gSSBsb29rIGZvcndhcmQgdG8gZGVsZXRlIHRoYXQgZmlsZS4KPiAK
PiBGb3IgdmlhIEkgb25seSBqdXN0IHBvc3RlZCB0aGUgcGF0Y2hlcyB0b2RheS4KPiBGb3IgbWdh
IHRoZXkgYWxyZWFkeSBsYW5kZWQgaW4gZHJtLW1pc2MtbmV4dC4KPiAKCkF3ZXNvbWUhIEkgdGhp
bmsgSSB3YXMgbG9va2luZyBhdCBkcm0tbmV4dCBpbnN0ZWFkIG9mIC1taXNjLW5leHQsIHNvIGhh
cHB5IHRvCmhlYXIgdGhlIGZ1dHVyZSBpcyBicmlnaHQgOikKClJldmlld2VkLWJ5OiBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4KCgo+IEkgZXhwZWN0IHRoYXQgd2UgYWZ0ZXIgbmV4dCBtZXJn
ZSB3aW5kb3cgY2FuIGRlbGV0ZQo+IGJvdGggZHJtX29zX2xpbnV4LmggYW5kIGRybVAuaC4KPiAK
PiAJU2FtCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21p
dW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
