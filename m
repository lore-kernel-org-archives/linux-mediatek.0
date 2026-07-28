Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB28C54F51
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 21:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vo05Sqoj/nxG6hyK1aVk2wjFZmiY47IquL7CFM1F4EE=; b=CC44QvGx5T8NxZtggOEAK2CGRE
	AZCYF5yZxGDeJpYrFlL3MDIRN2UJ2BdNoQmXzzZB6irYItM9RyOkQBlGaf8kaJtMwjMecKegL29PU
	RibZmUvso0H6ct7E/1t0LOP9Gsq87S45QZQZKfFbrEF8Qn5ObZ5YHuvRmlhzO8c4Jywqh3hT+4XU9
	tveJV99MyFux/DTLlCTY3HohwnPGQeZjG2yTiR10mwDLx9VKH11SEVGSPG+ErTqSntGwHcH+Wn400
	uAgZEiu8VYBqylr6pc8fynCbP+/zJTSas4G1bfcZXFSwWIUd+ujU0q7dYNcGukz4LgqwcAVc2Lqzc
	i3F9HNpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopIN-00000006Jcv-2iyA;
	Tue, 28 Jul 2026 21:25:03 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopI8-00000006JSu-30mO
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 21:24:49 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso145841a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 14:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273888; x=1785878688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vo05Sqoj/nxG6hyK1aVk2wjFZmiY47IquL7CFM1F4EE=;
        b=Ri2+j8Jz2vWuAeQTHgkhiRX1CdLk9mwJlM8FVSmHyRR0gGIXH8JR5NyuyYh2D2Zh6f
         mssDyp5TgnYFtzLxB8Q/NXvapoje1RZs8k+qtOTFVSjeFTpZPzw0GKJxkChu/kdqgzBR
         4XzEMEqSJy+uTpm9kRXH3d8YA5ImlUpB8cgjRLgFmgCBnHbcJv2Inz8DptEJHsmUjH8G
         QeFY1d4wFJaArgBSoZAooFRM+QKckX0YYaP14XMj84RaEvHqdui0aNw+2Z/2YVnaVhOl
         UvMiwa88rcYCvobEW0Yw7YuD7jjQ/Pl6/OqGNrSl0FvI00jVnlxonp6od67xMwVGwzMA
         FzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273888; x=1785878688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vo05Sqoj/nxG6hyK1aVk2wjFZmiY47IquL7CFM1F4EE=;
        b=KHjMv77KYVWfmEzpUdgsrZxwwgVgsJzFVcKBMp9vMfzR8TK2s9ceYjWiqYuRa+Pigm
         y+37sbQ/+eMO+PsW0QUYzs+LWzlgYSxZSk56mnMBrhSwoPJlMq3bIlk5ULTjSnPN7jj8
         8Ze4ZJ/TZoqlrq2ImaV1JAQMDM5j7MS8NgacRj/MeAPAReYjX1+7Via4oQpLXTe9AfdP
         Y9iNG+Gh4rS8dFaROzRYZNtt0KQ5Inv3nw2xEpymh2k6rDd58EYYjrM4Mcv7zrYAbKrM
         iLW/oi69ylMuImniXhQ6eMFqCqhid97lCnwMl/EAGnQGtqYPCZxZYx8ZBKAS2si8tUzg
         QG4w==
X-Forwarded-Encrypted: i=1; AHgh+RrSvRhvDzm3tbZnjzQroSa3zqdXyHRVtlrRwYkN5o693ELbkRbKPYEtV4xJR/PLZgo6LJvXyiBROEjuMDpI0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRSIf+hsMbOju8BbTXZEs162ONc8VD7dkF+c/DI2TJCLXI9brV
	eOVXMI/GwYz/mEGtG6/lFXdckAPVsPrCo1sbzPQtA4n5nG2HNc4hshLc
X-Gm-Gg: AR+sD11bADfwDchOLpVMJGUrFmgRmEaUhxytOGEVGFKoayFrzEZuhCcGOrBKXO0RwXS
	Mom6HAq9GGVz8j3wZQin3YY20ohgB5OZSqZKWYfMHJQy8G29+3x2sAyq4HfH+HGYmALC5oRsLyI
	yuDfFOlub05OrD8E5BZIzJefBPfUr63Po2XIcO5w/IZtPXcrcJEE8atKrMToBWOP/KDgYhMWWQJ
	FZ4i05Coa8hHnG0uC11uIO97rb+y2RiaQhEBFFdJgm1iIs3I3mOIHuQAofciWvmtkc5wvdriDCX
	unw7jKSKjGo5bb7b1zln9OMumlITqySytth0eaLxZPnfiZBC8F27BtJuW6TJiGrsFhYalrbZK34
	RZcXzBmF4YqfVDfPyh0a7y0QNAg1YsVLehyDa87Hy1g7HPxewLjCpkRnqRI76Q2ab9hy2Ft2a0M
	M+IrEHouQQ+gzqwLemheeG4ahV7KjtiGngRvrVwgquZ0ukMwLay3uXJDn4xYVEIlt2J8/Cu+Iay
	ju20eb/bKiLaqqubccWxH6k2VqsIS69bYb/uRnsHSBMALACWvQfBtnCxDThBw9vAN8Zq5FwU02S
	q6kHzDDOnD/eEB/eVN2hOYHAFThgmR1cRspFOg==
