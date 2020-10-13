Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7580FC433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 17:28:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A2825357
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 17:28:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EW47G3HZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F6Ukqv+8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00A2825357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LZ0DVvkTM7OCosyI2xhv01l0mLJm0c/3iDq6eOLs8RM=; b=EW47G3HZ90IDIGHi2fQvPP52NP
	AbH8jLOVcKnltTCcboK8XdfkapjIPergNSXYt+NDyXgWwBsG8liUb1donpv2ZIQJgb4UglS5Xb9nP
	xX+4br+ySCha9H5HH7BoAZsTBRw3np+GRZKAKWpjGzdUgCsbkB5iiKgECf60V1Ef1KBB1l4JIOWcT
	XW0lWHg5NNRT38FonwLG6TwgXEjezxIu9xxpBTisuGiYb5oiwh129yLEoFhfs52V/rFEp9Q3zdIMO
	WJJOGyhIlpN6G/wgRHbVq7NehOxDBjQmjmaF53LDcPMMTMC6+DUtKSlrFwBIQr3x23y+yVwtD1Mrx
	4C20O+Wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSO6R-0003Pd-3f; Tue, 13 Oct 2020 17:28:47 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSO6L-0003N9-Mr
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 17:28:43 +0000
Received: by mail-wm1-x343.google.com with SMTP id d81so427654wmc.1
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jOUfisstoXGjLG7B1xLKFejULL7TZhQ40jOISFOxPnU=;
 b=F6Ukqv+8YI+sJda97ZCJUyO9hIVT8bLkuxZmx1fKqz/YgLrDO+H9aG9zIA5jBCUsST
 kZ2Ybdk/YtWdYxxD+zrP7wR7LLCUokfeRQ9bKGPeqkLbJ1adEKXZGF1aPhwwtIAWE5/y
 dehHYAl4t4o6PkqQTIqxSHzQs0JE1gT7aBAUbnSvvokWVTNQzdXRxm+WKysvNfPvuhGh
 dXOziZSHKBSFVk2uNwp+dF2U/Dcg0OHWMNCwN13Dcl2ytpY9l2I/HVpRlhyCvgFqqaYT
 baCEn9vhLBP0tXKqoKxjgxaPOabfFN6hXeMUS7m2gnPZqbScz/qwc/DcD0A9NMVui6aL
 9KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jOUfisstoXGjLG7B1xLKFejULL7TZhQ40jOISFOxPnU=;
 b=QA/t+Y+Dv39xVwWk1Ts/y69FpCAtXbGb0wwwGjDfjkLGTlenufP7zzT1V/kqyDd+CS
 fWHhTXoEs/oZ3B9OEfPXYO6qSlkQTq3oRYjOba6H4S4uFy2frOx8wlUk2fyF8HjtDMYq
 N2WuGbWCPu3F/5s9hI+MxM3fjpez0I4p3X3Vhu9q0uVxYXiORySUzcCb6sViDmGgir1H
 8TeNLnVqvobKHn0kLbmE+n/B3N0LvacOVqcOfWlprVFiW0H74vHDSYikigZnwKF1dp6p
 Nt/1rrluy5Gh/9bfGe3CqMpmtzhXdTEVw0qNDIBQaDpb2HPpdzXGabjOjHH8EK/px8Xo
 AnKg==
X-Gm-Message-State: AOAM533SrxeUM4GKOATa2v+3m6f+a50t9TLDbVuR9veC+QQDpoO2GlpR
 fR10LyfdUtHnpxB73xa0hHFAYQ==
X-Google-Smtp-Source: ABdhPJyII7msKF/kt2LYUO+vOQnrtcFfBpDhNh+hbPbyCS1UAIQk+s29Sdhn/oxOJTnZrGXrPidf3A==
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr906810wmh.78.1602610119013;
 Tue, 13 Oct 2020 10:28:39 -0700 (PDT)
Received: from localhost.localdomain (26.165.185.81.rev.sfr.net.
 [81.185.165.26])
 by smtp.gmail.com with ESMTPSA id c14sm315131wrv.12.2020.10.13.10.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 10:28:37 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/mediatek: mtk_hdmi: move 2 registers address into
 of_data
