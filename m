Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128AAD31A2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 09:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jBri2FSO9ova+6N8irDgqT8faDyY4fKEpF2RXzIi/cc=; b=oVmA16kz8SjbBPz1MmTlfVw0gI
	2dXbkJ5Q/cxXNpLxU0HYgK/+H6W1ykvLQCr0lsuRnX66JgpzCSVKp/dW94KR013rXJskT2o5qEZwi
	OWzZuhv/B2zDpVkqkQiwJvxLMxSGIweHiCnKjV0xxR3AqEw4j1XDmu4huOzgz5o1+oe49m+fFY9aJ
	6zOOkFJz2n5rfpoFv5gjphMsq7BUvU6Djbwt5nquh8GTer7bRW4BgO99OI1/R3AN9uwZ1907ib9zw
	YqNAnUGiQK5j1wImPl0Jsmb2R947hasjjML2UtQevjYnsoof69EWd4MUsMfnqa+Y4rysOyrKOf6WT
	HpioyJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx5p-00000008Wlc-3m7y;
	Wed, 14 Jan 2026 09:23:09 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx5m-00000008Wk5-3q0a
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 09:23:08 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-81f223c70d8so3315870b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 01:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768382585; x=1768987385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBri2FSO9ova+6N8irDgqT8faDyY4fKEpF2RXzIi/cc=;
        b=ZJqgw87H4zjxSm0J+E00nN96VbjOQv25hBZ7fpXJmLNMJzPl/b9/kMfj/qmnf2Ciuf
         RGiL+fs0KrerKsHwJm9jcSwONUXQa2jvjptEZTV5spe8YmynkK/4dVJI+8r/QR6l/o7g
         K19IUre3eVBPYCY28DDZ37TyV4I9a6heoUwBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382585; x=1768987385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBri2FSO9ova+6N8irDgqT8faDyY4fKEpF2RXzIi/cc=;
        b=E6/CCLLg7TRH2uftq/Ot0pszjMKeUP1rDINYapLPJaJ80YlF7TgEfTLSvtJcUFswSq
         N3bpvmhQGt+ESolmwWbCX9cgEnn+T6kzkEzkmbrIIyVuCO6Jbaat52nwhFc2/BemlG3S
         wrks6Xw2+uuUAm06su/Yl0e49578Q+2F/BBQd+H6nZVOw3VdL+/74IOZn/BRrbUPhmD2
         Ink7cfbRijmIbE/JDldRc4BRBqTpC6+X8C10d92XPi9uBqgys3DmeCrhVy+8pazLp7Ro
         jwsnmDhVgqMv53bSN9+C1TiwEvLK+sJzIPg1ZzQ+qjmn/73g51A5s1XuPwc1k+52VnGy
         VsGw==
X-Forwarded-Encrypted: i=1; AJvYcCXNht363RLVqVkEW+6ifm22wWBrgKAbOTTztCVxTVRk54qN8hdCqYjIx39r9qvq0Wyap7hXf9k4Jl96mPmCow==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE4N/ovzZoda/qWN8sB275psPn2pPCaAeDOxdP0+E+zoyi0C40
	JMn2SHtjgAqM0P4byNo2TfC6p2+eyf8cbqthhTVqev2S0QB9uko1gnh0Q8x6vC3rtQy2PnLSlJw
	YQiBCrw==
X-Gm-Gg: AY/fxX4Vt6pX4HwlLDCJChQNFYAm9W9m4BzXthQMk33YhhWMWpVhKbr/WpliDgVYHPG
	UDOrXVCQGmJ+jdA2p/1mUoxkr4AyMZj2+1YHDkiD5eDu9zjObP+TWkoYI+xX+iTUw0oMc3B3bgu
	Xw8r8P0ge9jgVFMZuNvMsI032jEeKHVc8AF+9yWuReA+E5IkaIqD75WKiKtZY0GNvricUCj7fVO
	kT/pUUPBcNfU7kT8kbOSKdBG7aJPcUNGIX859cNW/0ZJaZmwJm71Up2P3IL+p/YTypGVQBmJbux
	+Lj0Kd+niGJfl9AKGwAb4TgmBQOGxrfuCKmptZvmyxSPwNt58azMwhnvW/2XIDm6p8ruDauRoXc
	8pdcsT7Uz2t5igSl5T2yHdMvx8AisstOXiuvl5WwC0ur8DFtio89zQ/KHtKbbmC6fPaSJ79aHEB
	aWQpiivVj8FySIGoXRnNMaP6K0mlZCEWWCN70bPemORFs/GyebSmXcsBUBIyvYcNjVNvCq
