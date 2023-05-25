Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51189C77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 01:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXYJiSXFWszC60VW1Mpl7DVaCUrm9+G5TpFWnV5gHa8=; b=ZA0zznoHe+rfFFwNAlxmPvmV3b
	g7uzGv7TG1vbL1fPoJ3arzWpJ3kQblxQkYfoNKYkQ7dEg5Y5NoSxGjQW/obTTxF+jrHMhOVMPul6J
	O0jMlJ/NnEZgYw3NdHZM83LRlls/xsrRsFLllH3/xOoKWRYfffuAcr61QnVfYqPXLyWQnFcYpdPFB
	+GqBGzd79Sy85+2ZSZRnjnfxc3gTLBJj/tAKgPBm2856EGhtCnRTIJWUg030rdJ3py08PAI4V0/bu
	XYQSlzwvxjPrtHGg+rOkQbiv/GddYA5eBQW9fiq5Q/dxUUpywm5CuP6Yj+pqf+0J0u1l3EsQcR6Gn
	qY73tNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1zyL-00FAyC-25;
	Thu, 25 May 2023 01:40:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1zyI-00FAwf-1O;
	Thu, 25 May 2023 01:40:55 +0000
X-UUID: 2e355bdcfa9d11ed912e1518a6540028-20230524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EXYJiSXFWszC60VW1Mpl7DVaCUrm9+G5TpFWnV5gHa8=;
	b=CGaZZ/aVdb4tK8GrxvJXNxVH9k17ttqpCJ2ALStkRpaLGbEdHS0waANJyu7zqYfCrqW27j39+7OsNLt6klNGpJs9oANRgNUcXveRsB73mFIB5h5UqFWkg0szYoNHMrJQL+J0HS/Xbp+kJOceDnd9OZIW65ZNlk+i2lHcTNmkoZo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:5d5e4687-40fd-47cc-90b2-2d0e3d59c41c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:39f5ea6c-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 2e355bdcfa9d11ed912e1518a6540028-20230524
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 239866705; Wed, 24 May 2023 18:40:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 May 2023 09:40:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 09:40:13 +0800
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
Subject: [PATCH v4,2/4] media: mediatek: vcodec: using decoder status instead of core work count
Date: Thu, 25 May 2023 09:40:07 +0800
Message-ID: <20230525014009.23345-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525014009.23345-1-yunfei.dong@mediatek.com>
References: <20230525014009.23345-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_184054_477660_735FC1FD 
X-CRM114-Status: GOOD (  16.88  )
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

Adding the definition of decoder status to separate different decoder
period for core hardware.

core_work_cnt is the number of core work queued to work queue, the control
is very complex, leading to some unreasonable test result.

Using parameter status to indicate whether queue core work to work queue.

