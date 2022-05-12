Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC90C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFjfOOEXnfB7lvBInymxPdmd9MGbobBiTzDP7QDW9BU=; b=XEDbnYUcsyHYOu
	ztQBTNToGi1/k0Us+gDV5f9eaHantFBoVcJ3uavfG4GQdbcJZu8J8DdoV8v1xptBR9ro2qgDYGon+
	jZuyMeUMrDVMc+869kLTmKkMpyKTeXN9ep2zWLV8U2p2BhxdN6iPpWA8KS3xuoGBz0hi0sNAG0xN+
	gbwvY2K6P3Ll81ep5DfLPltgO/dchRMKYULvFlbZQXsBdg04kxzenAff6LUOGxA6R+2Z58Y35Fyqw
	q/COIzOFkzSld7ymGoHu9fWwDz7SXwo7yKOK3GQa8RutxCoGNxtt+LgC0t6k9ps8LgbmdKDhuAkjb
	pBaiOmnTsF2eom8PRfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFwq-00DUeL-KA; Thu, 12 May 2022 21:02:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFrZ-00DRPT-9U; Thu, 12 May 2022 20:56:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 79CEF1F45AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652389004;
 bh=i7Z2W6YC5XDeB3fbg7wPBOxu/CQV/7/SaA7a+o0HOSo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l9+Fvbu8wTUi1CFOOJfCnD2jxLfrwNzOZxzZ/fboIaNLXkDYcSHLCf6qL1o3C18MP
 1JUo7sQqTr7QHGmPEbjUVG13aqSXCTfXR1syo/RPGzBsoZ/0C0QP4EkNthe/5aRExS
 AsFRMSEGaswkzPIx+uFdFuK8pmwa9juMTzWIwkSNe/8QueDTRDgixBVeHIDvq0CdUB
 CcFidUoXzQ72XxV25ZIRpRd1veVcO9J425Lm8bSbf03SRmBOzvqKooz0GpI91OHoaJ
 4AIoYMeiADPJAyH09C1u1+b3eo5IM54g4Hf2AQp7sRTUbTDVd1RjrKWI4TyMKC/kmV
 vjUpXF4ijxuaw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 14/16] arm64: dts: mediatek: asurada: Enable PCIe and add
 WiFi
Date: Thu, 12 May 2022 16:56:00 -0400
Message-Id: <20220512205602.158273-15-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135645_500143_E7B6F68F 
X-CRM114-Status: GOOD (  13.23  )
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

