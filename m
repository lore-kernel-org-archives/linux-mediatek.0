Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8E2C77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 01:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vECssvqpnNYG6NLdvZnncp82bk62N0VHH5o/JWWwrE=; b=QkO9I4TuLL0vfQMqn9Uy2nRs15
	kPVAYFtv46/mdEmllGyLV8iebI869oeYp5Ls81NXOF/dj73zkLjGTEi2MeRMvHWdfYJVlgbuOJXmq
	GwSFgluSlyRHlDyQg+921iA8rtYZGXF5B3WVzM5hiBGE7Htaa+pSDz9qk469KY6mQ250mjKg+qqqv
	UwtCEHLakZZhD5sQsb9iy/xfbaE6q1w6mvlwuc5qFQQF6y/CILgGBLUSDc05hx2+XDyy7NrUcyqwK
	4CyP6ONfGqAQ6P2Tl3DtJgEvYejDE4bzDDHxB4Ml2dX0/lw1PM7QORYmYJgLAxLiVWZvfOpDrFx5e
	1uFgP5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q207Z-00FC2b-0m;
	Thu, 25 May 2023 01:50:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q207V-00FC1x-28;
	Thu, 25 May 2023 01:50:27 +0000
X-UUID: 810c69c6fa9e11ed912e1518a6540028-20230524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1vECssvqpnNYG6NLdvZnncp82bk62N0VHH5o/JWWwrE=;
	b=qhxEXG3YUOemGvjJkN7PpUJlz5fjj86IM3rE2sZczUETbkCJOmVYq6piXVtwP1Qjq03ZbrCFf5Qc5DHoNyfW2UvTazWL4u3U3orbYW0qHbp+G9WoZITFkRES0Nqnizfs1yHP/T7i8+OVx0i4anbgopI37MJzTpEPgnrH68FsHJU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:f1005d02-7f0a-4019-9b96-c5a76dae37af,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:dd47463c-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 810c69c6fa9e11ed912e1518a6540028-20230524
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 372186309; Wed, 24 May 2023 18:50:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 May 2023 09:40:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 09:40:15 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,4/4] media: mediatek: vcodec: using empty lat buffer as the last one
Date: Thu, 25 May 2023 09:40:09 +0800
Message-ID: <20230525014009.23345-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525014009.23345-1-yunfei.dong@mediatek.com>
References: <20230525014009.23345-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_185025_730282_CBA41A2E 
X-CRM114-Status: GOOD (  16.52  )
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

Adding one empty lat buffer with parameter 'is_empty_flag = true'
used to flush core work queue decode.

Queue the empty lat buffer to core list when driver need to flush decode.
It's mean core already decode all existed lat buffer when get empty lat
buffer, then wake up core decode done event, the driver will exit when getting
core dec done event.

