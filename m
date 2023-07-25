Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACCBC00528
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3m9dehyH8Rtz4oVGFLM78qV8f+b2gqWRCsZJmYgouc=; b=18pGb/Eh8p77rJESUtr6852DHn
	FuXfDKO5PWUGt/GN4zds+WZ6oLxw5fhOPeH8xw25NmnqUvQh6t3wVS7L0jLge/c4dXLdRSfWbdjpw
	SzmIRDAiXafw5GxHw31ZV7XxXa1NhUdEJ4PWBUi4z6LjvjkPLAOnnIjx7TU9VDJ7iF+Vuz2Yk+ghM
	8EXpFJRY6AVS1MU7zvFkJfPBSfTJ007AAtEe6W5AgXGOlxIcxB/ycYlLdM3GbjZErsepGf3rNKrpt
	YUL8ADcOSh/c3HnmSDL3GL3W1bE4s8q4CC6CiS9pyVmu1fUpsJ9SVk8uCZp0qNCyyz6WcAzONMyBx
	AJrF/9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXZ-006beg-23;
	Tue, 25 Jul 2023 07:33:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXL-006bQk-15;
	Tue, 25 Jul 2023 07:32:53 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7024D6607108;
	Tue, 25 Jul 2023 08:32:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690270370;
	bh=dr99OhwRka0b6+lAYNS1mwFM6qaBC8ZcI/J5NoLdlok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WSi16ofMtB8ehG3tBUD1CVjNeDNuqYAfS2USiOTgz8qYecdNQfzoPsjhIAuE8tGFM
	 OQ8+y0S+IVKN2oTWSZWU7qQNESjNmiSmb5+mNl8Ot1dm6CjNjLRk7NAQW1LpspsdDN
	 xXtojEbHdmtddg+K5E3VJVCiS/p181DbTFD9bAj6/8atOtdzi4b02WFRH7A66rZc/Q
	 tR00Fh0S2hQnB9FB0aiTZbZPBNSP+dJfBLBqXHSy6FLUUSmKVtUlRNK2UCkp7akazj
	 VZQaBZSo3Nib7cqzHrDf2nbTbvrLsXNDmseskscPM/FYqVf14iYncSdMDoQmwzQk5p
	 KV2WAgO/Z8JVA==
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
	kernel@collabora.com,
	wenst@chromium.org,
	nfraprado@collabora.com,
	ehristev@collabora.com,
	CK Hu <ck.hu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 04/11] drm/mediatek: dp: Use devm variant of drm_bridge_add()
Date: Tue, 25 Jul 2023 09:32:27 +0200
Message-ID: <20230725073234.55892-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_003251_779183_9FA87973 
X-CRM114-Status: GOOD (  12.17  )
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

In preparation for adding support for aux-bus, which will add a code
path that may fail after the drm_bridge_add() call, change that to
devm_drm_bridge_add() to simplify failure paths later.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 98f63d8230e4..fc6cabf5370b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2552,7 +2552,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
-	drm_bridge_add(&mtk_dp->bridge);
+	ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add bridge\n");
 
 	mtk_dp->need_debounce = true;
 	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
@@ -2570,7 +2572,6 @@ static int mtk_dp_remove(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	del_timer_sync(&mtk_dp->debounce_timer);
-	drm_bridge_remove(&mtk_dp->bridge);
 	platform_device_unregister(mtk_dp->phy_dev);
 	if (mtk_dp->audio_pdev)
 		platform_device_unregister(mtk_dp->audio_pdev);
-- 
2.41.0


