Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DF2C47DB3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPA42pXp8NtVnnlFSEBRms2OQR05WnF2EUCSCLcM5dU=; b=xLjRd42y853XKT
	ptxS63lrX3TruS1oEUlgjACdUIjlWxnivnDgn10qnPTglsKQ8Z7d+KTFYbjfFlxsxGgKbPJu+EHco
	2FexVgPdFvgzkUrDkzMeaEmldWMBX2hyC3HNxSlcO2xF9yIM+h3G3MwULjv9PuWxv2c73g3eDuxhM
	4I2V+3hmkp65FyUhXMYE5CCcOEsyVst7in5TZqACjVIGAWT3HnbDDMHlapmze4tzgAuhmJd0d2aN3
	G6nR/VDbnZphHdkHqV1oDM7f9KOwC3zNEpjz3ZFP9p50Z6K1Y2RxUJBI8qhvJVqTFXCtyCMNbcPfW
	7MDmeI4CoWYLoU8jPVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8sW-000000038oG-3cbC;
	Wed, 31 Jan 2024 11:35:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8rh-000000038CT-0HQW;
	Wed, 31 Jan 2024 11:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706700887;
	bh=Hg07SeM/KNvTXW3q5I4wEr/MnhDPUSRitzdghnQDomk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BJNZYRqDrNfsvWK6R+0inYUi0KUg9dXOPzwWZb3ph7d+tA7t2m0w2xXq068ZtW1PJ
	 CdnKB9u7cu5w4lkJEYgDgKA2coWYkjVS5wccbcQ3JiuitoHDJ/XsHoJnXuIK+gXoR9
	 tRHB1WIfMqwz0WgTGHsbQDlAxwwqzEm4mTnD/HjYXrhB/Oz6nW7FlxdSddGbYZZqmO
	 3YIvd1wkUSP5JWZIFjWTc0FESVqPNURcnjTEVJVEbNH+S2+gXfn7c8fTtt9Dh5q2C2
	 Uy3HjdAu70DF20x2cJoaaHLtMB7v+qGgxwnNhQ9i/TW0LKzGl3mNhMKxHL+NFi7bQb
	 pTkNV6l1zW+zw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 13CBC378208C;
	Wed, 31 Jan 2024 11:34:47 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 7/7] drm/mediatek: dsi: Compress of_device_id entries and add sentinel
Date: Wed, 31 Jan 2024 12:34:34 +0100
Message-ID: <20240131113434.241929-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
References: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_033449_362565_AB4248D7 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

All entries fit in 82 columns, which is acceptable: compress all of
the mtk_dsi_of_match[] entries to a single line for each.

While at it, also add the usual sentinel comment to the last entry.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5a0f078987d3..2c482742183e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1204,17 +1204,12 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 };
 
 static const struct of_device_id mtk_dsi_of_match[] = {
-	{ .compatible = "mediatek,mt2701-dsi",
-	  .data = &mt2701_dsi_driver_data },
-	{ .compatible = "mediatek,mt8173-dsi",
-	  .data = &mt8173_dsi_driver_data },
-	{ .compatible = "mediatek,mt8183-dsi",
-	  .data = &mt8183_dsi_driver_data },
-	{ .compatible = "mediatek,mt8186-dsi",
-	  .data = &mt8186_dsi_driver_data },
-	{ .compatible = "mediatek,mt8188-dsi",
-	  .data = &mt8188_dsi_driver_data },
-	{ },
+	{ .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
+	{ .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
+	{ .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
+	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
+	{ .compatible = "mediatek,mt8188-dsi", .data = &mt8188_dsi_driver_data },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
 
-- 
2.43.0


