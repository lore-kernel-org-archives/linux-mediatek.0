Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BBEC47DDB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dF9i6doY1+qh+gEdfQ2z/z0KJz518IXRZfjpfWvwGxo=; b=uai6VlAJ1MR3aZdVcQ4X81yYjs
	31CKOoo5eYtoXYhqnTJkD6V1cPccfsVjgLLAIKdAkUn5bwq3Ggd5b0EW2ZFSGXnJTad6abf2htNia
	0p5uNeWhUrGua5lbv/NIufzFbHYN8ma0EMZ5PxnyZzAZHDEpkGsYGXjUj10VAUhJF3sXnVOLJNBBX
	Vd2hr03dVvSXOw+b83QW8qs19joQrrceA8OGYaawRRIcbcWjT31A6cun2t9R07yAwcZ2WF+nL/t8S
	WoUFcdVdPKRH9EDFa81cL00dQhLBd8PuebhmPKBDuZjhWwIldUFc2OWv6brRVn2JxbQHFBxDvyIy+
	RVDU669A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWZQ-00000007qVN-0Uis;
	Thu, 01 Feb 2024 12:53:32 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWZA-00000007qFW-2l82;
	Thu, 01 Feb 2024 12:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706791992;
	bh=NNwf1FU4iKYIcxafPzqdiApb/zXktJGn2dDrtHe6Qpw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GdFp4wvJjncBQA1ogeJl0aGoGyBzQAiBITHtesgYh+D8i99YIOKoDHBN9JMOXYWrd
	 XieFPVy9ILHGZxJKGMtBBNgbGvuZW5zNf2mSxyzXIWIfXh1o4ZjXFjM8k40qjAy7xU
	 zhi8QdKx1Q8pZvl2pnB+gj45HUcDmWxD5Hj/zckFnXLc02XQFHxc4NpLOjSNetFXXg
	 TBJa+uGUQlwZ8/XX3X741vIbuK2cqrpf9qpJXLbAkUyMgOqvQNnvxGrO4/1/KURz3g
	 mHPQGHjrcCrmIkZUjN/ofAuiOMlpNqAbmPfMTs5d8xZbWCzmzYU7BlVu6qwkGJ7o3G
	 FpO0XvB3xEBhQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EC492378208C;
	Thu,  1 Feb 2024 12:53:11 +0000 (UTC)
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
Subject: [PATCH 1/3] drm/mediatek: drm_ddp_comp: Fix and cleanup DDP component CRTC search
Date: Thu,  1 Feb 2024 13:53:02 +0100
Message-ID: <20240201125304.218467-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
References: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_045316_866160_61FF3F3C 
X-CRM114-Status: GOOD (  16.00  )
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

Finding a possible CRTC by DDP component is done by first checking
static routes in three paths (main, external, third/extra path) and
then, if not found, we check for dynamic connection on a per-route
basis because, for example, on some SoCs the main route may output
to either a DSI display or DisplayPort and this is finally done by
assigning a CRTC mask to `possible_crtcs`, found with function
mtk_drm_find_comp_in_ddp_conn_path(): being that a mask the possible
values are BIT(x) and, if no CRTC is possible, zero.

Problem is, both mtk_drm_find_possible_crtc_by_comp() and the
aforementioned function are trying to return a negative error value
(but it's unsigned int!) if no CRTC was found, which is wrong for
multiple obvious reasons.

Cleanup both functions, so that:
 - mtk_drm_find_comp_in_ddp_conn_path() returns a signed integer
   with a negative number for error, or a bit/bitmask of the found
   possible CRTC; and
 - mtk_drm_find_possible_crtc_by_comp() always returns either a
   bitmask of the possible CRTC, or zero if none available.

Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 44 ++++++++++-----------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index a9b5a21cde2d..c13359eeb3cd 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -513,29 +513,25 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
 	return false;
 }
 
-static unsigned int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
-						       const struct mtk_drm_route *routes,
-						       unsigned int num_routes,
-						       struct mtk_ddp_comp *ddp_comp)
+static int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
+					      const struct mtk_drm_route *routes,
+					      unsigned int num_routes,
+					      struct mtk_ddp_comp *ddp_comp)
 {
-	int ret;
-	unsigned int i;
+	int i;
 
-	if (!routes) {
-		ret = -EINVAL;
-		goto err;
+	if (!routes || !num_routes) {
+		DRM_ERROR("No connection routes specified!\n");
+		return -EINVAL;
 	}
 
 	for (i = 0; i < num_routes; i++)
 		if (dev == ddp_comp[routes[i].route_ddp].dev)
 			return BIT(routes[i].crtc_id);
 
-	ret = -ENODEV;
-err:
-
-	DRM_INFO("Failed to find comp in ddp table, ret = %d\n", ret);
+	DRM_ERROR("Failed to find component in ddp table\n");
 
-	return 0;
+	return -ENODEV;
 }
 
 int mtk_ddp_comp_get_id(struct device_node *node,
@@ -557,22 +553,24 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
-	unsigned int ret = 0;
+	int ret;
 
 	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
 				     private->ddp_comp))
-		ret = BIT(0);
+		return BIT(0);
 	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
 					  private->data->ext_len, private->ddp_comp))
-		ret = BIT(1);
+		return BIT(1);
 	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
 					  private->data->third_len, private->ddp_comp))
-		ret = BIT(2);
-	else
-		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
-							 private->data->conn_routes,
-							 private->data->num_conn_routes,
-							 private->ddp_comp);
+		return BIT(2);
+
+	ret = mtk_drm_find_comp_in_ddp_conn_path(dev, private->data->conn_routes,
+						 private->data->num_conn_routes,
+						 private->ddp_comp);
+	/* No CRTC is available: return a zero mask */
+	if (ret < 0)
+		return 0;
 
 	return ret;
 }
-- 
2.43.0


