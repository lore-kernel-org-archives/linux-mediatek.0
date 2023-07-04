Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26837EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 11:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/Rkx4m+U46SPlhYZB/Xxb9HqUeOS+K11s1t5Yf3nHM=; b=hJFcvcp3CefBkrtQ6hEoPBo/nY
	8fCQ7H6FpDPi8Wp04zZC2uqJZtRkK8kin7I50GGTBTWD0VUXTGdY3KLsBDrNNMtMdMPoqQHI2keay
	bgF8nPL8/kB3uWlXZlk1B/RQTpcRdHtCPfIt42si/hdyf2jh+Izj1x9DcRkK67wWgviKq6o368nRr
	tSsokN9DTwNQceEpDaf0XxbfdfIupsu7VxGTEe5R1W6rVmNAi7rDdcYRDILufcXYhDubgSmIXap0x
	NKw0YB/oEaLQPsk0/CerYDg8WGsjvJjtzun7XS2YQMQQlgVvPYGC6CJ1JUXhF9f7FCzDMSlUfCPKZ
	PA1CN8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdzI-00D5qD-2W;
	Tue, 04 Jul 2023 11:14:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdzE-00D5nj-1H;
	Tue, 04 Jul 2023 11:14:27 +0000
X-UUID: e445a1e21a5b11ee912e1518a6540028-20230704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=j/Rkx4m+U46SPlhYZB/Xxb9HqUeOS+K11s1t5Yf3nHM=;
	b=sq3XV24FMdZ9hYQZPXC3VGY6MyKrAoqqzQC0ZO8cEYw4OlNDkOU3/1V0bn7hzADu+WCzWd5GAHi/M+s5MidQKBs0hdPsmBzEZmQRGFw9D2Ti1eRVGT0XFQ9X8XTZ5HPyH+CT0b4uAKrtyUq89l95CE1ap1iJwV5RZUyd4goemKg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:055c4ab3-cbf5-4d23-a1d7-d24ef5b1c592,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:01c9525,CLOUDID:8189af82-5a99-42ae-a2dd-e4afb731b474,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e445a1e21a5b11ee912e1518a6540028-20230704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1349496800; Tue, 04 Jul 2023 04:14:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 4 Jul 2023 19:13:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 4 Jul 2023 19:13:31 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5,03/11] media: mediatek: vcodec: Removing struct 'mtk_vcodec_ctx/dev' for shared interface
Date: Tue, 4 Jul 2023 19:13:19 +0800
Message-ID: <20230704111327.7140-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230704111327.7140-1-yunfei.dong@mediatek.com>
References: <20230704111327.7140-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_041424_466842_DCA8B6A0 
X-CRM114-Status: GOOD (  19.41  )
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

The shared struct 'mtk_vcodec_ctx/dev' will be changed to 'mtk_vcodec_enc_ctx/dev'
and 'mtk_vcodec_dec_ctx/dev' in order to separate encoder and decoder. Removing
common struct 'mtk_vcodec_ctx/dev' for shared interface which encoder and decoder
used at the same time. Then encoder and decoder can call the same interface
independently.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/mtk_vcodec_intr.c         | 30 ++++++++++++-------
 .../mediatek/vcodec/mtk_vcodec_intr.h         |  3 +-
 .../mediatek/vcodec/mtk_vcodec_util.c         | 19 +++++-------
 .../mediatek/vcodec/mtk_vcodec_util.h         |  9 ++----
 .../mediatek/vcodec/vdec/vdec_vp8_if.c        | 16 +++++-----
 .../mediatek/vcodec/venc/venc_h264_if.c       |  2 +-
 .../mediatek/vcodec/venc/venc_vp8_if.c        |  2 +-
 7 files changed, 41 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.c
