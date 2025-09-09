Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA29ACAC583
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 11:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnL5avCI1+j0l6tAuop7k471BoLkt0UX61ObHkL7ebw=; b=xV7fi2r5CPW+MrUf3G04ijtm8H
	0UclqDvAE5pcJv6Ce0D7LzIn7+EScvWY565gzVyecqv1ClzJycYPFRILQLp0lJfeYWmRu7qjqDdSZ
	52lagdlUyHWXBH+UfTmEA38b55zTY4DSNgvHQd2MQHhen2aTTPZlsJl7SAoQMtdvWxIIlpuLtdKZF
	HD0lUOpdiP83YUW6JSF5P0WUnAyNXo9pKnavfWBN58Yqr8FxiZ8JEVstdiW1ovJaDXvUiNNhvkXEx
	1pfuN1W2p4k5oRwyowmuNm5LhbCY1ugYPuXjN7vW6b8yP/0o69JDwMmihtITFHpFz0MDgabkNK9YB
	gpoEPu0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwiO-00000006o4n-16RA;
	Tue, 09 Sep 2025 11:40:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSN-00000005sqp-1vHF
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:16:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso3266203f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 02:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409366; x=1758014166; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnL5avCI1+j0l6tAuop7k471BoLkt0UX61ObHkL7ebw=;
        b=AROWdIGyEOimiFrUMp8K7GipzU8jCqiu5tYlb087EAa3BO7FZ3+wZO2qFbIJEaCpMw
         NmPwwjyPv9KGv3GI6HZVDhhYAuA2fNM0oAqKyoObFFv7Ui9RAGmPvXpnlBFaN3w1ELX9
         cuX66Oeffj09WjMt9pEk88hYlkqTOWMISo7IOOwICwLmvaIKMMkwPePAoYTh0NG6eoWZ
         5rh8TEKahHc2gTT6XaomOB5g8muOmNuaZn1aX0tiWI2LDahF/eeKRbRi7l8ZVYehS1wJ
         PdI+A+kXC4zZ/TiWhE8Gv9clW9fetCDeCMTZpMbIsOK+w/jrZk2fN8iLbz+BxrCztSeX
         nwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409366; x=1758014166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnL5avCI1+j0l6tAuop7k471BoLkt0UX61ObHkL7ebw=;
        b=Peeob4m181RHH3qHY26fEvyFERppHvS2b/wYKSh9UVLWos0S+/SMfwNY+9D3zlV93L
         ru1EauJRz+LQgRDYwKMKx1ukqb8idwIFRu+iMZrBTtdVJvfzJL0ztIJ1Sy3Vtukvu0aK
         w+XMqI1J2CRzlSA9+K2/fmb+jtCnsq/e2/c1UJjZ6mLpC89tMqurZ2pB5NrU+3PcGtaj
         cC8DUa1UeKuZZDRRJKb/xagVKZ+mZOxFM/Pfm2ED+HxkK+M83VyZslD69Y8jB7zT3GRa
         ItBVRx0/NVMNYbEqbbCUynI0AWYD2grv7o2mhLqtTnyPEb00P1rliOFDf+iLVDPXBCxa
         HaxA==
X-Forwarded-Encrypted: i=1; AJvYcCWBUu+qyW9yuu6qLFJcKCTe4WDDd4TfTCqPD8DKYiZFH83npi26jWdYZ1Hmq94Q7tV2nf9dSdJVqIpD67OynQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW4zkpELwZ0o+LlICk8rAdc7K4A5rEn/ESgSg3Vs3wjL4+wx0O
	EYS0Q6dlRuS3/KFc8StdAdRnrsNMi79rRuyFTn07qjAgX8Y8FTF1WJGxqNQKzFiZX14=
X-Gm-Gg: ASbGnctddy5/QVzy7fM77eClZgBDrF3yxeWUtuvyys4r3lXZoAjvt2xmfyoqRhXlR+O
	ppzeyDMUrxiUSThZJvJbGXMa9pP0BqU7cT5FdPMXDKPUg1v6dooRLdFYfFP0RfGieAP+dA3N+MK
	5vXVv3I1Duwjz3sedldtqqWp+S3mCHt132Afksivo3a7dOH3vm65eqCzeeMDOasQVKFx1zdSWeb
	ItPDVkxpIkQCfH2Pl6mw/fvLkj2p9i/AWSxzuo04s6uZfwu7WklujBygk9KgNbc85NcSIOMUFon
	6/cfcn9hpZqncWNCZVYAJKRAe17hBQ4c2i5l450hguFBeE6UX7+AdsILLRrltUsMi5hBr0P02gn
	7pjUOnU1oUVrL2oYMOg==
X-Google-Smtp-Source: AGHT+IE94R1Oy4E8DYu1vi5/MQwSSBtXsOK388TX3Bsmqin3tuFYremvz9spe63crlhiuLWMz4c6HA==
X-Received: by 2002:a05:6000:dc7:b0:3d8:9bf9:7c0b with SMTP id ffacd0b85a97d-3e643555f94mr8126974f8f.47.1757409366047;
        Tue, 09 Sep 2025 02:16:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:39 +0200
