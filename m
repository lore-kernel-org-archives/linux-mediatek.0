Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB896C3ABB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 11:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubJ7uuc4KLABL05ikGhsnFP3O+LGDAGrddoVdCFQ7aE=; b=2IG/BX86gFo4zGD8aJDERpiU5S
	6gFEaOadrLW1kbhk19fDVUS1Evltmq+s//sd4A3LlIzcLtXAzG+7qjPp8+vgOTipES6/081op6GZq
	+q0BsMCnSyzrfb+TLlTcITJM2bBHJabQyDjZecSWhBkHmHN4oxEbotzGoHz5jaXcgn7AdIuEUhKZe
	83ZQ4WWO9q/nr7jRlmQ1+NwE9dRIZ7uDigEPwtPRjA7lEiGyNMS/aNFkqLOyl9YSentPNQDRHyrEV
	ne3TndC6Pld7rpayKMFoXTjjz/zcb6BWLuELPB9tlZgfNkgeR8xjs1lzPnFK4CgBKnOkRGMEuVB3i
	vfBScwEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFJZ-0000000D1S2-1a31;
	Wed, 28 May 2025 11:51:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEk-0000000CskA-1857
	for linux-mediatek@lists.infradead.org;
	Wed, 28 May 2025 10:42:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-44ff4081975so229735e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 28 May 2025 03:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428937; x=1749033737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubJ7uuc4KLABL05ikGhsnFP3O+LGDAGrddoVdCFQ7aE=;
        b=CqL4Jl3Qn2BKmW5Q60ohQLWkNL9sxHBfIwYa7VxaccHcMp1Z9MHDp/tCpiBOkSO9/m
         eIAWfSFmLSLSKpqCrBQPWdM/jwAj45MTpJnQ8YCzTOlTT/J49X+NiZe0Yutak3A5Yp8v
         LBy0LS7eHGzLniQr8BShPXtzOOYrb8Gs6kqmhShxKa3vz3nkYbGrBqtUeHNR+QA8mEMM
         c+9mn5JfRgYp3bk+DgVIO50vBBVSmm80xwzHP0APIgLJqUa5jPhQHIGlbyejlNWPDrrd
         clYgDsC7Ssou9AwVKc7g4wgi0YNkGQS4t6WljQxLH7dqEdtsw9U4r+2OWXKyAZsMymBd
         ubPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428937; x=1749033737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubJ7uuc4KLABL05ikGhsnFP3O+LGDAGrddoVdCFQ7aE=;
        b=geHO7Lj86K0ZzESDW8zwtpc3w5H2856h6qWmo7R9isRERuvuK2Lz/1F5/vNZYL3pw2
         pBTm2/wvnS21/EUijs7F72R4AWFynvHxyjDm+cE63QcD707PKEig6rr6wbgBUwXzpcJe
         Vx6b81AD9IwB/iTmrrwC7m/bm0rJIyBcgBnYvmhaDbnTEU6JD1BbyR3BkkZKt7o2hg69
         E4VINUpQS0BMGHb8KC1VTFEFVvxi3itb1LXeyK3ZEqjomT8EKcAlOC1aenpxcs6e0K2z
         i0PrycSI6ldUB34eUAThFcD/WOAC8dgtowlCgW084CbHQ/wr1E/IgLY8uLyNUuETFqua
         D57g==
X-Forwarded-Encrypted: i=1; AJvYcCU9AfTmpeTuCWPnKFkO7EeJkqRCPIi0mw1ALnOdPU0L3QEh7g6wt2K03uJUXanwm8b6D6mfu3j94+Xt/DqfWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwD0AdgbYb2KTqn3T5EF4MbVv6ouL7JOEd9i+RWx1JmVEs1zmAi
	LvVe7uqtSAr7GC2H13a9ryjybf3hU47kb6l/gMztcOHocKgGT9WHo7KMGVl2LM+GAuc=
