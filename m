Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7C0C7EE29
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 06:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJso0sx+Xzz10OPF6ptUW93d6KH24QL+w/RyyxxydPU=; b=msfouwVJMOo4f/Y0+lf1muEIwe
	YJSisdxeyfiwab5mduelQiiDim4JjYlghJzJIGYyggzj+YRtsr2LYBNIWbM8YGRrZlMAiwoTpRA+M
	K7nzqADJqQ9HdK+UfbyFl/j9w6HtmoL/BRMCv7YTO+5+DrwPQhZqiswZiDPa6kbrLtRvXKJuykGxo
	9gW+RRlLuM+cq5GP8eM63pj7pzT1uSJ0wVivwJzBYchIUCakrID0aL0z8elsVNXqJX1LgQBikREeM
	dxlPT6OBatXqIbLDDWHObX9yNhgKNTapcchJqa5dO+B5tM6KCBbPCRUFVfz/UxGWwYjLT+Os2Xr0n
	mo4ZaCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6mOy-004WOl-0i;
	Wed, 07 Jun 2023 06:12:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6mOu-004WLp-3C;
	Wed, 07 Jun 2023 06:12:10 +0000
X-UUID: 395691ae04fa11ee83ed1395ce914268-20230606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QJso0sx+Xzz10OPF6ptUW93d6KH24QL+w/RyyxxydPU=;
	b=lu/X7IfhFgkP6eWKX4zX397O9kCIOwGJvh0MWZU1pmwoqZT3esbbF2U76DXencDEWK0uxWzdzifxRJ90UOa6qwus6opFZmWwDRx6/TsZloZEl+0Xog41WUkeWrM8TAkVQg7IRKQAm/TcwbAvtrTWsBWI41qusetkV663RpPXpDQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:dffa5977-d41d-4d00-add5-93a5ef1d2a81,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:0ed3476e-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 395691ae04fa11ee83ed1395ce914268-20230606
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1444838253; Tue, 06 Jun 2023 23:12:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Jun 2023 14:11:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Jun 2023 14:11:31 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Singo Chang <singo.chang@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Hsiao
 Chein Sung <shawn.sung@mediatek.com>, Fei Shao <fshao@google.com>
Subject: [PATCH v1 5/6] soc: mediatek: mt8188: Support VDOSYS1 PADDING in mtk-mmsys
Date: Wed, 7 Jun 2023 14:11:20 +0800
Message-ID: <20230607061121.6732-6-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230607061121.6732-1-shawn.sung@mediatek.com>
References: <20230607061121.6732-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_231209_077326_08A36CEE 
X-CRM114-Status: GOOD (  11.81  )
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

- Add PADDING components
- Add MUTEX definitions for PADDING

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 16 ++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  8 ++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 11dda20eb462..39fe9650b7a2 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -142,6 +142,14 @@
 #define MT8188_MUTEX_MOD_DISP1_MDP_RDMA5	5
 #define MT8188_MUTEX_MOD_DISP1_MDP_RDMA6	6
 #define MT8188_MUTEX_MOD_DISP1_MDP_RDMA7	7
+#define MT8188_MUTEX_MOD_DISP1_PADDING0		8
+#define MT8188_MUTEX_MOD_DISP1_PADDING1		9
+#define MT8188_MUTEX_MOD_DISP1_PADDING2		10
+#define MT8188_MUTEX_MOD_DISP1_PADDING3		11
+#define MT8188_MUTEX_MOD_DISP1_PADDING4		12
+#define MT8188_MUTEX_MOD_DISP1_PADDING5		13
+#define MT8188_MUTEX_MOD_DISP1_PADDING6		14
+#define MT8188_MUTEX_MOD_DISP1_PADDING7		15
 #define MT8188_MUTEX_MOD_DISP1_VPP_MERGE0	20
 #define MT8188_MUTEX_MOD_DISP1_VPP_MERGE1	21
 #define MT8188_MUTEX_MOD_DISP1_VPP_MERGE2	22
@@ -472,6 +480,14 @@ static const unsigned int mt8188_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_MDP_RDMA5] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA5,
 	[DDP_COMPONENT_MDP_RDMA6] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA6,
 	[DDP_COMPONENT_MDP_RDMA7] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA7,
+	[DDP_COMPONENT_DISP_PADDING0] = MT8188_MUTEX_MOD_DISP1_PADDING0,
+	[DDP_COMPONENT_DISP_PADDING1] = MT8188_MUTEX_MOD_DISP1_PADDING1,
+	[DDP_COMPONENT_DISP_PADDING2] = MT8188_MUTEX_MOD_DISP1_PADDING2,
+	[DDP_COMPONENT_DISP_PADDING3] = MT8188_MUTEX_MOD_DISP1_PADDING3,
+	[DDP_COMPONENT_DISP_PADDING4] = MT8188_MUTEX_MOD_DISP1_PADDING4,
+	[DDP_COMPONENT_DISP_PADDING5] = MT8188_MUTEX_MOD_DISP1_PADDING5,
+	[DDP_COMPONENT_DISP_PADDING6] = MT8188_MUTEX_MOD_DISP1_PADDING6,
+	[DDP_COMPONENT_DISP_PADDING7] = MT8188_MUTEX_MOD_DISP1_PADDING7,
 	[DDP_COMPONENT_MERGE1] = MT8188_MUTEX_MOD_DISP1_VPP_MERGE0,
 	[DDP_COMPONENT_MERGE2] = MT8188_MUTEX_MOD_DISP1_VPP_MERGE1,
 	[DDP_COMPONENT_MERGE3] = MT8188_MUTEX_MOD_DISP1_VPP_MERGE2,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 37544ea6286d..63a599d6dd90 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -50,6 +50,14 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_MDP_RDMA5,
 	DDP_COMPONENT_MDP_RDMA6,
 	DDP_COMPONENT_MDP_RDMA7,
+	DDP_COMPONENT_DISP_PADDING0,
+	DDP_COMPONENT_DISP_PADDING1,
+	DDP_COMPONENT_DISP_PADDING2,
+	DDP_COMPONENT_DISP_PADDING3,
+	DDP_COMPONENT_DISP_PADDING4,
+	DDP_COMPONENT_DISP_PADDING5,
+	DDP_COMPONENT_DISP_PADDING6,
+	DDP_COMPONENT_DISP_PADDING7,
 	DDP_COMPONENT_MERGE0,
 	DDP_COMPONENT_MERGE1,
 	DDP_COMPONENT_MERGE2,
--
2.18.0


