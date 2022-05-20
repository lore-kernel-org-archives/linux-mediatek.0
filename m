Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E684C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3jRK67RqzrVmvY76RXon83SQ6KeD/yAXkpGUo6kcrEk=; b=intnTcYRi2zgv+
	JJYANK1rOv+PTxBZtpf5dqsJICRNCgl1s1zKNj658qnjeaiXgoWpi+isfNj556hzhUphQ1dbnehO/
	4dyK6+kfFWFSNvIy0hVCCuJuF4Ril2Ua3EgZoVM+GzTNanhPNlOAkvfI8RvE+wAmeUFeLXWCN1Znq
	KSXg6PeC4i3/6mLOLGjwQ2utMBRKztz/ytG/G4SimFJEbeAY5CVfsNgwHxQAwSir9hIJBWcml5ep/
	NNCwMToQX5TYseR0aixr4I934nptMhyE/cn5uMLQQWIj8nQdEfr13TkG5QU8rdp18D2Cskqwpxokj
	qLTVQXXg8Vj0bPcU2FpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns28e-00CUfe-3c; Fri, 20 May 2022 12:53:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns26a-00CTd3-Od; Fri, 20 May 2022 12:51:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2FCEC1F462BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653051103;
 bh=+QRSBoHse5q7vPQRO55UEJJKcrFXryf2svvX8jsupyQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jyuFBTkF79eteyDMwSvah/A/pUA/vOcE7Odgz8r6BhXRK6hrW4k+16RLhosbjd9iw
 sYXMKW2rJ06URdIX95Ij2XiLt46P0mgFIGFcv8nCW/DtOD/8SJZ8kPDJUlZyIozsGn
 q9ELUgVAztunisXSOuwaAh3XMxPP6qBAXLDAxhfVtI8z5YOUqAj0s5vRcqYbr/X32k
 VKsS4ZKjzi7KhNdb3+Ox0J5Uk8PqdDbzjCpc9srFjG6coI9jArqLKqWcTgSYkPbc5a
 he2RXHy0IsF8j2c0M62lBmRfyDxbvXJMtMUHVR1WrXjEenJvrYwFPeTX7SQqFbBQ5Y
 i3o6DFns8xLTA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] Input: mtk-pmic-keys - Transfer per-key bit in
 mtk_pmic_keys_regs
Date: Fri, 20 May 2022 14:51:30 +0200
Message-Id: <20220520125132.229191-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_055145_104326_32645D10 
X-CRM114-Status: GOOD (  12.69  )
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

Place the key bit in struct mtk_pmic_keys_regs to enhance this
driver's flexibility, in preparation for adding support for more
PMICs.

While at it, also remove the *_MASK and *_SHIFT definitions, as
these can be simply expressed as BIT(x), and "slightly rename"
the MTK_PMIC_{HOME,PWR}KEY_RST macro to better reflect the real
name for these bits.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 46 ++++++++++++++------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 83d0b90cc8cb..d8285612265f 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -18,17 +18,11 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#define MTK_PMIC_PWRKEY_RST_EN_MASK	0x1
-#define MTK_PMIC_PWRKEY_RST_EN_SHIFT	6
-#define MTK_PMIC_HOMEKEY_RST_EN_MASK	0x1
-#define MTK_PMIC_HOMEKEY_RST_EN_SHIFT	5
 #define MTK_PMIC_RST_DU_MASK		0x3
 #define MTK_PMIC_RST_DU_SHIFT		8
 
-#define MTK_PMIC_PWRKEY_RST		\
-	(MTK_PMIC_PWRKEY_RST_EN_MASK << MTK_PMIC_PWRKEY_RST_EN_SHIFT)
-#define MTK_PMIC_HOMEKEY_RST		\
-	(MTK_PMIC_HOMEKEY_RST_EN_MASK << MTK_PMIC_HOMEKEY_RST_EN_SHIFT)
+#define MTK_PMIC_MT6397_HOMEKEY_RST_EN	BIT(5)
+#define MTK_PMIC_MT6397_PWRKEY_RST_EN	BIT(6)
 
 #define MTK_PMIC_PWRKEY_INDEX	0
 #define MTK_PMIC_HOMEKEY_INDEX	1
