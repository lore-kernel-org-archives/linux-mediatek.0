Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211AC60A2614
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 00:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v0kq/JfQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aYRqy107E/bZcHZ0ONbHKq/GiUxqgqad82WyhbncTdM=; b=v0kq/JfQMaopMee1jP+RjkrvSf
	a8jsd0qrgn5OTbxRqYWFVJEUB7BUuq6hRgGCAp6uMIfXUnMKHVp2sdP6Tbs622hPW45UbZqfnYmfk
	6ZpEKEV1L/otf+ldbhJTYolP9f1ughFEkB7JgmssbKiMY4rphY7Re1+LC1w6N2kuhLPcqudr6XaNP
	llON5Xxhnq0YxEFv0i5H8TAvmGwLPzXL567Z1kS7UO782HNvYBTsT3oWBZcDlDkk8/OXyXDI8x7i/
	L0j/DbeaW03lx5l8qqYlTrMpfiSynTN6yFq0Fi98Dn93OtW0k53jauF/n6Z/IE3N9yJbF64l7dj01
	S4k+MtnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC8v-0000000DidC-3aZS;
	Fri, 20 Nov 2026 00:06:17 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC8s-0000000Dibd-2nQU;
	Fri, 20 Nov 2026 00:06:16 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC8n-000000002Ef-2EHM;
	Fri, 20 Nov 2026 00:06:10 +0000
Date: Fri, 20 Nov 2026 00:06:00 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v9 13/14] drm/bridge: it6505: Add audio support
Message-ID: <9fa6e149442b5f7294814762b858ecabc3db4d38.1795132452.git.daniel@makrotopia.org>
References: <cover.1795132452.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795132452.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_160614_859314_EAF8077D 
X-CRM114-Status: GOOD (  23.25  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jiaxin Yu <jiaxin.yu@mediatek.com>

Add audio support for it6505 by bridging to the hdmi-codec: register
an "hdmi-audio-codec" platform device from probe and wire up the
previously unused audio helpers via hdmi_codec_ops. This unblocks the
mt8186-mt6366 sound card which references it6505 as the I2S3 codec.

Audio starts out muted and is only enabled once the stream is
unmuted, since some DP-to-HDMI dongles get into a bad state if the
InfoFrame is sent without audio data. Enable/disable can race between
the FIFO-error IRQ, the delayed enable work, the hdmi-codec ops and
the HPD-low path, so the register sequences, the mute state and the
cached stream parameters are serialised with a new audio_lock mutex.
it6505_poweron() and it6505_poweroff() change it6505->powered under
the same lock, poweron holding it across the logic reset and init
sequence: the codec ops and the delayed work check the flag before
writing registers, and the mute and shutdown ops run from ALSA, where
a work cancel cannot reach them. plugged_cb/codec_dev updates take
mode_lock, the lock it6505_detect() holds when calling back into the
codec.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Link: https://lore.kernel.org/all/20230730180803.22570-4-jiaxin.yu@mediatek.com/
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 168 ++++++++++++++++++++++------
 1 file changed, 136 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 2da58d94127c3..eedc46eaf974b 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -407,6 +407,7 @@ struct it6505_audio_data {
 	u8 i2s_data_delay;
 	u8 i2s_ws_channel;
 	u8 i2s_data_sequence;
+	bool mute;
 };
 
 struct it6505_audio_sample_rate_map {
@@ -441,6 +442,7 @@ struct it6505 {
 	struct mutex aux_lock; /* used to aux data transfers */
 	struct mutex aux_reg_lock; /* protects aux_registered */
 	bool aux_registered;
+	struct mutex audio_lock; /* audio enable/disable vs. power on/off */
 	struct regmap *regmap;
 	struct drm_display_mode source_output_mode;
 	struct drm_display_mode video_info;
@@ -479,6 +481,7 @@ struct it6505 {
 	bool enable_enhanced_frame;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
+	struct platform_device *audio_pdev;
 	struct delayed_work delayed_audio;
 	struct it6505_audio_data audio;
 	struct dentry *debugfs;
@@ -1601,7 +1604,7 @@ static void it6505_enable_audio_infoframe(struct it6505 *it6505)
 			EN_AUD_CTRL_PKT);
 }
 
-static void it6505_disable_audio(struct it6505 *it6505)
+static void __it6505_disable_audio(struct it6505 *it6505)
 {
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_AUD_MUTE, EN_AUD_MUTE);
 	it6505_set_bits(it6505, REG_AUDIO_SRC_CTRL, M_AUDIO_I2S_EN, 0x00);
@@ -1609,12 +1612,20 @@ static void it6505_disable_audio(struct it6505 *it6505)
 	it6505_set_bits(it6505, REG_RESET_CTRL, AUDIO_RESET, AUDIO_RESET);
 }
 
-static void it6505_enable_audio(struct it6505 *it6505)
+static void it6505_disable_audio(struct it6505 *it6505)
+{
+	mutex_lock(&it6505->audio_lock);
+	__it6505_disable_audio(it6505);
+	mutex_unlock(&it6505->audio_lock);
+}
+
+static void __it6505_enable_audio(struct it6505 *it6505)
 {
 	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
-	it6505_disable_audio(it6505);
+
+	__it6505_disable_audio(it6505);
 
 	it6505_setup_audio_channel_status(it6505);
 	it6505_setup_audio_format(it6505);
@@ -2326,19 +2337,12 @@ static void it6505_stop_link_train(struct it6505 *it6505)
 
 static void it6505_link_train_ok(struct it6505 *it6505)
 {
-	struct device *dev = it6505->dev;
-
 	it6505->link_state = LINK_OK;
 	/* disalbe mute enable avi info frame */
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_VID_MUTE, 0x00);
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
@@ -2630,8 +2634,10 @@ static void it6505_irq_audio_fifo_error(struct it6505 *it6505)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "audio fifo error Interrupt");
 
-	if (it6505_audio_input(it6505))
-		it6505_enable_audio(it6505);
+	mutex_lock(&it6505->audio_lock);
+	if (!it6505->audio.mute && it6505_audio_input(it6505))
+		__it6505_enable_audio(it6505);
+	mutex_unlock(&it6505->audio_lock);
 }
 
 static void it6505_irq_link_train_fail(struct it6505 *it6505)
