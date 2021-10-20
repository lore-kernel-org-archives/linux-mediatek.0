Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89876C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:27:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F29660F02
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F29660F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84vVxBETtW7ToykRYAznIgzwPViiA9yQR0Ioe51DfOw=; b=ItKFe2BqzPlmHB
	eB0sDbY8ewUiuBUyFN5V74xMtDyWFIGtuZiNbE8rYzW6DU+m3LZcwHCk42AgPjy6E9YZw9AikIQ/+
	xLv3rA19nK1RGoZgmsFnhRa+v3yiV19FQoC9fRdlNmGEuEEj+FolTByXdJju0Rn/2STM1h+Zw1nkJ
	2q/7dO2F9Lma1sweEHamd5Ue+uOXHLePxfasGIzheHYzxGcXWj4Ga+3CuJ3mZ9Hz7CFsH+xSWw34w
	WYmY1EdCD4RDqZcDPdP83BuDurSRLlws0wHxsf+vrxuLtl2QN5a1QkTNj/8ik2/hQvlwHN3kBqxn8
	lCvEsudnTF81nh2oh6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md60I-003dDa-24; Wed, 20 Oct 2021 07:27:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md5yf-003ceq-Ir; Wed, 20 Oct 2021 07:25:35 +0000
X-UUID: 04ac2b30dec640559ebfa179466e1a87-20211020
X-UUID: 04ac2b30dec640559ebfa179466e1a87-20211020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1406641701; Wed, 20 Oct 2021 00:25:30 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 00:15:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Oct 2021 15:15:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Oct 2021 15:15:26 +0800
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
Subject: [PATCH v2 1/9] soc: mediatek: mmsys: expand MDP enum for chip
 independence architecture
Date: Wed, 20 Oct 2021 15:14:40 +0800
Message-ID: <20211020071448.14187-2-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
References: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_002533_650248_5607C2A2 
X-CRM114-Status: GOOD (  12.59  )
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

