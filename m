Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF17C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JC4WWETfFfjGVtV1ifdQerYVvztYyLwFPiXgJNPrEM=; b=UhyCJH7Cg+wg5Y
	7IMXzz81nMkPu4zLXsA8cxlffNU/4qJ7TTrNXCxsUe8dfB8wrJp7e9kqCZbm74F2gLil4PJmxhXfk
	QX/jKy+kHqNMbOTNofDN8mIQSuqkImEquyBXfvkPv1cvcdMTml3YPIQgTUlGBQdli/FyWz/U2mYOV
	Y8MDl3W8ROCXg9v0ubClQXg1PvWkGyLvQg+zPfztggEK9wnNlZdXRimxFMvmvxRLsJQLXmNl7uPwZ
	fAK5iKIRdvJtkaYw3PoelOL/oiQiUntMlwd3S9bWNLVS25Rh02yEHGBhjMH0YdPDAg1E0wwyOy1up
	+RDfT4YV0LS+llP6TwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1y2-00690l-1N;
	Wed, 19 Jul 2023 07:51:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1xm-0068nl-0T;
	Wed, 19 Jul 2023 07:51:11 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 658B36607073;
	Wed, 19 Jul 2023 08:51:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689753069;
	bh=P2asjJa8ZKRcMIUubSWXLd+81XU6yi5cTxDjeHRxCpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DncmQ/aNBVXHlmrzBpAM82GdzdA2DMrDqjYopTIBEmYgyARJlFGvTn/Ime0aVDrCS
	 52fCG9RqqsAVUBD3ywVmGD7sW/FGzV3czEIuitOcXv26U7SzoKFCai/0u6jBxmqfPn
	 druIeZpB2G5UHbaDrrwGd5ATTEsxWNL4Cik4OJkTjGHAE0b0YGZ9MSmqemTvSpeg6X
	 E/wZf10fti0KN7uyVA5IYq5VgFSlcDBy+dqiZLtm0/qCx4kQddgc8tkdBlLvcdN/PD
	 F/ZHy9JdaBKmzu2xQ/qQw0K94SpcW2KZIroHUd6ZgUGEMFugc1eQ45s2M8t/KE0RR8
	 kvCmRYPjBPBcA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 3/6] drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
Date: Wed, 19 Jul 2023 09:50:53 +0200
Message-Id: <20230719075056.72178-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005110_311861_50BFB322 
X-CRM114-Status: GOOD (  13.44  )
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

Function drm_of_find_panel_or_bridge() is marked as deprecated: since
the usage of that in this driver exactly corresponds to the new function
devm_drm_of_get_bridge(), switch to it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 03a2b900bb50..e9c5a0f44537 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1063,10 +1063,10 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	if (dpi->irq <= 0)
 		return -EINVAL;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  NULL, &dpi->next_bridge);
-	if (ret)
-		return ret;
+	dpi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(dpi->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(dpi->next_bridge),
+				     "Failed to get bridge\n");
 
 	dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_node);
 
@@ -1089,8 +1089,6 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 
 static int mtk_dpi_remove(struct platform_device *pdev)
 {
-	struct mtk_dpi *dpi = platform_get_drvdata(pdev);
-
 	component_del(&pdev->dev, &mtk_dpi_component_ops);
 
 	return 0;
-- 
2.40.1


