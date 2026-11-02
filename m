Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8F607B458
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f2dKErQ/;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ihTbh9oJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s6I4cHkq0fuuN6rf65WlcWbhxrb9QhcwY/p8gIVUaoE=; b=f2dKErQ/to8QuN
	duKOaVCp1DAcv+06MhIXtdG5O+ZH7SZJCmXeJTWDqmo1/uTKymKPu80O1P7Km0Koi3SBm3e8p42Lj
	8BiR15s0+GojCTZnaSLJRPiF5ET8ZE0R+PuVY14fdekT7BVlJjvg3YIFPskXHIRo82k0PKQ4E8BXz
	QMXZxh+9NjRinQCM9rPwjb9ofz9T5VltY0VSzyfeUumj3QiJSBZl1mBsjghRLvfp3WQO/sKp4Ua7y
	rH1h2kZIMAIJOu9w0xUINCKnui61BxpqRiLOgU22NpP2jlkEay58h5M8N+SAq1MRRsdruD3GjShzF
	Xme8JdW0JV9Gogq8KPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuMh-0000000HDVA-0kV1;
	Mon, 02 Nov 2026 15:54:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuMc-0000000HDRC-1JgU
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 15:54:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a215e64962so28662565e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 07:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793634865; x=1794239665; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6I4cHkq0fuuN6rf65WlcWbhxrb9QhcwY/p8gIVUaoE=;
        b=ihTbh9oJXp/dHCdbpi5ApKrdFcDSnG02ae4PutZZCiHCnQghAsQp4E8CyUp5WZMsPy
         Um0eNKegKGvyG0qh4spccw5oZDTgTaYKLzPel/Uy1KpWqdHNELAyEiYfZloOHt7zNf8I
         FonAsbMfHUKr99AyK4US73N4EDEk4fLXBbCf5IBQPR9dGVgPvSKerTV6NV8ikKVTWOiQ
         EHrMqgHcwx/JJZG7O0SdL4W173RDR8AVak5x0J5SrLc1Wmz+RUwT7FgB+VOnp1X8VnBC
         E9AYJiRilQ7sfcHWhcsR2Fj9JKD8YC0huTsYGNsl2MfE1pj5iojYiZp9rx740M5c+Vrg
         xdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634865; x=1794239665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6I4cHkq0fuuN6rf65WlcWbhxrb9QhcwY/p8gIVUaoE=;
        b=LTcnnqZ11ReVXE6G2TnKFB2KVxUjnolt6Pfwq82qgM3DIhialTWVMI+9Gn/1h7ZmMA
         DxHLqoxGGM6LFxupBytmNtOcwgtp3hEPkydZj/hKWN3VZFhmmLk9UFTq42ytfIK+OxdN
         /zWuanRogv14f7OQsso6zHcUGOXBKdPiPEgoBj8XwcG3JHkgOmAhvk/smbsVMK+Op0fN
         CaBdOPHP544rhzcgD0koBp44TeEaJadnbTKrhvPtKU4gLcsR80TLlOJtUshNzjJmwqnf
         sdKd0RxVKSpcYJWpLMINwLFgeFLLy/7geIbnSoGaqB/IlQ/QAcaGJnXCiMlV4VuEtHce
         aplg==
X-Forwarded-Encrypted: i=1; AKwUvBw/aSUPU4PdYuhsgExVSZ3owxcycZe4xO9QXWG+1JXTuu/1eCsq/A2Csq9b+/TqZjmcEeQVHAGnZb6/n4BtJg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJCrpltGXhE59gv0NIPDyNp/gs704rnlryZhXvs//l0AO5FL5Lw
	y3g9e0aBvvaZJGACeNxDJxzGVPnepXKSWubR5+zw5Zx/OQK41Dw4AwGXUzbuDvSntM0=
X-Gm-Gg: AYBFou2Qp5byrR0GoYFqMT/a/8hC1kfTPlsp6I/dM/7dXxyuB+NUheD0my5WNmJ9qwe
	7icHoZBtqZNByUF29QXyWhZogArzNbxERA7BrsQtiQnKq91cKQ/tqtU8K6WKjtuQs9UGKYhwU9z
	gqwNZxit/zgk/uGulBcnPgb+K7F3g1al86EwLMSkt+iZ6rMj3zE2OcCPJTUaMIOA1GrJ414oXMf
	O45fuuekdmQG3Yw0CUmdyjwZvnFT+kma3MrsktbKDM/L2PzrFVFKbDa/xko2zKzBHjnOdrYTIJF
	I6F0slr/CDygOuK974Wp4FBdSIkdgPq6QTiecem5nO/gZYZb6WSFMWlhWcITOtXEjahB4tJMJEP
	CsqjfqS5zB0w4I/nRei2SjV3dDh+z2fZf5KefP2UDJ643QEAsrQU0t8CjE7PnYB4cPE3nt4L5VY
	++JgIL8lP+RJPRgILSZYkyej+ubFM/MnG08M7LZIQccskJP8mGCXuDM8hxxvLysuZnnMeXe2xb6
	IUDsW6UgN5r7ZL1+162qSswYufWojAJaNrOOZCu4lTZAHnRaJFNNnly9oKzOQlpdcFhlks3Nh73
	vC7IJPJQVAXdUdz4PJ4ZgokHwUnd5XiwcYFEwYUJMvcjH8+3UOnzo794
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4ac18b7df2cmr245616975e9.23.1793634864747;
        Mon, 02 Nov 2026 07:54:24 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm21229288f8f.51.2026.11.02.07.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:54:24 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 02 Nov 2026 15:54:18 +0000
