Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210E2C001DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WOX9OhE5HyHSu4Rd7w5u0hf369Gl+TJsRi2Fp0XMIg=; b=MgpDfFQsGRsipT
	J0DS1CQrFVk1lWeKwAQCAqNM3dxOPzrUmyD8/sNgU3heeBsGX/4w0ybsMAgx6fj0C4uT/M/x/iSxd
	Tf7pRCCG8Zg+zoj8rR5Na68VbKv1voW50Rp0haJyOuC8w4e9hjgpjWMvlGLQtsIN/MvkMa+9qon74
	48YFI1JkglIikworbAjdI24Jtlb+q+v8f/h/B2gZq3xKUMuQg1Fe6Dm/DXPx+pTKL4ElwUO34ybGL
	gUq9OF4Xb+eUQmKy8L3WCZ8HWrZEQyjQBQScuRBQLPMEhujj978dEpcOvWqzM9QeEgrtvTDOf6ENQ
	tNJ551lPePOahbb13IyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZnj-009Ze8-2c;
	Wed, 26 Jul 2023 08:23:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZnP-009ZSM-0W;
	Wed, 26 Jul 2023 08:23:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D8B916607118;
	Wed, 26 Jul 2023 09:22:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690359775;
	bh=Q3C1A1/WPCB7GbI1qxZ2/JfxdcuHFERjBQhqhmiBaJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W30kAM9VjbsptC4LXUxcchKuSEOJnLC9ADzIMueGjuYiDFH+AOvz3ncVSpl9zL3e8
	 wz5SeJfGapt4RQccVkA43tD9ddC7rrfeTfAMHJhkqu7t7F/2HriKC/D5DZGdCgP122
	 eVuiFWhc/EXAsiHVQtbnCpqTW+2vwr2j9oke+HkTviebSi5NWXBEUwYogLNBaThS8T
	 5GZJ0NVWdx8b/AHBtAYlJXenJAZEbd9msG0v+OOcjRaFRGeKBYCNk5IAsixxtPi5TD
	 64iZqYNm0Uvm2fkjGZxmf9Lw5vynEbYxXO1bqw54ix7LRZw9F27r2UmqLJWYS17dND
	 oxL1pkItFLJCw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 1/6] drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
Date: Wed, 26 Jul 2023 10:22:40 +0200
Message-ID: <20230726082245.550929-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
References: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_012259_327994_A9A5223D 
X-CRM114-Status: GOOD (  11.62  )
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

Change drm_bridge_add() to its devm variant to slightly simplify the
probe function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 28bdb1f427ff..e4ee0d02893a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1089,11 +1089,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	dpi->bridge.of_node = dev->of_node;
 	dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
 
-	drm_bridge_add(&dpi->bridge);
+	ret = devm_drm_bridge_add(dev, &dpi->bridge);
+	if (ret)
+		return ret;
 
 	ret = component_add(dev, &mtk_dpi_component_ops);
 	if (ret) {
-		drm_bridge_remove(&dpi->bridge);
 		dev_err(dev, "Failed to add component: %d\n", ret);
 		return ret;
 	}
@@ -1103,10 +1104,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 
 static int mtk_dpi_remove(struct platform_device *pdev)
 {
-	struct mtk_dpi *dpi = platform_get_drvdata(pdev);
-
 	component_del(&pdev->dev, &mtk_dpi_component_ops);
-	drm_bridge_remove(&dpi->bridge);
 
 	return 0;
 }
-- 
2.41.0


