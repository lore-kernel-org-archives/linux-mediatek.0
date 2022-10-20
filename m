Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308DFC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 07:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u58lkal9O6ZniiGmn3zPbvHh98+Mlb3TQ62yFSXQPJk=; b=kK6hMVCZ8Z7iQpvXMTOygD7+h7
	hn/zHRZBZSlGsRje8kImzYwE0hYUtK6hRzYBF2fQ31YgAzlEHP6vEdBmzvp2Fzagumr8PCXAwx4He
	x+Gh8/5HOQp4hfO0yHNxFLJ8RaUd8karFx8lzFJl2pPHn9TE377ihotoZisipIAxQcwMN1pC7ac1k
	8CurLitXRESYmVCfZi3P41CFh6MrfuGki1FNcDrX+d3hdOhEUZ/L35Si575MoOKH5SwUBxEGQfCMj
	WSAWjbSef5DBhVvduv5XX2nOOFPHAWNbW5PVOW/6eR92JhFxgvVV7TgEffEI+0UOuzqjTTwahmzzE
	trWruDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQC4-00BsLC-75; Thu, 20 Oct 2022 07:42:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQC1-00BsKX-DB
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 07:42:18 +0000
X-UUID: 656d9dc4d9a246a99f17b81489240f0d-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=u58lkal9O6ZniiGmn3zPbvHh98+Mlb3TQ62yFSXQPJk=;
	b=t0SYKoqB3fWyXkLP5THVtqh5CC5ZNUp4c53zF/gCcUT6K78wmwky4fW/zBP6RaOO8quHXzJLwuxnZjdfMwpNf3qIxcNirJnQxBA4M/dfydhLCh8hJgANtsxIfU1GDpQQEw/bUuOjzWPB7Xo+K9J/z+5MdAF9c5m9s/+aXOCD/HA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:481955e4-c440-47f2-af5a-80136a6aa7e3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:ce12e1ee-314c-4293-acb8-ca4299dd021f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 656d9dc4d9a246a99f17b81489240f0d-20221020
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1890661479; Thu, 20 Oct 2022 00:42:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 20 Oct 2022 15:39:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 20 Oct 2022 15:39:09 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v2 9/9] media: platform: mtk-mdp3: extend shared memory structure to 4-byte aligned
Date: Thu, 20 Oct 2022 15:39:02 +0800
Message-ID: <20221020073902.21039-10-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221020073902.21039-1-moudy.ho@mediatek.com>
References: <20221020073902.21039-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_004217_455284_FEB3823F 
X-CRM114-Status: GOOD (  13.09  )
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

The common header "mtk-img-ipi.h" defines the input frame parameters used to
pass to SCP for components config calculations.

However, there is a 4-byte read limit in further SCP hardware, so the
data structure should be aligned.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-img-ipi.h      | 50 +++++++++----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
index fcd6f7dd39fc..5b99d3505f9b 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
@@ -47,14 +47,14 @@ struct img_sw_addr {
 
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
 
@@ -68,10 +68,10 @@ struct img_image_buffer {
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
@@ -86,24 +86,24 @@ struct img_crop {
 
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
 } __packed;
 
 struct img_ipi_frameparam {
 	u32 index;
 	u32 frame_no;
 	struct img_timeval timestamp;
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
@@ -119,25 +119,25 @@ struct img_sw_buffer {
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
@@ -148,11 +148,11 @@ struct img_mux {
 	u32 reg;
 	u32 value;
 	u32 subsys_id;
-};
+} __packed;
 
 struct img_mmsys_ctrl {
 	struct img_mux sets[IMG_MAX_COMPONENTS * 2];
 	u32 num_sets;
-};
+} __packed;
 
 #endif  /* __MTK_IMG_IPI_H__ */
-- 
2.18.0


