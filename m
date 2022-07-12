Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5E3CCA47C
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 11:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LL2QpmlGMi1efnHlM6gihsJsaq/HqbQRleSDccvWXcw=; b=gtlLr0KJBs1+2DLxb3XRxrHFJX
	hvVWmCIeqTu+bng/DtRgmyPOGmz8ZFQmisFLmgPMKb20gKPEb4hTh5JTJfh8lueY0tM8LqlPZl6N4
	84vCglpMkhUY1hc7EoNKUqTC61AMaQ47YgYJBeQgE+qxURc4LOh5z6nClunQrP1Ao32YOWc89plgT
	8q1b/aaFNCJqsiwqju6rqTnmyM0699zsjkuTc6NBBt+yPJpjtD7IDPV10gtWcOHSqOnvlDA9D/Rez
	/lvOswirNm7KmlOqKerZQgaZYVudgPCo+9OT8g2XYn7SILReuIC8DI176fUo/J1GDFmW0gB5D10jO
	5Q4RrYOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDpo-00AK8q-3d; Tue, 12 Jul 2022 11:13:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDpf-00AJzd-Sa; Tue, 12 Jul 2022 11:13:40 +0000
X-UUID: 263ad1e5ef5546258533babbe0a932a2-20220712
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:7103cc39-6429-4b6a-8350-9b4597bec252,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:64bf45d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 263ad1e5ef5546258533babbe0a932a2-20220712
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 139601254; Tue, 12 Jul 2022 04:13:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 12 Jul 2022 19:12:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 12 Jul 2022 19:12:25 +0800
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
Subject: [PATCH v14 06/10] drm/mediatek: Add MT8195 External DisplayPort support
Date: Tue, 12 Jul 2022 19:12:19 +0800
Message-ID: <20220712111223.13080-7-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_041335_961327_291D3F2E 
X-CRM114-Status: GOOD (  20.01  )
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
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 183 +++++++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |   1 +
 2 files changed, 148 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index eb61a8810ea2..610651dd6365 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -115,6 +115,11 @@ static struct regmap_config mtk_dp_regmap_config = {
 	.name = "mtk-dp-registers",
 };
 
+static bool mtk_dp_is_edp(struct mtk_dp *mtk_dp)
+{
+	return mtk_dp->next_bridge;
+}
+
 static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
 {
 	return container_of(b, struct mtk_dp, bridge);
@@ -370,6 +375,14 @@ static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
 		  HPD_DB_DP_TRANS_P0_MASK);
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
@@ -809,35 +822,67 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
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
+	if (mtk_dp_is_edp(mtk_dp)) {
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
@@ -957,7 +1002,10 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
 			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
 
-	mtk_dp_sip_atf_call(mtk_dp, MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	mtk_dp_sip_atf_call(mtk_dp,
+			    mtk_dp_is_edp(mtk_dp) ?
+			    MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE :
+			    MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
 }
 
 static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
@@ -1292,6 +1340,9 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
 	usleep_range(2000, 5000);
 
+	if (!mtk_dp_plug_state(mtk_dp))
+		return -ENODEV;
+
 	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
 
 	train_info->link_rate = min_t(int, mtk_dp->max_linkrate,
@@ -1343,6 +1394,9 @@ static int mtk_dp_train_start(struct mtk_dp *mtk_dp)
 	u8 train_limit;
 	u8 max_link_rate;
 
+	if (!mtk_dp_plug_state_avoid_pulse(mtk_dp))
+		return -ENODEV;
+
 	link_rate = mtk_dp->rx_cap[1];
 	lane_count = mtk_dp->rx_cap[2] & 0x1F;
 
@@ -1489,13 +1543,34 @@ static int mtk_dp_init_port(struct mtk_dp *mtk_dp)
 static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 {
 	struct mtk_dp *mtk_dp = dev;
+	int event;
+
+	event = mtk_dp_plug_state(mtk_dp) ?
+		connector_status_connected : connector_status_disconnected;
+
+	if (event < 0)
+		return IRQ_HANDLED;
+
+	dev_dbg(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
+	drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
 
 	if (mtk_dp->train_info.cable_state_change) {
 		mtk_dp->train_info.cable_state_change = false;
 
-		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
-				   DP_PWR_STATE_MASK);
+		if (!mtk_dp->train_info.cable_plugged_in) {
+			mtk_dp_video_mute(mtk_dp, true);
+
+			mtk_dp_initialize_priv_data(mtk_dp);
+			mtk_dp_set_idle_pattern(mtk_dp, true);
+
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL,
+					   DP_PWR_STATE_MASK);
+		} else {
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+					   DP_PWR_STATE_MASK);
+		}
 	}
 
 	if (mtk_dp->train_info.irq_sta.hpd_inerrupt) {
@@ -1597,6 +1672,24 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	return 0;
 }
 
+static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	enum drm_connector_status ret = connector_status_disconnected;
+	u8 sink_count = 0;
+
+	if (mtk_dp_is_edp(mtk_dp))
+		return connector_status_connected;
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
@@ -1610,7 +1703,8 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
 	usleep_range(2000, 5000);
 
-	new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
+	if (mtk_dp_plug_state(mtk_dp))
+		new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
 
 	if (!enabled)
 		drm_bridge_chain_post_disable(bridge);
@@ -1961,6 +2055,7 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.atomic_disable = mtk_dp_bridge_atomic_disable,
 	.mode_valid = mtk_dp_bridge_mode_valid,
 	.get_edid = mtk_dp_get_edid,
+	.detect = mtk_dp_bdg_detect,
 };
 
 static int mtk_dp_probe(struct platform_device *pdev)
@@ -1982,9 +2077,15 @@ static int mtk_dp_probe(struct platform_device *pdev)
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
@@ -2027,7 +2128,10 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.ops =
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
-	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	else
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 	drm_bridge_add(&mtk_dp->bridge);
 
@@ -2054,6 +2158,12 @@ static int mtk_dp_suspend(struct device *dev)
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
@@ -2087,6 +2197,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
 static const struct of_device_id mtk_dp_of_match[] = {
 	{ .compatible = "mediatek,mt8195-edp-tx" },
+	{ .compatible = "mediatek,mt8195-dp-tx" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index c9d587f1bacd..9b6f2e01391d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -14,6 +14,7 @@
 #define SEC_OFFSET	0x4000
 
 #define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
+#define MTK_DP_SIP_ATF_VIDEO_UNMUTE	BIT(5)
 
 #define DP_PHY_GLB_BIAS_GEN_00		0
 #define RG_XTP_GLB_BIAS_INTR_CTRL	GENMASK(20, 16)
-- 
2.18.0


