Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A531C54EBD
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 04:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMIEUK+vAlHILuLLQd0pKye2ILITzg/TKTRlGmjn3lA=; b=LZLwk1e9UlDIVyKY4w9ZrWBIGg
	JYqpl9xM/FXVKee1Ttv70OL5E9im+aJCj48UQRDGbLDLZrZSXxk6IOcfpT8YABvOL5wTQqwtWsXrx
	0/UIWAK7FqEOvXiSx6GT6MCuo5aoYZPXnno4oTL7nvC2/g/fyX+B+0lQ3PEaCQenwvQiBttmzBkZI
	dFIyqVdgWn+1xnXAaTE82AeVRM4vgNsSBmKF4ZR25MaGq+mc9urUoiZJPRjnne+ki+yl7ws6QbYGU
	MRvb5Jk7vntmCimXsOMjYq3RsDV9s4HiPxMj2/HmPirGU/C59HhqjRKXF0kySK6EzhojyALZPGInd
	a4EQtY/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFoxi-00Df0E-I2; Thu, 12 Jan 2023 04:13:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFoxS-00Deqx-3o; Thu, 12 Jan 2023 04:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cMIEUK+vAlHILuLLQd0pKye2ILITzg/TKTRlGmjn3lA=; b=HNcaqFyGNNZJYNJ4qtoPSbqNaO
	gLSu33Yj8BlSsL33/sW2tZqBosNvNP6wQbZkZ0ZWCiG9+ht5xuLvC2/hKQsGumi4aobSUEF+IH9Ak
	9VqIJIhmuGH++YWnzB5myo8sPsu7RP/MdUTpKgxw1+Xz/W8K9f+BOwRVgBcR7xsvv/FhBwSnnP6dT
	Rs414iG0JYcywGtG0CpjgiIJ2d3sGurdE7olR1C+RkL3L3/FUDwQGu42prcf8MQ0SkyWy9NNpFXCz
	+pHU6zjWsItZjnF+sbew8YnQX7OuLRQZ0vTwCm9cCEqvZoVGuCnKFGLP1MWZkO0YQkmvWrvhihSHs
	b42kV98w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFowq-003u0i-1c;
	Thu, 12 Jan 2023 04:12:43 +0000
X-UUID: 3c7f3892922f11edbbe3f76fe852e059-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cMIEUK+vAlHILuLLQd0pKye2ILITzg/TKTRlGmjn3lA=;
	b=dqBT91xulAg0+T0QmtkT+1tLapxpJ8HWiBKqmTHUAU2wuU9MP/3RP5ErKKJqmMPEJy6X8xuKq76N0CiLZ1Le5fc//g9Ih3/5qFFgBTg0O6gRtcZ+R+AJb9De3cprl9AjBZ3nhsE/c5gymGQuYBKqJ84s1YX1IIkTVHReJN9qCJU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:62ea4268-5f88-441f-ad66-7cc67cc4a617,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:ca8295f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 3c7f3892922f11edbbe3f76fe852e059-20230111
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 75581641; Wed, 11 Jan 2023 21:11:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 12 Jan 2023 12:11:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 12 Jan 2023 12:11:45 +0800
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
Subject: [PATCH v3,4/7] media: mediatek: vcodec: add core decode done event
Date: Thu, 12 Jan 2023 12:11:37 +0800
Message-ID: <20230112041140.833-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112041140.833-1-yunfei.dong@mediatek.com>
References: <20230112041140.833-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_041218_775922_22FD89A3 
X-CRM114-Status: GOOD (  13.47  )
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

Need to make sure core decode done before current instance is free.

Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c | 4 +++-
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index 0da6e3e2ef0b..ce7c82e38103 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -196,7 +196,7 @@ bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
 	spin_unlock(&core_ctx->ready_lock);
 
 	timeout_jiff = msecs_to_jiffies(1000 * (NUM_BUFFER_COUNT + 2));
-	ret = wait_event_timeout(msg_queue->lat_ctx.ready_to_use,
+	ret = wait_event_timeout(msg_queue->ctx->msg_queue.core_dec_done,
 				 msg_queue->lat_ctx.ready_num == NUM_BUFFER_COUNT,
 				 timeout_jiff);
 	if (ret) {
@@ -257,6 +257,7 @@ static void vdec_msg_queue_core_work(struct work_struct *work)
 	mtk_vcodec_dec_disable_hardware(ctx, MTK_VDEC_CORE);
 	vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
 
+	wake_up_all(&ctx->msg_queue.core_dec_done);
 	if (atomic_read(&lat_buf->ctx->msg_queue.core_list_cnt)) {
 		mtk_v4l2_debug(3, "re-schedule to decode for core: %d",
 			       dev->msg_queue_core_ctx.ready_num);
@@ -281,6 +282,7 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 
 	atomic_set(&msg_queue->lat_list_cnt, 0);
 	atomic_set(&msg_queue->core_list_cnt, 0);
+	init_waitqueue_head(&msg_queue->core_dec_done);
 
 	msg_queue->wdma_addr.size =
 		vde_msg_queue_get_trans_size(ctx->picinfo.buf_w,
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
index 56280d6682c5..a75c04418f52 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
@@ -76,6 +76,7 @@ struct vdec_lat_buf {
  *
  * @lat_list_cnt: used to record each instance lat list count
  * @core_list_cnt: used to record each instance core list count
+ * @core_dec_done: core work queue decode done event
  */
 struct vdec_msg_queue {
 	struct vdec_lat_buf lat_buf[NUM_BUFFER_COUNT];
@@ -90,6 +91,7 @@ struct vdec_msg_queue {
 
 	atomic_t lat_list_cnt;
 	atomic_t core_list_cnt;
+	wait_queue_head_t core_dec_done;
 };
 
 /**
-- 
2.18.0


