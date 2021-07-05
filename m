Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18799C07E9C
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:34:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3DAA613C9
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3DAA613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0SUxQkprvpT5wd0r/HdVuKnDG/wZdiDAtpTsy2LWmU=; b=chc3QxbYBg4EU0
	NOFajQpa5rBAZhuqQZRbqJwUZUDwGMIYwv/JzW1kmT4Ewz8cm3KPFHBEwNka1P/p+7rHkpPulC8Q8
	zZjkQmXxslN4ynpFOh//Q3/zyFDLxHICjt4GNHKEAfSaTpzrcQ/6m4esqrKU0ARZIaxRaA43KBJ2p
	Giahgo1reSS9upNiEUWNub/Zr5LEewn4dszsRPnixF1SvAvlfEUTyG00lZmTwjq6XCld5o9S3JNZC
	HFpfXzZsqEnQzeTepS0Nzcm3kHfJ339ZxPcMFMm4d2q+HbQ4osXG/PRwmQztgTAYihM8BBjLtvJmW
	ggXbQGpNs3OOzG4ptlUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HEr-007qbA-3N; Mon, 05 Jul 2021 05:33:49 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HEo-007qWt-Fe
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 05:33:48 +0000
Received: by mail-pl1-x62f.google.com with SMTP id s13so6544325plg.12
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S9/yKa3QjEnFRNePk+rhqSNuQim4Rn5OJZM69c7LoMI=;
 b=od+Q/RTV1OWiKMr3g4TvVfbfJxqN1zaIfQRngv6qM+NTTXvahGnpOiz0TW2yYp2Jf2
 th+h2o0raYs8eWmpox3JW6uVqb6f5Nm6Vj5DjJbbdEkhotlRSPA4CIhAjfyT/jLYvYJo
 xpaS0ozAmFJ4CKmfgr8ZCXLCB1A+/cRT4LYyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S9/yKa3QjEnFRNePk+rhqSNuQim4Rn5OJZM69c7LoMI=;
 b=ezK+jfc5hWvwzIfdtJYeLJeWFzWQLnusi/4WgkMZLQOwnqSVa0mMdj5753fOiezUGP
 eoYAN16J3y+dQ3T5sahHuOLt5QpygQ0Z7Vh0fAKf8zbdyArGzSKJ3aTSWmRyP4m//4rj
 VvBgdlA22F4y+LZlJtZGokw+FCyjsMDuoFXyKJgLvlnrkDHR4yq1wFNQqfBm510yetLG
 7TCEUyjBSLurxQY0QBFk6GeE5x4fFvZdFuCYpRzroQGPRVAJEOdFjQFIUpK8grBJKQF+
 DCsAqIjONRz8DPpB0GMeP8Q2GO0T9qGB1mByoM3CTxfEmJG7lWQYPMOP97ML7VtXx8/4
 yNcg==
X-Gm-Message-State: AOAM531sQUBq3nKaFqxrKsNWGdLcFsLQOq8x1nKp4661brdhbiX4eRyz
 x4j6lw3m/fDYsYzoWoJs70Ao0A==
X-Google-Smtp-Source: ABdhPJzVAAhjk9sD7j0hzJYgrxbF0G/feULVabl+QBAfcppn1+xleK2B+PIyg0//6vuN5qQ/F0AExg==
X-Received: by 2002:a17:90a:9c6:: with SMTP id
 64mr13713383pjo.207.1625463223778; 
 Sun, 04 Jul 2021 22:33:43 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:3fed:7130:60f:265a])
 by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 22:33:43 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v6 08/14] media: mtk-vcodec: support version 2 of decoder
 firmware ABI
Date: Mon,  5 Jul 2021 14:32:52 +0900
Message-Id: <20210705053258.1614177-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223346_549505_29D5BF0B 
X-CRM114-Status: GOOD (  20.00  )
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

