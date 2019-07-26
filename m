From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v7 2/4] drm/panel: set display info in panel
 attach
Date: Fri, 26 Jul 2019 15:15:06 +0200
Message-ID: <20190726131506.GB17801@ravnborg.org>
References: <20190710021659.177950-1-dbasehore@chromium.org>
 <20190710021659.177950-3-dbasehore@chromium.org>
 <20190723091945.GD787@ravnborg.org>
 <CAGAzgsonxAcOLxPSoP6Swab+AFPxWaxmC_tg87J=6Nes_awACg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAGAzgsonxAcOLxPSoP6Swab+AFPxWaxmC_tg87J=6Nes_awACg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "dbasehore ." <dbasehore@chromium.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

SGkgRGVyZWsuCgpPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCAwMzoxNToxOVBNIC0wNzAwLCBkYmFz
ZWhvcmUgLiB3cm90ZToKPiBIaSBTYW0sIHRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoZSBwb3Rl
bnRpYWwgY29uZmxpY3QuCj4gCj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMjoxOSBBTSBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIERlcmVrLgo+ID4K
PiA+IE9uIFR1ZSwgSnVsIDA5LCAyMDE5IGF0IDA3OjE2OjU3UE0gLTA3MDAsIERlcmVrIEJhc2Vo
b3JlIHdyb3RlOgo+ID4gPiBEZXZpY2V0cmVlIHN5c3RlbXMgY2FuIHNldCBwYW5lbCBvcmllbnRh
dGlvbiB2aWEgYSBwYW5lbCBiaW5kaW5nLCBidXQKPiA+ID4gdGhlcmUncyBubyB3YXksIGFzIGlz
LCB0byBwcm9wYWdhdGUgdGhpcyBzZXR0aW5nIHRvIHRoZSBjb25uZWN0b3IsCj4gPiA+IHdoZXJl
IHRoZSBwcm9wZXJ0eSBuZWVkIHRvIGJlIGFkZGVkLgo+ID4gPiBUbyBhZGRyZXNzIHRoaXMsIHRo
aXMgcGF0Y2ggc2V0cyBvcmllbnRhdGlvbiwgYXMgd2VsbCBhcyBvdGhlciBmaXhlZAo+ID4gPiB2
YWx1ZXMgZm9yIHRoZSBwYW5lbCwgaW4gdGhlIGRybV9wYW5lbF9hdHRhY2ggZnVuY3Rpb24uIFRo
ZXNlIHZhbHVlcwo+ID4gPiBhcmUgc3RvcmVkIGZyb20gcHJvYmUgaW4gdGhlIGRybV9wYW5lbCBz
dHJ1Y3QuCj4gPgo+ID4gVGhpcyBhcHByb2NoIHNlZW1zIHRvIGNvbmZsaWN0IHdpdGggd29yayBk
b25lIGJ5IExhdXJlbnQgd2hlcmUgdGhlCj4gPiBvd25lcnNoaXAvY3JlYXRpb24gb2YgdGhlIGNv
bm5lY3RvciB3aWxsIGJlIG1vdmVkIHRvIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIuCj4gPgo+ID4g
SWYgSSB1bmRlcnN0YW5kIGl0IGNvcnJlY3QgdGhlbiB0aGVyZSBzaG91bGQgbm90IGJlIGEgMTox
IHJlbGF0aW9uCj4gPiBiZXR3ZWVuIGEgcGFuZWwgYW5kIGEgY29ubmVjdG9yIGFueW1vcmUuCj4g
Cj4gCj4gQ2FuIHlvdSBwb2ludCBtZSB0byB0aGlzIHdvcms/ClBsZWFzZSB0YWtlIGEgbG9vayBh
dCB0aGUgc2VyaWVzIHdpdGggc3ViamVjdDoKIltQQVRDSCAwMC82MF0gZHJtL29tYXA6IFJlcGxh
Y2UgY3VzdG9tIGRpc3BsYXkgZHJpdmVycyB3aXRoIGRybV9icmlkZ2UKYW5kIGRybV9wYW5lbCIK
TGluazogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTAzNDE3NS8KCkxhdXJl
bnQgaGFzIGRvbmUgYSBncmVhdCBqb2IgZXhwbGFpbmluZyB0aGUgYmFja2dyb3VuZCwKSWYgeW91
IGxvb2sgaW50byB0aGUgcGF0Y2hlZCB5b3Ugd2lsbCBzZWUgdGhlIGlkZWEgaXMgdGhhdCBhIGRy
bV9wYW5lbApubyBsb25nZXIgZ2V0IGF0dGFjaGVkIHRvIGEgZHJtX2NvbnRyb2xsZXIgLSBpdCB3
aWxsIGJlIGFuIGFyZ3VtZW50IHRvCmdldF9tb2RlcygpLgoKCVNhbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0Cklu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZng=
