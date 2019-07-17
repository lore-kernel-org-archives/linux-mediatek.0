From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/19] drm: drop use of drmp.h in drm-misc
Date: Wed, 17 Jul 2019 12:59:32 +0200
Message-ID: <20190717105932.GA5188@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
 <20190716065022.GA18452@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190716065022.GA18452@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>, Jerome Brunet <jbrunet@baylibre.com>, Deepak Sharma <deepak.sharma@amd.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Kevin Hilman <khilman@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Dan Carpenter <dan.carpenter@oracle.com>, Robert Tarasov <tutankhamen@chromium.org>, Emil Lundmark <lndmrk@chromium.org>, Jani Nikula <jani.nikula@intel.com>, Jyri Sarha <jsarha@ti.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.or
List-Id: linux-mediatek@lists.infradead.org

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDg6NTA6MjJBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IENvcGllZCBhbGwgcmVjaXBpZW50cyBvbiB0aGUgY292ZXIgbGV0dGVyLgo+IEFzIHRo
ZSBsaXN0IGlzIGxvbmcgdGhpcyBtYWlsIG1heSBub3QgaGl0IHRoZSBtYWlsaW5nIGxpc3RzLgo+
IAo+IAlTYW0KPiAKPiBPbiBUdWUsIEp1bCAxNiwgMjAxOSBhdCAwODo0MjowMUFNICswMjAwLCBT
YW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIHNldCByZW1vdmVzIGEgZmFyIHNoYXJl
IG9mIHRoZSByZW1haW5pbmcgdXNlcyBvZiBkcm1QLmguCj4gPiBDb21tb24gZm9yIGFsbCBwYXRj
aGVzIGFyZSB0aGF0IHRoZSByZXNwZWN0aXZlIGZpbGVzIGFyZSBtYWludGFpbmVkCj4gPiBpbiBk
cm0tbWlzYy4KPiA+IEFsbCBwYXRjaGVzIGFyZSBpbmRlcGVuZGVudC4KPiA+IAo+ID4gUGF0Y2hl
cyBoYXZlIGFsbCBiZWVuIGJ1aWxkIHRlc3RlZCB3aXRoIHZhcmlvdXMgY29uZmlncyBhbmQgdmFy
aW91cwo+ID4gYXJjaGl0ZWN0dXJlcy4KPiA+IFRoZXJlIGFyZSBsaWtlbHkgaW50cm9kdWNlZCBh
IGZldyBidWlsZCBpc3N1ZXMgdGhhdCByYW5kY29uZmlnCj4gPiBidWlsZCB3aWxsIHJldmVhbCwg
YnV0IGZvciBhbGwgY29uZmlncyBJIGhhdmUgdXNlZCB0aGUgYnVpbGQgd2FzIE9LLgo+ID4gCj4g
PiBUaGlzIHBhdGNoc2V0IGRvZXMgbm90IGNvbmNsdWRlIHRoZSBxdWVzdCB0byBraWxsIGFsbCB1
c2VzCj4gPiBvZiBkcm1QLmgsIGJ1dCBpdCBpcyBhIG1ham9yIHN0ZXAgdG93YXJkcyB0aGUgZ29h
bC4KPiA+IAo+ID4gUGxlYXNlIHJldmlldy9hY2suCj4gPiBJIHBsYW4gdG8gYXBwbHkgdGhlIHBh
dGNoZXMgdG8gZHJtLW1pc2MsIGJ1dCBmZWVsIGZyZWUKPiA+IHRvIGRvIGl0IHlvdXJzZWxmLgo+
ID4gCj4gPiBUaGVyZSB3aWxsIGJlIGNvbmZsaWN0cyB3aXRoIHRoZSBvbmdvaW5nIHdvcmsgb24g
dHRtLCBnZW0gZXRjLgo+ID4gQnV0IGxldCdzIGRlYWwgd2l0aCB0aGUgY29uZmxpY3RzIHdoZW4g
dGhleSBoaXQgdXMgLSBpdAo+ID4gaXMgc2ltcGxlIGNvbmZsaWN0cyBpbiB0aGUgbGlzdCBvZiBp
bmNsdWRlIGZpbGVzLgo+ID4gCj4gPiB2MjoKPiA+IC0gUmVtb3ZlZCBtZXJnZWQgcGF0Y2hlcwo+
ID4gLSBBZGRlZCBhY2sgZnJvbSBFbWlsIFZlbGlrb3YgdG8gdGhlIGZ1bGwgc2VyaWVzCj4gPiAt
IFJlYmFzZWQgb24gdG9wIG9mIGRybS1taXNjLW5leHQKPiA+IC0gSGFuZC1lZGl0ZWQgdGhlIGxp
c3Qgb2YgQ2M6IGFzIGdldF9tYWludGFpbmVyLnBsIGluIHNvbWUKPiA+ICAgY2FzZXMgbG9va3Mg
dXAgdG9vIG11Y2ggcGVvcGxlLCBkdWUgdG8gY3Jvc3Mga2VybmVsIGNvbW1pdHMKCkkgaGF2ZSBj
b2xsZWN0ZWQgdGhlIGFkZGl0aW9uYWwgci1icyBhbmQgYWNrcyBhbmQgcHVzaGVkIG91dCB0aGUg
ZnVsbApzZXJpZXMuIFRoYW5rcyBmb3IgZmVlZGJhY2sgdG8gZXZlcnlvbmUhCgoJU2FtCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
