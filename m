Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBB3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ByDHYJyY/LLZuHyeYSPgTESdjHIjuGJh4+Sj4R1oWI=; b=p0jyFKNcpRAb2N
	UHLQ3vvIoVSAn4lRY3xjIvIWzWAHku1xrIZwL1dug9oaHEIdA0NFDZxJAxo+vSgtCBo4vcykR9TMO
	y1mMJ+BZJoZIhunkG6MBpB1bAAAvMmL1G+M11i5+Fkv/Fub5pXayDjF9ALK2ybZYBf5GMNEdi6fHD
	Wd9SuzfZoQlw/w3/pK1VVC9aNwBbtjXOa/OLNrwe7ZG+dz1jbLIO+A8hR2CnUQvSQWUyiZbjtd5EW
	UMgynav0fELqa9Y+poD31GggiU3ZG6AT2XrWhzytV1kps81ZMh8Xik81zWrMonV6JhOAOQ4JXbn5L
	wMWVx0HqOFf5vovkFr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns28h-00CUhY-1q; Fri, 20 May 2022 12:53:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns26b-00CTdd-CH; Fri, 20 May 2022 12:51:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BFF531F462BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653051104;
 bh=82AzsQEjRUi2HwF6h/SdIW38pOVcKxedGJa6T0RPfFo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cNowLvhoAMnRbvtEzS6N8rshccKOmDp/1c46XxhXb+GF6xzaC/Xa68snSNt6zIVok
 IwURp1T3eMi4Ytuq304dXgSTClvDfH5VVrVRNANxX8bkea8RZ1UfmqIEH7DjLmcuJv
 ajjcJsQLBS0hx9FIcNzYb3zVby+5Wr97ilxs4wIX4WiMNRTk70bjpzK/sKQwBXT9wH
 BTexZLr3mOUR5A3QOTM9ldzdeZJ1c59mBQxj0DIrcVImvm1/9mrPLw/CVnF9Tm8sU3
 AT7eP96cXjSLW/+U+0kwbX/zOrugY743STRUe1v6mWyAEFJ6gU24sQjibGDVb/KECt
 Hn+uxc5F/tDZg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] Input: mtk-pmic-keys - Move long press debounce mask to
 mtk_pmic_regs
Date: Fri, 20 May 2022 14:51:31 +0200
Message-Id: <20220520125132.229191-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_055145_773869_8A87F9FC 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As the second and last step of preparation to add support for more
PMICs in this driver, move the long press debounce mask to struct
mtk_pmic_regs and use that in mtk_pmic_keys_lp_reset_setup() instead
of directly using the definition.

While at it, remove the MTK_PMIC_RST_DU_{MASK,SHIFT} definitions, as
these can be expressed with the GENMASK macro and a new name was
chosen for that, as to uniform the definition names with the others
found in this driver.

Lastly, it was necessary to change the function signature of
mtk_pmic_keys_lp_reset_setup() to now pass a pointer to the main
mtk_pmic_regs structure, since that's what contains the reset
debounce mask now and, for readability purposes, for this function,
all of the references to keys->regmap were changed to use a local
'rmap' pointer, or the calls to regmap_{set,clear}_bits would be
~94 columns long.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 33 +++++++++++++++-----------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index d8285612265f..acd5aefac5f9 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -18,11 +18,9 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#define MTK_PMIC_RST_DU_MASK		0x3
-#define MTK_PMIC_RST_DU_SHIFT		8
-
 #define MTK_PMIC_MT6397_HOMEKEY_RST_EN	BIT(5)
 #define MTK_PMIC_MT6397_PWRKEY_RST_EN	BIT(6)
+#define MTK_PMIC_MT6397_RST_DU_MASK	GENMASK(9, 8)
 
 #define MTK_PMIC_PWRKEY_INDEX	0
 #define MTK_PMIC_HOMEKEY_INDEX	1
