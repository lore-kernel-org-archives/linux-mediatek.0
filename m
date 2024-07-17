Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046F3C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 12:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCBU9VRPG1ZySWp9/a3bXUm7Fg+jSLOWVX2yqJ76+4s=; b=yxTsKHMPF2RKsfA71Wv9lCK+yw
	Ck2MnO4rRojmpZJyLcTMIg5khc8Gcv8q+dPl1609v/UBdiDsKtGOmfYlJrwcQFTWR15iDdB2xzgAW
	PdLi80ltkzIBClZgZNPHvEtiSvO4F6/g+D0H0VJha+fal4SbpmCYw1JfyHRMPqYLoa5AEL5wVPY+o
	m4iHKQamgx/FUPZ/PAuKKZRgrQoZT41pTDt1bl3bmPTIzCAg30RmA3STg6H53gsnFJfidVFRKOry/
	T+CvRGoDMNdWPpZ2gqzIDZtllL17MJaUm1BRSi5LlWXLTJ7XcmadT0D4lhh4EGyr3t+P4XgvsCQvZ
	Fu+0caeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4Bi-0000000DoTS-2vFu;
	Wed, 17 Jul 2024 12:55:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4B8-0000000DoEm-0L8x;
	Wed, 17 Jul 2024 12:54:43 +0000
X-UUID: b87e1c14443b11efa6c87f6b4542ff6b-20240717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BCBU9VRPG1ZySWp9/a3bXUm7Fg+jSLOWVX2yqJ76+4s=;
	b=lj9DIml5Vr7MKRIdZviFnTj/PHo06FqQAHk6twFO7pEWIabMrPPASasKhEn7ZxLgsuTqXGP9t87UmjuIc7dl4B+MPBJY3vTYy/Zk3vghsQZK73ope6m5TONs02MsTQ5xEKXBK8/n2MNFCV9TObMaoUa7+VbGztePHJ8CuIttqtU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:98767d2c-76a2-48a6-bbea-484f66650df0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:490b6945-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b87e1c14443b11efa6c87f6b4542ff6b-20240717
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yelian.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1910969968; Wed, 17 Jul 2024 05:54:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 Jul 2024 20:54:31 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 Jul 2024 20:54:30 +0800
From: 20220614094956 created <yelian.wang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yelian Wang
	<yelian.wang@mediatek.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
	<hidenorik@chromium.org>
Subject: [PATCH 2/3] uapi: linux: add MT8188 AIE
Date: Wed, 17 Jul 2024 20:41:56 +0800
Message-ID: <20240717125426.32660-3-yelian.wang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717125426.32660-1-yelian.wang@mediatek.com>
References: <20240717125426.32660-1-yelian.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.265400-8.000000
X-TMASE-MatchedRID: 0bZ5yU6lNNMxFdXyW/P+XYSvKOGqLLPKK2i9pofGVSu7qpOHKudqcxFu
	Pg3ykf5hKnoLoDc7CX3kllaluas5jiDLycb1BK8Fe7MO8jvmPSy4vBuE2X0Hlf002DXYmoa1pNH
	VMPxrKWFLtBtfUVMvKnt9ZDLJDtKvAaUyBbEosi2EJ5wBUYI5/bmnDa2zGPi0FLXUWU5hGiGxEI
	pMo/Df4FwVxV30BJh4M9BZPSxx0vrtzSKzUmDUVws9VkfCh3uArokbkfZgmrra+IH8mvgPVNnfc
	bZ2aRWZ+5kqzEMlCiwAr9cazk30r6q07IAfK9og4bl1FkKDELfaoFJAcCHymIKwF4K/wIz9Bw3b
	/YoI+hXi8zVgXoAltsIJ+4gwXrEtwrbXMGDYqV/1Kzk40dEY9eNcWUlJqczYCj5S0KdXMaZdbPI
	Q/0m+mj869KSQrWm5
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.265400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F4A570C8CF16CE4FDC5F6B378D67CEE007A804143A97840645E6428DA0E66E8F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_055442_157517_FE3E22F2 
X-CRM114-Status: GOOD (  17.95  )
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

From: Yelian Wang <yelian.wang@mediatek.com>

Add AIE control related definitions

Signed-off-by: Yelian Wang <yelian.wang@mediatek.com>
---
 include/uapi/linux/mtk_aie_v4l2_controls.h | 130 +++++++++++++++++++++
 include/uapi/linux/videodev2.h             |   6 +
 2 files changed, 136 insertions(+)
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

