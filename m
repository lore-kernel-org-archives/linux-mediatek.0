Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB0AC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 08:28:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73CE7206C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 08:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Se8NtrnL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DMhNCLfE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73CE7206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgdHS1QIky0m2vZErLDHM2900DSLqXDfK4YXpOJ1Plk=; b=Se8NtrnLSmlhYW
	wGAVeWPyJB8HHjKyNoL2p3Qrm/jT//Oo9nMtuIPw7YSITZLMD/lNint3MZYJiOe8NDYshvSombAuq
	lghYGzDXn/4rnPZmoOybv7aI3YvQtpNPxghPQzc3WgaOd2sk+SyKTTaZjCRjgwJX88Sqq1gx+e4Bn
	4njszs02vpoOEQBZfljOhyOneGWqnstJABFl5gAopLZEaevTUoL8acStJQ879fdMVmfKx28LK0wZR
	MxcFOzIsU2ip4QNSOVVNlcjWkpXRoqN4VVYIepy0YVJ+SEto3OTAerZdmJCc8EL/k8QO/OfmrhpqI
	FcRt0bGR3/et4vILeMFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbK5G-0002is-4j; Wed, 20 May 2020 08:28:14 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbK4y-0002V0-PO
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 08:28:12 +0000
Received: by mail-pl1-x642.google.com with SMTP id m7so1024300plt.5
 for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2020 01:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y+8eNewBsXZJc60V3E/q/FW32E3cUEWT1BvYpjSBhUo=;
 b=DMhNCLfEDrDLgMLwU76zAF6e3ckXRQWQQ+5A5ODxvR04JcuL+CpFAL0NrMojrJBYTI
 BMxZsVlSVH9/v8XTcTr47ldDCI1sg6onhP5Fxl9iChzd6cXtMSQfXwR+9vLVipThCuJn
 Emes0RJhDfeQrnJzzNAjiDFEFJWQxqPFFxr5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y+8eNewBsXZJc60V3E/q/FW32E3cUEWT1BvYpjSBhUo=;
 b=LVHJvwGPmT8qufs7MRxFwrANKiusQMAHwXRocvEUbaM6/bpCCC3ozVbjV72+V2mkzY
 2VScPmJHtD5J0iq4rbigB+HJ6RzhOCrtrh5cTyJGVxX23P2VSmNt40wPzogAX+7Y3eHU
 OHIF5l+4lS66u/jFirrE5TYottQKII49NtcSFdwZRRdWfxA/xnw8UqaazyuuSYwY8ueR
 cSaaIvjxcW5UcroHpFBhvU4B15hg7I3LG6Yo/8hi0IJa9K7KA6Ayi6xA+3rBLgthzIWF
 BlcDd7Yrg5VFlazrnlyGxUjYEvoFF5k9BKgUG52roPaR+ITsuf5qVWCXI+nJEu6bUdMt
 3mNg==
X-Gm-Message-State: AOAM533fy73NtwxibwzhNg+CLNWb0n5QXxarWsJTNIgZ7u+lt78B51Q1
 7BF5u5VN2+b8bd4OdhEo042TmLYUcfJ7IA==
X-Google-Smtp-Source: ABdhPJwmEIh+IVpXwAkL9L48f5LyrS5lTD2flWdhA+4+MshBuJ7AdRa5G6VqU1WNUSyN9onU36enBg==
X-Received: by 2002:a17:90b:80f:: with SMTP id
 bk15mr4108160pjb.51.1589963275724; 
 Wed, 20 May 2020 01:27:55 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id gg8sm1447775pjb.39.2020.05.20.01.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 01:27:55 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH 04/10] media: mtk-vcodec: venc: handle firmware version field
