Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AD2C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmQc2CMqDWDtPM78E+6C2G5Ao0+hdFk4lZndfoNeS04=; b=D0PCRP779yRtnK
	75qJ8T+nHY040qDzk/cx+VOYwUJzj0nb5V4cEN2mo6bESog6iLldszYiM9k7WzoWY803u5e9cz02C
	hyWrKwXp1+8saurQXG3DFh3cFzLeLSgop25AsUDSRMufyVvLV+3xcpvC11qbtAotDOZ7Kz71x8izr
	vvXo+cM4MEasnxOoEWvLfSnbU+DVv4fgnn8NBEdvweumDfs3zLKNARrUsbK00/b/TRXIIBDnLCHy6
	YTpERU+BfCpJf3f5whs6Qf/PPKy9Co2TmY4f0tuXc8l+XYMnenw/zY+YV3RJVjstulB47dgHIJ5eY
	DEhvMdYjB9b5g10ZvX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9L92-00DZhj-RW; Mon, 17 Jan 2022 06:05:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L6r-00DYUz-7Y; Mon, 17 Jan 2022 06:03:21 +0000
X-UUID: e2e6900b3af5473eacf990b073665dcf-20220116
X-UUID: e2e6900b3af5473eacf990b073665dcf-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1836740703; Sun, 16 Jan 2022 23:03:10 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 13:53:08 +0800
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
Subject: [PATCH v1 07/14] media: platform: mtk-mdp3: Add platform
 configuration for MT8195
Date: Mon, 17 Jan 2022 13:52:47 +0800
Message-ID: <20220117055254.9777-8-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_220317_318433_9A0720D8 
X-CRM114-Status: GOOD (  15.31  )
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

Add platform configuration for MT8195

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mt8195_mdp.h  | 682 ++++++++++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 144 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  22 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  13 +
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  11 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  67 ++
 6 files changed, 933 insertions(+), 6 deletions(-)
 create mode 100644 drivers/media/platform/mtk-mdp3/mt8195_mdp.h

