From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v7 9/9] drm/mediatek: add support for Mediatek SoC MT2701
Date: Wed, 7 Sep 2016 13:37:33 +0800
Message-ID: <1473226653.11736.33.camel@mtksdaap41>
References: <1472815484-43821-1-git-send-email-yt.shen@mediatek.com>
 <1472815484-43821-10-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1472815484-43821-10-git-send-email-yt.shen@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YT Shen <yt.shen@mediatek.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jie Qiu <jie.qiu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, yingjoe.chen@mediatek.com, Dan Carpenter <dan.carpenter@oracle.com>, Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, shaoming chen <shaoming.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

SGksIFlUOgoKT24gRnJpLCAyMDE2LTA5LTAyIGF0IDE5OjI0ICswODAwLCBZVCBTaGVuIHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggYWRkIHN1cHBvcnQgZm9yIHRoZSBNZWRpYXRlayBNVDI3MDEgRElTUCBz
dWJzeXN0ZW0uCj4gVGhlcmUgaXMgb25seSBvbmUgT1ZMIGVuZ2luZSBpbiBNVDI3MDEuCj4gCj4g
U2lnbmVkLW9mZi1ieTogWVQgU2hlbiA8eXQuc2hlbkBtZWRpYXRlay5jb20+Cgpbc25pcC4uLl0K
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5kZXgg
NGI0ZTQ0OS4uNDY1ODE5YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHBfY29tcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwX2NvbXAuYwo+IEBAIC0xMTIsNiArMTEyLDcgQEAgc3RydWN0IG10a19kZHBfY29tcF9t
YXRjaCB7Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9tYXRjaCBtdGtf
ZGRwX21hdGNoZXNbRERQX0NPTVBPTkVOVF9JRF9NQVhdID0gewo+ICAJW0REUF9DT01QT05FTlRf
QUFMXQk9IHsgTVRLX0RJU1BfQUFMLAkwLCBOVUxMIH0sCj4gKwlbRERQX0NPTVBPTkVOVF9CTFNd
CT0geyBNVEtfRElTUF9QV00sCTAsIE5VTEwgfSwKCkkgdGhpbmsgQkxTIGlzIGRpZmZlcmVudCB0
aGFuIFBXTSwgc28gdGhpcyBzdGF0ZW1lbnQgc2hvdWxkIGJlCgpbRERQX0NPTVBPTkVOVF9CTFNd
ID0geyBNVEtfRElTUF9CTFMsIDAsIE5VTEwgfTsKCgo+ICAJW0REUF9DT01QT05FTlRfQ09MT1Iw
XQk9IHsgTVRLX0RJU1BfQ09MT1IsCTAsICZkZHBfY29sb3IgfSwKPiAgCVtERFBfQ09NUE9ORU5U
X0NPTE9SMV0JPSB7IE1US19ESVNQX0NPTE9SLAkxLCAmZGRwX2NvbG9yIH0sCj4gIAlbRERQX0NP
TVBPTkVOVF9EUEkwXQk9IHsgTVRLX0RQSSwJCTAsIE5VTEwgfSwKClJlZ2FyZHMsCkNLCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
