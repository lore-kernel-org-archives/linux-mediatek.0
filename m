Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4BACA0FE8
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0ENctjPhuDzW3khZGyQ34ovUUpM7DHPI1JBlWN5eu0=; b=1qxaCcL+HpHwPQ
	y5FNIChHMRU2gcUxeEoASs0BTA0r7b5Y/4XmRbIztcqHOp1yB5C+Zc6Fhq4ld/dYejcEqmqFbDoj1
	U6exX7qz7LdbwBasnH7BCbVp4SOXw66QbvC44pGG4uc8zOTaZSmfn06UbH2CqdI66A/zhJLKhv6Fn
	JJrFMFNvnwsRe2w0PjfhGyiOCmKxxwV1Exk1x/fYIdqSPnQWLU0mWLhupTEpmT/YNIAu6wNnt4YVs
	cg7mCeEU/uZkuJ5UpXRiyMgushhkI9vgx9VIMrlPBnyV5rxvcydaR+P5aXNCLpJ1pfs/5jOyZtTgY
	sGZobCHDkUYzbsFsR+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0wB-00GnGi-0Z;
	Fri, 01 Sep 2023 09:59:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0w6-00GnEY-0R;
	Fri, 01 Sep 2023 09:59:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A89562B36;
	Fri,  1 Sep 2023 09:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8ECC433CC;
	Fri,  1 Sep 2023 09:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693562368;
	bh=MCxcvPe7knGMaYt1Jtizlmz+R6LJpOaJGjbJJhZK6bk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GA1YwEU3VH5nYETgRRFa+H2KhzO/6AeBueaJNaFrLhNj4oYVUrFlG31/kmDpBLfRN
	 KdVdzl2z/1BnkOMivBAS/6T+XPYkzXOTvsxPcbU9MIIYd8aUuyjxmnemAWS+MU5o87
	 fcGo8kewyUkF4I7AwSdoDpAsP3/r/9nveK4GRIPBzah5737y3oGL7+eG4WTSqh8zqB
	 I85097wIdGopqxEzor65wgSNmlLfntteEIlwPilu7+Rl8dMm7SJpbO7aMeFFCDgSVi
	 bfMT1EVAaQiwlNfX43Y5NN2EFiE2jV0y66q8U8AtR+A1KBidHkIFVV3R4OcOPrWmfN
	 m3cHUMKH7EWsw==
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs calculation
Date: Fri,  1 Sep 2023 11:59:16 +0200
Message-Id: <20230901095916.3599320-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901095916.3599320-1-mwalle@kernel.org>
References: <20230901095916.3599320-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_025930_281641_E31DA45A 
X-CRM114-Status: GOOD (  17.84  )
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
ext will be 1 and the third path will be 2.

To fix that, dynamically calculate the IDs by the precence of the paths.

Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting possible_crtc way")
Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
v2:
 - iterate over all_drm_private[] to get any vdosys
 - new check if a path is available
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 72 +++++++++++++++++----
 1 file changed, 58 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 771f4e173353..9f0f12740fb0 100644
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
+			if (mtk_drm_find_comp_in_ddp(dev, priv_n->data->main_path,
+						     priv_n->data->main_len,
+						     priv_n->ddp_comp))
+				return BIT(i);
+			i++;
+		}
+
+		if (mtk_ddp_path_available(data->ext_path, data->ext_len,
+					   priv_n->comp_node)) {
+			if (mtk_drm_find_comp_in_ddp(dev, priv_n->data->ext_path,
+						     priv_n->data->ext_len,
+						     priv_n->ddp_comp))
+				return BIT(i);
+			i++;
+		}
+
+		if (mtk_ddp_path_available(data->third_path, data->third_len,
+					   priv_n->comp_node)) {
+			if (mtk_drm_find_comp_in_ddp(dev, priv_n->data->third_path,
+						     priv_n->data->third_len,
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


