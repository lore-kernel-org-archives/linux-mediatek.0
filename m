Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0A7C5478C
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 03:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aYhv12Ei/4yfF7DsV5pcHLs6C/tsptVLgekgyTfK2o0=; b=FctjPaFRsccn4Q3b7CvWqIDsRL
	c01xvELEP746gr/iigiytkZ5/mFOtmN0XTWjI1qlITWtlpsZms/LepvFy/xhGdOG1x6nngOSajIiv
	X9FcPIWgVGh2Ofa+AwPP7rcC3M8SiHVuRNqHl1qe6sJI4iq5Cli/yYxiJALpcBilnMsqQSIfcsDaT
	fQgw648qh89jjIXO4+pL4S/H5sBEDGsHbBbe8AQpr4JhC3mX7tkP7R8ddtQTX19C6tiV57Y87hCkJ
	wXnZe6XBK5JV3XXhY0hu7CkESQFhb1YrHcUJLCnmwzuUBhWKFM/qVK+tI3FR29kuuL43y3XDzzyyz
	u1fSPJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfWqz-0000000BquL-20tE;
	Thu, 29 Feb 2024 03:13:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfWqx-0000000Bqss-28W4;
	Thu, 29 Feb 2024 03:13:00 +0000
X-UUID: 6f385144d6b011ee999fed2339b27864-20240228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aYhv12Ei/4yfF7DsV5pcHLs6C/tsptVLgekgyTfK2o0=;
	b=iCAyrNOEQs9Co0VSv0GRswhR6Bf56YLJoqqT1eBCOd5DVcyEtkqbN/+LvByPUNNoBkNPoayMBAdbw3W6Rhta8oufRgHXyYZ3HVHSIMMlzAYV7ts/oYRjOm5dJWRkWnQ4ZYFek59zSk1bKSIZzXHy4/YnaWSntZ6/gVbG7mSMmv4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:5f0efb15-9ca1-4787-aafc-935fe5e52cf0,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:6f543d0,CLOUDID:7b5fd58f-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6f385144d6b011ee999fed2339b27864-20240228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1746007600; Wed, 28 Feb 2024 20:12:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Feb 2024 11:02:52 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Feb 2024 11:02:51 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Longfei Wang <longfei.wang@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>
CC: Irui Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] media: mediatek: vcodec: Handle VP9 superframe bitstream with 8 sub-frames
Date: Thu, 29 Feb 2024 11:02:49 +0800
Message-ID: <20240229030249.3404-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_191259_573557_29A55317 
X-CRM114-Status: GOOD (  14.92  )
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

The VP9 bitstream has 8 sub-frames into one superframe, the superframe
index validate failed when reach 8, modify the index checking so that the
last sub-frame can be decoded normally with stateful vp9 decoder.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
changed with v1:
 - add a new define 'VP9_MAX_SUPER_FRAMES_NUM' for superframes.
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c        | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
index 55355fa70090..039082f600c8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
@@ -16,6 +16,7 @@
 #include "../vdec_drv_base.h"
 #include "../vdec_vpu_if.h"
 
+#define VP9_MAX_SUPER_FRAMES_NUM 8
 #define VP9_SUPER_FRAME_BS_SZ 64
 #define MAX_VP9_DPB_SIZE	9
 
@@ -133,11 +134,11 @@ struct vp9_sf_ref_fb {
  */
 struct vdec_vp9_vsi {
 	unsigned char sf_bs_buf[VP9_SUPER_FRAME_BS_SZ];
-	struct vp9_sf_ref_fb sf_ref_fb[VP9_MAX_FRM_BUF_NUM-1];
+	struct vp9_sf_ref_fb sf_ref_fb[VP9_MAX_SUPER_FRAMES_NUM];
 	int sf_next_ref_fb_idx;
 	unsigned int sf_frm_cnt;
-	unsigned int sf_frm_offset[VP9_MAX_FRM_BUF_NUM-1];
-	unsigned int sf_frm_sz[VP9_MAX_FRM_BUF_NUM-1];
+	unsigned int sf_frm_offset[VP9_MAX_SUPER_FRAMES_NUM];
+	unsigned int sf_frm_sz[VP9_MAX_SUPER_FRAMES_NUM];
 	unsigned int sf_frm_idx;
 	unsigned int sf_init;
 	struct vdec_fb fb;
@@ -526,7 +527,7 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
 	/* if this super frame and it is not last sub-frame, get next fb for
 	 * sub-frame decode
 	 */
-	if (vsi->sf_frm_cnt > 0 && vsi->sf_frm_idx != vsi->sf_frm_cnt - 1)
+	if (vsi->sf_frm_cnt > 0 && vsi->sf_frm_idx != vsi->sf_frm_cnt)
 		vsi->sf_next_ref_fb_idx = vp9_get_sf_ref_fb(inst);
 }
 
@@ -735,7 +736,7 @@ static void get_free_fb(struct vdec_vp9_inst *inst, struct vdec_fb **out_fb)
 
 static int validate_vsi_array_indexes(struct vdec_vp9_inst *inst,
 		struct vdec_vp9_vsi *vsi) {
-	if (vsi->sf_frm_idx >= VP9_MAX_FRM_BUF_NUM - 1) {
+	if (vsi->sf_frm_idx > VP9_MAX_SUPER_FRAMES_NUM) {
 		mtk_vdec_err(inst->ctx, "Invalid vsi->sf_frm_idx=%u.", vsi->sf_frm_idx);
 		return -EIO;
 	}
-- 
2.18.0


