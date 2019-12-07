Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C81C43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 22:28:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3565924670
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 22:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OqPYWwBM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttzFH9u0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3565924670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIia4zn2mKaSg1fUEyRRfkI056nI5Sf4PKBBCMrzheM=; b=OqPYWwBMP3yBEZ
	xh8nhC7q347AtoT0Ix0bgKBBXupzUfycaXqRtzhzcl34lgHiG7QjSvLK1ubO7ChSuTKWIoML7onm9
	5imhMaemBRO0xQ2JPRZynmazqdSfCdPlUcHBbPpBdrcWCf9FySxPehXz5ELiVk473xDTCrI+BiSlC
	sQJ8wSrKtcmIVPfkIGlc7JebXzRtzFI1Am6yTWb8XrPOd3KpEqS5/Ejm/GUIY0cnpcdc9R3N/8qb1
	+YmdqTZvOGCaAjbrOeIueQs4rBz2IGG/6Op3pQqc1WRhG0PBtwZpYo0nrr/g3R7xJ0ppddiJ4UA9n
	fDP7vS7Xq7Lj+0ijfWig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idiZD-0004Ka-0i; Sat, 07 Dec 2019 22:28:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idiW0-00017r-9D; Sat, 07 Dec 2019 22:25:30 +0000
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1331224677;
 Sat,  7 Dec 2019 22:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575757527;
 bh=2c1gUv8XKvS1eMqQrdyjBwQRMHyDf9x2WLP/L/N/oYk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ttzFH9u03f7G9wKj1dtgPYaiqaISA6clMQRw3YMAallOWXG37EZpFmxunEwlB26jH
 t804u5QGOOIDea4aEzZCQSQ8GbQkfGXiiNzmWTuSHw3I8+t7a4p5WmRmK06IT9DPFt
 0J0v6hAFNH9iNi1tqCiI1+oqKza4Q1UWV9BbbM40=
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v6 12/12] drm/mediatek: Add support for mmsys through a pdev
Date: Sat,  7 Dec 2019 23:23:49 +0100
Message-Id: <20191207222349.23161-13-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_142528_430565_AF5A2E98 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org,
 drinkcat@chromium.org, linux-mediatek@lists.infradead.org, mbrugger@suse.com,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The MMSYS subsystem includes clocks and drm components.
This patch adds an initailization path through a platform device
for the clock part, so that both drivers get probed from the same
device tree compatible.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 210455e9f46c..5ada74d8d0c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -186,6 +186,7 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.ext_path = mt2701_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
 	.shadow_register = true,
+	.clk_drv_name = "clk-mt2701-mm",
 };
 
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
@@ -195,6 +196,7 @@ static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
 	.third_path = mt2712_mtk_ddp_third,
 	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
+	.clk_drv_name = "clk-mt2712-mm",
 };
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
@@ -202,6 +204,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
 	.ext_path = mt8173_mtk_ddp_ext,
 	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
+	.clk_drv_name = "clk-mt8173-mm",
 };
 
 static int mtk_drm_kms_init(struct drm_device *drm)
@@ -499,6 +502,24 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	INIT_WORK(&private->commit.work, mtk_atomic_work);
 	private->data = of_device_get_match_data(dev);
 
+	/*
+	 * MMSYS includes apart from components management a block providing
+	 * clocks for the subsystem. We probe this clock driver via a platform
+	 * device.
+	 */
+	if (private->data->clk_drv_name) {
+		private->clk_dev = platform_device_register_data(dev,
+						private->data->clk_drv_name, -1,
+						NULL, 0);
+
+		if (IS_ERR(private->clk_dev)) {
+			dev_err(dev, "failed to register %s platform device\n",
+				private->data->clk_drv_name);
+
+			return PTR_ERR(private->clk_dev);
+		}
+	}
+
 	private->config_regs = syscon_node_to_regmap(dev->of_node);
 	if (IS_ERR(private->config_regs))
 		return PTR_ERR(private->config_regs);
@@ -605,6 +626,9 @@ static int mtk_drm_remove(struct platform_device *pdev)
 	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
 		of_node_put(private->comp_node[i]);
 
+	if (private->clk_dev)
+		platform_device_unregister(private->clk_dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 63a121577dcb..8fe9136adc38 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -29,11 +29,13 @@ struct mtk_mmsys_driver_data {
 	unsigned int third_len;
 
 	bool shadow_register;
+	const char *clk_drv_name;
 };
 
 struct mtk_drm_private {
 	struct drm_device *drm;
 	struct device *dma_dev;
+	struct platform_device *clk_dev;
 
 	unsigned int num_pipes;
 
-- 
2.24.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
