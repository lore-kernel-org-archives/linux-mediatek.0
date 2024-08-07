Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A7FC52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfQgDnj5vTcsrLlLiAktueXA/e5irUfl8Qn12AmdETU=; b=tscjQQskNVTtRHr+cr3cvi7bUP
	skjTLOxGw9GHN72pWPwTSEYgxavnCiU53POul7WbJ8f0Z8U6jIONtqbFDjW/6VXyg1C3NkgxEBE/4
	UciXkMZi3aBSJyHPjwmK8CkALyopRkKDQXmZR7VRfM8A1nHKjNw48/CnZU5+QYTkw3CgVFbATOV7d
	q2EBPPZyKa2ZIsttskU5FqIjlOUSK3Vft/aD0j2PVfCR+1buw6B2QBRTrIs2lJW1G8zS2Z+SrouWy
	d/2DU1j8rjKQi1YJioXPnSMcuXIFEA8Xq9sT8RWSvBscV0/YniaQqYdxTg8o6CRmga3XYPNJ0kgVB
	mYkxiDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbc1E-00000004M8K-0sn5;
	Wed, 07 Aug 2024 08:27:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbz9-00000004LMn-1bZX;
	Wed, 07 Aug 2024 08:25:32 +0000
X-UUID: 988470a0549611efa6c87f6b4542ff6b-20240807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CfQgDnj5vTcsrLlLiAktueXA/e5irUfl8Qn12AmdETU=;
	b=kfD7SMuwscisfl/a74T6ASwqBaEF/LwhMZ1J+ijV+Wjzb5msoLWCPwK7O0JHk8ULtUdOARBxHIcvrQHSiGktlB5LWHpXods+lV0i9/ZY8s4XVIM4YBPasSnT9FxFzFtwMTM73tCry4gexnyu0Pxe1tZh0RKucxfDn17kKCdvJpQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:17e1a81a-18c0-45ba-bec8-20cb42cbb1d8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:13957e0e-581f-42a8-8c8e-0df96f3eec79,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 988470a0549611efa6c87f6b4542ff6b-20240807
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1880824391; Wed, 07 Aug 2024 01:25:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 16:24:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Aug 2024 16:24:52 +0800
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
Subject: [PATCH v4 6/7] media: mediatek: vcodec: replace v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
Date: Wed, 7 Aug 2024 16:24:36 +0800
Message-ID: <20240807082444.21280-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807082444.21280-1-yunfei.dong@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.373600-8.000000
X-TMASE-MatchedRID: PiuGJd1Q1ubczN5mU8Y5FyEK7m5BT0HZrrEvQogcy/GSLiCOgnAfc3nv
	qbLkjGO6HjSnFV7/4glhesC82wLQK2iMXUkD7gZJA9lly13c/gHt/okBLaEo+MA0eOJZYj7thL9
	xNXVrt1S5sKf/odud/i+HjmSH3Jw4f3KdOoA7IIjJ5W6OZe5hhbi8G4TZfQeVQmp51f2+39mpsO
	bNt5zEW3rBUTKHgHE1gDLqnrRlXrZ8nn9tnqel2DsAVzN+Ov/stnkn6oxtoi8wFokeveLNi+ELz
	BpD2lS1MxdjblUT1ptHp+a202IjAA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.373600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F5AD6CE6DA69ECD8AB27FE9F09BD22586B5BA9C54A74B7914FD3D0BF337F574F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_012531_501277_9EE80EC1 
X-CRM114-Status: GOOD (  13.63  )
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

There isn't lock to protect source buffer when get next src buffer,
if the source buffer is removed for some unknown reason before lat
work queue execute done, will lead to remove source buffer or buffer
done error.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 30 +++++++++++++------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 8aa379872ddc..3dba3549000a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -321,6 +321,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 		container_of(work, struct mtk_vcodec_dec_ctx, decode_work);
 	struct mtk_vcodec_dec_dev *dev = ctx->dev;
 	struct vb2_v4l2_buffer *vb2_v4l2_src = ctx->last_vb2_v4l2_src;
+	struct vb2_v4l2_buffer *vb2_v4l2_dst;
 	struct vb2_buffer *vb2_src;
 	struct mtk_vcodec_mem *bs_src;
 	struct mtk_video_dec_buf *dec_buf_src;
@@ -329,7 +330,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bool res_chg = false;
 	int ret;
 
-	vb2_v4l2_src = vb2_v4l2_src ? vb2_v4l2_src : v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	vb2_v4l2_src = vb2_v4l2_src ? vb2_v4l2_src : v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
 	if (!vb2_v4l2_src) {
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_dbg(1, ctx, "[%d] no available source buffer", ctx->id);
@@ -381,17 +382,28 @@ static void mtk_vdec_worker(struct work_struct *work)
 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
 		if (src_buf_req)
 			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
-		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
-	} else {
-		if (ret != -EAGAIN) {
-			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-			ctx->last_vb2_v4l2_src = NULL;
-		} else {
-			ctx->last_vb2_v4l2_src = vb2_v4l2_src;
-		}
+		vb2_v4l2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(vb2_v4l2_dst, state);
+		v4l2_m2m_buf_done(vb2_v4l2_src, state);
 
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		return;
 	}
+
+	/* If each codec return -EAGAIN to decode again, need to backup current source
+	 * buffer, then the driver will get this buffer next time.
+	 *
+	 * If each codec decode error, must to set buffer done with error status for
+	 * this buffer have been removed from ready list.
+	 */
+	ctx->last_vb2_v4l2_src = (ret != -EAGAIN) ? NULL : vb2_v4l2_src;
+	if (ret && ret != -EAGAIN) {
+		if (src_buf_req)
+			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		v4l2_m2m_buf_done(vb2_v4l2_src, state);
+	}
+
+	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 }
 
 static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
-- 
2.46.0


