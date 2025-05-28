Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF8BC3ABB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 10:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=; b=oZW2WBBZJW1SV6uBSVwhTYZFC+
	cw9z+5LBVF875ILq7K4SJJCQUX451p8sizZ1/m/+TdSK1rExyDXY8gN9jDidS/JtPHW+vAR19SZbS
	xA6/AeQcsK1nNlGo/3gspNcKP93NOvqtj/dPM+SHSEgBRlTokkmB/aydzR1fpNVKQZ8rVEzsZzpfi
	iQ30yAqi+Uz2hoko02fzzlv7DkbW6mtM/2KnLT4aXQ5s3m55mIlc3E9snksWW/50ErCOoYCKmp7nB
	+gWVFAZvD81tAaj3E84G5p0so19iFdIHMkGDou34eTglyLkSswdiVwO8pE275AhqLZAxJnpnjMXxU
	5E7hfqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEF9-0000000CtBU-2nwD;
	Wed, 28 May 2025 10:42:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEe-0000000Cscj-1RRr
	for linux-mediatek@lists.infradead.org;
	Wed, 28 May 2025 10:42:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-442ea0b3b46so4584475e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 28 May 2025 03:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428931; x=1749033731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
        b=tT2TNM0P6NoPgEB+tkKJPZIabSZP2CAJ9q6kS0kg8Z4aNftlWA+rt4s1cWD0WGBrp1
         6p6oV2LcJSs83R+w3idwLKv8LJ2ZsKNVVsUWl13hSW4O4Mzjpjd59uVpKrOIVElZfkDk
         9amCuvaPX5rwxlFiqTroCBHOTwCib8oYDo9AMh4GQX+INr8SS7s+jrPuQfH7gHY0iwjd
         quyCDPX5v1SiBciDxkieSH3803X7hQUa+JD9bxe/vWegNxi08fdf2T/jHPEhOe01ORFE
         0VWMdz3fhWsUI5PHOyt4Vh+HzKNFBsn+VyExZgoZc/EbJBkLxbhoJn846NgiIJIgnjE6
         f8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428931; x=1749033731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
        b=oEJhPWJGr/8+KLjSp3GOlfUcLT6gUHSDXPdutS6TSERJtQOcJR32C8wZTA82wb4nBT
         bEnjC0mdsvH13nTXncCPCLcG28Y4O/jQP4uyDP7LXYqkGFDKkRbffacAuwmRlU4POEnF
         mDWN2WM51yCfry1MTqaFq5cgyfHVAuCLswXM0mb+XfYGBBsbknSvKpYbCf4yhjOTmoEX
         TJ++uerEeyvc3W1xiGaoa+t3sYhSysYKCOLg5ytt4wl4mqbaO/dAFGVysfrBCm9Rn+A3
         xjXb3E3bFezgwsJKGOtWcL7VXIjyGUMvWWObJv43/s5TAzaIQQ0ENmdCjuRldy4RPBfe
         nIOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe6dTUWHojCET+5VftZXf4AfgSt7bwzs699f3PiWr1r7MhVqIy7/8+6nvLwKuMTnaZHZJ8Pr+vmtcfMsjiug==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFPu16P2NeSxkQ3X4tFB5cQxGjK6jdR+G9LH815SEwUvTl5hAz
	65PuSbxFidYrgK9JxmdGdIC8Rg7P0KowO0880gvfMPASHtH6tkMzZarBmqxFQt8b+p4=
X-Gm-Gg: ASbGnct9N3Uu77pir+NlUokS5/4RRmJM4YSMShS5CEkekno9m+JXsov+2k01CFg67x0
	voKbwA35qvaWi7ghW893Lfg6TquRekymtQVqbjuX1TYNYPSVKG0LHCoDZEbHPGep7ih020ltNch
	0ELquzeW8UU/jeYiRZOAL3Gb35kK793gz55Kt7ZFqorN8HLDF83NIAYQQ1PHyZWnJsM5S/sP4xn
	I9MMtQhuWK/PtEjkvvi/ulRnIALD/d3RF70rpuqLaato3rhwEhA9Zq+5GFWQ5FVFJsnOzKMmfLj
	vHgY6weD1PUaoc0TjYVpdkQPqDvCpY6+O9px450fvBhd+yFQ2C8UVUg8iB3RwJfoQXPwab7Wdnj
	9FjAMRQ==
