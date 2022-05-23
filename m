Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727F3C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 12:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVO7DZ6Q8eCuIaZn+obbcEZVStlID5Bk6A51JvZdGsA=; b=GLohlnLtHU2jNX
	doPxcpKr9ZQgho3hQRg1prvwAV3RpWxXJBTHE754ktKC8kHwPWS1xTaoxSyW5Fzm+QsQKdWX3kVxL
	abxCFHEnMzSNDsgS6M43gjSBfR6OKCe6Vgp0EAzU5p9zSEvRfU3zKl7i0McTPA/OL3Y/s4fceGNOX
	3vP7KxPVrTc30KnpzzTOWfAQaCsi53eS+fi26ouK3KDKow+5DLwjrOpHVo+exz7rgJgj7cFTfND5a
	WSjy766Dt8kiMR2SbQwm4Q6VC95yc4a0EmCfZUca+MOmCoP++drYyo90RlqW573fn1Z9S1305ArIG
	gmHwa8JCzhQ3W4xu48Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6xL-0042Ga-DL; Mon, 23 May 2022 12:14:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt6Qz-003nAx-7T
 for linux-mediatek@bombadil.infradead.org; Mon, 23 May 2022 11:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=TQgiy1XDkMEG62oOfcg26Pc/4FzYdvAn//3gC4/v5Zk=; b=WJVo6Jz2s6/7M0Fz88sARrF2FK
 wPylo8r0TO34JpS6rWMp5vvykMutcHrIzbuGWRd/Jjwo+qjU4WM/0Nppi8XYTSsESMauvXKjIFwlv
 DEMdxBDxd2eAegG0Y+KvWSZPN50+ErDyb2EUtRf3GDR9yi1yQXE0MveXhOLAH3yB2sDNfvDGQuLBf
 IcxjFz5+s6CyZ9mFNPDAFmp234WlDFcE98ylzqAREy32C0Mn1mXJRBxpXdnXQPRT4/WPSKCnshR3N
 eDwtpD34K0EIOSB6d64/9Un1+G4Ne9DgTIFo7lbCz009tZv+TQG+XKy2ZuR0LMG8sKO0a4xpmpT7Y
 Qz8Nwu7A==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5fX-0011bU-MC
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:52:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 bd25-20020a05600c1f1900b0039485220e16so7432566wmb.0
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 03:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQgiy1XDkMEG62oOfcg26Pc/4FzYdvAn//3gC4/v5Zk=;
 b=LcJeSLll7b7XkxZOi6oFcPOcwisKrRD0mKGyBx9w1MSB6d6m5DWVFg+LaA0SincQow
 oyzfkP5EDVmZk0dtwla8VMOpO/tosI75OjowyRXVkOZe2MeBMDjxq+Zk8snOoEMjWg0Q
 e/QfpCSe2NvmjVZXesEBnQOJdrlPMpVDEmKuOkM9TfsNGHZ2CgnhA3FbJ3K0Pa3REJ2n
 81sj5lHqvQ5iY3Jfe+4/6ff/SKGA7PY7FYnWMhhhZtZdS34UfthIjH4/hzLfy1Q/ZU1e
 TCTrXbKnVX1w/mcNDiB5mUgtpVDdBmNv20D1GoAsmV79HnLBHL06Bd4v926F+IGgF5TR
 jNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQgiy1XDkMEG62oOfcg26Pc/4FzYdvAn//3gC4/v5Zk=;
 b=PKZkL4cctB37BM81XpxEmq278dQPZe1ELEvP5WuMKGl87f0UFGA6oVqzRR+LeyTPmQ
 lpwkibL5rB7gYkUyyf0iCmsFRsyWhy/jLcajMB98YPsFd6am3RQgaE6+vqlfHT/tyZa6
 ctxu4G3GDagFObuYjqkuQQNC0RBnSuu81XDCullV25SMA1arDbzJI91cfYH/VPxTCeSi
 D2ray7t1LgZ4+DR5ocqUVvQMusfWXWE5xn0FpL1N5bXG0BhB8CWjqNNJJmqH6Wk98LIq
 LcZYZzx9mc4zzjQr4WiSoVDfHg3x8VUfVw3LdI6bYyR0N7QsXliwaK74iDcakLeFWXRN
 Fn9w==
