Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09EFC00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 10:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+q43qVpUc6ztg3qE3VdjDtb5E2XwrfsxGkeoMZC/Lfs=; b=XSNs5WE3USZ11zp+cHRkkupUUO
	viJ9DRfoPwX6Re4xlBbS1wS8Y3FcFkB008Rz2lTVgPce32SFNuKkl2D1spr0TUqCBtAcm0/XBkDz+
	AJUxzeOB4NlyKC8Qy3dZ/G8rcFle843lCNjKi3Ndr92LCC9KR/hyMHiMMTCW485KZsJImXkXZGslf
	ACbu8tH6Hfg3OCfEh0Vfpm0Sli9sXdPgvSRFrg45HF6PCGAqoHyj+oSRueUa6MntFc9TjQGimlQoH
	ZReTSBR9LCRTojDntmanXiiVAqN6rtlk4lqHFc6eH1FJb/2XgRlOl8aok33/P6cGI9F/Vqca7Kd7X
	/oU9dSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJuXE-00E4rB-Ea; Fri, 05 Aug 2022 10:26:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJuWW-00E4Sw-8M; Fri, 05 Aug 2022 10:25:47 +0000
X-UUID: 614824f795ae44fbbabc567698f16744-20220805
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:19cdd8df-382b-4cfb-b7a5-aee4f546a628,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:4bb007ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 614824f795ae44fbbabc567698f16744-20220805
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1351152699; Fri, 05 Aug 2022 03:25:35 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 18:15:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Aug 2022 18:15:00 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
	<deller@gmx.de>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v16 4/8] drm/mediatek: Add MT8195 External DisplayPort support
Date: Fri, 5 Aug 2022 18:14:55 +0800
Message-ID: <20220805101459.3386-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_032544_379228_02538007 
X-CRM114-Status: GOOD (  20.17  )
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

From: Guillaume Ranquet <granquet@baylibre.com>

This patch adds External DisplayPort support to the mt8195 eDP driver.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 190 +++++++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |   4 +
 2 files changed, 158 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 59fee814075b..00971ea2fadf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -77,6 +77,7 @@ struct mtk_dp {
 	struct dp_cal_data cal_data;
 	u8 max_lanes;
 	u8 max_linkrate;
+	const struct mtk_dp_data *data;
 
 	struct drm_device *drm_dev;
 	struct drm_bridge bridge;
@@ -96,6 +97,12 @@ struct mtk_dp {
 	struct drm_connector *conn;
 };
 
+struct mtk_dp_data {
+	int bridge_type;
+	unsigned int smp_cmd;
+	unsigned int cali_data_fmt;
+};
+
 static struct regmap_config mtk_dp_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -347,6 +354,14 @@ static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
 	return mtk_dp->train_info.cable_plugged_in;
 }
 
+static bool mtk_dp_plug_state_avoid_pulse(struct mtk_dp *mtk_dp)
+{
+	bool ret;
+
+	return !(readx_poll_timeout(mtk_dp_plug_state, mtk_dp, ret, ret,
+				    4000, 7 * 4000));
+}
+
 static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
@@ -784,35 +799,73 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 		return;
 	}
 
-	cal_data->glb_bias_trim =
-		check_cal_data_valid(mtk_dp, 1, 0x1e,
-				     (buf[3] >> 27) & 0x1f, 0xf);
-	cal_data->clktx_impse =
-		check_cal_data_valid(mtk_dp, 1, 0xe,
-				     (buf[0] >> 9) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[0] =
-		check_cal_data_valid(mtk_dp, 1, 0xe,
-				     (buf[2] >> 28) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[0] =
-		check_cal_data_valid(mtk_dp, 1, 0xe,
-				     (buf[2] >> 24) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[1] =
-		check_cal_data_valid(mtk_dp, 1, 0xe,
-				     (buf[2] >> 20) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[1] =
-		check_cal_data_valid(mtk_dp, 1, 0xe,
-				     (buf[2] >> 16) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[2] =
-		check_cal_data_valid(mtk_dp, 1, 0xe,
-				     (buf[2] >> 12) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[2] =
-		check_cal_data_valid(mtk_dp, 1, 0xe,
-				     (buf[2] >> 8) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[3] =
-		check_cal_data_valid(mtk_dp, 1, 0xe,
-				     (buf[2] >> 4) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[3] =
-		check_cal_data_valid(mtk_dp, 1, 0xe, buf[2] & 0xf, 0x8);
+	/*
+	 * To save the efuse bits, we place the calibration data for DP and eDP
+	 * using method which could save the efuse bits. For this, the efuse
+	 * orders of DP and eDP are different.
+	 */
+
+	if (mtk_dp->data->cali_data_fmt == MTK_DP_CALI_DATA_FMT_MT8195_EDP) {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(mtk_dp, 1, 0x1e,
+					     (buf[3] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[0] >> 9) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[0] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[2] >> 28) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[0] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[2] >> 24) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[1] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[2] >> 20) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[1] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[2] >> 16) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[2] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[2] >> 12) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[2] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[2] >> 8) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[3] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[2] >> 4) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[3] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, buf[2] & 0xf, 0x8);
+	} else {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(mtk_dp, 1, 0x1e,
+					     (buf[0] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[0] >> 13) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[0] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[1] >> 28) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[0] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[1] >> 24) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[1] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[1] >> 20) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[1] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[1] >> 16) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[2] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[1] >> 12) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[2] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[1] >> 8) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[3] =
+			check_cal_data_valid(mtk_dp, 1, 0xe,
+					     (buf[1] >> 4) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[3] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, buf[1] & 0xf, 0x8);
+	}
 
 	kfree(buf);
 }
