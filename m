Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6B1C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+25dg1dQx6UhRH67ABa7e7Wl4FIZTGZV43jlrhD2G0=; b=TIK15bG0w4zH2C
	Wfx0i2wp8ynlcSsV2nZqnYPTvIGQAN/Ada4FHaozfdMlHMn4BppFhH8nZgmGrDcjpELACfzYWcE4g
	iTa7DbUnMIJPR6CqXcQRsRcB4dXY4ykn6ncYV1RdY1yzuFYwPprh0FTG2rUQy17zAUsMO1SrJLECh
	YvU3boh1PZAZl7UpKWc4gFPftHYK6NlBk1E7nLkK8i3+0o+6KMAYoxQPVZEAlrXUO4FRDseELly54
	nv3Gf32BLaEGMI0eEVlfE3feApr1N4qVcI9u5b8cifxGh2LWSNh7UeYqYcbNCUmlZUlt9+cFnIZOa
	sqy33SrK7gUgN+CZJZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myEtU-00Api3-AL; Fri, 17 Dec 2021 15:11:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myErW-00AohA-PA
 for linux-mediatek@lists.infradead.org; Fri, 17 Dec 2021 15:09:41 +0000
Received: by mail-wr1-x436.google.com with SMTP id s1so4681576wrg.1
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Dec 2021 07:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KyUN6E8qUmReiqQY1FT8fQDaFbqmWwGXJe5qEAY70jQ=;
 b=K/MGP2xsclZBpeUNmmwVhlNMJMWnloZ+j9jqvMDqLv5G2R84p8K/w3EX7kJRSzhxjk
 5/1ceuxfG+sCg048+PlNQSI8WpPG55aPVHP4tveKPrXYl3Fy4aICmTN5nfYv5fnX6Xdr
 HpEuDWKPQUbULqHW+Qc3DR0kbQjsU4vER/zBHWUEzmRXE66mmA3Naa1xwrMVBIsjLv41
 gZxBDc9U7b2vT2eNwijvllmLAqiJyWhKNK+kfELxqO98XHqpbPUX+Jr24WweCzuHR9PP
 SfEB+HeX2M7Y57ejckVSppJ0/Qng1/hBYawTg2b8BkY49/Syd58aIea2DTVWtoyQs8/K
 cXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyUN6E8qUmReiqQY1FT8fQDaFbqmWwGXJe5qEAY70jQ=;
 b=VIsG0B5552W8rGsj3b2LWkzmYplpK3ZWRvRD4eb5Xk4uv//T8xSJ8dhLLpUftMQ9L7
 PsdJQhdUWCwJ1Kw71iSSveEQI2ETRhyNRFbYIdir9ejtUUgMGXuWxlTxgn9VwIoEFjDj
 znITlkvxkmX3AUQ49XlwqMayi3srx80RA7DCB71eomnUD4wBtQEoIBojSTXy/klxNzJA
 yXjSL0ATSEQP5EC7DiFw6jotpMLRvH0zKT9ed2BMbCoj9c0ZU8G6bssHnYTWs0K1AJGQ
 zEOcwbfZZRPpNkL0dsQlnJkoKj3URITTcRt0NAFDm3Ey1mHId0i9KMxPefwBLfxYslmY
 9RQw==
X-Gm-Message-State: AOAM5333sgehdphg+KhOYbLVjPhQmDQwsre5mz9J7bK3SepKgCxIow+x
 K/N6tVv8eTqQmZyMiKa7JI0v7A==
X-Google-Smtp-Source: ABdhPJx6XLRFsU6ZGuvuPBKBJJ4/O2TOahGBNVwvg3cI532ukCaPRvC49dHF78Pflf+1YhJyugmUGg==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr2939240wri.297.1639753773296; 
 Fri, 17 Dec 2021 07:09:33 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6441-43a4-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6441:43a4:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id g18sm12655132wmq.4.2021.12.17.07.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:09:32 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 8/8] drm/mediatek: Add mt8195 eDP support
Date: Fri, 17 Dec 2021 16:08:54 +0100
Message-Id: <20211217150854.2081-9-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217150854.2081-1-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_070934_922582_73E166AF 
X-CRM114-Status: GOOD (  15.79  )
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

This adds support of eDP panel to the mt8195 DP driver.

This driver is based on an initial version by
Jason-JH.Lin <jason-jh.lin@mediatek.com>.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 102 +++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 41e95a0bcaa2c..a256d55346a23 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -228,6 +228,11 @@ static struct regmap_config mtk_dp_regmap_config = {
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
@@ -1185,26 +1190,49 @@ static int mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 		return PTR_ERR(buf);
 	}
 
