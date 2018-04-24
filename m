From: matthias.bgg@kernel.org
Subject: [v2 resend 06/10] mfd: mtk-mmsys: Add mt8173 nodes
Date: Tue, 24 Apr 2018 11:47:03 +0200
Message-ID: <ce7c173efe9929712af11ea38be7f3a4d515879b.1524563001.git.mbrugger@suse.com>
References: <cover.1524563001.git.mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1524563001.git.mbrugger@suse.com>
In-Reply-To: <cover.1524563001.git.mbrugger@suse.com>
References: <cover.1524563001.git.mbrugger@suse.com>
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
Cc: sean.wang@mediatek.com, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, pi-cheng.chen@linaro.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+CgpBZGQgZGV2aWNlcyBm
b3IgdGhlIG10ODE3MyBTb0MuCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1
Z2dlckBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0
cm9uaXguZGU+Ci0tLQogZHJpdmVycy9tZmQvbXRrLW1tc3lzLmMgfCAxNCArKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L21mZC9tdGstbW1zeXMuYyBiL2RyaXZlcnMvbWZkL210ay1tbXN5cy5jCmluZGV4IGM4MDIzNDNm
YjFjNi4uNTU4NWE1NjFhMDJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL21mZC9tdGstbW1zeXMuYwor
KysgYi9kcml2ZXJzL21mZC9tdGstbW1zeXMuYwpAQCAtMTksNiArMTksNyBAQAogCiBlbnVtIHsK
IAlNTVNZU19NVDI3MDEgPSAxLAorCU1NU1lTX01UODE3MywKIH07CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbWZkX2NlbGwgbW1zeXNfbXQyNzAxX2RldnNbXSA9IHsKQEAgLTI2LDYgKzI3LDEyIEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWZkX2NlbGwgbW1zeXNfbXQyNzAxX2RldnNbXSA9IHsKIAl7
IC5uYW1lID0gImRybS1tdDI3MDEtbW0iLCB9LAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBt
ZmRfY2VsbCBtbXN5c19tdDgxNzNfZGV2c1tdID0geworCXsgLm5hbWUgPSAiY2xrLW10ODE3My1t
bSIsIH0sCisJeyAubmFtZSA9ICJkcm0tbXQ4MTczLW1tIiwgfSwKK307CisKKwogc3RhdGljIGlu
dCBtbXN5c19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCWNvbnN0IHN0
cnVjdCBtZmRfY2VsbCAqbW1zeXNfY2VsbHM7CkBAIC00NCw2ICs1MSwxMCBAQCBzdGF0aWMgaW50
IG1tc3lzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCW1tc3lzX2NlbGxz
ID0gbW1zeXNfbXQyNzAxX2RldnM7CiAJCW5yX2NlbGxzID0gQVJSQVlfU0laRShtbXN5c19tdDI3
MDFfZGV2cyk7CiAJCWJyZWFrOworCWNhc2UgTU1TWVNfTVQ4MTczOgorCQltbXN5c19jZWxscyA9
IG1tc3lzX210ODE3M19kZXZzOworCQlucl9jZWxscyA9IEFSUkFZX1NJWkUobW1zeXNfbXQ4MTcz
X2RldnMpOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlyZXR1cm4gLUVOT0RFVjsKIAl9CkBAIC02
Miw2ICs3Myw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX21hdGNoX21t
c3lzW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtbW1zeXMiLAogCSAg
LmRhdGEgPSAodm9pZCAqKSBNTVNZU19NVDI3MDEsCiAJfSwKKwl7IC5jb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE3My1tbXN5cyIsCisJICAuZGF0YSA9ICh2b2lkICopIE1NU1lTX01UODE3MywK
Kwl9LAogCXsgLyogc2VudGluZWwgKi8gfSwKIH07CiAKLS0gCjIuMTYuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