@@ -932,7 +985,7 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
 			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
 
-	mtk_dp_sip_atf_call(mtk_dp, MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	mtk_dp_sip_atf_call(mtk_dp, mtk_dp->data->smp_cmd, enable);
 }
 
 static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
@@ -1232,6 +1285,9 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
 	usleep_range(2000, 5000);
 
+	if (!mtk_dp_plug_state(mtk_dp))
+		return -ENODEV;
+
 	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
 
 	train_info->link_rate = min_t(int, mtk_dp->max_linkrate,
@@ -1283,6 +1339,9 @@ static int mtk_dp_train_start(struct mtk_dp *mtk_dp)
 	u8 train_limit;
 	u8 max_link_rate;
 
+	if (!mtk_dp_plug_state_avoid_pulse(mtk_dp))
+		return -ENODEV;
+
 	link_rate = mtk_dp->rx_cap[1];
 	lane_count = mtk_dp->rx_cap[2] & 0x1F;
 
@@ -1457,9 +1516,20 @@ static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
 	else
 		train_info->cable_plugged_in = false;
 
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-			   DP_PWR_STATE_BANDGAP_TPLL_LANE,
-			   DP_PWR_STATE_MASK);
+	if (!train_info->cable_plugged_in) {
+		mtk_dp_video_mute(mtk_dp, true);
+
+		mtk_dp_initialize_priv_data(mtk_dp);
+		mtk_dp_set_idle_pattern(mtk_dp, true);
+
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+				   DP_PWR_STATE_BANDGAP_TPLL,
+				   DP_PWR_STATE_MASK);
+	} else {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+				   DP_PWR_STATE_MASK);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1503,6 +1573,21 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	return 0;
 }
 
+static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	enum drm_connector_status ret = connector_status_disconnected;
+	u8 sink_count = 0;
+
+	if (mtk_dp_plug_state_avoid_pulse(mtk_dp)) {
+		drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
+		if (DP_GET_SINK_COUNT(sink_count))
+			ret = connector_status_connected;
+	}
+
+	return ret;
+}
+
 static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 				    struct drm_connector *connector)
 {
@@ -1857,6 +1942,7 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.atomic_disable = mtk_dp_bridge_atomic_disable,
 	.mode_valid = mtk_dp_bridge_mode_valid,
 	.get_edid = mtk_dp_get_edid,
+	.detect = mtk_dp_bdg_detect,
 };
 
 static int mtk_dp_probe(struct platform_device *pdev)
@@ -1871,6 +1957,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mtk_dp->dev = dev;
+	mtk_dp->data = (struct mtk_dp_data *)of_device_get_match_data(dev);
 
 	irq_num = platform_get_irq(pdev, 0);
 	if (irq_num < 0)
@@ -1878,9 +1965,15 @@ static int mtk_dp_probe(struct platform_device *pdev)
 				     "failed to request dp irq resource\n");
 
 	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
-	if (IS_ERR(mtk_dp->next_bridge))
+	if (IS_ERR(mtk_dp->next_bridge) &&
+	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV) {
+		dev_info(dev,
+			 "No panel connected in devicetree, continue as external DP\n");
+		mtk_dp->next_bridge = NULL;
+	} else if (IS_ERR(mtk_dp->next_bridge)) {
 		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
 				     "Failed to get bridge\n");
+	}
 
 	ret = mtk_dp_dt_parse(mtk_dp, pdev);
 	if (ret)
@@ -1923,7 +2016,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.ops =
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
-	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
 	drm_bridge_add(&mtk_dp->bridge);
 
@@ -1950,6 +2043,12 @@ static int mtk_dp_suspend(struct device *dev)
 {
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
 
+	if (mtk_dp_plug_state(mtk_dp)) {
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
+		/* Ensure the sink is off before shutting down power */
+		usleep_range(2000, 3000);
+	}
+
 	mtk_dp_power_disable(mtk_dp);
 
 	mtk_dp_hwirq_enable(mtk_dp, false);
@@ -1981,8 +2080,27 @@ static int mtk_dp_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
+static const struct mtk_dp_data mt8195_edp_data = {
+	.bridge_type = DRM_MODE_CONNECTOR_eDP,
+	.smp_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
+	.cali_data_fmt = MTK_DP_CALI_DATA_FMT_MT8195_EDP,
+};
+
+static const struct mtk_dp_data mt8195_dp_data = {
+	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
+	.smp_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
+	.cali_data_fmt = MTK_DP_CALI_DATA_FMT_MT8195_DP,
+};
+
 static const struct of_device_id mtk_dp_of_match[] = {
-	{ .compatible = "mediatek,mt8195-edp-tx" },
+	{
+		.compatible = "mediatek,mt8195-edp-tx",
+		.data = &mt8195_edp_data,
+	},
+	{
+		.compatible = "mediatek,mt8195-dp-tx",
+		.data = &mt8195_dp_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 3676d71bd816..c12742adaa3c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -14,6 +14,10 @@
 #define SEC_OFFSET	0x4000
 
 #define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
+#define MTK_DP_SIP_ATF_VIDEO_UNMUTE	BIT(5)
+
+#define MTK_DP_CALI_DATA_FMT_MT8195_EDP	0
+#define MTK_DP_CALI_DATA_FMT_MT8195_DP	1
 
 #define DP_PHY_GLB_BIAS_GEN_00		0
 #define RG_XTP_GLB_BIAS_INTR_CTRL	GENMASK(20, 16)
-- 
2.18.0


