Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA17C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 18:12:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20BA723E21
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 18:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20BA723E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEcXB4JmmxU0vZzf7E0XsMt5UVxkunvSCSlLlyrz5iI=; b=BRYNycTRp+EtZKpOa9Gh5p/zCH
	yw7C1DnNZsB/pnrqzP/u7uzBi5WhF3WRvgUCTvYF4jQYI+OJud85C2R5seBqIoDE0iErgF2VGN6EQ
	wWPvT8U0fgvidO1ZNy/ChitInNK+8NTnR7WM2OdwCSLr1yZgUS8JVDQKsA2I6pU/K9cPdvxV8+5Xe
	UFdfILGdkcbJcJkUd7sjGVDGTwU99ZXEHLXbE2Z49iq/wd94yRRulHFuMbZIVQPCZFgW5CsFemsmG
	ejMcDMyrLNtvOUp6fyVumfE0UguYYzsWk+Fw/ehq9ySZhBreZPfBTKeKBrbVZ/BEelxo+7LproJHP
	LZ/xbdpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knQQW-0008O2-RP; Thu, 10 Dec 2020 18:12:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knOX4-0001di-9U
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 16:11:11 +0000
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 03/12] drm/mediatek: Separate getting larb device to a
 function
Date: Fri, 11 Dec 2020 00:10:41 +0800
Message-Id: <20201210161050.8460-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210161050.8460-1-chunkuang.hu@kernel.org>
References: <20201210161050.8460-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_111106_733330_18D4C809 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: CK Hu <ck.hu@mediatek.com>

To make the code cleaner, separate getting larb device to
a function.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 57 ++++++++++++---------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 1730b3ddef70..a11b4f8bf959 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -465,19 +465,41 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 	return ret;
 }
 
+static int mtk_ddp_get_larb_dev(struct device_node *node, struct mtk_ddp_comp *comp,
+				struct device *dev)
+{
+	struct device_node *larb_node;
+	struct platform_device *larb_pdev;
+
+	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
+	if (!larb_node) {
+		dev_err(dev, "Missing mediadek,larb phandle in %pOF node\n", node);
+		return -EINVAL;
+	}
+
+	larb_pdev = of_find_device_by_node(larb_node);
+	if (!larb_pdev) {
+		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
+		of_node_put(larb_node);
+		return -EPROBE_DEFER;
+	}
+	of_node_put(larb_node);
+	comp->larb_dev = &larb_pdev->dev;
+
+	return 0;
+}
+
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 		      enum mtk_ddp_comp_id comp_id, const struct mtk_ddp_comp_funcs *funcs)
 {
 	struct platform_device *comp_pdev;
 	struct device *dev;
 	enum mtk_ddp_comp_type type;
-	struct device_node *larb_node;
-	struct platform_device *larb_pdev;
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct resource res;
 	struct cmdq_client_reg cmdq_reg;
-	int ret;
 #endif
+	int ret;
 
 	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
 		return -EINVAL;
@@ -529,30 +551,15 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 #endif
 
 	/* Only DMA capable components need the LARB property */
-	comp->larb_dev = NULL;
-	if (type != MTK_DISP_OVL &&
-	    type != MTK_DISP_OVL_2L &&
-	    type != MTK_DISP_RDMA &&
-	    type != MTK_DISP_WDMA)
-		return 0;
-
-	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
-	if (!larb_node) {
-		dev_err(dev,
-			"Missing mediadek,larb phandle in %pOF node\n", node);
-		return -EINVAL;
+	if (type == MTK_DISP_OVL ||
+	    type == MTK_DISP_OVL_2L ||
+	    type == MTK_DISP_RDMA ||
+	    type == MTK_DISP_WDMA) {
+		ret = mtk_ddp_get_larb_dev(node, comp, dev);
+		if (ret)
+			return ret;
 	}
 
-	larb_pdev = of_find_device_by_node(larb_node);
-	if (!larb_pdev) {
-		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
-		of_node_put(larb_node);
-		return -EPROBE_DEFER;
-	}
-	of_node_put(larb_node);
-
-	comp->larb_dev = &larb_pdev->dev;
-
 	return 0;
 }
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
