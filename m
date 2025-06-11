Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F92C71134
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 07:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhuOXPN5pzbXggWWg9hnI9xTO7REs2psbwAuBBp5Ivw=; b=YliOKXyAujHsWcpZx4NRgKgcuh
	yYVo3OaYVvJttLer8Kbamg/n7oup0ATtntGecZKFSDbCy9VxOXOdi1Zm280WphM8WnNvWycz7aSMz
	XzN0sn5C+Qeem2AyScJOHJ/NTdFamcgklgEZVpE1pCoaETEx+gVJvIn5Nv3Kr6uruVcJje8H6oQL5
	dYEVex+Zp7OIoBIPbUVz3KNwPLWRALfsk5TRs+Fo3rFwIlI+O2/0WwI38AFli4ChvXDQKeqsiMPqP
	T+kbkQJpUmbYfEKJ+KDIu8d5NU0dWSb9lYPZA0BUcFLWB2oiJlrDLmS1jMXG3rzGP/xq3shCAy7lU
	G32cZ0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFob-000000095S5-3JBh;
	Wed, 11 Jun 2025 07:24:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEja-00000008wwr-1MYF
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xhuOXPN5pzbXggWWg9hnI9xTO7REs2psbwAuBBp5Ivw=; b=OWduCpvZ5f+kq9J4uIcWyMUSoz
	RYSGctp5+7G/WJglV5P+8f+HYwNEBUDGiYfKBczBNjsadOxPgME/VOGPPh4v2inm/e7Nbx/O9lm7F
	P/Qfm/rIfcFwc0fqdBdfY4R3Ey3NLFBnMGbSJb0+Ie46B6NTjabMu2Q3ztamlUQx7YBd2Ib9Kfb1P
	h8tAQKlNxzMQQsUAonZB2IyC4s8ERMbPTth0zVUN6AOeGkgsL4DRTjhhq5vMK/lZh/CWIXya6hucx
	fIhg5Uv02nX3Jn4ADx79S0VMM9dmkkec71fXJgXkucW155KWbSQZgEjdGfRT9epcp8xQE9kGARRg8
	OI8D1xww==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjY-000000027fx-25fa
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 06:14:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so27507f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 23:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622486; x=1750227286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhuOXPN5pzbXggWWg9hnI9xTO7REs2psbwAuBBp5Ivw=;
        b=zn8pR+x3nqhQMuQ6P3JvGDU2VpkwLJPhA4P0h3EOv93K082QhqwligvNePOUOoIFgZ
         AwoVBa4jlIPtRCe1hDslyPX/VW9JOesj+uF5nwO01mCTJ9XOHaBAGLZuCPOPPwD8GPxu
         Q45BLxbiqrhFuKBuQ1ZZ5gnJzh9ArO45Ct5usVJQ2DWfelBbgx+FMb2NO1xaJHyZsNQu
         NdTX1c9ej0NiF2TaBocDD3Zb1LQ3qGLGH93LUB7pQzKysDiTbF1zu1S4yWFs3ikJY4J/
         lVZjU0EaLFmbDBHnl9DEhD507/w2zV+XL71ilqprabF2sWI2FLPdxTPvFh9N6Nn32B4E
         mAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622486; x=1750227286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhuOXPN5pzbXggWWg9hnI9xTO7REs2psbwAuBBp5Ivw=;
        b=GuPurolGGCN3lyKsISRIlWAw48kIl70Q/GG17JMyKbcwpGV5lQi6vMrfbJ5lYLMXbo
         x3VK4fac/O3vcA+svoCoLFAQRzQbtt7OS76ccRvaVJbO/UdP38GlvrDYpUv9lXH7FWax
         a3fjTcftHYMKwNiXd3Re58jdbW6eSpBj4SS8Czkwj5AwoKcT+iYaVgvvMnSk+XBPL8PO
         yQANLCnVptvU/VlsUVOAbk4lINPq4NE/aWsy5vK5qXJjjxf1pozqDW68hCvTCTzMS+kH
         bTatgAU5WasIzVUZsS5jAax0/GdVPr1HMPCR1/fG2UYqaZWjVzuBVEGECqhJ58mpI1vI
         mVVA==
X-Forwarded-Encrypted: i=1; AJvYcCVsEn9U5h9327xsV/HLMjNU5cWIR29McSQ6Do2w+Md3YKwES6brKKn0a3EcOVnWgZYmOOsskmS9A5biOCu5Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzowAZF5P7WccS4txefOzEkZtydeREl632wcuw/SD62bOeT5R83
	FfilbgqRZfC2M4PpxvdyRZuphkbePiewGpHFz+29k1MevflLxwCm8U0vAWslb/bhwbE=