Subject: [PATCH 12/15] gpio: spacemit-k1: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-12-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3404;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gNo32+ptzHzNQ0FF1qmlz+3Zqph7O2GD4/GEGfsM86c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A6nAxdBHOjeyAM5pmmPsB62m3XhnRxXkrE2
 U8RABVAM8mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOgAKCRARpy6gFHHX
 cme7D/93u69p4SavcMfdgj06qig7Tkoa0eMfEjm9IPYT1ykfvFQhNDSGoOj5iutXRMOLR9LLr99
 IlHQqBPMKer9ht2ThaRDHXbsDDAEPSS+jANLAOWaKygPteu4Suqo4pbDL7cxkdJcgjbdbHAH9Zk
 zl6xAUgDU6jfmPvcO2VhJr75owb7CGZp5a1Dnag35fFfRISG+pgOiAwhAMivHpcgpGn3EwmeaTP
 LfGkDAj4ulgpkjsaxwo20vLHJ2wSq0mfKheltSCFdiS0+aok/Rbl3mhu1McHriCqmlvKAyx8IAv
 7lC5qZsAWcBUG1VqNe5aycf3coJ/g6KMy0i8g//fr/txxRCIjdHyTcfJ6t13JKQGqQdCTM4chQz
 /+XMHuKfpZ/Q4YDs5n2SOREbvZSSNuT6QTeWHDX+6wXH/ATSEYsVIsLd9L+c1wI7a6PsyV63P/I
 tvIzyK39lt2Z2dBxc+oAlhSwj0mAIQdG9XCVXavR4vOS8AdP0gT0xlExujH+Omuw0g5KWNawhRJ
 T/ikz1yOTq3wDGN3oZ1XYESu56a3iGgC7de9FThTX64Nyag3JpJ+NL7w3pWFdIppgGkim4hUCGR
 HCm9ppak+GXo8YQgBBZ5fHJDeF/Pj24TnRZOWwbCoJlmgMzRCVZPV/2mEWll6esXcxeseLt41r5
 XEg1x+7SuLj8WOA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021607_507242_5F44A952 
X-CRM114-Status: GOOD (  17.10  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-spacemit-k1.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index 3cc75c701ec40194e602b80d3f96f23204ce3b4d..9e57f43d3d13ad28fcd3327ecdc3f359691a44c9 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -38,7 +39,7 @@
 struct spacemit_gpio;
 
 struct spacemit_gpio_bank {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	struct spacemit_gpio *sg;
 	void __iomem *base;
 	u32 irq_mask;
@@ -72,7 +73,7 @@ static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	for_each_set_bit(n, &pending, BITS_PER_LONG)
-		handle_nested_irq(irq_find_mapping(gb->gc.irq.domain, n));
+		handle_nested_irq(irq_find_mapping(gb->chip.gc.irq.domain, n));
 
 	return IRQ_HANDLED;
 }
@@ -143,7 +144,7 @@ static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct seq_file
 {
 	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(data);
 
-	seq_printf(p, "%s-%d", dev_name(gb->gc.parent), spacemit_gpio_bank_index(gb));
+	seq_printf(p, "%s-%d", dev_name(gb->chip.gc.parent), spacemit_gpio_bank_index(gb));
 }
 
 static struct irq_chip spacemit_gpio_chip = {
@@ -165,7 +166,7 @@ static bool spacemit_of_node_instance_match(struct gpio_chip *gc, unsigned int i
 	if (i >= SPACEMIT_NR_BANKS)
 		return false;
 
-	return (gc == &sg->sgb[i].gc);
+	return (gc == &sg->sgb[i].chip.gc);
 }
 
 static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
@@ -173,7 +174,8 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 				  int index, int irq)
 {
 	struct spacemit_gpio_bank *gb = &sg->sgb[index];
-	struct gpio_chip *gc = &gb->gc;
+	struct gpio_generic_chip_config config;
+	struct gpio_chip *gc = &gb->chip.gc;
 	struct device *dev = sg->dev;
 	struct gpio_irq_chip *girq;
 	void __iomem *dat, *set, *clr, *dirin, *dirout;
@@ -187,9 +189,19 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	dirin	= gb->base + SPACEMIT_GCDR;
 	dirout	= gb->base + SPACEMIT_GSDR;
 
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = dat,
+		.set = set,
+		.clr = clr,
+		.dirout = dirout,
+		.dirin = dirin,
+		.flags = BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR,
+	};
+
 	/* This registers 32 GPIO lines per bank */
-	ret = bgpio_init(gc, dev, 4, dat, set, clr, dirout, dirin,
-			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
+	ret = gpio_generic_chip_init(&gb->chip, &config);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
 
@@ -221,7 +233,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					spacemit_gpio_irq_handler,
 					IRQF_ONESHOT | IRQF_SHARED,
-					gb->gc.label, gb);
+					gb->chip.gc.label, gb);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to register IRQ\n");
 

-- 
2.48.1


