Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78380C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHYdQIV0AxxOzeOI5YzBt0f9M2tc6+al7iv8dnz1It4=; b=yY7111f6ROV7tZPQxkDmjnVfjB
	g3Sp8/pk8RYQg+df24aLNR+m1PIqlHV94muLoMu4dpl+x1knSLT9OoR6ITaBZ6C553xe3qaKK3yIw
	JInm6JGb+77JYxLkhzO5lAtfTHiU7SKcowM05B+NXs5w0GPqNGVpKbXoeCjJGPnjqtzdx11c1wAke
	s39ONLkbZdbJI3kDlwqzTupOXm+WTp5QLYGYt9ISgk5Ds2EzwwIo2JjISQ2LMgfZLotuKYfsU/MWe
	tDVdRMpq51NmrOp1lzhsXxz/g1ZmrRAUTkePzwRERnk81Asa+V0GRxE7TjT4KULJZ4Rwt+NDLaBDG
	V1ZOk7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZ28-002xNK-31;
	Wed, 12 Apr 2023 11:53:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZ21-002xHE-0n;
	Wed, 12 Apr 2023 11:52:58 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2798F6603206;
	Wed, 12 Apr 2023 12:52:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681300375;
	bh=ozztGkuiked8t0x6McsZxjJnWL+Yy3Frm2zFzFN/2I0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hmYdnNEG2hFuDTRej2VrjOqKCojBa6mVNVGe6d/pRF3JHNjFAmZb12BVxP84zMyUz
	 0yD2cKh8+zOzI7DrE7hAK8b2jIP5aG2h4w83L09SN7rEDbPoSEZ1IPRt5dZB32vg+t
	 wdp+9CB9E8QfPLqyJhDH8wONxfntzCYZh/FRGVuzJAl/MQsjBvPdIXPXYbpQ+dxXWw
	 SC6ewx5a/qMTwKgo/llMMjUixcmVJvHnHNFbL74WijT0gvlijTlB6b71hb/sJPTcdP
	 7xx1lf2pqkJqZy8Uvk9Y2xZW890ww/46ZNVuJd4Xoy3O4WF/BYZqI98cTx9wSsUYro
	 Zu5rgUXIv2k+Q==
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
Subject: [PATCH 1/4] drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
Date: Wed, 12 Apr 2023 13:52:47 +0200
Message-Id: <20230412115250.164899-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_045257_411436_D1CFDFE8 
X-CRM114-Status: GOOD (  10.72  )
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

Change drm_bridge_add() to its devm variant to slightly simplify the
probe function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 948a53f1f4b3..2d5f3fc34f61 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1090,11 +1090,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
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
-- 
2.40.0