Date: Wed, 20 May 2020 17:27:17 +0900
Message-Id: <20200520082723.96136-5-acourbot@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
In-Reply-To: <20200520082723.96136-1-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_012756_837430_CF9C9C16 
X-CRM114-Status: GOOD (  15.91  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Firmwares for encoders newer than MT8173 will include an ABI version
number in their initialization ack message. Add the capacity to manage
it and make initialization fail if the firmware ABI is of a version that
we don't support.

For MT8173, this ABI version field is reserved and thus undefined ; thus
ignore it on this chip. There should only be one firmware version available
for it anyway.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  8 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  1 +
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  |  9 ++++---
 .../media/platform/mtk-vcodec/venc_vpu_if.c   | 27 ++++++++++++++++---
 4 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 45c8adfc6a0c..e7b155e7432e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -300,13 +300,21 @@ struct mtk_vcodec_ctx {
 
 };
 
+enum mtk_chip {
+	MTK_MT8173,
+};
+
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
  *
+ * @chip: chip this encoder is compatible with
+ *
  * @uses_ext: whether the encoder uses the extended firmware messaging format
  * @has_lt_irq: whether the encoder uses the LT irq
  */
 struct mtk_vcodec_enc_pdata {
+	enum mtk_chip chip;
+
 	bool uses_ext;
 	bool has_lt_irq;
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 922bc8883811..c1365209263e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -378,6 +378,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
+	.chip = MTK_MT8173,
 	.has_lt_irq = true,
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
index 4cafbf92d9cd..31a3c76f7d0d 100644
--- a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
@@ -131,16 +131,17 @@ struct venc_vpu_ipi_msg_common {
  * @venc_inst:	AP encoder instance (struct venc_vp8_inst/venc_h264_inst *)
  * @vpu_inst_addr:	VPU encoder instance addr
  *			(struct venc_vp8_vsi/venc_h264_vsi *)
- * @reserved:	reserved for future use. vpu is running in 32bit. Without
- *		this reserved field, if kernel run in 64bit. this struct size
- *		will be different between kernel and vpu
+ * @venc_abi_version:	ABI version of the firmware. Kernel can use it to
+ *			ensure that it is compatible with the firmware.
+ *			For MT8173 the value of this field is undefined and
+ *			should not be used.
  */
 struct venc_vpu_ipi_msg_init {
 	uint32_t msg_id;
 	uint32_t status;
 	uint64_t venc_inst;
 	uint32_t vpu_inst_addr;
-	uint32_t reserved;
+	uint32_t venc_abi_version;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index 6c77bf025172..472503701003 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -4,6 +4,7 @@
  * Author: PoChun Lin <pochun.lin@mediatek.com>
  */
 
+#include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_fw.h"
 #include "venc_ipi_msg.h"
 #include "venc_vpu_if.h"
@@ -15,6 +16,23 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 	vpu->inst_addr = msg->vpu_inst_addr;
 	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
 					     msg->vpu_inst_addr);
+
+	/* Firmware version field value is unspecified on MT8173. */
+	if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
+		return;
+
+	/* Check firmware version. */
+	mtk_vcodec_debug(vpu, "firmware version: 0x%x\n",
+			 msg->venc_abi_version);
+	switch (msg->venc_abi_version) {
+	case 1:
+		break;
+	default:
+		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
+			       msg->venc_abi_version);
+		vpu->failure = 1;
+		break;
+	}
 }
 
 static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
@@ -35,6 +53,11 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
 	mtk_vcodec_debug(vpu, "msg_id %x inst %p status %d",
 			 msg->msg_id, vpu, msg->status);
 
+	vpu->signaled = 1;
+	vpu->failure = (msg->status != VENC_IPI_MSG_STATUS_OK);
+	if (vpu->failure)
+		goto failure;
+
 	switch (msg->msg_id) {
 	case VPU_IPIMSG_ENC_INIT_DONE:
 		handle_enc_init_msg(vpu, data);
@@ -51,9 +74,7 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
 		break;
 	}
 
-	vpu->signaled = 1;
-	vpu->failure = (msg->status != VENC_IPI_MSG_STATUS_OK);
-
+failure:
 	mtk_vcodec_debug_leave(vpu);
 }
 
-- 
2.26.2.761.g0e0b3e54be-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
