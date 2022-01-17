Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF578C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6e5yq6Ug5CeeNtQdXkC/jC9qOivSwSxTdKcOwYuJOaI=; b=hk9wMfBo+G79eC
	5398SqaZVSdhhkdDqO1g9gEG3hGsaMdXaD7Pfg6T7qmfsSuD9Pomxd2QhtUphwTo7bplKrS4SS6xl
	6dhY0JVWo2lQ7oN9Kf7d+85YQXQjJtHa53kS7vBN7fafCzK0ngWYC/hgv0HJdyy3eQKd26RJVehO3
	FEgns61rcd9EhdVRqcl/RRoZ0dVtp/Qhhtdn7pmDn+trKXgRNkafIOvpoG8YpAe8qePn3XbCbWdEQ
	VRugkAIqO9ZY1PephnHG1k84HHlQO8Hfs0h+FID9cw8qOlyN6r27Crf17Fq1ocJFR3f9VApCzX/E5
	g1dcCZmT8JzRgMla4Xvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9L7H-00DYfm-G0; Mon, 17 Jan 2022 06:03:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L6m-00DYVR-Lg; Mon, 17 Jan 2022 06:03:15 +0000
X-UUID: 401486385c774670acfb636334c2d910-20220116
X-UUID: 401486385c774670acfb636334c2d910-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1784752211; Sun, 16 Jan 2022 23:03:10 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:22 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 Jan 2022 13:53:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 13:53:08 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 06/14] media: platform: mtk-mdp3: Modify mtk-img-ipi.h for
 MT8195 SCP
