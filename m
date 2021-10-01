Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCDFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:52:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 162C6617E1
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 162C6617E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRPmZM/4sq/wHW7U+o6YseMT9Kv4zsv3owSlR8vz8Ck=; b=Gk92v5bGHPjNlm
	aROlxJi0Bmi27bCAVH/WIO4hjcbnWpgxS3curVkxZwEGMMX3oJkjbvg3nUpy/dD5P0Arm5zj7CTqi
	B0HvXNTea6fXl4xJhN3tbBbGflRRaa+6Yf6ScZs5qg3Y0/DUjz5RFhYEPuNQhDQ/0fMCtFdMsGzww
	XdG2rI/TNB7lWZiRQlUB1oCetCrsmqSJahbxHMOCelQcT5Hjxw8jWiOovC0sDwqxfDCbAtwoal5uN
	AT3Pr+yVJd/OH1ANeNMbvZzP35f2XE5p5unYEOTcarxYMxEjs/bPufKPKENMo5f4+q12FsfjJE0eD
	0kBtwAECcFYImI4S5Tyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWFCt-00HLUX-T4; Fri, 01 Oct 2021 09:51:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWF68-00HIku-4E
 for linux-mediatek@lists.infradead.org; Fri, 01 Oct 2021 09:45:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 i6-20020a1c3b06000000b0030d05169e9bso8543760wma.4
 for <linux-mediatek@lists.infradead.org>; Fri, 01 Oct 2021 02:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ECgEwlXcpssO++nHCyquDoyB9qW01hH4M38EB8NYkkY=;
 b=S80pW5lSQDdU4uDMZtPLsHPrpKxrM3oqRdJLN8a31o1o80cqTIxp7VGn7hBWBA922R
 rEgelIkwR29HX/n6pQvOX4qUXkfhTbOX9wlvrpFyQCZcuLQcCCnPD5Q7L1SUB04bypiI
 D5bdCGhWz3h2vQ9sAH/hScM66R+GL0isB2j0BYQYU+GSulWKRs4AOJTSWECfBFHA9JfQ
 S6KM7ZKRVvzmJkprNfIfUBuuhxi1wi3teevqadFs2piUqQjDaii7mh8N6tF+Zg+QD8Ha
 xTE2U75ayvDEhBt0YC5qOdTOyAVWdi7t9L4k+bPl9aVcdWZdKvfcZIkIP/YhW1siI7VU
 wudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ECgEwlXcpssO++nHCyquDoyB9qW01hH4M38EB8NYkkY=;
 b=f6ha1aWE9CQNkLx9LO/+834a10/M8sQHDoYRxS3sfQr6dRjrwNn4KH0h8KOoLoyuLv
 QEqYvCfu6FwrJrcJ7yAiOB8Fyuw/vvBCdxC5TCMEO4/oZXtcmKt2j4B8v0B+ELqxr5zA
 TDr/ijdzk9fEInHGJjV3HbuR4QqgW5zQSb7f/SGk0QGGcUe/CO9lLRIO1zkWuyOMA8B4
 sKJu1CQQCuFzjpcjUu/Q0JgCe7bbiXcFsZD/CeIDNxrPYoAwTlBLp+aGPonKqtIK2OG4
 REKLKG4/YAtuTpQ3Glru4pSImWtqmVpRVhi9k0+J1TwDF9TmtQRRS/GuztY6qK9Nzl3d
 2CDA==
X-Gm-Message-State: AOAM531AcBBDq2L1gfpq+LcqeQMXZkIFfcrAbStDrmgTr7fnvkZnQpai
 2vf5MdZStTvJMlGFXOAz3UEeWQ==
X-Google-Smtp-Source: ABdhPJwngxgm6yb2rvIYLpK8cbIPIYfrQPddfADbHXYsKwFOECizmgOMFKTZlkuaZh/ON7kNiayOqQ==
X-Received: by 2002:a7b:ca58:: with SMTP id m24mr3555907wml.0.1633081494799;
 Fri, 01 Oct 2021 02:44:54 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l21sm7181620wme.39.2021.10.01.02.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 02:44:54 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 4/6] video/hdmi: Add audio_infoframe packing for DP
Date: Fri,  1 Oct 2021 11:44:41 +0200
Message-Id: <20211001094443.2770169-5-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001094443.2770169-1-msp@baylibre.com>
References: <20211001094443.2770169-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_024456_282950_76E387E2 
X-CRM114-Status: GOOD (  18.29  )
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

