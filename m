Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342D7C54798
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 02:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=77P3giULlv83SXb4JB8L4IRfGqmm3Ld83AhH+UMtJzk=; b=IXrGx3E9N/Z+2besOPKfS5dv5u
	vwOFL2grnIory1Y1rXPDJsVfuDpiuHvpD/J9Zf9Ez0zXMdg0PKHQM0X/GHADQX+rgvEfgbAwzkAKr
	f3flTiuRF4GS6vPZ0+RI7lb5sn95jBdg3L8Y2tWvyvh6w89vdmwYc3i6Cdbx7y5heA/eltG1WlFsF
	pxvmlPGmJlonSyXor6WXRpT6aDyTMlLIMT2E59zU8mcwGvK3iLFngEncJ2guBkk/y0OVhyGwtIOLU
	qeni5uRbYWPESvgxeMPTK0xdwapyci5enXNks2jvfFKHd1v8WFFjtbQG1XHQBNt6qfsY3ekjS9LRH
	b+3VMUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhh5l-0000000FzxQ-18lP;
	Wed, 06 Mar 2024 02:33:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhh5h-0000000FzvS-3uPr;
	Wed, 06 Mar 2024 02:33:11 +0000
X-UUID: daa0a0fcdb6111eea8a22560583bddef-20240305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=77P3giULlv83SXb4JB8L4IRfGqmm3Ld83AhH+UMtJzk=;
	b=IT8a+wLtQXw8PaIJBZq/QqW9d+2YGnLoNEBmiLPsHZMum8Witp6i3hc6mW0l23PbL0nMHXlclsvs0mtKcy7c19E0i8+RhzfWePDxMMO9kfEVf2dg8qiCuU91Cetm7dHXuEEhoFgcCzeVzRTeaqET0uxyz2o5g8DloGhvJyliRLw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:31184165-bcb5-472b-b341-289798c87c99,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:af461090-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: daa0a0fcdb6111eea8a22560583bddef-20240305
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1447257655; Tue, 05 Mar 2024 19:33:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Mar 2024 10:12:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Mar 2024 10:12:25 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Longfei Wang <longfei.wang@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, <sebastian.fricke@collabora.com>
CC: Irui Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3] media: mediatek: vcodec: Handle VP9 superframe bitstream with 8 sub-frames
Date: Wed, 6 Mar 2024 10:12:23 +0800
Message-ID: <20240306021223.14417-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.704300-8.000000
X-TMASE-MatchedRID: 61qs6S/TXDLsgU6kU4VK+KKa0xB73sAAgDRlwc+wR6edCqKtxM6bhy2f
	RWXvh9E9X3E2fHKxS5KuhFLSFG7xdxdAkyS/8v/XA9lly13c/gGH7D1bP/FcOtM2my+Pv+HL0c8
	aNDRHFani8zVgXoAltsIJ+4gwXrEtec3QM3secWbczxMp1BlefbKx6BptLBaOTuz1STu0jwnIP0
	9yQZcG688DF2M8b0VflExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.704300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5EBF45FC3B78C1905E70C4BACA90B4BFA1BABC8770E7EF027E79EB4560DC7DAF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_183309_986346_B7922AB6 
X-CRM114-Status: GOOD (  14.29  )
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

The VP9 bitstream uses superframes, which each contain 8 sub-frames,
enable accessing the last superframe by increasing the range of the index
vaidation as the maximum number of superframes is 8 and not 7, so that the
last sub-frame can be decoded normally with stateful vp9 decoder.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
changed with v2:
 - update commit message only.

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


