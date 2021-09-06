Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4B4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 19:38:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21FBF60BD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 19:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21FBF60BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVRF/GYQbXf8HUZUkb7Lo1z8UXri08UXwug3fE0kbjY=; b=HQ8fF/RigQIIzR
	BgzyDNns2SI5fr7x3Lr4pEjldGFQ84+/Y7OrMxeqaGdbiccvDhYhOjr7YGKkm6XkGMZdOtLoeRxZo
	lPEJL96IQl7mNJ4BI7Zx0RwQVUrNh11mraXYU5jN+7D/OmoZfDvoXwCzFn7gWN90Hke4yl2+9E/oQ
	j5kfIbRCGiCyc2zimBbvvlVsOR9mGCF7eHrsAo8TkQcnkT51LMCq10qfANODqHVZsCE17YbEZeGpE
	AI8MM9f4krB9Xsgo8b8h6bI/Qc2JmWajMghxhMzYAhxmBTGx2rbSS9uZ/izXfRK/bYo1lBc4p6MmO
	FytQ/0HyaSgUk6g+RTtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNKRe-001m05-KC; Mon, 06 Sep 2021 19:38:18 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNKQT-001lSO-0Y
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 19:37:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id x6so11140066wrv.13
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Sep 2021 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=snUzoDW+5PNPj/ZhnT7gRBZGhyimDcpdvBIKee8Gvik=;
 b=Jom5mQd0Ic3lUJzLQn782DM3DGKd2OI7Gn/gWzXKwSehzPTTwB4DK80bqKePMOq51s
 mgQGb/en0JSIODIe1gZra4mymBT2dCwqP5+4sljtOUlieURD8v2BhRI/2/q7U1xAvjC0
 HBnp7I3+mPvgcKw5Z9kmQrvQ1C30+tqE1vovgA1rHTwY9ejTzUMZ1qQsmRNLc2xG1bQG
 Y1vWbvwZXJckYtkYWJ+wZabfqdNHQYQPeYnTGVBJ+jqgEiLZ4W7o3CW3XBBtgkMtZgA3
 rkNPHiohhMvrPBj+xd9Eo/b/0PiNkfpmP/Q1ShM+5lYJpA1hBuZXYwjY6Fp51P46J4Tx
 amAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=snUzoDW+5PNPj/ZhnT7gRBZGhyimDcpdvBIKee8Gvik=;
 b=dwGqY3BX+kVWcp1sT3dvdriP5iXdVpiF9ioXUlO7xTke5FbZ7CY4ur4ZoGEPABxdN5
 4uJNWOVY05FquZqD1yMngUkpbEV7W2LsV+tv4bGaRkDkqq0pp7Wy0I5UE+F+JB6OVir7
 FewXWpnJAw8Z3tcBhYlGfHFXUx83g6Vgl0f5ObKKxVLzFAVmDOTNJr+OAI3ziVEAxtF3
 vAIWJHS9MEzrXwzrHCx/CJ4whEgIynJ1rVavu1JF2EFN1N6YC3PkhwJ4rNOKJ3n9/2bn
 cslHWBDxHzXThzgbOJKQM+se5XgxfBAP8FlMMHYy3JXoKb5uySHD5AdK5KJ39S0ztWZ+
 UbBQ==
X-Gm-Message-State: AOAM533+OCPc9etHcxkRV8c4vNzKg8HEJF4AV3RH31pNrXRqxe6Qps8Q
 h+nkBhB6rjDxnKEbGbsMKYgVEw==
X-Google-Smtp-Source: ABdhPJw73Dea6TnP4RirbnbvwG3v+REJRLKH+tErr/30ujbznKQo85kBUSdowHn6Jt6Zn8FECj4/eg==
X-Received: by 2002:adf:f991:: with SMTP id f17mr15199284wrr.56.1630957023909; 
 Mon, 06 Sep 2021 12:37:03 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w29sm8815202wra.88.2021.09.06.12.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:37:03 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 4/6] video/hdmi: Add audio_infoframe packing for DP
Date: Mon,  6 Sep 2021 21:35:27 +0200
Message-Id: <20210906193529.718845-5-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906193529.718845-1-msp@baylibre.com>
References: <20210906193529.718845-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_123705_099858_83CC9BF6 
X-CRM114-Status: GOOD (  16.51  )
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

Similar to HDMI, DP uses audio infoframes as well which are structured
very similar to the HDMI ones.

This patch adds a helper function to pack the HDMI audio infoframe for
DP, called hdmi_audio_infoframe_pack_for_dp().
hdmi_audio_infoframe_pack_only() is split into two parts. One of them
packs the payload only and can be used for HDMI and DP.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/video/hdmi.c | 87 +++++++++++++++++++++++++++++++++++---------
 include/linux/hdmi.h |  4 ++
 2 files changed, 73 insertions(+), 18 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 947be761dfa4..59c4341549e4 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -387,6 +387,28 @@ int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
 }
 EXPORT_SYMBOL(hdmi_audio_infoframe_check);
 
