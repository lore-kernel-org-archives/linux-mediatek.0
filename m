Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74D9C7619B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:17:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE882070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:17:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YOacd+La";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="NS+hvD7V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CE882070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Q+EunFu0aiMB5iQVEmkgCw/2i2lq3kiUiTsbNswcFk=; b=YOacd+Lah398P1
	Tg+u7Z4kNF56YlSx2d0iEG2BA1MWVtfbVyJyc4e+fEuE4wtkL+LYcNAnic7U0qqmm+73JGMAKg+jt
	T9Ve8MihAOYskfdeBl6J5NlVXg2+lBpSAJXH+2UcPyAWn1DsRnm1QfyrPQNGv1VVtLTJWwmcv39Y6
	BpsCSdBSikYF4Q/0E7B7r6GDD/WKmXEfYwk1LmEfpK9lUXAkRsWgGSg3di9rKWgIfvEaekHflIYtw
	sMVBJdhXbl8Hgnx2WVfpya2A2PEOVtyPdVhYj87rgHLIzxHmwWFtPucpe4ToKBpoOzGrQEXib+wk4
	lnTbcVwv0yeOV6T1uk8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3Wub-0003BU-GS; Mon, 17 Feb 2020 03:17:33 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3WuH-0002nI-0E
 for linux-mediatek@lists.infradead.org; Mon, 17 Feb 2020 03:17:14 +0000
Received: by mail-pl1-x64a.google.com with SMTP id p19so7500905plr.8
 for <linux-mediatek@lists.infradead.org>; Sun, 16 Feb 2020 19:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=E5BCGldRe7eFAGLQVFmcBimFYUghF+IzwiWzbxZYe7o=;
 b=NS+hvD7VZRtKE2R/Xq1U75r1q6HgBSXd3k2OLQjZfHV8YaUAHr1smXbLENNirFdHsj
 PtSomq4XOq1mVdmGlECgRU5iTiJHjiRBYDjMPhCsUSgwRhxV1WnmYjht+97oXpYXp5a3
 kZHl4MHCDRntHydqUWIj6KHo0KmUBhC5b1yTRVfM5/0q/UXBC//Xx9Gtpc6ekyaG1Hk0
 eZpoybGZzoHdV2kgPX9L3vVhZ3WvtqnE0cvx+IktBq2MYvS0Yx6UgWqflya9nUMrr63U
 98DLX1iN+RwZH0ZxFfNuSUFkcM55pIzjwkxZsvbbBH25fTgYKgHTKKIUHPcW9YIXIKlb
 /MUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=E5BCGldRe7eFAGLQVFmcBimFYUghF+IzwiWzbxZYe7o=;
 b=ato/OVKtnatN1bN9U7XoFFCQxaH5qowcp9xr8aLjODdu8tbQfjO10A6cOFl8eGLjeD
 fHq274R3J4y4RQxQVaGGvOq17DC9GrGeVLYaCaoJpHi/RF7JnS2hslv2OWb7eeFSbci/
 Uq9KTUpCjvWh08a+BUSB6EPTMv/VDHzPnRmw3t4Nmyim1ObFiB5Uy6ZUFnYs3Up3+NHx
 7pd7eLWTx29rR4dGcNRxp9tYFAb6W5WBQP0JTsCDoaGAFWah1bEb4LCIqUDTvbN0ZoXk
 4VJZIOtJ4NRB/9uRJv2wgDxRqQEJ3J5z1O3FQZvf1oxwcf4OJJSitWkTIHTnhBxai60h
 5ttg==
X-Gm-Message-State: APjAAAUzqmRF3Bwc9WmxVGv/OvB5jEF9hmRMJmSwWALMJ7gpvbj9lAHW
 XJ2seYv8rft3ocv2R0NdC36dk4KTd+tI
X-Google-Smtp-Source: APXvYqwFBo1TW5OKjVbnTeWNYS7iTLxNwp5AqpuvTgk8sGrNAAP3BgmmBO1Yc/QvcgfKirYdziuDCiuk48HH
X-Received: by 2002:a63:de54:: with SMTP id y20mr15796824pgi.79.1581909431033; 
 Sun, 16 Feb 2020 19:17:11 -0800 (PST)
Date: Mon, 17 Feb 2020 11:16:53 +0800
In-Reply-To: <20200217031653.52345-1-tzungbi@google.com>
Message-Id: <20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
Mime-Version: 1.0
References: <20200217031653.52345-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v2 2/2] drm/mediatek: fix race condition for HDMI jack status
 reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_191713_068553_6194E272 
X-CRM114-Status: GOOD (  11.85  )
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

hdmi_conn_detect and mtk_hdmi_audio_hook_plugged_cb would be called
by different threads.

Imaging the following calling sequence:
           Thread A                            Thread B
--------------------------------------------------------------------
mtk_hdmi_audio_hook_plugged_cb()
mtk_cec_hpd_high() -> disconnected
                                     hdmi_conn_detect()
                                     mtk_cec_hpd_high() -> connected
                                     plugged_cb(connected)
plugged_cb(disconnected)

The latest disconnected is false reported.  Makes mtk_cec_hpd_high
and plugged_cb atomic to fix.

Also uses the same lock to protect read/write of plugged_cb and codec_dev.

Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 03aeb73005ef..d80017e3d84a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
@@ -171,6 +172,7 @@ struct mtk_hdmi {
 	bool enabled;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
+	struct mutex update_plugged_status_lock;
 };
 
 static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
@@ -1199,10 +1201,13 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
 static enum drm_connector_status
 mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
 {
-	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
+	bool connected;
 
+	mutex_lock(&hdmi->update_plugged_status_lock);
+	connected = mtk_cec_hpd_high(hdmi->cec_dev);
 	if (hdmi->plugged_cb && hdmi->codec_dev)
 		hdmi->plugged_cb(hdmi->codec_dev, connected);
+	mutex_unlock(&hdmi->update_plugged_status_lock);
 
 	return connected ?
 	       connector_status_connected : connector_status_disconnected;
@@ -1669,8 +1674,11 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
 {
 	struct mtk_hdmi *hdmi = data;
 
+	mutex_lock(&hdmi->update_plugged_status_lock);
 	hdmi->plugged_cb = fn;
 	hdmi->codec_dev = codec_dev;
+	mutex_unlock(&hdmi->update_plugged_status_lock);
+
 	mtk_hdmi_update_plugged_status(hdmi);
 
 	return 0;
@@ -1729,6 +1737,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	mutex_init(&hdmi->update_plugged_status_lock);
 	platform_set_drvdata(pdev, hdmi);
 
 	ret = mtk_hdmi_output_init(hdmi);
-- 
2.25.0.265.gbab2e86ba0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
