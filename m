Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CCDCDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5Hv2WO6u01GIAFEnk971An4cAnzDDrC7y8LlRUyV+Y=; b=02xIJBYD6LZlnFe6C6UkqhY7j5
	zgsDWj4KBreF8yI8OS55aOgk8rDJbnuLISRlEPs69fy4Cc7H5nDBSgg/DdGVejHfknXJrKaO+8Wqs
	hBkilUm8cxtXg1wzBBA9rId1N1t+0ExtGGY0/WD7HY3GL5UIjrQAKx40FHFMtTpcuvWZGsxLwBhqX
	L0wZwyFFHlcdk1/aQhDWep7Cu4cSEa/BiTfa6gJFwQkzMqSdoJL6Pb2mKx/eq8k9aZWG+39rW+jrA
	SlkC1tTjikQjEuFYHTi90nj0dO/OCOHksFvcmZ92q5XHsn7V1p4RCgnEu9FYzMPfqw29rPeZtz5UI
	1s9Ns45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrke-000Kwl-3A;
	Thu, 12 Oct 2023 09:13:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrkP-000Kme-2B;
	Thu, 12 Oct 2023 09:12:54 +0000
X-UUID: 7f26904668df11ee9b7791016c24628a-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=L5Hv2WO6u01GIAFEnk971An4cAnzDDrC7y8LlRUyV+Y=;
	b=LJouQSO/wXMugSTOdITyEdzeC9xaXAXcE9RIGYH4dS6mSSDsv6wy5zVjf3An2bN/LazuZKgX6vEZQq+kRX6rpRvc/ohQHG8d1yCEIAq9AjJloMAhKgS/FVFg/Lb5S9+XYfNaASHPILh1Ffl4gJiWnjuzAEi15AUtQ7ag9LnNB4I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:c2893cc5-c3ce-4131-b8eb-2661a960b415,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:224ad9bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7f26904668df11ee9b7791016c24628a-20231012
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1921813721; Thu, 12 Oct 2023 02:12:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 17:12:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 17:12:08 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ping-Hsun Wu
	<ping-hsun.wu@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v7 10/12] media: platform: mtk-mdp3: add mt8195 shared memory configurations
Date: Thu, 12 Oct 2023 17:12:04 +0800
Message-ID: <20231012091206.20165-11-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231012091206.20165-1-moudy.ho@mediatek.com>
References: <20231012091206.20165-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_021249_763008_B9592333 
X-CRM114-Status: GOOD (  17.58  )
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

The configuration of the MT8195 components in the shared memory
is defined in the header file "mdp_sm_mt8195.h".

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mdp_sm_mt8195.h    | 283 ++++++++++++++++++
 .../platform/mediatek/mdp3/mtk-img-ipi.h      |   3 +
 2 files changed, 286 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h

