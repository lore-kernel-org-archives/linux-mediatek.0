Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1D9C88E70
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbDzrfV61Wxi+cHtWqnlZDsumAyv7C+3GqSui1gaCUc=; b=zWMJ6Kv0m+G9VnxtWqxfxEhFBL
	MTRSHXmLolB+i2ihDZIm2A0hhXMVPfy+TW3xivN6qO7O/k4PWBkjm7S3btbYPSBOzByatF/Nrps6E
	cw3EWGxHYwz/TiHznd98idszoJ3xci4oGSNA6Fybdc9Cl1fWQ9gje/hVVDT+0z1J9IO1j7ItIzbmt
	wSd2f9CbyfTrbfm7GAILbzOlfk/aLswZy6x6UNZqYjglj1VI+/DQlr02jX3x0oW0/YOWL4lvGX61o
	BY/StQKcjaWzHKwPBvvXuxs/N+VA4H0LF6fJKCCSDq/yJ/apEqcs4HKNY5aBIp+uiQW2iXOaFbP0v
	6JVyM5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Kf-00000003Qto-1Nwr;
	Mon, 14 Sep 2026 11:58:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65KL-00000003QZq-0T0a;
	Mon, 14 Sep 2026 11:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789387103;
	bh=6EHds//n4+NFmxl71I9PCgmjYbS9lTfCOyADVHqg2XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n+w8xU/3wYcBsIH8YYH+TPjzVvO/U//6nkBacIDaKMNd/pBdeKRC57ST2v705dMU0
	 pmMBq+e4EdMU09IbakOHGy7J0Mrr13MXhmWeEwp+psqEiVHOQbuVlydZObNm0R5ZBO
	 TYTl+PrZw326+Zhz9YRkMGG9ZqXaQgjj2cWNYRb7RbXlr1LD9kgKYVl1y5mp21FoYy
	 CUB/7RQpq+DEYjzkNR/cWbiMbEYWu6Tqb3jNGkjW0f370yxYPajev9TPT0VzEBPApq
	 Se/XYnHCzIr0r5q00t4ikEupwsbwaXNdt+PFEz8mkzoSzgxUgnuV+ZFc5QqvGCMOzi
	 MUyyvjAYOLrOA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E89017E0D7F;
	Mon, 14 Sep 2026 13:58:22 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v7 08/13] drm/mediatek: mtk_dsi: Add support for MT8189
Date: Mon, 14 Sep 2026 13:58:07 +0200
Message-ID: <20260914115812.22751-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
References: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_045825_317321_D9551B6A 
X-CRM114-Status: GOOD (  10.99  )
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

Add support for the DSI IP found in the MT8189 SoC: this one is
similar to the IPs found in the most recent already supported SoCs
with the only difference being that it supports a higher link rate
of 2.5Gbps instead of 1.5Gbps.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index bd2d17017bd2..08f6be311dd1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -826,6 +826,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8188-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8189-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
-- 
2.55.0


