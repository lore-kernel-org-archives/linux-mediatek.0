Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D69C63777
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:25:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3EFD21527
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3EFD21527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=urripTSrkoEAMxD15uh0HEyIrcwsFVBgC+eRH+8iw+c=; b=qNg9RRiOYJ7xJVLRiiCIG+pjXO
	HEpMBShfu7ynN8JmHFeXC6MleJmkLlX9EVjSu1nNj8By1oI6jnInu3pKE/z/KT/o5EPWEUnHjSSni
	Tmx1GNFwydalkm2+sGbtbx1zqEprL8OEKPAOSUa3gdl6J4bLYoxEIl4AZJb4CB7gJ7wYHZ3K3XDjC
	iYx+kNxRL7ozKkHy/ICQst/29XJPa5VgVvls8zTvM8mmS/F2t+hNzF9m57f4H3/YwPl2QVJvzIjow
	oq7HnnXd8/PfqrSODfTIrgVTyahA0m8IYCeXB37+h0l7/FcZiDP2ohNysUAsnCYCt77mFIfNhZX4I
	3OTKhE1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkjvB-0003PH-JX; Thu, 03 Dec 2020 08:25:01 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkjv9-0003OB-Vb
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 08:25:00 +0000
Received: by mail-pg1-x544.google.com with SMTP id t3so938361pgi.11
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Dec 2020 00:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZbfQj5yx8q5vsWWQ52FX9cwcSvHIrWrBDYdeg/Q55J4=;
 b=CC0LDk6MjaniNohllz1X8vF+6zibKnjaUx1UZusXT8g4PvOPFVhlFnPKG5iMoMlTes
 VZTT3FxsHMM0NAZJHNq0pIWQpyPcuO/f5V8263/cLsUcUPTOxTEQNcq++aIVashDczax
 rbeUvp4tBFyvoD4jU7tuyRCmjYopbPDK7mfuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZbfQj5yx8q5vsWWQ52FX9cwcSvHIrWrBDYdeg/Q55J4=;
 b=FkqpcOXYTJUeQpVCBbDxv4a4pDpUTrRdoD6SIELat2km33QQbo9Kx55P9cixR20rYs
 tPM3z1MsTpZuNlZoU+H4X+Fk35Tp7S8xItCMWZ4SyTCi5Js2RFAOtC+tfR4ynLzK2Qzi
 6ATCuH4A14RSPSh5TqZ15MWE/HPoUcjmMnEuhJxG5Fn8RBXQTl/R27itsgyPKx7rmOQJ
 xag2aCuveRTVdWoCfFYUMjWrkJ9N3c/UHnn4PFay8bBhDz+nHxkAk5wXWjMBuL2FxoXg
 r0J6UxY+PPvCRXYOcp8xydCHxODNP2c1jaL38jzORoFOvjzgdb+mvDtx8lI3VdS5kApl
 jSog==
X-Gm-Message-State: AOAM532xWstSz/QsT2jcYFv9Mo9P90yphzmGA3vi1rEZY9yWsrn5Hv25
 2eIIxZjze41PKx/D2ttdlwJ5hw==
X-Google-Smtp-Source: ABdhPJwD4kYBEvN44OH+eyu4iXyYp+S5tYey6LADtEcblFq79I2Cyce9ZL7pLKKrJ1KH9iN4MWofgw==
X-Received: by 2002:a62:a11a:0:b029:18a:df9e:f537 with SMTP id
 b26-20020a62a11a0000b029018adf9ef537mr2173912pff.29.1606983893429; 
 Thu, 03 Dec 2020 00:24:53 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id e66sm815128pfe.165.2020.12.03.00.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 00:24:52 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: mtk_dpi: Create connector for bridges
Date: Thu,  3 Dec 2020 16:24:45 +0800
Message-Id: <20201203082445.1342763-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_032500_046213_7E1069B2 
X-CRM114-Status: GOOD (  15.63  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Similar to a9d9fea74be2 ("drm/mediatek: mtk_dsi: Create connector for bridges"):

Use the drm_bridge_connector helper to create a connector for pipelines
that use drm_bridge. This allows splitting connector operations across
multiple bridges when necessary, instead of having the last bridge in
the chain creating the connector and handling all connector operations
internally.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 52f11a63a330..189377e342fa 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -20,6 +20,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -66,6 +67,7 @@ struct mtk_dpi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_connector *connector;
 	void __iomem *regs;
 	struct device *dev;
 	struct clk *engine_clk;
@@ -603,12 +605,21 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 
 	dpi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->ddp_comp);
 
-	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL, 0);
+	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		dev_err(dev, "Failed to attach bridge: %d\n", ret);
 		goto err_cleanup;
 	}
 
+	dpi->connector = drm_bridge_connector_init(drm_dev, &dpi->encoder);
+	if (IS_ERR(dpi->connector)) {
+		dev_err(dev, "Unable to create bridge connector\n");
+		ret = PTR_ERR(dpi->connector);
+		goto err_cleanup;
+	}
+	drm_connector_attach_encoder(dpi->connector, &dpi->encoder);
+
 	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
 	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
 	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
-- 
2.29.2.576.ga3fc446d84-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
