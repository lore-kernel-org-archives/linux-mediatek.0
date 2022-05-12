Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D5CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 21:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCGhZ5VAm12o9sd8n28wIUhsYcGrsk1L2ity9wJ3FOc=; b=vyBpC8np1im4+O
	+CfnuhPiGjjqU7zyEZb2lmS6aSM0H8RGXpiw4nHtXueUBu6nqY3JQ1lmyMAD43mvM86Y01XCh7fFr
	ego8oazgNbaB11Y55rkRUGUTibArxQF3tvA9B01PVolcMGT1B9N858MUgLQjEcmEOkSXbi8unkZdk
	abaY2RaTWa4+8nHWUIOdBmgqBDf282bYBKZTAoI6Ctlqj+PWAQ7Cga2vUOR1ruaupZLwKjqQfp0xA
	8JBGOB/VweMe6JyKUF/UBKDx5IrF5x7v3hVbX0Pom2Wyy45eTC4bLcLqWIUOfumzTfJ/HCcvgYtOJ
	iai/uQ2MJ4D06sYEyGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFvq-00DU4a-7g; Thu, 12 May 2022 21:01:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFrV-00DRMb-43; Thu, 12 May 2022 20:56:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 795211F4594C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652389000;
 bh=AvMwfFz84n7mWn1AEG/JaA3AcQAUeEhq/lBH3WEQF0Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MggD2rIG0lKJ4ye2ygbo29X/qSCnndouDiIQk8LR80/qzZkhqeKSsKdoWK5SzkJTa
 zK26AGjZ43qiLEEk7sDIcvqm4FTGDXun74huEVPFt/sSoPkcrUXnhmmW/EpYBW/7XD
 hkvLJK2zTTThug6Ea7UBtop6gyyVWqBwm/gt7ztJDe2b+onPvUx0yS42B/MJsRP3mY
 AlSXhde6ANA2Hi7LpkLHGmc0L7YIefbXPAu+CHlxAE6C8/9wc4V40OC45+K+xkD+Ki
 qknlv9EGR/mIYATzZrWKQga5x3jJ4J/R7+xgCZFt2ty15uHnjGZcVm+2vXD1IvDw2z
 8PauEqfq5sizg==
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
Subject: [PATCH v3 12/16] arm64: dts: mediatek: spherion: Add keyboard
 backlight
Date: Thu, 12 May 2022 16:55:58 -0400
Message-Id: <20220512205602.158273-13-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135641_352438_03DEE594 
X-CRM114-Status: GOOD (  10.28  )
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
b20+ClRlc3RlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+Ci0tLQoKKG5v
IGNoYW5nZXMgc2luY2UgdjEpCgogLi4uL2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1zcGhl
cmlvbi1yMC5kdHMgIHwgMTYgKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE5Mi1hc3VyYWRhLXNwaGVyaW9uLXIwLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTkyLWFzdXJhZGEtc3BoZXJpb24tcjAuZHRzCmluZGV4IDQyZGI4MWU5NWZhZS4uZmEz
ZDk1NzNmMzdhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5
Mi1hc3VyYWRhLXNwaGVyaW9uLXIwLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE5Mi1hc3VyYWRhLXNwaGVyaW9uLXIwLmR0cwpAQCAtNCwxMiArNCwyOCBAQAogICov
CiAvZHRzLXYxLzsKICNpbmNsdWRlICJtdDgxOTItYXN1cmFkYS5kdHNpIgorI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2xlZHMvY29tbW9uLmg+CiAKIC8gewogCW1vZGVsID0gIkdvb2dsZSBTcGhlcmlv
biAocmV2MCAtIDMpIjsKIAljb21wYXRpYmxlID0gImdvb2dsZSxzcGhlcmlvbi1yZXYzIiwgImdv
b2dsZSxzcGhlcmlvbi1yZXYyIiwKIAkJICAgICAiZ29vZ2xlLHNwaGVyaW9uLXJldjEiLCAiZ29v
Z2xlLHNwaGVyaW9uLXJldjAiLAogCQkgICAgICJnb29nbGUsc3BoZXJpb24iLCAibWVkaWF0ZWss
bXQ4MTkyIjsKKworCXB3bWxlZHMgeworCQljb21wYXRpYmxlID0gInB3bS1sZWRzIjsKKworCQls
ZWQgeworCQkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fS0JEX0JBQ0tMSUdIVDsKKwkJCWNvbG9y
ID0gPExFRF9DT0xPUl9JRF9XSElURT47CisJCQlwd21zID0gPCZjcm9zX2VjX3B3bSAwPjsKKwkJ
CW1heC1icmlnaHRuZXNzID0gPDEwMjM+OworCQl9OworCX07Cit9OworCismY3Jvc19lY19wd20g
eworCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKICZrZXlib2FyZF9jb250cm9sbGVyIHsKLS0gCjIu
MzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