@@ -2785,11 +2791,13 @@ static int it6505_poweron(struct it6505 *it6505)
 		usleep_range(25000, 35000);
 	}
 
+	mutex_lock(&it6505->audio_lock);
 	it6505->powered = true;
 	it6505_reset_logic(it6505);
 	it6505_int_mask_enable(it6505);
 	it6505_init(it6505);
 	it6505_lane_off(it6505);
+	mutex_unlock(&it6505->audio_lock);
 
 	enable_irq(it6505->irq);
 
@@ -2814,6 +2822,8 @@ static int it6505_poweroff(struct it6505 *it6505)
 	cancel_work_sync(&it6505->hdcp_wait_ksv_list);
 	cancel_delayed_work_sync(&it6505->hdcp_work);
 
+	mutex_lock(&it6505->audio_lock);
+
 	if (pdata->gpiod_reset)
 		gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
 
@@ -2833,6 +2843,7 @@ static int it6505_poweroff(struct it6505 *it6505)
 
 	it6505->powered = false;
 	it6505->sink_count = 0;
+	mutex_unlock(&it6505->audio_lock);
 
 	return 0;
 }
@@ -2979,25 +2990,28 @@ static void it6505_remove_notifier_module(struct it6505 *it6505)
 	flush_work(&it6505->extcon_wq);
 }
 
-static void __maybe_unused it6505_delayed_audio(struct work_struct *work)
+static void it6505_delayed_audio(struct work_struct *work)
 {
 	struct it6505 *it6505 = container_of(work, struct it6505,
 					     delayed_audio.work);
 
 	DRM_DEV_DEBUG_DRIVER(it6505->dev, "start");
 
-	if (!it6505->powered)
+	if (it6505->enable_drv_hold)
 		return;
 
-	if (!it6505->enable_drv_hold)
-		it6505_enable_audio(it6505);
+	mutex_lock(&it6505->audio_lock);
+	if (it6505->powered && !it6505->audio.mute)
+		__it6505_enable_audio(it6505);
+	mutex_unlock(&it6505->audio_lock);
 }
 
-static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
-						       struct hdmi_codec_params
-						       *params)
+static int it6505_audio_setup_hw_params(struct it6505 *it6505,
+					struct hdmi_codec_params
+					*params)
 {
 	struct device *dev = it6505->dev;
+	u8 word_length;
 	int i = 0;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "%s %d Hz, %d bit, %d channels\n", __func__,
@@ -3013,8 +3027,6 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
 		return -EINVAL;
 	}
 
-	it6505->audio.channel_count = params->cea.channels;
-
 	while (i < ARRAY_SIZE(audio_sample_rate_map) &&
 	       params->sample_rate !=
 		       audio_sample_rate_map[i].sample_rate_value) {
@@ -3025,21 +3037,20 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
 				     params->sample_rate);
 		return -EINVAL;
 	}
