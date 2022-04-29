Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139DBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hGCYEVbAB3RYbqJqdW2qfNqwoEjH0YEMrbpWOfLoVX4=; b=HCt1BH1uSiIC3g
	NUJWBcQX1PH5feDeVy/+XdMESeQS1t5yVrgbfPD1tnQQMUcqGln6YfMYZVwN1DHN81UPRsCkAY5T4
	Xu206Pg4ah5k7JsM77v0srqo1cLXnD9rHr5sDsO7LNcQCxsnAd9f5t+Uwv+MRgoZylXDBcmSds/yS
	FkKs4cTodFHXEJ6lW/AlJVQKsvGSGnbfg4nt06WD1wahQO+hSIzdj+bV4j/mLkX0uO95O/FGMefeU
	gm4//GOg6qE3jSrWgYqM0eUDiJVKrGAlgmG5W/r15AjCCv9MRYOuxVHrhhyYlhjWyERRaEbgd9Pa9
	IOuREIJy+3f54dTIAWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXGY-00CVRG-Jg; Fri, 29 Apr 2022 20:31:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXGM-00CVNP-Kw; Fri, 29 Apr 2022 20:30:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id F0F751F469D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651264248;
 bh=kAsfuPsvXs/HN4ujTEF3xFYlYjDqLSK6UGr16SYdfgE=;
 h=From:To:Cc:Subject:Date:From;
 b=SzxGQcTxE6k2qTzzReHyLAe7jlJlmUGpQNWY3a7V6pXaK2tuz1vZS/4RJOREQKhu+
 vvIaaf9iFOYFCa51RkzPCWdRokKr27OFqStuzo7CCpSIGCLleJb3CGdUKnqoJMeNWH
 7inbr2ODyd+mR2fHnmYrohMxSdY5Q4TX5mFOgOZsZakXkuwQjLq7chiwpa3XimSxRU
 75RZ6J3mY0bnIY/RnYFT/getYOg+WDq2hTDd6i7MnJ0nV+g9xkZqc0oa98FQKQJ2H3
 YW6t3q8FTaV520N6M3TwEEmoviL/E1fKeRGkZJ6dGJukNSy/1WIezg8llGzqGMn7Ks
 9EKwLw8K1XAgw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Shane Chien <shane.chien@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] Add missing dt-binding properties for audio components on
 mt8192-asurada
Date: Fri, 29 Apr 2022 16:30:36 -0400
Message-Id: <20220429203039.2207848-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_133050_855766_815A79F6 
X-CRM114-Status: UNSURE (   9.31  )
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

ClRoZXNlIHBhdGNoZXMgYWRkIHByb3BlcnRpZXMgdGhhdCB3ZXJlIG1pc3Npbmcgb24gdGhlIGR0
LWJpbmRpbmdzIG9mIHRoZQphdWRpbyBjb21wb25lbnRzIHVzZWQgYnkgbXQ4MTkyLWFzdXJhZGEu
IE5hbWVseSB0aGUgaTJzLXNoYXJlCnByb3BlcnRpZXMgZm9yIHRoZSBzb3VuZCBwbGF0Zm9ybSBh
bmQgdGhlICNzb3VuZC1kYWktY2VsbHMgb24gdGhlCnJ0MTAxNXAgYW5kIHJ0NTY4MiBjb2RlY3Mg
d2hlbiB0aGV5J3JlIHJlZmVyZW5jZWQgYnkgdGhlIG1hY2hpbmUgc291bmQKbm9kZS4KCgpOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyAoMyk6CiAgQVNvQzogZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBt
dDgxOTI6IEFkZCBpMnMtc2hhcmUgcHJvcGVydGllcwogIEFTb0M6IGR0LWJpbmRpbmdzOiBydDEw
MTVwOiBBZGQgI3NvdW5kLWRhaS1jZWxscwogIEFTb0M6IGR0LWJpbmRpbmdzOiBydDU2ODI6IEFk
ZCAjc291bmQtZGFpLWNlbGxzCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
dW5kL210ODE5Mi1hZmUtcGNtLnlhbWwgIHwgNSArKysrKwogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NvdW5kL3JlYWx0ZWsscnQxMDE1cC55YW1sIHwgMyArKysKIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9ydDU2ODIudHh0ICAgICAgICAgICB8IDIg
KysKIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKLS0gCjIuMzYuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
