Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBAEC5B543
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 11:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=; b=ZeBXqAz+fEmFFgTgFFRikh70XK
	mxR4istgyR9k27wMWY3zZTaS800NSDJ1uxpcYa6Hf5JJaifmux5p2sdI+7M1b5W4mz8fiJR3Hkd58
	YXj2m/n0XuY6f2+47FPitBVlWaZqWSzNaGz+KYmnz/vuRPLvrwpWdAE7QNgIJFHOD+GeU6QGpk/JD
	ofevJg9PL9DuM5fvqTY7ERJpDeSR4fzwEba1mj60SfgDVA1ayWnd6XEbOKyXDeHRVe0i1vSufnoZ6
	OiNSmj9/GmtE3tnwR46EX1DoVLtOnreoahKj44KRaVmdtLV4nNhkqRiDam7ZTC7QlI3OeYqCKQB1B
	xfEL11zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFJb-0000000D1UC-1sY4;
	Wed, 28 May 2025 11:51:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEo-0000000CsmP-0E0n
	for linux-mediatek@lists.infradead.org;
	Wed, 28 May 2025 10:42:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-442cd12d28cso4688745e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 May 2025 03:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428940; x=1749033740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
        b=AsqDt89vc/+c/53xb16YmDoDD1Jp4c7BG3xJm1Rmrtj5SmHdQ2lIZcFpgoqw73V/YR
         NqW+7knUc5A6UKPC4yD4UYun+GYnDIyCuVcjEHRUrq0Na1fvtPSMFT5B+ffoht47i6aB
         t0dw16GEL1NbxwRQW6onkM0qwU6MdH9l6LWhTXjkP4SpHUdZ09kBhucLlvijC6Z0ABgZ
         3Wu4lxK4CbX5QaSkg8U1UG+PHy5Z43iKVdJMtYjV9JZ1T6g+OaZu4A+ca0uVoIVtPxwa
         5ZboWMSC2O+pcY6216XNYdH7MwZFI+eZc+oKtjH8CtdbbmMVs0ZLQ68YEsXUNwfbZqDh
         Iq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428940; x=1749033740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
        b=Sh+whb5nyhJpq4knLxEB0PtUUpAXuoOdIv4uq2zYTx//FSt1QZ8+AxN6Pspvj41BBa
         kaOiwy/4Yt1tEDtYtWjWKqbYH3fOdXBaOid/kkM1Thc7RmxeasERSk9shrpZ3ZtnmHsE
         2XYExNR5gjvd9GtfJnCEicYvLKrTwoYtobcHddhWBqMLt1uDKlTeoe9VZOQn+ybi0f2x
         ylTU5aCHbiCEva62nvcYJC2ewFhfhd/H8tzm0GHpvT62pLpU++ldEVplRTb9pRjD4sma
         TcYqcmLABo0bUZPdABtbtVjkVzgmfIO0oZl8J2y/1HTUbjliYJ90lFJyDfI/1mtNb5Qk
         522w==
X-Forwarded-Encrypted: i=1; AJvYcCUSLJw2szWLj9AlbLwS1uaU/085SF66tV/DNuw/1X4iEn5edIeyDDA6bLWlx4QOGQO/mHbedXVD/SctL0sq9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuIXbssWFX2BYcj2oE8Xl7No6KMe8C4VWy23W6WfLSBXnQXUWg
	A+MdhYe/mjgJZFm2fyogUol1euhRykAQtVWv/wW2+HDQsiPUNfp7LYRlWRDi8Pmmr2w=
X-Gm-Gg: ASbGncum7Mirku+dh4eVHr9C+E519oqrmBkp8HL8CCtkt6G8mjD9iDXmbNMLE4XQjXq
	Z6o1A7v9QaIBlz9qBmE+AH9m4doTfxEuHXU6epNkxdZ/ukmvZHdh0x53Sm+kKSrstZqludQGEpV
	5WtwZK/TxQ4GMExDjG5oSiMwbOMC8O2C9wbWSi1JxLLTluCmgMchiPEyfo4Q1omRBnLSDoM7SIC
	xnM9YR5RDB0kuNcRibDIovyyLBt7HAqz1x4Zc7Nx+SD39Jj/S3MuBOw7Qt/a+Dl8sphdnwFexcE
	hUmIEVrBqAZ/R8C0oTmJmjY0r1PMcFiFT+51G9I2X2FhcAuu1Tca4JUh3L9iBXzXm9RLMUY=
X-Google-Smtp-Source: AGHT+IGOjiAalYWBzwElbSsmEX9f/2Y60O5w2k0gf1phaTpGJUJlpjPJvNra7B8bibqFA+SG8s+3FA==
X-Received: by 2002:a05:600c:1385:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-44c954e5abbmr50075875e9.9.1748428939845;
        Wed, 28 May 2025 03:42:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:11 +0200
Subject: [PATCH 15/17] pinctrl: pistachio: Constify static 'pinctrl_desc'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-15-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhWkTbDlacFgpFnf1vgJHMFlUPFeOl/ORR9m
 JSbFDyczmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVgAKCRDBN2bmhouD
 10W9D/9xIbBzH6McgFf7kxs3Wz0pkjTxc7iD6YAhHueVZZd1gP4kz2jdB6oiJdWYbdcvCTsO0Jb
 1M1uQI4Y+F5z9nhOIsSCZcbSEa8uYgf4mTdPeZejnHLZuN+XRE4q060VzMPM+0E5ffmjbSfdguv
 jUGo/ReQL/VbQR3GL3x3Sq+TYjMsUO9HwZ74ot0fnqvUDfwONwxm9Ia8eDAmZA5wOjtSqLldzqA
 nmcrMY8YYR++DoVRbPTLeb38zzchZ4+VQga+QK2Xjpm5Q2ybYvHN4lWRbyLvHLzodyGtm+9vfTG
 jar0yvgxFJxSt43uUsQQD2kiMQ5Wo/A7Gkl/g1mAoDL86kviDaDexYqAL6QM34oxF62djx6jTYo
 t1J67a9M34V59n3xE0FqQ/zITEuVNEP6mBzPXgRbusg8xO3mZGZyyCZFaz5TfC5GMy213jvzS2G
 /BQbvzGMIvKFcEJltkEesVBc3dhPn4j3T53KxDzwq0XR8/qrHK/24e3XCpaCpkP47HtU4IkGhtt
 LDzr6uOse1tliqhZHHOz+JMmqt+JgE2zu0h7xaqEXEV5JClvnbxo0LIz2LR0f7hnbRC//FKZpon
 bEVmb4R9Sw2nd4OuvK7aG4+5drtYGMTyYELEOHkaxIcGob6OxTK6E/vhm3q31u90R4Dyb3LEcPB
 i8N0zohII+TfZBA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034222_328088_F80F023A 
X-CRM114-Status: GOOD (  12.27  )
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


