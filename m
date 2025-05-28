Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22C8C5AD49
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 10:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=; b=09RjpQRalTwEWtfH8rLXEb0XYh
	PiBVhXf30OmjoyOurvUir8o/D84W9hdVrzzFgOJw+/eOUkzEJCMh7/iCUNkGQgt84Hn+nro85nYGa
	ca2Mi8IWnuRkXGLbK5sfvKoqipJj9S9MdT4niCEinxVnC80nxW+NSb1zUzKAyOVKP/cGMkykO7ayd
	+KAz+mRqONwSGLtQ63lnpy3zoz4w1zkYkOO8dXk1Ub+GcWe6+mEZs9phMYFV+j/ZGJFFUO6WawQCf
	raw6B5utqqaHgtCrrTDq7yHqbG/8P6T0WlB7o/lofJ+9ZCPy4nWkhclHzXDLGXuXkv/M/fq2OkVKc
	Y1rlrzpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEF7-0000000Ct8G-2zmV;
	Wed, 28 May 2025 10:42:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEb-0000000CsYt-0The
	for linux-mediatek@lists.infradead.org;
	Wed, 28 May 2025 10:42:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-442f4d40152so5987605e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 28 May 2025 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428928; x=1749033728; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=NN60jdqZIoQtmckkCVKA9WaG/uydIJDKXP4/PaSKCFoN6SnSG0N8/YMpPQYFCkB3Pw
         3K0v268XRHychboxdlMO/PeOP3HqM0lZ65jhUEnX3Edqd2xx9aJP/Smso2ebyFIgr5Aa
         UYyIz+iDBOD1XmC5qcPqmwjqfoCHBbC2JbJ5h9bFlbrRrWb1lHKuya2A6RhHQWDb64PA
         +dH2uwvgLLYQC00M9GVpO+bvyYOzrhSMSryIQd/swwtT02xiefJvlRkgt0fvthY05eyL
         Z0HgUoTdcLEs1ZQLxy4euUHhCTcaQ5oqMccblLWzPXBwcIFwlCyQljO/U7nVluW6gLhd
         xjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428928; x=1749033728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=qnf7a/eCVHg+Yagst6ysGmBkumNkny+In74gzdAtIphrEOSxKTlzNYtk5lLXGCn6XC
         NhSN0T+eF9Pt7uPg/h6AR9+qiLzeGr5m97Ged5UoHu9wb5qIDbtsfvgh1YgSpVvSMHMo
         igvI0w3nTXKfQEU7/j3EaR9s9ql+amAyWbWQVQSnqRb9lM0hzrM2Nm9o9m307fEOzV2R
         +eBxm/a6gDtRbD9vDTGDUeA9CLl+IN/MQUfLilYlX3VTvilpyn6X8MNEpUlPkhvjIgfd
         kWPD0BHaCJjCIQ07D3XIFXv2gJaq6IK/nRrc03NOXwUEDyc2mjSOKtJd5bJvzYti62Zs
         NW5A==
X-Forwarded-Encrypted: i=1; AJvYcCUTjaXyon4v1wds92inpGW1YrFD8FRumgrxGTfTiwunbg1ueFNLJGHpfXzRVHRT46+x+Fo6+RKgo/FuX8fm+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPHrG87+6+txf5jpnzMFWdkuHp2dBnRd0RR60P6Wpeedh6foR6
	FxhNTtnjrK/cW+KzsROmTbVoxSpnjmyTNDHsnXztfqsRh5LFfINHK8j+a5r03nsD6m4=
X-Gm-Gg: ASbGnctuJwTKNfY2wTLGw1osQdo5Mf8Ewv1pQXUszaNBqCbEsItyENGZMhITA6ucdf6
	T02J9AZzAtZVgWaVL8nqDKU8TIeljMmH9us0Mpg1LtsOlzB/6D2pf1N4tswENki0IYbf82G64X0
	suw7ETgZ4MxxjPU48xlJRDafBaCEM810QltgA8lyOIQ7S3aQVHmWpue6551AoYi6z4l42eJ4mk8
	X1A079IPOitr/upNtItgJSPmeHAfI45yy/G53VKR2H+THJ/avg/HrxSAcKm1IqgM4eaVtJDvCY7
	3Wv3ejGgAX5spCk5MdNbwNcFptk0kq7kSVvYBlCfc5TcC6JP4Wd42F448aZ54F4VxpIX1y+WhIc
	Rr4TqvA==
