Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E53C677C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 06:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=; b=IDHBqggBbqQFvBUyWo9IrFAQ2t
	0hzW6ToHJqke/LtKH+wyK3CnRkDdJqFEc6icJXaUHWSjq5pwOE7SQBiVvIql5g95TNQFPICNLKXox
	hDBYm1fdI1BRw8RQe/zl+s3PEc7Hlf8Qsn4CY25omPFsKAZ9GSuvGsaDn3qsRDG7c8b32U5n+DmvT
	GHz1xoewSqCnO10t7Aesaq9rrEK7QmcxfGZCwO4RPQA8YsdNpIC1P7l4SJ/vzvvpPWIpySrvNusJD
	uuSFjjK3qBjDgmUwc2oFmioVUiZpP5XvkwvBlZXWLdbRpPcfFfqh9hT8W0mjyJDSD0Wfns0heazKo
	YMAnBT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjt-00000008xIg-0syj;
	Wed, 11 Jun 2025 06:15:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjr-00000008xG2-278b
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=; b=lRnx6mhEi887H2FszN5kDP5j4N
	ELY6V5/uCwW+60NZzUondldk3tWBLZHqFeXosaTDMtikVGrB29bScYGhXrNhJZbodruo27p5AWWf8
	trmlzryD4VCro5PvOw0EOj52OBAwzPyQaHz9A5wFVNuQci7FbE/i2M4ufQhimAPaAhUBzsW1Xp8RR
	bzHuRNlYe6GFYRDKKGVl7QQSs5Kc/OTPrxIuamL0TX3K2x88K42lUOscO3gwZNWCOBQ7zaOmvJE+C
	TzA8fMVgJibd3sRcY0Wf/T7h3BhSLpT440sN00WX8L1xFAQKTdjbfEoZAVqLNt4T8sVwpQ+n/miE1
	1oyXOJCQ==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjp-000000027ko-1rp5
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 06:15:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4e62619afso22970f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 23:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622503; x=1750227303; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
        b=JzF+yEftuEAgURd51S5FJU7zIIDb6qn5Nw1laJJGgzR2DPVjKFGA2wZzLqPvuTpsna
         B6GtkfRT6/Wh7aJK6XfSk0z63VbSWeR85gVWnYdcidrY14jEBtcUZMsChOYJrJ9jsTN3
         cfsieN4cZrFGOcD+hSGoXq0XQanDJEkJCDn+0imKeXe8RCh/DVHSh1H5TZHafJEo8AqZ
         VsnewwkTOmAZrgzdGXO322mC4G3q4bjdr0T/0+1dQcrqUCRnPjyJC9nBoKdqokwh1X06
         IiBXXS03nVWQUKnQ7c4hv2vkg5h6qXLQnaqapGeXHuTd6zE+TKthWLIvqCZiYvjcPdnT
         xizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622503; x=1750227303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
        b=KQMY1m/XFpmH1sp/i43ibVyuRHbxN9NfIMySh9IDvaxe3j4pDJNtFkTvea09cvzAzQ
         qRRo+zXVTlhUrG4VCJC00zwYQLXhgZ/KCU0z5xqMXePgk3VPNA+dHPX8ToNWCfX8AdFN
         CoFH0SemLfESOS9TPWDCkll+Sc5ogrS/POasALc221/inHevqav2EMEotNKK+PRlsh5S
         K2bqWxUrJ11cnXC1LOTNtIPGJm1Iro2fKpTYkkDXEqs6RPMlptYSi3DJvnHB1AI4Y2SH
         K7WxaRiv5rJRMbg5/k5VmGgqju+h4RNgvS49SnlBTnfJvJkc4bUx6MZ5A08g6IyBjvQn
         pl/A==
X-Forwarded-Encrypted: i=1; AJvYcCXesq68/la6OrsRD5bTtKkGDTIsXuc/0JfxrVJnINu3Dpc0nWAAU12uCV1oHrNQJba1u1Qps1OaJC7cf/9jGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCopZciCO0s0w4/q/syMcmy7Uxq/SCQN92l+UgUAkzKeN0l7Ua
	gyveCE1DRXW/AwabnpBrnxwxOkD0xV8EcZXiKYPG4aAG7z4Ly1E28gK9eO6kbVZdJ/Q=
