Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9693AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 21:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8MpsrupKukcVasOGRwYoeqSrZkHTqIpRxKNNAg1+5w=; b=N04kvYfAhrOEUn
	1DWVj39MzyZsHJHA6haagOEM920l2tbXAA6dQNt98AqIgT/UMt/+7vABveXoeH33cwzK7ubbuvpAJ
	RupCplnm+WMQ3RrJ/Qun8GrX5ncOqrbISd7FcwcywzTY965+8AHNBlqjFSSGVjxjnkV96GuvYldah
	EU3OOwlTqtPFrMV9kLeIDaohtGYrOSdc3ygwSD8gi+4MEZz0qaVYoaeb+u6QeM2o256UVegphXp7G
	mRaJlLWTEd3y+VYMUa39JDl95vAV2nGMa8YUbgLPkVZsIEVtZ0JFenjjpSkVLMzZSMy8mIaquUApx
	pbhuA82Zrf8S1r+GSU3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFxg-00DV7J-4y; Thu, 12 May 2022 21:03:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFrb-00DRQV-2d; Thu, 12 May 2022 20:56:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 7F2681F45AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652389006;
 bh=xtfilwAIz+kMj8zKckclhyx6wIdcdbRqk0LZq8rnQiA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Abu7N6UN4djRf/QA0Fn7tWwjX/sAtenySEuU9whrXjRORmTGZp/ZL1nNoOXWN2Yum
 tP4ONGcRvmo4hiIvCMzCtakmZvNtMivAmMsFzhFGyoN0tNL31oovKI7HzvrkvOnIY4
 CppJfqkIqV3dFmgV80Nyeo4agPTE+WtXG+Qw5AoChe3QgG5sSMAJsXNmdOBuRW5uLC
 dl4cdpIM0zfXx3pwNMJ0s27/zdhNTZdcOmnxiq2jJknl2Nl4xZ+ZlK3j8SIVvdHrUx
 5xKePN8uXpF7L6f05wmdQFv9HcM+KLqVJu+hpICh1DC2jlSB8wM8j+KpL3hWaqFbkt
 u0xqCC6as48Fw==
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
Subject: [PATCH v3 15/16] arm64: dts: mediatek: asurada: Add MT6359 PMIC
Date: Thu, 12 May 2022 16:56:01 -0400
Message-Id: <20220512205602.158273-16-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135647_289987_C38A3BAD 
X-CRM114-Status: GOOD (  11.35  )
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

TVQ2MzU5IGlzIHRoZSBwcmltYXJ5IFBNSUMgcHJlc2VudCBvbiB0aGUgQXN1cmFkYSBwbGF0Zm9y
bS4gSW5jbHVkZSBpdHMKZHRzaSBhbmQgY29uZmlndXJlIHByb3BlcnRpZXMgc3BlY2lmaWMgZm9y
IHRoZSBwbGF0Zm9ybS4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxu
ZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVs
IFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+ClRlc3RlZC1i
eTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+CgotLS0KCihubyBjaGFuZ2VzIHNp
bmNlIHYyKQoKQ2hhbmdlcyBpbiB2MjoKLSBBZGRlZCB0aGlzIHBhdGNoCgogLi4uL2Jvb3QvZHRz
L21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgICAgIHwgMzAgKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKaW5kZXggZGRlNGRlMjdlYzYxLi5h
NTNmNzM1MmYwNmUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTkyLWFzdXJhZGEuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5
Mi1hc3VyYWRhLmR0c2kKQEAgLTUsNiArNSw3IEBACiAgKi8KIC9kdHMtdjEvOwogI2luY2x1ZGUg
Im10ODE5Mi5kdHNpIgorI2luY2x1ZGUgIm10NjM1OS5kdHNpIgogI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2dwaW8vZ3Bpby5oPgogCiAvIHsKQEAgLTE2OCw2ICsxNjksMzEgQEAgJmkyYzcgewogCXBp
bmN0cmwtMCA9IDwmaTJjN19waW5zPjsKIH07CiAKKy8qIGZvciBDT1JFICovCismbXQ2MzU5X3Zn
cHUxMV9idWNrX3JlZyB7CisJcmVndWxhdG9yLWFsd2F5cy1vbjsKK307CisKKyZtdDYzNTlfdmdw
dTExX3NzaHViX2J1Y2tfcmVnIHsKKwlyZWd1bGF0b3ItYWx3YXlzLW9uOworCXJlZ3VsYXRvci1t
aW4tbWljcm92b2x0ID0gPDU3NTAwMD47CisJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8NTc1
MDAwPjsKK307CisKKyZtdDYzNTlfdnJmMTJfbGRvX3JlZyB7CisJcmVndWxhdG9yLWFsd2F5cy1v
bjsKK307CisKKyZtdDYzNTlfdnVmc19sZG9fcmVnIHsKKwlyZWd1bGF0b3ItYWx3YXlzLW9uOwor
fTsKKworJm10NjM1OWNvZGVjIHsKKwltZWRpYXRlayxkbWljLW1vZGUgPSA8MT47IC8qIG9uZS13
aXJlICovCisJbWVkaWF0ZWssbWljLXR5cGUtMCA9IDwyPjsgLyogRE1JQyAqLworCW1lZGlhdGVr
LG1pYy10eXBlLTIgPSA8Mj47IC8qIERNSUMgKi8KK307CisKICZwY2llIHsKIAlwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOwogCXBpbmN0cmwtMCA9IDwmcGNpZV9waW5zPjsKQEAgLTU1OSw2ICs1
ODUsMTAgQEAgcGlucy1yZXBvcnQtc3cgewogCX07CiB9OwogCismcG1pYyB7CisJaW50ZXJydXB0
cy1leHRlbmRlZCA9IDwmcGlvIDIxNCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKK307CisKICZzcGkx
IHsKIAlzdGF0dXMgPSAib2theSI7CiAKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
