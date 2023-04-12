Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBA6C77B71
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmhZF73FqEw+2ZptqVtSVEzgtPxkd+jkUEOprdOG/xw=; b=JiKagMQv+0bI35VKdrSSUsk4Bn
	AYC8HrzcviJ//a5U+TanOZWTMqhks+++uTNYgzY93ggplT6SOwFzM+5dZsj5gN4ILJn5c6H2SZKGO
	v61x/sDMHSMZq520ALVqwfmdfxmByOFXTha2Hl10tzXbb8OVTUTOIZyJvBMOfx4HPQMWRcVRG0QrM
	BbMIV08DNnKKH+HnI1rsab5wMBWFKLB6ARVJ/od+zozJszjGrUaqfXf/yYsodOrd7WyPfG//y+5Es
	0koQXPQjjgBt+u+VJs0d/lH8TyAiEfs7LSaqdMEpWVVcQhR7zG6iKBC82gULHXwY2T5/og0hQQzho
	2ji+9zhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZ2F-002xTV-2L;
	Wed, 12 Apr 2023 11:53:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZ22-002xI3-1q;
	Wed, 12 Apr 2023 11:53:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C01186603239;
	Wed, 12 Apr 2023 12:52:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681300377;
	bh=4FBue3qHRI25FXn0MBkODyzRRRK4GfsWagmvjRhDO5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eCDzv+FOppqjQwIZrSpLGamwEACPh8hraG9vIjR0E0AgYoBxv+sPdCf2/Luumn17G
	 qhi0/SDnLZ8wgejRJhNmWA/61b3g3TWrK2Gjh3OzYuQHWCv1ct7H4xSOkYRVJoLEV9
	 hjBzIAhAXCLMxutGeXBMLU/pUQRXWYhe3aN4oI3QXqR9ei3BsRXd8AhOYtQ+kgQa6M
	 Te6guvGzaM3roCpgBvuqeE+cDk84GztJ07AfRfVrmLHdX2764kUJJEyKkjaft311KB
	 fFuBafK5G7ZYGZwHgUiRYt1da5+UwiqbfzeOTm1GNY3fMjCOG6YfFJcrCiXsG5G9rQ
	 yVRV+Rem0Elkw==
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
	kernel@collabora.com
Subject: [PATCH 3/4] drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
Date: Wed, 12 Apr 2023 13:52:49 +0200
Message-Id: <20230412115250.164899-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_045258_773170_32630B1C 
X-CRM114-Status: GOOD (  11.45  )
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

Function drm_of_find_panel_or_bridge() is marked as deprecated: since
the usage of that in this driver exactly corresponds to the new function
devm_drm_of_get_bridge(), switch to it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 6be65ea21f8f..9025111013d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1063,10 +1063,9 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	if (dpi->irq <= 0)
 		return -EINVAL;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  NULL, &dpi->next_bridge);
-	if (ret)
-		return ret;
+	dpi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(dpi->next_bridge))
+		return PTR_ERR(dpi->next_bridge);
 
 	dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_node);
 
-- 
2.40.0


