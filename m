Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4A6CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 07:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fUnnRfxDgWohVxoTraaPd++Z5UHHAmYAuQL+P8FMpA=; b=EfObbzHLuKc6XLVmUD4/MGzVoW
	37bM1Oh/0Lip5rOnGz2fYhVFbR9eC7+LcWsyi4ceTsghgQ+iWN9Yb0gzhquPoz/6ZhCaqe2p4H6x0
	vmntG2dNTEFQJnS8TIHzTmmRDxMOkloRLM8JMhD6UiDW/9IWBQq9f25vrnr+n8bTtH9wDrXGDOHo1
	TdHPMaoZoYujY5frZq5PcYwBDQdxNtSeGJSnaaynBC9sChqZ4HjMKQsphpW16xsELCIG3ItWQlg4U
	iw+I1ZRlufvPX51dEOF6r933PX3d6L/ccQ3gEbYGd5GF751fbqbF+KKFUNYWzXGSgX64Vrkbw5C3C
	wm4IW8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHzC-00000001jT6-2GOJ;
	Thu, 04 Apr 2024 07:58:14 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHz0-00000001jIZ-0ybe;
	Thu, 04 Apr 2024 07:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712217481;
	bh=91LD58avnRzxuTR+zgR6nRtCYpKIsz1H4g5/SZOkKwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0d8LCh7CqmqBKxae4zvzP7kHfKBt66Je/wOdytq86ZfN/ZU+QYUjnG9uBCm9DaedO
	 2/ryyht8UR5L779RenbBXb/U4nhu4mQ4gj2xaUcmBAhaccXIH1XnblbNc11z4cpA/E
	 CH4G+CcCtI55wdVim+Ao9rLEzG+3AQxloITitp5437x1av6QPW+Yw/thp+7u0n4vyO
	 QkFmOXCJy0k/DuxaLTsOHFpILB1Ei5bwxXFod40AcybdjGXbsU18iGnt9/trJjnaO3
	 BX31mPHMjR6JIqwIDmWJ2eUrHGaBBvdslslPpdnEUpN8LfI1ajeJsOErsEW9Y1UtmV
	 UvwNLgh9o2qGw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2ACF3378212E;
	Thu,  4 Apr 2024 07:58:00 +0000 (UTC)
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
Subject: [PATCH v2 3/3] drm/mediatek: drm_ddp_comp: Add mtk_ddp_is_simple_comp() internal helper
Date: Thu,  4 Apr 2024 09:57:54 +0200
Message-ID: <20240404075754.83455-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404075754.83455-1-angelogioacchino.delregno@collabora.com>
References: <20240404075754.83455-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_005802_434711_2BD8EE79 
X-CRM114-Status: GOOD (  10.60  )
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

Move the simple component check to a new mtk_ddp_is_simple_comp()
internal helper to reduce code duplication.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 57 +++++++++++----------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 477fc1950a0e..d760285761b9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -576,6 +576,29 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 	return ret;
 }
 
+static bool mtk_ddp_is_simple_comp(enum mtk_ddp_comp_type type)
+{
+	switch (type) {
+	case MTK_DISP_AAL:
+	case MTK_DISP_BLS:
+	case MTK_DISP_CCORR:
+	case MTK_DISP_COLOR:
+	case MTK_DISP_GAMMA:
+	case MTK_DISP_MERGE:
+	case MTK_DISP_OVL:
+	case MTK_DISP_OVL_2L:
+	case MTK_DISP_OVL_ADAPTOR:
+	case MTK_DISP_PWM:
+	case MTK_DISP_RDMA:
+	case MTK_DP_INTF:
+	case MTK_DPI:
+	case MTK_DSI:
+		return false;
+	default:
+		return true;
+	}
+}
+
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 		      unsigned int comp_id)
 {
@@ -606,19 +629,13 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	}
 	comp->dev = &comp_pdev->dev;
 
-	if (type == MTK_DISP_AAL ||
-	    type == MTK_DISP_BLS ||
-	    type == MTK_DISP_CCORR ||
-	    type == MTK_DISP_COLOR ||
-	    type == MTK_DISP_GAMMA ||
-	    type == MTK_DISP_MERGE ||
-	    type == MTK_DISP_OVL ||
-	    type == MTK_DISP_OVL_2L ||
-	    type == MTK_DISP_PWM ||
-	    type == MTK_DISP_RDMA ||
-	    type == MTK_DPI ||
-	    type == MTK_DP_INTF ||
-	    type == MTK_DSI)
+	/*
+	 * Resources for simple components are retrieved here as those are
+	 * managed in here without the need of more complex drivers; for
+	 * the latter, their respective probe function will do the job, so
+	 * we must avoid getting their resources here.
+	 */
+	if (!mtk_ddp_is_simple_comp(type))
 		return 0;
 
 	priv = devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
@@ -652,19 +669,7 @@ void mtk_ddp_comp_destroy(struct mtk_ddp_comp *comp)
 		return;
 
 	/* Complex components are destroyed with their own remove callback */
-	if (mtk_ddp_matches[comp->id].type == MTK_DISP_AAL ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_BLS ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_CCORR ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_COLOR ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_GAMMA ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_MERGE ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_OVL ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_OVL_2L ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_PWM ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_RDMA ||
-	    mtk_ddp_matches[comp->id].type == MTK_DPI ||
-	    mtk_ddp_matches[comp->id].type == MTK_DP_INTF ||
-	    mtk_ddp_matches[comp->id].type == MTK_DSI)
+	if (!mtk_ddp_is_simple_comp(mtk_ddp_matches[comp->id].type))
 		return;
 
 	priv = dev_get_drvdata(comp->dev);
-- 
2.44.0


