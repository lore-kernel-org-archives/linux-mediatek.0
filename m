Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3A8C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2UZxwHJgPMTR0Q/TjcgbiumVfSqb0710Nn0jiSvNiaE=; b=0Pszkuw/y5qQje
	bzOi7IC9gsB7uQBaWWsbrizTyE6Sb+3pwyaaHFQViix0IFQ/hDEskNgyak0AKigyznjldKcbpn79m
	RxcDAJ4Ch2/e7Z4DPKmFwhTP2kIaKI8N/yc4Vzfz3FyPfF2vFMr/YE+GxQABaIXPF/8pnCkcVwyKT
	yrXl5EkNtBLvSith4V77kVgpLg/l52XyCdBdB+HPTzYMPKY9LWfPn/SAfyPt/E0KJalM2EjzEAz2k
	8al38khPJlpC3TJeLN46J4QC+KSONNMLDNsg0I/bmAl/Y3JjXRvbd244uQ9bub6yLzOvuvmQwkPyQ
	a9i8hoAGXFhL8SkJWN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZnS-009ZVr-08;
	Wed, 26 Jul 2023 08:23:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZnO-009ZSS-0e;
	Wed, 26 Jul 2023 08:22:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6CA4D6607122;
	Wed, 26 Jul 2023 09:22:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690359777;
	bh=X/lbOxLnBQ0IOJlygqhPxxq+12K+xy0kUB3z6732T3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ATzwp2iBoJve/U9X6Yw7KXWS6r/0ilp/rt4lgutwOQg19JlNvQ0snH3BtjpHqRAxd
	 LmAGdiXsmZ688T0Jb9CsK/+ZqVJGfyXicio3cg1+Cc+yNJfquzKKLvEyVvKM3Um40M
	 RMDsuxvDnelGrlEcIkEWlVxqx9GJnn0J2WMHlqyygUiHrvbY2Cyq55+k3TPsSbeEgo
	 3EJvd6TWFNsAfYcUop+I9dAYvd+RsefQN+HL39WrMqInCurabQZZGp1S2GGMe9bnVb
	 9a09oBRJ+4grqulqZIuTTvsGUnKh3WmAdFxm+iflgnYYcjONTKHVcV4v4NZAHzFbvg
	 QU/Mj+W2wtVEg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 3/6] drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
Date: Wed, 26 Jul 2023 10:22:42 +0200
Message-ID: <20230726082245.550929-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
References: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_012258_372604_562D1EC0 
X-CRM114-Status: GOOD (  12.44  )
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
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index fdd5b7126e27..08822fe88c93 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1062,10 +1062,10 @@ static int mtk_dpi_probe(struct platform_device *pdev)
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
 
-- 
2.41.0


