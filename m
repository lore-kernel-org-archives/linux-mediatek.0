Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DFAC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 03:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlc1O0uGFdKL0HVge6HHQXyE6Jn19cM7Bw82F07IIP4=; b=o4d7L58VnDsaqHg15UdgSCEB/E
	p+c022CszfqxFSYNttT6/2xSv4ozUmwZpm53sou/bIuJ9poWXJMbJe6uc/Olc5d8ZL4bmI2U3cXvQ
	ZpBbYBTpDYk//Jr0Knf+nRaL37HbekiYmJDcwkKapY3Lc6YhaUtdFmsyGvPdoaukcrJpbzNyvix+H
	N827fPxBr1vZKBDem6NVYBjGyyxA43LVqTFV25tBRMDfMxXS8uJ5baTN9FtrEcHNVQPfwkIh5XPA1
	P/+5QwmMK84y8zUpE91S48OSjoFTyghRrvZiU3fX0O7n2y7ywtmgX6/oanyHxIuLu2tYBM6c+8Fnx
	6PQX2SJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRlm3-00HEXz-Ki; Tue, 14 Feb 2023 03:14:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRll8-00HDxF-84; Tue, 14 Feb 2023 03:13:35 +0000
X-UUID: 8d53361aac1511eda08d4d6090ec5a5c-20230213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nlc1O0uGFdKL0HVge6HHQXyE6Jn19cM7Bw82F07IIP4=;
	b=c2xLMOtVIDQh7FYtaHp3KGXgfuEJ2219WQql06deySBtJP0y5QzO53E6JBJ6aooeCcXEBYQ60zPrKG4ixDrcd6KG6C/WDAxz2cqUMphVu5x6tlMz7gdqccu5/pWZiK7UR/o8hiBanIUjBuB1U1gaf5QetWVpp+zCRR24DdHsjz0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:474223f1-336a-4a27-be08-dab3803ba0a7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:52243257-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 8d53361aac1511eda08d4d6090ec5a5c-20230213
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 881016317; Mon, 13 Feb 2023 20:13:28 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 14 Feb 2023 11:12:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 14 Feb 2023 11:12:52 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, <nfraprado@collabora.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <jianjiao.zeng@mediatek.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, Yong Wu
	<yong.wu@mediatek.com>
Subject: [PATCH v3 07/11] iommu/mediatek: mt8192: Add iova_region_larb_msk
Date: Tue, 14 Feb 2023 11:11:10 +0800
Message-ID: <20230214031114.926-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230214031114.926-1-yong.wu@mediatek.com>
References: <20230214031114.926-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_191334_307260_13866EDD 
X-CRM114-Status: GOOD (  11.31  )
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

Add iova_region_larb_msk for mt8192. We separate the 16GB iova regions
by each device's larbid/portid.
Note: larb3/6/8/10/12/15 connect nothing in this SoC.
Refer to the comment in include/dt-bindings/memory/mt8192-larb-port.h

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 49f018138d9a..995e59cabf6c 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1552,6 +1552,17 @@ static const struct mtk_iommu_plat_data mt8186_data_mm = {
 	.iova_region_larb_msk = mt8186_larb_region_msk,
 };
 
+static const unsigned int mt8192_larb_region_msk[MT8192_MULTI_REGION_MAX_NR][MTK_LARB_NR_MAX] = {
+	[0] = {~0, ~0},				/* Region0: larb0/1 */
+	[1] = {0, 0, 0, 0, ~0, ~0, 0, ~0},	/* Region1: larb4/5/7 */
+	[2] = {0, 0, ~0, 0, 0, 0, 0, 0,		/* Region2: larb2/9/11/13/14/16/17/18/19/20 */
+	       0, ~0, 0, ~0, 0, ~(u32)(BIT(9) | BIT(10)), ~(u32)(BIT(4) | BIT(5)), 0,
+	       ~0, ~0, ~0, ~0, ~0},
+	[3] = {0},
+	[4] = {[13] = BIT(9) | BIT(10)},	/* larb13 port9/10 */
+	[5] = {[14] = BIT(4) | BIT(5)},		/* larb14 port4/5 */
+};
+
 static const struct mtk_iommu_plat_data mt8192_data = {
 	.m4u_plat       = M4U_MT8192,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
@@ -1561,6 +1572,7 @@ static const struct mtk_iommu_plat_data mt8192_data = {
 	.banks_enable   = {true},
 	.iova_region    = mt8192_multi_dom,
 	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
+	.iova_region_larb_msk = mt8192_larb_region_msk,
 	.larbid_remap   = {{0}, {1}, {4, 5}, {7}, {2}, {9, 11, 19, 20},
 			   {0, 14, 16}, {0, 13, 18, 17}},
 };
-- 
2.18.0


