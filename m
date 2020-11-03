Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C10C00A89
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 00:35:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD28223C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 00:35:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yl0uT/Du";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8VfIx3Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD28223C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3siDXCJyGnEwv1XDNnhF929sQrJubyOkgMCS4JCnRk=; b=Yl0uT/DudtyPWPf58wNI61MUOW
	tuR5yVDtrv4l3zulCzNVQRmpyY9/7IxDcIvksfq20SvplRRevwl3QLnrC0ZadFv1B5/IQ1vMRA/sw
	CxG5vWou06KZcervVjUofXLJlFcxcSRy1F9iZ3c1uyr6mCQyy1ivQpkoLeWp7OG3tDnzUXDxK+l9F
	0i2zbyPc7/byxdiG+USShGFG86oYvMUSwwYzxWT3XuKEJZBqep9K6VL5Ea0h69RXDd0dXcBPBInl0
	I3SVQpDT/ioB/u897cJ+pPctqYcoYVGdbm3lsGgecQVGeq0TQXAFwM68tDpu09oHiTOrN8Cpp3fPr
	ATK167dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZkHj-000161-Tp; Tue, 03 Nov 2020 00:34:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZkHe-000136-GY
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 00:34:49 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 526EF22268;
 Tue,  3 Nov 2020 00:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363685;
 bh=cZ+ihPXYHnIUGXvYZXzw6jQeEstXtmxMSgvykEOBwJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H8VfIx3QlDpoNMSx8OV/lt3wO13ovVWEdQDPemOnShwakd2k97Mb+0hPF4fdBylRh
 c+IsLidywpx2S1Dx2bIWTrs3kIayCgYx9hYQOPgwrEanGpDc8OqpwRabkfw1njx2jV
 tAydiYlM3XKDXDufINktfMSf++JHEkc/DkkApKyY=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 02/11] drm/mediatek: Use correct device pointer to get CMDQ
 client register
Date: Tue,  3 Nov 2020 08:34:13 +0800
Message-Id: <20201103003422.17838-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103003422.17838-1-chunkuang.hu@kernel.org>
References: <20201103003422.17838-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_193448_197567_FBAD4EED 
X-CRM114-Status: GOOD (  14.43  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some ddp component use mmsys device pointer to get CMDQ client
register, this would get mmsys' CMDQ client register, so use
each ddp component's device pointer to get.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c   |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c          |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 14 +++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  5 ++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  2 +-
 8 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 3ae9c810845b..461d96cb5cfa 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -116,7 +116,7 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
+	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id,
 				&mtk_disp_color_funcs);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 28651bc579bc..f89a2b3e56f4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -383,7 +383,7 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
+	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id,
 				&mtk_disp_ovl_funcs);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index e04319fedf46..7a5dad4a2597 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -291,7 +291,7 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
+	ret = mtk_ddp_comp_init(dev->of_node, &priv->ddp_comp, comp_id,
 				&mtk_disp_rdma_funcs);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index cf11c4850b40..6852b76fa583 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -784,7 +784,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
-	ret = mtk_ddp_comp_init(dev, dev->of_node, &dpi->ddp_comp, comp_id,
+	ret = mtk_ddp_comp_init(dev->of_node, &dpi->ddp_comp, comp_id,
 				&mtk_dpi_funcs);
 	if (ret) {
 		dev_err(dev, "Failed to initialize component: %d\n", ret);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index c17c0e4c030f..93a10550a147 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -465,10 +465,11 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 	return ret;
 }
 
-int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
-		      struct mtk_ddp_comp *comp, enum mtk_ddp_comp_id comp_id,
-		      const struct mtk_ddp_comp_funcs *funcs)
+int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
+		      enum mtk_ddp_comp_id comp_id, const struct mtk_ddp_comp_funcs *funcs)
 {
+	struct platform_device *comp_pdev;
+	struct device *dev;
 	enum mtk_ddp_comp_type type;
 	struct device_node *larb_node;
 	struct platform_device *larb_pdev;
@@ -506,6 +507,13 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	if (IS_ERR(comp->clk))
 		return PTR_ERR(comp->clk);
 
+	comp_pdev = of_find_device_by_node(node);
+	if (!comp_pdev) {
+		DRM_INFO("Waiting for device %s\n", node->full_name);
+		return -EPROBE_DEFER;
+	}
+	dev = &comp_pdev->dev;
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (of_address_to_resource(node, 0, &res) != 0) {
 		dev_err(dev, "Missing reg in %s node\n", node->full_name);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 1d9e00b69462..3bd6012d0746 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -204,9 +204,8 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct mtk_ddp_comp ddp_comp);
-int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
-		      struct mtk_ddp_comp *comp, enum mtk_ddp_comp_id comp_id,
-		      const struct mtk_ddp_comp_funcs *funcs);
+int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
+		      enum mtk_ddp_comp_id comp_id, const struct mtk_ddp_comp_funcs *funcs);
 int mtk_ddp_comp_register(struct drm_device *drm, struct mtk_ddp_comp *comp);
 void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp);
 void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 59c85c63b7cc..e4a8769f200f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -538,7 +538,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 				goto err_node;
 			}
 
-			ret = mtk_ddp_comp_init(dev->parent, node, comp,
+			ret = mtk_ddp_comp_init(node, comp,
 						comp_id, NULL);
 			if (ret) {
 				of_node_put(node);
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 4a188a942c38..86109698f19c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1114,7 +1114,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		goto err_unregister_host;
 	}
 
-	ret = mtk_ddp_comp_init(dev, dev->of_node, &dsi->ddp_comp, comp_id,
+	ret = mtk_ddp_comp_init(dev->of_node, &dsi->ddp_comp, comp_id,
 				&mtk_dsi_funcs);
 	if (ret) {
 		dev_err(dev, "Failed to initialize component: %d\n", ret);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