Subject: [PATCH 2/2] regulator: mt6363: Fix VEMC voltage selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-rgp-67-mt6363-regulator-fixes-v1-2-420789a3113e@baylibre.com>
References: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
In-Reply-To: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?GIBEOM_LEE_=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_075426_396798_0F1ED989 
X-CRM114-Status: GOOD (  25.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VEMC encodes its voltage as a range and a trim value. The custom
getter looks up the range with

	if (rdesc->linear_range_selectors_bitfield[range] != calsel)

so it stops at the first non-matching range and the reported voltage is
wrong for every range setting. With hardware trap 1, the custom getter
and setter apply MT6363_RG_VEMC_VOSEL_1_MASK, the trap 1 range field,
to the trap 0 trim register and keep the trap 0 range field. Voltage
changes are then not applied and the reported voltage does not reflect
the trap 1 settings.

Apart from the trap handling, both callbacks reimplement the regulator
core pickable regmap helpers, which work for VEMC once the descriptor
holds the range field and trim register of the hardware trap. Select
that field and register at probe and use the helpers instead of
fixing the copies. Keep the setter as a wrapper for the TMA unlock
and relock around the write, which the helper does not do. A trap
value other than 0 or 1, or a failed trap read, now fails the probe
instead of the VEMC voltage get and set.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/regulator/mt6363-regulator.c       | 120 ++++++++---------------------
 include/linux/regulator/mt6363-regulator.h |   1 +
 2 files changed, 33 insertions(+), 88 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index ac79ad6698bf..27d12baa9f2f 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -4,7 +4,6 @@
 // Copyright (c) 2025 Collabora Ltd
 //                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 
-#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/devm-helpers.h>
 #include <linux/err.h>
@@ -484,30 +483,7 @@ static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 {
 	const __le16 tma_unlock_key = cpu_to_le16(MT6363_TMA_UNLOCK_VALUE);
 	const __le16 tma_lock_key = cpu_to_le16(0);
-	const struct regulator_desc *rdesc = rdev->desc;
-	struct regmap *regmap = rdev->regmap;
-	unsigned int range, val;
-	int i, ret;
-	u16 mask;
-
-	for (i = 0; i < rdesc->n_linear_ranges; i++) {
-		const struct linear_range *r = &rdesc->linear_ranges[i];
-		unsigned int voltages_in_range = linear_range_values_in_range(r);
-
-		if (sel < voltages_in_range)
-			break;
-		sel -= voltages_in_range;
-	}
-
-	if (i == rdesc->n_linear_ranges)
-		return -EINVAL;
-
-	ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &val);
-	if (ret)
-		return ret;
-
-	if (val > 1)
-		return -EINVAL;
+	int ret;
 
 	/* Unlock TMA for writing */
 	ret = regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L,
@@ -515,30 +491,8 @@ static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 	if (ret)
 		return ret;
 
-	/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
-	if (val == 1) {
-		mask = MT6363_RG_VEMC_VOSEL_1_MASK;
-		sel = FIELD_PREP(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
-	} else {
-		mask = rdesc->vsel_mask;
-	}
-
-	sel <<= ffs(rdesc->vsel_mask) - 1;
-	sel += rdesc->linear_ranges[i].min_sel;
-
-	range = rdesc->linear_range_selectors_bitfield[i];
-	range <<= ffs(rdesc->vsel_range_mask) - 1;
-
-	/* Write to the vreg calibration register for voltage finetuning */
-	ret = regmap_update_bits(regmap, rdesc->vsel_range_reg,
-				 rdesc->vsel_range_mask, range);
-	if (ret)
-		goto lock_tma;
-
-	/* Function must return the result of this write operation */
-	ret = regmap_update_bits(regmap, rdesc->vsel_reg, mask, sel);
+	ret = regulator_set_voltage_sel_pickable_regmap(rdev, sel);
 
-lock_tma:
 	/* Unconditionally re-lock TMA */
 	regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L,
 			  &tma_lock_key, sizeof(tma_lock_key));
@@ -546,45 +500,6 @@ static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 	return ret;
 }
 