X-Gm-Gg: ASbGncs4Pc0Lh+NaI8Wn3FzARj1cd1KW7PTsToQY7QtzgJuCyZ3HFHQXfmrPM3H1YjP
	ULL6aOBgtZ5LpY4NnSbBfB9VuwV9OkyIxUrDDWAWFfeScQmGpBscmINS6pclxM302BagJVsgCox
	FDuT/25Ip06b90OYq84a81WZstDphJQjQZfkyEdcm+dSEZfiAs7MJFkm86y47Hmuv2JiCakWcy+
	XVFE42YWU4rEMopZGkjSX1KekM+o/evzxL1zv0QNGduC+pP1JhlqdS2J6it6JGRIJRKuiCnP8we
	ueCesAZi4+gTeCmPCT/ROWYLED936isRWgb8jvPOnsh+m7GtHUdVu1Ex+7xYuBad7gZwd2NBEoy
	0OtNBxl0=
X-Google-Smtp-Source: AGHT+IFam/Q8ke2FDO4E1F/HTitp0FP+gKJ3/gukW0/Bc+eEcP61V5NJDu4WYFt0kcJQLnkHsxn5Qw==
X-Received: by 2002:a05:6000:290f:b0:3a4:dbdf:7152 with SMTP id ffacd0b85a97d-3a558827131mr510215f8f.14.1749622503270;
        Tue, 10 Jun 2025 23:15:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:15:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:47 +0200
Subject: [PATCH v2 15/17] pinctrl: pistachio: Constify static
 'pinctrl_desc'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-15-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UtgeU3dDjW57LMOT846YXV02Tw4GcYGErdMblZiJj2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6rl3kHrTfHT+G/WppDKwo9ZAF99RmPNy2e5
 FK25/IXhjOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqwAKCRDBN2bmhouD
 11zjD/44mTi6E0UEUF+WOA5PYfQSA3YrJhhb1gdB9LJEaYmqZ5heGdhEkd11b9u21M9uM04L2ZM
 omR6mvdKQb/PUr5s6pB4c+fvGy+edBch7wENWeAZTNkmTv3ucsbHEXczrgo33adLBv5AsrWXetE
 4z0tcvt9p0PZIwyoJuxHwgjWE3/oYJIHyfJmzOYXZdd9kRuIIYlBE1K97q/hOmQ0VG5MfdaawBc
 /Ld6CQJ8SRFCASzKJe+9jRrxsHoSLW/JCnoA0ZQFUq+Yf670EaZbzi3k4udIwkie9Hv1PUhPzQL
 loPBNXTxubGL5cnqEnKpoMKPSeage04tUhOnjnUQfZX+m1dUP2EK30OskgV/e+PJGji5xsLvoEE
 AzTFaWnBiwlGVii8+4/o6VagcwsLWxudJ/khpn3Bp9gnvjFXoYjtATT6dIL3qzKWKZIqaFO0ZNl
 898lFaYQS0Zi13pQngS2Vv880F3sQ36GsZjqEpZUXgHMDR2vprhGNNcHLTPoEkv3tOUFo7davtm
 vdJl53vfkJM26COh8m75lKvxQnXcCBYW8zSUYw23DN4X/qtIPpGhEyuNQlUDiE14kSOsydQ8l1V
 72P5Y2/V87/GZfYMvLdj5X6bDG43/wT//B8GiRvoSxrL/0k6zXQudwTV79njlMNb5+Yxi83QZqi
 f/UtiAkNVB3+pSg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071505_641827_E2E57826 
X-CRM114-Status: GOOD (  12.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety after moving .pins and .npins assignment to
definition.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-pistachio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index e7bf609609617d6af2f10a3df56c62e3bfe2dcd3..7f8b562c81c9cfd1ac3a0bd50018857450bdf609 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1156,11 +1156,14 @@ static const struct pinconf_ops pistachio_pinconf_ops = {
 	.is_generic = true,
 };
 
-static struct pinctrl_desc pistachio_pinctrl_desc = {
+static const struct pinctrl_desc pistachio_pinctrl_desc = {
 	.name = "pistachio-pinctrl",
 	.pctlops = &pistachio_pinctrl_ops,
 	.pmxops = &pistachio_pinmux_ops,
 	.confops = &pistachio_pinconf_ops,
+	.pins = pistachio_pins,
+	.npins = ARRAY_SIZE(pistachio_pins),
+
 };
 
 static int pistachio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -1474,9 +1477,6 @@ static int pistachio_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_banks = pistachio_gpio_banks;
 	pctl->nbanks = ARRAY_SIZE(pistachio_gpio_banks);
 
-	pistachio_pinctrl_desc.pins = pctl->pins;
-	pistachio_pinctrl_desc.npins = pctl->npins;
-
 	pctl->pctldev = devm_pinctrl_register(&pdev->dev, &pistachio_pinctrl_desc,
 					      pctl);
 	if (IS_ERR(pctl->pctldev)) {

-- 
2.45.2


