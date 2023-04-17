Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB44C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 06:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeR9CpCczbRyPimR+qG2haOdePkMQhWTy8Vcp1T4SpM=; b=jWvAwfEDPGwz86foTI0i9vFe5I
	vUs4xi/aaf9MGE5g15mKUmEYD/1fUU7St1/NTttabplF5qTR8Aw0sD3+NyBlXXVRpluaCsJAUY1r1
	upojfFXOeQe3vgudc3kkcJ5+6363/E6WmQlAbXP57YH8DjPilV1EUQVZp92pSIopW9J7Bd59bsIXr
	l1MnRzZ4e7hStYVbKw3Pl+E+23hkCOtT71Mq3GfzxvdU5AEmlPoqYc70HCJaU7fc/uW1VHKEnbV1r
	NwKyBGUr3qYPlCSHZY766Ypl8BvgedhiwXZSnXucNQdzT30ml2qVN6dCjFvFksDPtCeOmc1vujT/O
	gkkY07Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poI2T-00Ezsc-15;
	Mon, 17 Apr 2023 06:08:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poI2Q-00Ezs6-37;
	Mon, 17 Apr 2023 06:08:32 +0000
X-UUID: 44e35f8edce611ed8687db9d93187ff1-20230416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QeR9CpCczbRyPimR+qG2haOdePkMQhWTy8Vcp1T4SpM=;
	b=Grr9pzJN64s3KMg3OJX2efqjwjVABhUuouQXaEV4m1XZ2x8GrD5jM/NL+yZoMdXHoCSvI/mN+nheY7FaHwl3dyhbhMhpoyp8GmkJMcUjzH7J9UHS4pMmyYxVQteDa5K0+cXIheGkL5114yiylQdyKWyt5rgbcndp5ZJCzVhON5U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:21e9db4f-ee18-4ac6-84c5-b792d4cb783b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:6e8a2feb-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 44e35f8edce611ed8687db9d93187ff1-20230416
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 592478463; Sun, 16 Apr 2023 23:08:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 17 Apr 2023 13:48:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 17 Apr 2023 13:48:23 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Yunfei Dong <yunfei.dong@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 6/6] media: mediatek: vcodec: using empty lat buffer as the last one
Date: Mon, 17 Apr 2023 13:48:16 +0800
Message-ID: <20230417054816.17097-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230417054816.17097-1-yunfei.dong@mediatek.com>
References: <20230417054816.17097-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_230831_011211_640A634D 
X-CRM114-Status: GOOD (  11.32  )
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

Queue the empty lat buffer to core list when driver need to flush decode.
It's mean core already decode all existed lat buffer when get empty lat
buffer, then wake up core decode done event, the driver will exit when getting
core dec done event.

Fixes: d227af847ac2 ("media: mediatek: vcodec: add core decode done event")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/vdec_msg_queue.c | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index a74bd839d7e2..d2e48eefc958 100644
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
+	mtk_v4l2_debug("flush done => ready_num:%d status:%d list(%d %d)",
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
-- 
2.18.0


