Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8EFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Os/tQBI2KoA8q5MN0dBnixsBdpA/fM6SDynFSVD7Y+k=; b=vOGW1u4HjLExx0
	07lDbfVyX9B1QcpyE366pYQ+vJvmr5F6ebtQODtU+xl22/japrcyrHsSET1V17mBfzVGxvb0AYF5c
	u3fZB/zhIPil89mP1cxV1owF37U3142OhqYFViujYr4ncKhLJJdtL4iswBL+09DI4kLd22cYLhkE5
	CevM6Xzx2HFMbWtNFXJbvGAnX59HZ2QWUZ8z2nFzMGPf6/AY9ZYlZj+aAFFXsn5eLUj18jIrRN3G7
	PDHd2s14R1WMvs5QNPiU3/uDEAimRdm1ZtL5d2P6/1f4qYluT+w38lofIDdYMfWwmx+hvaA8GBmTy
	B4v8/cUOVGy/O5BACOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnim-002nOE-5I; Fri, 25 Mar 2022 17:27:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnZ1-002hwg-50
 for linux-mediatek@lists.infradead.org; Fri, 25 Mar 2022 17:17:32 +0000
Received: by mail-wr1-x42d.google.com with SMTP id a1so11745733wrh.10
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Mar 2022 10:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1r+8YHC25uUdNTWvopzfWRR5AavC+HM2GX3p8dlgu40=;
 b=k5Doi7YHnMrR3zELn7Lub8WOIULCVMFCubtCEnH4gr+DyTZf3v9aKZQ8Eq40FawAJJ
 C1mbBGhLl2mEJwuy1sU34BQlvu7ZlgGe9db7Qaz9tAHENSWnxRzmh/HnAUoAPzr5BAhl
 KUvbHud7etKqmmdEnvJPbExk3pbcD32JGdy1g2ya4HaMiVzfBlIwscH4l3pt+3fwXtvF
 0AonvUc9uAfJSGB60bVjIdmVVtIUXQspkI62sgKOVi7gtJLez3pmBapiX/5UZsulDAUN
 yjd69WDZR5Th5uvaFHMIwtIYGK6F9vWNphaBkBQzcP8wV2FGPwPpWPZOEYGJqLWUPg9/
 up8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1r+8YHC25uUdNTWvopzfWRR5AavC+HM2GX3p8dlgu40=;
 b=MOCpRerJniJ0UgteCN7qxyF8BL5vV8uMFhxZVkPgEzXJdEgujbRoYnT/u+ccXo74xn
 QqpxsrBSkfkTzCI4FvVeiVAJqA5CMsPrI6zcLV0St6gFzN4ziHXBjaQkdSpKbKzFquiU
 rnGSbe6Rv/dBd1nCi2XrdCVz91X4KfyNPBKm/2yOmO98w0a0QT6X/MqZea9tTZ85Xoyr
 u5xr3PHO0yXj5D7Q6pEE5KHa1YD7rS+ctDNLiq4kAVG75JWGCbQqC+6pZXe2zIe/97Jq
 ApnYz4NHQjfV/K4MGn8T0Ha6A4HA6tubUUF74aDHEbjmbAT8RyiQYRraHQrKIDkw7xdb
 ZbFw==
X-Gm-Message-State: AOAM531uPKQejVFYBpXtl0XwO2RtUZRNtUUT4URKHCH7e9bVzA4YdZy5
 MupOpEii92Tn4EX3Rfe0rpmPnA==
X-Google-Smtp-Source: ABdhPJxVflncep9rQIXAa/lSrZkVzdvDaXJuBMdjZTfnf2mLHGXTyJ3gsICSm3FmldGmtSCyiIj2Cg==
X-Received: by 2002:a5d:4149:0:b0:203:e064:2571 with SMTP id
 c9-20020a5d4149000000b00203e0642571mr10120064wrq.62.1648228645872; 
 Fri, 25 Mar 2022 10:17:25 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:17:25 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org, markyacoub@google.com
