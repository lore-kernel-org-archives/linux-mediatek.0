Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF71C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 21:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzCQglPZtBJ0C1buEl8fecxMJiffK//ap1zIQsQfm/8=; b=WSyNlJrFM+TgA6
	A2oY+EryF0ngJ0HY1anQ7Mb3SKHS5gASIGMUUVpMAC+5/+xyYsGk64KZDCo9XA1CaokXNXCVxOEB4
	RH6a+DMuv4EB/UkYbQV8DMJwiSFHUpaRKoybw4LQY0F48IqaJUCejzvr34OIZ421xYRk9rZMwe3LC
	SDIcN51wuTw7lx/FvQF15CozjscLuXUdMR816RtmHLzvYRqjWhEuvSLY/9a7S2GNbl4bAPhxajW7W
	EFuBfxob/Gt2+1kzxF4e01wq2zPEO2Qq7iZnFZSI6bmHYhmutJWdon92AXSrOpqYBPPtomuPNFsVT
	aZ3797lZxmcJCrXA/xmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFvP-00DTqC-Bn; Thu, 12 May 2022 21:00:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFrT-00DRKq-85; Thu, 12 May 2022 20:56:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id B734F1F45AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652388998;
 bh=oen+/Gb8r5CVD7w+WMrsnQB9YhJdlf1/8shCrq8Zx0E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GskHdfBKxcpmG8k23Wmh35zEM4lO+jrgugX00nQAHsGJNvbilMGeQQDMyKckAVan4
 nQg2qBMWLR2CakJnlWheApUbHIwav3PNRwsLZ7OMS55SGBbK5W0MKdO7m2MaPeL+2V
 zXOn4OTSngs3m3IJjajwBLAz5wJpbgWoMJFhgdfrPSTpPh2aL6zrV/BDa6If2yvQ9i
 qPtRa0eTgsq6VDq4x7vYtF9qye7zC2/oCufKXLuGpog8qExGGF4+sraTaVw9bh5n/D
 aQbed6V00oFqN1XXhkIVWSbIFBFGddbKlxrw2XGS0p5z0h0wDpAvK6XuHLXn0qsoXn
 1Lcaiz7sy9rlw==
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
Subject: [PATCH v3 11/16] arm64: dts: mediatek: asurada: Add I2C touchscreen
Date: Thu, 12 May 2022 16:55:57 -0400
Message-Id: <20220512205602.158273-12-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135639_477799_E1ABA2E7 
X-CRM114-Status: GOOD (  11.62  )
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