Expand mdp related enum for chip independence architecture

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c       |  2 -
 include/linux/soc/mediatek/mtk-mmsys.h | 89 ++++++++++++++++++++------
 2 files changed, 70 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index b16e6a2628c5..cbae8063a187 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -128,7 +128,6 @@ void mtk_mmsys_mdp_connect(struct device *dev, struct mmsys_cmdq_cmd *cmd,
 	int i;
 
 	WARN_ON(!routes);
-	WARN_ON(mmsys->subsys_id == 0);
 	for (i = 0; i < mmsys->data->mdp_num_routes; i++)
 		if (cur == routes[i].from_comp && next == routes[i].to_comp)
 			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id,
@@ -145,7 +144,6 @@ void mtk_mmsys_mdp_disconnect(struct device *dev, struct mmsys_cmdq_cmd *cmd,
 	const struct mtk_mmsys_routes *routes = mmsys->data->mdp_routes;
 	int i;
 
-	WARN_ON(mmsys->subsys_id == 0);
 	for (i = 0; i < mmsys->data->mdp_num_routes; i++)
 		if (cur == routes[i].from_comp && next == routes[i].to_comp)
 			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 113d33e2155f..acf4bd3deac1 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -76,33 +76,84 @@ enum mtk_mdp_comp_id {
 	/* MDP */
 	MDP_COMP_CAMIN,		/* 9 */
 	MDP_COMP_CAMIN2,	/* 10 */
-	MDP_COMP_RDMA0,		/* 11 */
-	MDP_COMP_AAL0,		/* 12 */
-	MDP_COMP_CCORR0,	/* 13 */
-	MDP_COMP_RSZ0,		/* 14 */
-	MDP_COMP_RSZ1,		/* 15 */
-	MDP_COMP_TDSHP0,	/* 16 */
-	MDP_COMP_COLOR0,	/* 17 */
-	MDP_COMP_PATH0_SOUT,	/* 18 */
-	MDP_COMP_PATH1_SOUT,	/* 19 */
-	MDP_COMP_WROT0,		/* 20 */
-	MDP_COMP_WDMA,		/* 21 */
-
-	/* Dummy Engine */
-	MDP_COMP_RDMA1,		/* 22 */
-	MDP_COMP_RSZ2,		/* 23 */
-	MDP_COMP_TDSHP1,	/* 24 */
-	MDP_COMP_WROT1,		/* 25 */
+	MDP_COMP_SPLIT,           /* 11 */
+	MDP_COMP_SPLIT2,          /* 12 */
+	MDP_COMP_RDMA0,           /* 13 */
+	MDP_COMP_RDMA1,           /* 14 */
+	MDP_COMP_RDMA2,           /* 15 */
+	MDP_COMP_RDMA3,           /* 16 */
+	MDP_COMP_STITCH,          /* 17 */
+	MDP_COMP_FG0,             /* 18 */
+	MDP_COMP_FG1,             /* 19 */
+	MDP_COMP_FG2,             /* 20 */
+	MDP_COMP_FG3,             /* 21 */
+	MDP_COMP_TO_SVPP2MOUT,    /* 22 */
+	MDP_COMP_TO_SVPP3MOUT,    /* 23 */
+	MDP_COMP_TO_WARP0MOUT,    /* 24 */
+	MDP_COMP_TO_WARP1MOUT,    /* 25 */
+	MDP_COMP_VPP0_SOUT,       /* 26 */
+	MDP_COMP_VPP1_SOUT,       /* 27 */
+	MDP_COMP_PQ0_SOUT,        /* 28 */
+	MDP_COMP_PQ1_SOUT,        /* 29 */
+	MDP_COMP_HDR0,            /* 30 */
+	MDP_COMP_HDR1,            /* 31 */
+	MDP_COMP_HDR2,            /* 32 */
+	MDP_COMP_HDR3,            /* 33 */
+	MDP_COMP_AAL0,            /* 34 */
+	MDP_COMP_AAL1,            /* 35 */
+	MDP_COMP_AAL2,            /* 36 */
+	MDP_COMP_AAL3,            /* 37 */
+	MDP_COMP_CCORR0,          /* 38 */
+	MDP_COMP_RSZ0,            /* 39 */
+	MDP_COMP_RSZ1,            /* 40 */
+	MDP_COMP_RSZ2,            /* 41 */
+	MDP_COMP_RSZ3,            /* 42 */
+	MDP_COMP_TDSHP0,          /* 43 */
+	MDP_COMP_TDSHP1,          /* 44 */
+	MDP_COMP_TDSHP2,          /* 45 */
+	MDP_COMP_TDSHP3,          /* 46 */
+	MDP_COMP_COLOR0,          /* 47 */
+	MDP_COMP_COLOR1,          /* 48 */
+	MDP_COMP_COLOR2,          /* 49 */
+	MDP_COMP_COLOR3,          /* 50 */
+	MDP_COMP_OVL0,            /* 51 */
+	MDP_COMP_OVL1,            /* 52 */
+	MDP_COMP_PAD0,            /* 53 */
+	MDP_COMP_PAD1,            /* 54 */
+	MDP_COMP_PAD2,            /* 55 */
+	MDP_COMP_PAD3,            /* 56 */
+	MDP_COMP_TCC0,            /* 56 */
+	MDP_COMP_TCC1,            /* 57 */
+	MDP_COMP_WROT0,           /* 58 */
+	MDP_COMP_WROT1,           /* 59 */
+	MDP_COMP_WROT2,           /* 60 */
+	MDP_COMP_WROT3,           /* 61 */
+	MDP_COMP_WDMA,            /* 62 */
+	MDP_COMP_MERGE2,          /* 63 */
+	MDP_COMP_MERGE3,          /* 64 */
+	MDP_COMP_PATH0_SOUT,      /* 65 */
+	MDP_COMP_PATH1_SOUT,      /* 66 */
+	MDP_COMP_VDO0DL0,         /* 67 */
+	MDP_COMP_VDO1DL0,         /* 68 */
+	MDP_COMP_VDO0DL1,         /* 69 */
+	MDP_COMP_VDO1DL1,         /* 70 */
 
 	MDP_MAX_COMP_COUNT	/* ALWAYS keep at the end */
 };
 
 enum mtk_mdp_pipe_id {
+	MDP_PIPE_IMGI = 0,
 	MDP_PIPE_RDMA0,
-	MDP_PIPE_IMGI,
 	MDP_PIPE_WPEI,
 	MDP_PIPE_WPEI2,
-	MDP_PIPE_MAX
+	MDP_PIPE_RDMA1,
+	MDP_PIPE_RDMA2,
+	MDP_PIPE_RDMA3,
+	MDP_PIPE_SPLIT,
+	MDP_PIPE_SPLIT2,
+	MDP_PIPE_VPP0_SOUT,
+	MDP_PIPE_VPP1_SOUT,
+	MDP_PIPE_MAX,
 };
 
 enum mtk_isp_ctrl {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
