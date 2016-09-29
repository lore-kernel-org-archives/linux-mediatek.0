From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH 0/2] fix issue: vblank interrupts are never disabled
Date: Thu, 29 Sep 2016 11:29:47 +0800
Message-ID: <1475119789-64619-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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
Cc: linux-kernel@vger.kernel.org, Cawa Cheng <cawa.cheng@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Q2xlYW4gdGhlIGludGVycnVwdCBzdGF0dXMgYmVmb3JlIGVuYWJsZSBpbnRlcnJ1cHQKYW5kIHNl
dCB0aGUgdmJsYW5rX2Rpc2FibGVfYWxsb3dlZCB0byBmaXggdGhlIGlzc3VlLgoKQmliYnkgSHNp
ZWggKDIpOgogIGRybS9tZWRpYXRlazogc2V0IHZibGFua19kaXNhYmxlX2FsbG93ZWQgdG8gdHJ1
ZQogIGRybS9tZWRpYXRlazogY2xlYXIgSVJRIHN0YXR1cyBiZWZvcmUgZW5hYmxlIE9WTCBpbnRl
cnJ1cHQKCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCAgICAxICsK
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICB8ICAgIDEgKwogMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCi0tIAoxLjcuOS41CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
