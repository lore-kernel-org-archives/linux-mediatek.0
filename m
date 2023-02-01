Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9DCC38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 07:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wAF+3zLOgriKKOOYsRbB+eAkK6iaY9L7YqRIbK9lWQ=; b=uOsoffA2ft8QR5HZp0Wy4kfYz6
	xKgyk43CfolL5C9jFnSWkynIrGTBAk5tVVQhBQw2FBYNTR3ewU02/IwzXbQ7roboAngqHK//Os5Rn
	mr9ovaCcu5UPNdu0ETBgB6kKnvzCKjm82M57BqPma59YNdKxcx73T9GhM1Z3ccjTegAwAev5YLpDx
	zfGLAG7x2jv/iuOQpdHuzLQlYg06Twu6nT0oM1ETsKRsVvY0JSaQCPMrvROx4Cu3qzKR8hNIbHaAR
	f7QDwok4Wt437NUuqRubSiT9nAk1tUjpNUmqYJPtOdoLuYt1PJXghFj5stLZ/QvWU1RRMnoIYAliv
	FsAyj7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7d6-00Ac1F-V5; Wed, 01 Feb 2023 07:34:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7d3-00Abxz-8A; Wed, 01 Feb 2023 07:34:02 +0000
X-UUID: c79a40eca20211edbbe3f76fe852e059-20230201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+wAF+3zLOgriKKOOYsRbB+eAkK6iaY9L7YqRIbK9lWQ=;
	b=WpdGMWWOSsvkHMyZPIfz6rrdFuGQ9V9CSOSAmyIztQbbGtYh15QyDhYYSrcJpRXnYz4VHMPWQT4a99C85vV14XiFOhw+eqXaGucJUJKCVEWnPvZhxQ41loKAtk7b98i51w4VjXS/7taKW3dpsgzPcqiP9BmDpq+3xvsqJf0xkms=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:e1f1f422-722d-4f0c-b34a-3088c9f9f5a1,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:3ca2d6b,CLOUDID:54aa1ef7-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: c79a40eca20211edbbe3f76fe852e059-20230201
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1440902172; Wed, 01 Feb 2023 00:33:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Feb 2023 15:33:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 1 Feb 2023 15:33:18 +0800
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
Subject: [PATCH v4,1/7] media: mediatek: vcodec: add params to record lat and core lat_buf count
Date: Wed, 1 Feb 2023 15:33:10 +0800
Message-ID: <20230201073316.27923-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201073316.27923-1-yunfei.dong@mediatek.com>
References: <20230201073316.27923-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_233401_305515_EDD2CD17 
X-CRM114-Status: GOOD (  13.98  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/vcodec/vdec_msg_queue.c | 23 ++++++++++++++++++-
 .../platform/mediatek/vcodec/vdec_msg_queue.h |  6 +++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index dc2004790a47..3f016c87d722 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -52,6 +52,22 @@ static struct list_head *vdec_get_buf_list(int hardware_index, struct vdec_lat_b
 	}
 }
 
+static void vdec_msg_queue_inc(struct vdec_msg_queue *msg_queue, int hardware_index)
+{
+	if (hardware_index == MTK_VDEC_CORE)
+		atomic_inc(&msg_queue->core_list_cnt);
+	else
+		atomic_inc(&msg_queue->lat_list_cnt);
+}
+
+static void vdec_msg_queue_dec(struct vdec_msg_queue *msg_queue, int hardware_index)
+{
+	if (hardware_index == MTK_VDEC_CORE)
+		atomic_dec(&msg_queue->core_list_cnt);
+	else
+		atomic_dec(&msg_queue->lat_list_cnt);
+}
+
 int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx, struct vdec_lat_buf *buf)
 {
 	struct list_head *head;
@@ -66,6 +82,7 @@ int vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx, struct vdec_lat_buf
 	list_add_tail(head, &msg_ctx->ready_queue);
 	msg_ctx->ready_num++;
 
+	vdec_msg_queue_inc(&buf->ctx->msg_queue, msg_ctx->hardware_index);
 	if (msg_ctx->hardware_index != MTK_VDEC_CORE)
 		wake_up_all(&msg_ctx->ready_to_use);
 	else
@@ -127,6 +144,7 @@ struct vdec_lat_buf *vdec_msg_queue_dqbuf(struct vdec_msg_queue_ctx *msg_ctx)
 		return NULL;
 	}
 	list_del(head);
+	vdec_msg_queue_dec(&buf->ctx->msg_queue, msg_ctx->hardware_index);
 
 	msg_ctx->ready_num--;
 	mtk_v4l2_debug(3, "dqueue buf type:%d addr: 0x%p num: %d",
@@ -241,10 +259,13 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 
 	vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
 	INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
+
+	atomic_set(&msg_queue->lat_list_cnt, 0);
+	atomic_set(&msg_queue->core_list_cnt, 0);
+
 	msg_queue->wdma_addr.size =
 		vde_msg_queue_get_trans_size(ctx->picinfo.buf_w,
 					     ctx->picinfo.buf_h);
-
 	err = mtk_vcodec_mem_alloc(ctx, &msg_queue->wdma_addr);
 	if (err) {
 		mtk_v4l2_err("failed to allocate wdma_addr buf");
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
index c43d427f5f54..b1aa5572ba49 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
@@ -72,6 +72,9 @@ struct vdec_lat_buf {
  * @wdma_wptr_addr: ube write point
  * @core_work: core hardware work
  * @lat_ctx: used to store lat buffer list
+ *
+ * @lat_list_cnt: used to record each instance lat list count
+ * @core_list_cnt: used to record each instance core list count
  */
 struct vdec_msg_queue {
 	struct vdec_lat_buf lat_buf[NUM_BUFFER_COUNT];
@@ -82,6 +85,9 @@ struct vdec_msg_queue {
 
 	struct work_struct core_work;
 	struct vdec_msg_queue_ctx lat_ctx;
+
+	atomic_t lat_list_cnt;
+	atomic_t core_list_cnt;
 };
 
 /**
-- 
2.18.0