-static int mt6363_vemc_get_voltage_sel(struct regulator_dev *rdev)
-{
-	const struct regulator_desc *rdesc = rdev->desc;
-	unsigned int vosel, trap, calsel;
-	int vcal, vsel, range, ret;
-
-	ret = regmap_read(rdev->regmap, rdesc->vsel_reg, &vosel);
-	if (ret)
-		return ret;
-
-	ret = regmap_read(rdev->regmap, rdesc->vsel_range_reg, &calsel);
-	if (ret)
-		return ret;
-
-	calsel &= rdesc->vsel_range_mask;
-	for (range = 0; range < rdesc->n_linear_ranges; range++)
-		if (rdesc->linear_range_selectors_bitfield[range] != calsel)
-			break;
-
-	if (range == rdesc->n_linear_ranges)
-		return -EINVAL;
-
-	ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &trap);
-	if (ret)
-		return ret;
-
-	/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
-	if (trap > 1)
-		return -EINVAL;
-	else if (trap == 1)
-		vsel = FIELD_GET(MT6363_RG_VEMC_VOSEL_1_MASK, vosel);
-	else
-		vsel = vosel & rdesc->vsel_mask;
-
-	vcal = linear_range_values_in_range_array(rdesc->linear_ranges, range);
-
-	return vsel + vcal;
-}
-
 static int mt6363_va15_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
 {
 	struct regmap *regmap = rdev->regmap;
@@ -697,7 +612,7 @@ static const struct regulator_ops mt6363_ldo_vemc_ops = {
 	.list_voltage = regulator_list_voltage_pickable_linear_range,
 	.map_voltage = regulator_map_voltage_pickable_linear_range,
 	.set_voltage_sel = mt6363_vemc_set_voltage_sel,
-	.get_voltage_sel = mt6363_vemc_get_voltage_sel,
+	.get_voltage_sel = regulator_get_voltage_sel_pickable_regmap,
 	.set_voltage_time_sel = regulator_set_voltage_time_sel,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -794,6 +709,30 @@ static int mt6363_backup_op_setting(struct regmap *map, struct mt6363_regulator_
 	return 0;
 }
 
+static int mt6363_vemc_select_bank(struct regmap *map, struct regulator_desc *desc)
+{
+	unsigned int trap;
+	int ret;
+
+	ret = regmap_read(map, MT6363_TOP_TRAP, &trap);
+	if (ret)
+		return ret;
+
+	/* The hardware trap value selects which VEMC voltage controls are used */
+	switch (trap) {
+	case 0:
+		desc->vsel_reg = MT6363_RG_VEMC_VOCAL_ADDR;
+		desc->vsel_range_mask = MT6363_RG_VEMC_VOSEL_MASK;
+		return 0;
+	case 1:
+		desc->vsel_reg = MT6363_RG_VEMC_VOCAL_1_ADDR;
+		desc->vsel_range_mask = MT6363_RG_VEMC_VOSEL_1_MASK;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static void mt6363_irq_remove(void *data)
 {
 	int *virq = data;
@@ -878,6 +817,11 @@ static int mt6363_regulator_probe(struct platform_device *pdev)
 	 */
 	regmap_read(config.regmap, MT6363_TOP_TRAP, &val);
 
+	ret = mt6363_vemc_select_bank(config.regmap,
+				      &mt6363_regulators[MT6363_ID_VEMC].desc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to select VEMC bank\n");
+
 	interrupt_parent = of_irq_find_parent(dev->of_node);
 	if (!interrupt_parent)
 		return dev_err_probe(dev, -EINVAL, "Cannot find IRQ parent\n");
diff --git a/include/linux/regulator/mt6363-regulator.h b/include/linux/regulator/mt6363-regulator.h
index 60761f01d3ad..e0d2c01827a7 100644
--- a/include/linux/regulator/mt6363-regulator.h
+++ b/include/linux/regulator/mt6363-regulator.h
@@ -138,6 +138,7 @@
 #define MT6363_RG_LDO_VSRAM_APU_VOSEL_ADDR	0x1b17
 #define MT6363_RG_LDO_VSRAM_APU_VOSEL_MASK	GENMASK(6, 0)
 #define MT6363_RG_VEMC_VOCAL_ADDR		0x1b1b
+#define MT6363_RG_VEMC_VOCAL_1_ADDR		0x1b1c
 #define MT6363_RG_VEMC_VOCAL_MASK		GENMASK(3, 0)
 #define MT6363_RG_LDO_VCN15_ADDR		0x1b57
 #define MT6363_RG_LDO_VCN15_EN_BIT		0

-- 
2.43.0


