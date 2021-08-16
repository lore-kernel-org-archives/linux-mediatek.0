Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22377C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 19:27:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD09D60E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 19:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD09D60E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzS79HQTgxeDADkRZ0rA7K0/J+OhMWblzuLYGTcjGvo=; b=Dv2pODrDVSDG5G
	IXsd5F6SjJmYP3MyRvgJbVuCCN2jCrUFUuPP8LR4U+8qrjzAoyin+xsjxtnOqJOSjWqz46TlGFflA
	U/vmdEHqNB67HHfLv05rEWQfis8luu1GDhAlLKfbCYGPTLQ7dkW9t1eIzxRpy5l0WFJOW/4jybnbs
	Sn1r11X0ifFGFOk3zOvAqur2zkI66FMo+YrQwrvBLziwK7G2cAzoY/evG6j+Ahy1TUa5c5Gfw7i5P
	tlCEbq9f3hzWzPhxpNpjjAwS9rkQnc3U2KxtHgSUuJIQ8+4cRv8d6/Y56svbAo7o7fzVaIOWv2xuG
	7JJJXOUllvQ96p1m52dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFiGS-0008iZ-I4; Mon, 16 Aug 2021 19:27:16 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFiF5-0008I2-Rx
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 19:25:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id q10so25143341wro.2
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 12:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5VYmJK3EyqmfhH+BfVMGjh2lMBLY0y87vkPhxmR1fE=;
 b=Q6VilRTJlXhBTxPwoxK0Dv6DqfrBAtJL/FQWBA78STpBnt892iVD2I/4oC5EvbL7iO
 /EBI9dILWaFxitg2X4FoRtlhvWiH35duYafUVCmLNOQPfu9GKSIyg7pQ4HgE1s5hyfLa
 xVWhhE5UmwzcQbd7WnsDSYZORLXPAELB6UoxxR/XHGRNeMf24mvRwBu7hX6zJTetqKWS
 IE574Y9osIfJpTu4IwEsskjji0q9yhVcb0XuJ23r12L6GMcL+tXsWTa8UXTNBzh3l/42
 Pef5Jx3jW/I2eHHo072AFPHJOhCO70UZBUfiIhnmas4IA9UUYAQyeq26gv7RSoRLW3rp
 fN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5VYmJK3EyqmfhH+BfVMGjh2lMBLY0y87vkPhxmR1fE=;
 b=t9oCSFds46RlSQ9u4CjDnE6mquiIANuVENK6WZxTehXdegS5ZIqV2ovmFl3YPo9x3a
 JcfqeOkQQVtzjQaehKoi2dJf39y6rd3iKWRndcdgCZOeuKCQaELKqqgFHQQlHAiu4Cm/
 lGDwsVyBMIEx7fu/3HgJJPsBM8pcdMsNYqg/HXvaDcZ8pmJ/mhDZj0x3vUb9s/c1pnRH
 wOSCxC27PmJNDzDqWaX9mgQ8nQRBSuPsZjACN6p6nK9C6IHWymv0+QBLUnEJgqbGqO6I
 ZnqNlcocPgAJwTwq8Auxn8RxoBLixqn70iqiEHBPTqssppRrO7Esq0MERFzl+QLFwCui
 m5aQ==
X-Gm-Message-State: AOAM531N8R5Qxhnc92I8GBqI/b9hSke2jSfm1yhrPJOYUpt+9L34AAwR
 6NkAKGIRtw9sXvzLbHpb0IXnBw==
X-Google-Smtp-Source: ABdhPJz2kJKg6ucKnNqvzzNTIcKiPTrBAqNLCYGOzzpwmHkdMqYF9+ht7vmA5ZoTxLxeU2TuNJINGQ==
X-Received: by 2002:adf:ffcb:: with SMTP id x11mr82146wrs.158.1629141949201;
 Mon, 16 Aug 2021 12:25:49 -0700 (PDT)
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
Subject: [RFC PATCH 4/5] video/hdmi: Add audio_infoframe packing for DP
Date: Mon, 16 Aug 2021 21:25:22 +0200
Message-Id: <20210816192523.1739365-5-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816192523.1739365-1-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_122551_979640_0BA90345 
X-CRM114-Status: GOOD (  16.38  )
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
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