diff --git a/drivers/media/platform/mtk-mdp3/mt8195_mdp.h b/drivers/media/platform/mtk-mdp3/mt8195_mdp.h
new file mode 100644
index 000000000000..f69bc86bcd1e
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp3/mt8195_mdp.h
@@ -0,0 +1,682 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MT8195_MDP_H__
+#define __MT8195_MDP_H__
+
+static const struct mdp_platform_config mt8195_plat_cfg = {
+	.rdma_support_10bit             = true,
+	.rdma_support_extend_ufo        = true,
+	.rdma_support_hyfbc             = true,
+	.rdma_support_afbc              = true,
+	.rdma_esl_setting               = true,
+	.rdma_rsz1_sram_sharing         = false,
+	.rdma_upsample_repeat_only      = false,
+	.rsz_disable_dcm_small_sample   = false,
+	.rsz_etc_control                = true,
+	.wrot_filter_constraint         = false,
+	.tdshp_1_1                      = true,
+	.tdshp_dyn_contrast_version     = 2,
+	.mdp_version_8195               = true,
+	.mdp_version_6885               = true,
+	.gce_event_offset               = 0,
+	.support_multi_larb		= true,
+};
+
+enum mt8195_mdp_comp_id {
+	/* MT8195 Comp id */
+	/* ISP */
+	MT8195_MDP_COMP_WPEI = 0,
+	MT8195_MDP_COMP_WPEO,           /* 1 */
+	MT8195_MDP_COMP_WPEI2,          /* 2 */
+	MT8195_MDP_COMP_WPEO2,          /* 3 */
+
+	/* MDP */
+	MT8195_MDP_COMP_CAMIN,          /* 4 */
+	MT8195_MDP_COMP_CAMIN2,         /* 5 */
+	MT8195_MDP_COMP_SPLIT,          /* 6 */
+	MT8195_MDP_COMP_SPLIT2,         /* 7 */
+	MT8195_MDP_COMP_RDMA0,          /* 8 */
+	MT8195_MDP_COMP_RDMA1,          /* 9 */
+	MT8195_MDP_COMP_RDMA2,          /* 10 */
+	MT8195_MDP_COMP_RDMA3,          /* 11 */
+	MT8195_MDP_COMP_STITCH,         /* 12 */
+	MT8195_MDP_COMP_FG0,            /* 13 */
+	MT8195_MDP_COMP_FG1,            /* 14 */
+	MT8195_MDP_COMP_FG2,            /* 15 */
+	MT8195_MDP_COMP_FG3,            /* 16 */
+	MT8195_MDP_COMP_TO_SVPP2MOUT,   /* 17 */
+	MT8195_MDP_COMP_TO_SVPP3MOUT,   /* 18 */
+	MT8195_MDP_COMP_TO_WARP0MOUT,   /* 19 */
+	MT8195_MDP_COMP_TO_WARP1MOUT,   /* 20 */
+	MT8195_MDP_COMP_VPP0_SOUT,      /* 21 */
+	MT8195_MDP_COMP_VPP1_SOUT,      /* 22 */
+	MT8195_MDP_COMP_PQ0_SOUT,       /* 23 */
+	MT8195_MDP_COMP_PQ1_SOUT,       /* 24 */
+	MT8195_MDP_COMP_HDR0,           /* 25 */
+	MT8195_MDP_COMP_HDR1,           /* 26 */
+	MT8195_MDP_COMP_HDR2,           /* 27 */
+	MT8195_MDP_COMP_HDR3,           /* 28 */
+	MT8195_MDP_COMP_AAL0,           /* 29 */
+	MT8195_MDP_COMP_AAL1,           /* 30 */
+	MT8195_MDP_COMP_AAL2,           /* 31 */
+	MT8195_MDP_COMP_AAL3,           /* 32 */
+	MT8195_MDP_COMP_RSZ0,           /* 33 */
+	MT8195_MDP_COMP_RSZ1,           /* 34 */
+	MT8195_MDP_COMP_RSZ2,           /* 35 */
+	MT8195_MDP_COMP_RSZ3,           /* 36 */
+	MT8195_MDP_COMP_TDSHP0,         /* 37 */
+	MT8195_MDP_COMP_TDSHP1,         /* 38 */
+	MT8195_MDP_COMP_TDSHP2,         /* 39 */
+	MT8195_MDP_COMP_TDSHP3,         /* 40 */
+	MT8195_MDP_COMP_COLOR0,         /* 41 */
+	MT8195_MDP_COMP_COLOR1,         /* 42 */
+	MT8195_MDP_COMP_COLOR2,         /* 43 */
+	MT8195_MDP_COMP_COLOR3,         /* 44 */
+	MT8195_MDP_COMP_OVL0,           /* 45 */
+	MT8195_MDP_COMP_OVL1,           /* 46 */
+	MT8195_MDP_COMP_PAD0,           /* 47 */
+	MT8195_MDP_COMP_PAD1,           /* 48 */
+	MT8195_MDP_COMP_PAD2,           /* 49 */
+	MT8195_MDP_COMP_PAD3,           /* 50 */
+	MT8195_MDP_COMP_TCC0,           /* 51 */
+	MT8195_MDP_COMP_TCC1,           /* 52 */
+	MT8195_MDP_COMP_WROT0,          /* 53 */
+	MT8195_MDP_COMP_WROT1,          /* 54 */
+	MT8195_MDP_COMP_WROT2,          /* 55 */
+	MT8195_MDP_COMP_WROT3,          /* 56 */
+	MT8195_MDP_COMP_MERGE2,         /* 57 */
+	MT8195_MDP_COMP_MERGE3,         /* 58 */
+
+	MT8195_MDP_COMP_VDO0DL0,        /* 59 */
+	MT8195_MDP_COMP_VDO1DL0,        /* 60 */
+	MT8195_MDP_COMP_VDO0DL1,        /* 61 */
+	MT8195_MDP_COMP_VDO1DL1,        /* 62 */
+};
+
+static const struct mdp_comp_data mt8195_mdp_comp_data[MDP_MAX_COMP_COUNT] = {
+	[MDP_COMP_WPEI] = {
+		{MDP_COMP_TYPE_WPEI, 0, MT8195_MDP_COMP_WPEI},
+		{0, 0, 0},
+		{0, BIT(13), 0}
+	},
+	[MDP_COMP_WPEO] = {
+		{MDP_COMP_TYPE_EXTO, 2, MT8195_MDP_COMP_WPEO},
+		{0, 0, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_WPEI2] = {
+		{MDP_COMP_TYPE_WPEI, 1, MT8195_MDP_COMP_WPEI2},
+		{0, 0, 0},
+		{0, BIT(14), 0}
+	},
+	[MDP_COMP_WPEO2] = {
+		{MDP_COMP_TYPE_EXTO, 3, MT8195_MDP_COMP_WPEO2},
+		{0, 0, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_CAMIN] = {
+		{MDP_COMP_TYPE_DL_PATH1, 0, MT8195_MDP_COMP_CAMIN},
+		{3, 3, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_CAMIN2] = {
+		{MDP_COMP_TYPE_DL_PATH2, 1, MT8195_MDP_COMP_CAMIN2},
+		{3, 6, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_SPLIT] = {
+		{MDP_COMP_TYPE_SPLIT, 0, MT8195_MDP_COMP_SPLIT},
+		{7, 0, 0},
+		{1, BIT(2), 0}
+	},
+	[MDP_COMP_SPLIT2] = {
+		{MDP_COMP_TYPE_SPLIT, 1, MT8195_MDP_COMP_SPLIT2},
+		{7, 0, 0},
+		{1, BIT(2), 0}
+	},
+	[MDP_COMP_RDMA0] = {
+		{MDP_COMP_TYPE_RDMA, 0, MT8195_MDP_COMP_RDMA0},
+		{3, 0, 0},
+		{0, BIT(0), 0}
+	},
+	[MDP_COMP_RDMA1] = {
+		{MDP_COMP_TYPE_RDMA, 1, MT8195_MDP_COMP_RDMA1},
+		{3, 0, 0},
+		{1, BIT(4), 0}
+	},
+	[MDP_COMP_RDMA2] = {
+		{MDP_COMP_TYPE_RDMA, 2, MT8195_MDP_COMP_RDMA2},
+		{3, 0, 0},
+		{1, BIT(5), 0}
+	},
+	[MDP_COMP_RDMA3] = {
+		{MDP_COMP_TYPE_RDMA, 3, MT8195_MDP_COMP_RDMA3},
+		{3, 0, 0},
+		{1, BIT(6), 0}
+	},
+	[MDP_COMP_STITCH] = {
+		{MDP_COMP_TYPE_STITCH, 0, MT8195_MDP_COMP_STITCH},
+		{1, 0, 0},
+		{0, BIT(2), 0}
+	},
+	[MDP_COMP_FG0] = {
+		{MDP_COMP_TYPE_FG, 0, MT8195_MDP_COMP_FG0},
+		{1, 0, 0},
+		{0, BIT(1), 0}
+	},
+	[MDP_COMP_FG1] = {
+		{MDP_COMP_TYPE_FG, 1, MT8195_MDP_COMP_FG1},
+		{1, 0, 0},
+		{1, BIT(7), 0}
+	},
+	[MDP_COMP_FG2] = {
+		{MDP_COMP_TYPE_FG, 2, MT8195_MDP_COMP_FG2},
+		{1, 0, 0},
+		{1, BIT(8), 0}
+	},
+	[MDP_COMP_FG3] = {
+		{MDP_COMP_TYPE_FG, 3, MT8195_MDP_COMP_FG3},
+		{1, 0, 0},
+		{1, BIT(9), 0}
+	},
+	[MDP_COMP_HDR0] = {
+		{MDP_COMP_TYPE_HDR, 0, MT8195_MDP_COMP_HDR0},
+		{1, 0, 0},
+		{0, BIT(3), 0}
+	},
+	[MDP_COMP_HDR1] = {
+		{MDP_COMP_TYPE_HDR, 1, MT8195_MDP_COMP_HDR1},
+		{1, 0, 0},
+		{1, BIT(10), 0}
+	},
+	[MDP_COMP_HDR2] = {
+		{MDP_COMP_TYPE_HDR, 2, MT8195_MDP_COMP_HDR2},
+		{1, 0, 0},
+		{1, BIT(11), 0}
+	},
+	[MDP_COMP_HDR3] = {
+		{MDP_COMP_TYPE_HDR, 3, MT8195_MDP_COMP_HDR3},
+		{1, 0, 0},
+		{1, BIT(12), 0}
+	},
+	[MDP_COMP_AAL0] = {
+		{MDP_COMP_TYPE_AAL, 0, MT8195_MDP_COMP_AAL0},
+		{1, 0, 0},
+		{0, BIT(4), 0}
+	},
+	[MDP_COMP_AAL1] = {
+		{MDP_COMP_TYPE_AAL, 1, MT8195_MDP_COMP_AAL1},
+		{1, 0, 0},
+		{1, BIT(13), 0}
+	},
+	[MDP_COMP_AAL2] = {
+		{MDP_COMP_TYPE_AAL, 2, MT8195_MDP_COMP_AAL2},
+		{1, 0, 0},
+		{1, BIT(14), 0}
+	},
+	[MDP_COMP_AAL3] = {
+		{MDP_COMP_TYPE_AAL, 3, MT8195_MDP_COMP_AAL3},
+		{1, 0, 0},
+		{1, BIT(15), 0}
+	},
+	[MDP_COMP_RSZ0] = {
+		{MDP_COMP_TYPE_RSZ, 0, MT8195_MDP_COMP_RSZ0},
+		{1, 0, 0},
+		{0, BIT(5), 0}
+	},
+	[MDP_COMP_RSZ1] = {
+		{MDP_COMP_TYPE_RSZ, 1, MT8195_MDP_COMP_RSZ1},
+		{1, 0, 0},
+		{1, BIT(16), 0}
+	},
+	[MDP_COMP_RSZ2] = {
+		{MDP_COMP_TYPE_RSZ, 2, MT8195_MDP_COMP_RSZ2},
+		{2, 0, 0},
+		{1, BIT(17) | BIT(22), 0}
+	},
+	[MDP_COMP_RSZ3] = {
+		{MDP_COMP_TYPE_RSZ, 3, MT8195_MDP_COMP_RSZ3},
+		{2, 0, 0},
+		{1, BIT(18) | BIT(23), 0}
+	},
+	[MDP_COMP_TDSHP0] = {
+		{MDP_COMP_TYPE_TDSHP, 0, MT8195_MDP_COMP_TDSHP0},
+		{1, 0, 0},
+		{0, BIT(6), 0}
+	},
+	[MDP_COMP_TDSHP1] = {
+		{MDP_COMP_TYPE_TDSHP, 1, MT8195_MDP_COMP_TDSHP1},
+		{1, 0, 0},
+		{1, BIT(19), 0}
+	},
+	[MDP_COMP_TDSHP2] = {
+		{MDP_COMP_TYPE_TDSHP, 2, MT8195_MDP_COMP_TDSHP2},
+		{1, 0, 0},
+		{1, BIT(20), 0}
+	},
+	[MDP_COMP_TDSHP3] = {
+		{MDP_COMP_TYPE_TDSHP, 3, MT8195_MDP_COMP_TDSHP3},
+		{1, 0, 0},
+		{1, BIT(21), 0}
+	},
+	[MDP_COMP_COLOR0] = {
+		{MDP_COMP_TYPE_COLOR, 0, MT8195_MDP_COMP_COLOR0},
+		{1, 0, 0},
+		{0, BIT(7), 0}
+	},
+	[MDP_COMP_COLOR1] = {
+		{MDP_COMP_TYPE_COLOR, 1, MT8195_MDP_COMP_COLOR1},
+		{1, 0, 0},
+		{1, BIT(24), 0}
+	},
+	[MDP_COMP_COLOR2] = {
+		{MDP_COMP_TYPE_COLOR, 2, MT8195_MDP_COMP_COLOR2},
+		{1, 0, 0},
+		{1, BIT(25), 0}
+	},
+	[MDP_COMP_COLOR3] = {
+		{MDP_COMP_TYPE_COLOR, 3, MT8195_MDP_COMP_COLOR3},
+		{1, 0, 0},
+		{1, BIT(26), 0}
+	},
+	[MDP_COMP_OVL0] = {
+		{MDP_COMP_TYPE_OVL, 0, MT8195_MDP_COMP_OVL0},
+		{1, 0, 0},
+		{0, BIT(8), 0}
+	},
+	[MDP_COMP_OVL1] = {
+		{MDP_COMP_TYPE_OVL, 1, MT8195_MDP_COMP_OVL1},
+		{1, 0, 0},
+		{1, BIT(27), 0}
+	},
+	[MDP_COMP_PAD0] = {
+		{MDP_COMP_TYPE_PAD, 0, MT8195_MDP_COMP_PAD0},
+		{1, 0, 0},
+		{0, BIT(9), 0}
+	},
+	[MDP_COMP_PAD1] = {
+		{MDP_COMP_TYPE_PAD, 1, MT8195_MDP_COMP_PAD1},
+		{1, 0, 0},
+		{1, BIT(28), 0}
+	},
+	[MDP_COMP_PAD2] = {
+		{MDP_COMP_TYPE_PAD, 2, MT8195_MDP_COMP_PAD2},
+		{1, 0, 0},
+		{1, BIT(29), 0}
+	},
+	[MDP_COMP_PAD3] = {
+		{MDP_COMP_TYPE_PAD, 3, MT8195_MDP_COMP_PAD3},
+		{1, 0, 0},
+		{1, BIT(30), 0}
+	},
+	[MDP_COMP_TCC0] = {
+		{MDP_COMP_TYPE_TCC, 0, MT8195_MDP_COMP_TCC0},
+		{1, 0, 0},
+		{0, BIT(10), 0}
+	},
+	[MDP_COMP_TCC1] = {
+		{MDP_COMP_TYPE_TCC, 1, MT8195_MDP_COMP_TCC1},
+		{1, 0, 0},
+		{1, BIT(3), 0}
+	},
+	[MDP_COMP_WROT0] = {
+		{MDP_COMP_TYPE_WROT, 0, MT8195_MDP_COMP_WROT0},
+		{1, 0, 0},
+		{0, BIT(11), 0}
+	},
+	[MDP_COMP_WROT1] = {
+		{MDP_COMP_TYPE_WROT, 1, MT8195_MDP_COMP_WROT1},
+		{1, 0, 0},
+		{1, BIT(31), 0}
+	},
+	[MDP_COMP_WROT2] = {
+		{MDP_COMP_TYPE_WROT, 2, MT8195_MDP_COMP_WROT2},
+		{1, 0, 0},
+		{1, 0, BIT(0)}
+	},
+	[MDP_COMP_WROT3] = {
+		{MDP_COMP_TYPE_WROT, 3, MT8195_MDP_COMP_WROT3},
+		{1, 0, 0},
+		{1, 0, BIT(1)}
+	},
+	[MDP_COMP_MERGE2] = {
+		{MDP_COMP_TYPE_MERGE, 2, MT8195_MDP_COMP_MERGE2},
+		{1, 0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_MERGE3] = {
+		{MDP_COMP_TYPE_MERGE, 3, MT8195_MDP_COMP_MERGE2},
+		{1, 0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_PQ0_SOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 0, MT8195_MDP_COMP_PQ0_SOUT},
+		{0, 0, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_PQ1_SOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 1, MT8195_MDP_COMP_PQ1_SOUT},
+		{0, 0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TO_WARP0MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 2, MT8195_MDP_COMP_TO_WARP0MOUT},
+		{0, 0, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_TO_WARP1MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 3, MT8195_MDP_COMP_TO_WARP1MOUT},
+		{0, 0, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_TO_SVPP2MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 4, MT8195_MDP_COMP_TO_SVPP2MOUT},
+		{0, 0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TO_SVPP3MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 5, MT8195_MDP_COMP_TO_SVPP3MOUT},
+		{0, 0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_VPP0_SOUT] = {
+		{MDP_COMP_TYPE_PATH1, 0, MT8195_MDP_COMP_VPP0_SOUT},
+		{4, 9, 0},
+		{0, BIT(15), BIT(2)}
+	},
+	[MDP_COMP_VPP1_SOUT] = {
+		{MDP_COMP_TYPE_PATH2, 1, MT8195_MDP_COMP_VPP1_SOUT},
+		{2, 13, 0},
+		{1, BIT(16), BIT(3)}
+	},
+	[MDP_COMP_VDO0DL0] = {
+		{MDP_COMP_TYPE_DL_PATH3, 0, MT8195_MDP_COMP_VDO0DL0},
+		{1, 15, 0},
+		{1, 0, BIT(4)}
+	},
+	[MDP_COMP_VDO1DL0] = {
+		{MDP_COMP_TYPE_DL_PATH4, 0, MT8195_MDP_COMP_VDO1DL0},
+		{1, 17, 0},
+		{1, 0, BIT(6)}
+	},
+	[MDP_COMP_VDO0DL1] = {
+		{MDP_COMP_TYPE_DL_PATH5, 0, MT8195_MDP_COMP_VDO0DL1},
+		{1, 18, 0},
+		{1, 0, BIT(5)}
+	},
+	[MDP_COMP_VDO1DL1] = {
+		{MDP_COMP_TYPE_DL_PATH6, 0, MT8195_MDP_COMP_VDO1DL1},
+		{1, 16, 0},
+		{1, 0, BIT(7)}
+	},
+};
+
+static const enum mdp_comp_event mt8195_mdp_event[] = {
+	RDMA0_SOF,
+	WROT0_SOF,
+	RDMA0_DONE,
+	WROT0_DONE,
+	RDMA1_SOF,
+	RDMA2_SOF,
+	RDMA3_SOF,
+	WROT1_SOF,
+	WROT2_SOF,
+	WROT3_SOF,
+	RDMA1_DONE,
+	RDMA2_DONE,
+	RDMA3_DONE,
+	WROT1_DONE,
+	WROT2_DONE,
+	WROT3_DONE
+};
+
+static const struct mdp_pipe_info mt8195_pipe_info[] = {
+	{MDP_PIPE_WPEI, 0, 0},
+	{MDP_PIPE_WPEI2, 0, 1},
+	{MDP_PIPE_RDMA0, 0, 2},
+	{MDP_PIPE_VPP1_SOUT, 0, 3},
+	{MDP_PIPE_SPLIT, 1, 2, 0x387},
+	{MDP_PIPE_SPLIT2, 1, 3, 0x387},
+	{MDP_PIPE_RDMA1, 1, 1},
+	{MDP_PIPE_RDMA2, 1, 2},
+	{MDP_PIPE_RDMA3, 1, 3},
+	{MDP_PIPE_VPP0_SOUT, 1, 4},
+};
+
+static const struct mdp_format mt8195_formats[] = {
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
+		.mdp_color	= MDP_COLOR_NV12_HYFBC,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 1,
+		.walign		= 4,
+		.halign		= 4,
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
+static const u32 mt8195_mdp_mmsys_config_table[] = {
+	[CONFIG_VPP0_HW_DCM_1ST_DIS0]    = 0,
+	[CONFIG_VPP0_DL_IRELAY_WR]       = 1,
+	[CONFIG_VPP1_HW_DCM_1ST_DIS0]    = 2,
+	[CONFIG_VPP1_HW_DCM_1ST_DIS1]    = 3,
+	[CONFIG_VPP1_HW_DCM_2ND_DIS0]    = 4,
+	[CONFIG_VPP1_HW_DCM_2ND_DIS1]    = 5,
+	[CONFIG_SVPP2_BUF_BF_RSZ_SWITCH] = 6,
+	[CONFIG_SVPP3_BUF_BF_RSZ_SWITCH] = 7,
+};
+
+#endif  // __MT8195_MDP_H__
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 9073ddc19775..fdf072e48238 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -919,6 +919,126 @@ static const struct of_device_id mdp_comp_dt_ids[] = {
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-wdma",
 		.data = (void *)MDP_COMP_WDMA,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-rdma1",
+		.data = (void *)MDP_COMP_RDMA1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-rdma2",
+		.data = (void *)MDP_COMP_RDMA2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-rdma3",
+		.data = (void *)MDP_COMP_RDMA3,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-wrot1",
+		.data = (void *)MDP_COMP_WROT1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-wrot2",
+		.data = (void *)MDP_COMP_WROT2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-wrot3",
+		.data = (void *)MDP_COMP_WROT3,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-split",
+		.data = (void *)MDP_COMP_SPLIT,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-stitch",
+		.data = (void *)MDP_COMP_STITCH,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-fg0",
+		.data = (void *)MDP_COMP_FG0,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-fg1",
+		.data = (void *)MDP_COMP_FG1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-fg2",
+		.data = (void *)MDP_COMP_FG2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-fg3",
+		.data = (void *)MDP_COMP_FG3,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-hdr0",
+		.data = (void *)MDP_COMP_HDR0,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-hdr1",
+		.data = (void *)MDP_COMP_HDR1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-hdr2",
+		.data = (void *)MDP_COMP_HDR2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-hdr3",
+		.data = (void *)MDP_COMP_HDR3,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-aal0",
+		.data = (void *)MDP_COMP_AAL0,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-aal1",
+		.data = (void *)MDP_COMP_AAL1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-aal2",
+		.data = (void *)MDP_COMP_AAL2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-aal3",
+		.data = (void *)MDP_COMP_AAL3,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-rsz2",
+		.data = (void *)MDP_COMP_RSZ2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-rsz3",
+		.data = (void *)MDP_COMP_RSZ3,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-merge2",
+		.data = (void *)MDP_COMP_MERGE2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-merge3",
+		.data = (void *)MDP_COMP_MERGE3,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tdshp0",
+		.data = (void *)MDP_COMP_TDSHP0,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tdshp1",
+		.data = (void *)MDP_COMP_TDSHP1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tdshp2",
+		.data = (void *)MDP_COMP_TDSHP2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tdshp3",
+		.data = (void *)MDP_COMP_TDSHP3,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-color0",
+		.data = (void *)MDP_COMP_COLOR0,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-color1",
+		.data = (void *)MDP_COMP_COLOR1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-color2",
+		.data = (void *)MDP_COMP_COLOR2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-color3",
+		.data = (void *)MDP_COMP_COLOR3,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-ovl0",
+		.data = (void *)MDP_COMP_OVL0,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-ovl1",
+		.data = (void *)MDP_COMP_OVL1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-pad0",
+		.data = (void *)MDP_COMP_PAD0,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-pad1",
+		.data = (void *)MDP_COMP_PAD1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-pad2",
+		.data = (void *)MDP_COMP_PAD2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-pad3",
+		.data = (void *)MDP_COMP_PAD3,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tcc0",
+		.data = (void *)MDP_COMP_TCC0,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tcc1",
+		.data = (void *)MDP_COMP_TCC1,
 	},
 	{}
 };
@@ -936,12 +1056,36 @@ static const struct of_device_id mdp_sub_comp_dt_ids[] = {
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-exto",
 		.data = (void *)MDP_COMP_ISP_IMGO,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-path1",
+		.data = (void *)MDP_COMP_VPP0_SOUT,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-path2",
+		.data = (void *)MDP_COMP_VPP1_SOUT,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-path3",
+		.data = (void *)MDP_COMP_VDO0DL0,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-path4",
+		.data = (void *)MDP_COMP_VDO1DL0,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-path5",
+		.data = (void *)MDP_COMP_VDO0DL1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-path6",
+		.data = (void *)MDP_COMP_VDO1DL1,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-dl1",
 		.data = (void *)MDP_COMP_CAMIN,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-dl2",
 		.data = (void *)MDP_COMP_CAMIN2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-dl1",
+		.data = (void *)MDP_COMP_CAMIN,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-dl2",
+		.data = (void *)MDP_COMP_CAMIN2,
 	},
 	{}
 };
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
index 57f5ca3052ba..05a60771d4bc 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
@@ -93,12 +93,12 @@ enum mdp_comp_event {
 	WROT1_SOF,
 	WROT2_SOF,
 	WROT3_SOF,
-	RDMA1_FRAME_DONE,
-	RDMA2_FRAME_DONE,
-	RDMA3_FRAME_DONE,
-	WROT1_FRAME_DONE,
-	WROT2_FRAME_DONE,
-	WROT3_FRAME_DONE,
+	RDMA1_DONE,
+	RDMA2_DONE,
+	RDMA3_DONE,
+	WROT1_DONE,
+	WROT2_DONE,
+	WROT3_DONE,
 
 	ISP_P2_0_DONE,
 	ISP_P2_1_DONE,
@@ -159,6 +159,16 @@ struct mdp_comp_data {
 	struct mdp_mutex_info mutex;
 };
 
+struct hyfbc_init_info {
+	bool is10b;
+	u32 width_in_mb;
+	u32 height_in_mb;
+	u32 w_stride_in_mb;
+	u32 h_stride_in_mb;
+	u32 byte_per_mb;
+	u32 pa_base;
+};
+
 struct mdp_comp_ops;
 
 struct mdp_comp {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index a646e99e410f..bef8da6fff1c 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -15,6 +15,7 @@
 #include "mtk-mdp3-core.h"
 #include "mtk-mdp3-m2m.h"
 #include "mt8183_mdp.h"
+#include "mt8195_mdp.h"
 
 static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_cfg = &mt8183_plat_cfg,
@@ -27,6 +28,18 @@ static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.format_len = ARRAY_SIZE(mt8183_formats),
 };
 
+static const struct mtk_mdp_driver_data mt8195_mdp_driver_data = {
+	.mdp_cfg = &mt8195_plat_cfg,
+	.event = mt8195_mdp_event,
+	.event_len = ARRAY_SIZE(mt8195_mdp_event),
+	.comp_data = mt8195_mdp_comp_data,
+	.pipe_info = mt8195_pipe_info,
+	.pipe_info_len = ARRAY_SIZE(mt8195_pipe_info),
+	.format = mt8195_formats,
+	.format_len = ARRAY_SIZE(mt8195_formats),
+	.config_table = mt8195_mdp_mmsys_config_table,
+};
+
 static const struct of_device_id mdp_of_ids[] = {
 	{ .compatible = "mediatek,mt8183-mdp3",
 	  .data = &mt8183_mdp_driver_data,
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index 119af7666b59..c668e317f947 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -28,8 +28,19 @@ struct mdp_platform_config {
 	bool	rdma_support_10bit;
 	bool	rdma_rsz1_sram_sharing;
 	bool	rdma_upsample_repeat_only;
+	bool	rdma_support_extend_ufo;
+	bool	rdma_support_hyfbc;
+	bool	rdma_support_afbc;
+	bool	rdma_esl_setting;
 	bool	rsz_disable_dcm_small_sample;
+	bool	rsz_etc_control;
+	bool	tdshp_1_1;
 	bool	wrot_filter_constraint;
+	bool	wrot_support_afbc;
+	bool	wrot_support_10bit;
+	bool	mdp_version_6885;
+	bool	mdp_version_8195;
+	u8	tdshp_dyn_contrast_version;
 	u32	gce_event_offset;
 	bool	support_multi_larb;
 };
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
index 0fdc1b228227..4a25f86bfaa5 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
@@ -51,6 +51,73 @@
 enum mdp_color {
 	MDP_COLOR_UNKNOWN	= 0,
 
+	//MDP_COLOR_FULLG8,
+	MDP_COLOR_FULLG8_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 2,  0, 21),
+	MDP_COLOR_FULLG8_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1,  8, 2,  0, 21),
+	MDP_COLOR_FULLG8_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0,  8, 2,  0, 21),
+	MDP_COLOR_FULLG8_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1,  8, 2,  0, 21),
+	MDP_COLOR_FULLG8	= MDP_COLOR_FULLG8_BGGR,
+
+	//MDP_COLOR_FULLG10,
+	MDP_COLOR_FULLG10_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 21),
+	MDP_COLOR_FULLG10_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 10, 2,  0, 21),
+	MDP_COLOR_FULLG10_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 10, 2,  0, 21),
+	MDP_COLOR_FULLG10_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 10, 2,  0, 21),
+	MDP_COLOR_FULLG10	= MDP_COLOR_FULLG10_BGGR,
+
+	//MDP_COLOR_FULLG12,
+	MDP_COLOR_FULLG12_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 12, 2,  0, 21),
+	MDP_COLOR_FULLG12_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 12, 2,  0, 21),
+	MDP_COLOR_FULLG12_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 12, 2,  0, 21),
+	MDP_COLOR_FULLG12_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 12, 2,  0, 21),
+	MDP_COLOR_FULLG12	= MDP_COLOR_FULLG12_BGGR,
+
+	//MDP_COLOR_FULLG14,
+	MDP_COLOR_FULLG14_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 14, 2,  0, 21),
+	MDP_COLOR_FULLG14_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 14, 2,  0, 21),
+	MDP_COLOR_FULLG14_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 14, 2,  0, 21),
+	MDP_COLOR_FULLG14_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 14, 2,  0, 21),
+	MDP_COLOR_FULLG14	= MDP_COLOR_FULLG14_BGGR,
+
+	MDP_COLOR_UFO10		= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 24),
+
+	//MDP_COLOR_BAYER8,
+	MDP_COLOR_BAYER8_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 2,  0, 20),
+	MDP_COLOR_BAYER8_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1,  8, 2,  0, 20),
+	MDP_COLOR_BAYER8_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0,  8, 2,  0, 20),
+	MDP_COLOR_BAYER8_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1,  8, 2,  0, 20),
+	MDP_COLOR_BAYER8	= MDP_COLOR_BAYER8_BGGR,
+
+	//MDP_COLOR_BAYER10,
+	MDP_COLOR_BAYER10_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 20),
+	MDP_COLOR_BAYER10_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 10, 2,  0, 20),
+	MDP_COLOR_BAYER10_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 10, 2,  0, 20),
+	MDP_COLOR_BAYER10_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 10, 2,  0, 20),
+	MDP_COLOR_BAYER10	= MDP_COLOR_BAYER10_BGGR,
+
+	//MDP_COLOR_BAYER12,
+	MDP_COLOR_BAYER12_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 12, 2,  0, 20),
+	MDP_COLOR_BAYER12_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 12, 2,  0, 20),
+	MDP_COLOR_BAYER12_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 12, 2,  0, 20),
+	MDP_COLOR_BAYER12_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 12, 2,  0, 20),
+	MDP_COLOR_BAYER12	= MDP_COLOR_BAYER12_BGGR,
+
+	//MDP_COLOR_BAYER14,
+	MDP_COLOR_BAYER14_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 14, 2,  0, 20),
+	MDP_COLOR_BAYER14_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 14, 2,  0, 20),
+	MDP_COLOR_BAYER14_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 14, 2,  0, 20),
+	MDP_COLOR_BAYER14_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 14, 2,  0, 20),
+	MDP_COLOR_BAYER14	= MDP_COLOR_BAYER14_BGGR,
+
+	MDP_COLOR_RGB48		= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 48, 0,  0, 23),
+	/* For bayer+mono raw-16 */
+	MDP_COLOR_RGB565_RAW	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 16, 2,  0, 0),
+
+	MDP_COLOR_BAYER8_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 2,  0, 22),
+	MDP_COLOR_BAYER10_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 22),
+	MDP_COLOR_BAYER12_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 12, 2,  0, 22),
+	MDP_COLOR_BAYER14_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 14, 2,  0, 22),
+
 	// Unified format
 	MDP_COLOR_GREY           = MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 1,  0, 7),
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