Fixes: 2e0ef56d81cb ("media: mediatek: vcodec: making sure queue_work successfully")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/vdec_msg_queue.c | 33 ++++++++-----------
 .../platform/mediatek/vcodec/vdec_msg_queue.h | 16 +++++++--
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index f3073d1e7f42..03f8d7cd8edd 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -71,7 +71,6 @@ static void vdec_msg_queue_dec(struct vdec_msg_queue *msg_queue, int hardware_in
 int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx, struct vdec_lat_buf *buf)
 {
 	struct list_head *head;
-	int status;
 
 	head = vdec_get_buf_list(msg_ctx->hardware_index, buf);
 	if (!head) {
@@ -87,12 +86,9 @@ int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx, struct vdec_lat_buf
 	if (msg_ctx->hardware_index != MTK_VDEC_CORE) {
 		wake_up_all(&msg_ctx->ready_to_use);
 	} else {
-		if (buf->ctx->msg_queue.core_work_cnt <
-			atomic_read(&buf->ctx->msg_queue.core_list_cnt)) {
-			status = queue_work(buf->ctx->dev->core_workqueue,
-					    &buf->ctx->msg_queue.core_work);
-			if (status)
-				buf->ctx->msg_queue.core_work_cnt++;
+		if (!(buf->ctx->msg_queue.status & CONTEXT_LIST_QUEUED)) {
+			queue_work(buf->ctx->dev->core_workqueue, &buf->ctx->msg_queue.core_work);
+			buf->ctx->msg_queue.status |= CONTEXT_LIST_QUEUED;
 		}
 	}
 
@@ -261,7 +257,10 @@ static void vdec_msg_queue_core_work(struct work_struct *work)
 		container_of(msg_queue, struct mtk_vcodec_ctx, msg_queue);
 	struct mtk_vcodec_dev *dev = ctx->dev;
 	struct vdec_lat_buf *lat_buf;
-	int status;
+
+	spin_lock(&ctx->dev->msg_queue_core_ctx.ready_lock);
+	ctx->msg_queue.status &= ~CONTEXT_LIST_QUEUED;
+	spin_unlock(&ctx->dev->msg_queue_core_ctx.ready_lock);
 
 	lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
 	if (!lat_buf)
@@ -278,17 +277,13 @@ static void vdec_msg_queue_core_work(struct work_struct *work)
 	vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
 
 	wake_up_all(&ctx->msg_queue.core_dec_done);
-	spin_lock(&dev->msg_queue_core_ctx.ready_lock);
-	lat_buf->ctx->msg_queue.core_work_cnt--;
-
-	if (lat_buf->ctx->msg_queue.core_work_cnt <
-		atomic_read(&lat_buf->ctx->msg_queue.core_list_cnt)) {
-		status = queue_work(lat_buf->ctx->dev->core_workqueue,
-				    &lat_buf->ctx->msg_queue.core_work);
-		if (status)
-			lat_buf->ctx->msg_queue.core_work_cnt++;
+	if (!(ctx->msg_queue.status & CONTEXT_LIST_QUEUED) &&
+	    atomic_read(&msg_queue->core_list_cnt)) {
+		spin_lock(&ctx->dev->msg_queue_core_ctx.ready_lock);
+		ctx->msg_queue.status |= CONTEXT_LIST_QUEUED;
+		spin_unlock(&ctx->dev->msg_queue_core_ctx.ready_lock);
+		queue_work(ctx->dev->core_workqueue, &msg_queue->core_work);
 	}
-	spin_unlock(&dev->msg_queue_core_ctx.ready_lock);
 }
 
 int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
@@ -303,13 +298,13 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 		return 0;
 
 	msg_queue->ctx = ctx;
-	msg_queue->core_work_cnt = 0;
 	vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
 	INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
 
 	atomic_set(&msg_queue->lat_list_cnt, 0);
 	atomic_set(&msg_queue->core_list_cnt, 0);
 	init_waitqueue_head(&msg_queue->core_dec_done);
+	msg_queue->status = CONTEXT_LIST_EMPTY;
 
 	msg_queue->wdma_addr.size =
 		vde_msg_queue_get_trans_size(ctx->picinfo.buf_w,
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
index a5d44bc97c16..8f82d1484772 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
@@ -21,6 +21,18 @@ struct mtk_vcodec_ctx;
 struct mtk_vcodec_dev;
 typedef int (*core_decode_cb_t)(struct vdec_lat_buf *lat_buf);
 
+/**
+ * enum core_ctx_status - Context decode status for core hardwre.
+ * @CONTEXT_LIST_EMPTY: No buffer queued on core hardware(must always be 0)
+ * @CONTEXT_LIST_QUEUED: Buffer queued to core work list
+ * @CONTEXT_LIST_DEC_DONE: context decode done
+ */
+enum core_ctx_status {
+	CONTEXT_LIST_EMPTY = 0,
+	CONTEXT_LIST_QUEUED,
+	CONTEXT_LIST_DEC_DONE,
+};
+
 /**
  * struct vdec_msg_queue_ctx - represents a queue for buffers ready to be processed
  * @ready_to_use: ready used queue used to signalize when get a job queue
@@ -77,7 +89,7 @@ struct vdec_lat_buf {
  * @lat_list_cnt: used to record each instance lat list count
  * @core_list_cnt: used to record each instance core list count
  * @core_dec_done: core work queue decode done event
- * @core_work_cnt: the number of core work in work queue
+ * @status: current context decode status for core hardware
  */
 struct vdec_msg_queue {
 	struct vdec_lat_buf lat_buf[NUM_BUFFER_COUNT];
@@ -93,7 +105,7 @@ struct vdec_msg_queue {
 	atomic_t lat_list_cnt;
 	atomic_t core_list_cnt;
 	wait_queue_head_t core_dec_done;
-	int core_work_cnt;
+	int status;
 };
 
 /**
-- 
2.18.0