Notes:
    Changes v1 -> v2:
    - Create a define for HB2.
    - Use struct dp_sdp to pass data in a better way.

 drivers/video/hdmi.c        | 83 ++++++++++++++++++++++++++++---------
 include/drm/drm_dp_helper.h |  2 +
 include/linux/hdmi.h        |  7 +++-
 3 files changed, 72 insertions(+), 20 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 947be761dfa4..63e74d9fd210 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <drm/drm_dp_helper.h>
 #include <linux/bitops.h>
 #include <linux/bug.h>
 #include <linux/errno.h>
@@ -381,12 +382,34 @@ static int hdmi_audio_infoframe_check_only(const struct hdmi_audio_infoframe *fr
  *
  * Returns 0 on success or a negative error code on failure.
  */
-int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
+int hdmi_audio_infoframe_check(const struct hdmi_audio_infoframe *frame)
 {
 	return hdmi_audio_infoframe_check_only(frame);
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
@@ -404,7 +427,6 @@ EXPORT_SYMBOL(hdmi_audio_infoframe_check);
 ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 				       void *buffer, size_t size)
 {
-	unsigned char channels;
 	u8 *ptr = buffer;
 	size_t length;
 	int ret;
@@ -420,28 +442,13 @@ ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 
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
 
@@ -479,6 +486,44 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
 }
 EXPORT_SYMBOL(hdmi_audio_infoframe_pack);
 
+/**
+ * hdmi_audio_infoframe_pack_for_dp - Pack a HDMI Audio infoframe for
+ *                                    displayport
+ *
+ * @frame HDMI Audio infoframe
+ * @sdp secondary data packet for display port. This is filled with the
+ * appropriate data
+ * @dp_version Display Port version to be encoded in the header
+ *
+ * Packs a HDMI Audio Infoframe to be sent over Display Port. This function
+ * fills the secondary data packet to be used for Display Port.
+ *
+ * Return: Number of total written bytes or a negative errno on failure.
+ */
+ssize_t
+hdmi_audio_infoframe_pack_for_dp(const struct hdmi_audio_infoframe *frame,
+				 struct dp_sdp *sdp, u8 dp_version)
+{
+	int ret;
+
+	ret = hdmi_audio_infoframe_check(frame);
+	if (ret)
+		return ret;
+
+	memset(sdp->db, 0, sizeof(sdp->db));
+
+	// Secondary-data packet header
+	sdp->sdp_header.HB0 = 0;
+	sdp->sdp_header.HB1 = frame->type;
+	sdp->sdp_header.HB2 = DP_SDP_AUDIO_INFOFRAME_HB2;
+	sdp->sdp_header.HB3 = (dp_version & 0x3f) << 2;
+
+	hdmi_audio_infoframe_pack_payload(frame, sdp->db);
+
+	return frame->length + 4;
+}
+EXPORT_SYMBOL(hdmi_audio_infoframe_pack_for_dp);
+
 /**
  * hdmi_vendor_infoframe_init() - initialize an HDMI vendor infoframe
  * @frame: HDMI vendor infoframe
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 1d5b3dbb6e56..9debbcc34b14 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1524,6 +1524,8 @@ int drm_dp_bw_code_to_link_rate(u8 link_bw);
 #define DP_SDP_VSC_EXT_CEA		0x21 /* DP 1.4 */
 /* 0x80+ CEA-861 infoframe types */
 
+#define DP_SDP_AUDIO_INFOFRAME_HB2	0x1b
+
 /**
  * struct dp_sdp_header - DP secondary data packet header
  * @HB0: Secondary Data Packet ID
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index c8ec982ff498..2f4dcc8d060e 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -336,7 +336,12 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
 				  void *buffer, size_t size);
 ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 				       void *buffer, size_t size);
-int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame);
+int hdmi_audio_infoframe_check(const struct hdmi_audio_infoframe *frame);
+
+struct dp_sdp;
+ssize_t
+hdmi_audio_infoframe_pack_for_dp(const struct hdmi_audio_infoframe *frame,
+				 struct dp_sdp *sdp, u8 dp_version);
 
 enum hdmi_3d_structure {
 	HDMI_3D_STRUCTURE_INVALID = -1,
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