Date: Tue, 13 Oct 2020 19:28:31 +0200
Message-Id: <20201013172832.4055545-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_132841_848668_ED022346 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: chunkuang.hu@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On MT8167, the two registers SYS_CFG1C and SYS_CFG20 don't have the
same address as on MT8173. Add OF data in order to store the address
of these two registers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 45 ++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index a97725680d4e..c70f195c21be 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -36,6 +36,11 @@
 
 #define NCTS_BYTES	7
 
+struct mtk_hdmi_data {
+	uint32_t sys_cfg1c;
+	uint32_t sys_cfg20;
+};
+
 enum mtk_hdmi_clk_id {
 	MTK_HDMI_CLK_HDMI_PIXEL,
 	MTK_HDMI_CLK_HDMI_PLL,
@@ -146,6 +151,7 @@ struct hdmi_audio_param {
 };
 
 struct mtk_hdmi {
+	const struct mtk_hdmi_data *data;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 	struct drm_connector conn;
@@ -244,21 +250,24 @@ static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
 	 */
 	if (hdmi_phy->conf && hdmi_phy->conf->tz_disabled)
 		regmap_update_bits(hdmi->sys_regmap,
-				   hdmi->sys_offset + HDMI_SYS_CFG20,
+				   hdmi->sys_offset + hdmi->data->sys_cfg20,
 				   0x80008005, enable ? 0x80000005 : 0x8000);
 	else
 		arm_smccc_smc(MTK_SIP_SET_AUTHORIZED_SECURE_REG, 0x14000904,
 			      0x80000000, 0, 0, 0, 0, 0, &res);
 
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg20,
 			   HDMI_PCLK_FREE_RUN, enable ? HDMI_PCLK_FREE_RUN : 0);
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG1C,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg1c,
 			   HDMI_ON | ANLG_ON, enable ? (HDMI_ON | ANLG_ON) : 0);
 }
 
 static void mtk_hdmi_hw_1p4_version_enable(struct mtk_hdmi *hdmi, bool enable)
 {
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg20,
 			   HDMI2P0_EN, enable ? 0 : HDMI2P0_EN);
 }
 
@@ -274,12 +283,15 @@ static void mtk_hdmi_hw_aud_unmute(struct mtk_hdmi *hdmi)
 
 static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
 {
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG1C,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg1c,
 			   HDMI_RST, HDMI_RST);
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG1C,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg1c,
 			   HDMI_RST, 0);
 	mtk_hdmi_clear_bits(hdmi, GRL_CFG3, CFG3_CONTROL_PACKET_DELAY);
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG1C,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg1c,
 			   ANLG_ON, ANLG_ON);
 }
 
@@ -362,16 +374,19 @@ static void mtk_hdmi_hw_send_aud_packet(struct mtk_hdmi *hdmi, bool enable)
 
 static void mtk_hdmi_hw_config_sys(struct mtk_hdmi *hdmi)
 {
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg20,
 			   HDMI_OUT_FIFO_EN | MHL_MODE_ON, 0);
 	usleep_range(2000, 4000);
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg20,
 			   HDMI_OUT_FIFO_EN | MHL_MODE_ON, HDMI_OUT_FIFO_EN);
 }
 
 static void mtk_hdmi_hw_set_deep_color_mode(struct mtk_hdmi *hdmi)
 {
-	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
+	regmap_update_bits(hdmi->sys_regmap,
+			   hdmi->sys_offset + hdmi->data->sys_cfg20,
 			   DEEP_COLOR_MODE_MASK | DEEP_COLOR_EN,
 			   COLOR_8BIT_MODE);
 }
@@ -1733,6 +1748,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hdmi->dev = dev;
+	hdmi->conf = of_device_get_match_data(dev);
 
 	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev);
 	if (ret)
@@ -1813,8 +1829,15 @@ static int mtk_hdmi_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
 			 mtk_hdmi_suspend, mtk_hdmi_resume);
 
+
+static struct mtk_hdmi_data mt8173_hdmi_driver_data = {
+	.sys_cfg1c = HDMI_SYS_CFG1C,
+	.sys_cfg20 = HDMI_SYS_CFG20,
+};
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
-	{ .compatible = "mediatek,mt8173-hdmi", },
+	{ .compatible = "mediatek,mt8173-hdmi",
+	  .data = &mt8173_hdmi_driver_data },
 	{}
 };
 
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
