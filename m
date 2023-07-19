Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD1DC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9A8cogseX/XHKwg6km5SEZXwcG9TMNwm3LxzDIr4lEA=; b=jPcKMLi+16viUe
	v2MqhldLwCuh6KO4Vw2Tq0ZxegGgTQIjvhMgdplI7PKOEnQRGZ8p0aCFZRBxd3/fuXm3plSquSAUC
	rGDOiL6b0LFh0pNhm18SbLuJBebmg6rHMmsmuKwMP8EQ8w5fVVBWB4PdrInlFb4le2XeycBAuCoKT
	ICHl/tYc59FGOw+IIu0dJKOUv0SOifGHmbqw+gBY8kP4Fe/LsRLOK9t611eWBbS3w/j2JtpWmh69/
	oaqwWDgYQvH1nlpGG8DDM4Ctepemz9SAveD9Qz4Jf7rXOIL+Euo8ee+Dx1R6SVKdo2PDXteoUchaK
	V0SOxIPDORwqBIDjo+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1yJ-00699x-2n;
	Wed, 19 Jul 2023 07:51:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1xo-0068p6-14;
	Wed, 19 Jul 2023 07:51:13 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F063B660704A;
	Wed, 19 Jul 2023 08:51:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689753070;
	bh=pH0eS322JL8A9XQUDj4YhAVk0Kl3Mp/XP1arLmFs7pg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C/tOVKwLVb7iMw6C/ZnKzmMECtfWtShZzz6LG2LIZ9x7CxakoAQLb+sQwYB1o2mYC
	 C57V/Fq7TrgE7mZ0+XGT+oRM1DJS/UJKDOfyw6peF/PIF1f/1zfQsQjMFnU91XaruT
	 Ge2/rx1bRHfY7YuGLeKI8E4tL4guS0+iNq8gZScOFQL0Wx95+vrcA6SjaWUJic/oBF
	 qQYZRehZf9V76YKG+teySef8Imm5WIy9+TD0zt6iCcoKNMZ591qXe3OelZoCqsNzc3
	 4vlDIOF4IyYOBv6rYMKSTNGXr3JfutHrNDyKNWiS7BWB2DTLBlyr+QlG4ZAQZMGGiJ
	 DNMXlA6ZXnvkg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 5/6] drm/mediatek: mtk_dpi: Use devm_platform_ioremap_resource()
Date: Wed, 19 Jul 2023 09:50:55 +0200
Message-Id: <20230719075056.72178-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005112_533020_35201A71 
X-CRM114-Status: GOOD (  11.58  )
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

Instead of the open-coded platform_get_resource, devm_ioremap_resource
switch to devm_platform_ioremap_resource(), also dropping the useless
struct resource pointer, which becomes unused.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 3a140498c98a..244340df7468 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1007,7 +1007,6 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_dpi *dpi;
-	struct resource *mem;
 	int ret;
 
 	dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
@@ -1038,8 +1037,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 			dev_dbg(&pdev->dev, "Cannot find pinctrl active!\n");
 		}
 	}
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dpi->regs = devm_ioremap_resource(dev, mem);
+	dpi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dpi->regs))
 		return dev_err_probe(dev, PTR_ERR(dpi->regs),
 				     "Failed to ioremap mem resource\n");
-- 
2.40.1


