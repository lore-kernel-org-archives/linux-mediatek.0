Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C59C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 08:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45sqOkvPX/vI8Dg286fBzQ3jGzHwgGyuY3EtZ83QTso=; b=xRIw03WB0VBI3QhUW8oVCzdQ8v
	Nmy0JhaW9NPLrepRvsUW/DkVQ3nJM/OV6RRAuKo0IwJDGmFNAYEQ+b1dc0EbJc5h5i4HFVuyiHCLd
	d3ymqGzrLiZtYlnwTtqVJxWT/0IO+aF4z4JvBAsWbcWwtkpivqv9GMDXIUktEp/clWdkV6yDDdixh
	gT+dmM2zHUX2L+WQFhrkKcRzdJxbZBESYwwM6h+AVWoa+j0iMTkOJN42zwYv4jaIZfBqn0UbVq2I8
	6Vafcaoro6dZ/5IZ6spU1xU1c4TMfTbRtfb2avjDTTF9rIN/WqjiLIRVy1Guu5mc6Epb+FU1asPlb
	stBPVVFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5jo6-00GfaJ-I6; Mon, 27 Jun 2022 08:09:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5jl3-00GdVh-IY; Mon, 27 Jun 2022 08:06:14 +0000
X-UUID: bdbe05b052fb48079a5988c0756423f4-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:fe42d7cf-8f04-4db0-8c44-81e3cf3eeae2,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:e44999ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: bdbe05b052fb48079a5988c0756423f4-20220627
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1709988925; Mon, 27 Jun 2022 01:06:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jun 2022 01:03:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 27 Jun 2022 16:03:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 27 Jun 2022 16:03:44 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
	<deller@gmx.de>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v12 06/10] drm/mediatek: Add MT8195 External DisplayPort support
Date: Mon, 27 Jun 2022 16:03:37 +0800
Message-ID: <20220627080341.5087-7-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_010609_696051_00179B12 
X-CRM114-Status: GOOD (  20.00  )
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
[Bo-Chen: Move some dp features here and modify for reviewers' comments.]
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 217 ++++++++++++++++++++++++------
 1 file changed, 174 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 9e9b516409e2..1697c61462b7 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -111,6 +111,7 @@ struct mtk_dp {
 	struct regmap *regs;
 
 	bool enabled;
+	bool has_fec;
 
 	struct drm_connector *conn;
 };
@@ -123,6 +124,11 @@ static struct regmap_config mtk_dp_regmap_config = {
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
@@ -401,6 +407,20 @@ static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
 		  HPD_DB_DP_TRANS_P0_MASK);
 }
 
+static bool mtk_dp_plug_state_avoid_pulse(struct mtk_dp *mtk_dp)
+{
+	int wait;
+
+	for (wait = 7; !mtk_dp_plug_state(mtk_dp) && wait > 0; --wait)
+		/* Avoid short pulses on the HPD isr */
+		usleep_range(1000, 5000);
+
+	if (wait == 0)
+		return false;
+
+	return true;
+}
+
 static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
@@ -625,6 +645,13 @@ static void mtk_dp_reset_swing_pre_emphasis(struct mtk_dp *mtk_dp)
 			   DP_TX3_PRE_EMPH_MASK);
 }
 
+static void mtk_dp_fec_enable(struct mtk_dp *mtk_dp, bool enable)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3540,
+			   enable ? BIT(FEC_EN_DP_TRANS_P0_SHIFT) : 0,
+			   FEC_EN_DP_TRANS_P0_MASK);
+}
+
 static u32 mtk_dp_swirq_get_clear(struct mtk_dp *mtk_dp)
 {
 	u32 irq_status = mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_35D0) &
@@ -851,35 +878,67 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
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
@@ -1000,7 +1059,10 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
 			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
 
-	mtk_dp_sip_atf_call(mtk_dp, MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	mtk_dp_sip_atf_call(mtk_dp,
+			    mtk_dp_is_edp(mtk_dp) ?
+			    MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE :
+			    MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
 }
 
 static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
@@ -1048,6 +1110,8 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 	mtk_dp->info.depth = DP_MSA_MISC_8_BPC;
 	memset(&mtk_dp->info.timings, 0, sizeof(struct mtk_dp_timings));
 	mtk_dp->info.timings.frame_rate = 60;
+
+	mtk_dp->has_fec = false;
 }
 
 static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
