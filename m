Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F21BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 05:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCq7N4makzmzSwk2WHB8xd2+KWNqkGpFVkPxsyjD4Zk=; b=XBsWAmVb4vRlCR
	Qm85ziihn6hJHm0afutu6OpCYZt5AzhH0xEif6GIA5e4bwZZfARRGpoAjKYSjEsuoOCXftQHBmys2
	n0ywQ9pkxDW9dzxU2vfkxkfXHQuV65OyJrp4/43qTk94Va8WNSz4TVfy5VAcJOfxivCZRnGOOBF4E
	5ONMAFyaM9Mv0RlOJ5okVIBnlpWxbz0GuKN67AOUTLmcaRC8YGUqZEfD5R7oP0kJPK2LNSKHITA8y
	M0sddo03Qh9IHsRT623rq/wsSD8f6AyO+robYGL5cPppLN9vmzCNR7Y9Cr0Pn4x5QkySxjBqT2xzG
	C1g+kyvsMylAtP1te2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Ky3-00DW5b-UF; Mon, 17 Jan 2022 05:54:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9KxB-00DVkl-FN; Mon, 17 Jan 2022 05:53:20 +0000
X-UUID: 674d703db2f2447785c4fb6bbba5d445-20220116
X-UUID: 674d703db2f2447785c4fb6bbba5d445-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1021617329; Sun, 16 Jan 2022 22:53:10 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 Jan 2022 13:53:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 13:53:07 +0800
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
Subject: [PATCH v1 01/14] soc: mediatek: mmsys: expand MDP enum for chip
 independence architecture
Date: Mon, 17 Jan 2022 13:52:41 +0800
Message-ID: <20220117055254.9777-2-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_215317_549188_17AE3438 
X-CRM114-Status: GOOD (  10.05  )
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
This patch is base on [1]
[1] soc: mediatek: mmsys: add support for ISP control
- https://patchwork.kernel.org/project/linux-mediatek/patch/20220104091712.25670-3-moudy.ho@mediatek.com/
---
 include/linux/soc/mediatek/mtk-mmsys.h | 88 ++++++++++++++++++++------
 1 file changed, 70 insertions(+), 18 deletions(-)

diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index c0ba22ad7229..a772e53af9b5 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -79,33 +79,85 @@ enum mtk_mdp_comp_id {
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
+	MDP_COMP_TCC0,            /* 57 */
+	MDP_COMP_TCC1,            /* 58 */
+	MDP_COMP_WROT0,           /* 59 */
+	MDP_COMP_WROT1,           /* 60 */
+	MDP_COMP_WROT2,           /* 61 */
+	MDP_COMP_WROT3,           /* 62 */
+	MDP_COMP_WDMA,            /* 63 */
+	MDP_COMP_MERGE2,          /* 64 */
+	MDP_COMP_MERGE3,          /* 65 */
+	MDP_COMP_PATH0_SOUT,      /* 66 */
+	MDP_COMP_PATH1_SOUT,      /* 67 */
+	MDP_COMP_VDO0DL0,         /* 68 */
+	MDP_COMP_VDO1DL0,         /* 69 */
+	MDP_COMP_VDO0DL1,         /* 70 */
+	MDP_COMP_VDO1DL1,         /* 71 */
 
 	MDP_MAX_COMP_COUNT	/* ALWAYS keep at the end */
 };
 
 enum mtk_mdp_pipe_id {
+	MDP_PIPE_NONE = -1,
 	MDP_PIPE_RDMA0,
 	MDP_PIPE_IMGI,
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