Fixes: d227af847ac2 ("media: mediatek: vcodec: add core decode done event")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/vdec_msg_queue.c | 35 +++++++++++--------
 .../platform/mediatek/vcodec/vdec_msg_queue.h |  8 +++++
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index 3f571cbc8331..66b4175601e3 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -177,9 +177,6 @@ void vdec_msg_queue_update_ube_wptr(struct vdec_msg_queue *msg_queue, uint64_t u
 
 bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
 {
-	int ret;
-	long timeout_jiff;
-
 	if (atomic_read(&msg_queue->lat_list_cnt) == NUM_BUFFER_COUNT) {
 		mtk_v4l2_debug(3, "wait buf full: list(%d %d) ready_num:%d status:%d",
 			       atomic_read(&msg_queue->lat_list_cnt),
@@ -189,19 +186,14 @@ bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
 		return true;
 	}
 
-	timeout_jiff = msecs_to_jiffies(1000 * (NUM_BUFFER_COUNT + 2));
-	ret = wait_event_timeout(msg_queue->core_dec_done,
-				 msg_queue->lat_ctx.ready_num == NUM_BUFFER_COUNT,
-				 timeout_jiff);
-	if (ret) {
-		mtk_v4l2_debug(3, "success to get lat buf: %d",
-			       msg_queue->lat_ctx.ready_num);
-		return true;
-	}
+	msg_queue->flush_done = false;
+	vdec_msg_queue_qbuf(&msg_queue->core_ctx, &msg_queue->empty_lat_buf);
+	wait_event(msg_queue->core_dec_done, msg_queue->flush_done);
 
-	mtk_v4l2_err("failed with lat buf isn't full: list(%d %d)",
-		     atomic_read(&msg_queue->lat_list_cnt),
-		     atomic_read(&msg_queue->core_list_cnt));
+	mtk_v4l2_debug(3, "flush done => ready_num:%d status:%d list(%d %d)",
+		       msg_queue->lat_ctx.ready_num, msg_queue->status,
+		       atomic_read(&msg_queue->lat_list_cnt),
+		       atomic_read(&msg_queue->core_list_cnt));
 
 	return false;
 }
@@ -250,6 +242,14 @@ static void vdec_msg_queue_core_work(struct work_struct *work)
 	if (!lat_buf)
 		return;
 
+	if (lat_buf->is_last_frame) {
+		ctx->msg_queue.status = CONTEXT_LIST_DEC_DONE;
+		msg_queue->flush_done = true;
+		wake_up(&ctx->msg_queue.core_dec_done);
+
+		return;
+	}
+
 	ctx = lat_buf->ctx;
 	mtk_vcodec_dec_enable_hardware(ctx, MTK_VDEC_CORE);
 	mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
@@ -300,6 +300,10 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 	msg_queue->wdma_rptr_addr = msg_queue->wdma_addr.dma_addr;
 	msg_queue->wdma_wptr_addr = msg_queue->wdma_addr.dma_addr;
 
+	msg_queue->empty_lat_buf.ctx = ctx;
+	msg_queue->empty_lat_buf.core_decode = NULL;
+	msg_queue->empty_lat_buf.is_last_frame = true;
+
 	for (i = 0; i < NUM_BUFFER_COUNT; i++) {
 		lat_buf = &msg_queue->lat_buf[i];
 
@@ -325,6 +329,7 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 
 		lat_buf->ctx = ctx;
 		lat_buf->core_decode = core_decode;
+		lat_buf->is_last_frame = false;
 		err = vdec_msg_queue_qbuf(&msg_queue->lat_ctx, lat_buf);
 		if (err) {
 			mtk_v4l2_err("failed to qbuf buf[%d]", i);
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
index efc94165e016..8f771874f8e6 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
@@ -62,6 +62,8 @@ struct vdec_msg_queue_ctx {
  * @core_decode: different codec use different decode callback function
  * @lat_list: add lat buffer to lat head list
  * @core_list: add lat buffer to core head list
+ *
+ * @is_last_frame: meaning this buffer is the last frame
  */
 struct vdec_lat_buf {
 	struct mtk_vcodec_mem wdma_err_addr;
@@ -74,6 +76,8 @@ struct vdec_lat_buf {
 	core_decode_cb_t core_decode;
 	struct list_head lat_list;
 	struct list_head core_list;
+
+	bool is_last_frame;
 };
 
 /**
@@ -88,6 +92,8 @@ struct vdec_lat_buf {
  *
  * @lat_list_cnt: used to record each instance lat list count
  * @core_list_cnt: used to record each instance core list count
+ * @flush_done: core flush done status
+ * @empty_lat_buf: the last lat buf used to flush decode
  * @core_dec_done: core work queue decode done event
  * @status: current context decode status for core hardware
  */
@@ -104,6 +110,8 @@ struct vdec_msg_queue {
 
 	atomic_t lat_list_cnt;
 	atomic_t core_list_cnt;
+	bool flush_done;
+	struct vdec_lat_buf empty_lat_buf;
 	wait_queue_head_t core_dec_done;
 	int status;
 };
-- 
2.18.0


