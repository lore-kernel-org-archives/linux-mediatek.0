From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] drm: mediatek: remove IOMMU_DMA select
Date: Wed, 11 May 2016 22:11:07 +0200
Message-ID: <1462997501-982363-1-git-send-email-arnd@arndb.de>
References: <1462982509-342936-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1462982509-342936-1-git-send-email-arnd@arndb.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@redhat.com, David Airlie <airlied@linux.ie>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, YT Shen <yt.shen@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

V2UgZ2V0IGEgaGFybWxlc3MgYnVpbGQgd2FybmluZyB3aGVuIHRyeWluZyB0byB1c2UgdGhlIG1l
ZGlhdGVrCkRSTSBkcml2ZXIgd2l0aCBJT01NVSBzdXBwb3J0IGRpc2FibGVkOgoKd2FybmluZzog
KERSTV9NRURJQVRFSykgc2VsZWN0cyBJT01NVV9ETUEgd2hpY2ggaGFzIHVubWV0IGRpcmVjdCBk
ZXBlbmRlbmNpZXMgKElPTU1VX1NVUFBPUlQpCgpIb3dldmVyLCB0aGUgSU9NTVVfRE1BIHN5bWJv
bCBpcyBub3QgbWVhbnQgdG8gYmUgdXNlZCBieSBkcml2ZXJzCmF0IGFsbCwgYW5kIHRoaXMgZHJp
dmVyIGRvZXNuJ3Qgc2VlbSB0byBoYXZlIGEgc3RyaWN0IGRlcGVuZGVuY3kKb24gaXQgb3RoZXIg
dGhhbiB1c2luZyB0aGUgbWVkaWF0ZWsgSU9NTVUgZHJpdmVyIHRoYXQgZG9lcy4KClNpbmNlIHdl
IGFsc28gd2FudCB0byBiZSBhYmxlIHRvIGRvIGNvbXBpbGUgdGVzdHMgd2l0aCB0aGUKZHJpdmVy
IG9uIG90aGVyIHBsYXRmb3JtcywgdGhlIElPTU1VX0RNQSBzeW1ib2wgc2hvdWxkIG5vdApiZSBz
ZWxlY3RlZCBoZXJlLgoKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4KLS0tCklmIHNvbWVvbmUgaGFzIGEgYmV0dGVyIGV4cGxhbmF0aW9uIGFib3V0IHdoeSB0aGUg
J3NlbGVjdCcgaXMgaGVyZSwKbGV0IG1lIGtub3csIGl0IGNlcnRhaW5seSBzZWVtcyBvdXQgb2Yg
cGxhY2UuCgogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcgfCAxIC0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZwppbmRleCAwYzA2
YTY5ZDdmMDQuLjU0NTk3M2Y2Yjc0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcKQEAgLTcs
NyArNyw2IEBAIGNvbmZpZyBEUk1fTUVESUFURUsKIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKIAlz
ZWxlY3QgRFJNX01JUElfRFNJCiAJc2VsZWN0IERSTV9QQU5FTAotCXNlbGVjdCBJT01NVV9ETUEK
IAlzZWxlY3QgTUVNT1JZCiAJc2VsZWN0IE1US19TTUkKIAloZWxwCi0tIAoyLjcuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