Subject: [PATCH 19/22] drm/mediatek: Add mt8195 External DisplayPort support
Date: Fri, 25 Mar 2022 18:15:08 +0100
Message-Id: <20220325171511.23493-20-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_101727_390605_B46C844A 
X-CRM114-Status: GOOD (  18.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds External DisplayPort support to the mt8195 eDP driver.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 301 +++++++++++++++++++++++++++---
 1 file changed, 278 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index e8d918e92e31..d9606c743a9e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -176,6 +176,11 @@ struct mtk_dp {
 	struct drm_connector *conn;
 };
 
+static bool mtk_dp_is_edp(struct mtk_dp *mtk_dp)
+{
+	return mtk_dp->next_bridge;
+}
+
 static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
 {
 	return container_of(b, struct mtk_dp, bridge);
@@ -742,6 +747,47 @@ static int mtk_dp_fec_enable(struct mtk_dp *mtk_dp, bool enable)
 			   FEC_EN_DP_TRANS_P0_MASK);
 }
 
+static u32 mtk_dp_swirq_get_clear(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	u32 irq_status = mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_35D0) &
+			 SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK;
+
+	if (irq_status) {
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_35C8, irq_status,
+				    SW_IRQ_CLR_DP_TRANS_P0_MASK, ret, out);
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_35C8, 0,
+				    SW_IRQ_CLR_DP_TRANS_P0_MASK, ret, out);
+	}
+
+	return irq_status;
+
+out:
+	return ret;
+}
+
+static u32 mtk_dp_hwirq_get_clear(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	u8 irq_status = (mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3418) &
+			 IRQ_STATUS_DP_TRANS_P0_MASK) >>
+			IRQ_STATUS_DP_TRANS_P0_SHIFT;
+
+	if (irq_status) {
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_3418, irq_status,
+				    IRQ_CLR_DP_TRANS_P0_MASK, ret, out);
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_3418, 0,
+				    IRQ_CLR_DP_TRANS_P0_MASK, ret, out);
+	}
+
+	return irq_status;
+
+out:
+	return ret;
+}
+
 static int mtk_dp_hwirq_enable(struct mtk_dp *mtk_dp, bool enable)
 {
 	u32 val = 0;
@@ -933,26 +979,49 @@ static int mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 		return PTR_ERR(buf);
 	}
 
-	cal_data->glb_bias_trim =
-		check_cal_data_valid(1, 0x1e, (buf[3] >> 27) & 0x1f, 0xf);
-	cal_data->clktx_impse =
-		check_cal_data_valid(1, 0xe, (buf[0] >> 9) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[0] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 28) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[0] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 24) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[1] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 20) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[1] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 16) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[2] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 12) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[2] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 8) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[3] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 4) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[3] =
-		check_cal_data_valid(1, 0xe, buf[2] & 0xf, 0x8);
+	if (mtk_dp_is_edp(mtk_dp)) {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(1, 0x1e, (buf[3] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(1, 0xe, (buf[0] >> 9) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[0] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 28) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[0] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 24) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[1] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 20) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[1] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 16) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[2] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 12) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[2] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 8) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[3] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 4) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[3] =
+			check_cal_data_valid(1, 0xe, buf[2] & 0xf, 0x8);
+	} else {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(1, 0x1e, (buf[0] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(1, 0xe, (buf[0] >> 13) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[0] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 28) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[0] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 24) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[1] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 20) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[1] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 16) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[2] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 12) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[2] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 8) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[3] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 4) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[3] =
+			check_cal_data_valid(1, 0xe, buf[1] & 0xf, 0x8);
+	}
 
 	kfree(buf);
 
@@ -1081,7 +1150,10 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
 			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
 
-	mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	else
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
 }
 
 static int mtk_dp_power_enable(struct mtk_dp *mtk_dp)
@@ -1196,6 +1268,57 @@ static void mtk_dp_set_tx_out(struct mtk_dp *mtk_dp)
 	mtk_dp_setup_tu(mtk_dp);
 }
 