@@ -1370,6 +1434,9 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
 	usleep_range(2000, 5000);
 
+	if (!mtk_dp_plug_state(mtk_dp))
+		return -ENODEV;
+
 	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
 
 	train_info->link_rate = min_t(int, mtk_dp->max_linkrate,
@@ -1410,6 +1477,9 @@ static int mtk_dp_train_start(struct mtk_dp *mtk_dp)
 	u8 train_limit;
 	u8 max_link_rate;
 
+	if (!mtk_dp_plug_state_avoid_pulse(mtk_dp))
+		return -ENODEV;
+
 	link_rate = mtk_dp->rx_cap[1];
 	lane_count = mtk_dp->rx_cap[2] & 0x1F;
 
@@ -1550,21 +1620,46 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
 static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 {
 	struct mtk_dp *mtk_dp = dev;
+	int event;
 	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
 
+	event = mtk_dp_plug_state(mtk_dp) ?
+		connector_status_connected : connector_status_disconnected;
+
+	if (event < 0)
+		return IRQ_HANDLED;
+
+	dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
+	drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
+
 	if (mtk_dp->train_info.cable_state_change) {
 		mtk_dp->train_info.cable_state_change = false;
 
-		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
-				   DP_PWR_STATE_MASK);
-		drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
-		mtk_dp->train_info.link_rate =
-			min_t(int, mtk_dp->max_linkrate,
-			      buf[mtk_dp->max_linkrate]);
-		mtk_dp->train_info.lane_count =
-			min_t(int, mtk_dp->max_lanes,
-			      drm_dp_max_lane_count(buf));
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING;
+
+		if (!mtk_dp->train_info.cable_plugged_in) {
+			mtk_dp_video_mute(mtk_dp, true);
+
+			mtk_dp_initialize_priv_data(mtk_dp);
+			mtk_dp_set_idle_pattern(mtk_dp, true);
+			if (mtk_dp->has_fec)
+				mtk_dp_fec_enable(mtk_dp, false);
+
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL,
+					   DP_PWR_STATE_MASK);
+		} else {
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+					   DP_PWR_STATE_MASK);
+			drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
+			mtk_dp->train_info.link_rate =
+				min_t(int, mtk_dp->max_linkrate,
+				      buf[mtk_dp->max_linkrate]);
+			mtk_dp->train_info.lane_count =
+				min_t(int, mtk_dp->max_lanes,
+				      drm_dp_max_lane_count(buf));
+		}
 	}
 
 	if (mtk_dp->train_info.irq_sta.hpd_inerrupt) {
@@ -1692,6 +1787,24 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
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
@@ -1705,7 +1818,8 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
 	usleep_range(2000, 5000);
 
-	new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
+	if (mtk_dp_plug_state(mtk_dp))
+		new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
 
 	if (!enabled)
 		drm_bridge_chain_post_disable(bridge);
@@ -2058,6 +2172,7 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.atomic_disable = mtk_dp_bridge_atomic_disable,
 	.mode_valid = mtk_dp_bridge_mode_valid,
 	.get_edid = mtk_dp_get_edid,
+	.detect = mtk_dp_bdg_detect,
 };
 
 static int mtk_dp_probe(struct platform_device *pdev)
@@ -2079,9 +2194,15 @@ static int mtk_dp_probe(struct platform_device *pdev)
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
@@ -2124,7 +2245,10 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.ops =
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
-	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	else
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 	drm_bridge_add(&mtk_dp->bridge);
 
@@ -2151,6 +2275,12 @@ static int mtk_dp_suspend(struct device *dev)
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
@@ -2178,6 +2308,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
 static const struct of_device_id mtk_dp_of_match[] = {
 	{ .compatible = "mediatek,mt8195-edp-tx" },
+	{ .compatible = "mediatek,mt8195-dp-tx" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
-- 
2.18.0


