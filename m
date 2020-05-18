Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58591C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 17:40:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0338620884
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 17:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g0bCvQ//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0338620884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYR/D6V/rplEFb9nX7qGNsdvE7i62OJfD9MgGb3HBOc=; b=g0bCvQ//eF0UCZ
	uatStKCNXVzjwbSmaCr1uDTYmBnEqBVarmqmF1ne+3OuWv29S51SuFn6v9E7nhEURLJiXbxUgUtAA
	ex5IkubihHKo3I6iqmwg6tq1Rj1v0wUIM8+2DbgpiPvZ+IuFsHIymamaALETcbau9ClRdMyBxXIry
	+y4uG20CwTLN7/q38v9025tbJr4EPKOAvSTioO1A039gF69rcsLLX35dnm4O+rSlNanwSyXh1Kz5h
	2Yrb542ZKUljKrUhWfyqX/x0Vhkkb8vQz+PSepcYKni5yf4wSfd9TsNQ/HxYdT5GH0dHrG/Ak3t61
	Qknuz6/EN6PytV1H+LMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jajk2-0000BN-Bx; Mon, 18 May 2020 17:39:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jajjX-0007ws-Lg; Mon, 18 May 2020 17:39:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 91C232A0C9C
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org,
	Collabora Kernel ML <kernel@collabora.com>
Subject: [RESEND PATCH 1/3] drm/mediatek: mtk_dpi: Rename bridge to next_bridge
Date: Mon, 18 May 2020 19:39:07 +0200
Message-Id: <20200518173909.2259259-2-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518173909.2259259-1-enric.balletbo@collabora.com>
References: <20200518173909.2259259-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_103923_844333_5990E469 
X-CRM114-Status: GOOD (  10.35  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, laurent.pinchart@ideasonboard.com,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is really a cosmetic change just to make a bit more readable the
code after convert the driver to drm_bridge. The bridge variable name
will be used by the encoder drm_bridge, and the chained bridge will be
named next_bridge.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---

 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 7fbfa95bab09..7112125dc3d1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -61,7 +61,7 @@ enum mtk_dpi_out_color_format {
 struct mtk_dpi {
 	struct mtk_ddp_comp ddp_comp;
 	struct drm_encoder encoder;
-	struct drm_bridge *bridge;
+	struct drm_bridge *next_bridge;
 	void __iomem *regs;
 	struct device *dev;
 	struct clk *engine_clk;
@@ -607,7 +607,7 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 	/* Currently DPI0 is fixed to be driven by OVL1 */
 	dpi->encoder.possible_crtcs = BIT(1);
 
-	ret = drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL, 0);
+	ret = drm_bridge_attach(&dpi->encoder, dpi->next_bridge, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to attach bridge: %d\n", ret);
 		goto err_cleanup;
@@ -747,11 +747,11 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  NULL, &dpi->bridge);
+					  NULL, &dpi->next_bridge);
 	if (ret)
 		return ret;
 
-	dev_info(dev, "Found bridge node: %pOF\n", dpi->bridge->of_node);
+	dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_node);
 
 	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DPI);
 	if (comp_id < 0) {
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
