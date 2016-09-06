From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v7 2/9] drm/mediatek: add *driver_data for different
 hardware settings
Date: Tue, 6 Sep 2016 15:26:10 +0800
Message-ID: <1473146770.11736.3.camel@mtksdaap41>
References: <1472815484-43821-1-git-send-email-yt.shen@mediatek.com>
 <1472815484-43821-3-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1472815484-43821-3-git-send-email-yt.shen@mediatek.com>
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
Ogo+IFRoZXJlIGFyZSBzb21lIGhhcmR3YXJlIHNldHRpbmdzIGNoYW5nZWQsIGJldHdlZW4gTVQ4
MTczICYgTVQyNzAxOgo+IERJU1BfT1ZMIGFkZHJlc3Mgb2Zmc2V0IGNoYW5nZWQsIGNvbG9yIGZv
cm1hdCBkZWZpbml0aW9uIGNoYW5nZWQuCj4gRElTUF9SRE1BIGZpZm8gc2l6ZSBjaGFuZ2VkLgo+
IERJU1BfQ09MT1Igb2Zmc2V0IGNoYW5nZWQuCj4gTUlQSV9UWCBwbGwgc2V0dGluZyBjaGFuZ2Vk
Lgo+IEFuZCBhZGQgcHJlZml4IGZvciBtdGtfZGRwX21haW4gJiBtdGtfZGRwX2V4dCAmIG11dGV4
X21vZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZVCBTaGVuIDx5dC5zaGVuQG1lZGlhdGVrLmNvbT4K
PiAtLS0KCltzbmlwLi4uXQoKPiAgCj4gQEAgLTE4NSw3ICsxODMsOCBAQCBzdGF0aWMgdm9pZCBt
dGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBp
bnQgaWR4LAo+ICAJd3JpdGVsX3JlbGF4ZWQocGl0Y2gsIGNvbXAtPnJlZ3MgKyBESVNQX1JFR19P
VkxfUElUQ0goaWR4KSk7Cj4gIAl3cml0ZWxfcmVsYXhlZChzcmNfc2l6ZSwgY29tcC0+cmVncyAr
IERJU1BfUkVHX09WTF9TUkNfU0laRShpZHgpKTsKPiAgCXdyaXRlbF9yZWxheGVkKG9mZnNldCwg
Y29tcC0+cmVncyArIERJU1BfUkVHX09WTF9PRkZTRVQoaWR4KSk7Cj4gLQl3cml0ZWxfcmVsYXhl
ZChhZGRyLCBjb21wLT5yZWdzICsgRElTUF9SRUdfT1ZMX0FERFIoaWR4KSk7CgpESVNQX1JFR19P
VkxfQUREUigpIGlzIHVzZWxlc3MsIHNvIHJlbW92ZSBpdC4KCj4gKwl3cml0ZWxfcmVsYXhlZChh
ZGRyLCBjb21wLT5yZWdzICsgY29tcC0+ZGF0YS0+b3ZsLmFkZHJfb2Zmc2V0Cj4gKwkJCQkJKyBp
ZHggKiAweDIwKTsKPiAgCj4gIAlpZiAocGVuZGluZy0+ZW5hYmxlKQo+ICAJCW10a19vdmxfbGF5
ZXJfb24oY29tcCwgaWR4KTsKCgpSZWdhcmRzLApDSwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
