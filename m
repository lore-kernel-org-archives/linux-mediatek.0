Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1970DCD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 07:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NG7FRbdycqojcww/u638sFJeonvuCdAvUX3vDQ4gpj4=; b=m9iuvvgx7atHufD041sRFgaV53
	6r78irfVU78mlvF3xqVTq1QKXZXBZVaP5alakkdGXjQedkxCCD9PoP0jHyZUUqhuKF1Z+v4qJp0Fz
	CCxQVRqINx/3PPUxJeIT7V8B/KRKVcPyQqXXXBnKTbKcIgm7VR1uOpPFb0wWPpXI6sxQTBuh7FA9p
	JDAm2GC28V5hkb/MxZlMzqyjWDnNyqW5M96vZM9FfNtImEwy2iNZoP0rGfaDZC3ThArXdU+H4e8BX
	W7FjE84wou1smUNEHBPKMdz8wrWcVbXe34VasMugWF4bd9/r/+PRrXYJ23MTIh5GgrDI9dliYESjo
	6Tw/NDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHz8-00000001jPL-3a6K;
	Thu, 04 Apr 2024 07:58:11 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHyz-00000001jIF-1Alc;
	Thu, 04 Apr 2024 07:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712217478;
	bh=3XsaGUfHbyKfT+rCEWbrx+o2Wnvb76/WaYQW9y+coRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tRqKoJZlIxZCuMghnJ/64FPr6v7Kq9trDuOiSl5+ST70yRVIqMOpQUzo9rk1ytADO
	 Mc6efyeeN63rIgSnWFjRK1W1DSVy9Ig9fRjhOjrHYTvcMxSjREfg1lPEuSvHe/X8e/
	 vzIH9xzDCr/w5WDlqqNz+glf5Qh3hnmlwchOOAD5uXpcPQzl5Nr3wVyPYDKxMCsKRT
	 AchEv+JZn5F3BcPZvSurhFjyx7czK21qlkLK02/oLqQee9B0ev9sutFvTb98cJcmKU
	 /UqavQB0ohBcigEXOodwim/BkqpbA4zpUmV/3+QH9qg+TT1yXYPMA9AhPxeBy8707B
	 X1DO/Jfq7b5Qg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F3D663782128;
	Thu,  4 Apr 2024 07:57:57 +0000 (UTC)
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
Subject: [PATCH v2 1/3] drm/mediatek: drm_ddp_comp: Fix and cleanup DDP component CRTC search
Date: Thu,  4 Apr 2024 09:57:52 +0200
Message-ID: <20240404075754.83455-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404075754.83455-1-angelogioacchino.delregno@collabora.com>
References: <20240404075754.83455-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_005801_503456_62D436A6 
X-CRM114-Status: GOOD (  16.90  )
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
(but it's unsigned int, so the value is never negative!) if no CRTC
was found, which is wrong for multiple obvious reasons.

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
index a515e96cfefc..82d7a6887f44 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -514,29 +514,25 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
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
@@ -558,22 +554,24 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
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
2.44.0


