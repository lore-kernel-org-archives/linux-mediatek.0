Return-Path: <SRS0=tJCI=6P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED2CC47253
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 15:25:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31400206D9
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 15:25:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T+J/nnjv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31400206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuFdH7SFgT8tgx3iNbCORd53LYmlrqLXaC6gqz8MNEI=; b=T+J/nnjvpoa1gs
	3w/rKknLrfSEQVBOGxqw4xE6epYRxTHf7cboz5lPRgC3xkdoAs/D/YUol+2oI7Vpe27+RsLDq/A9v
	hTNgLHcLmLAiSrfpj080CnBNZMKn4vRn7Tk9iYxMwfBdQSx+LJYPIwU1CEYCiBIrPvS0o0K+b2KMb
	5PMN78ZBVveMNCmLxW5y6S2wwVCj616mMcCUM/vSVfkKz7EgYMSQZ9BGdMXz1hj5qzUWZEyf1lSBm
	nSWyfJRJaDsoFjvT46Pg+s8F45Z8xZ84bCXkj889ROs9/fwYcT1dMJ6gFhfStURadcx+y1/8mRRx3
	MF9Qg0f2FAfzuc2hKekQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUXXi-0006Nb-Br; Fri, 01 May 2020 15:25:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUXWD-0002QW-3B; Fri, 01 May 2020 15:24:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 15E772A3116
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org,
	Collabora Kernel ML <kernel@collabora.com>
Subject: [PATCH v4 7/7] drm/mediatek: mtk_dsi: Create connector for bridges
Date: Fri,  1 May 2020 17:23:35 +0200
Message-Id: <20200501152335.1805790-8-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200501152335.1805790-1-enric.balletbo@collabora.com>
References: <20200501152335.1805790-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_082401_280555_63E009DF 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 laurent.pinchart@ideasonboard.com, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, matthias.bgg@gmail.com, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the drm_bridge_connector helper to create a connector for pipelines
that use drm_bridge. This allows splitting connector operations across
multiple bridges when necessary, instead of having the last bridge in
the chain creating the connector and handling all connector operations
internally.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v4: None
Changes in v3:
- Move the bridge.type line to the patch that adds drm_bridge support. (Laurent Pinchart)

Changes in v2: None

 drivers/gpu/drm/mediatek/mtk_dsi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 4f3bd095c1ee..471fcafdf348 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -17,6 +17,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -183,6 +184,7 @@ struct mtk_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_connector *connector;
 	struct phy *phy;
 
 	void __iomem *regs;
@@ -977,10 +979,19 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 	 */
 	dsi->encoder.possible_crtcs = 1;
 
-	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
+	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		goto err_cleanup_encoder;
 
+	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
+	if (IS_ERR(dsi->connector)) {
+		DRM_ERROR("Unable to create bridge connector\n");
+		ret = PTR_ERR(dsi->connector);
+		goto err_cleanup_encoder;
+	}
+	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
+
 	return 0;
 
 err_cleanup_encoder:
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