X-Gm-Gg: ASbGncsNPpQ0fb64R8WNSLp3RXf7RkwVYI6WxfwY1eCfuD5gKePrnZ6idJhpdC5OFqX
	x07h7m8iZQefQqSmwbaptfKYyGkaAzdCZ0juC1m5zMXA5qvgwJpUqppH0yERRutbisTbm/F10w2
	W+4P8JitsfGZtwelf/bX+zwB9QA82kQH18fornzJxAiDpo291UJ4Mt0192PbAlnT4XTXba49II/
	G8+wlEbETZHja4uz2A8EQHADtAtLBNWpXjKoBV1xG6Kz+jARw7DnlSTFuzmxUKFXEdSsj/BoOLP
	UpEpko0yf7hoDqRSaqqcO1hu4o8py4kBvH3gL8qC/dDHAej4fhAxRz9nmjimQK2JZoTmVww=
X-Google-Smtp-Source: AGHT+IGUEkMw3AazYidVlvlcKxjjPcFl/fdYDePDntNbpwN9JsZRSDdk3Hds7gIIRpwHgP+c7VnBhQ==
X-Received: by 2002:a05:600c:511f:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-44c91dc9fd0mr51871135e9.1.1748428936730;
        Wed, 28 May 2025 03:42:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:10 +0200
Subject: [PATCH 14/17] pinctrl: renesas: Move fixed assignments to
 'pinctrl_desc' definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wdAVjz1g2LnOLK8YIe+sx2i+Wtxy0b2lB+2wyeAsJM8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhVOUmo7glA0KmdvgZw8r0O4XKNab7bHjew6
 T+RsAWcuh+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVQAKCRDBN2bmhouD
 12JBEACByGYIJrWmeVaNuGhfgErqLrs8juvgq1he1oiyCbsIYgTgEq+hkshpq5p167n8sAXxqs+
 6iBVk16DcEYvSI0f8eCwat8zII1LkA4/ev5fMWjxd2Z3FzJswscCWFRIcarUCeBg5Ed+JZ9ZJb/
 sN0DzMJHT590OM6XRyVM/p3h3tnUQvwdzoqV9s5W0m9+2com84VzLAOKGdwYycuo+JYsD5GJuCi
 ueDuDOOW04JWSbUxMO5jxxZLXltdZb9B+y09j/dA+vEAU4rLYngyjux8/zx7evW5JMkCosH02FQ
 s8fr+Qw8tSf0/SeZOU/aJeUXpYvGrvaQefJaFh4YdCEA+bAj6pyNvYMWsIfwWvWaE4uawUoQ5Gp
 TJAyZt161KRilFdsJdPhEEcLzR1oML7mLl8Rx6++k0mb7HwaPoSudr64ZzDrwr/2o40pTX2dALR
 xcX4+WF5UWmuN6JwMHP4Pe92IW5urSZ80lzzkkV0kNpzmkBRmr2RmLNe1hcbRvVAO3T7zQ1Ji2V
 2O21d5pDtSNiPIS3BtOOFEf6m5aKJyk3wg64Ze7CTiqUj3VPHlbpMT0VrAMdmrjlY/4h/Xo8axA
 Zo9kbbNMJl2+zQofVcJ2at2Y4TaN2qo9C6H5+FzFTRhJ9EQpHJdf8J7TMx2fib06ZHvXH+XMnBf
 rJwlspjRton9X2A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034218_386117_E6F38736 
X-CRM114-Status: GOOD (  12.57  )
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
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index d442d4f9981c908389407275522b936dbce294d3..fb874867dbfb9877b012988543ecbfd1bfb11270 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -680,6 +680,8 @@ static struct pinctrl_desc rzn1_pinctrl_desc = {
 	.pmxops = &rzn1_pmx_ops,
 	.confops = &rzn1_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = rzn1_pins,
+	.npins = ARRAY_SIZE(rzn1_pins),
 };
 
 static int rzn1_pinctrl_parse_groups(struct device_node *np,
@@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
 
 	ipctl->dev = &pdev->dev;
 	rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
-	rzn1_pinctrl_desc.pins = rzn1_pins;
-	rzn1_pinctrl_desc.npins = ARRAY_SIZE(rzn1_pins);
 
 	ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {

-- 
2.45.2


