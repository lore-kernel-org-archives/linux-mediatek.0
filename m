Return-Path: <SRS0=Uacl=32=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21232C35254
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 03:19:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED0120674
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 03:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u+1vTXpg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="naFzHNYg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CED0120674
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tRsvFA2LkBw9mkNOPAzp04B4n4ZdW+ZkOGg0ANY86c=; b=u+1vTXpgT7GVy4
	V6+lQreQgzJzQPTNPSvRHYGH3tI7Q9T4J1N7h6Obpuiw6KYYiM5pOEMUqQx1FCVU6M+gys4nRiWki
	UibXwXLuHJYMA079TqtI9Zg3Z5/zov8recARdEuyJgYd9OyIrEwcsj77I4d2bvLpF42FBfEPiogDQ
	HXQLK8PT8VMBSEG9KS7XxAGedf0q2Ozkrf0ntnys+OeaY1PcMO9UQSXnPW7DDO469IMKAGF2M8FZA
	4d0xsXNskoSHVkGtucFtpwiwa+qAUuTdoRobJINwaU3Sl81HlZJVkCE/viIS1jkCppNA7b5flDVvN
	XDvlnjqA3achYUhJ4EQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izXgu-0004ST-6k; Thu, 06 Feb 2020 03:18:56 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izXgN-0003ts-S5
 for linux-mediatek@lists.infradead.org; Thu, 06 Feb 2020 03:18:25 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id g15so2836114qvq.20
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Feb 2020 19:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=GKdSBpWKS5JubKvYHooQ1tsJLs+L1G4clF+7s5FbyHw=;
 b=naFzHNYgTkl6FjZpBOkCA2X/QrskO3Nyj3+Up6Q4sv70fhZlsQ9OfLbIfk1r0c13f4
 eZ7iIngf+0/feqrVf4l2k8moJ1SVAXQLPEgJmjMmLuiAAM62o0X1gRX7fFP7t6Mr4H36
 0+tUG3s5KDIURJ7Z1Rk1MINTJQ76nBZiKGmkjah2srKyBHJuv9h4O7MfxPvMBZK1fY6M
 wiMDH4EIJkavj55219XnSvbSenUmn+5oNJblgUzaI2YDjn6mPonp1jk3SsKy5ukJVDVO
 t+iWto0HpgeelkmDD2dNdvWDV9C80RAhjpVNvaLx92zuCH5OS92Vsn3t90c9w2TAruRG
 +bSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GKdSBpWKS5JubKvYHooQ1tsJLs+L1G4clF+7s5FbyHw=;
 b=TR6Lh1uVVonKM7czFHFqjwl+gRGz2KXPx3QLEnN+yeS4Wcv0w1KuE0Wg+Pl8VsjPWO
 mNNCVP3qYq9RWc7NUOa5fFexO45AgkX6h9u2Y+RPA9kBUbb+GeF8BxkSIC/D09HvKBck
 /fD/y/3sKHdyS3wqWTncVEQc3R1IAeCh4plull+ql74SNx5bGEvEPcSwsA3mX2tyYs/y
 GcYUvhb5CtGe3l/EIw8vVCOwInPjp1xebIhXFW2+2CEyH8dVg0kbebTxF0cvuqIGN6kE
 K4UaDe+bqADzdcHGXkw2a4QahfQW7uUgh1Jfv3HrgnhyxnfYB5Wp5YOiq7pxw07oK40s
 Bt0w==
X-Gm-Message-State: APjAAAXQm1VWafxLSySe4ppLtqSUvivjrWaluCkG1/VfZoJOjXcooB9q
 S4pY66L3QPNERHNhZspdrANPuolflP1M
X-Google-Smtp-Source: APXvYqyJ0n0UFWdJRGiNBcfGeJ9XTuOgIvFLDSVvgEpiQSthosjpQX4dk4r4oRet+K8HdyV3vkafiTKoFhUX
X-Received: by 2002:a0c:ffc4:: with SMTP id h4mr662384qvv.233.1580959101083;
 Wed, 05 Feb 2020 19:18:21 -0800 (PST)
Date: Thu,  6 Feb 2020 11:17:51 +0800
In-Reply-To: <20200206031752.193298-1-tzungbi@google.com>
Message-Id: <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
Mime-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 2/3] drm/mediatek: support HDMI jack status reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_191823_942504_0834DC57 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1.
Provides a callback (i.e. mtk_hdmi_audio_hook_plugged_cb) to hdmi-codec.
When ASoC machine driver calls hdmi_codec_set_jack_detect(), the
callback will be invoked to save plugged_cb and codec_dev parameters.

+---------+  set_jack_  +------------+ plugged_cb  +----------+
| machine | ----------> | hdmi-codec | ----------> | mtk-hdmi |
+---------+  detect()   +------------+ codec_dev   +----------+

2.
When there is any jack status changes, mtk-hdmi will call the
plugged_cb() to notify hdmi-codec.  And then hdmi-codec will call
snd_soc_jack_report().

+----------+ plugged_cb  +------------+
| mtk-hdmi | ----------> | hdmi-codec | -> snd_soc_jack_report()
+----------+ codec_dev   +------------+
             connector_status

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 34 ++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 23c2b0e8693d..fccdd975947d 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -169,6 +169,8 @@ struct mtk_hdmi {
 	bool audio_enable;
 	bool powered;
 	bool enabled;
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
 };
 
 static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
@@ -1194,13 +1196,23 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
 	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
 }
 
+static enum drm_connector_status
+mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
+{
+	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
+
+	if (hdmi->plugged_cb && hdmi->codec_dev)
+		hdmi->plugged_cb(hdmi->codec_dev, connected);
+
+	return connected ?
+	       connector_status_connected : connector_status_disconnected;
+}
+
 static enum drm_connector_status hdmi_conn_detect(struct drm_connector *conn,
 						  bool force)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
-
-	return mtk_cec_hpd_high(hdmi->cec_dev) ?
-	       connector_status_connected : connector_status_disconnected;
+	return mtk_hdmi_update_plugged_status(hdmi);
 }
 
 static void hdmi_conn_destroy(struct drm_connector *conn)
@@ -1648,20 +1660,36 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	return 0;
 }
 
+static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
+					  hdmi_codec_plugged_cb fn,
+					  struct device *codec_dev)
+{
+	struct mtk_hdmi *hdmi = data;
+
+	hdmi->plugged_cb = fn;
+	hdmi->codec_dev = codec_dev;
+	mtk_hdmi_update_plugged_status(hdmi);
+
+	return 0;
+}
+
 static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.hw_params = mtk_hdmi_audio_hw_params,
 	.audio_startup = mtk_hdmi_audio_startup,
 	.audio_shutdown = mtk_hdmi_audio_shutdown,
 	.digital_mute = mtk_hdmi_audio_digital_mute,
 	.get_eld = mtk_hdmi_audio_get_eld,
+	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
 };
 
 static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &mtk_hdmi_audio_codec_ops,
 		.max_i2s_channels = 2,
 		.i2s = 1,
+		.data = hdmi,
 	};
 	struct platform_device *pdev;
 
-- 
2.25.0.341.g760bfbb309-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