index 552b4c93d972..daa44f635727 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.c
@@ -11,32 +11,40 @@
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx,
-				 int command, unsigned int timeout_ms,
+int mtk_vcodec_wait_for_done_ctx(void *priv, int command, unsigned int timeout_ms,
 				 unsigned int hw_id)
 {
+	struct mtk_vcodec_ctx *ctx = priv;
 	long timeout_jiff, ret;
-	int status = 0;
+	int status = 0, ctx_id, ctx_type;
+	int *ctx_int_cond, *ctx_int_type;
+	wait_queue_head_t *ctx_queue;
+
+	ctx_id = ctx->id;
+	ctx_type = ctx->type;
+	ctx_int_cond = ctx->int_cond;
+	ctx_int_type = ctx->int_type;
+	ctx_queue = ctx->queue;
 
 	timeout_jiff = msecs_to_jiffies(timeout_ms);
-	ret = wait_event_interruptible_timeout(ctx->queue[hw_id],
-					       ctx->int_cond[hw_id],
+	ret = wait_event_interruptible_timeout(ctx_queue[hw_id],
+					       ctx_int_cond[hw_id],
 					       timeout_jiff);
 
 	if (!ret) {
 		status = -1;	/* timeout */
 		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec timeout=%ums (%d %d)",
-			     ctx->id, command, ctx->type, timeout_ms,
-			     ctx->int_cond[hw_id], ctx->int_type[hw_id]);
+			     ctx_id, command, ctx_type, timeout_ms,
+			     ctx_int_cond[hw_id], ctx_int_type[hw_id]);
 	} else if (-ERESTARTSYS == ret) {
 		status = -1;
 		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec inter fail (%d %d)",
-			     ctx->id, command, ctx->type,
-			     ctx->int_cond[hw_id], ctx->int_type[hw_id]);
+			     ctx_id, command, ctx_type,
+			     ctx_int_cond[hw_id], ctx_int_type[hw_id]);
 	}
 
-	ctx->int_cond[hw_id] = 0;
-	ctx->int_type[hw_id] = 0;
+	ctx_int_cond[hw_id] = 0;
+	ctx_int_type[hw_id] = 0;
 
 	return status;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.h
index 9681f492813b..11bf0ef94d5d 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.h
@@ -12,8 +12,7 @@
 struct mtk_vcodec_ctx;
 
 /* timeout is ms */
-int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx,
-				 int command, unsigned int timeout_ms,
+int mtk_vcodec_wait_for_done_ctx(void *priv, int command, unsigned int timeout_ms,
 				 unsigned int hw_id);
 
 #endif /* _MTK_VCODEC_INTR_H_ */
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.c
index f214e6f67005..847e321f4fcc 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.c
@@ -21,24 +21,20 @@ int mtk_v4l2_dbg_level;
 EXPORT_SYMBOL(mtk_v4l2_dbg_level);
 #endif
 
-void __iomem *mtk_vcodec_get_reg_addr(struct mtk_vcodec_ctx *data,
-					unsigned int reg_idx)
+void __iomem *mtk_vcodec_get_reg_addr(void __iomem **reg_base, unsigned int reg_idx)
 {
-	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)data;
-
-	if (!data || reg_idx >= NUM_MAX_VCODEC_REG_BASE) {
+	if (reg_idx >= NUM_MAX_VCODEC_REG_BASE) {
 		mtk_v4l2_err("Invalid arguments, reg_idx=%d", reg_idx);
 		return NULL;
 	}
-	return ctx->dev->reg_base[reg_idx];
+	return reg_base[reg_idx];
 }
 EXPORT_SYMBOL(mtk_vcodec_get_reg_addr);
 
-int mtk_vcodec_mem_alloc(struct mtk_vcodec_ctx *data,
-			struct mtk_vcodec_mem *mem)
+int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 {
 	unsigned long size = mem->size;
-	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)data;
+	struct mtk_vcodec_ctx *ctx = priv;
 	struct device *dev = &ctx->dev->plat_dev->dev;
 
 	mem->va = dma_alloc_coherent(dev, size, &mem->dma_addr, GFP_KERNEL);
@@ -57,11 +53,10 @@ int mtk_vcodec_mem_alloc(struct mtk_vcodec_ctx *data,
 }
 EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
 
