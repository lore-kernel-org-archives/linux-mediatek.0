Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E9FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWzi3wiSHJ/4+Mf/JVducugTf7d2wjk5EhAsiKPtNh8=; b=onwOy71rLcFl69
	4VdiigD+HINjMLZLyMn8t2nmNJBhT8EG3dpouua6jTrGHgQ6Ka07EHTnVrvW/Rft/A7hNTmoTLYHR
	G9X1HG+KsCH0tlrvFF79ECdCNC1rQcvgYivL9Fqzu4q+3otmINNx91Xk92qHc3SQSvNQLfjtuBRZ3
	nnBHs4CvRxB0e7Oj5XPIwIbYQlcPMH2x9EMCOWTesNSZ1bwD5u2aCMlTcnn72oa0xykI5WViRTEV1
	t9JwpiH/10azLbJGN3B+/Q6Av+j4WMKOoSrQ1DFPgj7vchMoJE0ptyWpjBiCR25dIClvEbm5ni6uB
	yfi202xdoT1ybZLUk/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVYx-00DXpC-81; Wed, 16 Mar 2022 15:27:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVLO-00DSNL-JC; Wed, 16 Mar 2022 15:13:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 400CC1F44713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647443625;
 bh=Y+lkLt3+XMMhoecgGOVlam/wNyWF4vFjgKdH60o7wRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nC8i0iJlO1gOtgwmNN1OQxY9rC9ayCBImNW2RAkJfnnRQvjhBpVlUTN6YIYCn/ep6
 PPDO7r57s47zCGcIWxzRTzE/t25MbCWYJOwTteQL5yWYaDleIdM1pZRkvxabiZ8JYr
 xVo36OwcPqIm1Au6t8GcTxhU3ZNOuhouM+7S2uWq/+AR9T5v6tIbyVclCcmPyypfBj
 1i2e6Uav28IgiHDJulQJCS1mpB1QJ+pYye9tjz4oBtP9qUMmPxReJYBVqfmZst/k0d
 5bsvOCyFFcy4h+/nzPGZB8cXP/MyQiL3/iS1naRjL0nI0mWj+j0+5o/Xnm1IacOw/V
 k7GQzWhuHIyhA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 10/10] arm64: dts: mediatek: spherion: Add keyboard
 backlight
Date: Wed, 16 Mar 2022 11:13:27 -0400
Message-Id: <20220316151327.564214-11-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316151327.564214-1-nfraprado@collabora.com>
References: <20220316151327.564214-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_081346_808041_A0DFB1D9 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

VGhlIFNwaGVyaW9uIGJvYXJkIGhhcyBrZXlib2FyZCBiYWNrbGlnaHQgY29udHJvbGxlZCBieSB0
aGUgUFdNIHNpZ25hbApnZW5lcmF0ZWQgYnkgdGhlIENocm9tZU9TIEVDLgoKRW5hYmxlIFBXTSBv
dXRwdXQgZm9yIENocm9tZU9TIEVDIGFuZCBhZGQgYSBQV00gY29udHJvbGxlZCBMRUQgbm9kZSBm
b3IKdGhlIGtleWJvYXJkIGJhY2tsaWdodC4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIu
IEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20+Ci0tLQoKIC4uLi9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEtc3BoZXJpb24tcjAuZHRz
ICB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFk
YS1zcGhlcmlvbi1yMC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1h
c3VyYWRhLXNwaGVyaW9uLXIwLmR0cwppbmRleCAyMGFlNGE4NjljNjMuLmI5ZGQ1ZmQyZTk2NCAx
MDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1z
cGhlcmlvbi1yMC5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIt
YXN1cmFkYS1zcGhlcmlvbi1yMC5kdHMKQEAgLTQsMTIgKzQsMjggQEAKICAqLwogL2R0cy12MS87
CiAjaW5jbHVkZSAibXQ4MTkyLWFzdXJhZGEuZHRzaSIKKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9s
ZWRzL2NvbW1vbi5oPgogCiAvIHsKIAltb2RlbCA9ICJNZWRpYVRlayBTcGhlcmlvbiAocmV2MCAt
IDMpIjsKIAljb21wYXRpYmxlID0gImdvb2dsZSxzcGhlcmlvbi1yZXYzIiwgImdvb2dsZSxzcGhl
cmlvbi1yZXYyIiwKIAkJICAgICAiZ29vZ2xlLHNwaGVyaW9uLXJldjEiLCAiZ29vZ2xlLHNwaGVy
aW9uLXJldjAiLAogCQkgICAgICJnb29nbGUsc3BoZXJpb24iLCAibWVkaWF0ZWssbXQ4MTkyIjsK
KworCXB3bWxlZHMgeworCQljb21wYXRpYmxlID0gInB3bS1sZWRzIjsKKworCQlsZWQgeworCQkJ
ZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fS0JEX0JBQ0tMSUdIVDsKKwkJCWNvbG9yID0gPExFRF9D
T0xPUl9JRF9XSElURT47CisJCQlwd21zID0gPCZjcm9zX2VjX3B3bSAwPjsKKwkJCW1heC1icmln
aHRuZXNzID0gPDEwMjM+OworCQl9OworCX07Cit9OworCismY3Jvc19lY19wd20geworCXN0YXR1
cyA9ICJva2F5IjsKIH07CiAKICZ0b3VjaHNjcmVlbiB7Ci0tIAoyLjM1LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
