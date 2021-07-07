Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29F4C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:35:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE34A61CB3
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE34A61CB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqSMcBBLbaTO/wZsaXGhZrW2isdJueIliHE80U6sXo8=; b=mqI2v1wgt7d6z/
	c3OYf5XtmlIOrFkgZzqQ4pwf78c6ChtpJNTbfbP9u4LiQMSRzw1t3xgw3xIk1jFdjAzoEtRpAZE4c
	Iz7mD6YkF6lucAF/gpUyQ1u4xJ6BsjJWPMMDJZEm2ep8GJuNyFsA/Mf0wZdYEt1b+tUqYJO3pWSA5
	v2fOgGczP1+Jj5IAC7ct5WdBsW3nF3z8Q90nr90WRfueJYTbxKrO0L5Xe8wKlZEu4Wixoq1UmT9B4
	9aILmna7AhgoQQc9Bs+7aQtN3KkZ22B60mxlFBL27f3PLPIRFFrnvVRZW8pq08/3I7Z0OJyhXZnce
	FwzkKejYUJ+LjbfQkF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m119I-00Dgy4-1o; Wed, 07 Jul 2021 06:35:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m116n-00Dfid-5w; Wed, 07 Jul 2021 06:32:35 +0000
X-UUID: 8e340ed2ecfe469081f64b9470a08f6a-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pDdTr18SYPpaCqd39PltB+kC/0f0GBYFe5TvXYdnvY0=; 
 b=R9LGxhTqlbxeTTV+MW/Ct5T0MTLhur4n/0nY9YbPJZ3QGx4RIBFQ1nmwgvE+j0hENSYAtZ55lZMpc/4LDEingRBqBbxr+4/0+DOpjkUcmTBJOK755ThJoEn2h2NpDT1pDYn5Ab3ywUYJ+bBPJAXeDL2ALpGXd8rLEAd1tkIBqUw=;
X-UUID: 8e340ed2ecfe469081f64b9470a08f6a-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1781505125; Tue, 06 Jul 2021 23:32:28 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 23:22:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:33 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:33 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1,
 14/14] media: mtk-vcodec: Use codec type to separate different
 hardware
Date: Wed, 7 Jul 2021 14:21:57 +0800
Message-ID: <20210707062157.21176-15-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707062157.21176-1-yunfei.dong@mediatek.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_233233_313823_B0DE4078 
X-CRM114-Status: GOOD (  19.66  )
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

