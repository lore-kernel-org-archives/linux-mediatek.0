Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E797DC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSRSSyNjG8B87P8wqMLA2MO1DUX1UNftaGvOimEvHaQ=; b=mbzzLg0zbUuJI21qO6la8FxEMy
	4ln5vkzOYgXYRaPI9NyC4cJKfjpVEn1CLTkCDTXdsfDDkDM6lS+2gbYzNGp+Q2XdLVlleqlsOf/rx
	TVSSyvJW7kwPel//YpamhGHpW+Z1eMKX6cf5+//An06CmrntUR++GAj3jHr89K9vMq2Rf2gLgqp/E
	xRq1Rp/rou5YLRSqaFPfaJoUOtHxFsRcHQiGbCSry7PJgBB6TuXwx7mZjTn+hpFx8lw4loxws36zO
	tAMh4E6N6l2U5UJRFgV7l7VihuXPT1DF8agPdNrqIf5PqTN2rw89GB41+8PCuiJMHNMZDQJD+I7iD
	eEq4whDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfKa-0000000FaG0-1mLd;
	Thu, 13 Jun 2024 07:57:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfKW-0000000FaEJ-3sdO;
	Thu, 13 Jun 2024 07:57:10 +0000
X-UUID: 86138378295a11efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oSRSSyNjG8B87P8wqMLA2MO1DUX1UNftaGvOimEvHaQ=;
	b=KRr0svgllOKPWabLV7LUB9/qd4PCAIzCgt5vjWmD/IlTxu2T5cK6+Bqqf2zU2Lg0axYwluVfW52dRRO9LgMYPNtPUTi/msfdfSBas5YZIxP57pSj59RbNgbt3q5gtI0sib2SGKOHCTJs8BPCeU3q3Cz1tBsbzLAQbYdwO9Q3BCE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:ccc2f35f-c73c-43af-977c-293feaca94ab,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:ca098744-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 86138378295a11efaf04eb0598667787-20240613
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2140268967; Thu, 13 Jun 2024 00:57:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 15:56:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 15:56:30 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 5/7] media: mediatek: vcodec: store source vb2 buffer
Date: Thu, 13 Jun 2024 15:55:30 +0800
Message-ID: <20240613075532.32128-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613075532.32128-1-yunfei.dong@mediatek.com>
References: <20240613075532.32128-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_005709_000995_735CA91D 
X-CRM114-Status: GOOD (  13.91  )
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

Store the current vb2 buffer when lat need to decode
again. Then lat work can get the same vb2 buffer directly
next time.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h      |  2 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c         | 11 ++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 1fabe8c5b7a4..0817be73f8e0 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -155,6 +155,7 @@ struct mtk_vcodec_dec_pdata {
  * @last_decoded_picinfo: pic information get from latest decode
  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Used
  *		     for stateful decoder.
+ * @last_vb2_v4l2_src: the backup of current source buffer.
  * @is_flushing: set to true if flushing is in progress.
  *
  * @current_codec: current set input codec, in V4L2 pixel format
@@ -201,6 +202,7 @@ struct mtk_vcodec_dec_ctx {
 	struct work_struct decode_work;
 	struct vdec_pic_info last_decoded_picinfo;
 	struct v4l2_m2m_buffer empty_flush_buf;
+	struct vb2_v4l2_buffer *last_vb2_v4l2_src;
 	bool is_flushing;
 
 	u32 current_codec;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 2a7e4fe24ed3..8aa379872ddc 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -320,7 +320,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	struct mtk_vcodec_dec_ctx *ctx =
 		container_of(work, struct mtk_vcodec_dec_ctx, decode_work);
 	struct mtk_vcodec_dec_dev *dev = ctx->dev;
-	struct vb2_v4l2_buffer *vb2_v4l2_src;
+	struct vb2_v4l2_buffer *vb2_v4l2_src = ctx->last_vb2_v4l2_src;
 	struct vb2_buffer *vb2_src;
 	struct mtk_vcodec_mem *bs_src;
 	struct mtk_video_dec_buf *dec_buf_src;
@@ -329,7 +329,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bool res_chg = false;
 	int ret;
 
-	vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	vb2_v4l2_src = vb2_v4l2_src ? vb2_v4l2_src : v4l2_m2m_next_src_buf(ctx->m2m_ctx);
 	if (!vb2_v4l2_src) {
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_dbg(1, ctx, "[%d] no available source buffer", ctx->id);
@@ -383,8 +383,13 @@ static void mtk_vdec_worker(struct work_struct *work)
 			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
 		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
 	} else {
-		if (ret != -EAGAIN)
+		if (ret != -EAGAIN) {
 			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+			ctx->last_vb2_v4l2_src = NULL;
+		} else {
+			ctx->last_vb2_v4l2_src = vb2_v4l2_src;
+		}
+
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 	}
 }
-- 
2.18.0


