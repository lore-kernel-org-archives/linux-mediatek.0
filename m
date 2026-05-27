Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7DBCD4F54
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 22:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JVybf3MGGtEv6SObEhz8sgYocMl2B9mPaPK11udoxs0=; b=4PQ6GaAGrA+TT5v59ROQMqnQgI
	QrmPM3d0iwaWboxFZXwVoZPLzZhYBVpGAG/05E9b6UW9EjCOxDXEfytaUj5xzh22jM8wn5asr8e36
	Yc9sFr5Zh2cPOMnb0aRdaFoJ0kRPtNrd4aUQivLdIrJ94JrFmBHhfQ3AMi6kFft5CzFoBB+a9cQDv
	OlSCLWZGrxgmo0NmfSP1BoUv/K6SdIGsmu6LFyl833V1IEA8SA10AE0mpg31FvrrMH1Ffiqv12DI5
	Y2lEAMfN1WTjZ/fqMhyH2WArJsLCVaR7POa8GQguo/orPIdlpyJesp60ckRO0L3FiHYJxuiR2oVX8
	T73zeiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMu6-00000004odr-2uEy;
	Wed, 27 May 2026 22:39:10 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMu3-00000004odB-42Ex
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 22:39:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bc85eda6b6so62151055ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779921547; x=1780526347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVybf3MGGtEv6SObEhz8sgYocMl2B9mPaPK11udoxs0=;
        b=TMgQ+14Adcax8xBPPlWg5xeARPJ/phZ/QmVS5cdh858qAhD8kyPzTNTqKd3n2NwE28
         oukDE48s0l5sU0U2Dw8n0emG/2peucIo3p9sji5/HCJZt58mRr6IBSEfnuJocOlVX9/K
         /llgQWdEvdtRmzyHl6yGjF5rgDXGHfuQU6NtQVh5X2CJdZH+WdHk1uQ7cNviB/UBMYT1
         5HTll3pyiydrUW+GJf7zbzEvAHY6DsmPcNqDI34oi2qhHtiODHdBg5XvjgD0dznCLsC3
         ZChrB4YMDje5D7e2rYuwbEj5YUngp69PlLiqxQ8k+49MSYHTiv/rGORfKgFAcZUyEQbd
         BjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779921547; x=1780526347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVybf3MGGtEv6SObEhz8sgYocMl2B9mPaPK11udoxs0=;
        b=ZUCTsOcCG1//LJi5nmEDNfVmNehdbgvGDBCOPAQnNWJA7OrGh2J9t1zaVMSqSsKKLD
         FkUq7G7nvuAWjnZi/VY9DsxDVKkOEOd3AR1IIoX5Wo1yvVl7yNIqChaCOzb7n1W1M+mh
         M5A2DGnaZx5h2HYTBTbKSxMmXWWtRJTrVT5iY0hFeDtXtYl9PcSkT1Zt9EQAKayb48sD
         5S0NhIc/RHNfqQiESjVvkgKzisIu4EUODTsWBllUtbQhAYu8yScEYqiOAxXAgasWA5Lh
         A8LRbWRp/VHGjQLZZvFrFfaUBeozBrMjZNbelnRH8vJKuYmQCWkSO7rNDHJRtzpGlr3N
         QyUw==
X-Forwarded-Encrypted: i=1; AFNElJ/xuOnUnO+JIyzXOfxl5XlLVIkg6dz3z3x1eEUmt578spBa1D+bjwscjoxus6349+qKOhztCjGXR+cSrkMJpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcHFTc74SKOpDWV2tIcklFSx9uMNxGyymPHJTGUDp3QR72PPWq
	PsXRCsZGzZLCHpEyzQw8UvLyeieRtrPvEyTxZ8c5O0hYwv/EBTS1b+kT
X-Gm-Gg: Acq92OGytbIrwupe8H0PO8CqPPE7Z1o7+thQM5deql+5ZeddxJ4yyMrokv+uurlSRqX
	2+FOOQZfxs7ygImpfFPy15HSeWWi4W//zm9TfnqoGIrVMAp6QNkgMZLUa/Gu9PD29uZzw0zlBWF
	JgSFOgF+Vh2TF21YIgT96jLKaD6Xc1RUG9Mywv05q4BZA+ldF+nbvmJZ0kHjp1Mvzkz7butswsa
	MmqkPCnFVfSjcJkfV4/Fd1CKR57+P76x1WaumHxThmsINToDUKCb1AQJa/g0n4q/VPCNqbmx44i
	SSSEBupJ76tJhfAiG5cg5waCv7AmAdU7Isq/M4Rx/wwov+WovYHsPO8lIYQmzv+wyqAnr9nseUv
	CwKqVDixWmfRC4lm9W4CRrxFrrPBbhbBlI9UfZD+wlkWDMokB4/SXhQzJXUgWNgASnJ/DHuj4mV
	gkqOIQFIwLXXaSgmLYSeIRGhZc9L3mH/4wYA+qSC3uMD4qzjLcY4hZFUdOsxU4rFFPVWJBZqjxO
	OuKXpzvNc5DvOfAQpRgV2VivFrInWxvJK50iZJfY4jASQ==
