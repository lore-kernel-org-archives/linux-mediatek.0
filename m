Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09287C5AD49
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 10:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeKeqm7bgqIFmnFmWd/B2Kjnby6+4VCIwEM6NzXgjEw=; b=ddqOeF8DaDJMtfCnbh3K/2OxTo
	OogArYsETvGANWblDjqWRiGWlNeAiRdaiaaTGzg4WqEbbRIq5lIpoLBt0YhDGYgKgEYmY03fYNg6p
	rt3RV/HmhUx/EnMWBLfmUM0BMKE5TUdo20u1NGIh1YTm99ofg35gm1YTukMzg29uYGUtHjBjFq6y4
	9x/Fup09dlCpowywR5rNbAbLEEotJQRdGlgV7rLhJFPPddyvug8SFIb1W8dOGdr2m/2528Al5B6hK
	5VjGgGb8fzNvzGiTctwPahtusGwWnMYMEk9q0wTa+wH8xXeauO8IG+nuwYeME74P6RCvtx81LvmAo
	FTGvKHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEF2-0000000Ct1c-3TiD;
	Wed, 28 May 2025 10:42:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEU-0000000CsQP-2wkt
	for linux-mediatek@lists.infradead.org;
	Wed, 28 May 2025 10:42:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-440668acbf3so4925085e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 28 May 2025 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428921; x=1749033721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeKeqm7bgqIFmnFmWd/B2Kjnby6+4VCIwEM6NzXgjEw=;
        b=wxeaUeK+yHbaAmPbbYrZLqRBA5pvF4aaO17Vl39WPhLPnx4BoQjc7Wl9s8KVWgqyqS
         04ZatDeDuquovQvzPt6kLLijyASTPzqzboxJkFeRYzsJI0wrMCYmELrVP6kgKtPInvTS
         d/d9llqH3esPqbKEv5SgulSq8L6yFHm3MmQdqb3dFkAjc9rdX8VKVJmhJywE8PffXimN
         MRlpFonaVQArscMKCF1RKaPJPsewbokpB08E1Guwp5QLZWBC8erSfAzeE2CTEiEWnqOk
         kph2fqD+DhubqpEmM5l7+hX9JD6pnPy8OQWns7OcvkN2iJPV3Uk489dwlHlFpqckpXB6
         cQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428921; x=1749033721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeKeqm7bgqIFmnFmWd/B2Kjnby6+4VCIwEM6NzXgjEw=;
        b=OEdZEwTqmHERoL4yS/uev1T5aJw4iCFOaIQjhqQCZ7Hw04MHnNblX1V+P1WE0YfZYm
         iTQDy/D+Rk+9h/Mt1c80EPedAVyKMPCR5lv49RCeXp8TkgKXlwPkZiOWZzly3Y1Du0E5
         SQmJ6rXvG5vWgZ7r4hWVNWEGMViRl+gMsdilliELSuZzmA7QIsTpDYA6rPJE/YrO+a2I
         gwCpO8L4Vu9j1OFflvH1ygDJmJVGO0UY2YBdUjEaIifoGNawacbZ75x3hgMoeQXHRPCK
         HxzOsjIsWQxHceIE4JVZ+2/T0YoKIC+lT9UyRVwRUn+L1YcfO7dBdAD9ZDAjtcDqh0E8
         inZA==
X-Forwarded-Encrypted: i=1; AJvYcCVqxTiU+/3694I43P3W+atn/ge7cEyK4dYi7ZSVII+T+EBbtw9K7QjciDvaP7ESqGTPsigzjdJMsW49U5z9wA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPLrex/iGfTwcyPoIc1nDqH7iUMcR4fi998EtN90xAKR3iYwXP
	dfLUip5e1WjS+HVTg2UyAtWdErenY/I9X15Ivr8kijLGCnWPvMA+I1yVVcGnq1unOOU=
X-Gm-Gg: ASbGncumapUqiZtLFORxQODJPKBPZ6lKwn9Qg+fO/cjYngaQOXoaF/HAtXItFREVpQy
	NfDLtQaK6V1cVAd6xLpNQ8ceCtKPL3IHcTLnc+VfzLCCvP4Rb2aWGWYI9nJiHjbVByZfaqjcchW
	D7mWzFWRdKvcDc4iBtyyyjWAZipB87wMQgydWDKVDnQ6jVVXfIR+CBMkk6NuW2LLpnqm5D4i7AZ
	t01pdYfk8s12N1/35Fc/1EkfuuBJfCDZZAN58BDyT3T4YcTRRdQi5O89VP0SwiOJZP5Uim6wrBL
	rGoj+v5LKZmMFl4TBZFYBL0f/Fo68YY74zJec2kJJQdNp1sg/B5+zSLpUAfgG+omNxY6S+0=
