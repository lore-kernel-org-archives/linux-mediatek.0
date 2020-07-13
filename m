Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94341C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 665662068F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SCjfEv9T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gwi7NMPo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 665662068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QkzU3mC/NG4ZMtHTGIVYulkXYFs7abIR0W0whOXPbB4=; b=SCjfEv9TWIghiY37Ss54PUIxD
	JtnwhkoU5ro/RZkR6Ex6qXBgHWPyRLmjqmbNFDkvWSfWP/egEdcAc6VNJkEs6ON0oicCjD3V9BNRX
	ykVZtcxCxSx5gq7ThmfcNnshHpIM8e89RxGuZuoNmE2P8bX+XFabep/x0VA6toqzlkViFDV5Vr3zV
	vKYjirG8SPhpkpHrT++ydZxXHDO4u6LbzJcrDxlbK1FSC8xMEZmJASDlQAA7K0XJXZdnadRLgPVtC
	uXsYZdrbtBB2It/6knBcxpap5KqcsAUlhgOX7nb6UED/niv6VUIB2R2XmY8wTsDmNXJun0hE4ncVl
	/E+taReLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jureb-0000Q9-N8; Mon, 13 Jul 2020 06:09:29 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jureZ-0000OW-FT
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 06:09:28 +0000
Received: by mail-pg1-x543.google.com with SMTP id l63so5564772pge.12
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 23:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XKFNOxhocAfWz9PkYcbxt2H0/xDypTKMLAV5ERewKY=;
 b=gwi7NMPoK6HvtnoRfRqUmipRFPVzx2jmnB4a+vb6lTkSpv0J8vgdI74tWkzmlAZ4Kt
 uGU9dnhgL4ZH5QMoNPwq8joP1pNAa6nnjApUDCM7yxWbXmBS0MHh3RTOkPU/Fo/zaYrG
 Oxild8VPE6FQ7hYTiW6fYXpXXh/PYbv0WMIw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XKFNOxhocAfWz9PkYcbxt2H0/xDypTKMLAV5ERewKY=;
 b=FeV9Dzi8SwJSh0PI7PupBGyCD1ykCiHZ07sU4KdPNQ52RtSwQaoHz/wbG9VaPk5oe/
 4h9J0NIa5Ti9wr7eEGuS9bB3vZVXzfBieL/nFVPIozkUzuc2KMHRLPE+nI829WBoo1sy
 Yla85eoPnVymywtMPzERPmTHgnqyAj3g0muyXHgDPqtKxFivE3kK7AICF1o8w/eUr1HH
 8tfmGDxe6Voi8uGCohhkTha2GGBUlNk4AC1v8Oj5D0BBLXfMrKWZFBJFlGOH6UYtfScf
 02WLxyTZWPK6KXbYh4zoWpZkB4OvS8N3IimcK6vIXLW52IBOveSfEDZCLtQSqlWKScmW
 iOMg==
X-Gm-Message-State: AOAM531dY6Fb7x32fxnclQX5YgyR1oXMa7wfEN3L/enuGcco0Y7vI5nK
 3usjLuoDSQi1GGdUIRHpbw9hmA==
X-Google-Smtp-Source: ABdhPJxKCOG9CyNv/lGl0TYSaQg/dbaGIRy9BN9vt6Bh210MLYkBml9Selj2XzQGRyOBPBXbQvezYA==
X-Received: by 2002:a62:de81:: with SMTP id
 h123mr72836119pfg.217.1594620565458; 
 Sun, 12 Jul 2020 23:09:25 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:09:24 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v3 05/16] media: mtk-vcodec: venc: handle firmware version
 field
Date: Mon, 13 Jul 2020 15:08:31 +0900
Message-Id: <20200713060842.471356-6-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_020927_860990_27E2BDC5 
X-CRM114-Status: GOOD (  18.28  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
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
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
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
2.27.0.383.g050319c2ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