Add support for decoder firmware version 2, which makes the kernel
responsible for managing the VSI context and is used for stateless
codecs.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 18 +++++++++---
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 28 +++++++++++++++----
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  5 ++++
 3 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 236bd32dcacc..5f45a537beb4 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -29,11 +29,15 @@ enum vdec_ipi_msgid {
 /**
  * struct vdec_ap_ipi_cmd - generic AP to VPU ipi command format
  * @msg_id	: vdec_ipi_msgid
- * @vpu_inst_addr	: VPU decoder instance address
+ * @vpu_inst_addr : VPU decoder instance address. Used if ABI version < 2.
+ * @inst_id     : instance ID. Used if the ABI version >= 2.
  */
 struct vdec_ap_ipi_cmd {
 	uint32_t msg_id;
-	uint32_t vpu_inst_addr;
+	union {
+		uint32_t vpu_inst_addr;
+		uint32_t inst_id;
+	};
 };
 
 /**
@@ -63,7 +67,8 @@ struct vdec_ap_ipi_init {
 /**
  * struct vdec_ap_ipi_dec_start - for AP_IPIMSG_DEC_START
  * @msg_id	: AP_IPIMSG_DEC_START
- * @vpu_inst_addr	: VPU decoder instance address
+ * @vpu_inst_addr : VPU decoder instance address. Used if ABI version < 2.
+ * @inst_id     : instance ID. Used if the ABI version >= 2.
  * @data	: Header info
  *	H264 decoder [0]:buf_sz [1]:nal_start
  *	VP8 decoder  [0]:width/height
@@ -72,7 +77,10 @@ struct vdec_ap_ipi_init {
  */
 struct vdec_ap_ipi_dec_start {
 	uint32_t msg_id;
-	uint32_t vpu_inst_addr;
+	union {
+		uint32_t vpu_inst_addr;
+		uint32_t inst_id;
+	};
 	uint32_t data[3];
 	uint32_t reserved;
 };
@@ -87,6 +95,7 @@ struct vdec_ap_ipi_dec_start {
  *			ensure that it is compatible with the firmware.
  *			This field is not valid for MT8173 and must not be
  *			accessed for this chip.
+ * @inst_id     : instance ID. Valid only if the ABI version >= 2.
  */
 struct vdec_vpu_ipi_init_ack {
 	uint32_t msg_id;
@@ -94,6 +103,7 @@ struct vdec_vpu_ipi_init_ack {
 	uint64_t ap_inst_addr;
 	uint32_t vpu_inst_addr;
 	uint32_t vdec_abi_version;
+	uint32_t inst_id;
 };
 
 #endif
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 203089213e67..5dffc459a33d 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -25,18 +25,30 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 
 	mtk_vcodec_debug(vpu, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
 
+	/* Set default ABI version if dealing with unversioned firmware. */
+	vpu->fw_abi_version = 0;
+	/*
+	 * Instance ID is only used if ABI version >= 2. Initialize it with
+	 * garbage by default.
+	 */
+	vpu->inst_id = 0xdeadbeef;
+
 	/* Firmware version field does not exist on MT8173. */
 	if (vpu->ctx->dev->vdec_pdata->chip == MTK_MT8173)
 		return;
 
 	/* Check firmware version. */
-	mtk_vcodec_debug(vpu, "firmware version 0x%x\n", msg->vdec_abi_version);
-	switch (msg->vdec_abi_version) {
+	vpu->fw_abi_version = msg->vdec_abi_version;
+	mtk_vcodec_debug(vpu, "firmware version 0x%x\n", vpu->fw_abi_version);
+	switch (vpu->fw_abi_version) {
 	case 1:
 		break;
+	case 2:
+		vpu->inst_id = msg->inst_id;
+		break;
 	default:
 		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
-			       msg->vdec_abi_version);
+			       vpu->fw_abi_version);
 		vpu->failure = 1;
 		break;
 	}
@@ -113,7 +125,10 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 
 	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = msg_id;
-	msg.vpu_inst_addr = vpu->inst_addr;
+	if (vpu->fw_abi_version < 2)
+		msg.vpu_inst_addr = vpu->inst_addr;
+	else
+		msg.inst_id = vpu->inst_id;
 
 	err = vcodec_vpu_send_msg(vpu, &msg, sizeof(msg));
 	mtk_vcodec_debug(vpu, "- id=%X ret=%d", msg_id, err);
@@ -163,7 +178,10 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 
 	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = AP_IPIMSG_DEC_START;
-	msg.vpu_inst_addr = vpu->inst_addr;
+	if (vpu->fw_abi_version < 2)
+		msg.vpu_inst_addr = vpu->inst_addr;
+	else
+		msg.inst_id = vpu->inst_id;
 
 	for (i = 0; i < len; i++)
 		msg.data[i] = data[i];
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index 85224eb7e34b..c2ed5b6cab8b 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -18,6 +18,9 @@ struct mtk_vcodec_ctx;
  *                for control and info share
  * @failure     : VPU execution result status, 0: success, others: fail
  * @inst_addr	: VPU decoder instance address
+ * @fw_abi_version : ABI version of the firmware.
+ * @inst_id	: if fw_abi_version >= 2, contains the instance ID to be given
+ *                in place of inst_addr in messages.
  * @signaled    : 1 - Host has received ack message from VPU, 0 - not received
  * @ctx         : context for v4l2 layer integration
  * @dev		: platform device of VPU
@@ -29,6 +32,8 @@ struct vdec_vpu_inst {
 	void *vsi;
 	int32_t failure;
 	uint32_t inst_addr;
+	uint32_t fw_abi_version;
+	uint32_t inst_id;
 	unsigned int signaled;
 	struct mtk_vcodec_ctx *ctx;
 	wait_queue_head_t wq;
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
