Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FDBC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eq5MD1u1aEHzCBNXcj8D/2PXVMcjfX/QSW0K6d54m9s=; b=pWmGBosVQpzwrk
	8r4CIqPkV/q4dF1fPriKfExSCCdPHGxrJplOZN280IX3y2sneUwBcWAjWlVVXfXYkP4qv6NsrkrrS
	f36riyxDYfgKH5HUWYFE5ghlLU5fkRYe4px3xwCtvCOon1YDnJQ6lU0efAehgfbLpCAo+Z/qsc40K
	ugRMdHK4eBXa1tC6ESfEO1nuxF6Ijj4C5azECzawiAjMIaRVRr3OoLOmdsyWsnDouGevEV6cITWcE
	Ux0bT8bjuiMkUnVp2C8F8iL2HHpQNvyVyTPtr4UcDK19xOgQWOCWWbzNDnLv9cPwo3ZYl1x635U/v
	P5VRjEKy3UkIq/QqwROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9LBc-00DbD0-Nx; Mon, 17 Jan 2022 06:08:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L71-00DYUz-Qj; Mon, 17 Jan 2022 06:03:33 +0000
X-UUID: 477820fa2ffb47b38cbda45eedbebf1a-20220116
X-UUID: 477820fa2ffb47b38cbda45eedbebf1a-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 211095873; Sun, 16 Jan 2022 23:03:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
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
Subject: [PATCH v1 05/14] media: platform: mtk-mdp3: add chip independence
 architecture
Date: Mon, 17 Jan 2022 13:52:45 +0800
Message-ID: <20220117055254.9777-6-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_220327_957971_5A66CCB2 
X-CRM114-Status: GOOD (  22.09  )
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

Add chip independence architecture
- Add hal architecture for mt8183
- Add driver data to adapt other soc

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mt8183_mdp.h  | 411 ++++++++++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 174 +++++---
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 265 +++++------
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  79 +++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  33 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  16 +
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |   2 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   | 233 +---------
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   | 262 +++++------
 9 files changed, 905 insertions(+), 570 deletions(-)
 create mode 100644 drivers/media/platform/mtk-mdp3/mt8183_mdp.h

