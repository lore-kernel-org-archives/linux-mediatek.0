Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBC9C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 08:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5i0uIbVdvEKDwjGgpSGBLRCEjpPon9Aw/m+cLooxtlA=; b=x0yUHDnquYsgidBjghIh6T8SFO
	Luk55+n3G76pbMxucDFOQunr6Ai/e5aGEaD0CMV4lvTX1nCGiGy8krk777NhTmVWeOgURPm+j93xQ
	f9zbFEiMEAjYCLf4wWBfigPcsn7pZamuat18o4h0Q6zcqQRSdVEZ0LIBU8eKUu1wHnIxPMB6tZQXs
	oy9tblgxd0z2Jr38WkNOrRhr8Ka2WQ9yfXwD4D8H5LOp7zN7Ym0Eb5D2TErGKh/Zt4iwXQ72lZdJU
	r+srs1wZF9AQNzw47asmE4JdbdMb6uEMYiJggPSOFdPPehEzK49jHdfRVI4Jg7xUOLMFxZfnbHVBd
	ecttTlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbc0B-00000004Ljs-0AUr;
	Wed, 07 Aug 2024 08:26:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbz7-00000004LMn-209D;
	Wed, 07 Aug 2024 08:25:31 +0000
X-UUID: 99a19dfa549611efa6c87f6b4542ff6b-20240807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5i0uIbVdvEKDwjGgpSGBLRCEjpPon9Aw/m+cLooxtlA=;
	b=hchdrL6x0yqTG57uePaozPCuyfPq0F8H3LgFSdyi0nlMRB9kKgbEuKpTwuS0qlYV6suHGgjFbswanrNqD80kMKDzMqHm/5jnRO4DWlo8S4a1+9IrO4g3YjbyW6twG07deBdIBcKKcWcSFi6DaHkGsCFG07y9xUHla6WabZjZ180=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:9446c8fb-a9ac-405e-a044-b75a63a0e9ae,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:6dc6a47,CLOUDID:e0e0d53e-6019-4002-9080-12f7f4711092,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 99a19dfa549611efa6c87f6b4542ff6b-20240807
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 29792774; Wed, 07 Aug 2024 01:25:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 16:24:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Aug 2024 16:24:51 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 5/7] media: mediatek: vcodec: store source vb2 buffer
Date: Wed, 7 Aug 2024 16:24:35 +0800
Message-ID: <20240807082444.21280-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807082444.21280-1-yunfei.dong@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.493400-8.000000
X-TMASE-MatchedRID: WY68sLfT96+SDoYDmYjzLAPZZctd3P4BSjyMfjCRfaMdbuyvB6mjXBa5
	2myIWiom6akcHd5iadlNEOwtHhbbvlIMRaTXK1BM4RtSDjG+z7Dt/okBLaEo+MA0eOJZYj7thL9
	xNXVrt1S5sKf/odud/uztdCjtxnSM4vZjlIwkBi8SEYfcJF0pRZYcYQ11P5U/myiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1wqlxFFNgYzXo0jGXNiJLafAnx8F8tZmaKJywXlyBY9FYi5vGM9MT8sC+k
	sT6a9fy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.493400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 54638FC186E42D7A37EA7B591EBFA8021FE6499DA4B60AFF12273B38CAE3C4672000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_012529_556059_355AC317 
X-CRM114-Status: GOOD (  14.16  )
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

Store the current vb2 buffer when lat need to decode again.
Then lat work can get the same vb2 buffer directly next time.

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
2.46.0


