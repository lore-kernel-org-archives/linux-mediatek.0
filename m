Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1D9C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 14:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=suQv81JVdkbrTz7UP6Wm7TtO08Fa9KN1FrDGsVFyI98=; b=vVldxgGUreJ5WZgBsid5iWY31C
	8A4BXX/KnTCbfxuisN7/Ef1y/2NWwBx+Mzz03FSymyNPqZ7Vh+G+UR1IUmsurPKy88bT6hx3JEsbZ
	z/MuZiB5BPHtZcboOCyEUPT6ZbB2LOxtIfwvrjiNBHnN5EiiRZlClJzikNtA3M7xPGdGBRUamddX1
	q+dfs+IinI8cPVP7+wbCKUtTSg0dBocdWX2SukO221PZLzQWnrxEi4TYKYUbLhywYe1pSfWdKs1QS
	xeboCfary0R16eIbAgT+iAg50/iuMzvh/rR/g8v3K0LPyIcODit/ylv0yEQ3hmIT/t/7j34oxnuaD
	JXrQl5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ped3R-00CkWb-1J;
	Tue, 21 Mar 2023 14:33:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ped3M-00CkU7-1U;
	Tue, 21 Mar 2023 14:33:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1EE7966030D8;
	Tue, 21 Mar 2023 14:33:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679409207;
	bh=hfOZhZvwpqq4ufYx8Sox86gnGr5bS6DeOHGjzIeVHPo=;
	h=From:To:Cc:Subject:Date:From;
	b=QjFR76b5ozWwX+fQ0Mlt67ZpeSPuvj5YdKFce9CbrSGWw2Sy62WzQ+jmobznEWm3o
	 DudEvYaKi02PXXhtXEsll5xLZCNVlCCCCeg2Uzj/AR0Hxlw0i2n6gPH+GmuIyTEoe8
	 6PzCP5dU2w7P1ZceoHlpwalnFBVJkKeZahOJgeVHvMMUf6t/nOX1AQANWaxyBfP+sC
	 iMgvfajHEkUD8m0r8Kg3jHjZLceKfeT9vfOhU6XDwg8Y44hczyK+P/Yt2V2MNRJAc5
	 tcVMb6FYKHsBqKAnKI8xuXquq0l/Ej7/Bz2NJrVySMGjnAAQjqDpMjK+LgrKqkNZLA
	 xWtY4kxZFDc9A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: srinivas.kandagatla@linaro.org
Cc: wenst@chromium.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] nvmem: mtk-efuse: Support postprocessing for GPU speed binning data
Date: Tue, 21 Mar 2023 15:33:19 +0100
Message-Id: <20230321143319.333803-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_073332_729175_7EBE4797 
X-CRM114-Status: GOOD (  19.27  )
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

On some MediaTek SoCs GPU speed binning data is available for read
in the SoC's eFuse array but it has a format that is incompatible
with what the OPP API expects, as we read a number from 0 to 7 but
opp-supported-hw is expecting a bitmask to enable an OPP entry:
being what we read limited to 0-7, it's straightforward to simply
convert the value to BIT(value) as a post-processing action.

So, introduce post-processing support and enable it by evaluating
the newly introduced platform data's `uses_post_processing` member,
currently enabled only for MT8186.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/nvmem/mtk-efuse.c | 53 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index a08e0aedd21c..b36cd0dcc8c7 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -10,6 +10,11 @@
 #include <linux/io.h>
 #include <linux/nvmem-provider.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+
+struct mtk_efuse_pdata {
+	bool uses_post_processing;
+};
 
 struct mtk_efuse_priv {
 	void __iomem *base;
@@ -29,6 +34,37 @@ static int mtk_reg_read(void *context,
 	return 0;
 }
 
+static int mtk_efuse_gpu_speedbin_pp(void *context, const char *id, int index,
+				     unsigned int offset, void *data, size_t bytes)
+{
+	u8 *val = data;
+
+	if (val[0] < 8)
+		val[0] = BIT(val[0]);
+
+	return 0;
+}
+
+static void mtk_efuse_fixup_cell_info(struct nvmem_device *nvmem,
+				      struct nvmem_layout *layout,
+				      struct nvmem_cell_info *cell)
+{
+	size_t sz = strlen(cell->name);
+
+	/*
+	 * On some SoCs, the GPU speedbin is not read as bitmask but as
+	 * a number with range [0-7] (max 3 bits): post process to use
+	 * it in OPP tables to describe supported-hw.
+	 */
+	if (cell->nbits <= 3 &&
+	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0)
+		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
+}
+
+static struct nvmem_layout mtk_efuse_layout = {
+	.fixup_cell_info = mtk_efuse_fixup_cell_info,
+};
+
 static int mtk_efuse_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -36,6 +72,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	struct nvmem_device *nvmem;
 	struct nvmem_config econfig = {};
 	struct mtk_efuse_priv *priv;
+	const struct mtk_efuse_pdata *pdata;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -45,20 +82,32 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	pdata = device_get_match_data(dev);
 	econfig.stride = 1;
 	econfig.word_size = 1;
 	econfig.reg_read = mtk_reg_read;
 	econfig.size = resource_size(res);
 	econfig.priv = priv;
 	econfig.dev = dev;
+	if (pdata->uses_post_processing)
+		econfig.layout = &mtk_efuse_layout;
 	nvmem = devm_nvmem_register(dev, &econfig);
 
 	return PTR_ERR_OR_ZERO(nvmem);
 }
 
+static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
+	.uses_post_processing = true,
+};
+
+static const struct mtk_efuse_pdata mtk_efuse_pdata = {
+	.uses_post_processing = false,
+};
+
 static const struct of_device_id mtk_efuse_of_match[] = {
-	{ .compatible = "mediatek,mt8173-efuse",},
-	{ .compatible = "mediatek,efuse",},
+	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
+	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
+	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
 	{/* sentinel */},
 };
 MODULE_DEVICE_TABLE(of, mtk_efuse_of_match);
-- 
2.40.0


