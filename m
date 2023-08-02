Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601C9C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvUeVFDPb4EMGYbb53F91WRmcOa9itzlcYCTFvFRYc0=; b=kOW0+GxoLToicuu8FCsbu5eK88
	FSw+Y5QG/EzP15aG/K5cZkUDXnwMNnpeihi1uJV7xnshTF8yT6u7os3tuKYPUuIY8E6Ac4ugA4tfT
	tSmHHCUKgyHrEhVhC5xGJOvAVMqmk5f1dqBEW6SwRRj75kMqp/Pw7negZ9WHoHEkBmFA6l2c30m8i
	UyN2qwabR8WA0Pv875/Zw2FK0pV4wjsk/4x+CsjpYQNVr+KrUr9wJpDOqhUYEeCj0G0lYB++QnuGh
	nI6PezOVADm2NC9SkdvX4iLmnJcNI3Isq3DcIhV4GGCNpRnYR+5ggSH9wYjTVb1mAN5pzWHJEH1Z+
	/l+OjjiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDF1-0058XH-1K;
	Wed, 02 Aug 2023 14:54:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDEy-0058WQ-0g;
	Wed, 02 Aug 2023 14:54:21 +0000
X-UUID: 713ebfda314411ee912e1518a6540028-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WvUeVFDPb4EMGYbb53F91WRmcOa9itzlcYCTFvFRYc0=;
	b=BFjldis3sw6qPYpI46hV4kYF3sxOaAoMzOewVRZY428Hsp5+bwY8oBMycGo6UzyjL7dHa4/Cp0yZC894yLuwCaTuNQKfEgTjK6D1bntBYXixl+JqVr9YL2KTiMUTYlSBozehR/r2fyWSqaEewi7G2Lq2tHBhFshA9u6GSIdJwfM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:a2f30739-1609-43cd-a1c8-15d5b91763d0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:1fcc6f8,CLOUDID:5606be42-d291-4e62-b539-43d7d78362ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 713ebfda314411ee912e1518a6540028-20230802
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 553897765; Wed, 02 Aug 2023 07:54:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Aug 2023 22:53:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Aug 2023 22:53:05 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, "Steve
 Cho" <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,2/2] media: mediatek: vcodec: Fix possible invalid memory access for encoder
Date: Wed, 2 Aug 2023 22:53:02 +0800
Message-ID: <20230802145303.28765-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802145303.28765-1-yunfei.dong@mediatek.com>
References: <20230802145303.28765-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_075420_253951_5771392B 
X-CRM114-Status: GOOD (  16.77  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The vpu maybe null pointer or unreasonable value when scp crash, need to
validate that the vpu pointer and the vpu instance within this context is
valid in case of leading to kernel reboot.

Fixes: 27a274db6b4c6 ("[media] vcodec: mediatek: Add Mediatek VP8 Video Encoder Driver")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reported-by: Steve Cho <stevecho@google.com>
---
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  2 +
 .../mediatek/vcodec/encoder/venc_vpu_if.c     | 39 +++++++++++++++++--
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index c07010e56649..a042f607ed8d 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -123,6 +123,7 @@ struct mtk_enc_params {
  * @xfer_func: enum v4l2_xfer_func, colorspace transfer function
  *
  * @q_mutex: vb2_queue mutex.
+ * @vpu_inst: vpu instance pointer.
  */
 struct mtk_vcodec_enc_ctx {
 	enum mtk_instance_type type;
@@ -156,6 +157,7 @@ struct mtk_vcodec_enc_ctx {
 	enum v4l2_xfer_func xfer_func;
 
 	struct mutex q_mutex;
+	void *vpu_inst;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 708db1bb32d4..d299cc2962a5 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -42,19 +42,46 @@ static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
 	vpu->is_key_frm = msg->is_key_frm;
 }
 
+static bool vpu_enc_check_ap_inst(struct mtk_vcodec_enc_dev *enc_dev, struct venc_vpu_inst *vpu)
+{
+	struct mtk_vcodec_enc_ctx *ctx;
+	int ret = false;
+
+	list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
+		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst == vpu) {
+			ret = true;
+			break;
+		}
+	}
+
+	return ret;
+}
+
 static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
 {
+	struct mtk_vcodec_enc_dev *enc_dev;
 	const struct venc_vpu_ipi_msg_common *msg = data;
-	struct venc_vpu_inst *vpu =
-		(struct venc_vpu_inst *)(unsigned long)msg->venc_inst;
+	struct venc_vpu_inst *vpu;
+
+	enc_dev = (struct mtk_vcodec_enc_dev *)priv;
+	vpu = (struct venc_vpu_inst *)(unsigned long)msg->venc_inst;
+	if (!priv || !vpu) {
+		pr_err(MTK_DBG_V4L2_STR "venc_inst is NULL, did the SCP hang or crash?");
+		return;
+	}
 
 	mtk_venc_debug(vpu->ctx, "msg_id %x inst %p status %d", msg->msg_id, vpu, msg->status);
+	if (!vpu_enc_check_ap_inst(enc_dev, vpu) || msg->msg_id < VPU_IPIMSG_ENC_INIT_DONE ||
+	    msg->msg_id > VPU_IPIMSG_ENC_DEINIT_DONE) {
+		mtk_v4l2_venc_err(vpu->ctx, "venc msg id not correctly => 0x%x", msg->msg_id);
+		vpu->failure = -EINVAL;
+		goto error;
+	}
 
-	vpu->signaled = 1;
 	vpu->failure = (msg->status != VENC_IPI_MSG_STATUS_OK);
 	if (vpu->failure) {
 		mtk_venc_err(vpu->ctx, "vpu enc status failure %d", vpu->failure);
-		return;
+		goto error;
 	}
 
 	switch (msg->msg_id) {
@@ -72,6 +99,9 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
 		mtk_venc_err(vpu->ctx, "unknown msg id %x", msg->msg_id);
 		break;
 	}
+
+error:
+	vpu->signaled = 1;
 }
 
 static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
@@ -105,6 +135,7 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	init_waitqueue_head(&vpu->wq_hd);
 	vpu->signaled = 0;
 	vpu->failure = 0;
+	vpu->ctx->vpu_inst = vpu;
 
 	status = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
 					    vpu_enc_ipi_handler, "venc", NULL);
-- 
2.18.0


