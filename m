From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH net-next v2 0/4] of_get_mac_address ERR_PTR fixes
Date: Tue, 7 May 2019 10:19:14 +0300
Message-ID: <20190507071914.GJ2269@kadam>
References: <1557177887-30446-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1557177887-30446-1-git-send-email-ynezz@true.cz>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: devel@driverdev.osuosl.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Frank Rowand <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMTE6MjQ6NDNQTSArMDIwMCwgUGV0ciDFoHRldGlhciB3
cm90ZToKPiBIaSwKPiAKPiB0aGlzIHBhdGNoIHNlcmllcyBpcyBhbiBhdHRlbXB0IHRvIGZpeCB0
aGUgbWVzcywgSSd2ZSBzb21laG93IG1hbmFnZWQgdG8KPiBpbnRyb2R1Y2UuCj4gCj4gRmlyc3Qg
cGF0Y2ggaW4gdGhpcyBzZXJpZXMgaXMgZGVmYWN0byB2NSBvZiB0aGUgcHJldmlvdXMgMDUvMTAg
cGF0Y2ggaW4gdGhlCj4gc2VyaWVzLCBidXQgc2luY2UgdGhlIHY0IG9mIHRoaXMgMDUvMTAgcGF0
Y2ggd2Fzbid0IHBpY2tlZCB1cCBieSB0aGUKPiBwYXRjaHdvcmsgZm9yIHNvbWUgdW5rbm93biBy
ZWFzb24sIHRoaXMgcGF0Y2ggd2Fzbid0IGFwcGxpZWQgd2l0aCB0aGUgb3RoZXIKPiA5IHBhdGNo
ZXMgaW4gdGhlIHNlcmllcywgc28gSSdtIHJlc2VuZGluZyBpdCBhcyBhIHNlcGFyYXRlIHBhdGNo
IG9mIHRoaXMKPiBmaXh1cCBzZXJpZXMgYWdhaW4uCgpJIGZlZWwgc29ydCBvZiByaWRpY3Vsb3Vz
IGFza2luZyB0aGlzIG92ZXIgYW5kIG92ZXIuLi4gIE1heWJlIHlvdXIgc3BhbQpmaWx0ZXIgaXMg
ZWF0aW5nIG15IGVtYWlscz8KClRoaXMgYnVnIHdhcyBpbnRyb2R1Y2VkIGluIGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTA5NDkxNi8KIlt2NCwwMS8xMF0gb2ZfbmV0OiBhZGQg
TlZNRU0gc3VwcG9ydCB0byBvZl9nZXRfbWFjX2FkZHJlc3MiIGJ1dCBpdApsb29rcyBsaWtlIG5v
IG9uZSBhcHBsaWVkIGl0LgoKWW91J3JlIGFjdGluZyBhcyBpZiBpdCAqd2FzKiBhcHBsaWVkIGJ1
dCB5b3UgcmVmdXNlIHRvIGFuc3dlciBteQpxdWVzdGlvbiB3aG8gYXBwbGllZCBpdCBhbmQgd2hp
Y2ggdG8gd2hpY2ggdHJlZSBzbyBJIGNhbiBmaWd1cmUgb3V0IHdoYXQKd2VudCB3cm9uZy4KCkkg
b25seSBzZWUgY29tbWVudHMgZnJvbSBsYXN0IEZyaWRheSB0aGF0IGl0IHNob3VsZG4ndCBiZSBh
cHBsaWVkLi4uICBJCmFsc28gdG9sZCB5b3Ugb24gRnJpZGF5IGluIGEgZGlmZmVyZW50IHRocmVh
ZCB0aGF0IHRoYXQgcGF0Y2ggc2hvdWxkbid0CmJlIGFwcGxpZWQuICBCcmVha2luZyBnaXQgYmlz
ZWN0IGlzIGEgYnVnLCBhbmQgd2UgbmV2ZXIgZG8gdGhhdC4gIEknbQpqdXN0IHZlcnkgY29uZnVz
ZWQgcmlnaHQgbm93Li4uICBXaGF0IEknbSB0cnlpbmcgdG8gZG8gaXMgZmlndXJlIG91dCBpbgpt
eSBoZWFkIGhvdyB0aGlzIHByb2Nlc3MgZmFpbGVkIHNvIHdlIGNhbiBkbyBiZXR0ZXIgbmV4dCB0
aW1lLgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZGV2ZWwgbWFpbGluZyBsaXN0CmRldmVsQGxpbnV4ZHJpdmVy
cHJvamVjdC5vcmcKaHR0cDovL2RyaXZlcmRldi5saW51eGRyaXZlcnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpdmVyZGV2LWRldmVsCg==