RW5hYmxlIE1UODE5MidzIFBDSWUgY29udHJvbGxlciBhbmQgYWRkIHN1cHBvcnQgZm9yIHRoZSBN
VDc5MjFlIFdpRmkKY2FyZCB0aGF0IGlzIHByZXNlbnQgb24gdGhhdCBidXMgZm9yIHRoZSBBc3Vy
YWRhIHBsYXRmb3JtLgoKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5m
cmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KVGVzdGVkLWJ5
OiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9taXVtLm9yZz4KCi0tLQoKQ2hhbmdlcyBpbiB2MzoK
LSBSZW5hbWVkIHJlZ3VsYXRvciBub2RlIHRvIGJlIGdlbmVyaWMKCkNoYW5nZXMgaW4gdjI6Ci0g
QWRkZWQgdGhpcyBwYXRjaAoKIC4uLi9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5k
dHNpICAgICB8IDc0ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3NCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
OTItYXN1cmFkYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1
cmFkYS5kdHNpCmluZGV4IGVjYWUyNzMwNzg5ZS4uZGRlNGRlMjdlYzYxIDEwMDY0NAotLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCkBAIC02Niw2ICs2
NiwxOSBAQCBwcDMzMDBfdTogcmVndWxhdG9yLTN2My11IHsKIAkJdmluLXN1cHBseSA9IDwmcHAz
MzAwX2c+OwogCX07CiAKKwlwcDMzMDBfd2xhbjogcmVndWxhdG9yLTN2My13bGFuIHsKKwkJY29t
cGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOworCQlyZWd1bGF0b3ItbmFtZSA9ICJwcDMzMDBf
d2xhbiI7CisJCXJlZ3VsYXRvci1hbHdheXMtb247CisJCXJlZ3VsYXRvci1ib290LW9uOworCQly
ZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKKwkJcmVndWxhdG9yLW1heC1taWNy
b3ZvbHQgPSA8MzMwMDAwMD47CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCXBpbmN0
cmwtMCA9IDwmcHAzMzAwX3dsYW5fcGlucz47CisJCWVuYWJsZS1hY3RpdmUtaGlnaDsKKwkJZ3Bp
byA9IDwmcGlvIDE0MyBHUElPX0FDVElWRV9ISUdIPjsKKwl9OworCiAJLyogc3lzdGVtIHdpZGUg
c3dpdGNoaW5nIDUuMFYgcG93ZXIgcmFpbCAqLwogCXBwNTAwMF9hOiByZWd1bGF0b3ItNXYwLWEg
ewogCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7CkBAIC04NCw2ICs5NywxNyBAQCBw
cHZhcl9zeXM6IHJlZ3VsYXRvci12YXItc3lzIHsKIAkJcmVndWxhdG9yLWFsd2F5cy1vbjsKIAkJ
cmVndWxhdG9yLWJvb3Qtb247CiAJfTsKKworCXJlc2VydmVkX21lbW9yeTogcmVzZXJ2ZWQtbWVt
b3J5IHsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47CisJCSNzaXplLWNlbGxzID0gPDI+OworCQly
YW5nZXM7CisKKwkJd2lmaV9yZXN0cmljdGVkX2RtYV9yZWdpb246IHdpZmlAYzAwMDAwMDAgewor
CQkJY29tcGF0aWJsZSA9ICJyZXN0cmljdGVkLWRtYS1wb29sIjsKKwkJCXJlZyA9IDwwIDB4YzAw
MDAwMDAgMCAweDQwMDAwMDA+OworCQl9OworCX07CiB9OwogCiAmaTJjMCB7CkBAIC0xNDQsNiAr
MTY4LDI4IEBAICZpMmM3IHsKIAlwaW5jdHJsLTAgPSA8JmkyYzdfcGlucz47CiB9OwogCismcGNp
ZSB7CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwlwaW5jdHJsLTAgPSA8JnBjaWVfcGlu
cz47CisKKwlwY2llMDogcGNpZUAwLDAgeworCQlkZXZpY2VfdHlwZSA9ICJwY2kiOworCQlyZWcg
PSA8MHgwMDAwIDAgMCAwIDA+OworCQludW0tbGFuZXMgPSA8MT47CisJCWJ1cy1yYW5nZSA9IDww
eDEgMHgxPjsKKworCQkjYWRkcmVzcy1jZWxscyA9IDwzPjsKKwkJI3NpemUtY2VsbHMgPSA8Mj47
CisJCXJhbmdlczsKKworCQl3aWZpOiB3aWZpQDAsMCB7CisJCQlyZWcgPSA8MHgxMDAwMCAwIDAg
MCAweDEwMDAwMD4sCisJCQkgICAgICA8MHgxMDAwMCAwIDB4MTAwMDAwIDAgMHgxMDAwMDA+Owor
CQkJbWVtb3J5LXJlZ2lvbiA9IDwmd2lmaV9yZXN0cmljdGVkX2RtYV9yZWdpb24+OworCQl9Owor
CX07Cit9OworCiAmcGlvIHsKIAkvKiAyMjAgbGluZXMgKi8KIAlncGlvLWxpbmUtbmFtZXMgPSAi
STJTX0RQX0xSQ0siLApAQCAtNDM0LDYgKzQ4MCwzNCBAQCBwaW5zLWJ1cyB7CiAJCX07CiAJfTsK
IAorCXBjaWVfcGluczogcGNpZS1kZWZhdWx0LXBpbnMgeworCQlwaW5zLXBjaWUtd2FrZSB7CisJ
CQlwaW5tdXggPSA8UElOTVVYX0dQSU82M19fRlVOQ19QQ0lFX1dBS0VfTj47CisJCQliaWFzLXB1
bGwtdXA7CisJCX07CisKKwkJcGlucy1wY2llLXBlcmVzZXQgeworCQkJcGlubXV4ID0gPFBJTk1V
WF9HUElPNjRfX0ZVTkNfUENJRV9QRVJFU0VUX04+OworCQl9OworCisJCXBpbnMtcGNpZS1jbGty
ZXEgeworCQkJcGlubXV4ID0gPFBJTk1VWF9HUElPNjVfX0ZVTkNfUENJRV9DTEtSRVFfTj47CisJ
CQliaWFzLXB1bGwtdXA7CisJCX07CisKKwkJcGlucy13aWZpLWtpbGwgeworCQkJcGlubXV4ID0g
PFBJTk1VWF9HUElPMTQ1X19GVU5DX0dQSU8xNDU+OyAvKiBXSUZJX0tJTExfTCAqLworCQkJb3V0
cHV0LWhpZ2g7CisJCX07CisJfTsKKworCXBwMzMwMF93bGFuX3BpbnM6IHBwMzMwMC13bGFuLXBp
bnMgeworCQlwaW5zLXBjaWUtZW4tcHAzMzAwLXdsYW4geworCQkJcGlubXV4ID0gPFBJTk1VWF9H
UElPMTQzX19GVU5DX0dQSU8xNDM+OworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJfTsKKwogCXNw
aTFfcGluczogc3BpMS1kZWZhdWx0LXBpbnMgewogCQlwaW5zLWNzLW1vc2ktY2xrIHsKIAkJCXBp
bm11eCA9IDxQSU5NVVhfR1BJTzE1N19fRlVOQ19TUEkxX0FfQ1NCPiwKLS0gCjIuMzYuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