X-Received: by 2002:a05:6a20:c525:b0:38d:e87c:48d5 with SMTP id adf61e73a8af0-38de88b96c6mr144807637.21.1768382585505;
        Wed, 14 Jan 2026 01:23:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c346:2298:451a:a3f3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29516sm22099403a12.19.2026.01.14.01.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:23:04 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mediatek: dpi: Find next bridge during probe
Date: Wed, 14 Jan 2026 17:22:42 +0800
Message-ID: <20260114092243.3914836-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012307_017965_3270C5BA 
X-CRM114-Status: GOOD (  16.80  )
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

Trying to find the next bridge and deferring probe in the bridge attach
callback is much too late. At this point the driver has already finished
probing and is now running the component bind code path. What's even
worse is that in the specific case of the DSI host being the last
component to be added as part of the dsi_host_attach callback, the code
path that this is in:

 -> devm_drm_of_get_bridge()
    mtk_dpi_bridge_attach()
    drm_bridge_attach()
    mtk_dpi_bind()
    ...
    component_add()
    mtk_dsi_host_attach()
    anx7625_attach_dsi()
    anx7625_link_bridge() - done_probing callback for of_dp_aux_populate_bus()
    of_dp_aux_populate_bus()
    anx7625_i2c_probe()

_cannot_ return probe defer:

    anx7625 4-0058: [drm:anx7625_bridge_attach] drm attach
    mediatek-drm mediatek-drm.15.auto: bound 14014000.dsi (ops mtk_dsi_component_ops)
    mediatek-drm mediatek-drm.15.auto: error -EPROBE_DEFER: failed to attach bridge /soc/dpi@14015000 to encoder TMDS-37
    [drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
    anx7625 4-0058: [drm:anx7625_link_bridge] *ERROR* fail to attach dsi to host.
    panel-simple-dp-aux aux-4-0058: DP AUX done_probing() can't defer
    panel-simple-dp-aux aux-4-0058: probe with driver panel-simple-dp-aux failed with error -22
    anx7625 4-0058: [drm:anx7625_i2c_probe] probe done

This results in the whole display driver failing to probe.

Perhaps this was an attempt to mirror the structure in the DSI driver;
but in the DSI driver the next bridge is retrieved in the DSI attach
callback, not the bridge attach callback.

Move the code finding the next bridge back to the probe function so that
deferred probing works correctly. Also rework the fallback to the old OF
graph endpoint numbering scheme so that deferred probing logs in both
cases.

This issue was found on an MT8183 Jacuzzi device with an extra patch
enabling the DPI-based external display pipeline. Also tested on an
MT8192 Hayato device with both DSI and DPI display pipelines enabled.

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 61cab32e213a..53360b5d12ba 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -836,20 +836,6 @@ static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
-	int ret;
-
-	dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 1, -1);
-	if (IS_ERR(dpi->next_bridge)) {
-		ret = PTR_ERR(dpi->next_bridge);
-		if (ret == -EPROBE_DEFER)
-			return ret;
-
-		/* Old devicetree has only one endpoint */
-		dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 0, 0);
-		if (IS_ERR(dpi->next_bridge))
-			return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_bridge),
-					     "Failed to get bridge\n");
-	}
 
 	return drm_bridge_attach(encoder, dpi->next_bridge,
 				 &dpi->bridge, flags);
@@ -1319,6 +1305,15 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	if (dpi->irq < 0)
 		return dpi->irq;
 
+	dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 1, -1);
+	if (IS_ERR(dpi->next_bridge) && PTR_ERR(dpi->next_bridge) == -ENODEV) {
+		/* Old devicetree has only one endpoint */
+		dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 0, 0);
+	}
+	if (IS_ERR(dpi->next_bridge))
+		return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_bridge),
+				     "Failed to get bridge\n");
+
 	platform_set_drvdata(pdev, dpi);
 
 	dpi->bridge.of_node = dev->of_node;
-- 
2.52.0.457.g6b5491de43-goog


