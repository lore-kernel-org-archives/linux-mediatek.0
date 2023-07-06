Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7547EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9lWQGZH5f2sQ2laDm7mGZlq6jYEI89M6asaSgCSWoI=; b=e+qgahj9rQQ6VFGMXU6CWWPIhy
	gQIHQ8bgpFkqb0D7YICSWlvc7p4wQc69UITShWlAj+gx+oDRpdVQCjysmpJ5jCZ7pqeed8pnYbfBl
	MU6UlmCMn7pBRuiMgwjVTmcdj/kFcS1jXyx+VSD/SmY4DTsoLsz5SYbg2fWqqGt0oGzeT20nWxnEt
	qwfe++cuiMdFYMLq46gTkzPJlQQZsNQKGCo+2nvOwhb4xZIIUquFboruvlaAcDKki0H2jKinPAtby
	SwTk6g0fYXJ0QsJldZCtvJzZopCy7SRdO1xrumlj06RKoRc7t1wKzu86SWFah5ANxhggvuSTanlX9
	vwL40wOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO84-001cjA-1N;
	Thu, 06 Jul 2023 12:30:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO80-001cfJ-1p;
	Thu, 06 Jul 2023 12:30:33 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5BEB96606FC1;
	Thu,  6 Jul 2023 13:30:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688646631;
	bh=J4Fv7OzB3CUSENYuwp4dZcyez8bgaU+pGcJI0tK+03w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iA3k0+3Z/8ftJGh/iw9czlTaoBAbmxaJsnf7fY/9LOKFSPSqYPttEPLNFzJjCp5k/
	 +Eq59DJGP0p1v1IOJ0JG2ygY8qAm6gR5XFlbZAAv4bArNBalf6l658TQVffJJJg+Np
	 ZxoekOQz4mSOirnNzxvam8Tu+yWG8lQcnsTfGzbY1h9+y/zKmykaYp3Ifn0Uu/pNW/
	 7TAggRXJ53KdlZMZC264l4WU6xUkWX21pawlFovFjswUxlPmZ2bYj4WwntlJBZ4F9d
	 YVsT3gjx3VmBtep05NHDePmoX0FrojI/nKZLkexv/KwfTROxosnocV6KvAgAHj0hLz
	 9Ax0qbbGGfYdQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	nfraprado@collabora.com
Subject: [PATCH v4 1/9] drm/mediatek: dp: Cache EDID for eDP panel
Date: Thu,  6 Jul 2023 14:30:17 +0200
Message-Id: <20230706123025.208408-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
References: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_053032_794934_DFDD9E8C 
X-CRM114-Status: GOOD (  12.52  )
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

Since eDP panels are not removable it is safe to cache the EDID:
this will avoid a relatively long read transaction at every PM
resume that is unnecessary only in the "special" case of eDP,
hence speeding it up a little, as from now on, as resume operation,
we will perform only link training.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 64eee77452c0..fdf5b7686884 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -118,6 +118,7 @@ struct mtk_dp {
 	const struct mtk_dp_data *data;
 	struct mtk_dp_info info;
 	struct mtk_dp_train_info train_info;
+	struct edid *edid;
 
 	struct platform_device *phy_dev;
 	struct phy *phy;
@@ -1993,7 +1994,11 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 		usleep_range(2000, 5000);
 	}
 
-	new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
+	/* eDP panels aren't removable, so we can return a cached EDID. */
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP && mtk_dp->edid)
+		new_edid = drm_edid_duplicate(mtk_dp->edid);
+	else
+		new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
 
 	/*
 	 * Parse capability here to let atomic_get_input_bus_fmts and
@@ -2022,6 +2027,10 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
 	}
 
+	/* If this is an eDP panel and the read EDID is good, cache it for later */
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP && !mtk_dp->edid && new_edid)
+		mtk_dp->edid = drm_edid_duplicate(new_edid);
+
 	return new_edid;
 }
 
-- 
2.40.1


