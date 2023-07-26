Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79794C41513
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70z3hilJC/5xyKNfEn9LEeBRh/26njgJgo0asfl5xaQ=; b=JRZaAGfrJFaXSN
	TlLIXCZdG5ATn4z4g6Iaj612T3oGyKKjOsVkke/NJ5ODU5RhjYw73ZeIuGyT7BsURvAg0PRN9ZlV2
	G0d1byUA+RnESsqGM17gqWsp+z7y5YVQStE+4MsuMKoqGi8iycPlHdbvg1hXTuqXdIjIc4dAcgGKP
	Z7yRk6B/zFXN+3payNMZklnwCkuC2nJg3IASthKaVc3HZtWuej58k2r1UNl9PamsIEfqSYh6kXE0j
	6+ulnMgTMBBc/ppR2MFvIvu2qSpVyMGhD2a8lpF3Ajoq0mzT7OeWPSHafnijVyg1t1tt7xIKjRGEq
	/FpUGxtcH38S/tKI3T5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZo3-009Zn8-0d;
	Wed, 26 Jul 2023 08:23:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZnQ-009ZTx-1e;
	Wed, 26 Jul 2023 08:23:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B99F1660711D;
	Wed, 26 Jul 2023 09:22:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690359779;
	bh=7S4BmWWUvw/WhRBHq0ubcEQhqplrJYEMp5mtO/yukgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eB4ffQornmdszsZQH07HZXx/UkjdjOtxtEKNJnQP0A2s85zmD8fCDh3mTffaAjSIe
	 Dtjk8FTcs22EcQWu+G2JDwXOZDa6JBo+dSSkJKek5CHKDAo5G+NRJVW+B6rlgkcN8f
	 ofqtFnJllXPMf9yJkKrU3vFqfc5IwHI+C3tQUZlN2PGccdnsIJYu8X1s75oe+PSdiZ
	 rmZ3sqrVdFVdue02VMy47Ml6jj5UwM3KLeBF1gcUGJHXpCQe1PxZc1xm7eoMR5+umr
	 A17OhzSnfA7zLX5y0RpHG6FQxCdPxTjJpbf9Ap1nGqUyHM5zMrrasODGTe6Binl3iM
	 A8kJslQqULGZw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 6/6] drm/mediatek: mtk_dpi: Compress struct of_device_id entries
Date: Wed, 26 Jul 2023 10:22:45 +0200
Message-ID: <20230726082245.550929-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
References: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_012300_714057_A0CC8C59 
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reduce line count by compressing the entries of struct of_device_id;
while at it, also add the usual /* sentinel */ comment to the last
entry.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index a6fa26301a58..cc55dbb909ec 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1090,28 +1090,14 @@ static void mtk_dpi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mtk_dpi_of_ids[] = {
-	{ .compatible = "mediatek,mt2701-dpi",
-	  .data = &mt2701_conf,
-	},
-	{ .compatible = "mediatek,mt8173-dpi",
-	  .data = &mt8173_conf,
-	},
-	{ .compatible = "mediatek,mt8183-dpi",
-	  .data = &mt8183_conf,
-	},
-	{ .compatible = "mediatek,mt8186-dpi",
-	  .data = &mt8186_conf,
-	},
-	{ .compatible = "mediatek,mt8188-dp-intf",
-	  .data = &mt8188_dpintf_conf,
-	},
-	{ .compatible = "mediatek,mt8192-dpi",
-	  .data = &mt8192_conf,
-	},
-	{ .compatible = "mediatek,mt8195-dp-intf",
-	  .data = &mt8195_dpintf_conf,
-	},
-	{ },
+	{ .compatible = "mediatek,mt2701-dpi", .data = &mt2701_conf },
+	{ .compatible = "mediatek,mt8173-dpi", .data = &mt8173_conf },
+	{ .compatible = "mediatek,mt8183-dpi", .data = &mt8183_conf },
+	{ .compatible = "mediatek,mt8186-dpi", .data = &mt8186_conf },
+	{ .compatible = "mediatek,mt8188-dp-intf", .data = &mt8188_dpintf_conf },
+	{ .compatible = "mediatek,mt8192-dpi", .data = &mt8192_conf },
+	{ .compatible = "mediatek,mt8195-dp-intf", .data = &mt8195_dpintf_conf },
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
 
-- 
2.41.0


