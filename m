From: matthias.bgg@kernel.org
Subject: [v3 05/10] clk: mediatek: mt2701-mm: switch to mfd device
Date: Fri, 27 Apr 2018 11:23:57 +0200
Message-ID: <3230840517e3e5f3fcb4ea65482e5d86d3342f54.1524820923.git.mbrugger@suse.com>
References: <cover.1524820923.git.mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1524820923.git.mbrugger@suse.com>
In-Reply-To: <cover.1524820923.git.mbrugger@suse.com>
References: <cover.1524820923.git.mbrugger@suse.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org
Cc: sean.wang@mediatek.com, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+CgpBcyB0aGUgbmV3IG1m
ZCBkZXZpY2UgaXMgaW4gcGxhY2UsIHN3aXRjaCBwcm9iaW5nCmZvciB0aGUgTU1TWVMgdG8gc3Vw
cG9ydCBpbnZvY2F0aW9uIGZyb20gdGhlIG1mZCBkZXZpY2UuCgpTaWduZWQtb2ZmLWJ5OiBNYXR0
aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4KQWNrZWQtYnk6IFN0ZXBoZW4gQm95ZCA8
c2JveWRAY29kZWF1cm9yYS5vcmc+Ci0tLQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Mjcw
MS1tbS5jIHwgMTAgKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQy
NzAxLW1tLmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQyNzAxLW1tLmMKaW5kZXggZmUx
Zjg1MDcyZmM1Li40NTE3NTI1ODg3ZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVr
L2Nsay1tdDI3MDEtbW0uYworKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQyNzAxLW1t
LmMKQEAgLTg3LDE2ICs4NywxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19nYXRlIG1tX2Ns
a3NbXSA9IHsKIAlHQVRFX0RJU1AxKENMS19NTV9UVkVfRk1NLCAibW1fdHZlX2ZtbSIsICJtbV9z
ZWwiLCAxNCksCiB9OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvZl9tYXRj
aF9jbGtfbXQyNzAxX21tW10gPSB7Ci0JeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEt
bW1zeXMiLCB9LAotCXt9Ci19OwotCiBzdGF0aWMgaW50IGNsa19tdDI3MDFfbW1fcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgY2xrX29uZWNlbGxfZGF0YSAq
Y2xrX2RhdGE7CiAJaW50IHI7Ci0Jc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2
Lm9mX25vZGU7CisJc3RydWN0IGRldmljZV9ub2RlICpub2RlOworCisJbm9kZSA9IHBkZXYtPmRl
di5wYXJlbnQtPm9mX25vZGU7CiAKIAljbGtfZGF0YSA9IG10a19hbGxvY19jbGtfZGF0YShDTEtf
TU1fTlIpOwogCkBAIC0xMTYsNyArMTEzLDYgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2
ZXIgY2xrX210MjcwMV9tbV9kcnYgPSB7CiAJLnByb2JlID0gY2xrX210MjcwMV9tbV9wcm9iZSwK
IAkuZHJpdmVyID0gewogCQkubmFtZSA9ICJjbGstbXQyNzAxLW1tIiwKLQkJLm9mX21hdGNoX3Rh
YmxlID0gb2ZfbWF0Y2hfY2xrX210MjcwMV9tbSwKIAl9LAogfTsKIAotLSAKMi4xNi4zCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
