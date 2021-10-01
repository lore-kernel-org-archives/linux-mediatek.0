Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF2AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:52:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 683EB61881
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 683EB61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2QHj2pVRke7sO98E9pcOjCv66Ad8y6MAyJahneOJ/s=; b=RuYHIowFOormyu
	esGlY5/OdTC/zkYe3P+0HIDSsXyZn/oSuMY7AUxHiajfmfgeOvvUHaS1LloVg5R29gisg24mrfuYX
	EZeWwFNcwJxaqm25GF06jQ3sdlQ97rbrR+DVpATjuY4FBGrePcqdAt5KP46udYSe+QzFrzWnUZong
	sNlxgFCym7NkemXikucTy98pg3tPwkgdU9km5OkPEEYbflsj2Jl4CANMzFrlw6AoG3RLF0xEUhuTF
	x9w1y2I0FAkHvC4E6ulkpxQdYzgs8DK3rbP6Wu34EQ/j13xfkCXyN8QMOOu+GpQaRZN16c5pLWyr9
	bCrDgg/sX9nCOJB2PxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWFCp-00HLSi-6g; Fri, 01 Oct 2021 09:51:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWF68-00HIkF-1i
 for linux-mediatek@lists.infradead.org; Fri, 01 Oct 2021 09:45:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id a18so2443103wru.4
 for <linux-mediatek@lists.infradead.org>; Fri, 01 Oct 2021 02:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qeDnF7/0L+8b2rsbo3X+Y/DSsOq81VJxq7sH0PX/jgg=;
 b=jpWyGGPF7oN0hhcjNYOlLVG5oWA9elBxQUswXniH+TmeMdz4HQ+V8vEh612OLurzOE
 NvqtHI9LObPD5zVpmqdW5bLefjLZTaMY15+Sop/9WvCOB+B23BW8nYNmB7IFn52snOBf
 wPe1BJ2/3CDR87zD9+I8ETUyS/OGV0iVlC+PUAoNbx9pt/7bKw4/fAVOsT5+5M1vsJli
 /Hwv8olx2yK9bw75kpnxuno4BGIkwsXIgVydmT/9Wn7VMYMZpSeXlJ2cNUtCs9YPTnCk
 tF0wlyzC9+yjQAJtjcJ72eu/cR4ePZaSrRcLIgUWM6dICOVzYTOgpkxisc6DEJS35pu9
 d5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qeDnF7/0L+8b2rsbo3X+Y/DSsOq81VJxq7sH0PX/jgg=;
 b=FrVu2dMq5XvZpXLiSrWSYhbkJfXWyP/yw/N1JyanzcPRo7VQ2HIWJaY6PqnMUo7MOd
 FIxyK3/SH8sbyPHHsIzPGIW6vbFbzuqaPKZLSOJUNJCpZYSoOv0Rt4nH+umbonoEURTk
 U6CmSoR+w922Ot5bRJtTOT8rEZmK0kvIsvfs4VLODZBWq/itH1YxZw0uZxBf37el0jQD
 Gc4XFjnAM7SRdg9R42AInHLWcXeIml9dn5z/8/NoRRzmoZxm959UF7kithkpeHczp11b
 pbyISXG5Rgzbm9TpFamHrSe34577bwS8FHekjADNH1wa1sOdzkmTbVEow+PRpECPgloZ
 u5iw==
X-Gm-Message-State: AOAM531m2mTcXSYAckmmV4Z4qKcWQo9RSUv770p8P3O7MMuW16bv0rWh
 zg+6qBV5MdSPXzMctjZTo9VZbJVV0bHJuA==
X-Google-Smtp-Source: ABdhPJyfR6RK9XKb8BH1eGuf2DTaY8EYJvdTpGxvwkZ4bv/PeZCy5e/vAE9AW4OTHatdOTHVYxAejA==
X-Received: by 2002:a5d:664f:: with SMTP id f15mr11113230wrw.143.1633081494174; 
 Fri, 01 Oct 2021 02:44:54 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l21sm7181620wme.39.2021.10.01.02.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 02:44:53 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 3/6] drm/edid: Add cea_sad helpers for freq/length
Date: Fri,  1 Oct 2021 11:44:40 +0200
Message-Id: <20211001094443.2770169-4-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001094443.2770169-1-msp@baylibre.com>
References: <20211001094443.2770169-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_024456_156499_2E8DA5C7 
X-CRM114-Status: GOOD (  14.45  )
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
    Changes v2 -> v3:
    - Add DRM_ prefix to the CEA_SAD defines.
    
    Changes v1 -> v2:
    - Use const struct pointers.
    - Add a check whether the format is actually uncompressed or not.

 drivers/gpu/drm/drm_edid.c | 74 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     | 18 ++++++++--
 2 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6325877c5fd6..c134803e18db 100644
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
+	case DRM_CEA_SAD_FREQ_32KHZ:
+		return 32000;
+	case DRM_CEA_SAD_FREQ_44KHZ:
+		return 44100;
+	case DRM_CEA_SAD_FREQ_48KHZ:
+		return 48000;
+	case DRM_CEA_SAD_FREQ_88KHZ:
+		return 88200;
+	case DRM_CEA_SAD_FREQ_96KHZ:
+		return 96000;
+	case DRM_CEA_SAD_FREQ_176KHZ:
+		return 176400;
+	case DRM_CEA_SAD_FREQ_192KHZ:
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
+	case DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT:
+		return 16;
+	case DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT:
+		return 20;
+	case DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT:
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
index deccfd39e6db..9d75df652b17 100644
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
 
+#define DRM_CEA_SAD_FREQ_32KHZ  BIT(0)
+#define DRM_CEA_SAD_FREQ_44KHZ  BIT(1)
+#define DRM_CEA_SAD_FREQ_48KHZ  BIT(2)
+#define DRM_CEA_SAD_FREQ_88KHZ  BIT(3)
+#define DRM_CEA_SAD_FREQ_96KHZ  BIT(4)
+#define DRM_CEA_SAD_FREQ_176KHZ BIT(5)
+#define DRM_CEA_SAD_FREQ_192KHZ BIT(6)
+
+#define DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
+#define DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
+#define DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
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
