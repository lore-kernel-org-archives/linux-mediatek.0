Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00EAC001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Y9aLbmwvF4ZG8suzSgiQfMTt3u9Ub20LrNvJm4OcVI=; b=txKLQNYmAWwfNUPFiH7wARj7P6
	DJ0N60yq1qc4uovMOeOEvuZEkLMEDA0Nicpp6cx9R8AhTs3eD5b2b0LS2by14OGrGu4P7vtGx7r22
	NVz6+WRpXOFUJ3Ohp6AQ9qKL44+j/1cYj7rjQ6sxyrk0ThiC165tkf2iq0ZL+NF0itjJYt9n7GKe1
	em8VV0EqSM8xnzmVR+kE3vaQOBZhJ3zXkuXHdJsoPumkKj5TItNywNLY52Lp3CNquNrnq6IUuJY3h
	bWLpvCuVdYukdNfH9RizAYxQl3vZx4hQBB+r7rsfQftXPmlSdbLheJqCe1fgoK27atESz60VrMMO6
	0BHxhjrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsDN-002XJ4-1W;
	Thu, 13 Jul 2023 09:02:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsD6-002X10-1O;
	Thu, 13 Jul 2023 09:02:06 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B1BD4660704A;
	Thu, 13 Jul 2023 10:02:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689238922;
	bh=K9brwkEaYqYtzbZ32R7KLYRvi25K/zfmEJ6Y561Gn3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H0d3Uw51a2h3LOs4rCB+L8MkoGwKmi+G4Ji0RsG5Alz09VjzXHLPMl/bkTh3zvum8
	 MRM5CwJqlm7HvLMAPSZz4ir13m4m5AopECU/1CgtkaWOQk+h00oX+N1W/O0/oZkeRt
	 DxuNx0YgBZcH7+L9SvXZGu6Z5duVFpUJ37eyMhFVF5DE+LhET8E0CxYvIhJeOOZ6Si
	 8vWuLkIfgaMikxuPFWRgjcWenW0Cu5IaKH5fg2Vy6+SNVRypmGvtxDXqjxY/4JoD6A
	 aM9pwwpbGncet02opuyfkC30ezOIEyujucBmMcfi7eugniAnRiSGJu6+dP+UzlBZKh
	 l+wd/XZvwocsQ==
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
	nfraprado@collabora.com
Subject: [PATCH v5 05/10] drm/mediatek: dp: Enable event interrupt only when bridge attached
Date: Thu, 13 Jul 2023 11:01:47 +0200
Message-Id: <20230713090152.140060-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
References: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_020204_625320_78647CCA 
X-CRM114-Status: GOOD (  16.03  )
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

It is useless and error-prone to enable the DisplayPort event interrupt
before finishing to probe and install the driver, as the DP training
cannot happen before the entire pipeline is correctly set up, as the
interrupt handler also requires the full hardware to be initialized by
mtk_dp_bridge_attach().

Anyway, depending in which state the controller is left from the
bootloader, this may cause an interrupt storm and consequently hang
the kernel during boot, so, avoid enabling the interrupt until we
reach a clean state by adding the IRQ_NOAUTOEN flag before requesting
it at probe time and manage the enablement of the ISR in the .attach()
and .detach() handlers for the DP bridge.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index b4e775e040ee..d67dbafbac8e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -100,6 +100,7 @@ struct mtk_dp_efuse_fmt {
 struct mtk_dp {
 	bool enabled;
 	bool need_debounce;
+	int irq;
 	u8 max_lanes;
 	u8 max_linkrate;
 	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
@@ -2136,6 +2137,8 @@ static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
 
 	mtk_dp->drm_dev = bridge->dev;
 
+	irq_clear_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
+	enable_irq(mtk_dp->irq);
 	mtk_dp_hwirq_enable(mtk_dp, true);
 
 	return 0;
@@ -2152,6 +2155,7 @@ static void mtk_dp_bridge_detach(struct drm_bridge *bridge)
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
 	mtk_dp_hwirq_enable(mtk_dp, false);
+	disable_irq(mtk_dp->irq);
 	mtk_dp->drm_dev = NULL;
 	mtk_dp_poweroff(mtk_dp);
 	drm_dp_aux_unregister(&mtk_dp->aux);
@@ -2470,7 +2474,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
 	struct device *dev = &pdev->dev;
-	int ret, irq_num;
+	int ret;
 
 	mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
 	if (!mtk_dp)
@@ -2479,9 +2483,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->dev = dev;
 	mtk_dp->data = (struct mtk_dp_data *)of_device_get_match_data(dev);
 
-	irq_num = platform_get_irq(pdev, 0);
-	if (irq_num < 0)
-		return dev_err_probe(dev, irq_num,
+	mtk_dp->irq = platform_get_irq(pdev, 0);
+	if (mtk_dp->irq < 0)
+		return dev_err_probe(dev, mtk_dp->irq,
 				     "failed to request dp irq resource\n");
 
 	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
@@ -2502,7 +2506,8 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	spin_lock_init(&mtk_dp->irq_thread_lock);
 
-	ret = devm_request_threaded_irq(dev, irq_num, mtk_dp_hpd_event,
+	irq_set_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
+	ret = devm_request_threaded_irq(dev, mtk_dp->irq, mtk_dp_hpd_event,
 					mtk_dp_hpd_event_thread,
 					IRQ_TYPE_LEVEL_HIGH, dev_name(dev),
 					mtk_dp);
-- 
2.40.1


