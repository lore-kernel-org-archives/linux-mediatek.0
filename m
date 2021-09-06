Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A50C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 19:37:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC5A60F25
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 19:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CC5A60F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2E5rBX9BEIcie/Ff8ycDZi45nWcmAzWD1NN8UDtkZr0=; b=BmHWfXlhaGPhdg
	cwCBz2rZLnYLWhOvIB3it0HSmF+TiK2QBbC+HXt35tsnM/3HjQcs0UEquoSv687NvDZRwaTY4FA+R
	NAcKentzvZlJO2dS5+GeswKn5yKSSFOJ5p/qzXZomRBfm8APYYvFhii2dM20CoZv3ZmOjNjz0smYn
	uYIdtT+5C2M8F3zgmIq+E8McfbT1AOkry8e6kdNsSNgILiLTRe1VNtEPmcwLHdVKg+G3B7isv8viK
	LCnO3mK94S9M9vmtzQ1JRRp/vDrPpyt1iqqLLW4o9HSjANZuC95E+dESqeaJP7qNjYC7sf8So0876
	yCj4TPebq4yTHDKRVzRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNKR6-001liX-6t; Mon, 06 Sep 2021 19:37:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNKQS-001lR5-Lh
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 19:37:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id n5so11167006wro.12
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Sep 2021 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rCTzkZjxAR3yPntjhPl5/v+go5uJQqFyVCtShSMvS8s=;
 b=YIMMT91D2ae2cWaA3DDabg5Ng2o3oNGdbiBeJtAMtFTcowr2RqGkddEEgdiWD70j2q
 t8IQwikt4/3zeSD8FdZCLdGxxnDjEiLBFRFheG/aTfFiyEl144iPkIa5tKxoCGCFHBEP
 TbWgqXemzsVQj1GoJbIRn10IwV0ug0zuO9U4di6cgc4luySp8l380ZfZm3bdQK+fvkJV
 hvFD33kcdrPAWVGJM7D3zye/y7K+L8POB4wlgmCBMueidw6N4K6Dy/WRTuIyu5hOLdwv
 FODQz1E5L0/339wu817YpUwIKI7xrhd3Dv4c8yQ5LXnGfXEr7rohgvhtha3pezxELJ+8
 v+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rCTzkZjxAR3yPntjhPl5/v+go5uJQqFyVCtShSMvS8s=;
 b=TheYl1ybHJA4RNEFYP4v84zHDhHBjB6eEZuWtugmrSoN1P5hTItu0GXRd6WDzhgBTQ
 lFWjPSFaOnJJRS4HFhHQ7QwtV4LC8Olf/N4OK+yAVZVuWjdriOqqkpwWBbWuV3bDtbhx
 CXD+vCWdz6VYKO605jeivyoBACL6i7YzNcl168O0MDKXvzBBpI1uXBKI55NszT9PcEfs
 eXpuYsSsa2szn1R63+9zLYA2FIt/AsARRfE9s+Vr+XPq7pwUfgKd8v2RBzcg/AgSRHBJ
 4/kyI8tKsqChk5YdQ+ZNCWxrPMxRlLF/2H6Vw6CtUewfKUf1eU7NwphqcGTc/n0nUwYE
 c80Q==
X-Gm-Message-State: AOAM531DbU1S8BvZzYQB2jV/zWRkF2xmdZGjBUy+lHrtLVtrV/h9Tkpb
 eYP1ZX45JgTUuWx+TgR/D9bmVQ==
X-Google-Smtp-Source: ABdhPJw+SQEEcIoMtB3u+8hG/+1N90IseBx2tpu8H2Km4BwrrRoywYqOx3e1ukyR1U84aGovNybYIA==
X-Received: by 2002:adf:c449:: with SMTP id a9mr15137691wrg.256.1630957023305; 
 Mon, 06 Sep 2021 12:37:03 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w29sm8815202wra.88.2021.09.06.12.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:37:03 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 3/6] drm/edid: Add cea_sad helpers for freq/length
Date: Mon,  6 Sep 2021 21:35:26 +0200
Message-Id: <20210906193529.718845-4-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906193529.718845-1-msp@baylibre.com>
References: <20210906193529.718845-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_123704_776468_C9E9625F 
X-CRM114-Status: GOOD (  13.36  )
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
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