There are just one core thread, in order to separeate different
hardware, using codec type to separeate it in scp driver.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 12 ++++---
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 34 ++++++++++++++++---
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  4 +++
 3 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 9d8079c4f976..c488f0c40190 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -35,6 +35,8 @@ enum vdec_ipi_msgid {
  * @msg_id	: vdec_ipi_msgid
  * @vpu_inst_addr : VPU decoder instance address. Used if ABI version < 2.
  * @inst_id     : instance ID. Used if the ABI version >= 2.
+ * @codec_type	: Codec fourcc
+ * @reserved	: reserved param
  */
 struct vdec_ap_ipi_cmd {
 	uint32_t msg_id;
@@ -42,6 +44,8 @@ struct vdec_ap_ipi_cmd {
 		uint32_t vpu_inst_addr;
 		uint32_t inst_id;
 	};
+	uint32_t codec_type;
+	uint32_t reserved;
 };
 
 /**
@@ -59,12 +63,12 @@ struct vdec_vpu_ipi_ack {
 /**
  * struct vdec_ap_ipi_init - for AP_IPIMSG_DEC_INIT
  * @msg_id	: AP_IPIMSG_DEC_INIT
- * @reserved	: Reserved field
+ * @codec_type	: Codec fourcc
  * @ap_inst_addr	: AP video decoder instance address
  */
 struct vdec_ap_ipi_init {
 	uint32_t msg_id;
-	uint32_t reserved;
+	uint32_t codec_type;
 	uint64_t ap_inst_addr;
 };
 
@@ -77,7 +81,7 @@ struct vdec_ap_ipi_init {
  *	H264 decoder [0]:buf_sz [1]:nal_start
  *	VP8 decoder  [0]:width/height
  *	VP9 decoder  [0]:profile, [1][2] width/height
- * @reserved	: Reserved field
+ * @codec_type	: Codec fourcc
  */
 struct vdec_ap_ipi_dec_start {
 	uint32_t msg_id;
@@ -86,7 +90,7 @@ struct vdec_ap_ipi_dec_start {
 		uint32_t inst_id;
 	};
 	uint32_t data[3];
-	uint32_t reserved;
+	uint32_t codec_type;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index bfd8e87dceff..c84fac52fe26 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -100,18 +100,29 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 
 static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 {
-	int err;
+	int err, id, msgid;
 
-	mtk_vcodec_debug(vpu, "id=%X", *(uint32_t *)msg);
+	msgid = *(uint32_t *)msg;
+	mtk_vcodec_debug(vpu, "id=%X", msgid);
 
 	vpu->failure = 0;
 	vpu->signaled = 0;
 
-	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, vpu->id, msg,
+	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
+		if (msgid == AP_IPIMSG_DEC_CORE ||
+			msgid == AP_IPIMSG_DEC_CORE_END)
+			id = vpu->core_id;
+		else
+			id = vpu->id;
+	} else {
+		id = vpu->id;
+	}
+
+	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, id, msg,
 				     len, 2000);
 	if (err) {
 		mtk_vcodec_err(vpu, "send fail vpu_id=%d msg_id=%X status=%d",
-			       vpu->id, *(uint32_t *)msg, err);
+			       id, msgid, err);
 		return err;
 	}
 
@@ -131,6 +142,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 		msg.vpu_inst_addr = vpu->inst_addr;
 	else
 		msg.inst_id = vpu->inst_id;
+	msg.codec_type = vpu->codec_type;
 
 	err = vcodec_vpu_send_msg(vpu, &msg, sizeof(msg));
 	mtk_vcodec_debug(vpu, "- id=%X ret=%d", msg_id, err);
@@ -149,14 +161,25 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 
 	err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
 					 vpu->handler, "vdec", NULL);
-	if (err != 0) {
+	if (err) {
 		mtk_vcodec_err(vpu, "vpu_ipi_register fail status=%d", err);
 		return err;
 	}
 
+	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
+		err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
+					 vpu->core_id, vpu->handler,
+					 "vdec", NULL);
+		if (err) {
+			mtk_vcodec_err(vpu, "vpu_ipi_register core fail status=%d", err);
+			return err;
+		}
+	}
+
 	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = AP_IPIMSG_DEC_INIT;
 	msg.ap_inst_addr = (unsigned long)vpu;
+	msg.codec_type = vpu->codec_type;
 
 	mtk_vcodec_debug(vpu, "vdec_inst=%p", vpu);
 
@@ -187,6 +210,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 
 	for (i = 0; i < len; i++)
 		msg.data[i] = data[i];
+	msg.codec_type = vpu->codec_type;
 
 	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
 	mtk_vcodec_debug(vpu, "- ret=%d", err);
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index ae24b75d1649..802660770a87 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -14,6 +14,7 @@ struct mtk_vcodec_ctx;
 /**
  * struct vdec_vpu_inst - VPU instance for video codec
  * @id          : ipi msg id for each decoder
+ * @core_id     : core id used to separate different hardware
  * @vsi         : driver structure allocated by VPU side and shared to AP side
  *                for control and info share
  * @failure     : VPU execution result status, 0: success, others: fail
@@ -26,9 +27,11 @@ struct mtk_vcodec_ctx;
  * @dev		: platform device of VPU
  * @wq          : wait queue to wait VPU message ack
  * @handler     : ipi handler for each decoder
+ * @codec_type     : used codec type to separate different codecs
  */
 struct vdec_vpu_inst {
 	int id;
+	int core_id;
 	void *vsi;
 	int32_t failure;
 	uint32_t inst_addr;
@@ -38,6 +41,7 @@ struct vdec_vpu_inst {
 	struct mtk_vcodec_ctx *ctx;
 	wait_queue_head_t wq;
 	mtk_vcodec_ipi_handler handler;
+	unsigned int codec_type;
 };
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
