Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5D6C7618E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 06:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXYJiSXFWszC60VW1Mpl7DVaCUrm9+G5TpFWnV5gHa8=; b=aNua0i7kEQv3qQfCZV85s6Zq7u
	YFQTg4w+o+PVP+Puhn9lfPdYx6hMChdcbdaHa+RyNS+uWeCKsQ+p4Ne2kUjjQ8GiIXTb9oDK3xWsB
	5r5CXqS13if+sJH3R7Fhk3zBg+BZ9qSbZT7g1rA9WNwEUJZ8xcfD5d4xX9YOjRaObNlZJSLFkze/L
	+c14y2CCyyroNSkCSCDzkr1n6KI1MezIIv6OGJWaJmk1B7QX8J+sRDHzr2MRX7XbJVbhqLF2AzDcm
	t5RcJcDJpsjilehZhVUpP7lc6F8dAmxNaCBVrrw8dGhc5eh6Dp1+wHXhAUieIzEX97fs4UUN9+isP
	vzY3Br6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqpHG-00FQm0-1j;
	Mon, 24 Apr 2023 06:02:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqpHE-00FQkx-1E;
	Mon, 24 Apr 2023 06:02:17 +0000
X-UUID: 8dda1762e26511ed8687db9d93187ff1-20230423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EXYJiSXFWszC60VW1Mpl7DVaCUrm9+G5TpFWnV5gHa8=;
	b=fZM9gcnyKCciIqneFyeC08MD9TSd5cY8/U54QHXiQnNgPxt49V9SWvmfV7FquQ4BHuIWDUn16VK/OPn2jpEKxUsitmLdznE9+wE1zIY1bONf/O/cDmgkgVV4PDFjecMgAj5/pX1PrXq1AvD7aPLKfJ2NRrniksoxCwcfBLAixvc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:64749070-03eb-41c0-a657-bc592162bbf5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:64749070-03eb-41c0-a657-bc592162bbf5,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:4f70ebeb-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:230424140139KXSK73S6,BulkQuantity:1,Recheck:0,SF:28|17|19|48|38|29,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 8dda1762e26511ed8687db9d93187ff1-20230423
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1237467798; Sun, 23 Apr 2023 23:02:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 24 Apr 2023 14:01:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 24 Apr 2023 14:01:33 +0800
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
Subject: [PATCH v3,2/4] media: mediatek: vcodec: using decoder status instead of core work count
Date: Mon, 24 Apr 2023 14:01:28 +0800
Message-ID: <20230424060130.18395-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230424060130.18395-1-yunfei.dong@mediatek.com>
References: <20230424060130.18395-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_230216_422037_64A51958 
X-CRM114-Status: GOOD (  17.02  )
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


