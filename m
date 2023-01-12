Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA00C54EBC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 04:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+ny//H/fz9Tpi3VSrY/LcUcikt0SFr5sTQYWG+9pqs=; b=EGn/oaOzXTY9Zcnj2JWZ+TUewW
	MNzrWpUmB3faQDGZtk1HEOA8/T03hzb8Ip7M8Gju42QpTJRQogmpcehw0fqLbzX1Cm0K/NZaGzvS4
	iRYXxUg4C19Hua0LgnsSlVQNusVOEDD1uqWIg7OYhIAU2zs4wgHdu0k52/RR0Hri8qghSxZzpPeoH
	ZWF7XmPRu1rQQNyL3j7t3Z+W2IaolWZoFwHwOxXY54BBxO4AIszl9kmrSvG3o7f0lqfAX/BN+ngp2
	eR0zQPtlh0FWgzFX2kVJQtT8aSNmdIqWGsh9IDGDMhZ+WcMHAMrBL+jaW0IRwEAOqtgJsmRqiek9O
	C5kK/D1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFoxK-00Dene-Ej; Thu, 12 Jan 2023 04:12:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFox7-00Dehz-6w; Thu, 12 Jan 2023 04:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k+ny//H/fz9Tpi3VSrY/LcUcikt0SFr5sTQYWG+9pqs=; b=NMFiiP0vaySw+8bF7kc6yZhhqz
	imsL8J6ZHaYGUquMiCPTipH1vLXxbIe4Q1HWKhmPH/P7GMlDfi5W1amzeAWHGcfg+g9wysYx4VDGP
	XoxPJO/0Ld6yd4WayTTqWFdwsCZbdEf9jgSZG2imyotubzFPxdZWEy1PfkmMSsdy/PwAzd0wo0wtX
	7ApJMdtAWGOQyX/q2EvbCqrgIXKU9B+Gk5mRxeRPEx5lMf1qvpMGmolWgg7AN/1/kn86Ow9WsFE5k
	lJvF2qyNm7Ks8cG/jDNZBINr9Oa/hSJiphd4yqv4NYxSMMo653Z/2jQsQYdeQW610KmwU8yk5fbma
	5oin9O/Q==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFowr-003u0n-1B;
	Thu, 12 Jan 2023 04:12:22 +0000
X-UUID: 4cb97e16922f11edbbe3f76fe852e059-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=k+ny//H/fz9Tpi3VSrY/LcUcikt0SFr5sTQYWG+9pqs=;
	b=buD4Zjms1KmqlduyojnjjXRFIL34UvVjg5dH13ZsfTp/7NIu5k7qRRdMK+ENBr//13jq77tXgMtxI8hFVl4OGGGewgh0Zqd0fSZ7H1BivuDjMLxiJaZzF32W0u+TQORFiejIW5YkjjEtw4Djh05WSL/O9V/pLiIL/IJPsJPQobo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:05f04d30-3411-4acd-9eb6-dde4bd3ead16,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:05f04d30-3411-4acd-9eb6-dde4bd3ead16,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:54b2068c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230112121145TPSUWE9A,BulkQuantity:3,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 4cb97e16922f11edbbe3f76fe852e059-20230111
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 466460664; Wed, 11 Jan 2023 21:12:16 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 12 Jan 2023 12:11:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 12 Jan 2023 12:11:42 +0800
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
Subject: [PATCH v3,1/7] media: mediatek: vcodec: add params to record lat and core lat_buf count
Date: Thu, 12 Jan 2023 12:11:34 +0800
Message-ID: <20230112041140.833-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112041140.833-1-yunfei.dong@mediatek.com>
References: <20230112041140.833-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_041218_707259_DBB64551 
X-CRM114-Status: GOOD (  15.28  )
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
- remove the mutex for atomic
- for there are only lat and core, no need to use hardware_index for every hardware.
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


