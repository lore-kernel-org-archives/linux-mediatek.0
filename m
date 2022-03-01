Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4354C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 20:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XqPdwP2Dg433AEtbbSOyr2s5uy8ZOUvt+m5ujqXUOY=; b=wjGiqatQ8bidkq
	Bq2hudOGR5wxONozbnHKRigEoMimyohu5lnrKRjTgZA+8mWHWyU4EUx0oUSzdw+mTaCow9nu85+Lj
	qLs1lgXQywkZ4L3Q2BIpAUa5OpCrM9GgjNSK6Dh/rQBy20uosGnLkK1QAViTvQfW/Fbi6zTMj5amL
	hNHpywmZGBszlQr9QLMi6muiWJzb+hB1L3x2EY667r2ZW14GuSKght08YRoGWKUxei5lkeR1uOeSj
	ol8Frcmj0V2v/20Duh4B/NfGrAgf8LWWZijE6M3OaLD8DM3KP628gr+nX5IPMf3GD0wjynk522K+4
	bdRwkqIvbLUnYuJGYURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP9AY-000TU5-0K; Tue, 01 Mar 2022 20:32:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP9AC-000TOH-3i; Tue, 01 Mar 2022 20:32:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id C4D051F44A12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646166720;
 bh=rZ+zdH3XV8cnIuP17vc0Q44PQylfiOCJrNa2j1++0eE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gx6vs5RfgGPCHgc9F0RwhKN9G6d9f1L/S+6hQqi2cUaS0sRPPvWbkGAgHQalDbHMp
 zEoxSimyRWXawr28YTxKBy9+YlmaQlxzZQdP4a/8EXjxBcH2aRdEx1mJAgniiPNZ2L
 1Zx1r0Qlr1LvwAvVYgOjmdFSngt9RWSGunfL0GRc5eYpV1eiRL2MHPJx0j5qR6gYnm
 euNOpoSMTYBDo9rQdnlM266y0RRV9BT33MNSilVRQY3SFgqEM4419F/NO+rPtcapLE
 NMiKW8t2IllrEGOZTvRB9WH7uV9y+THxgLDUrNvTCzoCwMfwIq7qH0WPG9xl6RU0Y6
 SiZepdLlwfcLA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: mediatek: Format mediatek,
 larbs as an array of phandles