+static void mtk_dp_edid_free(struct mtk_dp *mtk_dp)
+{
+	mutex_lock(&mtk_dp->edid_lock);
+	kfree(mtk_dp->edid);
+	mtk_dp->edid = NULL;
+	mutex_unlock(&mtk_dp->edid_lock);
+}
+
+static int mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
+{
+	ssize_t ret;
+	u8 sink_count;
+	bool locked;
+	u8 link_status[DP_LINK_STATUS_SIZE] = {};
+	u32 sink_count_reg = DP_SINK_COUNT_ESI;
+	u32 link_status_reg = DP_LANE0_1_STATUS;
+
+	ret = drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg, &sink_count);
+	if (ret < 0) {
+		drm_err(mtk_dp->drm_dev, "Read sink count failed: %ld\n", ret);
+		return ret;
+	}
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg, link_status,
+			       sizeof(link_status));
+	if (!ret) {
+		drm_err(mtk_dp->drm_dev, "Read link status failed: %ld\n",
+			ret);
+		return ret;
+	}
+
+	locked = drm_dp_channel_eq_ok(link_status,
+				      mtk_dp->train_info.lane_count);
+	if (!locked && mtk_dp->train_state > MTK_DP_TRAIN_STATE_TRAINING_PRE)
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
+
+	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
+				   DP_REMOTE_CONTROL_COMMAND_PENDING);
+
+	if (DP_GET_SINK_COUNT(sink_count) &&
+	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
+		mtk_dp_edid_free(mtk_dp);
+		mtk_dp->train_info.check_cap_count = 0;
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKEDID;
+		msleep(20);
+	}
+
+	return 0;
+}
+
 static void mtk_dp_train_update_swing_pre(struct mtk_dp *mtk_dp, int lanes,
 					  u8 dpcd_adjust_req[2])
 {
@@ -1679,6 +1802,115 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
 	mtk_dp_digital_sw_reset(mtk_dp);
 }
 