X-Received: by 2002:a17:903:4405:b0:2bd:8822:d8c2 with SMTP id d9443c01a7336-2beb06bc0a9mr260255915ad.36.1779921546975;
        Wed, 27 May 2026 15:39:06 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b51aesm211397955ad.19.2026.05.27.15.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 15:39:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] Input: mtk-pmic-keys: Use flexible array member for keys
Date: Wed, 27 May 2026 15:38:49 -0700
Message-ID: <20260527223849.25139-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_153908_008431_8F1CEBE5 
X-CRM114-Status: GOOD (  15.76  )
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

Convert the fixed-size keys array to a flexible array member and use
struct_size() for allocation. Move the key count validation before
allocation and use for_each_available_child_of_node_scoped() to iterate
only over available child nodes as the allocation uses
of_get_available_child_count.

Also use a key variable in the loop for clarity.

Use of_device_get_match_data() to fetch the PMIC key register data directly
instead of open-coding an of_match_device() lookup.

This also lets the driver drop the of_device.h include.

Remove platform_set_drvdata. Unused anywhere.

Assisted-by: OpenCode:BigPickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 55 ++++++++++++--------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..5b8650f46105 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -16,7 +16,6 @@
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -147,7 +146,7 @@ struct mtk_pmic_keys {
 	struct input_dev *input_dev;
 	struct device *dev;
 	struct regmap *regmap;
-	struct mtk_pmic_keys_info keys[MTK_PMIC_MAX_KEY_COUNT];
+	struct mtk_pmic_keys_info keys[];
 };
 
 enum mtk_pmic_keys_lp_mode {
@@ -332,17 +331,25 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
+	struct mtk_pmic_keys_info *key;
 	struct input_dev *input_dev;
-	const struct of_device_id *of_id =
-		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
 
-	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
+	keycount = of_get_available_child_count(node);
+	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
+	    keycount > ARRAY_SIZE(irqnames)) {
+		dev_err(&pdev->dev, "too many keys defined (%d)\n", keycount);
+		return -EINVAL;
+	}
+
+	keys = devm_kzalloc(&pdev->dev, struct_size(keys, keys, keycount), GFP_KERNEL);
 	if (!keys)
 		return -ENOMEM;
 
 	keys->dev = &pdev->dev;
 	keys->regmap = pmic_chip->regmap;
-	mtk_pmic_regs = of_id->data;
+	mtk_pmic_regs = of_device_get_match_data(&pdev->dev);
+	if (!mtk_pmic_regs)
+		return -EINVAL;
 
 	keys->input_dev = input_dev = devm_input_allocate_device(keys->dev);
 	if (!input_dev) {
@@ -356,31 +363,21 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	input_dev->id.product = 0x0001;
 	input_dev->id.version = 0x0001;
 
-	keycount = of_get_available_child_count(node);
-	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
-	    keycount > ARRAY_SIZE(irqnames)) {
-		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
-		return -EINVAL;
-	}
+	for_each_available_child_of_node_scoped(node, child) {
+		key = &keys->keys[index];
+		key->regs = &mtk_pmic_regs->keys_regs[index];
 
-	for_each_child_of_node_scoped(node, child) {
-		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
-
-		keys->keys[index].irq =
-			platform_get_irq_byname(pdev, irqnames[index]);
-		if (keys->keys[index].irq < 0)
-			return keys->keys[index].irq;
+		key->irq = platform_get_irq_byname(pdev, irqnames[index]);
+		if (key->irq < 0)
+			return key->irq;
 
 		if (mtk_pmic_regs->key_release_irq) {
-			keys->keys[index].irq_r = platform_get_irq_byname(pdev,
-									  irqnames_r[index]);
-
-			if (keys->keys[index].irq_r < 0)
-				return keys->keys[index].irq_r;
+			key->irq_r = platform_get_irq_byname(pdev, irqnames_r[index]);
+			if (key->irq_r < 0)
+				return key->irq_r;
 		}
 
-		error = of_property_read_u32(child,
-			"linux,keycodes", &keys->keys[index].keycode);
+		error = of_property_read_u32(child, "linux,keycodes", &key->keycode);
 		if (error) {
 			dev_err(keys->dev,
 				"failed to read key:%d linux,keycode property: %d\n",
@@ -389,9 +386,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 		}
 
 		if (of_property_read_bool(child, "wakeup-source"))
-			keys->keys[index].wakeup = true;
+			key->wakeup = true;
 
-		error = mtk_pmic_key_setup(keys, &keys->keys[index]);
+		error = mtk_pmic_key_setup(keys, key);
 		if (error)
 			return error;
 
@@ -407,8 +404,6 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 
 	mtk_pmic_keys_lp_reset_setup(keys, mtk_pmic_regs);
 
-	platform_set_drvdata(pdev, keys);
-
 	return 0;
 }
 
-- 
2.54.0


