Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50620C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 19:26:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F87060E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 19:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F87060E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gm6s8Sjn9tBu1DcMHtoyzO1Q+zgAIcr1ADSSr+n+ZkY=; b=R0DQid6VMke24C
	YNaGNGXWLnrqppWT3JEmD4VeozTWhOI0dNapGpQktaXcHY2Na1u/rLOBYf6A4uJyd8Mmtj7sIj1SZ
	A961ghrcM03dm7Ggb7PI39DY8XDVW8dIH7ULOczOEvZShy5KO7cg4bCuRS8rfeL826P+wYcar7UAh
	Y4gQVjVOKvHgr8AKAb5zozhgh78htNTKudG057xvJHR1UolcrPPlePexrs+jX+yDzfxEsh/Zm0/e1
	FXjo4+479YaGdr4dbVabdgVrPtZ4jfCB2TzNOjQ5VJ22wECGEmWmzfhnEfVMk/3Kb+qBFd1Mo7GM2
	9AfGzzJM+cFPwAlKJ/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFiFm-0008Ui-5O; Mon, 16 Aug 2021 19:26:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFiF3-0008HI-Oa
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 19:25:53 +0000
Received: by mail-wr1-x42b.google.com with SMTP id x12so25079195wrr.11
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5GQZcK6R0BkYHGP9eubs/dRk+ABz3Z6fvnc3XZsSEy8=;
 b=qswMkmAu9bvSVVAU5bWeCnVdJT1Xtnk8Vj9Ey3kptbC3XhmPW77Dfm1zVC9qm7vHsb
 cFWqnPtkV3X9dss5MkTxth9Jnb/vLDe3gFa0vGkJV3EkXh4JcTzyvD7Qv8J1nnWU0lcL
 julwMf+kHajNnxxAXdqK3J3dilfUlCqiJk9aOjOOlF9Pc4N6NwTNhsPBjeEJjK7pHniJ
 QLWRQMSWHGMKRLRs7M+ObckE0hKA7BVvdLeHiR/tf/D9BRdMYHD9qSTg0ZUwxzNe5PPd
 cBPPx1BwQ3rSLM6Rcka0MVtjYjKFgN2DLq0zaykYxaAvCYGtClsXkrwQdjOZ7wZd0av/
 uDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5GQZcK6R0BkYHGP9eubs/dRk+ABz3Z6fvnc3XZsSEy8=;
 b=A45omIgKK0ATJSl2zlWvu7Uo01i2sC/ljBGvV/hFWAn5h5OPCdCWtKX7ua9Kmd6AON
 SH7OZjCHL+B5hnCozmKO+fRbIMrnks+iylCsDoLHP2XWp3j1LUQgu0ir1NpmEVbW7iWK
 GwiypT18mDb8coSoQidWucbqxuiPeEke3xYoIF1yZE9W/hyvF5Ucfa/C5uIrvFjn+FD+
 vWZmEdihkD4N7iKdz7TuOyOMH2qruj34luy4nz9cnnzH5Vl/GxUACd0Jj6TlKYtXwxTR
 NXnlrT9mRLi69FyFa9Zke/NxwvbialHCNQYL67q2O2oe6X7FV+aq/xkMp57trYBFKs3U
 xZjA==
X-Gm-Message-State: AOAM532s96Zoy5sKr3TBxeut06+SbeZJ1x/29Y6tmuP4R/wGWzYEZ70t
 sUak7eN8NF4r870LweI0oznXUA==
X-Google-Smtp-Source: ABdhPJwITFVfElVNGgxJw2RutXnkGSR5NyNK8EdadYD0hJjotYhAoS2uhBbK/P2u4IKKms4iL/Ne9w==
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr45265wrs.161.1629141948597;
 Mon, 16 Aug 2021 12:25:48 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id k17sm333954wmj.0.2021.08.16.12.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:25:48 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [RFC PATCH 3/5] drm/edid: Add cea_sad helpers for freq/length
