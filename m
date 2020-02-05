Return-Path: <SRS0=voLZ=3Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86F9C33CA1
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 09:38:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B57922082E
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 09:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l0GuA62y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ixbOIq8m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B57922082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yKmqh20popG9krdgKFyVi0P8VjokPFTLSQUbX3a9Bo=; b=l0GuA62yD1HzGq
	b+tyrQOfGNxeBfQWfdW4BhO5Rsry/ts+G7z+drQO8Xh9k4Ov5otWyOVJbkcnPC3EW0HIy/kUzbnwj
	pkZyMR9TfbspCnRfQEmU8R6zQy1W/5U06F8VHAxf2jWt9KySH1sRQLyFpQlmzDjZRdGC2Xe/XwgVF
	Cx2HNRfSVOQoJ8JeZiS65qrja0ECe4n7Jl9VaF/plOXctWBkvD7OUHROerz1wyCca1nIrNo6asIUA
	aBIPa/JwiOP7E6dEQlB573Bdk4PKkW1mYR7nJjZLAVLOBJPxTYd21ps2tlR2S6Wl2C+53pcXJJ3J4
	q/F1maZPvtFQrP8ACOEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izH90-0005u3-6f; Wed, 05 Feb 2020 09:38:50 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izH8P-0005FA-Gx
 for linux-mediatek@lists.infradead.org; Wed, 05 Feb 2020 09:38:15 +0000
Received: by mail-qk1-x74a.google.com with SMTP id c206so886113qkg.6
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Feb 2020 01:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=cX29gQ3Pe2nYNSmOPNFjk0KmvqrTptDWTP83/iCAsdA=;
 b=ixbOIq8maNz1diHMn2lwgN76Wks4PKPS2JD5s1qhsxg+f4Lw0HcqZx/CFcJ9zvGF4J
 LdRZO6zI4PrghmZbrzhz9Pbwie595/SdQzw5i15qqaE+duNoGAAqdtlsNeC6JHyhuEIZ
 wY/1FPuOwOsaQX0vF2Mfr2OBuD+Bo41BB4mt/scYJFiZO46DLSj63t3xkl6x4wvV0mlR
 eALP5NYK254rYDixapJgUG0dE8WxxHbbwmH81ICXVqOr03qEWAbgmbb0Vima2BWBTg3c
 tknLYkEmLkGeT7M35AhA0k5pSX9LfGwnO3rPNRi2+iDmLmtm7GOpv+gWKnrTdCr6XaVk
 1Ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cX29gQ3Pe2nYNSmOPNFjk0KmvqrTptDWTP83/iCAsdA=;
 b=sKblO5UtQ2y6pA0nt6Gk8tkFv8e5gyMEkdVWpom46vkc8EhRqRgyWK9JwvUH6N8WC3
 uuv5l12yU1qoyqH+gskRjCrq5M+/VGdvWu90AN9VaHTxN/QF2yy244Y7uV5fHp4RvPDD
 gRivc4aydmYxHburpgqwC9Sa1/XJmplX8ntZICU+IKDKaL12nrozwPsl73zosJBuctFg
 7Zh5BJ70dPpYDOYNZMWMf+DdF+SDka8MA4v2yQZNbxKhKmaliZzzg9w621eqzgsJgFtr
 qa1tyr6lPkjzA8EXSFZ+0Woe0d/FzBsaeMXJFiDyXZrfwdKoMixI+qJ767sAyOA1trxU
 J19g==
X-Gm-Message-State: APjAAAU5AQgiA/drma1aU9w8T/mU79A+JYWvhzJeUKWwY4/EkOOsY38h
 eLgXC8m/hA6or3mGxR/DSruCXwpHStMY
X-Google-Smtp-Source: APXvYqzvqZ+I6q7rsrnsbANQ2Td41uSXPBSKwBl8ZrPWLMClutzjKDkU8rsrWO96kwNDsFR8NBUJJAomYVqM
X-Received: by 2002:a0c:fe0d:: with SMTP id x13mr31660627qvr.88.1580895491114; 
 Wed, 05 Feb 2020 01:38:11 -0800 (PST)
Date: Wed,  5 Feb 2020 17:37:44 +0800
In-Reply-To: <20200205093745.79298-1-tzungbi@google.com>
Message-Id: <20200205170416.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
Mime-Version: 1.0
References: <20200205093745.79298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH 2/3] drm/mediatek: support HDMI jack status reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_013813_573034_6727BB67 
X-CRM114-Status: GOOD (  11.43  )
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
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 41 +++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 23c2b0e8693d..15736ed0a96a 100644
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
@@ -1194,13 +1196,27 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
 	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
 }
 
+static void mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi,
+					   enum drm_connector_status status)
+{
+	if (hdmi->plugged_cb && hdmi->codec_dev)
+		hdmi->plugged_cb(hdmi->codec_dev,
+				 status == connector_status_connected);
+}
+
 static enum drm_connector_status hdmi_conn_detect(struct drm_connector *conn,
 						  bool force)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
+	enum drm_connector_status status;
 
-	return mtk_cec_hpd_high(hdmi->cec_dev) ?
-	       connector_status_connected : connector_status_disconnected;
+	if (mtk_cec_hpd_high(hdmi->cec_dev))
+		status = connector_status_connected;
+	else
+		status = connector_status_disconnected;
+
+	mtk_hdmi_update_plugged_status(hdmi, status);
+	return status;
 }
 
 static void hdmi_conn_destroy(struct drm_connector *conn)
@@ -1648,20 +1664,41 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
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
+
+	if (mtk_cec_hpd_high(hdmi->cec_dev))
+		mtk_hdmi_update_plugged_status(
+				hdmi, connector_status_connected);
+	else
+		mtk_hdmi_update_plugged_status(
+				hdmi, connector_status_disconnected);
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
