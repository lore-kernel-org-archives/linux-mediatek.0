From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH] drm/mediatek: make imported PRIME buffers contiguous
Date: Wed, 24 Jul 2019 13:22:03 +0900
Message-ID: <CAAFQd5CfCrKLVb9obuXcMpFzBUxyZhK4NAuUOEUTviN-mZ9H6w@mail.gmail.com>
References: <20190723053421.179679-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190723053421.179679-1-acourbot@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@chromium.org>
Cc: David Airlie <airlied@linux.ie>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMjozNCBQTSBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJi
b3RAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IFRoaXMgZHJpdmVyIHJlcXVpcmVzIGltcG9ydGVk
IFBSSU1FIGJ1ZmZlcnMgdG8gYXBwZWFyIGNvbnRpZ3VvdXNseSBpbgo+IGl0cyBJTyBhZGRyZXNz
IHNwYWNlLiBNYWtlIHN1cmUgdGhpcyBpcyB0aGUgY2FzZSBieSBzZXR0aW5nIHRoZSBtYXhpbXVt
Cj4gRE1BIHNlZ21lbnQgc2l6ZSB0byBhIGJldHRlciB2YWx1ZSB0aGFuIHRoZSBkZWZhdWx0IDY0
SyBvbiB0aGUgRE1BCj4gZGV2aWNlLCBhbmQgdXNlIHNhaWQgRE1BIGRldmljZSB3aGVuIGltcG9y
dGluZyBQUklNRSBidWZmZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIENvdXJib3Qg
PGFjb3VyYm90QGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKystLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCB8ICAyICsrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgoKUmV2aWV3ZWQtYnk6IFRvbWFz
eiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+CgpCZXN0IHJlZ2FyZHMsClRvbWFzegpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