X-Received: by 2002:a05:6a20:728e:b0:3c3:b4e8:5565 with SMTP id adf61e73a8af0-3c8ba5f67ddmr4982050637.61.1785273887644;
        Tue, 28 Jul 2026 14:24:47 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb83459f6sm80892a12.14.2026.07.28.14.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:24:46 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 2/2] Input: mtk-pmic-keys: Count available keys during probe instead of pre-counting
Date: Tue, 28 Jul 2026 14:24:38 -0700
Message-ID: <20260728212438.54078-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728212438.54078-1-rosenp@gmail.com>
References: <20260728212438.54078-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_142448_770736_15D0D980 
X-CRM114-Status: GOOD (  15.58  )
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

Replace the separate of_get_available_child_count() pre-count and
validation step with a single pass through
for_each_child_of_node_scoped().  Skip unavailable child nodes and
bail if more than MTK_PMIC_MAX_KEY_COUNT available keys are found.
Set nkeys after the loop so suspend/resume iterate only over
initialized entries.  Use a local key variable in the loop for
clarity.

Add an irq > 0 guard to the suspend/resume wakeup paths so that
uninitialized key entries are safely skipped.

Assisted-by: OpenCode:BigPickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 71 ++++++++++++--------------
 1 file changed, 34 insertions(+), 37 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index fd684ac16938..e2ced6e5165a 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -267,7 +267,7 @@ static int mtk_pmic_keys_suspend(struct device *dev)
 	int index;
 
 	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
-		if (keys->keys[index].wakeup) {
+		if (keys->keys[index].irq > 0 && keys->keys[index].wakeup) {
 			enable_irq_wake(keys->keys[index].irq);
 			if (keys->keys[index].irq_r > 0)
 				enable_irq_wake(keys->keys[index].irq_r);
@@ -283,7 +283,7 @@ static int mtk_pmic_keys_resume(struct device *dev)
 	int index;
 
 	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
-		if (keys->keys[index].wakeup) {
+		if (keys->keys[index].irq > 0 && keys->keys[index].wakeup) {
 			disable_irq_wake(keys->keys[index].irq);
 			if (keys->keys[index].irq_r > 0)
 				disable_irq_wake(keys->keys[index].irq_r);
@@ -324,13 +324,13 @@ MODULE_DEVICE_TABLE(of, of_mtk_pmic_keys_match_tbl);
 static int mtk_pmic_keys_probe(struct platform_device *pdev)
 {
 	int error, index = 0;
-	unsigned int keycount;
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node;
 	static const char *const irqnames[] = { "powerkey", "homekey" };
 	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
+	struct mtk_pmic_keys_info *key;
 	struct input_dev *input_dev;
 
 	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
@@ -353,45 +353,42 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	input_dev->id.product = 0x0001;
 	input_dev->id.version = 0x0001;
 
-	keycount = of_get_available_child_count(node);
-	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
-	    keycount > ARRAY_SIZE(irqnames)) {
-		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
-		return -EINVAL;
-	}
-
 	for_each_child_of_node_scoped(node, child) {
-		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
-
-		keys->keys[index].irq =
-			platform_get_irq_byname(pdev, irqnames[index]);
-		if (keys->keys[index].irq < 0)
-			return keys->keys[index].irq;
-
-		if (mtk_pmic_regs->key_release_irq) {
-			keys->keys[index].irq_r = platform_get_irq_byname(pdev,
-									  irqnames_r[index]);
-
-			if (keys->keys[index].irq_r < 0)
-				return keys->keys[index].irq_r;
+		if (index >= MTK_PMIC_MAX_KEY_COUNT) {
+			dev_err(&pdev->dev, "too many keys defined\n");
+			return -EINVAL;
 		}
 
-		error = of_property_read_u32(child,
-			"linux,keycodes", &keys->keys[index].keycode);
-		if (error) {
-			dev_err(keys->dev,
-				"failed to read key:%d linux,keycode property: %d\n",
-				index, error);
-			return error;
+		if (of_device_is_available(child)) {
+			key = &keys->keys[index];
+			key->regs = &mtk_pmic_regs->keys_regs[index];
+
+			key->irq = platform_get_irq_byname(pdev, irqnames[index]);
+			if (key->irq < 0)
+				return key->irq;
+
+			if (mtk_pmic_regs->key_release_irq) {
+				key->irq_r = platform_get_irq_byname(pdev, irqnames_r[index]);
+				if (key->irq_r < 0)
+					return key->irq_r;
+			}
+
+			error = of_property_read_u32(child, "linux,keycodes", &key->keycode);
+			if (error) {
+				dev_err(keys->dev,
+					"failed to read key:%d linux,keycode property: %d\n",
+					index, error);
+				return error;
+			}
+
+			if (of_property_present(child, "wakeup-source"))
+				key->wakeup = true;
+
+			error = mtk_pmic_key_setup(keys, key);
+			if (error)
+				return error;
 		}
 
-		if (of_property_read_bool(child, "wakeup-source"))
-			keys->keys[index].wakeup = true;
-
-		error = mtk_pmic_key_setup(keys, &keys->keys[index]);
-		if (error)
-			return error;
-
 		index++;
 	}
 
-- 
2.55.0


