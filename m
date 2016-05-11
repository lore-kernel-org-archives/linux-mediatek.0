From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm: mediatek: add COMMON_CLK dependency
Date: Wed, 11 May 2016 18:05:33 +0200
Message-ID: <1462982733.2924.36.camel@pengutronix.de>
References: <1462970100-240687-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1462970100-240687-1-git-send-email-arnd@arndb.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, YT Shen <yt.shen@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

QW0gTWl0dHdvY2gsIGRlbiAxMS4wNS4yMDE2LCAxNDozNCArMDIwMCBzY2hyaWViIEFybmQgQmVy
Z21hbm46Cj4gT24ga2VybmVsIGJ1aWxkcyB3aXRob3V0IENPTU1PTl9DTEssIHRoZSBuZXdseSBh
ZGRlZCBtZWRpYXRlayBkcm0KPiBkcml2ZXIgZmFpbHMgdG8gYnVpbGQ6Cj4gCj4gZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmM6MTMwOjE2OiBlcnJvcjogZmllbGQgJ3BsbF9o
dycgaGFzIGluY29tcGxldGUgdHlwZQo+ICAgc3RydWN0IGNsa19odyBwbGxfaHc7Cj4gICAgICAg
ICAgICAgICAgIF5+fn5+fgo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRlL2xpbnV4
L2Nsay5oOjE2OjAsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4uL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfbWlwaV90eC5jOjE0Ogo+IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
bWlwaV90eC5jOiBJbiBmdW5jdGlvbiAnbXRrX21pcGlfdHhfZnJvbV9jbGtfaHcnOgo+IGluY2x1
ZGUvbGludXgva2VybmVsLmg6ODMxOjQ4OiBlcnJvcjogaW5pdGlhbGl6YXRpb24gZnJvbSBpbmNv
bXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2Vycm9yPWluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVz
XQo+ICAgY29uc3QgdHlwZW9mKCAoKHR5cGUgKikwKS0+bWVtYmVyICkgKl9fbXB0ciA9IChwdHIp
OyBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+
IC9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguYzoxMzY6OTogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvICdjb250YWluZXJfb2YnCj4gICByZXR1cm4gY29udGFpbmVyX29m
KGh3LCBzdHJ1Y3QgbXRrX21pcGlfdHgsIHBsbF9odyk7Cj4gICAgICAgICAgXn5+fn5+fn5+fn5+
Cj4gZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmM6IEF0IHRvcCBsZXZlbDoK
PiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguYzozMDI6MjE6IGVycm9yOiB2
YXJpYWJsZSAnbXRrX21pcGlfdHhfcGxsX29wcycgaGFzIGluaXRpYWxpemVyIGJ1dCBpbmNvbXBs
ZXRlIHR5cGUKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfb3BzIG10a19taXBpX3R4X3BsbF9v
cHMgPSB7Cj4gCj4gVGhpcyBhZGRzIHRoZSByZXF1aXJlZCBLY29uZmlnIGRlcGVuZGVuY3kuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCkFja2VkLWJ5
OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgoKcmVnYXJkcwpQaGlsaXBw
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