-	cal_data->glb_bias_trim =
-		check_cal_data_valid(1, 0x1e, (buf[0] >> 27) & 0x1f, 0xf);
-	cal_data->clktx_impse =
-		check_cal_data_valid(1, 0xe, (buf[0] >> 13) & 0xf, 0x8);
-	cal_data->ln0_tx_impsel_pmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 28) & 0xf, 0x8);
-	cal_data->ln0_tx_impsel_nmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 24) & 0xf, 0x8);
-	cal_data->ln1_tx_impsel_pmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 20) & 0xf, 0x8);
-	cal_data->ln1_tx_impsel_nmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 16) & 0xf, 0x8);
-	cal_data->ln2_tx_impsel_pmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 12) & 0xf, 0x8);
-	cal_data->ln2_tx_impsel_nmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 8) & 0xf, 0x8);
-	cal_data->ln3_tx_impsel_pmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 4) & 0xf, 0x8);
-	cal_data->ln3_tx_impsel_nmos =
-		check_cal_data_valid(1, 0xe, buf[1] & 0xf, 0x8);
+	if (mtk_dp_is_edp(mtk_dp)) {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(1, 0x1e, (buf[3] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(1, 0xe, (buf[0] >> 9) & 0xf, 0x8);
+		cal_data->ln0_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 28) & 0xf, 0x8);
+		cal_data->ln0_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 24) & 0xf, 0x8);
+		cal_data->ln1_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 20) & 0xf, 0x8);
+		cal_data->ln1_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 16) & 0xf, 0x8);
+		cal_data->ln2_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 12) & 0xf, 0x8);
+		cal_data->ln2_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 8) & 0xf, 0x8);
+		cal_data->ln3_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 4) & 0xf, 0x8);
+		cal_data->ln3_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, buf[2] & 0xf, 0x8);
+	} else {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(1, 0x1e, (buf[0] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(1, 0xe, (buf[0] >> 13) & 0xf, 0x8);
+		cal_data->ln0_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 28) & 0xf, 0x8);
+		cal_data->ln0_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 24) & 0xf, 0x8);
+		cal_data->ln1_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 20) & 0xf, 0x8);
+		cal_data->ln1_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 16) & 0xf, 0x8);
+		cal_data->ln2_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 12) & 0xf, 0x8);
+		cal_data->ln2_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 8) & 0xf, 0x8);
+		cal_data->ln3_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 4) & 0xf, 0x8);
+		cal_data->ln3_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, buf[1] & 0xf, 0x8);
+	}
 
 	kfree(buf);
 
@@ -1322,7 +1350,11 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, val,
 			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
 			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
-	mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
+
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	else
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
 }
 
 static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
@@ -2326,6 +2358,9 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	enum drm_connector_status ret = connector_status_disconnected;
 	u8 sink_count = 0;
 
+	if (mtk_dp_is_edp(mtk_dp))
+		return connector_status_connected;
+
 	if (mtk_dp_plug_state(mtk_dp)) {
 		drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
 		if (DP_GET_SINK_COUNT(sink_count))
@@ -2888,7 +2923,11 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	}
 
 	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
-	if (IS_ERR(mtk_dp->next_bridge)) {
+	if (IS_ERR(mtk_dp->next_bridge) && PTR_ERR(mtk_dp->next_bridge) == -ENODEV) {
+		dev_info(dev,
+			 "No panel connected in devicetree, continuing as external DP\n");
+		mtk_dp->next_bridge = NULL;
+	} else if (IS_ERR(mtk_dp->next_bridge)) {
 		ret = PTR_ERR(mtk_dp->next_bridge);
 		dev_err_probe(dev, ret, "Failed to get bridge\n");
 		return ret;
@@ -2915,12 +2954,14 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mtk_dp);
 
-	mutex_init(&mtk_dp->update_plugged_status_lock);
-	ret = mtk_dp_register_audio_driver(dev);
-	if (ret) {
-		dev_err(dev, "Failed to register audio driver: %d\n",
-			ret);
-		return ret;
+	if (!mtk_dp_is_edp(mtk_dp)) {
+		mutex_init(&mtk_dp->update_plugged_status_lock);
+		ret = mtk_dp_register_audio_driver(dev);
+		if (ret) {
+			dev_err(dev, "Failed to register audio driver: %d\n",
+				ret);
+			return ret;
+		}
 	}
 
 	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
@@ -2944,7 +2985,10 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
 	mtk_dp->bridge.of_node = dev->of_node;
-	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	else
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 	mtk_dp->bridge.ops =
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
