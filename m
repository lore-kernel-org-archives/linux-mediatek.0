Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2B6C64EC4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 02:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8HHskHnbAsCetHxm/xOX28+0QYD3OrWrhd9Jvdcg2M=; b=JXmkwawHFVffLlgqhghM/eWuLh
	Hg7yQTTH7u6LliiPJxgmNoqd0hP+w8V7/mfAjWkzSnJZsP45FdOgjKMIOCK57H065poh9lVcluBzN
	U3IFOel5mTkrnSivQnXBal7ZWsJO4fKQmo3/e+j1hsomxpa/WF7QmGw7H60Cr0J0k+MXwAVIzlbNl
	4joGcidyMGeanosvHpayRRPct9uHTZI9asGoDbjG1yhu3K8PB6CAY6/hsR1ehVMbtmPVlMX4INze0
	ILgmCHw+nNa37WIJBokcTv3Vhr/o6N4GuH7EEogB6i1gkAm2OgXNsb/IZrVMtRL7YGNUuK+KBcC68
	I+OoK3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNWc-00FzW9-TM; Tue, 07 Mar 2023 02:58:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNWS-00FzS1-Ao; Tue, 07 Mar 2023 02:57:54 +0000
X-UUID: d738db3ebc9311eda08d4d6090ec5a5c-20230306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=N8HHskHnbAsCetHxm/xOX28+0QYD3OrWrhd9Jvdcg2M=;
	b=In4SElv/daDGeYna4G5VHRKWj6ccN9TJiZcgGaTu667a9cRezubLTFxj0rP/vu/JLHCuqhloWaheNBdDO39N+9cwu49oOS/DswMmUJ6CXYnhWHiQ/ZqOiOG2+AZMRmwhuWoWBBnlgUBpWE/Gf0AScVfzCxKIZPhdIWDFtyDOdck=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:5890cac8-a88c-4321-85b3-452abecc6677,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:25b5999,CLOUDID:4f918927-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: d738db3ebc9311eda08d4d6090ec5a5c-20230306
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1481976826; Mon, 06 Mar 2023 19:57:47 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 7 Mar 2023 10:37:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 7 Mar 2023 10:37:08 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, <nfraprado@collabora.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
	<mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>,
	<jianjiao.zeng@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, kyrie
 wu <kyrie.wu@mediatek.corp-partner.google.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, Yong Wu
	<yong.wu@mediatek.com>
Subject: [PATCH v5 08/11] iommu/mediatek: Add a gap for the iova regions
Date: Tue, 7 Mar 2023 10:35:04 +0800
Message-ID: <20230307023507.13306-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307023507.13306-1-yong.wu@mediatek.com>
References: <20230307023507.13306-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_185752_749088_90A52365 
X-CRM114-Status: GOOD (  14.08  )
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

As the removed property in the vcodec dt-binding, the property is:
dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;

The length is 0xfff0_0000 rather than 0x1_0000_0000, this means it
requires 1M as a gap. This is because the end address for some vcodec
HW is (address + size). If the size is 4G, the end address may be
0x2_0000_0000, and the width for vcodec register only is 32, then the
HW may get the ZERO address.

Currently the consumer's dma-ranges property doesn't work, IOMMU
has to consider this case. Add a bigger gap(8M) for all the regions
to avoid it.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index fbfc5e4e56a8..e0264d5f1c9a 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -332,8 +332,10 @@ static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
 
 #define for_each_m4u(data, head)  list_for_each_entry(data, head, list)
 
+#define MTK_IOMMU_IOVA_SZ_4G		(SZ_4G - SZ_8M) /* 8M as gap */
+
 static const struct mtk_iommu_iova_region single_domain[] = {
-	{.iova_base = 0,		.size = SZ_4G},
+	{.iova_base = 0,		.size = MTK_IOMMU_IOVA_SZ_4G},
 };
 
 #define MT8192_MULTI_REGION_NR_MAX	6
@@ -342,11 +344,11 @@ static const struct mtk_iommu_iova_region single_domain[] = {
 				 MT8192_MULTI_REGION_NR_MAX : 1)
 
 static const struct mtk_iommu_iova_region mt8192_multi_dom[MT8192_MULTI_REGION_NR] = {
-	{ .iova_base = 0x0,		.size = SZ_4G},		/* 0 ~ 4G */
+	{ .iova_base = 0x0,		.size = MTK_IOMMU_IOVA_SZ_4G},	/* 0 ~ 4G,  */
 	#if IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT)
-	{ .iova_base = SZ_4G,		.size = SZ_4G},		/* 4G ~ 8G */
-	{ .iova_base = SZ_4G * 2,	.size = SZ_4G},		/* 8G ~ 12G */
-	{ .iova_base = SZ_4G * 3,	.size = SZ_4G},		/* 12G ~ 16G */
+	{ .iova_base = SZ_4G,		.size = MTK_IOMMU_IOVA_SZ_4G},	/* 4G ~ 8G */
+	{ .iova_base = SZ_4G * 2,	.size = MTK_IOMMU_IOVA_SZ_4G},	/* 8G ~ 12G */
+	{ .iova_base = SZ_4G * 3,	.size = MTK_IOMMU_IOVA_SZ_4G},	/* 12G ~ 16G */
 
 	{ .iova_base = 0x240000000ULL,	.size = 0x4000000},	/* CCU0 */
 	{ .iova_base = 0x244000000ULL,	.size = 0x4000000},	/* CCU1 */
-- 
2.25.1