+static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
+{
+	struct mtk_dp *mtk_dp = dev;
+	int event;
+	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
+
+	event = mtk_dp_plug_state(mtk_dp) ? connector_status_connected :
+						  connector_status_disconnected;
+
+	if (event < 0)
+		return IRQ_HANDLED;
+
+	if (mtk_dp->drm_dev) {
+		dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
+		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
+	}
+
+	if (mtk_dp->train_info.cable_state_change) {
+		mtk_dp->train_info.cable_state_change = false;
+
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
+
+		if (!mtk_dp->train_info.cable_plugged_in ||
+		    !mtk_dp_plug_state(mtk_dp)) {
+			mtk_dp_video_mute(mtk_dp, true);
+
+			mtk_dp_initialize_priv_data(mtk_dp);
+			mtk_dp_set_idle_pattern(mtk_dp, true);
+			if (mtk_dp->has_fec)
+				mtk_dp_fec_enable(mtk_dp, false);
+
+			mtk_dp_edid_free(mtk_dp);
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL,
+					   DP_PWR_STATE_MASK);
+		} else {
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+					   DP_PWR_STATE_MASK);
+			drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
+			mtk_dp->train_info.link_rate =
+				min_t(int, MTK_DP_MAX_LINK_RATE,
+				      buf[DP_MAX_LINK_RATE]);
+			mtk_dp->train_info.lane_count =
+				min_t(int, MTK_DP_MAX_LANES,
+				      drm_dp_max_lane_count(buf));
+		}
+	}
+
+	if (mtk_dp->train_info.irq_status & MTK_DP_HPD_INTERRUPT) {
+		dev_dbg(mtk_dp->dev, "MTK_DP_HPD_INTERRUPT\n");
+		mtk_dp->train_info.irq_status &= ~MTK_DP_HPD_INTERRUPT;
+		mtk_dp_hpd_sink_event(mtk_dp);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
+{
+	bool connected;
+	u16 swirq_status = mtk_dp_swirq_get_clear(mtk_dp);
+	u8 hwirq_status = mtk_dp_hwirq_get_clear(mtk_dp);
+	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
+
+	train_info->irq_status |= hwirq_status | swirq_status;
+
+	if (!train_info->irq_status)
+		return IRQ_HANDLED;
+
+	connected = mtk_dp_plug_state(mtk_dp);
+	if (connected || !train_info->cable_plugged_in)
+		train_info->irq_status &= ~MTK_DP_HPD_DISCONNECT;
+	else if (!connected || train_info->cable_plugged_in)
+		train_info->irq_status &= ~MTK_DP_HPD_CONNECT;
+
+	if (!(train_info->irq_status &
+	      (MTK_DP_HPD_CONNECT | MTK_DP_HPD_DISCONNECT)))
+		return IRQ_HANDLED;
+
+	if (train_info->irq_status & MTK_DP_HPD_CONNECT) {
+		train_info->irq_status &= ~MTK_DP_HPD_CONNECT;
+		train_info->cable_plugged_in = true;
+	} else {
+		train_info->irq_status &= ~MTK_DP_HPD_DISCONNECT;
+		train_info->cable_plugged_in = false;
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
+	}
+	train_info->cable_state_change = true;
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
+{
+	struct mtk_dp *mtk_dp = dev;
+	u32 irq_status;
+
+	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
+
+	if (!irq_status)
+		return IRQ_HANDLED;
+
+	if (irq_status & RGS_IRQ_STATUS_TRANSMITTER)
+		return mtk_dp_hpd_isr_handler(mtk_dp);
+
+	return IRQ_HANDLED;
+}
+
 static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 			   struct platform_device *pdev)
 {
@@ -2112,6 +2344,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	struct mtk_dp *mtk_dp;
 	struct device *dev = &pdev->dev;
 	int ret;
+	int irq_num = 0;
 
 	mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
 	if (!mtk_dp)
@@ -2119,9 +2352,18 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->dev = dev;
 
+	irq_num = platform_get_irq(pdev, 0);
+	if (irq_num < 0)
+		return dev_err_probe(dev, irq_num, "failed to request dp irq resource\n");
+
 	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
-	if (IS_ERR(mtk_dp->next_bridge))
+	if (IS_ERR(mtk_dp->next_bridge) && PTR_ERR(mtk_dp->next_bridge) == -ENODEV) {
+		dev_info(dev,
+			 "No panel connected in devicetree, continuing as external DP\n");
+		mtk_dp->next_bridge = NULL;
+	} else if (IS_ERR(mtk_dp->next_bridge)) {
 		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge), "Failed to get bridge\n");
+	}
 
 	ret = mtk_dp_dt_parse(mtk_dp, pdev);
 	if (ret)
@@ -2131,6 +2373,13 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->aux.name = "aux_mtk_dp";
 	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
 
+	ret = devm_request_threaded_irq(dev, irq_num, mtk_dp_hpd_event,
+					mtk_dp_hpd_event_thread,
+					IRQ_TYPE_LEVEL_HIGH, dev_name(dev),
+					mtk_dp);
+	if (ret)
+		return dev_err_probe(dev, -EPROBE_DEFER, "failed to request mediatek dptx irq\n");
+
 	mutex_init(&mtk_dp->dp_lock);
 	mutex_init(&mtk_dp->edid_lock);
 
@@ -2147,8 +2396,13 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
 
-	mtk_dp->bridge.ops = DRM_BRIDGE_OP_EDID;
+	mtk_dp->bridge.ops =
+		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 	drm_bridge_add(&mtk_dp->bridge);
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	else
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
@@ -2203,6 +2457,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
 static const struct of_device_id mtk_dp_of_match[] = {
 	{ .compatible = "mediatek,mt8195-edp-tx", },
+	{ .compatible = "mediatek,mt8195-dp-tx", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
