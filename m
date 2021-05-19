Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5DAC43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C43316135A
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C43316135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KslH1bzqYOXthvFK7KqsBO69PG2DrNnQEBUje5Mbjn8=; b=YFRn5/wUDDRRWRGSuzUo2GofX
	RPLrKOVtxxKVBUMJR6urjj7Vt8g45+aLGxu4G37ac9Ce68in6CoCbEfNFECuVtMna0BShysrOe86f
	n8OUDv/Uqk7vBLpRdsijdwUA292Gbg/QjtBoO7aqqgmpNgQxoRMiuvdIFn2KaY6d0DByreMx0i2PS
	+SYJ+aCghFDCPmiZJILS72oQkPY/wpLY4tnx59WYAw/hSoRHIofe+VJ4EPPlpYyxvkeFcaZC/W4dH
	sirctTVLzxLRleFxz+1WkN4Pv0d/pf3Uq9jruaA1z+xZb4xSROLSYqzQtwe9nBMhPBiv1GHh6g/d2
	obvMgNs2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljNEA-004Gni-2V; Wed, 19 May 2021 14:31:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNDz-004GjF-VD
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 14:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JgArL14ajRohcXyEiSMLAcJTXjckPVSt3YXRJ5CcQT0=; b=rPYwnWq8/pxNJQQYipx5aMFKz0
 iNbzZe3DkuEG/v7txVjkn5GeS1zKZW21v6d/zSqi2+fItWzQrxiawWo+wNViFn2/cAISOx6E0IDZ7
 B7BTnE0Qz+MVkkLEwMhDARX88WUytwLNJy+CW+gYf2VfDx9MzqRgRZRPcr9+1C2jUSSn2BT1hgWQI
 2rFPpKa63tS73I/IodPuu3tv1O1e0sPDY0f/pC8XKD9h1XrGxaJEsIUuO1YEWL3odlvhOfkIm3Lrq
 NFPaLEJbSYCAuV31r1X4I2mMMMRN+H/YMPYlKY4a6juT7vmYoS9ueomTC3JPJG01HP3qygjFnv0+F
 dH+a98dg==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNDw-00FXs4-Qp
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 14:31:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 h20-20020a17090aa894b029015db8f3969eso2890509pjq.3
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JgArL14ajRohcXyEiSMLAcJTXjckPVSt3YXRJ5CcQT0=;
 b=O2x2XX659CHop9jQ1XLZ2F7l4dUpo1vfAH8BGQ7YltWd0dgLEDPR6a8rDZ8dAAuvcP
 QgP+jw4Mlldurx9XU0M8zwRRhtUueoi5pTIES9lATeYB27ESpdiolDORltTru0qqyxfq
 sz92Ua3FGvMIDoU2P7kikdSJerJxza6HSsuws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JgArL14ajRohcXyEiSMLAcJTXjckPVSt3YXRJ5CcQT0=;
 b=aaoHIlpM7GBnsVaVqCtyRaJ9dieZY5TtHqXWjqzH6lQrLRUYV7DHcKHL9bPiFUkPjN
 tx/5Y72Zho5781MjX1faHTJt/c4UaYxn2DQtHeGZQABKckCuPBjJ0zLiWtJwPeQs7hSR
 v8jE/XYVPd21ftl2RyWJfyPTzl23M7IyEoi4qWtytK/bLTFHM5lPJE8FpnO8SUDjYq+A
 iC153v4ox2yU7gvAjmHOEw37K9IMzWp19CWBOO3KhDm2SDHSBQzXtsluRMbChjcl7B6v
 p5F3qjAV9cOK5QvXYNAfNiqVj/u6/3traSuhbTzg8+ThAWXGs8KKM+TrYok5misqtFBH
 qaDg==
X-Gm-Message-State: AOAM530+g7FUzP4YKAATT1Z6BQ12j9jwd40XRCyHj35adX6tJX64qQ/z
 3w4X+dMr4dMDOs8Jn/L3cU8xjA==
X-Google-Smtp-Source: ABdhPJz2wsEQm6AwEkiR2+lDZE+gXkVPqSokD1+NxXypXy3REtzrfBqb7EKAgYK4U6jhOsbdfX9/aw==
X-Received: by 2002:a17:90b:a18:: with SMTP id
 gg24mr11373887pjb.188.1621434660381; 
 Wed, 19 May 2021 07:31:00 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:87ab:ff82:1544:697])
 by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:31:00 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 08/14] media: mtk-vcodec: support version 2 of decoder
 firmware ABI
Date: Wed, 19 May 2021 23:30:05 +0900
Message-Id: <20210519143011.1175546-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_073100_901766_ED3B64F8 
X-CRM114-Status: GOOD (  20.88  )
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
---
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 18 +++++++++---
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 28 +++++++++++++++----
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  5 ++++
 3 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index eb66729fda63..a0e773ae3ab3 100644
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
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
