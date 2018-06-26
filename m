From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [v3 01/10] dt-bindings: mediatek: mmsys: Add support for mfd
Date: Tue, 26 Jun 2018 12:32:54 -0600
Message-ID: <CAL_Jsq+TTsgCeFeSXYdF1e8MyrOmmFvnR7ZwyQzv+FYK1G5R6w@mail.gmail.com>
References: <cover.1524820923.git.mbrugger@suse.com>
 <64ca273429d92f581568a48f3efe6035af65f579.1524820923.git.mbrugger@suse.com>
 <20180430103029.GD5147@dell> <4ead47f6-2f69-2afa-bfcc-a240a9845dc4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <4ead47f6-2f69-2afa-bfcc-a240a9845dc4@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Matthias Brugger <mbrugger@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, matthias.bgg@kernel.org, David Miller <davem@davemloft.net>
List-Id: linux-mediatek@lists.infradead.org

T24gTW9uLCBKdW4gMjUsIDIwMTggYXQgOTozOSBBTSBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlh
cy5iZ2dAZ21haWwuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAzMC8wNC8xOCAxMjozMCwgTGVlIEpv
bmVzIHdyb3RlOgo+ID4gT24gRnJpLCAyNyBBcHIgMjAxOCwgbWF0dGhpYXMuYmdnQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gPgo+ID4+IEZyb206IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2Uu
Y29tPgo+ID4+Cj4gPj4gQWRkIGJpbmRpbmcgZGVzY3JpcHRpb24gZm9yIHRoZSBtbXN5cyBtZmQg
Zm9yIHNvbWUgTWVkaWF0ZWsKPiA+PiBkZXZpY2VzLiBtbXN5cyBoYXMgc29tZSByZWdpc3RlcnMg
dG8gY29udHJvbCBjbG9jayBnYXRlcyAod2hpY2ggaXMKPiA+PiB1c2VkIGluIHRoZSBjbGsgZHJp
dmVyKSBhbmQgc29tZSByZWdpc3RlcnMgdG8gc2V0IHRoZSByb3V0aW5nIGFuZCBlbmFibGUKPiA+
PiB0aGUgZGlmZmVybmV0IGJsb2NrcyBvZiB0aGUgZGlzcGxheSBzdWJzeXN0ZW0uCj4gPj4KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4KPiA+
PiAtLS0KPiA+PiAgLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy50eHQg
ICAgICAgfCAgMiAtLQo+ID4+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkaXNwLnR4dCAgICB8ICAyICstCj4gPj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9t
ZWRpYXRlayxtbXN5cy50eHQgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKwo+ID4+ICAz
IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL21l
ZGlhdGVrLG1tc3lzLnR4dAoKUGxlYXNlIENDIERUIGxpc3Qgb24gYmluZGluZ3MuCgpSb2IKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
