Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF102C77B76
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 06:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoL64s5ABGC3JLRHKg1Y7d5gunkiamjG91kHfOR9t2s=; b=rt/ERWgdT1CRal2JLZUeH4eUav
	+1x+B4cNA7qpCbsta5Vq28rFMCfGGfB1+g4pCC2R8rOcEbLD1qJqJ4v/BjDu3yUjjYmqAC3DUAH2U
	v1iuEqz0J6kw1DaGnUvylkTa9Wcq9BS/2WeCkeHra6fI0cA+RfkidjIEY0rhDjtUb/DRWawT64eGm
	zQCaHG107jPspGgKt4NgN28X+IbOW8DtiaR6bRf0DsZKtNNT5Av2zjRs1TRyhj6X5++Tz1VZtSUgd
	SXo4aBE9c4eV2LngaSjboiYFDm1RSN2aLE5Vpqp+gVdM1G/9TfsZzUFmoYPrmphJYS3l4dlW31Wkk
	05WuL4Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqpGv-00FQeY-1n;
	Mon, 24 Apr 2023 06:01:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqpGk-00FQXu-1B;
	Mon, 24 Apr 2023 06:01:47 +0000
X-UUID: 7a78185ee26511ed8687db9d93187ff1-20230423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WoL64s5ABGC3JLRHKg1Y7d5gunkiamjG91kHfOR9t2s=;
	b=uYFe9Yl3jTbnK9K9Mpz572rqLwRtyxHxG3BVnXDbqvMx7Qg1v5f7C8rStAwchF8+YsQUZNG+9F2twjKh4VNGaLuICZZEDtmeGeB13YGxXQPvpbBKb+nIcJ1RgwCK7xbP8cWASce/GGP8BQ/1//Z0xbY2wa3rLnEpSeBeYoDBFTc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:ddbcf797-15c3-40ad-9e7f-fcb8d703d140,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:c46aebeb-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 7a78185ee26511ed8687db9d93187ff1-20230423
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1790764476; Sun, 23 Apr 2023 23:01:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 24 Apr 2023 14:01:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 24 Apr 2023 14:01:35 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3,4/4] media: mediatek: vcodec: using empty lat buffer as the last one
Date: Mon, 24 Apr 2023 14:01:30 +0800
Message-ID: <20230424060130.18395-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230424060130.18395-1-yunfei.dong@mediatek.com>
References: <20230424060130.18395-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_230146_405681_C3495E11 
X-CRM114-Status: GOOD (  16.76  )
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
index 08c720c9760e..66b4175601e3 100644
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
-	ret = wait_event_timeout(msg_queue->ctx->msg_queue.core_dec_done,
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


