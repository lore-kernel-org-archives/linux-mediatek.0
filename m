Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2F5C001DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cpoHbY7586Mt5hnPOEQJpg1iUMg9V8SaW0q/DtbqEa4=; b=T4Wx+Kd0ffN5kGD/DApC4MI33s
	jCzkhr68FzvOxkjAYxCyqNsAV7rnFgvJjVW9gUGSODl203xp+M6unCJhpwLFJ5FbnSEXTBHTWVqjE
	D6/aqO+db6M/RhIQDKIrlRjXYptWLOnYOW4vv5wvtf0AHSTxZk+cU/qhCnyqi9CSKkV6cSJfQh2Ve
	qUNSDc79E1tovT5/PZ+88A88V111pvd2GwzC1xdlF8H3y6b6O4EEn0A+B7welnO839P+MJlTBl9+s
	X/8FWHq2oX5b5f9WmJEPznEWVVAYPajipDHToHlcsWB9BOwMlS3Oxh2YMiYK5W2pRThcA2HtkjVWb
	4pSl+Fmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDXn-005CAB-2E;
	Wed, 02 Aug 2023 15:13:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDXl-005C9a-2I;
	Wed, 02 Aug 2023 15:13:47 +0000
X-UUID: 2b2bd232314711ee83ed1395ce914268-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cpoHbY7586Mt5hnPOEQJpg1iUMg9V8SaW0q/DtbqEa4=;
	b=su+0smTLiHa6oiM/LuNLy+gKtgzfieZ9VQv2wgKRmyHwG7KlhDg8tvrKqMG24tRpc4I5b4lQARJ0/reFFk9P7qT96GyveArpZfEuY3EZgbAEkMAjnZoJQAPDnwotRuNB4wbisdGZgsO8JA+AFqSbZDQ7Bl23KktTmd7EobHW+nU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:b97b5253-55c3-433b-a597-77e6996e405d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:1fcc6f8,CLOUDID:60459dd2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2b2bd232314711ee83ed1395ce914268-20230802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2114800996; Wed, 02 Aug 2023 08:13:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Aug 2023 22:53:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Aug 2023 22:53:04 +0800
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
Subject: [PATCH v4,1/2] media: mediatek: vcodec: Fix possible invalid memory access for decoder
Date: Wed, 2 Aug 2023 22:53:01 +0800
Message-ID: <20230802145303.28765-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_081345_750171_82E27D38 
X-CRM114-Status: GOOD (  20.51  )
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

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reported-by: Steve Cho <stevecho@google.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
- compared with v3:
- fix error log for patch 1 and 2.
- compared with v2:
- rewrite the commit message for patch 01 and 02.
- add Reported-by and Fixes tag.
- fix smatch fail for patch 02/2.
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 +
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     | 79 ++++++++++++-------
 2 files changed, 53 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 6c318de25a55..7e36b2c69b7d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -161,6 +161,7 @@ struct mtk_vcodec_dec_pdata {
  * @hw_id: hardware index used to identify different hardware.
  *
  * @msg_queue: msg queue used to store lat buffer information.
+ * @vpu_inst: vpu instance pointer.
  *
  * @is_10bit_bitstream: set to true if it's 10bit bitstream
  */
@@ -205,6 +206,7 @@ struct mtk_vcodec_dec_ctx {
 	int hw_id;
 
 	struct vdec_msg_queue msg_queue;
+	void *vpu_inst;
 
 	bool is_10bit_bitstream;
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 82c3dc8c4127..82e57ae983d5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -72,6 +72,21 @@ static void handle_get_param_msg_ack(const struct vdec_vpu_ipi_get_param_ack *ms
 	}
 }
 
+static bool vpu_dec_check_ap_inst(struct mtk_vcodec_dec_dev *dec_dev, struct vdec_vpu_inst *vpu)
+{
+	struct mtk_vcodec_dec_ctx *ctx;
+	int ret = false;
+
+	list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
+		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst == vpu) {
+			ret = true;
+			break;
+		}
+	}
+
+	return ret;
+}
+
 /*
  * vpu_dec_ipi_handler - Handler for VPU ipi message.
  *
@@ -84,44 +99,51 @@ static void handle_get_param_msg_ack(const struct vdec_vpu_ipi_get_param_ack *ms
  */
 static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 {
+	struct mtk_vcodec_dec_dev *dec_dev;
 	const struct vdec_vpu_ipi_ack *msg = data;
-	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
-					(unsigned long)msg->ap_inst_addr;
+	struct vdec_vpu_inst *vpu;
 
-	if (!vpu) {
-		mtk_v4l2_vdec_err(vpu->ctx, "ap_inst_addr is NULL, did the SCP hang or crash?");
+	dec_dev = (struct mtk_vcodec_dec_dev *)priv;
+	vpu = (struct vdec_vpu_inst *)(unsigned long)msg->ap_inst_addr;
+	if (!priv || !vpu) {
+		pr_err(MTK_DBG_V4L2_STR "ap_inst_addr is NULL, did the SCP hang or crash?");
 		return;
 	}
 
-	mtk_vdec_debug(vpu->ctx, "+ id=%X", msg->msg_id);
+	if (!vpu_dec_check_ap_inst(dec_dev, vpu) || msg->msg_id < VPU_IPIMSG_DEC_INIT_ACK ||
+	    msg->msg_id > VPU_IPIMSG_DEC_GET_PARAM_ACK) {
+		mtk_v4l2_vdec_err(vpu->ctx, "vdec msg id not correctly => 0x%x", msg->msg_id);
+		vpu->failure = -EINVAL;
+		goto error;
+	}
 
 	vpu->failure = msg->status;
-	vpu->signaled = 1;
+	if (msg->status != 0)
+		goto error;
 
-	if (msg->status == 0) {
-		switch (msg->msg_id) {
-		case VPU_IPIMSG_DEC_INIT_ACK:
-			handle_init_ack_msg(data);
-			break;
+	switch (msg->msg_id) {
+	case VPU_IPIMSG_DEC_INIT_ACK:
+		handle_init_ack_msg(data);
+		break;
 
-		case VPU_IPIMSG_DEC_START_ACK:
-		case VPU_IPIMSG_DEC_END_ACK:
-		case VPU_IPIMSG_DEC_DEINIT_ACK:
-		case VPU_IPIMSG_DEC_RESET_ACK:
-		case VPU_IPIMSG_DEC_CORE_ACK:
-		case VPU_IPIMSG_DEC_CORE_END_ACK:
-			break;
+	case VPU_IPIMSG_DEC_START_ACK:
+	case VPU_IPIMSG_DEC_END_ACK:
+	case VPU_IPIMSG_DEC_DEINIT_ACK:
+	case VPU_IPIMSG_DEC_RESET_ACK:
+	case VPU_IPIMSG_DEC_CORE_ACK:
+	case VPU_IPIMSG_DEC_CORE_END_ACK:
+		break;
 
-		case VPU_IPIMSG_DEC_GET_PARAM_ACK:
-			handle_get_param_msg_ack(data);
-			break;
-		default:
-			mtk_vdec_err(vpu->ctx, "invalid msg=%X", msg->msg_id);
-			break;
-		}
+	case VPU_IPIMSG_DEC_GET_PARAM_ACK:
+		handle_get_param_msg_ack(data);
+		break;
+	default:
+		mtk_vdec_err(vpu->ctx, "invalid msg=%X", msg->msg_id);
+		break;
 	}
 
-	mtk_vdec_debug(vpu->ctx, "- id=%X", msg->msg_id);
+error:
+	vpu->signaled = 1;
 }
 
 static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
@@ -182,9 +204,10 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 
 	init_waitqueue_head(&vpu->wq);
 	vpu->handler = vpu_dec_ipi_handler;
+	vpu->ctx->vpu_inst = vpu;
 
 	err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
-					 vpu->handler, "vdec", NULL);
+					 vpu->handler, "vdec", vpu->ctx->dev);
 	if (err) {
 		mtk_vdec_err(vpu->ctx, "vpu_ipi_register fail status=%d", err);
 		return err;
@@ -193,7 +216,7 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
 		err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
 						 vpu->core_id, vpu->handler,
-						 "vdec", NULL);
+						 "vdec", vpu->ctx->dev);
 		if (err) {
 			mtk_vdec_err(vpu->ctx, "vpu_ipi_register core fail status=%d", err);
 			return err;
-- 
2.18.0


