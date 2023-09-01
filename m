Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D06CA0FEF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBFeNv/TI79+P2g4wf+BxwVIUoPcOatRCNja/AX17l0=; b=Qpqt+ojM4iLOHG
	rQPxjy6391jJOdu00Q1uQy6N/xDGUEXW88Z9mrlBcM367Tma5cJtXA5WXmb3JTKkqH3tNQB/JCwdA
	Ico5UaIyoligaD2DBvcEItIFRE8ISI7s75cObrCMrjff8pjBWuu7TM1484oISj2fTNc2LFzB599Tx
	LLpFqMVsLtVGGkjhYjdKoM0HDePkFFc3luQeSLqhzpxDVmRQA3thnpFOSyqzPAvpo4On+uiQc6LUD
	mZcrYDuSO/Wjw/c60JngoS3EV+tyV0t6bpC4oUwkm6c1C6F6FdCu5/exByEH0AKLOyQDVw8MsPfKS
	/8nEXmB/9nEVC0FSoqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc8Dn-000FYg-2C;
	Fri, 01 Sep 2023 17:46:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc8Dj-000FWE-1s;
	Fri, 01 Sep 2023 17:46:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 51C46CE2385;
	Fri,  1 Sep 2023 17:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DC1C433CB;
	Fri,  1 Sep 2023 17:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693590367;
	bh=Ax9LhcomiLyPb3zCRp4tsVZu+6TZgjFCwf5fnxTG33Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nv+9kNtMWjx/DNwe58roMa0M/RD0avN9rrmEx9hsKtvkqedYpi3RzCsqHFBIVmwVS
	 1jP6qHbf64FkYzUr+WFd712liNUjj1XKXRbBFfiJZ9QywYCJPzA9ZlxRxVfeLvROzy
	 d+ZIwCwetM9BHY2numoL/tOrQxliY236isL5oxAG+ojBZEwXT/rOoe32fYqRdFt09h
	 I6kKKkj6wUQeQG68QHccndrcsYDrqPKeG9P9jCNJY7f/5Zsy0O+GsvYdW6iQYGAf4U
	 oXLW4rBJfbwOvW1ir3Y+m+QNhkVfmo0bcBtdKz5TWH2YvMdm9euyIaHLnK3kPP/Mjm
	 WCgHNhy6/tVIQ==
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs calculation
Date: Fri,  1 Sep 2023 19:45:57 +0200
Message-Id: <20230901174557.3617839-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901174557.3617839-1-mwalle@kernel.org>
References: <20230901174557.3617839-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_104611_983448_1E06714D 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Michael Walle <mwalle@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
always have the CRTC with id 0, the ext id 1 and the third id 2. This
is only true if the paths are all available. But paths are optional (see
also comment in mtk_drm_kms_init()), e.g. the main path might not be
enabled or available at all. Then the CRTC IDs will shift one up, e.g.
ext will be 0 and the third path will be 1.

To fix that, dynamically calculate the IDs by the presence of the paths.

Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting possible_crtc way")
Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
v3:
 - use data instead of priv_n->data
 - fixed typos
 - collected Rb and Tb tags
v2:
 - iterate over all_drm_private[] to get any vdosys
 - new check if a path is available
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 72 +++++++++++++++++----
 1 file changed, 58 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 771f4e173353..c00f4669cc50 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -507,6 +507,27 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
 	return false;
 }
 
+static bool mtk_ddp_path_available(const unsigned int *path,
+				   unsigned int path_len,
+				   struct device_node **comp_node)
+{
+	unsigned int i;
+
+	if (!path)
+		return false;
+
+	for (i = 0U; i < path_len; i++) {
+		/* OVL_ADAPTOR doesn't have a device node */
+		if (path[i] == DDP_COMPONENT_DRM_OVL_ADAPTOR)
+			continue;
+
+		if (!comp_node[path[i]])
+			return false;
+	}
+
+	return true;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type)
 {
@@ -526,21 +547,44 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
-	unsigned int ret = 0;
-
-	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
-				     private->ddp_comp))
-		ret = BIT(0);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
-					  private->data->ext_len, private->ddp_comp))
-		ret = BIT(1);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
-					  private->data->third_len, private->ddp_comp))
-		ret = BIT(2);
-	else
-		DRM_INFO("Failed to find comp in ddp table\n");
+	const struct mtk_mmsys_driver_data *data;
+	struct mtk_drm_private *priv_n;
+	int i = 0, j;
+
+	for (j = 0; j < private->data->mmsys_dev_num; j++) {
+		priv_n = private->all_drm_private[j];
+		data = priv_n->data;
+
+		if (mtk_ddp_path_available(data->main_path, data->main_len,
+					   priv_n->comp_node)) {
+			if (mtk_drm_find_comp_in_ddp(dev, data->main_path,
+						     data->main_len,
+						     priv_n->ddp_comp))
+				return BIT(i);
+			i++;
+		}
+
+		if (mtk_ddp_path_available(data->ext_path, data->ext_len,
+					   priv_n->comp_node)) {
+			if (mtk_drm_find_comp_in_ddp(dev, data->ext_path,
+						     data->ext_len,
+						     priv_n->ddp_comp))
+				return BIT(i);
+			i++;
+		}
+
+		if (mtk_ddp_path_available(data->third_path, data->third_len,
+					   priv_n->comp_node)) {
+			if (mtk_drm_find_comp_in_ddp(dev, data->third_path,
+						     data->third_len,
+						     priv_n->ddp_comp))
+				return BIT(i);
+			i++;
+		}
+	}
 
-	return ret;
+	DRM_INFO("Failed to find comp in ddp table\n");
+	return 0;
 }
 
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
-- 
2.39.2