Date: Mon, 16 Aug 2021 21:25:21 +0200
Message-Id: <20210816192523.1739365-4-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816192523.1739365-1-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_122549_850636_DD8EF306 
X-CRM114-Status: GOOD (  13.23  )
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

This patch adds two helper functions that extract the frequency and word
length from a struct cea_sad.

For these helper functions new defines are added that help translate the
'freq' and 'byte2' fields into real numbers.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/gpu/drm/drm_edid.c | 57 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     | 18 ++++++++++--
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 81d5f2524246..2389d34ce10e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4666,6 +4666,63 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 }
 EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
 
+/**
+ * drm_cea_sad_get_sample_rate - Extract the sample rate from cea_sad
+ * @sad: Pointer to the cea_sad struct
+ *
+ * Extracts the cea_sad frequency field and returns the sample rate in Hz.
+ *
+ * Return: Sample rate in Hz or a negative errno if parsing failed.
+ */
+int drm_cea_sad_get_sample_rate(struct cea_sad *sad)
+{
+	switch (sad->freq) {
+	case CEA_SAD_FREQ_32KHZ:
+		return 32000;
+	case CEA_SAD_FREQ_44KHZ:
+		return 44100;
+	case CEA_SAD_FREQ_48KHZ:
+		return 48000;
+	case CEA_SAD_FREQ_88KHZ:
+		return 88200;
+	case CEA_SAD_FREQ_96KHZ:
+		return 96000;
+	case CEA_SAD_FREQ_176KHZ:
+		return 176400;
+	case CEA_SAD_FREQ_192KHZ:
+		return 192000;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(drm_cea_sad_get_sample_rate);
+
+/**
+ * drm_cea_sad_get_uncompressed_word_length - Extract word length
+ * @sad: Pointer to the cea_sad struct
+ *
+ * Extracts the cea_sad byte2 field and returns the word length for an
+ * uncompressed stream.
+ *
+ * Note: This function may only be called for uncompressed audio.
+ *
+ * Return: Word length in bits or a negative errno if parsing failed.
+ */
+int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad)
+{
+	switch (sad->byte2) {
+	case CEA_SAD_UNCOMPRESSED_WORD_16BIT:
+		return 16;
+	case CEA_SAD_UNCOMPRESSED_WORD_20BIT:
+		return 20;
+	case CEA_SAD_UNCOMPRESSED_WORD_24BIT:
+		return 24;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(drm_cea_sad_get_uncompressed_word_length);
+
 /**
  * drm_av_sync_delay - compute the HDMI/DP sink audio-video sync delay
  * @connector: connector associated with the HDMI/DP sink
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 759328a5eeb2..bed091a749ef 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -361,12 +361,24 @@ struct edid {
 
 /* Short Audio Descriptor */
 struct cea_sad {
-	u8 format;
+	u8 format; /* See HDMI_AUDIO_CODING_TYPE_* */
 	u8 channels; /* max number of channels - 1 */
-	u8 freq;
+	u8 freq; /* See CEA_SAD_FREQ_* */
 	u8 byte2; /* meaning depends on format */
 };
 
+#define CEA_SAD_FREQ_32KHZ  BIT(0)
+#define CEA_SAD_FREQ_44KHZ  BIT(1)
+#define CEA_SAD_FREQ_48KHZ  BIT(2)
+#define CEA_SAD_FREQ_88KHZ  BIT(3)
+#define CEA_SAD_FREQ_96KHZ  BIT(4)
+#define CEA_SAD_FREQ_176KHZ BIT(5)
+#define CEA_SAD_FREQ_192KHZ BIT(6)
+
+#define CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
+#define CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
+#define CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
+
 struct drm_encoder;
 struct drm_connector;
 struct drm_connector_state;
@@ -374,6 +386,8 @@ struct drm_display_mode;
 
 int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
 int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
+int drm_cea_sad_get_sample_rate(struct cea_sad *sad);
+int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
