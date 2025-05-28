Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1ABC5AD49
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 10:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=; b=rm2h9WwGkto65RjYisKX0Fjdov
	PWgVNuqp2CpVlNbGea7U74q1c1h/332QrQ7SY0QNwECCglibB9wHYpwkcMNGVNhImX1Wcg0lFvqBY
	smvhxb2u6yoC06Z8UIeUjLper26evvNRvwNawhT07SRUr51CI8D8xuYhZpE7qkkR8WA5449aJ63rn
	RDGXuOpzKGgnKDTf8RQLX7sJaOpSD3qHlSADPrCKwv5LPzPC6C0YqZ8Z3BdiveNJXgw38nds0rZIp
	eyP6XbZ6ZNEc+mVwea8MpNQ5gqg7GiK3tU9w3KXZvJpfkdU41JyJfMnLfLDS0p+8GGA3RZoNp97J+
	YfvvVLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEET-0000000CsQ4-0xbF;
	Wed, 28 May 2025 10:42:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEB-0000000CsCY-0kIW
	for linux-mediatek@lists.infradead.org;
	Wed, 28 May 2025 10:41:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4db4d1bd7so472281f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 May 2025 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428901; x=1749033701; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=TsrrtffuESQHNLR6ffXSAaTeULP5kvO2GBoepnuXvWQZwOB+ZWH4cTxWaES8BWpdRw
         cA0M9vRmNBtHBOoz5oAgQGao3yPQwAPQXytm36t4wJe+Nd00WMBcLdC1bbbkhdNB6opG
         wZrHIvym/y4bkiNxjGOIVwjxGwjfedCxuorFPC+gkcvjYRUukoCesiAXVGoxy4LwAUf4
         6vSuZFjjAQKGMkZivFQgJOcoEQGRaHwsoPeEx2goVXZ7yeoMI6go0UPC9csxvjznACqD
         ltv/f0rv1BYqDxuiOuREqze7nNtshSekST+Gu2l4WnkulAaGVLxgoxMnCoj8Yt3v/OWV
         InXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428901; x=1749033701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=kREFh5GZhOyemTW6uOgXFz+tBBipQ5CoTOaTFdspT/IJ3oNvXy12qg3mjufFxNU28Y
         a93c/qM10J/wuS7F4VnnF4oqpuDSA5P478+bWLJl7QImRY9xMca/9EOBzqxsiL55Cl3s
         0r+dQbHNWMLUTcydMARdLSgeduWt5xA63IQ+loL11okg8aBF2MDsKHW4QL50nLjsSMyr
         cVev/q9QITpEVGzCI3mMpuJzmf/ChjBThWAVNvO2UFuWMUAWH10uBmHU8dPM9gK3A3ON
         +J95HHofcU4FSMuJS8pekZEbqkZ9htAZ0AvTv8Qpyt8SSp2awfbDBIFTweR1GgFHBhJa
         IeKA==
X-Forwarded-Encrypted: i=1; AJvYcCUXDIODysSd3ocS+D1fAEU24UniOS0VpKgwZVxFMRBq5AEmJsTTFrxt/AsijtQz/RM1ruLVl4gDzIlKqRTMXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq6cc1NoEaLdoU0AUDuu/+0kHtgCruoewOAbKOTzsGA8IMdZuG
	1GO3Cmz2bxhc/qvT61jKNNaF3GiKl2nv7fpMeffE8lefj0ap1bDD7Ah0xEDbiWOPoCE=
X-Gm-Gg: ASbGncv+kxUEzL+wxSv2xstsvynVHwP9VH2OneWg8C1F3XhtDBdNe1eMHQ333Jd5Aow
	rQIsw9a3UGpLEksQnh6KUTMD6qv+zpNyWDFCQvh/vmDVW0K9xa+BfgC9JJV82+LhVGNEVySkfOO
	b6Qq4tjZWTXg0Gx2PGXFneydlPeYYqRmjzYRVqrVJLIm81yYDGGy8hhkf025I4HdBexUZBRRTkA
	m7usyvflFMXh4YRGUu/RP/xfM09b/GjrRk9Bu65DO8Hxsg+6lJudshwGoOmH6k2i0vsl2GL5pXN
	et/Lt4fvwf+IXs5CDZ1+Pvzn5TE+ljvnhNuF+Jh98Dov6v7u3B2fy/R8e+ZVzl/xLhH45YY=
