Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF68C47DDF
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 12:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xl1sxeAY941ekADTG0mgiHkpX5tavDqkkNmZfCi/8m8=; b=E9bQAe3uuNup9ICpAa4W7vNe2v
	wvCncivF0dNHErS6FNUtlDZ6IUma69HIVOCg5K8TLyk/zhI4eA4iBPUmRvXiErGZTF1SU7NL7z76g
	zar9mxv7+jjfkBy+tB9SVyfps3YxwYGlvGgxlWuco97aQAnoAnilx7B+yyMDwB6IKnh1SCBbHxLty
	oh2Bnq+0E/WRCSJ0AIXUH0MteoNHmwKLIrDpVzPT4llgd/OoVAxEbHjJ6WX3EfizM7OHR3VPUtpWI
	7YUOwfrWr/msANETxL9/vjVQGUJ/YjdpneesnBXs2FHxdVjD0zlPuKccYLEi9IuxYohQADvh3BjYq
	kTuagaYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWZI-00000007qNW-05oS;
	Thu, 01 Feb 2024 12:53:24 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWZA-00000007qG7-1mtD;
	Thu, 01 Feb 2024 12:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706791995;
	bh=soGWShtp1fE1scZOoOivLMJWWmkLBlGxzNtJ8q6CdrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLckKJ25YStrCwmV5MWq9MkI58ksS265iNzGTCslvCL7vXFE/iaCWN+y/AbxvW/wr
	 /AWfHHLIw1Jj2gPYOyGWpMiGHNebUb0hqknVb2A1EdrIxi8+WK3OJqA6/zKuxHL81d
	 gBAd7nCFnQW+KPC1BxbLJ9Z5V7iTkAQQps5Cw5C0xzhoLNRoDZm4carNn7fF8VgKlG
	 5wUx/DJ5Fq0/S/0KDldTsfIM1TwkXWPu7v773LjRdSBRa+dWmc3JFjJDVoQLsRSt3T
	 yFaaSqo0D5sMcwUCiB1xdYr6IDbSOlEzhLyvriE6h2i58sn/hmlm9TCZngXmW3bbIw
	 NWp6Wy4es1BkQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 48339378208F;
	Thu,  1 Feb 2024 12:53:14 +0000 (UTC)
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
Subject: [PATCH 3/3] drm/mediatek: drm_ddp_comp: Add mtk_ddp_is_simple_comp() internal helper
Date: Thu,  1 Feb 2024 13:53:04 +0100
Message-ID: <20240201125304.218467-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
References: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_045316_742273_BFF02272 
X-CRM114-Status: GOOD (  10.43  )
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
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 57 +++++++++++----------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 539b526a6b0a..4ca2a02ada3c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -575,6 +575,29 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
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
@@ -605,19 +628,13 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
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
@@ -651,19 +668,7 @@ void mtk_ddp_comp_destroy(struct mtk_ddp_comp *comp)
 		return;
 
 	/* Complex components are destroyed with their own remove callback */
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
+	if (!mtk_ddp_is_simple_comp(mtk_ddp_matches[comp->id].type))
 		return;
 
 	priv = dev_get_drvdata(comp->dev);
-- 
2.43.0


