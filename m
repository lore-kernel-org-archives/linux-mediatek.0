Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B86C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 08:45:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB98D60F6D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 08:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB98D60F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+d+3LZ7W3zZUs4hrXatGBbuwG/msCnD07m+AjqXegfc=; b=ipqhrNk2n9xI90
	6wvidNqTsyT2u5x8g0TWHxMczexNYceOVfIHy3lFz8vVU+an4zUqbRPB2BV+Pdnn68HLzncY8Z2C/
	b389ZAbmCENJ9opqr+LCZjQsTv3JRbHSKjHCNju5Hw7nhYkvPbYM7XBuohaeGHZGmp6A7M2cKs2KL
	l+SyySyeFJrEkqk/aj/Z7K9lUV/iV7v4a0u5LQLNJVHZIVzMuntVmSUb+5gAI15sVGBWejFfVq2ai
	l2peJknYOHyi/yNJQ4Spn0N09j9aXgyWKdSc/d9JTuaCadLZH3lXtsogZ2xkkWgYg2YUL1YFrG4tL
	wov+YgjQJbLF1xL3tc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSEv6-000wu4-9l; Mon, 20 Sep 2021 08:45:00 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSEui-000wiv-0m
 for linux-mediatek@lists.infradead.org; Mon, 20 Sep 2021 08:44:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id q26so27457852wrc.7
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Sep 2021 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jqJ/1vqcPyjMjkmUBeTk+Qsgo+/52Dj6l9GetSfHX08=;
 b=QpkbKwXjEspLtClKvnCORzAcVWN5B7ZqB+aNcmd5H/B1qgQL5qWg9WTQ6UHKI3Zw0K
 41n6hKM4dopXDMH9OTS4dVZIu9qC1UMl/D6gKMnMWzp1ZKo3QkdEfPH9KTSNcjzKJBN2
 C9sX8LEBv9vhbEKovJAUXeFDHUauNmBsFG8ps1SxIWT3nTbnygSAw+h/GWL8ZJksdU1L
 +vDy1uDrnfyVNEqImgKwItdJjzjVOXqmkYUyoaEMjwt9bYPE8aF9F3d1AltIdBZJSNEr
 ANnbe1uosFU9E7U66TZosC8emvXVeTgNh6RckCgmjFGSMKz2sIJ4OGQzN7LEXnZFkO2n
 L7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jqJ/1vqcPyjMjkmUBeTk+Qsgo+/52Dj6l9GetSfHX08=;
 b=iiI4XnKDb+l6YfXEBQ5u7BJMH9RPUaqKokArhVmL0AtbIEqUInTowG7/sYeE5o7c7k
 PsBO1DmiULzZXpkd28d97YioqSut5o3BWugOZJmXhI5kUOEd0PKNQ6BSw2Q0fJqZr1bJ
 5515fi0GGoKrd1ZeY205fzMb1K8VNNNd9LOHFw2YGgXeB46vSUR7dF46QaCPA8NyEaqq
 LkYqoB8Nm7UZIWvVeWlCJ0qQOqZ5pOX7Q9ihMyIvQnNlq6J61nhy1SLBvMTLqx3QW7hF
 6E1I4H0w9OQwsPviJ+XCDxB8z5wBuICkCTljbB3f09/E0MstE+u1TRKvwXYRMbHH+205
 m/Pw==
X-Gm-Message-State: AOAM531UWkSNBZD7Y3tAMhsNckMewe6FVqk5IbXQBq1i44rUxBp8GYag
 8+FZ0VmJpzmUhSlEjFAMNsfjDw==
X-Google-Smtp-Source: ABdhPJyRRZpwd7K+6Axr+A06Dh9Qtz6UEU7oV6snyN/B2RHijrf/oc/Hv4FjuBcni2MMU1BPUkkjXA==
X-Received: by 2002:a5d:5981:: with SMTP id n1mr27164288wri.82.1632127474810; 
 Mon, 20 Sep 2021 01:44:34 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w1sm18433911wmc.19.2021.09.20.01.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:44:34 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 3/6] drm/edid: Add cea_sad helpers for freq/length
Date: Mon, 20 Sep 2021 10:44:21 +0200
Message-Id: <20210920084424.231825-4-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920084424.231825-1-msp@baylibre.com>
References: <20210920084424.231825-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_014436_108076_0B5FB75D 
X-CRM114-Status: GOOD (  14.12  )
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

Notes:
    Changes v1 -> v2:
    - Use const struct pointers.
    - Add a check whether the format is actually uncompressed or not.

 drivers/gpu/drm/drm_edid.c | 74 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     | 18 ++++++++--
 2 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6325877c5fd6..28df422fbc03 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4666,6 +4666,80 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
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
+int drm_cea_sad_get_sample_rate(const struct cea_sad *sad)
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
+static bool drm_cea_sad_is_uncompressed(const struct cea_sad *sad)
+{
+	switch (sad->format) {
+	case HDMI_AUDIO_CODING_TYPE_STREAM:
+	case HDMI_AUDIO_CODING_TYPE_PCM:
+		return true;
+	default:
+		return false;
+	}
+}
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
+int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad)
+{
+	if (!drm_cea_sad_is_uncompressed(sad)) {
+		DRM_WARN("Unable to get the uncompressed word length for a compressed format: %u\n",
+			 sad->format);
+		return -EINVAL;
+	}
+
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
index deccfd39e6db..7b7d71a7154d 100644
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
+int drm_cea_sad_get_sample_rate(const struct cea_sad *sad);
+int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
