Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB5CCD129A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 07:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeYFwnuD4+s5uq8uzv2CMZqpLRUptLwvTB2WWLBP4Ag=; b=rsfo0HGgsYQKIuz8YCuxxLDtdV
	o3BZ2ZgHGGT5VACJf2zXh8ff+vxAykbw88SkxzDsmFWgo7FDXZs+snB9qfCJndPyEsqxOasHtP+6B
	U8cOB7H0ZwqKSG/TNd9NXnN6fGVDMJA/yGaTfditQa9GTdLgEzTWTOLmUbeLLpi6olER4xnpAoNk3
	UHX9BXwxnOd0+k5HbptEEtT6FCBbFD3s90zne2DKoHuz2AGvzGIn7+Kk6jewjLb2Q3z+rWALLd7v4
	1drASLt7Owso8ScJE1Qnw6AIC9e7kuHrZ25nwz3vINiiw+J7HekGsS/5Q79BOfAOwcHUF1ug78Wwg
	CFzm3pCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHz5-00000001jMT-1V50;
	Thu, 04 Apr 2024 07:58:07 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHyz-00000001jIJ-1AN9;
	Thu, 04 Apr 2024 07:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712217480;
	bh=KoiSh/u/4BD9iAcBgjvWczlcgOlHoosLFr6MB3Jm8Xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FOu5bJCtAyMzxdyr8jDNAhgQn9IKDDnH1uRykOEPX0qZKiHPoXewXk1vwIpt4S0eT
	 Ympln2QU6MvpjNaVYVOcQ/nxpubzcFM8tpC33KfydDSK9znFhR741BEflS3SmDfl5S
	 uZGcPPN8Oiw7kqmWiHOKGcnxUTMP3M/XWvmqRFGcZAAimGst9OqB3r9evoLeiyPFLr
	 dCkcs7u8HUMprfS3Lfe9qJgR+0tqg5yqdp+N3DlWzVRqkFMndK1ItMWp5bHMIOrNf3
	 F9seAaunCjMunY7GLDEm6ytNHZp/8ABpu0aHiAKrCZ33ynRTjoTo6GNWhBuiuUp0M6
	 xUponJyRAtm1A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 15D003782129;
	Thu,  4 Apr 2024 07:57:59 +0000 (UTC)
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
Subject: [PATCH v2 2/3] drm/mediatek: Perform iounmap on simple DDP component destruction
Date: Thu,  4 Apr 2024 09:57:53 +0200
Message-ID: <20240404075754.83455-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404075754.83455-1-angelogioacchino.delregno@collabora.com>
References: <20240404075754.83455-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_005801_505533_79616ECD 
X-CRM114-Status: GOOD (  14.89  )
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
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 38 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  4 ++-
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 82d7a6887f44..477fc1950a0e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -627,8 +627,11 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 
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
@@ -640,3 +643,36 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 
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
+	if (mtk_ddp_matches[comp->id].type == MTK_DISP_AAL ||
+	    mtk_ddp_matches[comp->id].type == MTK_DISP_BLS ||
+	    mtk_ddp_matches[comp->id].type == MTK_DISP_CCORR ||
+	    mtk_ddp_matches[comp->id].type == MTK_DISP_COLOR ||
+	    mtk_ddp_matches[comp->id].type == MTK_DISP_GAMMA ||
+	    mtk_ddp_matches[comp->id].type == MTK_DISP_MERGE ||
+	    mtk_ddp_matches[comp->id].type == MTK_DISP_OVL ||
+	    mtk_ddp_matches[comp->id].type == MTK_DISP_OVL_2L ||
+	    mtk_ddp_matches[comp->id].type == MTK_DISP_PWM ||
+	    mtk_ddp_matches[comp->id].type == MTK_DISP_RDMA ||
+	    mtk_ddp_matches[comp->id].type == MTK_DPI ||
+	    mtk_ddp_matches[comp->id].type == MTK_DP_INTF ||
+	    mtk_ddp_matches[comp->id].type == MTK_DSI)
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
index 93d79a1366e9..3d147217caa4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -330,6 +330,7 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct device *dev);
 int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
 		      unsigned int comp_id);
+void mtk_ddp_comp_destroy(struct mtk_ddp_comp *comp);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74832c213092..7e240d16d3e5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -946,8 +946,10 @@ static void mtk_drm_remove(struct platform_device *pdev)
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
2.44.0