X-Google-Smtp-Source: AGHT+IFXJEnneO4xSk8QHxW3M4MG6X2rUF/ijYk6/3E6ibOcv7/LTi5pTGoQU3pGtcmJJ43pDOy8uA==
X-Received: by 2002:a05:600c:474d:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-44c91fbb19cmr53499225e9.3.1748428927574;
        Wed, 28 May 2025 03:42:07 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:07 +0200
Subject: [PATCH 11/17] pinctrl: as3722: Move fixed assignments to
 'pinctrl_desc' definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-11-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qi1eWzTJCENFCt5JAU6Fe0rVNJeWQChdweXO2MJK0eI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhSmo0CjMtoXcC2sHTGZq48JxTVj2z45DQTw
 MfdipuBb+mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUgAKCRDBN2bmhouD
 11uhD/4gp5pseL4b42D5IrbEvXxuCr6fAiAGchUSH1EtuHVur/ZUNsA/puQb+u0ePsLEwBisB8N
 HkCZQy1wRLe47FK3rertUOcjzUira7hX1qKm0jhTZant8VKm9nCaQfuvyHxdpPhOoVCVJooM9Ad
 c50bsIAmLW6CrtUn7kwQQ3rbem/I/4JrlLZQ3V+T2HBOBa+wh/sf2x2tGfE/ilSmEXtZ9VCsdbQ
 VeEf7DbVnNsvDCjNCQtCxzEBdKpKKSvCkiKIJcFpEb2Szo35NLhJzj0aBmlXWzocpri70Ho42iN
 GPRpc/emYDOm+hq9iusYbHVvfypT9421VVBIJZ8npbZmUnTu39bKewgOaguan2CHrPsWa8yw3nt
 yw5e2VWBb/HSAChzlE86yqdW9+rkoB5jFUYD23+dUZ3eWK3NDUviqsT+/YmruwWE9exSwIoDVno
 3GCqUCo5TCQOgp0hLWvEbWq7L24O47InJOwlG/6ZNrPwi+mCdVERcA18YX8T5vAEdBBiOdTFHSC
 Ekwch4dUQYD6n5qRL1rRfPoiWhQKE9VTbMoVCm46WQx7XkVKJy35962yFBpybsElB8wY4ca2J9M
 vOA8pVv0owKcK1pBhmg42QqkBmJWh3CkNUY8E0To1kMPcNE6E/hWvW13iZ5xppI3+CQBocPYecS
 qfWXlWeL9QmpElQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034209_197259_9274B32D 
X-CRM114-Status: GOOD (  12.60  )
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

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-as3722.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 0d8c75ce20eda97627aef773342a0b63ff6114a1..ed7b2c482ff0bb6a546955c083ef7046701527b0 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -422,6 +422,8 @@ static struct pinctrl_desc as3722_pinctrl_desc = {
 	.pmxops = &as3722_pinmux_ops,
 	.confops = &as3722_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = as3722_pins_desc,
+	.npins = ARRAY_SIZE(as3722_pins_desc),
 };
 
 static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -550,8 +552,6 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	as_pci->pin_groups = as3722_pingroups;
 	as_pci->num_pin_groups = ARRAY_SIZE(as3722_pingroups);
 	as3722_pinctrl_desc.name = dev_name(&pdev->dev);
-	as3722_pinctrl_desc.pins = as3722_pins_desc;
-	as3722_pinctrl_desc.npins = ARRAY_SIZE(as3722_pins_desc);
 	as_pci->pctl = devm_pinctrl_register(&pdev->dev, &as3722_pinctrl_desc,
 					     as_pci);
 	if (IS_ERR(as_pci->pctl)) {

-- 
2.45.2


