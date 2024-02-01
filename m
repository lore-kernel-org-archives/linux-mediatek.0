Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3DDC4828C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJa2H8jgYSSCJoRUZEBOBXttRcKREalWI5p9DjRjg1c=; b=RiWcI0IpZlC3GHZnsPiaFWk0ai
	iBMfClt1PfnSML1za+VM742zvNDU0nXvKsFZ3ZLwnkhY/TO4T73/SPYGCwYPMXdzKuRGHRw2JyOiG
	mEOcdhmymD8zf1GikV3TrrmgJT+0nmdrXxItr4zYXwkcD0/xqROhjRrR4yU/gzKCNMZU+8SAc3Ib9
	AfoapcEqkMKiq879+91vS8d4cn8WKk8CHkg8fSqQixe/po6dHWE+RuTSd9G7n1PTWKaw2DUIe1Q2b
	dpm2MkNdjyqaK537beZ+OrRftNtCDJCJeWadtbgCtcx3/Osz/VLKzte6V5gRNW0VkpmIr3GOd9NYz
	y/IdlKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWZP-00000007qUq-2jji;
	Thu, 01 Feb 2024 12:53:31 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWZA-00000007qFu-2ltn;
	Thu, 01 Feb 2024 12:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706791994;
	bh=MYH+i/BtT+AMUARp16Q2uQJXlZ3LL8lZ/S/2XJY1/hY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yI0OXJ0ThXQiHmKqKqrs85H1Pyh52sjE5BWediXGJgifnLTkgWwH9HOEUs9ahG3D6
	 NJRhY9/awMkEDcptGzmnhtpVlGPgUru7Ot/2eg8qonpxgRlzlnXKCKM/KABHWXT/i8
	 AM8td7pEJYZC23KvT0ER9gJyS5hDghc9CGdzVcolSOgCZIE3d0lG4o+mvng/br1P32
	 4mmzRaQlZKyYKb5Ss4PxbElMbQoQb2t7ak673q8HB6PQMLmQ1DDT+7jzDadtadDsGa
	 lXZYx3nVeXfsukdWIljxAhU8r/mFh4+fc1ojUGiL9qW0izyPlWgsqY/2YQNFeHt1cj
	 GGQRNzSC4TIJw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 20AEA378208D;
	Thu,  1 Feb 2024 12:53:13 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	nancy.lin@mediatek.com,
	nathan.lu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH 2/3] drm/mediatek: Perform iounmap on simple DDP component destruction
Date: Thu,  1 Feb 2024 13:53:03 +0100
Message-ID: <20240201125304.218467-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
References: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_045316_861501_FBCD8C21 
X-CRM114-Status: GOOD (  15.01  )
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

Add a new mtk_ddp_comp_destroy() function and call it in the teardown
path of mtk_drm_drv to make sure that we unmap the iospace of the
simple DDP components.

While at it, also fix iounmapping on mtk_ddp_comp_init() error path.

Fixes: ff1395609e20 ("drm/mediatek: Move mtk_ddp_comp_init() from sub driver to DRM driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 38 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  4 ++-
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index c13359eeb3cd..539b526a6b0a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -626,8 +626,11 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 
 	priv->regs = of_iomap(node, 0);
 	priv->clk = of_clk_get(node, 0);
-	if (IS_ERR(priv->clk))
+	if (IS_ERR(priv->clk)) {
+		iounmap(priv->regs);
+		priv->regs = NULL;
 		return PTR_ERR(priv->clk);
+	}
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(comp->dev, &priv->cmdq_reg, 0);
@@ -639,3 +642,36 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 
 	return 0;
 }
+
+void mtk_ddp_comp_destroy(struct mtk_ddp_comp *comp)
+{
+	struct mtk_ddp_comp_dev *priv;
+
+	if (!comp || !comp->dev)
+		return;
+
+	/* Complex components are destroyed with their own remove callback */
+	if (type == MTK_DISP_AAL ||
+	    type == MTK_DISP_BLS ||
+	    type == MTK_DISP_CCORR ||
+	    type == MTK_DISP_COLOR ||
+	    type == MTK_DISP_GAMMA ||
+	    type == MTK_DISP_MERGE ||
+	    type == MTK_DISP_OVL ||
+	    type == MTK_DISP_OVL_2L ||
+	    type == MTK_DISP_PWM ||
+	    type == MTK_DISP_RDMA ||
+	    type == MTK_DPI ||
+	    type == MTK_DP_INTF ||
+	    type == MTK_DSI)
+		return;
+
+	priv = dev_get_drvdata(comp->dev);
+	if (!priv)
+		return;
+
+	if (priv->regs) {
+		iounmap(priv->regs);
+		priv->regs = NULL;
+	}
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 15b2eafff438..43372b416a3f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -318,6 +318,7 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct device *dev);
 int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
 		      unsigned int comp_id);
+void mtk_ddp_comp_destroy(struct mtk_ddp_comp *comp);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 14a1e0157cc4..89b6c31a1511 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -944,8 +944,10 @@ static void mtk_drm_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &mtk_drm_ops);
 	pm_runtime_disable(&pdev->dev);
 	of_node_put(private->mutex_node);
-	for (i = 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
+	for (i = 0; i < DDP_COMPONENT_DRM_ID_MAX; i++) {
+		mtk_ddp_comp_destroy(&private->ddp_comp[i]);
 		of_node_put(private->comp_node[i]);
+	}
 }
 
 static int mtk_drm_sys_prepare(struct device *dev)
-- 
2.43.0


