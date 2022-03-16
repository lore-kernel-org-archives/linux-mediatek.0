Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXX6DMWbZfRoylAl1UKW+6iToESe7xmYCAHyvtq1ldk=; b=C1+V6bCNcAgdHI
	HXR2e109a8Mka+TgxuPi+UDmI8SWYHiMtIVDo2W8BOe4Y+acmCUmamr2PV0LT90OepIBFiauJZySf
	aT9V0xoZy99r1CLrv4WUx10aLm20qljpP6JuxpYFDxEd+5+uX7ChpQZcJnntjnd/b4r5tE4BnQwZv
	e3Tz4b/a+kr9JCEzMUdD017oQB6TURh96ikG0TG8zI/Q6zMicEdKPHaWnTx4lsNuXDLoEkQaJ8GNU
	q7XzRZCYbUJNUzkpRT8ykCUduT1mTNVydLB32h+ABrl0KeIkAs6SAxMfzlmEpRuIJup2yM/Em7QDX
	62p0HxvK+isAoa+Xf4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVYz-00DXqC-DS; Wed, 16 Mar 2022 15:27:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVLN-00DSMD-63; Wed, 16 Mar 2022 15:13:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id DF5CA1F446A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647443623;
 bh=W2MR9JRQeWd3Gd2gjq9LLXv6OCGWn1HG5Yfu70CzhFo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z8EbRb6+7S3l8ZQ9BS1lCOzIh2eKSg06Y+KAhfn6SXeoJZWKOqdlVwZIVTgOHJwUn
 OSMsikWLNyZjbrphJYBKnt4OWn40JDFptSEx1n9gD6n9VyBzwLrHcgol2QN1wuJX9F
 OwtBWun4Sv6A7M+KdLybc1nrq+2QhqOKLAQCTcMSkllJa9Bk/1RSyy6d4ljRX3eUNW
 O6r8pZuprjZLvr6pIW7ijgPxcZxNlY6tj3xNoj20VovwBYygz/qnPPPhQIEm7KjSat
 e7vutsa/t0HlPFr9xR3OsMj7tf0SNmFI5tbq486WGzjlc24HTxmlC+vGOJH5xU8LQ+
 SudJPEp4spa8g==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 09/10] arm64: dts: mediatek: asurada: Add I2C touchscreen
Date: Wed, 16 Mar 2022 11:13:26 -0400
Message-Id: <20220316151327.564214-10-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316151327.564214-1-nfraprado@collabora.com>
References: <20220316151327.564214-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_081345_418362_44AC8F61 
X-CRM114-Status: GOOD (  11.41  )
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
IC4uLi9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEtaGF5YXRvLXIxLmR0cyB8ICA3ICsrKysr
KwogLi4uL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLXNwaGVyaW9uLXIwLmR0cyAgIHwgIDQgKysr
CiAuLi4vYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSAgICAgfCAyNSArKysr
KysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLWhheWF0
by1yMS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLWhh
eWF0by1yMS5kdHMKaW5kZXggZTE4ZTE0YjEzZDYxLi4yMmQxODdkZjE0MjggMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEtaGF5YXRvLXIxLmR0
cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLWhheWF0
by1yMS5kdHMKQEAgLTksMyArOSwxMCBAQCAvIHsKIAltb2RlbCA9ICJNZWRpYVRlayBIYXlhdG8g
cmV2MSI7CiAJY29tcGF0aWJsZSA9ICJnb29nbGUsaGF5YXRvLXJldjEiLCAiZ29vZ2xlLGhheWF0
byIsICJtZWRpYXRlayxtdDgxOTIiOwogfTsKKworJnRvdWNoc2NyZWVuIHsKKwljb21wYXRpYmxl
ID0gImhpZC1vdmVyLWkyYyI7CisJcG9zdC1wb3dlci1vbi1kZWxheS1tcyA9IDwxMD47CisJaGlk
LWRlc2NyLWFkZHIgPSA8MHgwMDAxPjsKKwl2ZGQtc3VwcGx5ID0gPCZwcDMzMDBfdT47Cit9Owpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1z
cGhlcmlvbi1yMC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3Vy
YWRhLXNwaGVyaW9uLXIwLmR0cwppbmRleCBiNTM3MmNlNmJkOTUuLjIwYWU0YTg2OWM2MyAxMDA2
NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1zcGhl
cmlvbi1yMC5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1
cmFkYS1zcGhlcmlvbi1yMC5kdHMKQEAgLTExLDMgKzExLDcgQEAgLyB7CiAJCSAgICAgImdvb2ds
ZSxzcGhlcmlvbi1yZXYxIiwgImdvb2dsZSxzcGhlcmlvbi1yZXYwIiwKIAkJICAgICAiZ29vZ2xl
LHNwaGVyaW9uIiwgIm1lZGlhdGVrLG10ODE5MiI7CiB9OworCismdG91Y2hzY3JlZW4geworCWNv
bXBhdGlibGUgPSAiZWxhbixla3RoMzUwMCI7Cit9OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCmluZGV4IGI5MTFmNGZjMzAzOC4uNmU1YzJm
OGZkNTkxIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1h
c3VyYWRhLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1
cmFkYS5kdHNpCkBAIC05Miw2ICs5MiwxMyBAQCAmaTJjMCB7CiAJY2xvY2stZnJlcXVlbmN5ID0g
PDQwMDAwMD47CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKIAlwaW5jdHJsLTAgPSA8Jmky
YzBfcGlucz47CisKKwl0b3VjaHNjcmVlbjogdG91Y2hzY3JlZW5AMTAgeworCQlyZWcgPSA8MHgx
MD47CisJCWludGVycnVwdHMtZXh0ZW5kZWQgPSA8JnBpbyAyMSBJUlFfVFlQRV9MRVZFTF9MT1c+
OworCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCQlwaW5jdHJsLTAgPSA8JnRvdWNoc2Ny
ZWVuX3BpbnM+OworCX07CiB9OwogCiAmaTJjMSB7CkBAIC00NTgsNiArNDY1LDI0IEBAIHBpbnMt
aW50LW4gewogCQkJbWVkaWF0ZWsscHVsbC11cC1hZHYgPSA8Mz47CiAJCX07CiAJfTsKKworCXRv
dWNoc2NyZWVuX3BpbnM6IHRvdWNoc2NyZWVuLWRlZmF1bHQtcGlucyB7CisJCXBpbnMtaXJxIHsK
KwkJCXBpbm11eCA9IDxQSU5NVVhfR1BJTzIxX19GVU5DX0dQSU8yMT47CisJCQlpbnB1dC1lbmFi
bGU7CisJCQliaWFzLXB1bGwtdXA7CisJCX07CisKKwkJcGlucy1yZXNldCB7CisJCQlwaW5tdXgg
PSA8UElOTVVYX0dQSU8xMzdfX0ZVTkNfR1BJTzEzNz47CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsK
KworCQlwaW5zLXJlcG9ydC1zdyB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8xMzhfX0ZVTkNf
R1BJTzEzOD47CisJCQlvdXRwdXQtbG93OworCQl9OworCX07CiB9OwogCiAmc3BpMSB7Ci0tIAoy
LjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
