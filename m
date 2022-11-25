Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749DEC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 09:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JypvWOdNIEwz4ySGYXhZj/2FoIW7K0jRr/E327f+FUM=; b=mfmeBq+MW631ZgCXg//PHu/RWO
	xsXxlWk8iilOwYO9NhF+wV5vH8Q+UpVUW9kKkG2dLTd43dsAyAbAUF5AgYBIwcag7NCD1g2oPsXDr
	rKIxjCcBuKVLaD3pyeM/1p3Le1fAbSbrGhS17pjX8nyQRaQ8oayQjDACUT6YGm/k24yb6c5CxXQfO
	eCBpheSKErHrv2DRj09FZJ9EK8ZqTnggLbbv19Cs+E1+TrTox57qvReneKmF8oKwvHT2XxYgkzpxD
	vOf00O2lsbttD4uckcVbQ+nJbtWHtyW1cyvf44zfEOm2+ly8yFJUWcEVRvVq8JWpfYIbkQsS04DOi
	hmnhjsxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVPm-00F95m-MW; Fri, 25 Nov 2022 09:54:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVGX-00F3U5-AF; Fri, 25 Nov 2022 09:45:03 +0000
X-UUID: 105d4ba2d80b4432aa6540b51604d8b2-20221125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JypvWOdNIEwz4ySGYXhZj/2FoIW7K0jRr/E327f+FUM=;
	b=gfzpOjLywtPVCJsbZSnPvfHNTndgTWxnbMctwJlUDjrFBFvXwy9rRtnoJ/9FtrkOPLqZZtw5HvA6yIICYgoKppIXodZ7KdCd4Y2zilkYzIS2GWckPR78+13ot9RtSDU2f3ndaJnrSz8uCcFGXR1peua/3jSGCEizapkABWB9d5w=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e68054e1-694b-4ce7-a8ee-444093d86a06,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.14,REQID:e68054e1-694b-4ce7-a8ee-444093d86a06,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:dcaaed0,CLOUDID:7d184ff9-3a34-4838-abcf-dfedf9dd068e,B
	ulkID:221125174421V9P0XGPU,BulkQuantity:2,Recheck:0,SF:38|28|16|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 105d4ba2d80b4432aa6540b51604d8b2-20221125
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1037168119; Fri, 25 Nov 2022 02:44:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 25 Nov 2022 17:44:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 25 Nov 2022 17:44:18 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <andrzej.hajda@intel.com>,
	<neil.armstrong@linaro.org>, <robert.foss@linaro.org>,
	<Laurent.pinchart@ideasonboard.com>, <kuninori.morimoto.gx@renesas.com>,
	<angelogioacchino.delregno@collabora.com>, <nfraprado@collabora.com>
CC: <chunxu.li@mediatek.com>, <ajye_huang@compal.corp-partner.google.com>,
	<allen-kh.cheng@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>
Subject: [PATCH v2 3/3] drm/bridge: it6505: Add audio support
Date: Fri, 25 Nov 2022 17:44:13 +0800
Message-ID: <20221125094413.4940-4-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_014501_513570_03217FF6 
X-CRM114-Status: GOOD (  16.03  )
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

Add audio support for it6505

1. Bridge to hdmi-codec to support audio feature. At the same time,
   the function of automatically detecting audio is removed.
2. It is observed that some DP-to-HDMI dongles will get into bad
   states if sending InfoFrame without audio data. Defer to enable
   it6505's audio feature when PCM triggers START or RESUME.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 81 ++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index dfe4351c9bdd..1f1f37b3df83 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2159,7 +2159,6 @@ static void it6505_stop_link_train(struct it6505 *it6505)
 
 static void it6505_link_train_ok(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
 
 	it6505->link_state = LINK_OK;
 	/* disalbe mute enable avi info frame */
@@ -2167,11 +2166,6 @@ static void it6505_link_train_ok(struct it6505 *it6505)
 	it6505_set_bits(it6505, REG_INFOFRAME_CTRL,
 			EN_VID_CTRL_PKT, EN_VID_CTRL_PKT);
 
-	if (it6505_audio_input(it6505)) {
-		DRM_DEV_DEBUG_DRIVER(dev, "Enable audio!");
-		it6505_enable_audio(it6505);
-	}
-
 	if (it6505->hdcp_desired)
 		it6505_start_hdcp(it6505);
 }
@@ -2823,6 +2817,45 @@ static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
 		it6505_disable_audio(it6505);
 }
 
+static int it6505_audio_hw_params(struct device *dev, void *data,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	return it6505_audio_setup_hw_params(it6505, params);
+}
+
+static int it6505_audio_setup_trigger(struct it6505 *it6505, int cmd)
+{
+	struct device *dev = &it6505->client->dev;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "event: %d", cmd);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		queue_delayed_work(system_wq, &it6505->delayed_audio,
+				   msecs_to_jiffies(180));
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		cancel_delayed_work(&it6505->delayed_audio);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int it6505_audio_trigger(struct device *dev, int cmd)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	return it6505_audio_setup_trigger(it6505, cmd);
+}
+
 static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
 						       void *data,
 						       hdmi_codec_plugged_cb fn,
@@ -2837,6 +2870,36 @@ static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
 	return 0;
 }
 
+static const struct hdmi_codec_ops it6505_audio_codec_ops = {
+	.hw_params = it6505_audio_hw_params,
+	.trigger = it6505_audio_trigger,
+	.audio_shutdown = it6505_audio_shutdown,
+	.hook_plugged_cb = it6505_audio_hook_plugged_cb,
+};
+
+static int it6505_register_audio_driver(struct device *dev)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &it6505_audio_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+		.data = it6505,
+	};
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
+	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
+
+	return 0;
+}
+
 static inline struct it6505 *bridge_to_it6505(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct it6505, bridge);
@@ -3302,6 +3365,12 @@ static int it6505_i2c_probe(struct i2c_client *client,
 		return err;
 	}
 
+	err = it6505_register_audio_driver(dev);
+	if (err < 0) {
+		DRM_DEV_ERROR(dev, "Failed to register audio driver: %d", err);
+		return err;
+	}
+
 	INIT_WORK(&it6505->link_works, it6505_link_training_work);
 	INIT_WORK(&it6505->hdcp_wait_ksv_list, it6505_hdcp_wait_ksv_list);
 	INIT_DELAYED_WORK(&it6505->hdcp_work, it6505_hdcp_work);
-- 
2.18.0