X-Gm-Message-State: AOAM533/naQ7Tme5gtqkgfKOmguWuxAmkZBVCevgThuWGzVrmUdyDVbK
 Wmybszl4gm0Jq0erpWKTpeHKwg==
X-Google-Smtp-Source: ABdhPJzczxM2TesbfgdsrX4MxRcH1xman2Bx9FG8eZM/Ao5Fw16Apten6hubxh/MzctCsyR7U2x5rA==
X-Received: by 2002:a05:600c:6015:b0:397:54e1:8279 with SMTP id
 az21-20020a05600c601500b0039754e18279mr1177859wmb.100.1653303129870; 
 Mon, 23 May 2022 03:52:09 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:52:09 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v10 19/21] drm/mediatek: Add mt8195 External DisplayPort
 support
Date: Mon, 23 May 2022 12:47:52 +0200
Message-Id: <20220523104758.29531-20-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_115211_970793_A2183EBC 
X-CRM114-Status: GOOD (  17.52  )
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
 drivers/gpu/drm/mediatek/mtk_dp.c | 104 +++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 8eb17ae82bfd..4789853ec5ff 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -164,6 +164,11 @@ static struct regmap_config mtk_dp_regmap_config = {
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
@@ -1054,26 +1059,49 @@ static int mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 	if (!cal_data->ln_tx_impsel_pmos)
 		return -ENOMEM;
 
-	cal_data->glb_bias_trim =
-		check_cal_data_valid(mtk_dp, 1, 0x1e, (buf[3] >> 27) & 0x1f, 0xf);
-	cal_data->clktx_impse =
-		check_cal_data_valid(mtk_dp, 1, 0xe, (buf[0] >> 9) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[0] =
-		check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 28) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[0] =
-		check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 24) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[1] =
-		check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 20) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[1] =
-		check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 16) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[2] =
-		check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 12) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[2] =
-		check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 8) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[3] =
-		check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 4) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[3] =
-		check_cal_data_valid(mtk_dp, 1, 0xe, buf[2] & 0xf, 0x8);
+	if (mtk_dp_is_edp(mtk_dp)) {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(mtk_dp, 1, 0x1e, (buf[3] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[0] >> 9) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[0] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 28) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[0] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 24) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[1] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 20) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[1] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 16) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[2] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 12) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[2] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 8) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[3] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[2] >> 4) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[3] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, buf[2] & 0xf, 0x8);
+	} else {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(mtk_dp, 1, 0x1e, (buf[0] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[0] >> 13) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[0] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[1] >> 28) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[0] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[1] >> 24) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[1] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[1] >> 20) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[1] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[1] >> 16) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[2] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[1] >> 12) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[2] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[1] >> 8) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[3] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, (buf[1] >> 4) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[3] =
+			check_cal_data_valid(mtk_dp, 1, 0xe, buf[1] & 0xf, 0x8);
+	}
 
 	kfree(buf);
 
@@ -1224,7 +1252,10 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
 			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
 
-	mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	else
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
 }
 
 static int mtk_dp_power_enable(struct mtk_dp *mtk_dp)
@@ -2066,6 +2097,24 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	return ret;
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
+	if (mtk_dp_plug_state(mtk_dp)) {
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
@@ -2422,6 +2471,7 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.atomic_disable = mtk_dp_bridge_atomic_disable,
 	.mode_valid = mtk_dp_bridge_mode_valid,
 	.get_edid = mtk_dp_get_edid,
+	.detect = mtk_dp_bdg_detect,
 };
 
 static int mtk_dp_probe(struct platform_device *pdev)
@@ -2443,7 +2493,11 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 
 	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
-	if (IS_ERR(mtk_dp->next_bridge)) {
+	if (IS_ERR(mtk_dp->next_bridge) && PTR_ERR(mtk_dp->next_bridge) == -ENODEV) {
+		dev_info(dev,
+			 "No panel connected in devicetree, continuing as external DP\n");
+		mtk_dp->next_bridge = NULL;
+	} else if (IS_ERR(mtk_dp->next_bridge)) {
 		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge), "Failed to get bridge\n");
 	}
 
@@ -2488,7 +2542,10 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->bridge.ops =
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 	drm_bridge_add(&mtk_dp->bridge);
-	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	else
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
@@ -2550,6 +2607,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
 static const struct of_device_id mtk_dp_of_match[] = {
 	{ .compatible = "mediatek,mt8195-edp-tx" },
+	{ .compatible = "mediatek,mt8195-dp-tx" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
