Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BEBC77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 09:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCFWUdjviYmmYlgFSnIU9vsT+vPlbuNQol0JggDKPBM=; b=wn0lD3Qvl4RtUJH9rCjFzVCUvy
	A7mX1pLLX7k6F0Sv7aJm/xylmbBwsZbAi5a80smn/yNzkgyZCHcaVIUc2mDlVhUSVMzCMjWT1CsVc
	Shejt4O1fx7vxPuvVPTNQ+Cu3v8vBPSg9ZSWdtuWEKrA8JVQrglj7JZRYWCVobhRN5y0MrLPFFK/D
	l+Xawu9NyhpQ+9NkeDwAIPE1WJEaib6rOvCBnv65RX+4mSI/XjqE0kxAHIU8oFekwOGVt/ySEDtxn
	S2PTgMuO0TWvQ23K9YXgKGlFNqEqiCsWk3k3gqTxhWHwFIhEwsGjg1HvO50h5cqkg+sIcRJm42bsV
	c1yWz/JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50hO-006IKs-2a;
	Fri, 02 Jun 2023 09:03:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50hM-006IIm-0D;
	Fri, 02 Jun 2023 09:03:53 +0000
X-UUID: 6347ea50012411ee912e1518a6540028-20230602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DCFWUdjviYmmYlgFSnIU9vsT+vPlbuNQol0JggDKPBM=;
	b=lw+FNxwTOMotQdSr4V1hXqd3Dqep/NAgLF7TUjpQEZyfalYSnb/1XSGa8Fzo79xuXHse9DatzhFWovpVzrM0lLfBqonT0E3Ig4Ik5Q+iCeGnFxwBGV2tnQJRlRnVx+MWJ/1Tf7IQ9YfqDndGoW5tOyiGN/GbE2uu2Cbx0Q/ymZk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:b6456013-f05f-46b3-8378-eb2960ee799f,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:d5b0ae3,CLOUDID:77c6d36d-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 6347ea50012411ee912e1518a6540028-20230602
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 77033843; Fri, 02 Jun 2023 02:03:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 2 Jun 2023 17:03:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Jun 2023 17:03:45 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <jianjiao.zeng@mediatek.com>,
	<chengci.xu@mediatek.com>
Subject: [PATCH v12 6/7] iommu/mediatek: mt8188: Add iova_region_larb_msk
Date: Fri, 2 Jun 2023 17:02:26 +0800
Message-ID: <20230602090227.7264-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602090227.7264-1-yong.wu@mediatek.com>
References: <20230602090227.7264-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_020352_104910_D2BFC5A5 
X-CRM114-Status: GOOD (  10.85  )
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

Add iova_region_larb_msk for mt8188. We separate the 16GB iova regions
by each device's larbid/portid.
Refer to include/dt-bindings/memory/mediatek,mt8188-memory-port.h

As commented in the code, larb19(21) means it's larb19 while its SW index
is 21.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5c66af0c45a8..b17d3e7288a7 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1606,6 +1606,20 @@ static const struct mtk_iommu_plat_data mt8188_data_infra = {
 	.iova_region_nr   = ARRAY_SIZE(single_domain),
 };
 
+static const u32 mt8188_larb_region_msk[MT8192_MULTI_REGION_NR_MAX][MTK_LARB_NR_MAX] = {
+	[0] = {~0, ~0, ~0, ~0},               /* Region0: all ports for larb0/1/2/3 */
+	[1] = {0, 0, 0, 0, 0, 0, 0, 0,
+	       0, 0, 0, 0, 0, 0, 0, 0,
+	       0, 0, 0, 0, 0, ~0, ~0, ~0},    /* Region1: larb19(21)/21(22)/23 */
+	[2] = {0, 0, 0, 0, ~0, ~0, ~0, ~0,    /* Region2: the other larbs. */
+	       ~0, ~0, ~0, ~0, ~0, ~0, ~0, ~0,
+	       ~0, ~0, ~0, ~0, ~0, 0, 0, 0,
+	       0, ~0},
+	[3] = {0},
+	[4] = {[24] = BIT(0) | BIT(1)},       /* Only larb27(24) port0/1 */
+	[5] = {[24] = BIT(2) | BIT(3)},       /* Only larb27(24) port2/3 */
+};
+
 static const struct mtk_iommu_plat_data mt8188_data_vdo = {
 	.m4u_plat       = M4U_MT8188,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_3BITS | OUT_ORDER_WR_EN |
@@ -1617,6 +1631,7 @@ static const struct mtk_iommu_plat_data mt8188_data_vdo = {
 	.banks_enable   = {true},
 	.iova_region    = mt8192_multi_dom,
 	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
+	.iova_region_larb_msk = mt8188_larb_region_msk,
 	.larbid_remap   = {{2}, {0}, {21}, {0}, {19}, {9, 10,
 			   11 /* 11a */, 25 /* 11c */},
 			   {13, 0, 29 /* 16b */, 30 /* 17b */, 0}, {5}},
@@ -1633,6 +1648,7 @@ static const struct mtk_iommu_plat_data mt8188_data_vpp = {
 	.banks_enable   = {true},
 	.iova_region    = mt8192_multi_dom,
 	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
+	.iova_region_larb_msk = mt8188_larb_region_msk,
 	.larbid_remap   = {{1}, {3}, {23}, {7}, {MTK_INVALID_LARBID},
 			   {12, 15, 24 /* 11b */}, {14, MTK_INVALID_LARBID,
 			   16 /* 16a */, 17 /* 17a */, MTK_INVALID_LARBID,
-- 
2.25.1


