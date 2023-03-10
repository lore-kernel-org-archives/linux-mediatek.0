Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF11C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 02:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E32PwqnhE80CiZUxZ6uWYUqazqWNe/vh/gd6x779/5A=; b=GahLadqW+oV3lXkeU8F+7Cf9h6
	Rz5Sm+UvXn5aPaqAPCArLg9GkcQ4E2Spzd26sqfSwdgui9S/pkYQbRlFZBbHP6AN47upkge39ueIV
	hLhNP5J7YFhlXdyK7jBzsCd11D+yC4Z39IYmJCjJoRw5kL7G17LsYY7WklevMPn2NIiiOFrYerX5x
	U8BnLzNuST+fxMC0CWV4xA1vf8NlujMtDyr9RE/8rlwpEibZwS0GfIHVbs8c8irf8ddyD94NLnF/2
	QLLH0zqVBbn3SsvFfgmXx8y4RVZubM8utiEsBVtVRLbmQSp6L2C1pf1D+7bq10e7TJStoJNKU253w
	Eak863dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paSbd-00CjGu-Uf; Fri, 10 Mar 2023 02:35:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paSbJ-00Cj7h-MP; Fri, 10 Mar 2023 02:35:24 +0000
X-UUID: 2e947abebeec11eda799af78a38f2b8e-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E32PwqnhE80CiZUxZ6uWYUqazqWNe/vh/gd6x779/5A=;
	b=azJ/8YG6wYxEXxN5mAd7KM7vQPg55tpEWCodo3lPu2gd3NV33EsIiJjs+MzQRCj/FBf0dURJDHeWSjHeTlJiakiFBTfESWTWkMczjw3IcvHyrebZQ2usynUhHmG+T+KnZHi9U318RUcnnJs/mSw6NeHn2ynECVfUbhV9ej28Sj8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:3cc65de9-b1f0-42be-803c-f022ae326b64,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:20f7cab2-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 2e947abebeec11eda799af78a38f2b8e-20230309
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1819842072; Thu, 09 Mar 2023 19:35:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 10 Mar 2023 10:35:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 10 Mar 2023 10:35:08 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
	<maoguang.meng@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [V2,4/7] media: mtk-jpeg: reconstructs the initialization mode of worker
Date: Fri, 10 Mar 2023 10:34:58 +0800
Message-ID: <1678415701-1691-5-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1678415701-1691-1-git-send-email-kyrie.wu@mediatek.com>
References: <1678415701-1691-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_183521_779245_9A0691F6 
X-CRM114-Status: GOOD (  13.77  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

exclude is_jpgenc_multihw or is_jpgdec_multihw for judgment,
and re-initialize jpeg worker.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 9 +++------
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 ++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d940dc5ede74..e89195f1989c 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1575,12 +1575,7 @@ static int mtk_jpeg_open(struct file *file)
 		goto free;
 	}
 
-	if (jpeg->is_jpgenc_multihw)
-		INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
-
-	if (jpeg->is_jpgdec_multihw)
-		INIT_WORK(&ctx->jpeg_work, mtk_jpegdec_worker);
-
+	INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
 	INIT_LIST_HEAD(&ctx->dst_done_queue);
 	spin_lock_init(&ctx->done_queue_lock);
 	v4l2_fh_init(&ctx->fh, vfd);
@@ -1901,6 +1896,7 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
 	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.multi_core = true,
+	.jpeg_worker = mtk_jpegenc_worker,
 };
 
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
@@ -1913,6 +1909,7 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 	.multi_core = true,
+	.jpeg_worker = mtk_jpegdec_worker,
 };
 
 #if defined(CONFIG_OF)
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index f87358cc9f47..e118a0175f75 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -61,6 +61,7 @@ enum mtk_jpeg_ctx_state {
  * @out_q_default_fourcc:	output queue default fourcc
  * @cap_q_default_fourcc:	capture queue default fourcc
  * @multi_core:		mark jpeg hw is multi_core or not
+ * @jpeg_worker:		jpeg dec or enc worker
  */
 struct mtk_jpeg_variant {
 	struct clk_bulk_data *clks;
@@ -76,6 +77,7 @@ struct mtk_jpeg_variant {
 	u32 out_q_default_fourcc;
 	u32 cap_q_default_fourcc;
 	bool multi_core;
+	void (*jpeg_worker)(struct work_struct *work);
 };
 
 struct mtk_jpeg_src_buf {
-- 
2.18.0