X-Google-Smtp-Source: AGHT+IGTCix0Q1jy4BrWDlq0WKvq1kDgy90AgIQftKVJ3+fHqWj3CB+Y/tqyidOqQgU6X8SjWLe21w==
X-Received: by 2002:a05:600c:4fd6:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-44c91cd5207mr54787535e9.2.1748428901365;
        Wed, 28 May 2025 03:41:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:40:59 +0200
Subject: [PATCH 03/17] pinctrl: amd: Constify pointers to 'pinctrl_desc'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-3-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NNpY2A6LBp263syvyG1Ecsfx8CioM309dnOrlcmWHKA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhLzdvZMq9JNg5GdFBWovE17QCtk/Hvs4oxC
 jNRdzKNaGSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSwAKCRDBN2bmhouD
 1xJDD/9Iu071wp2X2mrBlbLxwbQSEt1jzUyA7UUF1e0KxgZt+zVcRXMVNMYoIThkWeyGVX52CQf
 okr8IMWAZsAUcHN251LBi/oyOy+JqW1cgzOn6ZWcJjsltruW1VOALbEswkI8rArGMBIiyh8f1tV
 8MtIMjNj1oTD4WOIVlp6L9ofpzo/9brBrdU5MDFOKeNXXa/dN/Fhk7RDaG2E3JMOzSFvmV4ZYzN
 bc4nYH4r3RCB47xeTr2E1Qv7mUO+RQySQxRO6oc0QFnkgLN6YcKhDn4yGIb/YmeYeGeVHbIwR7P
 33MJf8lYeKIBsczVrSDgBvg/jD/jRhVvXA7k1jPopbOAOIp4Nby4auXmhLYKI+jvfPfeTrqnhvb
 mh/B+jVb5w0Y3EQj2kG4RDtjdusNR36nNV+diBZB8+t0KbIgX2vQQkHkKvTeMecvEibBkYDZ+Kg
 T4NKgjTaQYKABGFej9HjbOu2v6g21yzG+Lp+koCs79oV+3X4bXHim4pzDHS3KXWPIg1dxwRPyvl
 3rjjnknIlcL425x+wOv4JdEt9YcjyPk6mmqB7RtPvnB1wGEhmHSGIUEpmDQtTWy5p+E4B28dzdL
 9xoD/l18/y+W5yHJkwZ+CXugsTc0rgO6qDgGrZ/gbW+vVsOz8fTZTC/FCjnmDN5YLE61AOBvgUQ
 wKkwwIR56tYVS7w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034143_224955_586A0725 
X-CRM114-Status: GOOD (  12.33  )
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

Internal functions obtaining pointers to 'struct pinctrl_desc' do not
modify the contents so they can be made pointers to const.  This makes
code safer, explicit and later allows constifying 'pinctrl_desc' in
pinctrl core code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-amd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 5cf3db6d78b79af9ac5e7226de239a0d2f9aaacc..85617cfed2299e131c110e9d4084370790106404 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -872,7 +872,7 @@ static const struct pinconf_ops amd_pinconf_ops = {
 
 static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 {
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	u32 pin_reg, mask;
 	int i;
@@ -901,7 +901,7 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 static void amd_gpio_check_pending(void)
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev;
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	int i;
 
 	if (!pm_debug_messages_on)
@@ -957,7 +957,7 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 	u32 wake_mask = is_suspend ? WAKE_SOURCE_SUSPEND : WAKE_SOURCE_HIBERNATE;
@@ -1001,7 +1001,7 @@ static int amd_gpio_hibernate(struct device *dev)
 static int amd_gpio_resume(struct device *dev)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 

-- 
2.45.2