Date: Mon, 17 Jan 2022 13:52:46 +0800
Message-ID: <20220117055254.9777-7-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_220312_725386_718217F5 
X-CRM114-Status: GOOD (  13.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

1. Modify struct member to 4 byte-alignment for MT8195 SCP limitation
2. Add new struct for hw engine adding in MT8195

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h | 219 +++++++++++++++---
 1 file changed, 181 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
index f8560dad87da..8dd0bcdee431 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
@@ -42,14 +42,14 @@ struct img_sw_addr {
 
 struct img_plane_format {
 	u32 size;
-	u16 stride;
+	u32 stride;
 } __packed;
 
 struct img_pix_format {
-	u16 width;
-	u16 height;
+	u32 width;
+	u32 height;
 	u32 colorformat; /* enum mdp_color */
-	u16 ycbcr_prof; /* enum mdp_ycbcr_profile */
+	u32 ycbcr_prof; /* enum mdp_ycbcr_profile */
 	struct img_plane_format plane_fmt[IMG_MAX_PLANES];
 } __packed;
 
@@ -63,10 +63,10 @@ struct img_image_buffer {
 #define IMG_SUBPIXEL_SHIFT	20
 
 struct img_crop {
-	s16 left;
-	s16 top;
-	u16 width;
-	u16 height;
+	s32 left;
+	s32 top;
+	u32 width;
+	u32 height;
 	u32 left_subpix;
 	u32 top_subpix;
 	u32 width_subpix;
@@ -78,27 +78,29 @@ struct img_crop {
 #define IMG_CTRL_FLAG_SHARPNESS	BIT(4)
 #define IMG_CTRL_FLAG_HDR	BIT(5)
 #define IMG_CTRL_FLAG_DRE	BIT(6)
+#define IMG_CTRL_FLAG_RSZ	BIT(7)
 
 struct img_input {
 	struct img_image_buffer buffer;
-	u16 flags; /* HDR, DRE, dither */
+	u32 flags; /* HDR, DRE, dither */
 } __packed;
 
 struct img_output {
 	struct img_image_buffer buffer;
 	struct img_crop crop;
-	s16 rotation;
-	u16 flags; /* H-flip, sharpness, dither */
+	s32 rotation;
+	u32 flags; /* H-flip, sharpness, dither */
+	u64 pqid;
 } __packed;
 
 struct img_ipi_frameparam {
 	u32 index;
 	u32 frame_no;
 	u64 timestamp;
-	u8 type; /* enum mdp_stream_type */
-	u8 state;
-	u8 num_inputs;
-	u8 num_outputs;
+	u32 type; /* enum mdp_stream_type */
+	u32 state;
+	u32 num_inputs;
+	u32 num_outputs;
 	u64 drv_data;
 	struct img_input inputs[IMG_MAX_HW_INPUTS];
 	struct img_output outputs[IMG_MAX_HW_OUTPUTS];
@@ -106,6 +108,7 @@ struct img_ipi_frameparam {
 	struct img_addr subfrm_data;
 	struct img_sw_addr config_data;
 	struct img_sw_addr self_data;
+	u32 frame_change;
 } __packed;
 
 struct img_sw_buffer {
@@ -114,51 +117,51 @@ struct img_sw_buffer {
 } __packed;
 
 struct img_ipi_param {
-	u8 usage;
+	u32 usage;
 	struct img_sw_buffer frm_param;
 } __packed;
 
 struct img_frameparam {
 	struct list_head list_entry;
 	struct img_ipi_frameparam frameparam;
-};
+} __packed;
 
 /* ISP-MDP generic output information */
 
 struct img_comp_frame {
-	u32 output_disable:1;
-	u32 bypass:1;
-	u16 in_width;
-	u16 in_height;
-	u16 out_width;
-	u16 out_height;
+	u32 output_disable;
+	u32 bypass;
+	u32 in_width;
+	u32 in_height;
+	u32 out_width;
+	u32 out_height;
 	struct img_crop crop;
-	u16 in_total_width;
-	u16 out_total_width;
+	u32 in_total_width;
+	u32 out_total_width;
 } __packed;
 
 struct img_region {
-	s16 left;
-	s16 right;
-	s16 top;
-	s16 bottom;
+	s32 left;
+	s32 right;
+	s32 top;
+	s32 bottom;
 } __packed;
 
 struct img_offset {
-	s16 left;
-	s16 top;
+	s32 left;
+	s32 top;
 	u32 left_subpix;
 	u32 top_subpix;
 } __packed;
 
 struct img_comp_subfrm {
-	u32 tile_disable:1;
+	u32 tile_disable;
 	struct img_region in;
 	struct img_region out;
 	struct img_offset luma;
 	struct img_offset chroma;
-	s16 out_vertical; /* Output vertical index */
-	s16 out_horizontal; /* Output horizontal index */
+	s32 out_vertical; /* Output vertical index */
+	s32 out_horizontal; /* Output horizontal index */
 } __packed;
 
 #define IMG_MAX_SUBFRAMES	14
@@ -169,10 +172,13 @@ struct mdp_rdma_subfrm {
 	u32 src;
 	u32 clip;
 	u32 clip_ofst;
+	u32 in_tile_xleft;
+	u32 in_tile_ytop;
 } __packed;
 
 struct mdp_rdma_data {
 	u32 src_ctrl;
+	u32 comp_ctrl;
 	u32 control;
 	u32 iova[IMG_MAX_PLANES];
 	u32 iova_end[IMG_MAX_PLANES];
@@ -182,13 +188,72 @@ struct mdp_rdma_data {
 	u32 ufo_dec_y;
 	u32 ufo_dec_c;
 	u32 transform;
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
 	struct mdp_rdma_subfrm subfrms[IMG_MAX_SUBFRAMES];
 } __packed;
 
+struct mdp_fg_subfrm {
+	u32 info_0;
+	u32 info_1;
+} __packed;
+
+struct mdp_fg_data {
+	u32 ctrl_0;
+	u32 ck_en;
+	struct mdp_fg_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_hdr_subfrm {
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
+struct mdp_hdr_data {
+	u32 top;
+	u32 relay;
+	struct mdp_hdr_subfrm   subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_aal_subfrm {
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+} __packed;
+
+struct mdp_aal_data {
+	u32 cfg_main;
+	u32 cfg;
+	struct mdp_aal_subfrm   subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
 struct mdp_rsz_subfrm {
 	u32 control2;
 	u32 src;
 	u32 clip;
+	u32 hdmirx_en;
+	u32 luma_h_int_ofst;
+	u32 luma_h_sub_ofst;
+	u32 luma_v_int_ofst;
+	u32 luma_v_sub_ofst;
+	u32 chroma_h_int_ofst;
+	u32 chroma_h_sub_ofst;
+	u32 rsz_switch;
+	u32 merge_cfg;
 } __packed;
 
 struct mdp_rsz_data {
@@ -196,9 +261,70 @@ struct mdp_rsz_data {
 	u32 coeff_step_y;
 	u32 control1;
 	u32 control2;
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
 	struct mdp_rsz_subfrm subfrms[IMG_MAX_SUBFRAMES];
 } __packed;
 
+struct mdp_tdshp_subfrm {
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+	u32 hist_cfg_0;
+	u32 hist_cfg_1;
+} __packed;
+
+struct mdp_tdshp_data {
+	u32 cfg;
+	struct mdp_tdshp_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_color_subfrm {
+	u32 in_hsize;
+	u32 in_vsize;
+} __packed;
+
+struct mdp_color_data {
+	u32 start;
+	struct mdp_color_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_ovl_subfrm {
+	u32 L0_src_size;
+	u32 roi_size;
+} __packed;
+
+struct mdp_ovl_data {
+	u32 L0_con;
+	u32 src_con;
+	struct mdp_ovl_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_pad_subfrm {
+	u32 pic_size;
+} __packed;
+
+struct mdp_pad_data {
+	struct mdp_pad_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_tcc_subfrm {
+	u32 pic_size;
+} __packed;
+
+struct mdp_tcc_data {
+	struct mdp_tcc_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
 struct mdp_wrot_subfrm {
 	u32 offset[IMG_MAX_PLANES];
 	u32 src;
@@ -214,6 +340,14 @@ struct mdp_wrot_data {
 	u32 mat_ctrl;
 	u32 fifo_test;
 	u32 filter;
+	u32 pre_ultra;
+	u32 framesize;
+	u32 afbc_yuvtrans;
+	u32 scan_10bit;
+	u32 pending_zero;
+	u32 bit_number;
+	u32 pvric;
+	u32 vpp02vpp1;
 	struct mdp_wrot_subfrm subfrms[IMG_MAX_SUBFRAMES];
 } __packed;
 
@@ -241,8 +375,8 @@ struct isp_data {
 } __packed;
 
 struct img_compparam {
-	u16 type; /* enum mdp_comp_type */
-	u16 id; /* enum mtk_mdp_comp_id */
+	u32 type; /* enum mdp_comp_id */
+	u32 id; /* engine alias_id */
 	u32 input;
 	u32 outputs[IMG_MAX_HW_OUTPUTS];
 	u32 num_outputs;
@@ -251,7 +385,15 @@ struct img_compparam {
 	u32 num_subfrms;
 	union {
 		struct mdp_rdma_data rdma;
+		struct mdp_fg_data fg;
+		struct mdp_hdr_data hdr;
+		struct mdp_aal_data aal;
 		struct mdp_rsz_data rsz;
+		struct mdp_tdshp_data tdshp;
+		struct mdp_color_data color;
+		struct mdp_ovl_data ovl;
+		struct mdp_pad_data pad;
+		struct mdp_tcc_data tcc;
 		struct mdp_wrot_data wrot;
 		struct mdp_wdma_data wdma;
 		struct isp_data isp;
@@ -263,12 +405,13 @@ struct img_compparam {
 struct img_mux {
 	u32 reg;
 	u32 value;
-};
+	u32 vpp_id;
+} __packed;
 
 struct img_mmsys_ctrl {
 	struct img_mux sets[IMG_MAX_COMPONENTS * 2];
 	u32 num_sets;
-};
+} __packed;
 
 struct img_config {
 	struct img_compparam components[IMG_MAX_COMPONENTS];
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