Date: Tue,  1 Mar 2022 15:31:47 -0500
Message-Id: <20220301203147.1143782-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301203147.1143782-1-nfraprado@collabora.com>
References: <20220301203147.1143782-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_123204_324575_39CA5A91 
X-CRM114-Status: GOOD (  13.54  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q29tbWl0IDM5YmQyYjZhMzc4MyAoImR0LWJpbmRpbmdzOiBJbXByb3ZlIHBoYW5kbGUtYXJyYXkg
c2NoZW1hcyIpCnVwZGF0ZWQgdGhlIG1lZGlhdGVrLGxhcmJzIHByb3BlcnR5IGluIHRoZSBtZWRp
YXRlayxpb21tdS55YW1sCmR0LWJpbmRpbmcgdG8gbWFrZSBpdCBjbGVhcmVyIHRoYXQgdGhlIHBo
YW5kbGVzIHBhc3NlZCB0byB0aGUgcHJvcGVydHkKYXJlIGluZGVwZW5kZW50LCByYXRoZXIgdGhh
biBzdWJzZXF1ZW50IGFyZ3VtZW50cyB0byB0aGUgZmlyc3QgcGhhbmRsZS4KClVwZGF0ZSB0aGUg
bWVkaWF0ZWssbGFyYnMgcHJvcGVydHkgaW4gdGhlIGFybTY0IERldmljZXRyZWVzIHRvIHVzZSB0
aGUKc2FtZSBmb3JtYXR0aW5nLiBUaGlzIGNoYW5nZSBkb2Vzbid0IGltcGFjdCBhbnkgYmVoYXZp
b3I6IHRoZSBjb21waWxlZApkdGIgaXMgZXhhY3RseSB0aGUgc2FtZS4gSXQgZG9lcyBob3dldmVy
IGZpeCB0aGUgd2FybmluZ3MgZ2VuZXJhdGVkIGJ5CmR0YnNfY2hlY2suCgpTaWduZWQtb2ZmLWJ5
OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgotLS0K
CkNoYW5nZXMgaW4gdjI6Ci0gU3BsaXQgYXJtIGFuZCBhcm02NCBjaGFuZ2VzIGludG8gc2VwYXJh
dGUgY29tbWl0cwoKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNpIHwg
NiArKystLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTY3LmR0c2kgIHwgMiAr
LQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaSAgfCA0ICsrLS0KIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgIHwgNCArKy0tCiA0IGZpbGVz
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210MjcxMmUuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNpCmluZGV4IGRlMTZjMGQ4MGMzMC4uOTczYzliZWFk
ZTBjIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210MjcxMmUuZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210MjcxMmUuZHRzaQpAQCAtMzI5
LDggKzMyOSw4IEBAIGlvbW11MDogaW9tbXVAMTAyMDUwMDAgewogCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMTQ3IElSUV9UWVBFX0xFVkVMX0xPVz47CiAJCWNsb2NrcyA9IDwmaW5mcmFjZmcgQ0xL
X0lORlJBX000VT47CiAJCWNsb2NrLW5hbWVzID0gImJjbGsiOwotCQltZWRpYXRlayxsYXJicyA9
IDwmbGFyYjAgJmxhcmIxICZsYXJiMgotCQkJCSAgJmxhcmIzICZsYXJiNj47CisJCW1lZGlhdGVr
LGxhcmJzID0gPCZsYXJiMD4sIDwmbGFyYjE+LCA8JmxhcmIyPiwKKwkJCQkgPCZsYXJiMz4sIDwm
bGFyYjY+OwogCQkjaW9tbXUtY2VsbHMgPSA8MT47CiAJfTsKIApAQCAtMzQ2LDcgKzM0Niw3IEBA
IGlvbW11MTogaW9tbXVAMTAyMGEwMDAgewogCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQ1IElS
UV9UWVBFX0xFVkVMX0xPVz47CiAJCWNsb2NrcyA9IDwmaW5mcmFjZmcgQ0xLX0lORlJBX000VT47
CiAJCWNsb2NrLW5hbWVzID0gImJjbGsiOwotCQltZWRpYXRlayxsYXJicyA9IDwmbGFyYjQgJmxh
cmI1ICZsYXJiNz47CisJCW1lZGlhdGVrLGxhcmJzID0gPCZsYXJiND4sIDwmbGFyYjU+LCA8Jmxh
cmI3PjsKIAkJI2lvbW11LWNlbGxzID0gPDE+OwogCX07CiAKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTY3LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE2Ny5kdHNpCmluZGV4IDkwMjkwNTE2MjRhNi4uNTQ2NTVmMmZlYjA0IDEwMDY0
NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE2Ny5kdHNpCisrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTY3LmR0c2kKQEAgLTE3NCw3ICsxNzQsNyBA
QCBsYXJiMjogbGFyYkAxNjAxMDAwMCB7CiAJCWlvbW11OiBtNHVAMTAyMDMwMDAgewogCQkJY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctbTR1IjsKIAkJCXJlZyA9IDwwIDB4MTAyMDMwMDAg
MCAweDEwMDA+OwotCQkJbWVkaWF0ZWssbGFyYnMgPSA8JmxhcmIwICZsYXJiMSAmbGFyYjI+Owor
CQkJbWVkaWF0ZWssbGFyYnMgPSA8JmxhcmIwPiwgPCZsYXJiMT4sIDwmbGFyYjI+OwogCQkJaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDEyMSBJUlFfVFlQRV9MRVZFTF9MT1c+OwogCQkJI2lvbW11LWNl
bGxzID0gPDE+OwogCQl9OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxNzMuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kK
aW5kZXggMmI3ZDMzMWE0NTg4Li4wNDJmZWFlZGRhNGEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxNzMuZHRzaQpAQCAtNTg4LDggKzU4OCw4IEBAIGlvbW11OiBpb21tdUAxMDIw
NTAwMCB7CiAJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTM5IElSUV9UWVBFX0xFVkVMX0xPVz47
CiAJCQljbG9ja3MgPSA8JmluZnJhY2ZnIENMS19JTkZSQV9NNFU+OwogCQkJY2xvY2stbmFtZXMg
PSAiYmNsayI7Ci0JCQltZWRpYXRlayxsYXJicyA9IDwmbGFyYjAgJmxhcmIxICZsYXJiMgotCQkJ
CQkgICZsYXJiMyAmbGFyYjQgJmxhcmI1PjsKKwkJCW1lZGlhdGVrLGxhcmJzID0gPCZsYXJiMD4s
IDwmbGFyYjE+LCA8JmxhcmIyPiwKKwkJCQkJIDwmbGFyYjM+LCA8JmxhcmI0PiwgPCZsYXJiNT47
CiAJCQkjaW9tbXUtY2VsbHMgPSA8MT47CiAJCX07CiAKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE4My5kdHNpCmluZGV4IDAwZjJkZGQyNDVlMS4uNTIzNzQxMTUwOTY4IDEwMDY0NAot
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpCisrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kKQEAgLTY4Miw4ICs2ODIsOCBAQCBp
b21tdTogaW9tbXVAMTAyMDUwMDAgewogCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMt
bTR1IjsKIAkJCXJlZyA9IDwwIDB4MTAyMDUwMDAgMCAweDEwMDA+OwogCQkJaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDE2NiBJUlFfVFlQRV9MRVZFTF9MT1c+OwotCQkJbWVkaWF0ZWssbGFyYnMgPSA8
JmxhcmIwICZsYXJiMSAmbGFyYjIgJmxhcmIzCi0JCQkJCSAgJmxhcmI0ICZsYXJiNSAmbGFyYjY+
OworCQkJbWVkaWF0ZWssbGFyYnMgPSA8JmxhcmIwPiwgPCZsYXJiMT4sIDwmbGFyYjI+LCA8Jmxh
cmIzPiwKKwkJCQkJIDwmbGFyYjQ+LCA8JmxhcmI1PiwgPCZsYXJiNj47CiAJCQkjaW9tbXUtY2Vs
bHMgPSA8MT47CiAJCX07CiAKLS0gCjIuMzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
