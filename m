Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90ADFC352A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 20:22:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A8052465D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 20:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVYPCdDv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4trjl1G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A8052465D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHv2nAoSceoE82MMPYqCj9MJvA/+mr0OZvAfTgOqLoI=; b=NVYPCdDvvlhGDK
	QIPnHH2sM1R5Q95AQdPzjBWfh+jluFJP8mwXt4PPU62gdfqFkdl9Q8P0CtwEjCdXGscpg4zZtiBDJ
	zuWRg5IjRgjx7yu2ZUR8ppP7bxb3DMZWIv6uQ2jfVoI60h4tkQljgPo6+D3TVCZ/ce0mgfih5eUyP
	MRNOGLqU1skcvb3UKvOxIiGtHPk1RAIPb0Rfl6/bOVvH2pXNei6H/Ld2CjdT2A3pxfVbARIoPa2Sg
	1gjq+3+gaI+tW9l/X0iLVOkLQm81RlbMB2nlVyJeZU1ps8Ds0kc/3U/B/x9FRs26etCRKbaYw0vUe
	P0mA6qJ+jLYOIDFsw3Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Kzn-0001iC-Ef; Thu, 13 Feb 2020 20:21:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2KyG-0008SB-Dn; Thu, 13 Feb 2020 20:20:27 +0000
Received: from ziggy.cz (unknown [37.223.145.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E8CE246A8;
 Thu, 13 Feb 2020 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581625223;
 bh=hxRcJYoy8SGbzWSvYwP+lrF+K6o+1MahUvwuVRaYRqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a4trjl1Gky0Ho9pYcEyMwDgUhAyP3F3t8E3mQ10yWETa5J02xvVkyYgqLEQd4dFl5
 3mCt93P8GAbBRvvs4rrENEJ0VfouAWNSpAoD5tuA9NEwZ0UcI2hJrEG75q75IqB2Cq
 UaJHShPe+jwBpOT2nxIDuFDRnPLrV3SopY2ie73k=
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v7 04/13] drm/mediatek: Use regmap for register access
Date: Thu, 13 Feb 2020 21:19:44 +0100
Message-Id: <20200213201953.15268-5-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213201953.15268-1-matthias.bgg@kernel.org>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_122025_698871_2119AD43 
X-CRM114-Status: GOOD (  15.31  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 rdunlap@infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 matthias.bgg@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The mmsys memory space is shared between the drm and the
clk driver. Use regmap to access it.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: CK Hu <ck.hu@mediatek.com>

---

Changes in v7:
- add R-by from CK

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 50 +++++++++++--------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 13 ++-----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  2 +-
 5 files changed, 30 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0dfcd1787e65..ea003a225604 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -28,7 +28,7 @@
  * @enabled: records whether crtc_enable succeeded
  * @planes: array of 4 drm_plane structures, one for each overlay plane
  * @pending_planes: whether any plane has pending changes to be applied
- * @config_regs: memory mapped mmsys configuration register space
+ * @config_regs: regmap mapped mmsys configuration register space
  * @mutex: handle to one of the ten disp_mutex streams
  * @ddp_comp_nr: number of components in ddp_comp
  * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
@@ -50,7 +50,7 @@ struct mtk_drm_crtc {
 	u32				cmdq_event;
 #endif
 
-	void __iomem			*config_regs;
+	struct regmap			*config_regs;
 	struct mtk_disp_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 13035c906035..302753744cc6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -383,61 +383,53 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
 	return value;
 }
 
-static void mtk_ddp_sout_sel(void __iomem *config_regs,
+static void mtk_ddp_sout_sel(struct regmap *config_regs,
 			     enum mtk_ddp_comp_id cur,
 			     enum mtk_ddp_comp_id next)
 {
 	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
-		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
+		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
+				BLS_TO_DSI_RDMA1_TO_DPI1);
 	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
-		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
-		writel_relaxed(DSI_SEL_IN_RDMA,
-			       config_regs + DISP_REG_CONFIG_DSI_SEL);
-		writel_relaxed(DPI_SEL_IN_BLS,
-			       config_regs + DISP_REG_CONFIG_DPI_SEL);
+		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
+				BLS_TO_DPI_RDMA1_TO_DSI);
+		regmap_write(config_regs, DISP_REG_CONFIG_DSI_SEL,
+				DSI_SEL_IN_RDMA);
+		regmap_write(config_regs, DISP_REG_CONFIG_DPI_SEL,
+				DPI_SEL_IN_BLS);
 	}
 }
 
-void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
+void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next)
 {
-	unsigned int addr, value, reg;
+	unsigned int addr, value;
 
 	value = mtk_ddp_mout_en(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) | value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, value);
 
 	mtk_ddp_sout_sel(config_regs, cur, next);
 
 	value = mtk_ddp_sel_in(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) | value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, value);
 }
 
-void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
+void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
 				   enum mtk_ddp_comp_id cur,
 				   enum mtk_ddp_comp_id next)
 {
-	unsigned int addr, value, reg;
+	unsigned int addr, value;
 
 	value = mtk_ddp_mout_en(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) & ~value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, 0);
 
 	value = mtk_ddp_sel_in(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) & ~value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, 0);
 }
 
 struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
index 827be424a148..01ff8b68881f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
@@ -12,10 +12,10 @@ struct regmap;
 struct device;
 struct mtk_disp_mutex;
 
-void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
+void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next);
-void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
+void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
 				   enum mtk_ddp_comp_id cur,
 				   enum mtk_ddp_comp_id next);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0563c6813333..b68837ea02b3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -6,6 +6,7 @@
 
 #include <linux/component.h>
 #include <linux/iommu.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -425,7 +426,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_drm_private *private;
-	struct resource *mem;
 	struct device_node *node;
 	struct component_match *match = NULL;
 	int ret;
@@ -437,14 +437,9 @@ static int mtk_drm_probe(struct platform_device *pdev)
 
 	private->data = of_device_get_match_data(dev);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	private->config_regs = devm_ioremap_resource(dev, mem);
-	if (IS_ERR(private->config_regs)) {
-		ret = PTR_ERR(private->config_regs);
-		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
-			ret);
-		return ret;
-	}
+	private->config_regs = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(private->config_regs))
+		return PTR_ERR(private->config_regs);
 
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(dev->of_node->parent, node) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 17bc99b9f5d4..03201080688d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -39,7 +39,7 @@ struct mtk_drm_private {
 
 	struct device_node *mutex_node;
 	struct device *mutex_dev;
-	void __iomem *config_regs;
+	struct regmap *config_regs;
 	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
 	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
 	const struct mtk_mmsys_driver_data *data;
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