X-Google-Smtp-Source: AGHT+IHdcQ9yFIlwP3zJEBCO4eEnwvHp4vt7sag5E+m0p9zZBnLpwpM4OjjEhLuG3z+TywmxNPkmLg==
X-Received: by 2002:a05:600c:4f0c:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-44ff407200bmr6539815e9.5.1748428930677;
        Wed, 28 May 2025 03:42:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:08 +0200
Subject: [PATCH 12/17] pinctrl: max77620: Move fixed assignments to
 'pinctrl_desc' definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-12-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vXeTXdr0B9QOQoZjEzmtipvrdS/pdMRjTxQFNr/h+bw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhT4xTFSLShiMHGrzurn8k/RWLwBOEg/kTfX
 2gUx5kqw3WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUwAKCRDBN2bmhouD
 119uEACKrgBEySfxytMKjgXas+UOwi3IzZ36tTWGAtahy8quwEaS8yKLMXGH3UR5R/xfiE/qxgT
 K0j8KZQkSSoxJgxu/1dPpRloEO6KFrgMS1JNvrxc535yglaGGAF6dztV4S0X8Zw47lxNkSI3oCf
 kmg6Jop17f+7Kjbsu3oNHrrdaoyBSECGDQxfjPrG1OK1828Xa1Gs20NH8vBU0CQOtNFmjAg4W1q
 rCrbcRJkrSV7L68wgkZcewjkW+uCHpp8xfiuky/X+XA3LrnVkt3ZWvvtx5EVrBotsW3c605oGMm
 aIh39HoF2i+U+c1KA9+kRRkUESeOM0m/NNik+1C01XMxfvb6mtTvGtL474OCtItf1zazpXvoj9T
 ygvQC/oprYke1uID4uognq5UNn/OdoNvQJk6tbxBkAwR2epz1lboNXHXIe1MMdo+aFjl0220apS
 E2bXflnrkOr9/PrUbwkSiJxaLcUHqAJCywLcj/t0mPNa791g/BPtMYNr8rDFfZ7XmZyrEPbEJKp
 5XT8mZQD9JIEGYwbw0cQH/vz9kgOs7p47hN4UApEPGZ0HzG/37d9kmNp+Q9mNDbTUfAr5OPTT0V
 Bv9d8JMKPn9VoDFIrtdM3+11ONR/OmTdCfKgP1pqzLvz0HwoQl9QvT6II0t/70s7GaWP8Umrwo8
 X7EdXcYJodX39FA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034212_452935_477FB4BB 
X-CRM114-Status: GOOD (  12.37  )
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

Assign 'struct pinctrl_desc' .pins, .npins and other members in
definition to make clear that number of pins is fixed and have less code
in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-max77620.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index d236daa7c13ebbcaf7c4a8d1a8bed751aa111c0f..acb945a2574368b2e34659a902c34df8aad193d7 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -543,6 +543,10 @@ static struct pinctrl_desc max77620_pinctrl_desc = {
 	.pctlops = &max77620_pinctrl_ops,
 	.pmxops = &max77620_pinmux_ops,
 	.confops = &max77620_pinconf_ops,
+	.pins = max77620_pins_desc,
+	.npins = ARRAY_SIZE(max77620_pins_desc),
+	.num_custom_params = ARRAY_SIZE(max77620_cfg_params),
+	.custom_params = max77620_cfg_params,
 };
 
 static int max77620_pinctrl_probe(struct platform_device *pdev)
@@ -569,11 +573,6 @@ static int max77620_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mpci);
 
 	max77620_pinctrl_desc.name = dev_name(&pdev->dev);
-	max77620_pinctrl_desc.pins = max77620_pins_desc;
-	max77620_pinctrl_desc.npins = ARRAY_SIZE(max77620_pins_desc);
-	max77620_pinctrl_desc.num_custom_params =
-				ARRAY_SIZE(max77620_cfg_params);
-	max77620_pinctrl_desc.custom_params = max77620_cfg_params;
 
 	for (i = 0; i < MAX77620_PIN_NUM; ++i) {
 		mpci->fps_config[i].active_fps_src = -1;

-- 
2.45.2