@@ -58,10 +56,12 @@ struct mtk_pmic_keys_regs {
  * struct mtk_pmic_regs - PMIC Keys registers
  * @keys_regs:           Specific key registers
  * @pmic_rst_reg:        PMIC Keys reset register
+ * @rst_lprst_mask:      Long-press reset timeout bitmask
  */
 struct mtk_pmic_regs {
 	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
 	u32 pmic_rst_reg;
+	u32 rst_lprst_mask;
 };
 
 static const struct mtk_pmic_regs mt6397_regs = {
@@ -72,6 +72,7 @@ static const struct mtk_pmic_regs mt6397_regs = {
 		MTK_PMIC_KEYS_REGS(MT6397_OCSTATUS2,
 		0x10, MT6397_INT_RSV, 0x8, MTK_PMIC_MT6397_HOMEKEY_RST_EN),
 	.pmic_rst_reg = MT6397_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_MT6397_RST_DU_MASK,
 };
 
 static const struct mtk_pmic_regs mt6323_regs = {
@@ -82,6 +83,7 @@ static const struct mtk_pmic_regs mt6323_regs = {
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
 		0x4, MT6323_INT_MISC_CON, 0x8, MTK_PMIC_MT6397_HOMEKEY_RST_EN),
 	.pmic_rst_reg = MT6323_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_MT6397_RST_DU_MASK,
 };
 
 static const struct mtk_pmic_regs mt6358_regs = {
@@ -94,6 +96,7 @@ static const struct mtk_pmic_regs mt6358_regs = {
 				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa,
 				   MTK_PMIC_MT6397_HOMEKEY_RST_EN),
 	.pmic_rst_reg = MT6358_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_MT6397_RST_DU_MASK,
 };
 
 /**
@@ -135,24 +138,26 @@ enum mtk_pmic_keys_lp_mode {
 };
 
 static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
-		u32 pmic_rst_reg)
+					 const struct mtk_pmic_regs *regs)
 {
 	int ret;
+	struct regmap *rmap;
 	u32 long_press_mode, long_press_debounce;
 	const struct mtk_pmic_keys_regs *kregs_pwr;
 	const struct mtk_pmic_keys_regs *kregs_home;
 
 	kregs_pwr = keys->keys[MTK_PMIC_PWRKEY_INDEX].regs;
 	kregs_home = keys->keys[MTK_PMIC_HOMEKEY_INDEX].regs;
+	rmap = keys->regmap;
 
 	ret = of_property_read_u32(keys->dev->of_node,
 		"power-off-time-sec", &long_press_debounce);
 	if (ret)
 		long_press_debounce = 0;
 
-	regmap_update_bits(keys->regmap, pmic_rst_reg,
-			   MTK_PMIC_RST_DU_MASK << MTK_PMIC_RST_DU_SHIFT,
-			   long_press_debounce << MTK_PMIC_RST_DU_SHIFT);
+	regmap_update_bits(rmap, regs->pmic_rst_reg,
+			   regs->rst_lprst_mask,
+			   long_press_debounce << ffs(regs->rst_lprst_mask));
 
 	ret = of_property_read_u32(keys->dev->of_node,
 		"mediatek,long-press-mode", &long_press_mode);
@@ -161,16 +166,16 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
 
 	switch (long_press_mode) {
 	case LP_ONEKEY:
-		regmap_set_bits(keys->regmap, pmic_rst_reg, kregs_pwr->rst_en_mask);
-		regmap_clear_bits(keys->regmap, pmic_rst_reg, kregs_home->rst_en_mask);
+		regmap_set_bits(rmap, regs->pmic_rst_reg, kregs_pwr->rst_en_mask);
+		regmap_clear_bits(rmap, regs->pmic_rst_reg, kregs_home->rst_en_mask);
 		break;
 	case LP_TWOKEY:
-		regmap_set_bits(keys->regmap, pmic_rst_reg, kregs_pwr->rst_en_mask);
-		regmap_set_bits(keys->regmap, pmic_rst_reg, kregs_home->rst_en_mask);
+		regmap_set_bits(rmap, regs->pmic_rst_reg, kregs_pwr->rst_en_mask);
+		regmap_set_bits(rmap, regs->pmic_rst_reg, kregs_home->rst_en_mask);
 		break;
 	case LP_DISABLE:
-		regmap_clear_bits(keys->regmap, pmic_rst_reg, kregs_pwr->rst_en_mask);
-		regmap_clear_bits(keys->regmap, pmic_rst_reg, kregs_home->rst_en_mask);
+		regmap_clear_bits(rmap, regs->pmic_rst_reg, kregs_pwr->rst_en_mask);
+		regmap_clear_bits(rmap, regs->pmic_rst_reg, kregs_home->rst_en_mask);
 		break;
 	default:
 		break;
@@ -378,7 +383,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	mtk_pmic_keys_lp_reset_setup(keys, mtk_pmic_regs->pmic_rst_reg);
+	mtk_pmic_keys_lp_reset_setup(keys, mtk_pmic_regs);
 
 	platform_set_drvdata(pdev, keys);
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
