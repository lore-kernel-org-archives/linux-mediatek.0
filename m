Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8FAE7717F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 03:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xro8YvkAmArZ+g0eahFhySFriAa5dviYjncPo9wXLuM=; b=UidF7X20SI/RTNMQWODgnjvdG5
	jqr+Z4e7e0DOisDZMwSp+sC/TpqFIi8D3weit2pHaBsRM93hASZYrpbT4TprvZaE08lWf48kaEOST
	+l1Igm0/YMstMX9nuNnmBxlJEsQiqMsqN8ck1UerdLrRNauT/rUkUTVaDsqrSgfZpzlnHogWnDvpU
	PG+5J93VdFtIgidL4hN+OvS9OC3ycfyza23Ac5K6uGpxqsrDaQg53yuEBmMs3oR6dp2MWoKd9q8iV
	9WjbJKCBCtczFYbCiD26GirO8qRUAghpESKxDjDNaLV0gOD+6u5d9aEAhYwpRt9me3X4Pegz4xHY4
	dfAAUQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLDLl-0000000DdMp-3m0W;
	Wed, 11 Dec 2024 03:25:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLDJd-0000000Dccs-1AYo;
	Wed, 11 Dec 2024 03:23:11 +0000
X-UUID: 3b6d3aaab76f11ef9048ed6ed365623b-20241210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Xro8YvkAmArZ+g0eahFhySFriAa5dviYjncPo9wXLuM=;
	b=azzA8+Fh6B352Ep8xRMWlSykB/B4oQZwtZTyyNAoz0ZYeYGl3FDSrEDgQSdNk9S9FNHej6OIAAQqSapAVpeQt1enMxcLQQlMXmKDv3NX0UV33U7dybQixB26ed88+4vcicrdzv7fNNGoq7w9sro5c2oHEPGG/3VKYBkXLWoH0vA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ef97d6ba-e2c4-489f-94b3-3dbf747a393b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:3767c53b-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3b6d3aaab76f11ef9048ed6ed365623b-20241210
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2045068822; Tue, 10 Dec 2024 20:23:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 11:22:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 11:22:59 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 7/8] drm/mediatek: Add programming flow for unsupported subsys ID hardware
Date: Wed, 11 Dec 2024 11:22:55 +0800
Message-ID: <20241211032256.28494-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.453200-8.000000
X-TMASE-MatchedRID: GIpmbigRs3ZYXTxImR5ZvBes/RxhysDbZj7cdTNjJqrYgrGDwuFJdvlY
	oV6p/cSxGy4u1Pg8lxUQeG3M+Q1qZ5H0YXYnbGozFEUknJ/kEl7dB/CxWTRRu4as+d5/8j56alE
	5EAck4oupxwl8K0p/1Gq3s8geJrA9lD8YgcQlFD5nIxZyJs78kg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.453200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 73C0895E3FB60DA00EF9C4C8B284BEA8D4DCFA5A7918811C01163AD9C729DAC82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_192309_323728_883A5F43 
X-CRM114-Status: GOOD (  14.21  )
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

To support hardware without subsys IDs on new SoCs, add a programming
flow that checks whether the subsys ID is valid. If the subsys ID is
invalid, the flow will call 2 alternative CMDQ APIs:
cmdq_pkt_assign() and cmdq_pkt_write_s_value() to achieve the same
functionality.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 34 ++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index edc6417639e6..0792c895526f 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -66,14 +66,38 @@ struct mtk_ddp_comp_dev {
 	struct cmdq_client_reg cmdq_reg;
 };
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+static void mtk_ddp_write_cmdq_pkt(struct cmdq_pkt *cmdq_pkt, struct cmdq_client_reg *cmdq_reg,
+				   unsigned int offset, unsigned int value, unsigned int mask)
+{
+	struct cmdq_client *cl = (struct cmdq_client *)cmdq_pkt->cl;
+
+	offset += cmdq_reg->offset;
+
+	if (cmdq_subsys_is_valid(cl->chan, cmdq_reg->subsys)) {
+		if (mask == GENMASK(31, 0))
+			cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys, offset, value);
+		else
+			cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys, offset, value, mask);
+	} else {
+		/* only MMIO access, no need to check mminfro_offset */
+		cmdq_pkt_assign(cmdq_pkt, 0, CMDQ_ADDR_HIGH(cmdq_reg->pa_base));
+		if (mask == GENMASK(31, 0))
+			cmdq_pkt_write_s_value(cmdq_pkt, 0, CMDQ_ADDR_LOW(offset), value);
+		else
+			cmdq_pkt_write_s_mask_value(cmdq_pkt, 0, CMDQ_ADDR_LOW(offset),
+						    value, mask);
+	}
+}
+#endif
+
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 		   unsigned int offset)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
-			       cmdq_reg->offset + offset, value);
+		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, GENMASK(31, 0));
 	else
 #endif
 		writel(value, regs + offset);
@@ -85,8 +109,7 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
-			       cmdq_reg->offset + offset, value);
+		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, GENMASK(31, 0));
 	else
 #endif
 		writel_relaxed(value, regs + offset);
@@ -98,8 +121,7 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt) {
-		cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys,
-				    cmdq_reg->offset + offset, value, mask);
+		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, mask);
 	} else {
 #endif
 		u32 tmp = readl(regs + offset);
-- 
2.43.0


