From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v3 3/3] drm/mediatek: fix the wrong pixel clock when
 resolution is 4K
Date: Thu, 4 Aug 2016 10:38:31 +0800
Message-ID: <1470278311-22528-4-git-send-email-bibby.hsieh@mediatek.com>
References: <1470278311-22528-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1470278311-22528-1-git-send-email-bibby.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Junzhi Zhao <junzhi.zhao@mediatek.com>, linux-kernel@vger.kernel.org, Cawa Cheng <cawa.cheng@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogSnVuemhpIFpoYW8gPGp1bnpoaS56aGFvQG1lZGlhdGVrLmNvbT4KClBpeGVsIGNsb2Nr
IHNob3VsZCBiZSAyOTdNSHogd2hlbiByZXNvbHV0aW9uIGlzIDRLLgoKU2lnbmVkLW9mZi1ieTog
SnVuemhpIFpoYW8gPGp1bnpoaS56aGFvQG1lZGlhdGVrLmNvbT4KU2lnbmVkLW9mZi1ieTogQmli
YnkgSHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jIHwgICAgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwpp
bmRleCBkMDVjYTc5Li5hOTBhZjU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKQEAg
LTQzOCwxMCArNDM4LDE0IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0
cnVjdCBtdGtfZHBpICpkcGksCiAJfQogCiAJcGl4X3JhdGUgPSAxMDAwVUwgKiBtb2RlLT5jbG9j
azsKLQlpZiAobW9kZS0+Y2xvY2sgPD0gNzQwMDApCisJaWYgKG1vZGUtPmNsb2NrIDw9IDI3MDAw
KQorCQlmYWN0b3IgPSAxNiAqIDM7CisJZWxzZSBpZiAobW9kZS0+Y2xvY2sgPD0gNzQyNTApCiAJ
CWZhY3RvciA9IDggKiAzOwotCWVsc2UKKwllbHNlIGlmIChtb2RlLT5jbG9jayA8PSAxNjcwMDAp
CiAJCWZhY3RvciA9IDQgKiAzOworCWVsc2UKKwkJZmFjdG9yID0gMiAqIDM7CiAJcGxsX3JhdGUg
PSBwaXhfcmF0ZSAqIGZhY3RvcjsKIAogCWRldl9kYmcoZHBpLT5kZXYsICJXYW50IFBMTCAlbHUg
SHosIHBpeGVsIGNsb2NrICVsdSBIelxuIiwKLS0gCjEuNy45LjUKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
