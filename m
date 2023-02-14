Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B30BC6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 03:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YwMpyviGTSbxvBRVJIYFE9YPlevofbZZf0V7oAR34o=; b=ManCnQ8xqLn5+Nni/hi0Rlfgd8
	CzVgKfC/7JX8nmfgk0R/DoNNRwFDsIApfzVqVMYfomR0iQAiG5cuHQwaQAZEYFp6CcuT64tR9JDe9
	l17TM/p0f0PeNVDmXyLRhaGXmoPtLXZfMkpspgXgWt8I3HmE8tBwG5WOaWskUc/rHSMS8Axsuewro
	6+f2kYySCoufICT2ftXu6NVSIVN87r0PPxAjQOyyo+uv7ZKlpQMhsJpYMQMqBhfTph76OAbSBK4vE
	oGhbsyLYNgl0+tbB5vsdxFp3LfYaoe7C633LJwZXKohlgfL8Hhraf9gQt9W8DxXx+qsooUerUjPcR
	6BlUw92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRlle-00HEIN-1s; Tue, 14 Feb 2023 03:14:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRlkl-00HDjn-1v; Tue, 14 Feb 2023 03:13:12 +0000
X-UUID: 7f6b878cac1511edbbe3f76fe852e059-20230213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6YwMpyviGTSbxvBRVJIYFE9YPlevofbZZf0V7oAR34o=;
	b=kKV5f4LsIehkYG+8euKRfAe6NnS668FEUh32yLA5bBudMsqOknWWD06zGh3sl5vCaDFZIgB6Re/YguPOiR1fKhxrVeeSGkelSlvclCaVlyW2iitEfxNC0bbNpzQ5oSZsGwPIAYukyxML+HWEMp26MULtQ7aDBStu+16FTvoMHvk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:b0f6af22-fa2a-437a-a88b-6d6bad65b31f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.19,REQID:b0f6af22-fa2a-437a-a88b-6d6bad65b31f,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:885ddb2,CLOUDID:55203257-dd49-462e-a4be-2143a3ddc739,B
	ulkID:23021411130771II4QNW,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 7f6b878cac1511edbbe3f76fe852e059-20230213
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1534210941; Mon, 13 Feb 2023 20:13:05 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 14 Feb 2023 11:12:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 14 Feb 2023 11:12:27 +0800
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
Subject: [PATCH v3 05/11] iommu/mediatek: mt8195: Add iova_region_larb_msk
Date: Tue, 14 Feb 2023 11:11:08 +0800
Message-ID: <20230214031114.926-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230214031114.926-1-yong.wu@mediatek.com>
References: <20230214031114.926-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_191311_104878_549BADCD 
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

Add iova_region_larb_msk for mt8195. We separate the 16GB iova regions
by each device's larbid/portid.
Refer to include/dt-bindings/memory/mt8195-memory-port.h

Define a new macro MT8192_MULTI_REGION_MAX_NR to indicate
the index of mt8xxx_larb_region_msk and
"struct mtk_iommu_iova_region mt8192_multi_dom"
are the same.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 7e2cb3b8cac8..3d9986fb49a5 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -332,7 +332,12 @@ static const struct mtk_iommu_iova_region single_domain[] = {
 	{.iova_base = 0,		.size = SZ_4G},
 };
 
-static const struct mtk_iommu_iova_region mt8192_multi_dom[] = {
+#define MT8192_MULTI_REGION_MAX_NR	6
+
+#define MT8192_MULTI_REGION_NR	(IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) ? \
+				 MT8192_MULTI_REGION_MAX_NR : 1)
+
+static const struct mtk_iommu_iova_region mt8192_multi_dom[MT8192_MULTI_REGION_NR] = {
 	{ .iova_base = 0x0,		.size = SZ_4G},		/* 0 ~ 4G */
 	#if IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT)
 	{ .iova_base = SZ_4G,		.size = SZ_4G},		/* 4G ~ 8G */
@@ -1562,6 +1567,21 @@ static const struct mtk_iommu_plat_data mt8195_data_infra = {
 	.iova_region_nr   = ARRAY_SIZE(single_domain),
 };
 
+static const unsigned int mt8195_larb_region_msk[MT8192_MULTI_REGION_MAX_NR][MTK_LARB_NR_MAX] = {
+	[0] = {~0, ~0, ~0, ~0},               /* Region0: all ports for larb0/1/2/3 */
+	[1] = {0, 0, 0, 0, 0, 0, 0, 0,
+	       0, 0, 0, 0, 0, 0, 0, 0,
+	       0, 0, 0, ~0, ~0, ~0, ~0, ~0,   /* Region1: larb19/20/21/22/23/24 */
+	       ~0},
+	[2] = {0, 0, 0, 0, ~0, ~0, ~0, ~0,    /* Region2: the other larbs. */
+	       ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0,
+	       ~0, ~0, 0, 0, 0, 0, 0, 0,
+	       0, ~0, ~0, ~0, ~0},
+	[3] = {0},
+	[4] = {[18] = BIT(0) | BIT(1)},       /* Only larb18 port0/1 */
+	[5] = {[18] = BIT(2) | BIT(3)},       /* Only larb18 port2/3 */
+};
+
 static const struct mtk_iommu_plat_data mt8195_data_vdo = {
 	.m4u_plat	= M4U_MT8195,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
@@ -1572,6 +1592,7 @@ static const struct mtk_iommu_plat_data mt8195_data_vdo = {
 	.banks_enable   = {true},
 	.iova_region	= mt8192_multi_dom,
 	.iova_region_nr	= ARRAY_SIZE(mt8192_multi_dom),
+	.iova_region_larb_msk = mt8195_larb_region_msk,
 	.larbid_remap   = {{2, 0}, {21}, {24}, {7}, {19}, {9, 10, 11},
 			   {13, 17, 15/* 17b */, 25}, {5}},
 };
@@ -1586,6 +1607,7 @@ static const struct mtk_iommu_plat_data mt8195_data_vpp = {
 	.banks_enable   = {true},
 	.iova_region	= mt8192_multi_dom,
 	.iova_region_nr	= ARRAY_SIZE(mt8192_multi_dom),
+	.iova_region_larb_msk = mt8195_larb_region_msk,
 	.larbid_remap   = {{1}, {3},
 			   {22, MTK_INVALID_LARBID, MTK_INVALID_LARBID, MTK_INVALID_LARBID, 23},
 			   {8}, {20}, {12},
-- 
2.18.0