-void mtk_vcodec_mem_free(struct mtk_vcodec_ctx *data,
-			struct mtk_vcodec_mem *mem)
+void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 {
 	unsigned long size = mem->size;
-	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)data;
+	struct mtk_vcodec_ctx *ctx = priv;
 	struct device *dev = &ctx->dev->plat_dev->dev;
 
 	if (!mem->va) {
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
index 88d389b65f13..827937bcb4b4 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
@@ -68,12 +68,9 @@ extern int mtk_vcodec_dbg;
 #define mtk_vcodec_debug_enter(h)  mtk_vcodec_debug(h, "+")
 #define mtk_vcodec_debug_leave(h)  mtk_vcodec_debug(h, "-")
 
-void __iomem *mtk_vcodec_get_reg_addr(struct mtk_vcodec_ctx *data,
-				unsigned int reg_idx);
-int mtk_vcodec_mem_alloc(struct mtk_vcodec_ctx *data,
-				struct mtk_vcodec_mem *mem);
-void mtk_vcodec_mem_free(struct mtk_vcodec_ctx *data,
-				struct mtk_vcodec_mem *mem);
+void __iomem *mtk_vcodec_get_reg_addr(void __iomem **reg_base, unsigned int reg_idx);
+int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem);
+void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem);
 void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
 			     struct mtk_vcodec_ctx *ctx, int hw_idx);
 struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c
index 88c046731754..71f94ac144bc 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c
@@ -167,13 +167,15 @@ struct vdec_vp8_inst {
 
 static void get_hw_reg_base(struct vdec_vp8_inst *inst)
 {
-	inst->reg_base.top = mtk_vcodec_get_reg_addr(inst->ctx, VDEC_TOP);
-	inst->reg_base.cm = mtk_vcodec_get_reg_addr(inst->ctx, VDEC_CM);
-	inst->reg_base.hwd = mtk_vcodec_get_reg_addr(inst->ctx, VDEC_HWD);
-	inst->reg_base.sys = mtk_vcodec_get_reg_addr(inst->ctx, VDEC_SYS);
-	inst->reg_base.misc = mtk_vcodec_get_reg_addr(inst->ctx, VDEC_MISC);
-	inst->reg_base.ld = mtk_vcodec_get_reg_addr(inst->ctx, VDEC_LD);
-	inst->reg_base.hwb = mtk_vcodec_get_reg_addr(inst->ctx, VDEC_HWB);
+	void __iomem **reg_base = inst->ctx->dev->reg_base;
+
+	inst->reg_base.top = mtk_vcodec_get_reg_addr(reg_base, VDEC_TOP);
+	inst->reg_base.cm = mtk_vcodec_get_reg_addr(reg_base, VDEC_CM);
+	inst->reg_base.hwd = mtk_vcodec_get_reg_addr(reg_base, VDEC_HWD);
+	inst->reg_base.sys = mtk_vcodec_get_reg_addr(reg_base, VDEC_SYS);
+	inst->reg_base.misc = mtk_vcodec_get_reg_addr(reg_base, VDEC_MISC);
+	inst->reg_base.ld = mtk_vcodec_get_reg_addr(reg_base, VDEC_LD);
+	inst->reg_base.hwb = mtk_vcodec_get_reg_addr(reg_base, VDEC_HWB);
 }
 
 static void write_hw_segmentation_data(struct vdec_vp8_inst *inst)
diff --git a/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
index 60fd165c0d94..10365c95ebbe 100644
--- a/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
@@ -612,7 +612,7 @@ static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
 	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
-	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx, VENC_SYS);
+	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
 
 	mtk_vcodec_debug_enter(inst);
 
diff --git a/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c
index 56ce58f761f1..73ebc35d7c99 100644
--- a/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c
@@ -336,7 +336,7 @@ static int vp8_enc_init(struct mtk_vcodec_ctx *ctx)
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
 	inst->vpu_inst.id = IPI_VENC_VP8;
-	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx, VENC_LT_SYS);
+	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_LT_SYS);
 
 	mtk_vcodec_debug_enter(inst);
 
-- 
2.18.0