QWxsIG1hY2hpbmVzIG9mIHRoZSBBc3VyYWRhIHBsYXRmb3JtIGhhdmUgYSB0b3VjaHNjcmVlbiBh
dCBhZGRyZXNzIDB4MTAKaW4gdGhlIEkyQzAgYnVzLCBidXQgdGhlIGRldmljZXMgdmFyeTogU3Bo
ZXJpb24gaGFzIHRoZSBFbGFuIGVLVEgzNTAwCnRvdWNoc2NyZWVuLCB3aGlsZSBIYXlhdG8gaGFz
IGEgZ2VuZXJpYyBISUQtb3Zlci1pMmMgdG91Y2hzY3JlZW4uCgpBZGQgY29tbW9uIHN1cHBvcnQg
Zm9yIHRoZSB0b3VjaHNjcmVlbnMgb24gdGhlIHBsYXRmb3JtIGFuZCB0aGUKc3BlY2lmaWNzIGlu
IGVhY2ggYm9hcmQgZmlsZS4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+ClRlc3Rl
ZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+Ci0tLQoKKG5vIGNoYW5nZXMg
c2luY2UgdjEpCgogLi4uL2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1oYXlhdG8tcjEuZHRz
IHwgIDcgKysrKysrCiAuLi4vbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEtc3BoZXJpb24tcjAuZHRz
ICAgfCAgNCArKysKIC4uLi9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpICAg
ICB8IDI1ICsrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFz
dXJhZGEtaGF5YXRvLXIxLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTky
LWFzdXJhZGEtaGF5YXRvLXIxLmR0cwppbmRleCBjYTE4ZmNmMmFkNGYuLjFlOTE0OTE5NDVmNiAx
MDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1o
YXlhdG8tcjEuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFz
dXJhZGEtaGF5YXRvLXIxLmR0cwpAQCAtMzgsMyArMzgsMTAgQEAgTUFUUklYX0tFWSgweDAwLCAw
eDA0LCBLRVlfVk9MVU1FVVApCiAJCUNST1NfU1REX01BSU5fS0VZTUFQCiAJPjsKIH07CisKKyZ0
b3VjaHNjcmVlbiB7CisJY29tcGF0aWJsZSA9ICJoaWQtb3Zlci1pMmMiOworCXBvc3QtcG93ZXIt
b24tZGVsYXktbXMgPSA8MTA+OworCWhpZC1kZXNjci1hZGRyID0gPDB4MDAwMT47CisJdmRkLXN1
cHBseSA9IDwmcHAzMzAwX3U+OworfTsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEtc3BoZXJpb24tcjAuZHRzIGIvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1zcGhlcmlvbi1yMC5kdHMKaW5kZXggMzBiMDM4
OTVkZTQxLi40MmRiODFlOTVmYWUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTkyLWFzdXJhZGEtc3BoZXJpb24tcjAuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEtc3BoZXJpb24tcjAuZHRzCkBAIC00MCwzICs0
MCw3IEBAIE1BVFJJWF9LRVkoMHgwMCwgMHgwNCwgS0VZX1ZPTFVNRVVQKQogCQlDUk9TX1NURF9N
QUlOX0tFWU1BUAogCT47CiB9OworCismdG91Y2hzY3JlZW4geworCWNvbXBhdGlibGUgPSAiZWxh
bixla3RoMzUwMCI7Cit9OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxOTItYXN1cmFkYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
OTItYXN1cmFkYS5kdHNpCmluZGV4IGE2M2IzYzg2ZDY1MC4uZDljOTg1MjMzOWE4IDEwMDY0NAot
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCkBAIC05
Miw2ICs5MiwxMyBAQCAmaTJjMCB7CiAJY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAwMD47CiAJcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKIAlwaW5jdHJsLTAgPSA8JmkyYzBfcGlucz47CisKKwl0
b3VjaHNjcmVlbjogdG91Y2hzY3JlZW5AMTAgeworCQlyZWcgPSA8MHgxMD47CisJCWludGVycnVw
dHMtZXh0ZW5kZWQgPSA8JnBpbyAyMSBJUlFfVFlQRV9MRVZFTF9MT1c+OworCQlwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOworCQlwaW5jdHJsLTAgPSA8JnRvdWNoc2NyZWVuX3BpbnM+OworCX07
CiB9OwogCiAmaTJjMSB7CkBAIC00NTgsNiArNDY1LDI0IEBAIHBpbnMtaW50LW4gewogCQkJbWVk
aWF0ZWsscHVsbC11cC1hZHYgPSA8Mz47CiAJCX07CiAJfTsKKworCXRvdWNoc2NyZWVuX3BpbnM6
IHRvdWNoc2NyZWVuLWRlZmF1bHQtcGlucyB7CisJCXBpbnMtaXJxIHsKKwkJCXBpbm11eCA9IDxQ
SU5NVVhfR1BJTzIxX19GVU5DX0dQSU8yMT47CisJCQlpbnB1dC1lbmFibGU7CisJCQliaWFzLXB1
bGwtdXA7CisJCX07CisKKwkJcGlucy1yZXNldCB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8x
MzdfX0ZVTkNfR1BJTzEzNz47CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKworCQlwaW5zLXJlcG9y
dC1zdyB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8xMzhfX0ZVTkNfR1BJTzEzOD47CisJCQlv
dXRwdXQtbG93OworCQl9OworCX07CiB9OwogCiAmc3BpMSB7Ci0tIAoyLjM2LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
