Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE7CC001B0
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jul 2023 07:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+HorF4LeKiLNz5w8pGzA0k69aZAzTVqZHElBYNhWvo=; b=1/T0kXLuBdo3YQl0SnKkIH7Gxd
	IvGphL1xd4JecX3k6QZhKuHCj5BDiPxcKI/zW5hyJj8y+VxvoWZToB5/4E/E+qpnyr5iy8jFYbqYt
	wLYLcSuH5c6T6btTOI8KBh3/wyUwcZAo11B6fnU+UAgOtdWCAVFDECDPybFUGVtw5iS4FqXKn97Xw
	oAbfrkgf8gaIIqI49RrkG/9R0TF+3E4uA2zrfPMXrGn9rT6GJg8s06M5L33CY0b0AQsSfqiuLOufv
	w6jYopRrpxrRJips18hlLqtinJvXyUOVDEX/ocl4J1HGvh6IJy2qwQzBtNUF70wbZxQnAZTzFao7X
	3vqwgNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN7Jk-00G4Hb-2V;
	Sat, 22 Jul 2023 07:46:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN7Ji-00G4GP-0K;
	Sat, 22 Jul 2023 07:46:19 +0000
X-UUID: d5d79758286311ee83ed1395ce914268-20230722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=U+HorF4LeKiLNz5w8pGzA0k69aZAzTVqZHElBYNhWvo=;
	b=iUzGZi4uncpLY3oFRUPn9gltfFjZ8f0S/nUCZ4p0nMIZs2BQmv3WMPFFWFBlg7+FppQoGEGomHxqgH2yhWxWEZTXkba05eoNK+cosGmK4QZw809gQ90lJuUeKpTsqpwhe2jF8BbPT5az0JuOJzTRHMlXaecXiWnzlWdLuINvbLY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:e923ccdd-fe76-4b2e-87bc-d0a63d8e2449,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.28,REQID:e923ccdd-fe76-4b2e-87bc-d0a63d8e2449,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:176cd25,CLOUDID:aa2ee987-44fb-401c-8de7-6a5572f1f5d5,B
	ulkID:230722154617T0LF8V6P,BulkQuantity:0,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: d5d79758286311ee83ed1395ce914268-20230722
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 292381845; Sat, 22 Jul 2023 00:46:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 22 Jul 2023 15:46:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 22 Jul 2023 15:46:11 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,2/2] media: mediatek: vcodec: checking encoder ack message parameter
Date: Sat, 22 Jul 2023 15:46:08 +0800
Message-ID: <20230722074608.30766-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230722074608.30766-1-yunfei.dong@mediatek.com>
References: <20230722074608.30766-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_004618_142962_D2344830 
X-CRM114-Status: GOOD (  15.42  )
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

Need to checking all parameters of msg data are valid or not,
in case of access null pointer or unreasonable value leading
to kernel reboot.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  2 +
 .../mediatek/vcodec/encoder/venc_vpu_if.c     | 40 +++++++++++++++++--
 2 files changed, 38 insertions(+), 4 deletions(-)

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
index 708db1bb32d4..213544e55166 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -42,19 +42,47 @@ static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
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
 
 	mtk_venc_debug(vpu->ctx, "msg_id %x inst %p status %d", msg->msg_id, vpu, msg->status);
 
-	vpu->signaled = 1;
+	enc_dev = (struct mtk_vcodec_enc_dev *)priv;
+	vpu = (struct venc_vpu_inst *)(unsigned long)msg->venc_inst;
+	if (!priv || !vpu) {
+		mtk_v4l2_venc_err(vpu->ctx, "venc_inst is NULL, did the SCP hang or crash?");
+		return;
+	}
+
+	if (!vpu_enc_check_ap_inst(enc_dev, vpu) || msg->msg_id < VPU_IPIMSG_ENC_INIT_DONE ||
+	    msg->msg_id > VPU_IPIMSG_ENC_DEINIT_DONE) {
+		mtk_v4l2_venc_err(vpu->ctx, "venc msg id not correctly => 0x%x", msg->msg_id);
+		vpu->failure = -EINVAL;
+		goto error;
+	}
+
 	vpu->failure = (msg->status != VENC_IPI_MSG_STATUS_OK);
 	if (vpu->failure) {
 		mtk_venc_err(vpu->ctx, "vpu enc status failure %d", vpu->failure);
-		return;
+		goto error;
 	}
 
 	switch (msg->msg_id) {
@@ -72,6 +100,9 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
 		mtk_venc_err(vpu->ctx, "unknown msg id %x", msg->msg_id);
 		break;
 	}
+
+error:
+	vpu->signaled = 1;
 }
 
 static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
@@ -105,6 +136,7 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	init_waitqueue_head(&vpu->wq_hd);
 	vpu->signaled = 0;
 	vpu->failure = 0;
+	vpu->ctx->vpu_inst = vpu;
 
 	status = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
 					    vpu_enc_ipi_handler, "venc", NULL);
-- 
2.18.0