+static void
+hdmi_audio_infoframe_pack_payload(const struct hdmi_audio_infoframe *frame,
+				  u8 *buffer)
+{
+	u8 channels;
+
+	if (frame->channels >= 2)
+		channels = frame->channels - 1;
+	else
+		channels = 0;
+
+	buffer[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
+	buffer[1] = ((frame->sample_frequency & 0x7) << 2) |
+		 (frame->sample_size & 0x3);
+	buffer[2] = frame->coding_type_ext & 0x1f;
+	buffer[3] = frame->channel_allocation;
+	buffer[4] = (frame->level_shift_value & 0xf) << 3;
+
+	if (frame->downmix_inhibit)
+		buffer[4] |= BIT(7);
+}
+
 /**
  * hdmi_audio_infoframe_pack_only() - write HDMI audio infoframe to binary buffer
  * @frame: HDMI audio infoframe
@@ -404,7 +426,6 @@ EXPORT_SYMBOL(hdmi_audio_infoframe_check);
 ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 				       void *buffer, size_t size)
 {
-	unsigned char channels;
 	u8 *ptr = buffer;
 	size_t length;
 	int ret;
@@ -420,28 +441,13 @@ ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 
 	memset(buffer, 0, size);
 
-	if (frame->channels >= 2)
-		channels = frame->channels - 1;
-	else
-		channels = 0;
-
 	ptr[0] = frame->type;
 	ptr[1] = frame->version;
 	ptr[2] = frame->length;
 	ptr[3] = 0; /* checksum */
 
-	/* start infoframe payload */
-	ptr += HDMI_INFOFRAME_HEADER_SIZE;
-
-	ptr[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
-	ptr[1] = ((frame->sample_frequency & 0x7) << 2) |
-		 (frame->sample_size & 0x3);
-	ptr[2] = frame->coding_type_ext & 0x1f;
-	ptr[3] = frame->channel_allocation;
-	ptr[4] = (frame->level_shift_value & 0xf) << 3;
-
-	if (frame->downmix_inhibit)
-		ptr[4] |= BIT(7);
+	hdmi_audio_infoframe_pack_payload(frame,
+					  ptr + HDMI_INFOFRAME_HEADER_SIZE);
 
 	hdmi_infoframe_set_checksum(buffer, length);
 
@@ -479,6 +485,51 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
 }
 EXPORT_SYMBOL(hdmi_audio_infoframe_pack);
 
+/**
+ * hdmi_audio_infoframe_pack_for_dp - Pack a HDMI Audio infoframe for
+ *                                    displayport
+ *
+ * @frame HDMI Audio infoframe
+ * @header Header buffer to be used
+ * @header_size Size of header buffer
+ * @data Data buffer to be used
+ * @data_size Size of data buffer
+ * @dp_version Display Port version to be encoded in the header
+ *
+ * Packs a HDMI Audio Infoframe to be sent over Display Port. This function
+ * fills both header and data buffer with the required data.
+ *
+ * Return: Number of total written bytes or a negative errno on failure.
+ */
+ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
+					 void *header, size_t header_size,
+					 void *data, size_t data_size,
+					 u8 dp_version)
+{
+	int ret;
+	u8 *hdr_ptr = header;
+
+	ret = hdmi_audio_infoframe_check(frame);
+	if (ret)
+		return ret;
+
+	if (header_size < 4 || data_size < frame->length)
+		return -ENOSPC;
+
+	memset(header, 0, header_size);
+	memset(data, 0, data_size);
+
+	// Secondary-data packet header
+	hdr_ptr[1] = frame->type;
+	hdr_ptr[2] = 0x1B;  // As documented by DP spec for Secondary-data Packets
+	hdr_ptr[3] = (dp_version & 0x3f) << 2;
+
+	hdmi_audio_infoframe_pack_payload(frame, data);
+
+	return frame->length + 4;
+}
+EXPORT_SYMBOL(hdmi_audio_infoframe_pack_for_dp);
+
 /**
  * hdmi_vendor_infoframe_init() - initialize an HDMI vendor infoframe
  * @frame: HDMI vendor infoframe
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index c8ec982ff498..f576a0b08c85 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -334,6 +334,10 @@ struct hdmi_audio_infoframe {
 int hdmi_audio_infoframe_init(struct hdmi_audio_infoframe *frame);
 ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
 				  void *buffer, size_t size);
+ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
+					 void *header, size_t header_size,
+					 void *data, size_t data_size,
+					 u8 dp_version);
 ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 				       void *buffer, size_t size);
 int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame);
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