@@ -40,21 +34,24 @@
  * @deb_mask:            Bitmask of this key in status register
  * @intsel_reg:          Interrupt selector register
  * @intsel_mask:         Bitmask of this key in interrupt selector
+ * @rst_en_mask:         Bitmask of this key in PMIC keys reset register
  */
 struct mtk_pmic_keys_regs {
 	u32 deb_reg;
 	u32 deb_mask;
 	u32 intsel_reg;
 	u32 intsel_mask;
+	u32 rst_en_mask;
 };
 
 #define MTK_PMIC_KEYS_REGS(_deb_reg, _deb_mask,		\
-	_intsel_reg, _intsel_mask)			\
+	_intsel_reg, _intsel_mask, _rst_mask)		\
 {							\
 	.deb_reg		= _deb_reg,		\
 	.deb_mask		= _deb_mask,		\
 	.intsel_reg		= _intsel_reg,		\
 	.intsel_mask		= _intsel_mask,		\
+	.rst_en_mask		= _rst_mask,		\
 }
 
 /**
@@ -70,30 +67,32 @@ struct mtk_pmic_regs {
 static const struct mtk_pmic_regs mt6397_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6397_CHRSTATUS,
-		0x8, MT6397_INT_RSV, 0x10),
+		0x8, MT6397_INT_RSV, 0x10, MTK_PMIC_MT6397_PWRKEY_RST_EN),
 	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6397_OCSTATUS2,
-		0x10, MT6397_INT_RSV, 0x8),
+		0x10, MT6397_INT_RSV, 0x8, MTK_PMIC_MT6397_HOMEKEY_RST_EN),
 	.pmic_rst_reg = MT6397_TOP_RST_MISC,
 };
 
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
-		0x2, MT6323_INT_MISC_CON, 0x10),
+		0x2, MT6323_INT_MISC_CON, 0x10, MTK_PMIC_MT6397_PWRKEY_RST_EN),
 	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
-		0x4, MT6323_INT_MISC_CON, 0x8),
+		0x4, MT6323_INT_MISC_CON, 0x8, MTK_PMIC_MT6397_HOMEKEY_RST_EN),
 	.pmic_rst_reg = MT6323_TOP_RST_MISC,
 };
 
 static const struct mtk_pmic_regs mt6358_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
-				   0x2, MT6358_PSC_TOP_INT_CON0, 0x5),
+				   0x2, MT6358_PSC_TOP_INT_CON0, 0x5,
+				   MTK_PMIC_MT6397_PWRKEY_RST_EN),
 	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
-				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa),
+				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa,
+				   MTK_PMIC_MT6397_HOMEKEY_RST_EN),
 	.pmic_rst_reg = MT6358_TOP_RST_MISC,
 };
 
@@ -140,6 +139,11 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
 {
 	int ret;
 	u32 long_press_mode, long_press_debounce;
+	const struct mtk_pmic_keys_regs *kregs_pwr;
+	const struct mtk_pmic_keys_regs *kregs_home;
+
+	kregs_pwr = keys->keys[MTK_PMIC_PWRKEY_INDEX].regs;
+	kregs_home = keys->keys[MTK_PMIC_HOMEKEY_INDEX].regs;
 
 	ret = of_property_read_u32(keys->dev->of_node,
 		"power-off-time-sec", &long_press_debounce);
@@ -157,16 +161,16 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
 
 	switch (long_press_mode) {
 	case LP_ONEKEY:
-		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
-		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
+		regmap_set_bits(keys->regmap, pmic_rst_reg, kregs_pwr->rst_en_mask);
+		regmap_clear_bits(keys->regmap, pmic_rst_reg, kregs_home->rst_en_mask);
 		break;
 	case LP_TWOKEY:
-		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
-		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
+		regmap_set_bits(keys->regmap, pmic_rst_reg, kregs_pwr->rst_en_mask);
+		regmap_set_bits(keys->regmap, pmic_rst_reg, kregs_home->rst_en_mask);
 		break;
 	case LP_DISABLE:
-		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
-		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
+		regmap_clear_bits(keys->regmap, pmic_rst_reg, kregs_pwr->rst_en_mask);
+		regmap_clear_bits(keys->regmap, pmic_rst_reg, kregs_home->rst_en_mask);
 		break;
 	default:
 		break;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