-	it6505->audio.sample_rate = audio_sample_rate_map[i].rate;
 
 	switch (params->sample_width) {
 	case 16:
-		it6505->audio.word_length = WORD_LENGTH_16BIT;
+		word_length = WORD_LENGTH_16BIT;
 		break;
 	case 18:
-		it6505->audio.word_length = WORD_LENGTH_18BIT;
+		word_length = WORD_LENGTH_18BIT;
 		break;
 	case 20:
-		it6505->audio.word_length = WORD_LENGTH_20BIT;
+		word_length = WORD_LENGTH_20BIT;
 		break;
 	case 24:
 	case 32:
-		it6505->audio.word_length = WORD_LENGTH_24BIT;
+		word_length = WORD_LENGTH_24BIT;
 		break;
 	default:
 		DRM_DEV_DEBUG_DRIVER(dev, "wordlength: %d bit not support",
@@ -3047,27 +3058,111 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
 		return -EINVAL;
 	}
 
+	mutex_lock(&it6505->audio_lock);
+	it6505->audio.channel_count = params->cea.channels;
+	it6505->audio.sample_rate = audio_sample_rate_map[i].rate;
+	it6505->audio.word_length = word_length;
+	mutex_unlock(&it6505->audio_lock);
+
 	return 0;
 }
 
-static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
+static void it6505_audio_shutdown(struct device *dev, void *data)
 {
 	struct it6505 *it6505 = dev_get_drvdata(dev);
 
+	mutex_lock(&it6505->audio_lock);
+	it6505->audio.mute = true;
 	if (it6505->powered)
-		it6505_disable_audio(it6505);
+		__it6505_disable_audio(it6505);
+	mutex_unlock(&it6505->audio_lock);
+	cancel_delayed_work_sync(&it6505->delayed_audio);
+}
+
+static int it6505_audio_hw_params(struct device *dev, void *data,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	return it6505_audio_setup_hw_params(it6505, params);
+}
+
+static int it6505_audio_mute(struct device *dev, void *data,
+			     bool enable, int direction)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "mute: %d", enable);
+
+	/*
+	 * Delay enabling audio until the stream is unmuted; InfoFrames
+	 * without audio data upset some DP-to-HDMI dongles.
+	 */
+	if (enable) {
+		mutex_lock(&it6505->audio_lock);
+		it6505->audio.mute = true;
+		if (it6505->powered)
+			__it6505_disable_audio(it6505);
+		mutex_unlock(&it6505->audio_lock);
+		cancel_delayed_work_sync(&it6505->delayed_audio);
+	} else {
+		mutex_lock(&it6505->audio_lock);
+		it6505->audio.mute = false;
+		mutex_unlock(&it6505->audio_lock);
+		queue_delayed_work(system_wq, &it6505->delayed_audio,
+				   msecs_to_jiffies(180));
+	}
+
+	return 0;
 }
 
-static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
-						       void *data,
-						       hdmi_codec_plugged_cb fn,
-						       struct device *codec_dev)
+static int it6505_audio_hook_plugged_cb(struct device *dev,
+					void *data,
+					hdmi_codec_plugged_cb fn,
+					struct device *codec_dev)
 {
 	struct it6505 *it6505 = data;
 
+	mutex_lock(&it6505->mode_lock);
 	it6505->plugged_cb = fn;
 	it6505->codec_dev = codec_dev;
 	it6505_plugged_status_to_codec(it6505);
+	mutex_unlock(&it6505->mode_lock);
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops it6505_audio_codec_ops = {
+	.hw_params = it6505_audio_hw_params,
+	.mute_stream = it6505_audio_mute,
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
+		.no_capture_mute = 1,
+		.data = it6505,
+	};
+	struct platform_device *pdev;
+
+	it6505->audio.mute = true;
+	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	it6505->audio_pdev = pdev;
+	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
 
 	return 0;
 }
@@ -3606,6 +3701,7 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	mutex_init(&it6505->mode_lock);
 	mutex_init(&it6505->aux_lock);
 	mutex_init(&it6505->aux_reg_lock);
+	mutex_init(&it6505->audio_lock);
 
 	it6505->bridge.of_node = client->dev.of_node;
 	it6505->connector_status = connector_status_disconnected;
@@ -3654,6 +3750,12 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	err = it6505_register_audio_driver(dev);
+	if (err < 0) {
+		dev_err(dev, "Failed to register audio driver: %d\n", err);
+		return err;
+	}
+
 	INIT_WORK(&it6505->link_works, it6505_link_training_work);
 	INIT_WORK(&it6505->hdcp_wait_ksv_list, it6505_hdcp_wait_ksv_list);
 	INIT_DELAYED_WORK(&it6505->hdcp_work, it6505_hdcp_work);
@@ -3696,6 +3798,8 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	cancel_work_sync(&it6505->hdcp_wait_ksv_list);
 	cancel_delayed_work_sync(&it6505->hdcp_work);
 	cancel_work_sync(&it6505->extcon_wq);
+	platform_device_unregister(it6505->audio_pdev);
+	cancel_delayed_work_sync(&it6505->delayed_audio);
 	if (it6505->extcon_state)
 		pm_runtime_put_sync(&client->dev);
 	pm_runtime_disable(&client->dev);
-- 
2.56.1


