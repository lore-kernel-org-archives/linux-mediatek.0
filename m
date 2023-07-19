Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70335C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36nLmUkMoaPNfFqc2lZwJu0SPk871bx2ndAXsjrjZM4=; b=UZiHfTkI1en04e
	PHe3G16qyDIRL+I/crAYR98jQQJUHXgQMCPSeR0FzxLfD08jdcaJNJlQZus5Bv7/f+ZTvlUC6V8DE
	YCMUiJhqWr3vMu7gd4JdZ1URkEuARt1fdJFAQ8jRbuphE7jLjGzAqXHbVXhlQkJCF9IPZvMUjwwpj
	fr8mV3FI0cBNj2UK/yoS0SesSipwMQm7TDgczwEgFQmNuM/+8AP72I6WS8cu881kcoDmg7ay5jx5G
	vfBbx19MCyFrTXhuaJ3vR1WODUKHdEL8qI4Em7IJItV6juqd+fD1i70S+0ntuSYM6qGNVRKWWQIAn
	8FKbSWOjcg6n/kZ8VWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1xp-0068qt-09;
	Wed, 19 Jul 2023 07:51:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1xk-0068n1-2G;
	Wed, 19 Jul 2023 07:51:10 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D5D6A6607070;
	Wed, 19 Jul 2023 08:51:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689753067;
	bh=n4bzSjz/8ToatLkUrHwwNZNY341UFIC11J8xZSFamQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YVm9nlsm7Q93D67X1+1cSOFc6xkeULgbJzUdCUPhr5LLjVwqs6hPTFnkancL7h/IH
	 e38JSizfJc9RmGiUIb3+LsqCAwc/M0GhFCQZ9cM5oYhe4Zrl1vV2Dk2hdsiM8DEKd2
	 lajRt6cmWVXGyLUc1jDVhFr8Ba8pw0XAxc1ZOdTQHCB81W8OW4MW9G2bvp+3DNrTNF
	 Tw1hvo2MlLdOl89ZJj4gkdkfQVdAFx2QL7a/D+XpRz4nuDeqLO7R/xoK7KWQLgnzzX
	 kGsW1hc7nLyQ1RGMbuOJ45HuSPW1+/6gmkcCVhmS3GvCrJy10ef+1fACwOzD3Rmy2P
	 WIIP7xHk3LW+Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 1/6] drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
Date: Wed, 19 Jul 2023 09:50:51 +0200
Message-Id: <20230719075056.72178-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005108_869429_4FAFCD1F 
X-CRM114-Status: GOOD (  11.76  )
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
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 948a53f1f4b3..74068aa70e0c 100644
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
@@ -1107,7 +1108,6 @@ static int mtk_dpi_remove(struct platform_device *pdev)
 	struct mtk_dpi *dpi = platform_get_drvdata(pdev);
 
 	component_del(&pdev->dev, &mtk_dpi_component_ops);
-	drm_bridge_remove(&dpi->bridge);
 
 	return 0;
 }
-- 
2.40.1


