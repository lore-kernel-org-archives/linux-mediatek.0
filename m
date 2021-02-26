Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACCDC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 505DB64ED5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 505DB64ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4IIYmpsmycKnXJcL1a3m2kmdfRZalPUQagADudtQWik=; b=f/iWjpIuf4He96ZHNgpCS6Czy
	t3Ur9MjgyopiPRjV9RweVvD45TnGk3njgMft1o2NzDLKgNru/yAc50GJ3m7lDYBITo9wHfDU1TYsj
	BbTba3cm0nX/m/K6FjJYHQzGzsX7n/Aa69qGwmFn9jEfP98RkjqJHnYfuDdQBRNJe0e3R14UJOPJP
	YXs7uoico+jbt4TxB9YVdaSQBVdzgMSt4OWQrIFJXTHdLuIbSTKk3mNgrfLeyaxMo7DnDbKfyjIkA
	VR1jCH4yMTrD2qAmLyvUl+JHch3Kk5Hnowv86luP4/r+gN6CYmXuTkupdWIVxi2HGnLcEuQZWLUas
	S0um1zraQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFZws-0007ov-UZ; Fri, 26 Feb 2021 10:02:14 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZwo-0007mc-VX
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 10:02:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id m6so5946504pfk.1
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Feb 2021 02:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yzGEjvqj/0fKB6OqosvzGQ5tFId/31zjF4xyWt3jXBc=;
 b=mJwCdFpPLnpx4nHUJGkikSZxf9/LAmQxurt4pzp7FWHx1/PCS4/D818SG/PVXbOXPN
 xLjv67R+Od9zqmkC93/mPd8qpWRT2178YWOJBwGfzdFKyrZe4X0AaaphiCeFmF1/a/bh
 pJuT9455SZA6KIn4sKHxpJab2iYZHGmO/W/lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yzGEjvqj/0fKB6OqosvzGQ5tFId/31zjF4xyWt3jXBc=;
 b=jbKngJcxjBhhJoYRfo9Gn7VmkPZ7XQKOFC2f20jrpqIYUtJDntQc9rfblCxzo26DZN
 dYTH8TjmaRYcRGR9PPJPVxObfxPmpMZWS2TPvvZZfnuO6P9nxHqCPoSsCtlFuaa32AZa
 E033ZX4Kebq5APFVXA3D90kcIDkY0mzo0D2TztXWvRRp7vKVYWS0ngT3W5AB3esQFXQi
 tvXY1akNWM7hW7x3xuG8/JZo/sIO01lp3OqKGviJLgG7vls0gDbFlmxrUEq3lVP79nTS
 7xGCZmEqF3J4JPe41ekwq+qx4Ay6Kl8GNT5YHwcYAck7JDGYWNwemsaTrRN8DDfkNsHJ
 EMlw==
X-Gm-Message-State: AOAM530zI+cpI6KvvkejDLKzX9ItgyALbnTUfMzkWnAtT8rqP6nl9zGY
 O7yyAEREKa37XeBfYjW/Ljmfmg==
X-Google-Smtp-Source: ABdhPJzNlq1IhBAKdl/zqY9D6YTjHl35BKCDIlx7Jga3/mDv+G4JIAcN//GRrcYuT/xl7Ou64gk+Jw==
X-Received: by 2002:a62:144f:0:b029:1ed:9646:736a with SMTP id
 76-20020a62144f0000b02901ed9646736amr2629458pfu.81.1614333728689; 
 Fri, 26 Feb 2021 02:02:08 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
 by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 02:02:08 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v3 03/15] media: mtk-vcodec: support version 2 of decoder
 firmware ABI
Date: Fri, 26 Feb 2021 19:01:36 +0900
Message-Id: <20210226100148.1663389-4-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_050211_044140_F76868A0 
X-CRM114-Status: GOOD (  19.60  )
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
Cc: Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
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
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
