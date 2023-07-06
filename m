Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB13C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34Anw/wI92zz8P+zTww+gkLhetdCiKuz2Fn1f6zs4Jw=; b=lg46MQdwHbxD8M1yVMCB0FvdoZ
	vhryf9RjEGrebzkJEGz+NDmEoA/Qv/TGamMz+j0J5+qpD7U5tpaB+MQbvZwCdW46HUyzMiWiXPqbg
	UXw4AtMniwKdrfeEA8Cav12cJ7+ZZZhejaLM9vt+xNzbl0A0lQfOCYMyvUrPA8Cad/tmylZHNHAtx
	0qUgLTcg89Gw1AJPRtYTuzlP/W+lOHPatjfG/KfsyXuK1Y+/krpQGjYug/dI0XaPDBNHZ2OcPiLMi
	TTraEEw4XyG8kC7n6f4KXUlmvZW74Soi62vkjPh+4ARW+MNvRslZgz3yzdWUZz+3hiGP0qZIVA4KK
	iOgm6m3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO8J-001czI-26;
	Thu, 06 Jul 2023 12:30:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO85-001cjW-2g;
	Thu, 06 Jul 2023 12:30:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E43326606FC1;
	Thu,  6 Jul 2023 13:30:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688646636;
	bh=5+0g34fw0wGVdF8pSXSyeJt5CPUOp79klTRlFXdGl4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXRdj/hwHQs2SS81BQtrJIekePJZYwkIN/n2Ikp2BxktX6eGrI213k29FdWmkIYe5
	 hVg7B2E/Qrmy3m27lgj54mi/lEmr9stGO4ZeuQRis4apiQFKZyfxTGtNOb/6JhhB6T
	 s2hE7LiTsKshLGTET5+QLNk8OO40i9FCJsR1dg28ncRoyPLq0d3d9/K4EDZm2hb3YK
	 m2qYk8qRFiQorjGMfTJTRHAyQK84SaUKmApKeDWu2THIKisZlKErE64VTNpSCfyd7/
	 pHJVaOU+Vj3+qugYlIlfliCc1QUQx0wcjwKF4MlwmMpbvvqDoLF9XAHRLEzGLoTGey
	 g6G9Ds1ehO4og==
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
Subject: [PATCH v4 7/9] drm/mediatek: dp: Use devm variant of drm_bridge_add()
Date: Thu,  6 Jul 2023 14:30:23 +0200
Message-Id: <20230706123025.208408-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
References: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_053037_995287_5CA136E7 
X-CRM114-Status: GOOD (  12.06  )
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

In preparation for adding support for aux-bus, which will add a code
path that may fail after the drm_bridge_add() call, change that to
devm_drm_bridge_add() to simplify failure paths later.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index eebcb32e67ee..6bc620aded45 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2564,7 +2564,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
-	drm_bridge_add(&mtk_dp->bridge);
+	devm_drm_bridge_add(dev, &mtk_dp->bridge);
 
 	mtk_dp->need_debounce = true;
 	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
-- 
2.40.1