diff --git a/drivers/media/platform/mtk-mdp3/mt8183_mdp.h b/drivers/media/platform/mtk-mdp3/mt8183_mdp.h
new file mode 100644
index 000000000000..9d30d87f5773
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp3/mt8183_mdp.h
@@ -0,0 +1,411 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MT8183_MDP_H__
+#define __MT8183_MDP_H__
+
+static const struct mdp_platform_config mt8183_plat_cfg = {
+	.rdma_support_10bit             = true,
+	.rdma_rsz1_sram_sharing         = true,
+	.rdma_upsample_repeat_only      = true,
+	.rsz_disable_dcm_small_sample   = false,
+	.wrot_filter_constraint         = false,
+	.gce_event_offset               = 2,
+};
+
+enum mt8183_mdp_comp_id {
+	/* MT8183 Comp id */
+	/* ISP */
+	MT8183_MDP_COMP_WPEI = 0,
+	MT8183_MDP_COMP_WPEO,           /* 1 */
+	MT8183_MDP_COMP_WPEI2,          /* 2 */
+	MT8183_MDP_COMP_WPEO2,          /* 3 */
+	MT8183_MDP_COMP_ISP_IMGI,       /* 4 */
+	MT8183_MDP_COMP_ISP_IMGO,       /* 5 */
+	MT8183_MDP_COMP_ISP_IMG2O,      /* 6 */
+
+	/* IPU */
+	MT8183_MDP_COMP_IPUI,           /* 7 */
+	MT8183_MDP_COMP_IPUO,           /* 8 */
+
+	/* MDP */
+	MT8183_MDP_COMP_CAMIN,          /* 9 */
+	MT8183_MDP_COMP_CAMIN2,         /* 10 */
+	MT8183_MDP_COMP_RDMA0,          /* 11 */
+	MT8183_MDP_COMP_AAL0,           /* 12 */
+	MT8183_MDP_COMP_CCORR0,         /* 13 */
+	MT8183_MDP_COMP_RSZ0,           /* 14 */
+	MT8183_MDP_COMP_RSZ1,           /* 15 */
+	MT8183_MDP_COMP_TDSHP0,         /* 16 */
+	MT8183_MDP_COMP_COLOR0,         /* 17 */
+	MT8183_MDP_COMP_PATH0_SOUT,     /* 18 */
+	MT8183_MDP_COMP_PATH1_SOUT,     /* 19 */
+	MT8183_MDP_COMP_WROT0,          /* 20 */
+	MT8183_MDP_COMP_WDMA,           /* 21 */
+
+	/* Dummy Engine */
+	MT8183_MDP_COMP_RDMA1,          /* 22 */
+	MT8183_MDP_COMP_RSZ2,           /* 23 */
+	MT8183_MDP_COMP_TDSHP1,         /* 24 */
+	MT8183_MDP_COMP_WROT1,          /* 25 */
+};
+
+static const struct mdp_comp_data mt8183_mdp_comp_data[MDP_MAX_COMP_COUNT] = {
+	[MDP_COMP_WPEI] = {
+		{MDP_COMP_TYPE_WPEI, 0, MT8183_MDP_COMP_WPEI},
+		{0, 0, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_WPEO] = {
+		{MDP_COMP_TYPE_EXTO, 2, MT8183_MDP_COMP_WPEO},
+		{0, 0, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_WPEI2] = {
+		{MDP_COMP_TYPE_WPEI, 1, MT8183_MDP_COMP_WPEI2},
+		{0, 0, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_WPEO2] = {
+		{MDP_COMP_TYPE_EXTO, 3, MT8183_MDP_COMP_WPEO2},
+		{0, 0, 0},
+		{0, 0, 0},
+	},
+	[MDP_COMP_ISP_IMGI] = {
+		{MDP_COMP_TYPE_IMGI, 0, MT8183_MDP_COMP_ISP_IMGI},
+		{0, 0, 4},
+		{0, 0, 0}
+	},
+	[MDP_COMP_ISP_IMGO] = {
+		{MDP_COMP_TYPE_EXTO, 0, MT8183_MDP_COMP_ISP_IMGO},
+		{0, 0, 4},
+		{0, 0, 0}
+	},
+	[MDP_COMP_ISP_IMG2O] = {
+		{MDP_COMP_TYPE_EXTO, 1, MT8183_MDP_COMP_ISP_IMG2O},
+		{0, 0, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_CAMIN] = {
+		{MDP_COMP_TYPE_DL_PATH1, 0, MT8183_MDP_COMP_CAMIN},
+		{2, 2, 1},
+		{0, 0, 0}
+	},
+	[MDP_COMP_CAMIN2] = {
+		{MDP_COMP_TYPE_DL_PATH2, 1, MT8183_MDP_COMP_CAMIN2},
+		{2, 4, 1},
+		{0, 0, 0}
+	},
+	[MDP_COMP_RDMA0] = {
+		{MDP_COMP_TYPE_RDMA, 0, MT8183_MDP_COMP_RDMA0},
+		{2, 0, 0},
+		{0, BIT(2), 0},
+	},
+	[MDP_COMP_AAL0] = {
+		{MDP_COMP_TYPE_AAL, 0, MT8183_MDP_COMP_AAL0},
+		{0, 0, 0},
+		{0, BIT(23), 0},
+	},
+	[MDP_COMP_CCORR0] = {
+		{MDP_COMP_TYPE_CCORR, 0, MT8183_MDP_COMP_CCORR0},
+		{1, 0, 0},
+		{0, BIT(24), 0}
+	},
+	[MDP_COMP_RSZ0] = {
+		{MDP_COMP_TYPE_RSZ, 0, MT8183_MDP_COMP_RSZ0},
+		{1, 0, 0},
+		{0, BIT(4), 0}
+	},
+	[MDP_COMP_RSZ1] = {
+		{MDP_COMP_TYPE_RSZ, 1, MT8183_MDP_COMP_RSZ1},
+		{1, 0, 0},
+		{0, BIT(5), 0}
+	},
+	[MDP_COMP_TDSHP0] = {
+		{MDP_COMP_TYPE_TDSHP, 0, MT8183_MDP_COMP_TDSHP0},
+		{0, 0, 0},
+		{0, BIT(6), 0}
+	},
+	[MDP_COMP_PATH0_SOUT] = {
+		{MDP_COMP_TYPE_PATH1, 0, MT8183_MDP_COMP_PATH0_SOUT},
+		{0, 0, 2},
+		{0, 0, 0}
+	},
+	[MDP_COMP_PATH1_SOUT] = {
+		{MDP_COMP_TYPE_PATH2, 1, MT8183_MDP_COMP_PATH1_SOUT},
+		{0, 0, 3},
+		{0, 0, 0}
+	},
+	[MDP_COMP_WROT0] = {
+		{MDP_COMP_TYPE_WROT, 0, MT8183_MDP_COMP_WROT0},
+		{1, 0, 0},
+		{0, BIT(7), 0}
+	},
+	[MDP_COMP_WDMA] = {
+		{MDP_COMP_TYPE_WDMA, 0, MT8183_MDP_COMP_WDMA},
+		{1, 0, 0},
+		{0, BIT(8), 0}
+	},
+};
+
+static const enum mdp_comp_event mt8183_mdp_event[] = {
+	RDMA0_SOF,
+	RDMA0_DONE,
+	RSZ0_SOF,
+	RSZ1_SOF,
+	TDSHP0_SOF,
+	WROT0_SOF,
+	WROT0_DONE,
+	WDMA0_SOF,
+	WDMA0_DONE,
+	ISP_P2_0_DONE,
+	ISP_P2_1_DONE,
+	ISP_P2_2_DONE,
+	ISP_P2_3_DONE,
+	ISP_P2_4_DONE,
+	ISP_P2_5_DONE,
+	ISP_P2_6_DONE,
+	ISP_P2_7_DONE,
+	ISP_P2_8_DONE,
+	ISP_P2_9_DONE,
+	ISP_P2_10_DONE,
+	ISP_P2_11_DONE,
+	ISP_P2_12_DONE,
+	ISP_P2_13_DONE,
+	ISP_P2_14_DONE,
+	WPE_DONE,
+	WPE_B_DONE
+};
+
+static const struct mdp_pipe_info mt8183_pipe_info[] = {
+	{MDP_PIPE_IMGI, 0, 0},
+	{MDP_PIPE_RDMA0, 0, 1},
+	{MDP_PIPE_WPEI, 0, 2},
+	{MDP_PIPE_WPEI2, 0, 3}
+};
+
+static const struct mdp_format mt8183_formats[] = {
+	{
+		.pixelformat	= V4L2_PIX_FMT_GREY,
+		.mdp_color	= MDP_COLOR_GREY,
+		.depth		= { 8 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB565X,
+		.mdp_color	= MDP_COLOR_RGB565,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB565,
+		.mdp_color	= MDP_COLOR_BGR565,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB24,
+		.mdp_color	= MDP_COLOR_RGB888,
+		.depth		= { 24 },
+		.row_depth	= { 24 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_BGR24,
+		.mdp_color	= MDP_COLOR_BGR888,
+		.depth		= { 24 },
+		.row_depth	= { 24 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_ABGR32,
+		.mdp_color	= MDP_COLOR_BGRA8888,
+		.depth		= { 32 },
+		.row_depth	= { 32 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_ARGB32,
+		.mdp_color	= MDP_COLOR_ARGB8888,
+		.depth		= { 32 },
+		.row_depth	= { 32 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_UYVY,
+		.mdp_color	= MDP_COLOR_UYVY,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_VYUY,
+		.mdp_color	= MDP_COLOR_VYUY,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUYV,
+		.mdp_color	= MDP_COLOR_YUYV,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVYU,
+		.mdp_color	= MDP_COLOR_YVYU,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV420,
+		.mdp_color	= MDP_COLOR_I420,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU420,
+		.mdp_color	= MDP_COLOR_YV12,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV12,
+		.mdp_color	= MDP_COLOR_NV12,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV21,
+		.mdp_color	= MDP_COLOR_NV21,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV16,
+		.mdp_color	= MDP_COLOR_NV16,
+		.depth		= { 16 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV61,
+		.mdp_color	= MDP_COLOR_NV61,
+		.depth		= { 16 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV24,
+		.mdp_color	= MDP_COLOR_NV24,
+		.depth		= { 24 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV42,
+		.mdp_color	= MDP_COLOR_NV42,
+		.depth		= { 24 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_MT21C,
+		.mdp_color	= MDP_COLOR_420_BLKP_UFO,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 4,
+		.halign		= 5,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_MM21,
+		.mdp_color	= MDP_COLOR_420_BLKP,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 4,
+		.halign		= 5,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV12M,
+		.mdp_color	= MDP_COLOR_NV12,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV21M,
+		.mdp_color	= MDP_COLOR_NV21,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV16M,
+		.mdp_color	= MDP_COLOR_NV16,
+		.depth		= { 8, 8 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV61M,
+		.mdp_color	= MDP_COLOR_NV61,
+		.depth		= { 8, 8 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV420M,
+		.mdp_color	= MDP_COLOR_I420,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU420M,
+		.mdp_color	= MDP_COLOR_YV12,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}
+};
+
+#endif  // __MT8183_MDP_H__
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index 87751f0e2513..879a120f78d9 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -42,86 +42,116 @@ static bool is_output_disable(const struct img_compparam *param, u32 count)
 		true;
 }
 
+static int mdp_get_mutex_idx(const struct mtk_mdp_driver_data *data,
+			     enum mtk_mdp_pipe_id pipe_id)
+{
+	int i = 0;
+
+	for (i = 0; i < data->pipe_info_len; i++) {
+		if (pipe_id == data->pipe_info[i].pipe_id)
+			return i;
+	}
+
+	return -ENODEV;
+}
+
+int mdp_get_event_idx(struct mdp_dev *mdp, enum mdp_comp_event event)
+{
+	int i = 0;
+
+	for (i = 0; i < mdp->mdp_data->event_len; i++) {
+		if (event == mdp->mdp_data->event[i])
+			return i;
+	}
+
+	return -ENODEV;
+}
+
 static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 				   const struct mdp_path *path,
 				   struct mmsys_cmdq_cmd *cmd, u32 count)
 {
 	const struct img_config *config = path->config;
 	const struct mdp_comp_ctx *ctx;
+	const struct mtk_mdp_driver_data *data = path->mdp_dev->mdp_data;
 	struct device *dev = &path->mdp_dev->pdev->dev;
 	struct mtk_mutex **mutex = path->mdp_dev->mdp_mutex;
 	s32 mutex_id = -1;
-	u32 mutex_bit = 0;
-	int index, id;
+	u32 mutex_sof = 0;
+	int index, j;
+	enum mtk_mdp_comp_id public_id = MDP_COMP_NONE;
 
 	/* Default value */
 	memset(subfrm, 0, sizeof(*subfrm));
 
-	/* Decide which mutex to use based on the current pipeline */
-	switch (path->comps[0].comp->id) {
-	case MDP_COMP_RDMA0:
-		mutex_id = MDP_PIPE_RDMA0;
-		break;
-	case MDP_COMP_ISP_IMGI:
-		mutex_id = MDP_PIPE_IMGI;
-		break;
-	case MDP_COMP_WPEI:
-		mutex_id = MDP_PIPE_WPEI;
-		break;
-	case MDP_COMP_WPEI2:
-		mutex_id = MDP_PIPE_WPEI2;
-		break;
-	default:
-		dev_err(dev, "Unknown pipeline and no mutex is assigned");
-		return -EINVAL;
-	}
-	subfrm->mutex_id = mutex_id;
-
-	/* Set mutex mod */
 	for (index = 0; index < config->num_components; index++) {
 		ctx = &path->comps[index];
 		if (is_output_disable(ctx->param, count))
 			continue;
-		id = ctx->comp->id;
-		switch (id) {
+
+		public_id = path->comps[index].comp->public_id;
+		switch (public_id) {
 		case MDP_COMP_AAL0:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			break;
 		case MDP_COMP_CCORR0:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			break;
 		case MDP_COMP_WDMA:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WDMA;
+			break;
 		case MDP_COMP_WROT0:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WROT0;
+			break;
 		case MDP_COMP_TDSHP0:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_TDSHP0;
+			break;
 		case MDP_COMP_RSZ1:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ1;
+			break;
 		case MDP_COMP_RSZ0:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ0;
+			break;
 		case MDP_COMP_RDMA0:
-			mutex_bit = mtk_mutex_get_mdp_mod(mutex[mutex_id], id);
-			subfrm->mutex_mod |= mutex_bit;
+			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA0);
+			mutex_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RDMA0;
+			break;
+		case MDP_COMP_ISP_IMGI:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_IMGI);
+			mutex_id = data->pipe_info[j].mutex_id;
+			break;
+		case MDP_COMP_WPEI:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI);
+			mutex_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_WPEI2:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI2);
+			mutex_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
 			break;
 		default:
 			break;
 		}
 	}
 
-	if (subfrm->mutex_mod)
-		mtk_mutex_add_mod_by_cmdq(mutex[mutex_id], subfrm->mutex_mod,
-					  0, 0, cmd);
+	subfrm->mutex_id = mutex_id;
+	if (-1 == mutex_id) {
+		dev_err(dev, "No mutex assigned");
+		return -EINVAL;
+	}
 
-	/* Set SOF */
-	for (index = 0; index < config->num_components; index++) {
-		ctx = &path->comps[index];
-		if (is_output_disable(ctx->param, count))
-			continue;
-		id = ctx->comp->id;
-		switch (id) {
-		case MDP_COMP_WDMA:
-		case MDP_COMP_WROT0:
-		case MDP_COMP_TDSHP0:
-		case MDP_COMP_RSZ1:
-		case MDP_COMP_RSZ0:
-		case MDP_COMP_RDMA0:
-			subfrm->sofs[subfrm->num_sofs++] = id;
-			break;
-		default:
-			break;
-		}
+	/* Set mutex modules */
+	if (subfrm->mutex_mod) {
+		mtk_mutex_add_mod_by_cmdq(mutex[mutex_id], subfrm->mutex_mod,
+					  0, mutex_sof, cmd);
 	}
 
 	return 0;
@@ -141,33 +171,36 @@ static int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
 	}
 
 	if (subfrm->mutex_mod) {
-		int index;
+		int index, evt;
 
 		/* Wait WROT SRAM shared to DISP RDMA */
 		/* Clear SOF event for each engine */
 		for (index = 0; index < subfrm->num_sofs; index++) {
 			switch (subfrm->sofs[index]) {
 			case MDP_COMP_RDMA0:
-				MM_REG_CLEAR(cmd, RDMA0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA0_SOF);
 				break;
 			case MDP_COMP_TDSHP0:
-				MM_REG_CLEAR(cmd, TDSHP0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, TDSHP0_SOF);
 				break;
 			case MDP_COMP_RSZ0:
-				MM_REG_CLEAR(cmd, RSZ0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RSZ0_SOF);
 				break;
 			case MDP_COMP_RSZ1:
-				MM_REG_CLEAR(cmd, RSZ1_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RSZ1_SOF);
 				break;
 			case MDP_COMP_WDMA:
-				MM_REG_CLEAR(cmd, WDMA0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, WDMA0_SOF);
 				break;
 			case MDP_COMP_WROT0:
-				MM_REG_CLEAR(cmd, WROT0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, WROT0_SOF);
 				break;
 			default:
+				evt = -1;
 				break;
 			}
+			if (evt > 0)
+				MM_REG_CLEAR(cmd, evt);
 		}
 
 		/* Enable the mutex */
@@ -177,26 +210,29 @@ static int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
 		for (index = 0; index < subfrm->num_sofs; index++) {
 			switch (subfrm->sofs[index]) {
 			case MDP_COMP_RDMA0:
-				MM_REG_WAIT(cmd, RDMA0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA0_SOF);
 				break;
 			case MDP_COMP_TDSHP0:
-				MM_REG_WAIT(cmd, TDSHP0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, TDSHP0_SOF);
 				break;
 			case MDP_COMP_RSZ0:
-				MM_REG_WAIT(cmd, RSZ0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RSZ0_SOF);
 				break;
 			case MDP_COMP_RSZ1:
-				MM_REG_WAIT(cmd, RSZ1_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RSZ1_SOF);
 				break;
 			case MDP_COMP_WDMA:
-				MM_REG_WAIT(cmd, WDMA0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, WDMA0_SOF);
 				break;
 			case MDP_COMP_WROT0:
-				MM_REG_WAIT(cmd, WROT0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, WROT0_SOF);
 				break;
 			default:
+				evt = -1;
 				break;
 			}
+			if (evt > 0)
+				MM_REG_WAIT(cmd, evt);
 		}
 	}
 	return 0;
@@ -229,6 +265,7 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 	const struct img_mmsys_ctrl *ctrl = &config->ctrls[count];
 	const struct img_mux *set;
 	struct device *mmsys_dev = path->mdp_dev->mdp_mmsys;
+	const struct mtk_mdp_driver_data *data = path->mdp_dev->mdp_data;
 	struct mdp_comp_ctx *ctx;
 	int index, ret;
 
@@ -331,12 +368,14 @@ static void mdp_auto_release_work(struct work_struct *work)
 {
 	struct mdp_cmdq_cb_param *cb_param;
 	struct mdp_dev *mdp;
+	int i;
 
 	cb_param = container_of(work, struct mdp_cmdq_cb_param,
 				auto_release_work);
 	mdp = cb_param->mdp;
 
-	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
+	mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
 	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 			    cb_param->num_comps);
 
@@ -352,6 +391,7 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 	struct mdp_cmdq_cb_param *cb_param;
 	struct mdp_dev *mdp;
 	struct device *dev;
+	int i;
 
 	if (!data.data) {
 		pr_info("%s:no callback data\n", __func__);
@@ -377,7 +417,8 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 	INIT_WORK(&cb_param->auto_release_work, mdp_auto_release_work);
 	if (!queue_work(mdp->clock_wq, &cb_param->auto_release_work)) {
 		dev_err(dev, "%s:queue_work fail!\n", __func__);
-		mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+		i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
+		mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
 		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 				    cb_param->num_comps);
 
@@ -437,7 +478,9 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_destroy_pkt;
 	}
 
-	mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
+	mtk_mutex_prepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
+
 	for (i = 0; i < param->config->num_components; i++)
 		mdp_comp_clock_on(&mdp->pdev->dev, path->comps[i].comp);
 
@@ -483,7 +526,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	return 0;
 
 err_clock_off:
-	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
+	mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
 	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 			    cb_param->num_comps);
 err_destroy_pkt:
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 622900d2152c..9073ddc19775 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -19,6 +19,36 @@
 #include "mdp_reg_wdma.h"
 #include "mdp_reg_isp.h"
 
+s32 get_comp_inner_id(struct mdp_dev *mdp_dev, enum mtk_mdp_comp_id id)
+{
+	if (!mdp_dev)
+		return MDP_COMP_NONE;
+	if (id <= MDP_COMP_NONE || id >= MDP_MAX_COMP_COUNT)
+		return MDP_COMP_NONE;
+
+	return mdp_dev->mdp_data->comp_data[id].match.inner_id;
+}
+
+enum mtk_mdp_comp_id get_comp_public_id(struct mdp_dev *mdp_dev, s32 inner_id)
+{
+	enum mtk_mdp_comp_id public_id = MDP_COMP_NONE;
+	u32 i;
+
+	if (IS_ERR(mdp_dev) || !inner_id)
+		goto err_public_id;
+
+	for (i = 0; i < MDP_MAX_COMP_COUNT; i++) {
+		if (mdp_dev->mdp_data->comp_data[i].match.inner_id == inner_id) {
+			public_id = i;
+			return public_id;
+		}
+	}
+
+err_public_id:
+	dev_err(&mdp_dev->pdev->dev, "Unmapped inner id %d", inner_id);
+	return public_id;
+}
+
 static const struct mdp_platform_config *__get_plat_cfg(const struct mdp_comp_ctx *ctx)
 {
 	if (!ctx)
@@ -30,12 +60,18 @@ static const struct mdp_platform_config *__get_plat_cfg(const struct mdp_comp_ct
 static s64 get_comp_flag(const struct mdp_comp_ctx *ctx)
 {
 	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
+	u32 rdma0, rsz1;
+
+	rdma0 = get_comp_inner_id(ctx->comp->mdp_dev, MDP_COMP_RDMA0);
+	rsz1 = get_comp_inner_id(ctx->comp->mdp_dev, MDP_COMP_RSZ1);
+	if (!rdma0 || !rsz1)
+		return MDP_COMP_NONE;
 
 	if (mdp_cfg && mdp_cfg->rdma_rsz1_sram_sharing)
-		if (ctx->comp->id == MDP_COMP_RDMA0)
-			return BIT(MDP_COMP_RDMA0) | BIT(MDP_COMP_RSZ1);
+		if (ctx->comp->inner_id == rdma0)
+			return BIT(rdma0) | BIT(rsz1);
 
-	return BIT(ctx->comp->id);
+	return BIT(ctx->comp->inner_id);
 }
 
 static int init_rdma(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
@@ -43,12 +79,17 @@ static int init_rdma(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	s32 rdma0;
 
-	if (mdp_cfg && mdp_cfg->rdma_support_10bit) {
+	rdma0 = get_comp_inner_id(ctx->comp->mdp_dev, MDP_COMP_RDMA0);
+	if (!rdma0)
+		return -EINVAL;
+
+	if (mdp_cfg && mdp_cfg->rdma_rsz1_sram_sharing) {
 		struct mdp_comp *prz1 = ctx->comp->mdp_dev->comp[MDP_COMP_RSZ1];
 
 		/* Disable RSZ1 */
-		if (ctx->comp->id == MDP_COMP_RDMA0 && prz1)
+		if (ctx->comp->inner_id == rdma0 && prz1)
 			MM_REG_WRITE(cmd, subsys_id, prz1->reg_base, PRZ_ENABLE,
 				     0x0, BIT(0));
 	}
@@ -188,14 +229,18 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 static int wait_rdma_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 {
 	struct device *dev = &ctx->comp->mdp_dev->pdev->dev;
+	enum mtk_mdp_comp_id id = ctx->comp->public_id;
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	int evt = -1;
 
-	if (ctx->comp->alias_id == 0)
-		MM_REG_WAIT(cmd, RDMA0_DONE);
+	if (id == MDP_COMP_RDMA0)
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, RDMA0_DONE);
 	else
 		dev_err(dev, "Do not support RDMA1_DONE event\n");
 
+	if (evt > 0)
+		MM_REG_WAIT(cmd, evt);
 	/* Disable RDMA */
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, 0x0, BIT(0));
 	return 0;
@@ -416,14 +461,19 @@ static int wait_wrot_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 {
 	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
 	struct device *dev = &ctx->comp->mdp_dev->pdev->dev;
+	enum mtk_mdp_comp_id id = ctx->comp->public_id;
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	int evt = -1;
 
-	if (ctx->comp->alias_id == 0)
-		MM_REG_WAIT(cmd, WROT0_DONE);
+	if (id == MDP_COMP_WROT0)
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, WROT0_DONE);
 	else
 		dev_err(dev, "Do not support WROT1_DONE event\n");
 
+	if (evt > 0)
+		MM_REG_WAIT(cmd, evt);
+
 	if (mdp_cfg && mdp_cfg->wrot_filter_constraint)
 		MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE, 0x0,
 			     0x77);
@@ -526,8 +576,11 @@ static int wait_wdma_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 {
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	int evt;
 
-	MM_REG_WAIT(cmd, WDMA0_DONE);
+	evt = mdp_get_event_idx(ctx->comp->mdp_dev, WDMA0_DONE);
+	if (evt > 0)
+		MM_REG_WAIT(cmd, evt);
 	/* Disable WDMA */
 	MM_REG_WRITE(cmd, subsys_id, base, WDMA_EN, 0x0, BIT(0));
 	return 0;
@@ -592,14 +645,20 @@ static int init_isp(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 {
 	struct device *dev = ctx->comp->mdp_dev->mdp_mmsys;
 	const struct isp_data *isp = &ctx->param->isp;
+	s32 camin, camin2;
+
+	camin = get_comp_inner_id(ctx->comp->mdp_dev, MDP_COMP_CAMIN);
+	camin2 = get_comp_inner_id(ctx->comp->mdp_dev, MDP_COMP_CAMIN2);
+	if (!camin || !camin2)
+		return -EINVAL;
 
 	/* Direct link */
-	if (isp->dl_flags & BIT(MDP_COMP_CAMIN)) {
+	if (isp->dl_flags & BIT(camin)) {
 		dev_dbg(dev, "SW_RST ASYNC");
 		mtk_mmsys_mdp_isp_ctrl(dev, cmd, MDP_COMP_CAMIN);
 	}
 
-	if (isp->dl_flags & BIT(MDP_COMP_CAMIN2)) {
+	if (isp->dl_flags & BIT(camin2)) {
 		dev_dbg(dev, "SW_RST ASYNC2");
 		mtk_mmsys_mdp_isp_ctrl(dev, cmd, MDP_COMP_CAMIN2);
 	}
@@ -711,69 +770,78 @@ static int wait_isp_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	struct device *dev = &ctx->comp->mdp_dev->pdev->dev;
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	int evt;
+	s32 camin, camin2;
+
+	camin = get_comp_inner_id(ctx->comp->mdp_dev, MDP_COMP_CAMIN);
+	camin2 = get_comp_inner_id(ctx->comp->mdp_dev, MDP_COMP_CAMIN2);
+	if (!camin || !camin2)
+		return MDP_COMP_NONE;
 
 	/* MDP_DL_SEL: select MDP_CROP */
-	if (isp->dl_flags & BIT(MDP_COMP_CAMIN))
+	if (isp->dl_flags & BIT(camin))
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x30, 0x0, BIT(9));
 	/* MDP2_DL_SEL: select MDP_CROP2 */
-	if (isp->dl_flags & BIT(MDP_COMP_CAMIN2))
+	if (isp->dl_flags & BIT(camin2))
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x30, 0x0,
 				  BIT(10) | BIT(11));
 
 	switch (isp->cq_idx) {
 	case ISP_DRV_DIP_CQ_THRE0:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(0), BIT(0));
-		MM_REG_WAIT(cmd, ISP_P2_0_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_0_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE1:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(1), BIT(1));
-		MM_REG_WAIT(cmd, ISP_P2_1_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_1_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE2:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(2), BIT(2));
-		MM_REG_WAIT(cmd, ISP_P2_2_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_2_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE3:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(3), BIT(3));
-		MM_REG_WAIT(cmd, ISP_P2_3_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_3_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE4:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(4), BIT(4));
-		MM_REG_WAIT(cmd, ISP_P2_4_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_4_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE5:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(5), BIT(5));
-		MM_REG_WAIT(cmd, ISP_P2_5_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_5_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE6:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(6), BIT(6));
-		MM_REG_WAIT(cmd, ISP_P2_6_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_6_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE7:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(7), BIT(7));
-		MM_REG_WAIT(cmd, ISP_P2_7_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_7_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE8:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(8), BIT(8));
-		MM_REG_WAIT(cmd, ISP_P2_8_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_8_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE9:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(9), BIT(9));
-		MM_REG_WAIT(cmd, ISP_P2_9_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_9_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE10:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(10), BIT(10));
-		MM_REG_WAIT(cmd, ISP_P2_10_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_10_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE11:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, BIT(11), BIT(11));
-		MM_REG_WAIT(cmd, ISP_P2_11_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_11_DONE);
 		break;
 	default:
 		dev_err(dev, "Do not support this cq (%d)", isp->cq_idx);
 		return -EINVAL;
 	}
 
+	MM_REG_WAIT(cmd, evt);
+
 	return 0;
 }
 
@@ -832,52 +900,25 @@ static const struct mdp_comp_ops *mdp_comp_ops[MDP_COMP_TYPE_COUNT] = {
 	[MDP_COMP_TYPE_DL_PATH2] =	&camin_ops,
 };
 
-struct mdp_comp_match {
-	enum mtk_mdp_comp_id id;
-	enum mdp_comp_type	type;
-	u32			alias_id;
-};
-
-static const struct mdp_comp_match mdp_comp_matches[MDP_MAX_COMP_COUNT] = {
-	[MDP_COMP_WPEI] =	{ MDP_COMP_WPEI, MDP_COMP_TYPE_WPEI, 0 },
-	[MDP_COMP_WPEO] =	{ MDP_COMP_WPEO, MDP_COMP_TYPE_EXTO, 2 },
-	[MDP_COMP_WPEI2] =	{ MDP_COMP_WPEI2, MDP_COMP_TYPE_WPEI, 1 },
-	[MDP_COMP_WPEO2] =	{ MDP_COMP_WPEO2, MDP_COMP_TYPE_EXTO, 3 },
-	[MDP_COMP_ISP_IMGI] =	{ MDP_COMP_ISP_IMGI, MDP_COMP_TYPE_IMGI, 0 },
-	[MDP_COMP_ISP_IMGO] =	{ MDP_COMP_ISP_IMGO, MDP_COMP_TYPE_EXTO, 0 },
-	[MDP_COMP_ISP_IMG2O] =	{ MDP_COMP_ISP_IMG2O, MDP_COMP_TYPE_EXTO, 1 },
-
-	[MDP_COMP_CAMIN] =	{ MDP_COMP_CAMIN, MDP_COMP_TYPE_DL_PATH1, 0 },
-	[MDP_COMP_CAMIN2] =	{ MDP_COMP_CAMIN2, MDP_COMP_TYPE_DL_PATH2, 1 },
-	[MDP_COMP_RDMA0] =	{ MDP_COMP_RDMA0, MDP_COMP_TYPE_RDMA, 0 },
-	[MDP_COMP_CCORR0] =	{ MDP_COMP_CCORR0, MDP_COMP_TYPE_CCORR, 0 },
-	[MDP_COMP_RSZ0] =	{ MDP_COMP_RSZ0, MDP_COMP_TYPE_RSZ, 0 },
-	[MDP_COMP_RSZ1] =	{ MDP_COMP_RSZ1, MDP_COMP_TYPE_RSZ, 1 },
-	[MDP_COMP_PATH0_SOUT] =	{ MDP_COMP_PATH0_SOUT, MDP_COMP_TYPE_PATH1, 0 },
-	[MDP_COMP_PATH1_SOUT] =	{ MDP_COMP_PATH1_SOUT, MDP_COMP_TYPE_PATH2, 1 },
-	[MDP_COMP_WROT0] =	{ MDP_COMP_WROT0, MDP_COMP_TYPE_WROT, 0 },
-	[MDP_COMP_WDMA] =	{ MDP_COMP_WDMA, MDP_COMP_TYPE_WDMA, 0 },
-};
-
 static const struct of_device_id mdp_comp_dt_ids[] = {
 	{
 		.compatible = "mediatek,mt8183-mdp3-rdma0",
-		.data = &mdp_comp_matches[MDP_COMP_RDMA0],
+		.data = (void *)MDP_COMP_RDMA0,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-ccorr",
-		.data = &mdp_comp_matches[MDP_COMP_CCORR0],
+		.data = (void *)MDP_COMP_CCORR0,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-rsz0",
-		.data = &mdp_comp_matches[MDP_COMP_RSZ0],
+		.data = (void *)MDP_COMP_RSZ0,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-rsz1",
-		.data = &mdp_comp_matches[MDP_COMP_RSZ1],
+		.data = (void *)MDP_COMP_RSZ1,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-wrot0",
-		.data = &mdp_comp_matches[MDP_COMP_WROT0],
+		.data = (void *)MDP_COMP_WROT0,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-wdma",
-		.data = &mdp_comp_matches[MDP_COMP_WDMA],
+		.data = (void *)MDP_COMP_WDMA,
 	},
 	{}
 };
@@ -885,47 +926,26 @@ static const struct of_device_id mdp_comp_dt_ids[] = {
 static const struct of_device_id mdp_sub_comp_dt_ids[] = {
 	{
 		.compatible = "mediatek,mt8183-mdp3-path1",
-		.data = &mdp_comp_matches[MDP_COMP_PATH0_SOUT],
+		.data = (void *)MDP_COMP_PATH0_SOUT,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-path2",
-		.data = &mdp_comp_matches[MDP_COMP_PATH1_SOUT],
+		.data = (void *)MDP_COMP_PATH1_SOUT,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-imgi",
-		.data = &mdp_comp_matches[MDP_COMP_ISP_IMGI],
+		.data = (void *)MDP_COMP_ISP_IMGI,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-exto",
-		.data = &mdp_comp_matches[MDP_COMP_ISP_IMGO],
+		.data = (void *)MDP_COMP_ISP_IMGO,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-dl1",
-		.data = &mdp_comp_matches[MDP_COMP_CAMIN],
+		.data = (void *)MDP_COMP_CAMIN,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-dl2",
-		.data = &mdp_comp_matches[MDP_COMP_CAMIN2],
+		.data = (void *)MDP_COMP_CAMIN2,
 	},
 	{}
 };
 
-/* Used to describe the item order in MDP property */
-struct mdp_comp_info {
-	u32	clk_num;
-	u32	clk_ofst;
-	u32	dts_reg_ofst;
-};
-
-static const struct mdp_comp_info mdp_comp_dt_info[MDP_COMP_TYPE_COUNT] = {
-	[MDP_COMP_TYPE_RDMA]		= {2, 0, 0},
-	[MDP_COMP_TYPE_RSZ]		= {1, 0, 0},
-	[MDP_COMP_TYPE_WROT]		= {1, 0, 0},
-	[MDP_COMP_TYPE_WDMA]		= {1, 0, 0},
-	[MDP_COMP_TYPE_PATH1]		= {0, 0, 2},
-	[MDP_COMP_TYPE_PATH2]		= {0, 0, 3},
-	[MDP_COMP_TYPE_CCORR]		= {1, 0, 0},
-	[MDP_COMP_TYPE_IMGI]		= {0, 0, 4},
-	[MDP_COMP_TYPE_EXTO]		= {0, 0, 4},
-	[MDP_COMP_TYPE_DL_PATH1]	= {2, 2, 1},
-	[MDP_COMP_TYPE_DL_PATH2]	= {2, 4, 1},
-};
-
 void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 {
 	int i, err;
@@ -935,7 +955,7 @@ void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 		if (err < 0)
 			dev_err(dev,
 				"Failed to get power, err %d. type:%d id:%d\n",
-				err, comp->type, comp->id);
+				err, comp->type, comp->inner_id);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(comp->clks); i++) {
@@ -945,7 +965,7 @@ void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 		if (err)
 			dev_err(dev,
 				"Failed to enable clk %d. type:%d id:%d\n",
-				i, comp->type, comp->id);
+				i, comp->type, comp->inner_id);
 	}
 }
 
@@ -979,7 +999,7 @@ void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num)
 		mdp_comp_clock_off(dev, &comps[i]);
 }
 
-static int mdp_get_subsys_id(struct device *dev, struct device_node *node,
+static int mdp_get_subsys_id(struct mdp_dev *mdp, struct device *dev, struct device_node *node,
 			     struct mdp_comp *comp)
 {
 	struct platform_device *comp_pdev;
@@ -993,12 +1013,12 @@ static int mdp_get_subsys_id(struct device *dev, struct device_node *node,
 	comp_pdev = of_find_device_by_node(node);
 
 	if (!comp_pdev) {
-		dev_err(dev, "get comp_pdev fail! comp id=%d type=%d\n",
-			comp->id, comp->type);
+		dev_err(dev, "get comp_pdev fail! comp public id=%d, inner id = %d, type=%d\n",
+			comp->public_id, comp->inner_id, comp->type);
 		return -ENODEV;
 	}
 
-	index = mdp_comp_dt_info[comp->type].dts_reg_ofst;
+	index = mdp->mdp_data->comp_data[comp->public_id].info.dts_reg_ofst;
 	ret = cmdq_dev_get_client_reg(&comp_pdev->dev, &cmdq_reg, index);
 	if (ret != 0) {
 		dev_err(&comp_pdev->dev, "cmdq_dev_get_subsys fail!\n");
@@ -1016,8 +1036,9 @@ static void __mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 {
 	struct resource res;
 	phys_addr_t base;
-	int index = mdp_comp_dt_info[comp->type].dts_reg_ofst;
+	int index;
 
+	index = mdp->mdp_data->comp_data[comp->public_id].info.dts_reg_ofst;
 	if (of_address_to_resource(node, index, &res) < 0)
 		base = 0L;
 	else
@@ -1041,14 +1062,15 @@ static int mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 		return -EINVAL;
 	}
 
-	comp->type = mdp_comp_matches[id].type;
-	comp->id = mdp_comp_matches[id].id;
-	comp->alias_id = mdp_comp_matches[id].alias_id;
+	comp->public_id = id;
+	comp->type = mdp->mdp_data->comp_data[id].match.type;
+	comp->inner_id = mdp->mdp_data->comp_data[id].match.inner_id;
+	comp->alias_id = mdp->mdp_data->comp_data[id].match.alias_id;
 	comp->ops = mdp_comp_ops[comp->type];
 	__mdp_comp_init(mdp, node, comp);
 
-	clk_num = mdp_comp_dt_info[comp->type].clk_num;
-	clk_ofst = mdp_comp_dt_info[comp->type].clk_ofst;
+	clk_num = mdp->mdp_data->comp_data[id].info.clk_num;
+	clk_ofst = mdp->mdp_data->comp_data[id].info.clk_ofst;
 
 	for (i = 0; i < clk_num; i++) {
 		comp->clks[i] = of_clk_get(node, i + clk_ofst);
@@ -1056,14 +1078,14 @@ static int mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 			break;
 	}
 
-	mdp_get_subsys_id(dev, node, comp);
+	mdp_get_subsys_id(mdp, dev, node, comp);
 
 	return 0;
 }
 
 static struct mdp_comp *mdp_comp_create(struct mdp_dev *mdp,
 					struct device_node *node,
-					enum mtk_mdp_comp_id id)
+					enum mtk_mdp_comp_id  id)
 {
 	struct device *dev = &mdp->pdev->dev;
 	struct mdp_comp *comp;
@@ -1084,8 +1106,8 @@ static struct mdp_comp *mdp_comp_create(struct mdp_dev *mdp,
 	mdp->comp[id] = comp;
 	mdp->comp[id]->mdp_dev = mdp;
 
-	dev_info(dev, "%s type:%d alias:%d id:%d base:%#x regs:%p\n",
-		 dev->of_node->name, comp->type, comp->alias_id, id,
+	dev_info(dev, "%s type:%d alias:%d public id:%d inner_id:%d base:%#x regs:%p\n",
+		 dev->of_node->name, comp->type, comp->alias_id, id, comp->inner_id,
 		 (u32)comp->reg_base, comp->regs);
 	return comp;
 }
@@ -1097,21 +1119,22 @@ static int mdp_sub_comps_create(struct mdp_dev *mdp, struct device_node *node)
 	int index = 0;
 
 	of_property_for_each_string(node, "mediatek,mdp3-comps", prop, name) {
-		const struct of_device_id *list = mdp_sub_comp_dt_ids;
-		struct mdp_comp_match *match = NULL;
+		const struct of_device_id *matches = mdp_sub_comp_dt_ids;
+		enum mtk_mdp_comp_id id = MDP_COMP_NONE;
 		struct mdp_comp *comp;
 
-		for (; list->compatible[0]; list++) {
-			if (of_compat_cmp(name, list->compatible,
-					  strlen(list->compatible)) == 0) {
-				match = (struct mdp_comp_match *)list->data;
+		for (; matches->compatible[0]; matches++) {
+			if (of_compat_cmp(name, matches->compatible,
+					  strlen(matches->compatible)) == 0) {
+				id = (enum mtk_mdp_comp_id)matches->data;
 				break;
 			}
 		}
 
-		if (match)
-			comp = mdp_comp_create(mdp, node, match->id);
+		if (id == MDP_COMP_NONE)
+			return -ENODEV;
 
+		comp = mdp_comp_create(mdp, node, id);
 		if (IS_ERR(comp))
 			return PTR_ERR(comp);
 
@@ -1133,8 +1156,8 @@ void mdp_component_deinit(struct mdp_dev *mdp)
 {
 	int i;
 
-	for (i = 0; i < MDP_PIPE_MAX; i++)
-		mtk_mutex_put(mdp->mdp_mutex[i]);
+	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++)
+		mtk_mutex_put(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].pipe_id]);
 
 	for (i = 0; i < ARRAY_SIZE(mdp->comp); i++) {
 		if (mdp->comp[i]) {
@@ -1156,7 +1179,7 @@ int mdp_component_init(struct mdp_dev *mdp)
 	/* Iterate over sibling MDP function blocks */
 	for_each_child_of_node(parent, node) {
 		const struct of_device_id *of_id;
-		struct mdp_comp_match *match;
+		enum mtk_mdp_comp_id id;
 		struct mdp_comp *comp;
 
 		of_id = of_match_node(mdp_comp_dt_ids, node);
@@ -1168,9 +1191,8 @@ int mdp_component_init(struct mdp_dev *mdp)
 			continue;
 		}
 
-		match = (struct mdp_comp_match *)of_id->data;
-
-		comp = mdp_comp_create(mdp, node, match->id);
+		id = (enum mtk_mdp_comp_id)of_id->data;
+		comp = mdp_comp_create(mdp, node, id);
 		if (IS_ERR(comp))
 			goto err_init_comps;
 
@@ -1207,16 +1229,15 @@ int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
 	const struct img_ipi_frameparam *frame)
 {
 	struct device *dev = &mdp->pdev->dev;
+	enum mtk_mdp_comp_id public_id = MDP_COMP_NONE;
 	int i;
 
-	if (param->type < 0 || param->type >= MDP_MAX_COMP_COUNT) {
-		dev_err(dev, "Invalid component id %d", param->type);
+	public_id = get_comp_public_id(mdp, param->type);
+	if (!public_id)
 		return -EINVAL;
-	}
-
-	ctx->comp = mdp->comp[param->type];
+	ctx->comp = mdp->comp[public_id];
 	if (!ctx->comp) {
-		dev_err(dev, "Uninit component id %d", param->type);
+		dev_err(dev, "Uninit component inner id %d", param->type);
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
index 7b34f9c42410..57f5ca3052ba 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
@@ -41,24 +41,38 @@
 enum mdp_comp_type {
 	MDP_COMP_TYPE_INVALID = 0,
 
+	MDP_COMP_TYPE_IMGI,
+	MDP_COMP_TYPE_WPEI,
+
 	MDP_COMP_TYPE_RDMA,
 	MDP_COMP_TYPE_RSZ,
 	MDP_COMP_TYPE_WROT,
 	MDP_COMP_TYPE_WDMA,
 	MDP_COMP_TYPE_PATH1,
 	MDP_COMP_TYPE_PATH2,
+	MDP_COMP_TYPE_SPLIT,
+	MDP_COMP_TYPE_STITCH,
+	MDP_COMP_TYPE_FG,
+	MDP_COMP_TYPE_OVL,
+	MDP_COMP_TYPE_PAD,
+	MDP_COMP_TYPE_MERGE,
 
 	MDP_COMP_TYPE_TDSHP,
 	MDP_COMP_TYPE_COLOR,
 	MDP_COMP_TYPE_DRE,
 	MDP_COMP_TYPE_CCORR,
 	MDP_COMP_TYPE_HDR,
+	MDP_COMP_TYPE_AAL,
+	MDP_COMP_TYPE_TCC,
 
-	MDP_COMP_TYPE_IMGI,
-	MDP_COMP_TYPE_WPEI,
 	MDP_COMP_TYPE_EXTO,	/* External path */
 	MDP_COMP_TYPE_DL_PATH1, /* Direct-link path1 */
 	MDP_COMP_TYPE_DL_PATH2, /* Direct-link path2 */
+	MDP_COMP_TYPE_DL_PATH3, /* Direct-link path3 */
+	MDP_COMP_TYPE_DL_PATH4, /* Direct-link path4 */
+	MDP_COMP_TYPE_DL_PATH5, /* Direct-link path5 */
+	MDP_COMP_TYPE_DL_PATH6, /* Direct-link path6 */
+	MDP_COMP_TYPE_DUMMY,
 
 	MDP_COMP_TYPE_COUNT	/* ALWAYS keep at the end */
 };
@@ -73,6 +87,18 @@ enum mdp_comp_event {
 	WROT0_DONE,
 	WDMA0_SOF,
 	WDMA0_DONE,
+	RDMA1_SOF,
+	RDMA2_SOF,
+	RDMA3_SOF,
+	WROT1_SOF,
+	WROT2_SOF,
+	WROT3_SOF,
+	RDMA1_FRAME_DONE,
+	RDMA2_FRAME_DONE,
+	RDMA3_FRAME_DONE,
+	WROT1_FRAME_DONE,
+	WROT2_FRAME_DONE,
+	WROT3_FRAME_DONE,
 
 	ISP_P2_0_DONE,
 	ISP_P2_1_DONE,
@@ -96,6 +122,43 @@ enum mdp_comp_event {
 	MDP_MAX_EVENT_COUNT	/* ALWAYS keep at the end */
 };
 
+enum mdp_mmsys_config_id {
+	CONFIG_VPP0_HW_DCM_1ST_DIS0,
+	CONFIG_VPP0_DL_IRELAY_WR,
+	CONFIG_VPP1_HW_DCM_1ST_DIS0,
+	CONFIG_VPP1_HW_DCM_1ST_DIS1,
+	CONFIG_VPP1_HW_DCM_2ND_DIS0,
+	CONFIG_VPP1_HW_DCM_2ND_DIS1,
+	CONFIG_SVPP2_BUF_BF_RSZ_SWITCH,
+	CONFIG_SVPP3_BUF_BF_RSZ_SWITCH,
+	MDP_MAX_CONFIG_COUNT
+};
+
+struct mdp_comp_match {
+	enum mdp_comp_type type;
+	u32 alias_id;
+	s32 inner_id;
+};
+
+/* Used to describe the item order in MDP property */
+struct mdp_comp_info {
+	u32 clk_num;
+	u32 clk_ofst;
+	u32 dts_reg_ofst;
+};
+
+struct mdp_mutex_info {
+	u32 mmsys_id;
+	u32 mod;
+	u32 mod2;
+};
+
+struct mdp_comp_data {
+	struct mdp_comp_match match;
+	struct mdp_comp_info info;
+	struct mdp_mutex_info mutex;
+};
+
 struct mdp_comp_ops;
 
 struct mdp_comp {
@@ -106,8 +169,9 @@ struct mdp_comp {
 	struct clk			*clks[6];
 	struct device			*comp_dev;
 	enum mdp_comp_type		type;
-	enum mtk_mdp_comp_id		id;
+	enum mtk_mdp_comp_id		public_id;
 	u32				alias_id;
+	s32				inner_id;
 	const struct mdp_comp_ops	*ops;
 };
 
@@ -134,6 +198,11 @@ struct mdp_comp_ops {
 
 struct mdp_dev;
 
+s32 get_comp_inner_id(struct mdp_dev *mdp_dev, enum mtk_mdp_comp_id id);
+enum mtk_mdp_comp_id get_comp_public_id(struct mdp_dev *mdp_dev, s32 id);
+bool is_dummy_engine(struct mdp_dev *mdp_dev, s32 inner_id);
+bool is_rdma(struct mdp_dev *mdp_dev, s32 inner_id);
+
 int mdp_component_init(struct mdp_dev *mdp);
 void mdp_component_deinit(struct mdp_dev *mdp);
 void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp);
@@ -142,6 +211,8 @@ void mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num);
 void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num);
 int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
 		      const struct img_compparam *param,
-	const struct img_ipi_frameparam *frame);
+		      const struct img_ipi_frameparam *frame);
+
+int mdp_get_event_idx(struct mdp_dev *mdp, enum mdp_comp_event event);
 
 #endif  /* __MTK_MDP3_COMP_H__ */
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index 535a9b51ee88..a646e99e410f 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -14,18 +14,17 @@
 #include <media/videobuf2-dma-contig.h>
 #include "mtk-mdp3-core.h"
 #include "mtk-mdp3-m2m.h"
-
-static const struct mdp_platform_config mt8183_plat_cfg = {
-	.rdma_support_10bit		= true,
-	.rdma_rsz1_sram_sharing		= true,
-	.rdma_upsample_repeat_only	= true,
-	.rsz_disable_dcm_small_sample	= false,
-	.wrot_filter_constraint		= false,
-	.gce_event_offset		= 2,
-};
+#include "mt8183_mdp.h"
 
 static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_cfg = &mt8183_plat_cfg,
+	.event = mt8183_mdp_event,
+	.event_len = ARRAY_SIZE(mt8183_mdp_event),
+	.comp_data = mt8183_mdp_comp_data,
+	.pipe_info = mt8183_pipe_info,
+	.pipe_info_len = ARRAY_SIZE(mt8183_pipe_info),
+	.format = mt8183_formats,
+	.format_len = ARRAY_SIZE(mt8183_formats),
 };
 
 static const struct of_device_id mdp_of_ids[] = {
@@ -140,7 +139,7 @@ static int mdp_probe(struct platform_device *pdev)
 	struct device_node *mdp_node;
 	struct platform_device *mm_pdev;
 	u32 event_ofst;
-	int ret, i;
+	int ret, i, mutex_id;
 
 	mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
 	if (!mdp) {
@@ -164,7 +163,7 @@ static int mdp_probe(struct platform_device *pdev)
 	}
 
 	event_ofst = mdp->mdp_data->mdp_cfg->gce_event_offset;
-	for (i = RDMA0_SOF; i < MDP_MAX_EVENT_COUNT; i++) {
+	for (i = 0; i < mdp->mdp_data->event_len; i++) {
 		s32 event_id;
 
 		if (!dev)
@@ -188,9 +187,15 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_return;
 	}
 
-	for (i = 0; i < MDP_PIPE_MAX; i++) {
-		mdp->mdp_mutex[i] = mtk_mutex_mdp_get(&mm_pdev->dev, i);
-		if (!mdp->mdp_mutex[i]) {
+	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++) {
+		mutex_id = mdp->mdp_data->pipe_info[i].mutex_id;
+		if (mdp->mdp_mutex[mutex_id])
+			continue;
+
+		mdp->mdp_mutex[mutex_id] =
+			mtk_mutex_mdp_get(&mm_pdev->dev, mdp->mdp_data->pipe_info[i].pipe_id);
+
+		if (!mdp->mdp_mutex[mutex_id]) {
 			ret = -ENODEV;
 			goto err_return;
 		}
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index d688071b0bf1..119af7666b59 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -31,10 +31,19 @@ struct mdp_platform_config {
 	bool	rsz_disable_dcm_small_sample;
 	bool	wrot_filter_constraint;
 	u32	gce_event_offset;
+	bool	support_multi_larb;
 };
 
 struct mtk_mdp_driver_data {
 	const struct mdp_platform_config *mdp_cfg;
+	const enum mdp_comp_event *event;
+	unsigned int event_len;
+	const struct mdp_comp_data *comp_data;
+	const struct mdp_pipe_info *pipe_info;
+	unsigned int pipe_info_len;
+	const struct mdp_format *format;
+	unsigned int format_len;
+	const enum mdp_mmsys_config_id *config_table;
 };
 
 struct mdp_dev {
@@ -67,6 +76,13 @@ struct mdp_dev {
 	atomic_t				job_count;
 };
 
+struct mdp_pipe_info {
+	enum mtk_mdp_pipe_id pipe_id;
+	u32 mmsys_id;
+	u32 mutex_id;
+	u32 sof;
+};
+
 int mdp_vpu_get_locked(struct mdp_dev *mdp);
 void mdp_vpu_put_locked(struct mdp_dev *mdp);
 int mdp_vpu_register(struct mdp_dev *mdp);
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index 9b3d9a59ae48..ca1c19c41950 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -617,6 +617,8 @@ static int mdp_m2m_open(struct file *file)
 	int ret;
 	struct v4l2_format default_format;
 
+	mdp_format_init(mdp->mdp_data->format, mdp->mdp_data->format_len);
+
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
index 439711298867..83e91735202b 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
@@ -11,226 +11,8 @@
 #include "mtk-mdp3-regs.h"
 #include "mtk-mdp3-m2m.h"
 
-static const struct mdp_format mdp_formats[] = {
-	{
-		.pixelformat	= V4L2_PIX_FMT_GREY,
-		.mdp_color	= MDP_COLOR_GREY,
-		.depth		= { 8 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_RGB565X,
-		.mdp_color	= MDP_COLOR_RGB565,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_RGB565,
-		.mdp_color	= MDP_COLOR_BGR565,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_RGB24,
-		.mdp_color	= MDP_COLOR_RGB888,
-		.depth		= { 24 },
-		.row_depth	= { 24 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_BGR24,
-		.mdp_color	= MDP_COLOR_BGR888,
-		.depth		= { 24 },
-		.row_depth	= { 24 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_ABGR32,
-		.mdp_color	= MDP_COLOR_BGRA8888,
-		.depth		= { 32 },
-		.row_depth	= { 32 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_ARGB32,
-		.mdp_color	= MDP_COLOR_ARGB8888,
-		.depth		= { 32 },
-		.row_depth	= { 32 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_UYVY,
-		.mdp_color	= MDP_COLOR_UYVY,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_VYUY,
-		.mdp_color	= MDP_COLOR_VYUY,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YUYV,
-		.mdp_color	= MDP_COLOR_YUYV,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YVYU,
-		.mdp_color	= MDP_COLOR_YVYU,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YUV420,
-		.mdp_color	= MDP_COLOR_I420,
-		.depth		= { 12 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YVU420,
-		.mdp_color	= MDP_COLOR_YV12,
-		.depth		= { 12 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV12,
-		.mdp_color	= MDP_COLOR_NV12,
-		.depth		= { 12 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV21,
-		.mdp_color	= MDP_COLOR_NV21,
-		.depth		= { 12 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV16,
-		.mdp_color	= MDP_COLOR_NV16,
-		.depth		= { 16 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV61,
-		.mdp_color	= MDP_COLOR_NV61,
-		.depth		= { 16 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV24,
-		.mdp_color	= MDP_COLOR_NV24,
-		.depth		= { 24 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV42,
-		.mdp_color	= MDP_COLOR_NV42,
-		.depth		= { 24 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_MT21C,
-		.mdp_color	= MDP_COLOR_420_BLK_UFO,
-		.depth		= { 8, 4 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 4,
-		.halign		= 5,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_MM21,
-		.mdp_color	= MDP_COLOR_420_BLK,
-		.depth		= { 8, 4 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 4,
-		.halign		= 5,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV12M,
-		.mdp_color	= MDP_COLOR_NV12,
-		.depth		= { 8, 4 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV21M,
-		.mdp_color	= MDP_COLOR_NV21,
-		.depth		= { 8, 4 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV16M,
-		.mdp_color	= MDP_COLOR_NV16,
-		.depth		= { 8, 8 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV61M,
-		.mdp_color	= MDP_COLOR_NV61,
-		.depth		= { 8, 8 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YUV420M,
-		.mdp_color	= MDP_COLOR_I420,
-		.depth		= { 8, 2, 2 },
-		.row_depth	= { 8, 4, 4 },
-		.num_planes	= 3,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YVU420M,
-		.mdp_color	= MDP_COLOR_YV12,
-		.depth		= { 8, 2, 2 },
-		.row_depth	= { 8, 4, 4 },
-		.num_planes	= 3,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}
-};
+static const struct mdp_format *mdp_formats;
+static u32 format_len;
 
 static const struct mdp_limit mdp_def_limit = {
 	.out_limit = {
@@ -257,7 +39,7 @@ static const struct mdp_format *mdp_find_fmt(u32 pixelformat, u32 type)
 
 	flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
 					MDP_FMT_FLAG_CAPTURE;
-	for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
+	for (i = 0; i < format_len; ++i) {
 		if (!(mdp_formats[i].flags & flag))
 			continue;
 		if (mdp_formats[i].pixelformat == pixelformat)
@@ -272,7 +54,7 @@ static const struct mdp_format *mdp_find_fmt_by_index(u32 index, u32 type)
 
 	flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
 					MDP_FMT_FLAG_CAPTURE;
-	for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
+	for (i = 0; i < format_len; ++i) {
 		if (!(mdp_formats[i].flags & flag))
 			continue;
 		if (index == num)
@@ -735,3 +517,10 @@ int mdp_frameparam_init(struct mdp_frameparam *param)
 
 	return 0;
 }
+
+void mdp_format_init(const struct mdp_format *format, u32 length)
+{
+	mdp_formats = format;
+	format_len = length;
+}
+
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
index 3ff784aa372b..0fdc1b228227 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
@@ -18,14 +18,17 @@
  * V-subsample: 0, 1
  * Color group: 0-RGB, 1-YUV, 2-raw
  */
-#define MDP_COLOR(PACKED, LOOSE, VIDEO, PLANE, HF, VF, BITS, GROUP, SWAP, ID)\
-	(((PACKED) << 27) | ((LOOSE) << 26) | ((VIDEO) << 23) |\
+#define MDP_COLOR(COMPRESS, PACKED, LOOSE, VIDEO, PLANE, HF, VF, BITS, GROUP, SWAP, ID)\
+	(((COMPRESS) << 29) | ((PACKED) << 28) | ((LOOSE) << 27) | ((VIDEO) << 23) |\
 	 ((PLANE) << 21) | ((HF) << 19) | ((VF) << 18) | ((BITS) << 8) |\
 	 ((GROUP) << 6) | ((SWAP) << 5) | ((ID) << 0))
 
-#define MDP_COLOR_IS_10BIT_PACKED(c)	((0x08000000 & (c)) >> 27)
-#define MDP_COLOR_IS_10BIT_LOOSE(c)	(((0x0c000000 & (c)) >> 26) == 1)
-#define MDP_COLOR_IS_10BIT_TILE(c)	(((0x0c000000 & (c)) >> 26) == 3)
+#define MDP_COLOR_IS_HYFBC_COMPRESS(c)  ((0x40000000 & (c)) >> 30)
+#define MDP_COLOR_IS_COMPRESS(c)        ((0x20000000 & (c)) >> 29)
+#define MDP_COLOR_IS_10BIT_PACKED(c)    ((0x10000000 & (c)) >> 28)
+#define MDP_COLOR_IS_10BIT_LOOSE(c)     (((0x18000000 & (c)) >> 27) == 1)
+#define MDP_COLOR_IS_10BIT_TILE(c)      (((0x18000000 & (c)) >> 27) == 3)
+#define MDP_COLOR_IS_10BIT_JUMP(c)      ((0x04000000 & (c)) >> 26)
 #define MDP_COLOR_IS_UFP(c)		((0x02000000 & (c)) >> 25)
 #define MDP_COLOR_IS_INTERLACED(c)	((0x01000000 & (c)) >> 24)
 #define MDP_COLOR_IS_BLOCK_MODE(c)	((0x00800000 & (c)) >> 23)
@@ -42,148 +45,120 @@
 #define MDP_COLOR_IS_YUV(c)		(MDP_COLOR_GET_GROUP(c) == 1)
 #define MDP_COLOR_IS_UV_COPLANE(c)	((MDP_COLOR_GET_PLANE_COUNT(c) == 2) &&\
 					 MDP_COLOR_IS_YUV(c))
+#define MDP_COLOR_IS_10BIT(c)            (((0x18000000 & (c)) >> 27) != 0)
+#define MDP_COLOR_GET_AUO_MODE(c)        (MDP_COLOR_IS_10BIT_JUMP(c))
 
 enum mdp_color {
 	MDP_COLOR_UNKNOWN	= 0,
 
-	//MDP_COLOR_FULLG8,
-	MDP_COLOR_FULLG8_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 21),
-	MDP_COLOR_FULLG8_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 21),
-	MDP_COLOR_FULLG8_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 21),
-	MDP_COLOR_FULLG8_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 21),
-	MDP_COLOR_FULLG8	= MDP_COLOR_FULLG8_BGGR,
-
-	//MDP_COLOR_FULLG10,
-	MDP_COLOR_FULLG10_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 21),
-	MDP_COLOR_FULLG10_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 21),
-	MDP_COLOR_FULLG10_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 21),
-	MDP_COLOR_FULLG10_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 21),
-	MDP_COLOR_FULLG10	= MDP_COLOR_FULLG10_BGGR,
-
-	//MDP_COLOR_FULLG12,
-	MDP_COLOR_FULLG12_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 21),
-	MDP_COLOR_FULLG12_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 21),
-	MDP_COLOR_FULLG12_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 21),
-	MDP_COLOR_FULLG12_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 21),
-	MDP_COLOR_FULLG12	= MDP_COLOR_FULLG12_BGGR,
-
-	//MDP_COLOR_FULLG14,
-	MDP_COLOR_FULLG14_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 21),
-	MDP_COLOR_FULLG14_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2,  0, 21),
-	MDP_COLOR_FULLG14_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2,  0, 21),
-	MDP_COLOR_FULLG14_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2,  0, 21),
-	MDP_COLOR_FULLG14	= MDP_COLOR_FULLG14_BGGR,
-
-	MDP_COLOR_UFO10		= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 24),
-
-	//MDP_COLOR_BAYER8,
-	MDP_COLOR_BAYER8_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 20),
-	MDP_COLOR_BAYER8_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 20),
-	MDP_COLOR_BAYER8_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 20),
-	MDP_COLOR_BAYER8_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 20),
-	MDP_COLOR_BAYER8	= MDP_COLOR_BAYER8_BGGR,
-
-	//MDP_COLOR_BAYER10,
-	MDP_COLOR_BAYER10_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 20),
-	MDP_COLOR_BAYER10_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 20),
-	MDP_COLOR_BAYER10_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 20),
-	MDP_COLOR_BAYER10_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 20),
-	MDP_COLOR_BAYER10	= MDP_COLOR_BAYER10_BGGR,
-
-	//MDP_COLOR_BAYER12,
-	MDP_COLOR_BAYER12_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 20),
-	MDP_COLOR_BAYER12_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 20),
-	MDP_COLOR_BAYER12_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 20),
-	MDP_COLOR_BAYER12_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 20),
-	MDP_COLOR_BAYER12	= MDP_COLOR_BAYER12_BGGR,
-
-	//MDP_COLOR_BAYER14,
-	MDP_COLOR_BAYER14_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 20),
-	MDP_COLOR_BAYER14_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2,  0, 20),
-	MDP_COLOR_BAYER14_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2,  0, 20),
-	MDP_COLOR_BAYER14_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2,  0, 20),
-	MDP_COLOR_BAYER14	= MDP_COLOR_BAYER14_BGGR,
-
-	MDP_COLOR_RGB48		= MDP_COLOR(0, 0, 0, 1, 0, 0, 48, 0,  0, 23),
-	/* For bayer+mono raw-16 */
-	MDP_COLOR_RGB565_RAW	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 2,  0, 0),
-
-	MDP_COLOR_BAYER8_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 22),
-	MDP_COLOR_BAYER10_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 22),
-	MDP_COLOR_BAYER12_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 22),
-	MDP_COLOR_BAYER14_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 22),
-
-	/* Unified formats */
-	MDP_COLOR_GREY		= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 1,  0, 7),
-
-	MDP_COLOR_RGB565	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  0, 0),
-	MDP_COLOR_BGR565	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  1, 0),
-	MDP_COLOR_RGB888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  1, 1),
-	MDP_COLOR_BGR888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  0, 1),
-	MDP_COLOR_RGBA8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 2),
-	MDP_COLOR_BGRA8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 2),
-	MDP_COLOR_ARGB8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 3),
-	MDP_COLOR_ABGR8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 3),
-
-	MDP_COLOR_UYVY		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 4),
-	MDP_COLOR_VYUY		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 4),
-	MDP_COLOR_YUYV		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 5),
-	MDP_COLOR_YVYU		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 5),
-
-	MDP_COLOR_I420		= MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  0, 8),
-	MDP_COLOR_YV12		= MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  1, 8),
-	MDP_COLOR_I422		= MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  0, 9),
-	MDP_COLOR_YV16		= MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  1, 9),
-	MDP_COLOR_I444		= MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  0, 10),
-	MDP_COLOR_YV24		= MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  1, 10),
-
-	MDP_COLOR_NV12		= MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  0, 12),
-	MDP_COLOR_NV21		= MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  1, 12),
-	MDP_COLOR_NV16		= MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  0, 13),
-	MDP_COLOR_NV61		= MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  1, 13),
-	MDP_COLOR_NV24		= MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  0, 14),
-	MDP_COLOR_NV42		= MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  1, 14),
-
-	/* Mediatek proprietary formats */
-	/* UFO encoded block mode */
-	MDP_COLOR_420_BLK_UFO	= MDP_COLOR(0, 0, 5, 2, 1, 1, 256, 1, 0, 12),
-	/* Block mode */
-	MDP_COLOR_420_BLK	= MDP_COLOR(0, 0, 1, 2, 1, 1, 256, 1, 0, 12),
-	/* Block mode + field mode */
-	MDP_COLOR_420_BLKI	= MDP_COLOR(0, 0, 3, 2, 1, 1, 256, 1, 0, 12),
-	/* Block mode */
-	MDP_COLOR_422_BLK	= MDP_COLOR(0, 0, 1, 1, 1, 0, 512, 1, 0, 4),
-
-	MDP_COLOR_IYU2		= MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 25),
-	MDP_COLOR_YUV444	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 30),
-
-	/* Packed 10-bit formats */
-	MDP_COLOR_RGBA1010102	= MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 1, 2),
-	MDP_COLOR_BGRA1010102	= MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 0, 2),
-	/* Packed 10-bit UYVY */
-	MDP_COLOR_UYVY_10P	= MDP_COLOR(1, 0, 0, 1, 1, 0, 20,  1, 0, 4),
-	/* Packed 10-bit NV21 */
-	MDP_COLOR_NV21_10P	= MDP_COLOR(1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
-	/* 10-bit block mode */
-	MDP_COLOR_420_BLK_10_H	= MDP_COLOR(1, 0, 1, 2, 1, 1, 320, 1, 0, 12),
-	/* 10-bit HEVC tile mode */
-	MDP_COLOR_420_BLK_10_V	= MDP_COLOR(1, 1, 1, 2, 1, 1, 320, 1, 0, 12),
-	/* UFO encoded 10-bit block mode */
-	MDP_COLOR_420_BLK_U10_H	= MDP_COLOR(1, 0, 5, 2, 1, 1, 320, 1, 0, 12),
-	/* UFO encoded 10-bit HEVC tile mode */
-	MDP_COLOR_420_BLK_U10_V	= MDP_COLOR(1, 1, 5, 2, 1, 1, 320, 1, 0, 12),
-
-	/* Loose 10-bit formats */
-	MDP_COLOR_UYVY_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 4),
-	MDP_COLOR_VYUY_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 4),
-	MDP_COLOR_YUYV_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 5),
-	MDP_COLOR_YVYU_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 5),
-	MDP_COLOR_NV12_10L	= MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 0, 12),
-	MDP_COLOR_NV21_10L	= MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 1, 12),
-	MDP_COLOR_NV16_10L	= MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 0, 13),
-	MDP_COLOR_NV61_10L	= MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 1, 13),
-	MDP_COLOR_YV12_10L	= MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 1, 8),
-	MDP_COLOR_I420_10L	= MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 0, 8),
+	// Unified format
+	MDP_COLOR_GREY           = MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 1,  0, 7),
+
+	MDP_COLOR_RGB565         = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 16, 0,  0, 0),
+	MDP_COLOR_BGR565         = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 16, 0,  1, 0),
+	MDP_COLOR_RGB888         = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24, 0,  1, 1),
+	MDP_COLOR_BGR888         = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24, 0,  0, 1),
+	MDP_COLOR_RGBA8888       = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  1, 2),
+	MDP_COLOR_BGRA8888       = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  0, 2),
+	MDP_COLOR_ARGB8888       = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  1, 3),
+	MDP_COLOR_ABGR8888       = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  0, 3),
+
+	MDP_COLOR_UYVY           = MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  0, 4),
+	MDP_COLOR_VYUY           = MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  1, 4),
+	MDP_COLOR_YUYV           = MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  0, 5),
+	MDP_COLOR_YVYU           = MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  1, 5),
+
+	MDP_COLOR_I420           = MDP_COLOR(0, 0, 0, 0, 3, 1, 1,  8, 1,  0, 8),
+	MDP_COLOR_YV12           = MDP_COLOR(0, 0, 0, 0, 3, 1, 1,  8, 1,  1, 8),
+	MDP_COLOR_I422           = MDP_COLOR(0, 0, 0, 0, 3, 1, 0,  8, 1,  0, 9),
+	MDP_COLOR_YV16           = MDP_COLOR(0, 0, 0, 0, 3, 1, 0,  8, 1,  1, 9),
+	MDP_COLOR_I444           = MDP_COLOR(0, 0, 0, 0, 3, 0, 0,  8, 1,  0, 10),
+	MDP_COLOR_YV24           = MDP_COLOR(0, 0, 0, 0, 3, 0, 0,  8, 1,  1, 10),
+
+	MDP_COLOR_NV12           = MDP_COLOR(0, 0, 0, 0, 2, 1, 1,  8, 1,  0, 12),
+	MDP_COLOR_NV21           = MDP_COLOR(0, 0, 0, 0, 2, 1, 1,  8, 1,  1, 12),
+	MDP_COLOR_NV16           = MDP_COLOR(0, 0, 0, 0, 2, 1, 0,  8, 1,  0, 13),
+	MDP_COLOR_NV61           = MDP_COLOR(0, 0, 0, 0, 2, 1, 0,  8, 1,  1, 13),
+	MDP_COLOR_NV24           = MDP_COLOR(0, 0, 0, 0, 2, 0, 0,  8, 1,  0, 14),
+	MDP_COLOR_NV42           = MDP_COLOR(0, 0, 0, 0, 2, 0, 0,  8, 1,  1, 14),
+
+	// Mediatek proprietary format
+	//Frame mode + Block mode + UFO
+	MDP_COLOR_420_BLKP_UFO   = MDP_COLOR(0, 0, 0, 5, 2, 1, 1, 256, 1, 0, 12),
+	//Frame mode + Block mode + UFO AUO
+	MDP_COLOR_420_BLKP_UFO_AUO   = MDP_COLOR(0, 0, 0, 13, 2, 1, 1, 256, 1, 0, 12),
+	//Frame mode + Block mode
+	MDP_COLOR_420_BLKP       = MDP_COLOR(0, 0, 0, 1, 2, 1, 1, 256, 1, 0, 12),
+	//Field mode + Block mode
+	MDP_COLOR_420_BLKI       = MDP_COLOR(0, 0, 0, 3, 2, 1, 1, 256, 1, 0, 12),
+	//Frame mode
+	MDP_COLOR_422_BLKP       = MDP_COLOR(0, 0, 0, 1, 1, 1, 0, 512, 1, 0, 4),
+
+	MDP_COLOR_IYU2           = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24,  1, 0, 25),
+	MDP_COLOR_YUV444         = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24,  1, 0, 30),
+
+	// Mediatek proprietary 10bit format
+	MDP_COLOR_RGBA1010102    = MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 1, 2),
+	MDP_COLOR_BGRA1010102    = MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 0, 2),
+	MDP_COLOR_ARGB1010102    = MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 1, 3),
+	MDP_COLOR_ABGR1010102    = MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 0, 3),
+	//Packed 10bit UYVY
+	MDP_COLOR_UYVY_10P       = MDP_COLOR(0, 1, 0, 0, 1, 1, 0, 20,  1, 0, 4),
+	//Packed 10bit NV21
+	MDP_COLOR_NV12_10P       = MDP_COLOR(0, 1, 0, 0, 2, 1, 1, 10,  1, 0, 12),
+	MDP_COLOR_NV21_10P       = MDP_COLOR(0, 1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
+	//Frame mode + Block mode
+	MDP_COLOR_420_BLKP_10_H          = MDP_COLOR(0, 1, 0, 1, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + HEVC tile mode
+	MDP_COLOR_420_BLKP_10_V          = MDP_COLOR(0, 1, 1, 1, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + Block mode + Jump
+	MDP_COLOR_420_BLKP_10_H_JUMP     = MDP_COLOR(0, 1, 0, 9, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + HEVC tile mode + Jump
+	MDP_COLOR_420_BLKP_10_V_JUMP     = MDP_COLOR(0, 1, 1, 9, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + Block mode
+	MDP_COLOR_420_BLKP_UFO_10_H      = MDP_COLOR(0, 1, 0, 5, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + HEVC tile mode
+	MDP_COLOR_420_BLKP_UFO_10_V      = MDP_COLOR(0, 1, 1, 5, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + Block mode + Jump
+	MDP_COLOR_420_BLKP_UFO_10_H_JUMP = MDP_COLOR(0, 1, 0, 13, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + HEVC tile mode + Jump
+	MDP_COLOR_420_BLKP_UFO_10_V_JUMP = MDP_COLOR(0, 1, 1, 13, 2, 1, 1, 320, 1, 0, 12),
+
+	// Loose 10bit format
+	MDP_COLOR_UYVY_10L       = MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 0, 4),
+	MDP_COLOR_VYUY_10L       = MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 1, 4),
+	MDP_COLOR_YUYV_10L       = MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 0, 5),
+	MDP_COLOR_YVYU_10L       = MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 1, 5),
+	MDP_COLOR_NV12_10L       = MDP_COLOR(0, 0, 1, 0, 2, 1, 1, 16,  1, 0, 12),
+	MDP_COLOR_NV21_10L       = MDP_COLOR(0, 0, 1, 0, 2, 1, 1, 16,  1, 1, 12),
+	MDP_COLOR_NV16_10L       = MDP_COLOR(0, 0, 1, 0, 2, 1, 0, 16,  1, 0, 13),
+	MDP_COLOR_NV61_10L       = MDP_COLOR(0, 0, 1, 0, 2, 1, 0, 16,  1, 1, 13),
+	MDP_COLOR_YV12_10L       = MDP_COLOR(0, 0, 1, 0, 3, 1, 1, 16,  1, 1, 8),
+	MDP_COLOR_I420_10L       = MDP_COLOR(0, 0, 1, 0, 3, 1, 1, 16,  1, 0, 8),
+
+	MDP_COLOR_YV12_10P       = MDP_COLOR(0, 1, 0, 0, 3, 1, 1, 10,  1, 1, 8),
+	MDP_COLOR_I422_10P       = MDP_COLOR(0, 1, 0, 0, 3, 1, 0, 10,  1, 0, 9),
+	MDP_COLOR_NV16_10P       = MDP_COLOR(0, 1, 0, 0, 2, 1, 0, 10,  1, 0, 13),
+	MDP_COLOR_NV61_10P       = MDP_COLOR(0, 1, 0, 0, 2, 1, 0, 10,  1, 1, 13),
+
+	MDP_COLOR_I422_10L       = MDP_COLOR(0, 0, 1, 0, 3, 1, 0, 16,  1, 0, 9),
+
+	MDP_COLOR_RGBA8888_AFBC       = MDP_COLOR(1, 0, 0, 0, 1, 0, 0, 32, 0, 1, 2),
+	MDP_COLOR_BGRA8888_AFBC       = MDP_COLOR(1, 0, 0, 0, 1, 0, 0, 32, 0, 0, 2),
+	MDP_COLOR_ARGB8888_AFBC       = MDP_COLOR(1, 0, 0, 0, 1, 0, 0, 32, 0, 1, 3),
+	MDP_COLOR_ABGR8888_AFBC       = MDP_COLOR(1, 0, 0, 0, 1, 0, 0, 32, 0, 0, 3),
+	MDP_COLOR_RGBA1010102_AFBC    = MDP_COLOR(1, 1, 0, 0, 1, 0, 0, 32, 0, 1, 2),
+	MDP_COLOR_BGRA1010102_AFBC    = MDP_COLOR(1, 1, 0, 0, 1, 0, 0, 32, 0, 0, 2),
+	MDP_COLOR_ARGB1010102_AFBC    = MDP_COLOR(1, 1, 0, 0, 1, 0, 0, 32, 0, 1, 3),
+	MDP_COLOR_ABGR1010102_AFBC    = MDP_COLOR(1, 1, 0, 0, 1, 0, 0, 32, 0, 0, 3),
+
+	MDP_COLOR_NV12_AFBC          = MDP_COLOR(1, 0, 0, 0, 2, 1, 1,  12,  1, 0, 12),
+	MDP_COLOR_P010_AFBC          = MDP_COLOR(1, 1, 0, 0, 2, 1, 1,  10,  1, 0, 12),
+
+	MDP_COLOR_NV12_HYFBC          = MDP_COLOR(2, 0, 0, 0, 2, 1, 1,  8,  1, 0, 12),
+	MDP_COLOR_NV21_HYFBC          = MDP_COLOR(2, 0, 0, 0, 2, 1, 1,  8,  1, 1, 12),
+	MDP_COLOR_NV12_10P_HYFBC      = MDP_COLOR(2, 1, 0, 0, 2, 1, 1, 10,  1, 0, 12),
+	MDP_COLOR_NV21_10P_HYFBC      = MDP_COLOR(2, 1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
 };
 
 /* Minimum Y stride that is accepted by MDP HW */
@@ -368,5 +343,6 @@ void mdp_set_src_config(struct img_input *in,
 void mdp_set_dst_config(struct img_output *out,
 			struct mdp_frame *frame, struct vb2_buffer *vb);
 int mdp_frameparam_init(struct mdp_frameparam *param);
+void mdp_format_init(const struct mdp_format *format, u32 length);
 
 #endif  /* __MTK_MDP3_REGS_H__ */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
