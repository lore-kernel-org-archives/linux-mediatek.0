Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECFAC10F1B
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Dec 2022 07:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v587XwApxR6glrcE+8uPlmJ2HRcCy46cr/DumtCsnYY=; b=u9mhKFT5MPY4PxLMHRgQfhCs+l
	r/yFhCuvKkf7bU4P2EtdfElWOLMWr8PkvUcRZV0KeDL1NtVtCOB85r5XRCaMOksoU8moaWPmPP10K
	Dg+SvTooOjjt9rsXajz6ewW4PP4A9LHFa23aKyCglETMzlh4844q6vL9ZiWPRlkjZb3ZXQT0fGmu4
	f1Rhhukms/XohsoZZIwoVPmK5TGm1dNYkUKw8Mf2vVQKK0umrZ9YXThpHNRSVJlyXV2mR2kuKkab9
	DO6B2lBR0UdScck0vG0l9nvIWCod7T8gBQbvJApNA8Ilc6FBuvi0oxvY+e2QbkqDxhYRjLQSOL39Z
	elMmtlVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3uLl-00FFLI-0I; Sat, 10 Dec 2022 07:32:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3uLg-00FFC1-7l; Sat, 10 Dec 2022 07:32:43 +0000
X-UUID: 04e2ace65d5446579c6246c01f4a25ae-20221210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=v587XwApxR6glrcE+8uPlmJ2HRcCy46cr/DumtCsnYY=;
	b=B4kCdSG6W2bcp5zm4A1XmdnGDPkeYUC+tvAvPHIDdHSMTNef6269+wzdxB+i9p9SCweXdrKiwNm374rHnnms2OYpFcoOEIkOm5qJYOkw87vDgJxhzJQIuOYG1cPCwDQeP/r/saNj1c9f6F+xyWHvLlDj3mets+oONYgfnwYjcLo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:630ed9c5-d08c-425a-a792-51649483c9fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:d9e4dc24-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 04e2ace65d5446579c6246c01f4a25ae-20221210
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2024118554; Sat, 10 Dec 2022 00:32:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 10 Dec 2022 15:32:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Dec 2022 15:32:20 +0800
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
Subject: [PATCH 1/5] media: mediatek: vcodec: add params to record lat and core lat_buf count
Date: Sat, 10 Dec 2022 15:32:14 +0800
Message-ID: <20221210073218.17350-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221210073218.17350-1-yunfei.dong@mediatek.com>
References: <20221210073218.17350-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_233240_379436_5EB4F011 
X-CRM114-Status: GOOD (  12.32  )
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

Using lat_buf to share decoder information between lat and core work
queue, adding params to record the buf count.

Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/vdec_msg_queue.c | 32 ++++++++++++++++++-
 .../platform/mediatek/vcodec/vdec_msg_queue.h |  9 ++++++
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index dc2004790a47..af7ddba1923a 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -52,6 +52,30 @@ static struct list_head *vdec_get_buf_list(int hardware_index, struct vdec_lat_b
 	}
 }
 
+static void vdec_msg_queue_inc(struct vdec_msg_queue *msg_queue, int hardware_index)
+{
+	mutex_lock(&msg_queue->list_cnt_mutex);
+
+	if (hardware_index == MTK_VDEC_CORE)
+		atomic_inc(&msg_queue->core_list_cnt);
+	else
+		atomic_inc(&msg_queue->lat_list_cnt);
+
+	mutex_unlock(&msg_queue->list_cnt_mutex);
+}
+
+static void vdec_msg_queue_dec(struct vdec_msg_queue *msg_queue, int hardware_index)
+{
+	mutex_lock(&msg_queue->list_cnt_mutex);
+
+	if (hardware_index == MTK_VDEC_CORE)
+		atomic_dec(&msg_queue->core_list_cnt);
+	else
+		atomic_dec(&msg_queue->lat_list_cnt);
+
+	mutex_unlock(&msg_queue->list_cnt_mutex);
+}
+
 int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx, struct vdec_lat_buf *buf)
 {
 	struct list_head *head;
@@ -72,6 +96,7 @@ int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx, struct vdec_lat_buf
 		queue_work(buf->ctx->dev->core_workqueue,
 			   &buf->ctx->msg_queue.core_work);
 
+	vdec_msg_queue_inc(&buf->ctx->msg_queue, msg_ctx->hardware_index);
 	mtk_v4l2_debug(3, "enqueue buf type: %d addr: 0x%p num: %d",
 		       msg_ctx->hardware_index, buf, msg_ctx->ready_num);
 	spin_unlock(&msg_ctx->ready_lock);
@@ -127,6 +152,7 @@ struct vdec_lat_buf *vdec_msg_queue_dqbuf(struct vdec_msg_queue_ctx *msg_ctx)
 		return NULL;
 	}
 	list_del(head);
+	vdec_msg_queue_dec(&buf->ctx->msg_queue, msg_ctx->hardware_index);
 
 	msg_ctx->ready_num--;
 	mtk_v4l2_debug(3, "dqueue buf type:%d addr: 0x%p num: %d",
@@ -241,10 +267,14 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 
 	vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
 	INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
+
+	atomic_set(&msg_queue->lat_list_cnt, 0);
+	atomic_set(&msg_queue->core_list_cnt, 0);
+	mutex_init(&msg_queue->list_cnt_mutex);
+
 	msg_queue->wdma_addr.size =
 		vde_msg_queue_get_trans_size(ctx->picinfo.buf_w,
 					     ctx->picinfo.buf_h);
-
 	err = mtk_vcodec_mem_alloc(ctx, &msg_queue->wdma_addr);
 	if (err) {
 		mtk_v4l2_err("failed to allocate wdma_addr buf");
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
index c43d427f5f54..94e01a618c5a 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
@@ -72,6 +72,10 @@ struct vdec_lat_buf {
  * @wdma_wptr_addr: ube write point
  * @core_work: core hardware work
  * @lat_ctx: used to store lat buffer list
+ *
+ * @lat_list_cnt: used to record each instance lat list count
+ * @core_list_cnt: used to record each instance core list count
+ * @list_cnt_mutex: used to protect list count
  */
 struct vdec_msg_queue {
 	struct vdec_lat_buf lat_buf[NUM_BUFFER_COUNT];
@@ -82,6 +86,11 @@ struct vdec_msg_queue {
 
 	struct work_struct core_work;
 	struct vdec_msg_queue_ctx lat_ctx;
+
+	atomic_t lat_list_cnt;
+	atomic_t core_list_cnt;
+	/* Protects access to lat and core list cnt */
+	struct mutex list_cnt_mutex;
 };
 
 /**
-- 
2.18.0


