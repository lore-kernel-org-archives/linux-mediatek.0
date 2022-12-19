Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038D6C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 07:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odog/isKgUkhZk4MV4Q1K/niqEMxgodJbAmD9P+gUPE=; b=Dp7EWNJ7E56T98/R6+Lm+XHQMr
	qWprzZSsZup6b2wfrRGicfcpt7DZ017XnyS6juIzcCIPAuRN56ks7rXq0pHpKu9op20DjI9Luy2EX
	nDtjkNSJ9exQX5zXfXzjANo34FBgmFsTCFyxr1eWCnMj4oBzsksBbFt99J+Gm5bldRuXOoW4jUxVJ
	zxA2Bzy7DsFl4HpXOjrgGrH+BGnq6ROH6WvqXMKgOtRQzD+2cbOo1T/C+o3Az2zPNsuyRXorMKOao
	wjM7ZEO9WVkhooaFpwJoupTiYm9MPiiMsxsMkSlR2kq0eHa/Z7Rgxq4P7CHeu3XDWTLh4EsVFSal0
	Gg32t2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7AY3-009sPt-9j; Mon, 19 Dec 2022 07:26:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7AVc-009qvu-4s; Mon, 19 Dec 2022 07:24:25 +0000
X-UUID: c9d1265f838b461b9d87b005010f275d-20221219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=odog/isKgUkhZk4MV4Q1K/niqEMxgodJbAmD9P+gUPE=;
	b=jhL3bA1per8Idx+AZmcVkTHrdl/AGG+O/nD1k65YQUzCtm2BDZo6iK5pEc6dsC4FovkVQ/lBeWJantI3LzkOCpqO29zz1RKmNajCZDTed7VIfxz4TRDdVDx631lGLLB3IEBjx5wryXxSxMghVUS6SzlezQPisVWsbzBwFT/7aYE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:4c4987c9-f36c-46c9-852f-e0f7d482def2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:36554df3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c9d1265f838b461b9d87b005010f275d-20221219
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1792591069; Mon, 19 Dec 2022 00:24:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Dec 2022 14:43:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Dec 2022 14:43:39 +0800
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
Subject: [PATCH v2,3/7] media: mediatek: vcodec: move lat_buf to the top of core list
Date: Mon, 19 Dec 2022 14:43:28 +0800
Message-ID: <20221219064332.2124-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219064332.2124-1-yunfei.dong@mediatek.com>
References: <20221219064332.2124-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_232424_304388_97A57205 
X-CRM114-Status: GOOD (  13.05  )
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

Current instance will decode done when begin to wait lat buf full,
move the lat_buf of current instance to the top of core list to make
sure current instance's lat_buf will be used firstly.

Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/vcodec/vdec_msg_queue.c      | 14 ++++++++++++++
 .../platform/mediatek/vcodec/vdec_msg_queue.h      |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index ad5002ca953e..ed526ff0ade6 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -174,9 +174,22 @@ void vdec_msg_queue_update_ube_wptr(struct vdec_msg_queue *msg_queue, uint64_t u
 
 bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
 {
+	struct vdec_lat_buf *buf, *tmp;
+	struct vdec_msg_queue_ctx *core_ctx;
 	long timeout_jiff;
 	int ret;
 
+	core_ctx = &msg_queue->ctx->dev->msg_queue_core_ctx;
+	spin_lock(&core_ctx->ready_lock);
+	list_for_each_entry_safe(buf, tmp, &core_ctx->ready_queue, core_list) {
+		if (buf && buf->ctx == msg_queue->ctx) {
+			list_move(&buf->core_list, &core_ctx->ready_queue);
+			queue_work(buf->ctx->dev->core_workqueue,
+				   &buf->ctx->msg_queue.core_work);
+		}
+	}
+	spin_unlock(&core_ctx->ready_lock);
+
 	timeout_jiff = msecs_to_jiffies(1000 * (NUM_BUFFER_COUNT + 2));
 	ret = wait_event_timeout(msg_queue->lat_ctx.ready_to_use,
 				 msg_queue->lat_ctx.ready_num == NUM_BUFFER_COUNT,
@@ -257,6 +270,7 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 	if (msg_queue->wdma_addr.size)
 		return 0;
 
+	msg_queue->ctx = ctx;
 	vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
 	INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
 
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
index b1aa5572ba49..56280d6682c5 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
@@ -72,6 +72,7 @@ struct vdec_lat_buf {
  * @wdma_wptr_addr: ube write point
  * @core_work: core hardware work
  * @lat_ctx: used to store lat buffer list
+ * @ctx: point to mtk_vcodec_ctx
  *
  * @lat_list_cnt: used to record each instance lat list count
  * @core_list_cnt: used to record each instance core list count
@@ -85,6 +86,7 @@ struct vdec_msg_queue {
 
 	struct work_struct core_work;
 	struct vdec_msg_queue_ctx lat_ctx;
+	struct mtk_vcodec_ctx *ctx;
 
 	atomic_t lat_list_cnt;
 	atomic_t core_list_cnt;
-- 
2.25.1