X-Google-Smtp-Source: AGHT+IH2RvO3u2jIkhe2BH1+/yJAOhQA0UR42TzWyNNAEDpg/cdMhyD7e03ICGq58jet5YwmI1xsWg==
X-Received: by 2002:a05:600c:1d0d:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-44c934e5f3cmr48727465e9.1.1748428920692;
        Wed, 28 May 2025 03:42:00 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:05 +0200
Subject: [PATCH 09/17] pinctrl: bcm: cygnus-ns2: Move fixed assignments to
 'pinctrl_desc' definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-9-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tMPOIoxmSYTBilMSijclMXxtNrW8WzkiypV3oMPeYrw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhQiRFuBZNM/PyHQB2QGJi215mgTKjmtl1J4
 6O38EUsvPyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUAAKCRDBN2bmhouD
 192rD/98fy4M3wAq2lLrZI16iHbCWibHnzws9NPmcH5NdY6VM7xhLEq++95JNIwB0UKiqe2sWUi
 nR0jKaZVhxwjwEoHgfW3yXkchrYLT4HtbxPM2wXzHTIMNG7qDtvCJDN6RHCbsGZBoarDEQuCk2H
 ZSpG5J0mCHYGWzNcuUMYQPg8wInmjwrNaISZ2c3lFPKzal+YJqOE+78XA0oIU0qNoJX6sWXyufV
 u01win3xK0AMvzXktWiaB//8qOR8se9X8Q/kU83OohrexwKTewmqQGrKCqWvub2qfbqVJs9Lcf1
 g9HWX7C88+/pIBcjjWdDmWRa1DCLypL6Nb8lKQXaFrgAs9z63JSXsuobSuuFvtErz4Q4CQSePjF
 39ee9zzBsbsjRGSNjGTWVJ1RUoBRJI5WZbDvm8wmDGn6N09uesj2pWwa5OnDuM4Q7JzMKY3byGT
 d9cfJoT3IffCKay5oTbaTEipX1AxJL5Ka5JKkQdtV9Fd5SGfyFzzGW0zgMhoOLK8L9eaGOZmObm
 HlL037nJMCk37k2UYML60oXBFFsO5loJChx/GjpfwBoPXLjRPk8PdQnTbwF4gLyNP1zxMSZ/6Yy
 D7h9V/1hVNWGd0B1G9TGQH5qJt5+Nq9SQUlmoG/jyVioHYfTnjhR4QTiy2kMaZpNlU2URVKqZf5
 A3gbDHJkIDwlHMw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034202_948187_592563FC 
X-CRM114-Status: GOOD (  13.92  )
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

Assign 'struct pinctrl_desc' .npins member in definition to make clear
that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 04f4fca854cc05c6ccc75fbcb640b18fcfd37453..23ab3ab064b6f2b0aaa15afd6b9c582f1a1256b2 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -971,6 +971,7 @@ static struct pinctrl_desc ns2_pinctrl_desc = {
 	.pctlops = &ns2_pinctrl_ops,
 	.pmxops = &ns2_pinmux_ops,
 	.confops = &ns2_pinconf_ops,
+	.npins = ARRAY_SIZE(ns2_pins),
 };
 
 static int ns2_mux_log_init(struct ns2_pinctrl *pinctrl)
@@ -1026,7 +1027,6 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned int num_pins = ARRAY_SIZE(ns2_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -1060,11 +1060,12 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(ns2_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(ns2_pins); i++) {
 		pins[i].number = ns2_pins[i].pin;
 		pins[i].name = ns2_pins[i].name;
 		pins[i].drv_data = &ns2_pins[i];
@@ -1075,7 +1076,6 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = ns2_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(ns2_pin_functions);
 	ns2_pinctrl_desc.pins = pins;
-	ns2_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = pinctrl_register(&ns2_pinctrl_desc, &pdev->dev,
 			pinctrl);

-- 
2.45.2


