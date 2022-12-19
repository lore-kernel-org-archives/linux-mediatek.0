Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D08C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 07:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/irG+a3PUbCcONAu8SIzKXLC0rffGhq8lZmKN28L2s=; b=VAPHaf0GbkHkxuvCVtaSrW+fyL
	tMajKhKr+dTw4HEKivAxHvO/DwHWJ+Q/o/4aubBXLqCKlOicEiLTmrXHvt5C/TQoOQU7bJUO6uGhg
	B7cVWYvymBYrXk7xRPTl7NdjkHzofnhTyBF3oT0yTjmE3TkUnyT6JcebiA2eg3yZ6b5WtEHKZKeHB
	eHpAGSUyHK+apeDsE6VQmdsbByNjKIhKCIG3KVTPnD3Ov/c81Mfwbaehi9Uj4H/mBMPRHbLgtqP3v
	o312dawXc52GWOZ8mJB5QsPk4XKSh9c7+h+cLvwDiBQQSgKBXsUcRXTTtwC2x9IQmrnDrTKtAkQqI
	mutnLNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7AfN-009wOs-4H; Mon, 19 Dec 2022 07:34:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7AfH-009wK4-JC; Mon, 19 Dec 2022 07:34:25 +0000
X-UUID: 8a6e0d649cc74ac1a6fb46dfefd8a48c-20221219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=T/irG+a3PUbCcONAu8SIzKXLC0rffGhq8lZmKN28L2s=;
	b=PdMvswQjVgX5Yu5pJ6nJGrASGosCxeYHGGGtV89VOYscaRHyAWmbwn1RBTaTfewbluc19RHVg9CFrcG+dU9j4XzRe46N9uUg36Dj94TDyhMEsZ5YMcAUj6W4J0XEdYgMDOuZdGiVCiUvdIguXILpuy4SihKN6CBSVpRxfemLe44=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:b0a12289-5e6d-4d48-9ba0-b98459277ecc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:27d04df3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8a6e0d649cc74ac1a6fb46dfefd8a48c-20221219
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1469131389; Mon, 19 Dec 2022 00:34:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Dec 2022 14:43:44 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Dec 2022 14:43:43 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,6/7] media: mediatek: vcodec: making sure queue_work successfully
Date: Mon, 19 Dec 2022 14:43:31 +0800
Message-ID: <20221219064332.2124-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219064332.2124-1-yunfei.dong@mediatek.com>
References: <20221219064332.2124-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_233423_686349_5D0662DB 
X-CRM114-Status: GOOD (  15.76  )
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

Putting core work to work queue using queue_work maybe fail, call
queue_work again when the count of core work in work queue is less
than core_list_cnt, making sure all the buffer in core list can be
scheduled.

Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/vdec_msg_queue.c | 30 ++++++++++++++-----
 .../platform/mediatek/vcodec/vdec_msg_queue.h |  2 ++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index 0255b8385bfc..564dcf3e6d22 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -71,6 +71,7 @@ static void vdec_msg_queue_dec(struct vdec_msg_queue *msg_queue, int hardware_in
 int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx, struct vdec_lat_buf *buf)
 {
 	struct list_head *head;
+	int status;
 
 	head = vdec_get_buf_list(msg_ctx->hardware_index, buf);
 	if (!head) {
@@ -83,11 +84,17 @@ int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx, struct vdec_lat_buf
 	msg_ctx->ready_num++;
 
 	vdec_msg_queue_inc(&buf->ctx->msg_queue, msg_ctx->hardware_index);
-	if (msg_ctx->hardware_index != MTK_VDEC_CORE)
+	if (msg_ctx->hardware_index != MTK_VDEC_CORE) {
 		wake_up_all(&msg_ctx->ready_to_use);
-	else
-		queue_work(buf->ctx->dev->core_workqueue,
-			   &buf->ctx->msg_queue.core_work);
+	} else {
+		if (buf->ctx->msg_queue.core_work_cnt <
+			atomic_read(&buf->ctx->msg_queue.core_list_cnt)) {
+			status = queue_work(buf->ctx->dev->core_workqueue,
+					    &buf->ctx->msg_queue.core_work);
+			if (status)
+				buf->ctx->msg_queue.core_work_cnt++;
+		}
+	}
 
 	mtk_v4l2_debug(3, "enqueue buf type: %d addr: 0x%p num: %d",
 		       msg_ctx->hardware_index, buf, msg_ctx->ready_num);
@@ -249,6 +256,7 @@ static void vdec_msg_queue_core_work(struct work_struct *work)
 		container_of(msg_queue, struct mtk_vcodec_ctx, msg_queue);
 	struct mtk_vcodec_dev *dev = ctx->dev;
 	struct vdec_lat_buf *lat_buf;
+	int status;
 
 	lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
 	if (!lat_buf)
@@ -265,11 +273,17 @@ static void vdec_msg_queue_core_work(struct work_struct *work)
 	vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
 
 	wake_up_all(&ctx->msg_queue.core_dec_done);
-	if (atomic_read(&lat_buf->ctx->msg_queue.core_list_cnt)) {
-		mtk_v4l2_debug(3, "re-schedule to decode for core: %d",
-			       dev->msg_queue_core_ctx.ready_num);
-		queue_work(dev->core_workqueue, &msg_queue->core_work);
+	spin_lock(&dev->msg_queue_core_ctx.ready_lock);
+	lat_buf->ctx->msg_queue.core_work_cnt--;
+
+	if (lat_buf->ctx->msg_queue.core_work_cnt <
+		atomic_read(&lat_buf->ctx->msg_queue.core_list_cnt)) {
+		status = queue_work(lat_buf->ctx->dev->core_workqueue,
+				    &lat_buf->ctx->msg_queue.core_work);
+		if (status)
+			lat_buf->ctx->msg_queue.core_work_cnt++;
 	}
+	spin_unlock(&dev->msg_queue_core_ctx.ready_lock);
 }
 
 int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
index a75c04418f52..a5d44bc97c16 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
@@ -77,6 +77,7 @@ struct vdec_lat_buf {
  * @lat_list_cnt: used to record each instance lat list count
  * @core_list_cnt: used to record each instance core list count
  * @core_dec_done: core work queue decode done event
+ * @core_work_cnt: the number of core work in work queue
  */
 struct vdec_msg_queue {
 	struct vdec_lat_buf lat_buf[NUM_BUFFER_COUNT];
@@ -92,6 +93,7 @@ struct vdec_msg_queue {
 	atomic_t lat_list_cnt;
 	atomic_t core_list_cnt;
 	wait_queue_head_t core_dec_done;
+	int core_work_cnt;
 };
 
 /**
-- 
2.25.1


