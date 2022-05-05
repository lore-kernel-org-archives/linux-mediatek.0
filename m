Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD77C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=us0LQCbwUzBNGUQdPcqIptnAzCMbufmWrBobEDJlctM=; b=wkGEKv7hCWletF
	9FeX8U2B+CX1pBTOo157SqDPUO4+XubDR/B0EQjBK+E3yZb+rvLa2LoGInFFfg/0isQt4BUwTznMR
	xl3tpYKQi7Vl1fQKKnW/u9TrFUN5McXOBcSB4DRBLmu+Nta/NqV9VPBrEkNUw7YmMa8DCs2Sdre87
	velUN5ZnLaai5PWGDfsFyu2nWGuEn6aF9zqBFN6xwAmqF1asILNZeJKmt521jzQPCyHHSEj2NYFyI
	AbtoQwsk5yIWOpui5oQFmkSy2GsnJ6M/2o3D0ir1y55350iKjpcNjRmTETz9ItGScb6OUTNJutBEk
	4RB74OIiHj/b2/ebXViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhTz-00Ha9E-Nm; Thu, 05 May 2022 19:49:51 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhR1-00HXun-7B; Thu, 05 May 2022 19:46:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id E54C31F45CCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651780006;
 bh=1u4qe9l+DHtHmHsuoC7WXDiH41P3SfBlsVHP90O4+hc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iUsc7EfC2p097+dI8XIPo9JDk6gX753g0G1/Si2UqCm3ikI747zz/stCNIK6Dpmqz
 P6BHLqVWuG19pE3sJUTgoqX8NbHjh6yg8cu2tXKEukziIva+Y7BkG1LZWgBE3fMQ2t
 502HkgGOGV8vDP51J/YRgaUXYprC9nR4i2QInYLc5wHX/9ZsgvUp+/Q5hMHNRriJ39
 ash6cLkfw5OvlDY86v2jxVxND0LSPmI6gUmVLiLsrqMYFZEJwjTzvX6HLEYMyhuhpD
 JxgTlUZmDEgiBJjniQ50ztDlvHyTlGiu9bKeVSk5VDAaEHWyp5vUISWZUrMs1CA8Nz
 LZOtzseQwk5aw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 11/16] arm64: dts: mediatek: asurada: Add I2C touchscreen
Date: Thu,  5 May 2022 15:45:45 -0400
Message-Id: <20220505194550.3094656-12-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124647_469435_9EEEF86B 
X-CRM114-Status: GOOD (  11.49  )
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
RGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Ci0tLQoK
KG5vIGNoYW5nZXMgc2luY2UgdjEpCgogLi4uL2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1o
YXlhdG8tcjEuZHRzIHwgIDcgKysrKysrCiAuLi4vbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEtc3Bo
ZXJpb24tcjAuZHRzICAgfCAgNCArKysKIC4uLi9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1
cmFkYS5kdHNpICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwg
MzYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTkyLWFzdXJhZGEtaGF5YXRvLXIxLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTkyLWFzdXJhZGEtaGF5YXRvLXIxLmR0cwppbmRleCAwMGM3NjcwOWEwNTUuLmI2
MmM3NDdlOWU1NCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
OTItYXN1cmFkYS1oYXlhdG8tcjEuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTkyLWFzdXJhZGEtaGF5YXRvLXIxLmR0cwpAQCAtOSwzICs5LDEwIEBAIC8gewogCW1v
ZGVsID0gIkdvb2dsZSBIYXlhdG8gcmV2MSI7CiAJY29tcGF0aWJsZSA9ICJnb29nbGUsaGF5YXRv
LXJldjEiLCAiZ29vZ2xlLGhheWF0byIsICJtZWRpYXRlayxtdDgxOTIiOwogfTsKKworJnRvdWNo
c2NyZWVuIHsKKwljb21wYXRpYmxlID0gImhpZC1vdmVyLWkyYyI7CisJcG9zdC1wb3dlci1vbi1k
ZWxheS1tcyA9IDwxMD47CisJaGlkLWRlc2NyLWFkZHIgPSA8MHgwMDAxPjsKKwl2ZGQtc3VwcGx5
ID0gPCZwcDMzMDBfdT47Cit9OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxOTItYXN1cmFkYS1zcGhlcmlvbi1yMC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLXNwaGVyaW9uLXIwLmR0cwppbmRleCBkMzg0ZDU4NGJi
Y2YuLjM1ZDljNTI5NGZlMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxOTItYXN1cmFkYS1zcGhlcmlvbi1yMC5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1zcGhlcmlvbi1yMC5kdHMKQEAgLTExLDMgKzExLDcg
QEAgLyB7CiAJCSAgICAgImdvb2dsZSxzcGhlcmlvbi1yZXYxIiwgImdvb2dsZSxzcGhlcmlvbi1y
ZXYwIiwKIAkJICAgICAiZ29vZ2xlLHNwaGVyaW9uIiwgIm1lZGlhdGVrLG10ODE5MiI7CiB9Owor
CismdG91Y2hzY3JlZW4geworCWNvbXBhdGlibGUgPSAiZWxhbixla3RoMzUwMCI7Cit9OwpkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNp
IGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCmluZGV4
IGExNWU4NGQ4NjQ0OS4uYzg1MmNiMGU4YjYzIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCkBAIC05Miw2ICs5MiwxMyBAQCAmaTJjMCB7
CiAJY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAwMD47CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKIAlwaW5jdHJsLTAgPSA8JmkyYzBfcGlucz47CisKKwl0b3VjaHNjcmVlbjogdG91Y2hzY3Jl
ZW5AMTAgeworCQlyZWcgPSA8MHgxMD47CisJCWludGVycnVwdHMtZXh0ZW5kZWQgPSA8JnBpbyAy
MSBJUlFfVFlQRV9MRVZFTF9MT1c+OworCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCQlw
aW5jdHJsLTAgPSA8JnRvdWNoc2NyZWVuX3BpbnM+OworCX07CiB9OwogCiAmaTJjMSB7CkBAIC00
NTgsNiArNDY1LDI0IEBAIHBpbnMtaW50LW4gewogCQkJbWVkaWF0ZWsscHVsbC11cC1hZHYgPSA8
Mz47CiAJCX07CiAJfTsKKworCXRvdWNoc2NyZWVuX3BpbnM6IHRvdWNoc2NyZWVuLWRlZmF1bHQt
cGlucyB7CisJCXBpbnMtaXJxIHsKKwkJCXBpbm11eCA9IDxQSU5NVVhfR1BJTzIxX19GVU5DX0dQ
SU8yMT47CisJCQlpbnB1dC1lbmFibGU7CisJCQliaWFzLXB1bGwtdXA7CisJCX07CisKKwkJcGlu
cy1yZXNldCB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8xMzdfX0ZVTkNfR1BJTzEzNz47CisJ
CQlvdXRwdXQtaGlnaDsKKwkJfTsKKworCQlwaW5zLXJlcG9ydC1zdyB7CisJCQlwaW5tdXggPSA8
UElOTVVYX0dQSU8xMzhfX0ZVTkNfR1BJTzEzOD47CisJCQlvdXRwdXQtbG93OworCQl9OworCX07
CiB9OwogCiAmc3BpMSB7Ci0tIAoyLjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
