Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B120C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojlCv6jhBy9x7arL43jOQggfeEsUhq9rsaugiGK6IK8=; b=tkx5KwHkOVLykk
	YOrKtDk5KRUMpNjzz09iHfhtwCceg8xknY88Np/1PLS0AxDRj5IfUi4ilkOaO8YAGfAbvrPZLHTj6
	Io9eyPO4nOa4Xdo2ErTkdflVKGdtdU6whYYkznFRg6W62bN6bZBVe6/fedu45rB/GYjT8lfdigUO7
	kcoCu5KkK9QMZZ61qjp6c9Ii6bUyNqowEt2ZdPCGQnySXvsbT9NrDJzSNgcWcdtpo4RQcV+Wtb+KH
	RHPKXLmgpvYwINLjMbhdMofhrKeOx+kRTJf1kdy0N9KZgMz9rwl3PnlXGYkh3PBzpJWlKsGImnkFM
	d+Ql7NugpAdtH3VEmakg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntQxN-007QqH-ES; Tue, 24 May 2022 09:36:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntQwg-007QXp-7h; Tue, 24 May 2022 09:35:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3223E1F42BE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653384912;
 bh=/HUYMQUZzdBAjQXE3aaXZwy4OOxFI8w5rmaGmz21Fek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bam8Hv+/gwV41nT/XOqLQaKPSnGOtK97i9xkzVh/TtlvLEvimHUaivlBprBgN3QGS
 PjGbwHRz2hID4cFt6uOsbEK83LU4au39vdbkn8aIB/eA6lAy3/i4YL+0MIEsT9zDjw
 BnxH0JO+7u99irflF/mGFagkAMFYnhKjkTpe3dyC7yLma+RBX0wli7743MdbgAfVY8
 L8Qc4B59tS3CEfpffYyilrPwcTq8lANrGMJvCipI9rLfmLbqhl2V8cAdjTX1pN9oHD
 uXYxIUVEKTmlOVzp+X0Kcx+PSLuM6R176sb7zlOe3iVXWFjMd3wku9XnNwix50IhEn
 1kM+8PiTObalA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] Input: mtk-pmic-keys - Transfer per-key bit in
 mtk_pmic_keys_regs
Date: Tue, 24 May 2022 11:35:03 +0200
Message-Id: <20220524093505.85438-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524093505.85438-1-angelogioacchino.delregno@collabora.com>
References: <20220524093505.85438-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_023518_443242_5C948B44 
X-CRM114-Status: GOOD (  12.71  )
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

While at it, remove the definition of MTK_PMIC_RST_KEY_MASK as
we are now dynamically setting the keymask relatively to the keys
that are defined in the newly added rst_en_mask variable, on a
per-key basis.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 30 ++++++++++++++++----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index d2f0db245ff6..2509a349a173 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -20,7 +20,6 @@
 
 #define MTK_PMIC_RST_DU_MASK	GENMASK(9, 8)
 #define MTK_PMIC_RST_DU_SHIFT	8
-#define MTK_PMIC_RST_KEY_MASK	GENMASK(6, 5)
 #define MTK_PMIC_PWRKEY_RST	BIT(6)
 #define MTK_PMIC_HOMEKEY_RST	BIT(5)
 
@@ -33,15 +32,17 @@ struct mtk_pmic_keys_regs {
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
 
 struct mtk_pmic_regs {
@@ -52,30 +53,32 @@ struct mtk_pmic_regs {
 static const struct mtk_pmic_regs mt6397_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6397_CHRSTATUS,
-		0x8, MT6397_INT_RSV, 0x10),
+		0x8, MT6397_INT_RSV, 0x10, MTK_PMIC_PWRKEY_RST),
 	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6397_OCSTATUS2,
-		0x10, MT6397_INT_RSV, 0x8),
+		0x10, MT6397_INT_RSV, 0x8, MTK_PMIC_HOMEKEY_RST),
 	.pmic_rst_reg = MT6397_TOP_RST_MISC,
 };
 
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
-		0x2, MT6323_INT_MISC_CON, 0x10),
+		0x2, MT6323_INT_MISC_CON, 0x10, MTK_PMIC_PWRKEY_RST),
 	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
-		0x4, MT6323_INT_MISC_CON, 0x8),
+		0x4, MT6323_INT_MISC_CON, 0x8, MTK_PMIC_HOMEKEY_RST),
 	.pmic_rst_reg = MT6323_TOP_RST_MISC,
 };
 
 static const struct mtk_pmic_regs mt6358_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
-				   0x2, MT6358_PSC_TOP_INT_CON0, 0x5),
+				   0x2, MT6358_PSC_TOP_INT_CON0, 0x5,
+				   MTK_PMIC_PWRKEY_RST),
 	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
-				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa),
+				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa,
+				   MTK_PMIC_HOMEKEY_RST),
 	.pmic_rst_reg = MT6358_TOP_RST_MISC,
 };
 
@@ -104,10 +107,14 @@ enum mtk_pmic_keys_lp_mode {
 static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
 					 u32 pmic_rst_reg)
 {
+	const struct mtk_pmic_keys_regs *kregs_home, *kregs_pwr;
 	u32 long_press_mode, long_press_debounce;
 	u32 value, mask;
 	int error;
 
+	kregs_home = keys->keys[MTK_PMIC_HOMEKEY_INDEX].regs;
+	kregs_pwr = keys->keys[MTK_PMIC_PWRKEY_INDEX].regs;
+
 	error = of_property_read_u32(keys->dev->of_node, "power-off-time-sec",
 				     &long_press_debounce);
 	if (error)
@@ -124,15 +131,16 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
 
 	switch (long_press_mode) {
 	case LP_TWOKEY:
-		value |= MTK_PMIC_HOMEKEY_RST;
+		value |= kregs_home->rst_en_mask;
 		fallthrough;
 
 	case LP_ONEKEY:
-		value |= MTK_PMIC_PWRKEY_RST;
+		value |= kregs_pwr->rst_en_mask;
 		fallthrough;
 
 	case LP_DISABLE:
-		mask |= MTK_PMIC_RST_KEY_MASK;
+		mask |= kregs_home->rst_en_mask;
+		mask |= kregs_pwr->rst_en_mask;
 		break;
 
 	default:
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