diff --git a/drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h b/drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h
new file mode 100644
index 000000000000..b09f48222d24
--- /dev/null
+++ b/drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h
@@ -0,0 +1,283 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MDP_SM_MT8195_H__
+#define __MDP_SM_MT8195_H__
+
+#include "mtk-mdp3-type.h"
+
+/*
+ * ISP-MDP generic output information
+ * MD5 of the target SCP prebuild:
+ *     a49ec487e458b5971880f1b63dc2a9d5
+ */
+
+#define IMG_MAX_SUBFRAMES_8195	20
+
+struct img_comp_frame_8195 {
+	u32 output_disable;
+	u32 bypass;
+	u32 in_width;
+	u32 in_height;
+	u32 out_width;
+	u32 out_height;
+	struct img_crop crop;
+	u32 in_total_width;
+	u32 out_total_width;
+} __packed;
+
+struct img_comp_subfrm_8195 {
+	u32 tile_disable;
+	struct img_region in;
+	struct img_region out;
+	struct img_offset luma;
+	struct img_offset chroma;
+	s32 out_vertical; /* Output vertical index */
+	s32 out_horizontal; /* Output horizontal index */
+} __packed;
+
+struct mdp_rdma_subfrm_8195 {
+	u32 offset[IMG_MAX_PLANES];
+	u32 offset_0_p;
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+	u32 in_tile_xleft;
+	u32 in_tile_ytop;
+} __packed;
+
+struct mdp_rdma_data_8195 {
+	u32 src_ctrl;
+	u32 comp_ctrl;
+	u32 control;
+	u32 iova[IMG_MAX_PLANES];
+	u32 iova_end[IMG_MAX_PLANES];
+	u32 mf_bkgd;
+	u32 mf_bkgd_in_pxl;
+	u32 sf_bkgd;
+	u32 ufo_dec_y;
+	u32 ufo_dec_c;
+	u32 transform;
+	u32 dmabuf_con0;
+	u32 ultra_th_high_con0;
+	u32 ultra_th_low_con0;
+	u32 dmabuf_con1;
+	u32 ultra_th_high_con1;
+	u32 ultra_th_low_con1;
+	u32 dmabuf_con2;
+	u32 ultra_th_high_con2;
+	u32 ultra_th_low_con2;
+	u32 dmabuf_con3;
+	struct mdp_rdma_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_fg_subfrm_8195 {
+	u32 info_0;
+	u32 info_1;
+} __packed;
+
+struct mdp_fg_data_8195 {
+	u32 ctrl_0;
+	u32 ck_en;
+	struct mdp_fg_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_hdr_subfrm_8195 {
+	u32 win_size;
+	u32 src;
+	u32 clip_ofst0;
+	u32 clip_ofst1;
+	u32 hist_ctrl_0;
+	u32 hist_ctrl_1;
+	u32 hdr_top;
+	u32 hist_addr;
+} __packed;
+
+struct mdp_hdr_data_8195 {
+	u32 top;
+	u32 relay;
+	struct mdp_hdr_subfrm_8195   subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_aal_subfrm_8195 {
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+} __packed;
+
+struct mdp_aal_data_8195 {
+	u32 cfg_main;
+	u32 cfg;
+	struct mdp_aal_subfrm_8195   subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_rsz_subfrm_8195 {
+	u32 control2;
+	u32 src;
+	u32 clip;
+	u32 hdmirx_en;
+	u32 luma_h_int_ofst;
+	u32 luma_h_sub_ofst;
+	u32 luma_v_int_ofst;
+	u32 luma_v_sub_ofst;
+	u32 chroma_h_int_ofst;
+	u32 chroma_h_sub_ofst;
+	u32 rsz_switch;
+	u32 merge_cfg;
+} __packed;
+
+struct mdp_rsz_data_8195 {
+	u32 coeff_step_x;
+	u32 coeff_step_y;
+	u32 control1;
+	u32 control2;
+	u32 etc_control;
+	u32 prz_enable;
+	u32 ibse_softclip;
+	u32 tap_adapt;
+	u32 ibse_gaincontrol1;
+	u32 ibse_gaincontrol2;
+	u32 ibse_ylevel_1;
+	u32 ibse_ylevel_2;
+	u32 ibse_ylevel_3;
+	u32 ibse_ylevel_4;
+	u32 ibse_ylevel_5;
+	struct mdp_rsz_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_tdshp_subfrm_8195 {
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+	u32 hist_cfg_0;
+	u32 hist_cfg_1;
+} __packed;
+
+struct mdp_tdshp_data_8195 {
+	u32 cfg;
+	struct mdp_tdshp_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_color_subfrm_8195 {
+	u32 in_hsize;
+	u32 in_vsize;
+} __packed;
+
+struct mdp_color_data_8195 {
+	u32 start;
+	struct mdp_color_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_ovl_subfrm_8195 {
+	u32 L0_src_size;
+	u32 roi_size;
+} __packed;
+
+struct mdp_ovl_data_8195 {
+	u32 L0_con;
+	u32 src_con;
+	struct mdp_ovl_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_pad_subfrm_8195 {
+	u32 pic_size;
+} __packed;
+
+struct mdp_pad_data_8195 {
+	struct mdp_pad_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_tcc_subfrm_8195 {
+	u32 pic_size;
+} __packed;
+
+struct mdp_tcc_data_8195 {
+	struct mdp_tcc_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_wrot_subfrm_8195 {
+	u32 offset[IMG_MAX_PLANES];
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+	u32 main_buf;
+} __packed;
+
+struct mdp_wrot_data_8195 {
+	u32 iova[IMG_MAX_PLANES];
+	u32 control;
+	u32 stride[IMG_MAX_PLANES];
+	u32 mat_ctrl;
+	u32 fifo_test;
+	u32 filter;
+	u32 pre_ultra;
+	u32 framesize;
+	u32 afbc_yuvtrans;
+	u32 scan_10bit;
+	u32 pending_zero;
+	u32 bit_number;
+	u32 pvric;
+	u32 vpp02vpp1;
+	struct mdp_wrot_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_wdma_subfrm_8195 {
+	u32 offset[IMG_MAX_PLANES];
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+} __packed;
+
+struct mdp_wdma_data_8195 {
+	u32 wdma_cfg;
+	u32 iova[IMG_MAX_PLANES];
+	u32 w_in_byte;
+	u32 uv_stride;
+	struct mdp_wdma_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct isp_data_8195 {
+	u64 dl_flags; /* 1 << (enum mdp_comp_type) */
+	u32 smxi_iova[4];
+	u32 cq_idx;
+	u32 cq_iova;
+	u32 tpipe_iova[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct img_compparam_8195 {
+	u32 type; /* enum mdp_comp_id */
+	u32 id; /* engine alias_id */
+	u32 input;
+	u32 outputs[IMG_MAX_HW_OUTPUTS];
+	u32 num_outputs;
+	struct img_comp_frame_8195 frame;
+	struct img_comp_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+	u32 num_subfrms;
+	union {
+		struct mdp_rdma_data_8195 rdma;
+		struct mdp_fg_data_8195 fg;
+		struct mdp_hdr_data_8195 hdr;
+		struct mdp_aal_data_8195 aal;
+		struct mdp_rsz_data_8195 rsz;
+		struct mdp_tdshp_data_8195 tdshp;
+		struct mdp_color_data_8195 color;
+		struct mdp_ovl_data_8195 ovl;
+		struct mdp_pad_data_8195 pad;
+		struct mdp_tcc_data_8195 tcc;
+		struct mdp_wrot_data_8195 wrot;
+		struct mdp_wdma_data_8195 wdma;
+		struct isp_data_8195 isp;
+	};
+} __packed;
+
+struct img_config_8195 {
+	struct img_compparam_8195 components[IMG_MAX_COMPONENTS];
+	u32 num_components;
+	struct img_mmsys_ctrl ctrls[IMG_MAX_SUBFRAMES_8195];
+	u32 num_subfrms;
+} __packed;
+
+#endif  /* __MDP_SM_MT8195_H__ */
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
index 08fb0853bcd5..f83ac408306e 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
@@ -10,6 +10,7 @@
 
 #include <linux/err.h>
 #include "mdp_sm_mt8183.h"
+#include "mdp_sm_mt8195.h"
 #include "mtk-mdp3-type.h"
 
 /* ISP-MDP generic input information */
@@ -138,12 +139,14 @@ struct img_frameparam {
 struct img_config {
 	union {
 		struct img_config_8183 config_8183;
+		struct img_config_8195 config_8195;
 	};
 } __packed;
 
 struct img_compparam {
 	union {
 		struct img_compparam_8183 comp_8183;
+		struct img_compparam_8195 comp_8195;
 	};
 } __packed;
 
-- 
2.18.0