X-Gm-Gg: ASbGncuELxoua0EgIX6C6YfbOIBOLbpESZoa6+0NpJl2mYu+ZVllNjQMIKs9lPAh/nJ
	jjHsyR8XcqmR57oajQxSd7eos13eCOJEG2xtVcuxtMc8HwLf26P4wfcTnG+gMT+f97/3dcXBDO5
	lxtoTkvNP9Bnnf/5G0h64fseQVO4tdlEv8fDd0jYbMnnqx9oinxp0+ffQctJ/L17n3K6i1hH+iq
	6tYcwz+Voom2qiLYVo5JutIDNz8rc6pWPKDvyJmR6JA/n7Zge1acLSqj2XoKGAtlAR1eIM3q9vh
	azqGJQMVPjpCUU0RdHNT6Kcg38RKG7htkpwRTrvQQ5EMT2gFXg+FJUEnhX9LLL8gTLYLe+q4QHr
	3/Fli+XA=
X-Google-Smtp-Source: AGHT+IFoBfGugxgH7Y07c+Z7PgO6Vu533wPz1tMcs2kNav8PQm9ojUKm/KoAc5pG4XQWm3sCZWL/JA==
X-Received: by 2002:a05:6000:2313:b0:3a4:eeeb:7e79 with SMTP id ffacd0b85a97d-3a55881f23fmr555424f8f.12.1749622486357;
        Tue, 10 Jun 2025 23:14:46 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:42 +0200
Subject: [PATCH v2 10/17] pinctrl: bcm: cygnus-nsp: Move fixed assignments
 to 'pinctrl_desc' definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-10-b11c1d650384@linaro.org>
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
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AYNDWesc3V2AvRR7if8AbZFHcfpmPLseFxX/L5QzL90=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6nF3fg9hKfOe+Hbr9Tehw6sIfTcg/RPRBf+
 O4vW+xehwiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkepwAKCRDBN2bmhouD
 1/2lD/42/A7ac2PRGbwiBHKKG8B4x10B4zm84oj9tWoEWjIiNCrieIBnYPrCLjlrhWxBPvOs7vh
 Q+lrPGp0oUPIrfP1V9v1nbsikUqnMGkq/mMlW7Q8ed6lorVeDOnQKirV3EiRcQ32H0rW7hw9XV0
 EAuunpaOtZ2aQWFCsRIIOx9yNCEeluYhDhc8/FTu/ClVL42hwnYs1rT6agYiCKJU0S5qaiWH2gu
 dkuBiRRqX8NsoB4SnSOq8bFtFUyJI2nYBN0mN3kYMQ1TPpCeLty1DLRJZ0aYp7D292HAEPoIAQR
 8Kf9CyOMbUTu/l9PRBhbAq5DbZSxCYgy9Dp4kt2QCKfde38bfmcW0AWiirTSVrWKGxx5UtsJ3O/
 8rA5oBpKlaNI1+mVgQCnfLYKT+oYmTbPpR4BY6mvvkKuql/22PkuV0MyS/aDwaAqPU0svNbfCI+
 0XED91LrVnXbYLt8vWAPYfCuGGPHnG9tOCVRg/T60Rl65gbUXK9h+JVq7sJOhh6pmdSAvpP9P7z
 e5Gk0qCav+Rue6poBOqkCRWFVxO9RgxbxL5ETGIhR2Kmi51H5EBpXIV7rmaI/+6ZZ9Kad+v3rJu
 kCoBZ8gkIVyWqNjLG0L+3huLO43lOyPvxGJycogdWphLagnUoCjJ6JG/UmGNsifVdYPSrAjzJD4
 dcQEUA3glGNzmJg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071448_640390_C28269D7 
X-CRM114-Status: GOOD (  14.57  )
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

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
index eb6298507c1d1873f9d5a90ec724b36af6d4da48..9b716c0d2b9456b9e64ca1094375effefdf4817c 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
@@ -525,6 +525,7 @@ static struct pinctrl_desc nsp_pinctrl_desc = {
 	.name = "nsp-pinmux",
 	.pctlops = &nsp_pinctrl_ops,
 	.pmxops = &nsp_pinmux_ops,
+	.npins = ARRAY_SIZE(nsp_pins),
 };
 
 static int nsp_mux_log_init(struct nsp_pinctrl *pinctrl)
@@ -556,7 +557,6 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned int num_pins = ARRAY_SIZE(nsp_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -589,11 +589,12 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(nsp_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(nsp_pins); i++) {
 		pins[i].number = nsp_pins[i].pin;
 		pins[i].name = nsp_pins[i].name;
 		pins[i].drv_data = &nsp_pins[i].gpio_select;
@@ -604,7 +605,6 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = nsp_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(nsp_pin_functions);
 	nsp_pinctrl_desc.pins = pins;
-	nsp_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = devm_pinctrl_register(&pdev->dev, &nsp_pinctrl_desc,
 					 pinctrl);

-- 
2.45.2