diff --git a/include/uapi/linux/mtk_aie_v4l2_controls.h b/include/uapi/linux/mtk_aie_v4l2_controls.h
new file mode 100644
index 000000000000..f4be180c8ddf
--- /dev/null
+++ b/include/uapi/linux/mtk_aie_v4l2_controls.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * AIE Controls Header
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Fish Wu <fish.wu@mediatek.com>
+ */
+
+#ifndef __MTK_AIE_V4L2_CONTROLS_H__
+#define __MTK_AIE_V4L2_CONTROLS_H__
+
+#include <linux/types.h>
+
+/*
+ * The base for the mediatek FD driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_MTK_FD_BASE (V4L2_CID_USER_BASE + 0x1fd0)
+
+#define V4L2_CID_MTK_AIE_INIT (V4L2_CID_USER_MTK_FD_BASE + 1)
+#define V4L2_CID_MTK_AIE_PARAM (V4L2_CID_USER_MTK_FD_BASE + 2)
+
+#define V4L2_FLD_MAX_FRAME 15
+
+/**
+ * struct v4l2_ctrl_aie_init - aie init parameters.
+ *
+ * @max_img_width: maximum width of the source image.
+ * @max_img_height: maximum height of the source image.
+ * @pyramid_width: maximum width of the base pyramid.
+ * @pyramid_height: maximum height of the base pyramid.
+ * @feature_threshold: feature threshold for hareware.
+ */
+struct v4l2_ctrl_aie_init {
+	__u32 max_img_width;
+	__u32 max_img_height;
+	__u32 pyramid_width;
+	__u32 pyramid_height;
+	__s32 feature_threshold;
+};
+
+/**
+ * struct v4l2_aie_roi - aie roi parameters.
+ *
+ * @x1: x1 of the roi coordinate.
+ * @y1: y1 of the roi coordinate.
+ * @x2: x2 of the roi coordinate.
+ * @y2: y2 of the roi coordinate.
+ */
+struct v4l2_aie_roi {
+	__u32 x1;
+	__u32 y1;
+	__u32 x2;
+	__u32 y2;
+};
+
+/**
+ * struct v4l2_aie_padding - aie padding parameters.
+ *
+ * @left: the size of padding left.
+ * @right: the size of padding right.
+ * @down: the size of padding below.
+ * @up: the size of padding above.
+ */
+struct v4l2_aie_padding {
+	__u32 left;
+	__u32 right;
+	__u32 down;
+	__u32 up;
+};
+
+/**
+ * struct v4l2_fld_crop_rip_rop - aie fld parameters.
+ *
+ * @fld_in_crop_x1: x1 of the crop coordinate.
+ * @fld_in_crop_y1: y1 of the crop coordinate.
+ * @fld_in_crop_x2: x2 of the crop coordinate.
+ * @fld_in_crop_y2: y2 of the crop coordinate.
+ * @fld_in_rip: fld in rip.
+ * @fld_in_rop: fld in rop.
+ */
+struct v4l2_fld_crop_rip_rop {
+	__u32 fld_in_crop_x1;
+	__u32 fld_in_crop_y1;
+	__u32 fld_in_crop_x2;
+	__u32 fld_in_crop_y2;
+	__u32 fld_in_rip;
+	__u32 fld_in_rop;
+};
+
+/**
+ * struct v4l2_fld_crop_rip_rop - aie fld parameters.
+ *
+ * @fd_mode: select a mode for current fd.
+ * @src_img_fmt: source image format.
+ * @src_img_width: the width of the source image.
+ * @src_img_height: the height of the source image.
+ * @src_img_stride: the stride of the source image.
+ * @pyramid_base_width: the width of the base pyramid.
+ * @pyramid_base_height: the width of the base pyramid.
+ * @number_of_pyramid: number of pyramid.
+ * @rotate_degree: the rotate degree of the image.
+ * @en_roi: enable roi.
+ * @src_roi: roi params.
+ * @en_padding: enable padding.
+ * @src_padding: padding params.
+ * @freq_level: frequency level.
+ * @fld_face_num: the number of faces in fld.
+ * @fld_input: fld input params.
+ */
+struct v4l2_ctrl_aie_param {
+	__u32 fd_mode;
+	__u32 src_img_fmt;
+	__u32 src_img_width;
+	__u32 src_img_height;
+	__u32 src_img_stride;
+	__u32 pyramid_base_width;
+	__u32 pyramid_base_height;
+	__u32 number_of_pyramid;
+	__u32 rotate_degree;
+	__s32 en_roi;
+	struct v4l2_aie_roi src_roi;
+	__s32 en_padding;
+	struct v4l2_aie_padding src_padding;
+	__u32 freq_level;
+	__u32 fld_face_num;
+	struct v4l2_fld_crop_rip_rop fld_input[V4L2_FLD_MAX_FRAME];
+};
+
+#endif /* __MTK_AIE_V4L2_CONTROLS_H__ */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4e91362da6da..a5d54b683b7d 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -858,6 +858,9 @@ struct v4l2_pix_format {
 /* Vendor specific - used for RaspberryPi PiSP */
 #define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
 
+/* Vendor-specific definition: used for the MediaTek camera subsystem's face detection results */
+#define V4L2_META_FMT_MTFD_RESULT v4l2_fourcc('M', 'T', 'f', 'd')
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
@@ -1953,6 +1956,9 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
+	V4L2_CTRL_TYPE_AIE_INIT		= 0x0290,
+	V4L2_CTRL_TYPE_AIE_PARAM	= 0x0291,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.34.1


