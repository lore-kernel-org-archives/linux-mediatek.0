Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB180C3DA60
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 08:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CVYiSEH5TJLIq4sUrTIJQCgf6MT23Q8ADvzMXKrLVtc=; b=qy2BlelsmwNQeomWydDae+MbOy
	xDQRUyJ7f/jWdtj2RX2C0GSO0wIhzkpNC43ZgZ/JHQu2FTK7utRxJ+1Qari/VCfOiquUdK9WBCK/Z
	Mivds/8vXnlKr3kcKI0KiC9ADBLN3Zc3EQVar1srfK1dhEoKarW4+6vaRowmKNz8oJ9jyH9MYNyCH
	/ZI+bSePJctDP20PDsQenPKDM/xGGh5SoSPIJrDBB2x/AI8TsPvAi9Xif1cPj1ZPIOd3TD/+qYxUq
	Bm/lsxm+4N8ZWcrBhPDC0E1TMGBfJy64ggLFN79sA3quLbaPKuvSJDXgaPeOfHnSsK+1zetUgGAci
	JAbRJPfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMSn-0000000GNeA-2Mm5;
	Thu, 18 Jul 2024 08:26:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMSN-0000000GNTm-0oLJ;
	Thu, 18 Jul 2024 08:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721291142;
	bh=gsCMyNCJn0oMPKaDDmmHARKMV4LsNOy2UpPcFy7z1+Q=;
	h=From:To:Cc:Subject:Date:From;
	b=Bn1Q1+n3935Q24tdB0qSaGoPihJ+Pw3KqLgeuYwoQn1b32OiRned5kV7aLOub5Dzy
	 OtCMW974w6slBoRNpjBbenWyeBhnT3gWhJ323FG5FMhSZxOR4File5sy8QzVXVb2Nn
	 4pMPSqnDA2wwmbwUZxtBejC/obffkzd5yhkg7r7OuXpu3n/C1WGvR8JLuWzed4fSti
	 wnVGBbjibn1Q8yjPH2LfoP4G9GpXvwnrOB+h/KKqEV9YPLszo9R9fgtFD6/a11Xf2P
	 m4a3JzhcBNAKZLL4EOh+6umsa5eQRnL4KG7Huy7mMcsXcF/W8Na9NPisazCVOh+SiY
	 swdO4INnTw96Q==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 632023782167;
	Thu, 18 Jul 2024 08:25:41 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mturquette@baylibre.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH] clk: mediatek: reset: Remove unused mtk_register_reset_controller()
Date: Thu, 18 Jul 2024 10:25:28 +0200
Message-ID: <20240718082528.220750-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_012543_414918_FEA817D4 
X-CRM114-Status: GOOD (  11.81  )
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

Now that all clock controllers have been migrated to the new
mtk_register_reset_controller_with_dev() function, the one taking
struct device node is now unused: remove it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/reset.c | 59 ------------------------------------
 drivers/clk/mediatek/reset.h | 10 ------
 2 files changed, 69 deletions(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 290ceda84ce4..069f9e909cb0 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -110,65 +110,6 @@ static int reset_xlate(struct reset_controller_dev *rcdev,
 	return data->desc->rst_idx_map[reset_spec->args[0]];
 }
 
-int mtk_register_reset_controller(struct device_node *np,
-				  const struct mtk_clk_rst_desc *desc)
-{
-	struct regmap *regmap;
-	const struct reset_control_ops *rcops = NULL;
-	struct mtk_clk_rst_data *data;
-	int ret;
-
-	if (!desc) {
-		pr_err("mtk clock reset desc is NULL\n");
-		return -EINVAL;
-	}
-
-	switch (desc->version) {
-	case MTK_RST_SIMPLE:
-		rcops = &mtk_reset_ops;
-		break;
-	case MTK_RST_SET_CLR:
-		rcops = &mtk_reset_ops_set_clr;
-		break;
-	default:
-		pr_err("Unknown reset version %d\n", desc->version);
-		return -EINVAL;
-	}
-
-	regmap = device_node_to_regmap(np);
-	if (IS_ERR(regmap)) {
-		pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
-		return -EINVAL;
-	}
-
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->desc = desc;
-	data->regmap = regmap;
-	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.ops = rcops;
-	data->rcdev.of_node = np;
-
-	if (data->desc->rst_idx_map_nr > 0) {
-		data->rcdev.of_reset_n_cells = 1;
-		data->rcdev.nr_resets = desc->rst_idx_map_nr;
-		data->rcdev.of_xlate = reset_xlate;
-	} else {
-		data->rcdev.nr_resets = desc->rst_bank_nr * RST_NR_PER_BANK;
-	}
-
-	ret = reset_controller_register(&data->rcdev);
-	if (ret) {
-		pr_err("could not register reset controller: %d\n", ret);
-		kfree(data);
-		return ret;
-	}
-
-	return 0;
-}
-
 int mtk_register_reset_controller_with_dev(struct device *dev,
 					   const struct mtk_clk_rst_desc *desc)
 {
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 6a58a3d59165..562ffd290a22 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -59,16 +59,6 @@ struct mtk_clk_rst_data {
 	const struct mtk_clk_rst_desc *desc;
 };
 
-/**
- * mtk_register_reset_controller - Register MediaTek clock reset controller
- * @np: Pointer to device node.
- * @desc: Constant pointer to description of clock reset.
- *
- * Return: 0 on success and errorno otherwise.
- */
-int mtk_register_reset_controller(struct device_node *np,
-				  const struct mtk_clk_rst_desc *desc);
-
 /**
  * mtk_register_reset_controller - Register mediatek clock reset controller with device
  * @np: Pointer to device.
-- 
2.45.2


