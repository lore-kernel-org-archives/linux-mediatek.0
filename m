Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA12C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4ZV6xzjZejZiT9UUWAGDwGBFilCWnMXsf8yFsCz4s4=; b=nmXvmTaM/lawi+2pd8annTCG6K
	My+oaj5Q1Lmlv8XnIsiInPLYDHarJrKrSduPAVtJPrBKj6ixDyo/xyhL/uMoB6wFv19viZ174g5fy
	DKcN6NU00OhxlRYdCqFAJQ8/IO3hfsf/Vrgxj8S4ygcScxyY9u2Xket2fnWTT0uBcDoZ2yMo/EYDG
	lBRtQldtHxVC0NjMH+mquZrs9klyYu3g1fZD9xlBI2ns3+/GjHGsXWsdpY27F41ZfwApyR18jWhE1
	m4El3sTDQ75aQxHh1XYZXwu4OAIt6J/3VGNg1qrfVqPebZpMFGxBwgnYR9cFjBrV6bjEO6kX/jV9I
	VupWog8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDCV-000g0F-BY; Fri, 13 Jan 2023 06:06:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDAJ-000eqe-Gh; Fri, 13 Jan 2023 06:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F4ZV6xzjZejZiT9UUWAGDwGBFilCWnMXsf8yFsCz4s4=; b=j22rLae65L+L3xAR75mYCjXpZF
	mGYfIpXGxD7tZrE5fJ6wKbnBDoh0HyRFNOKQeEHqdsatEtw+K4+B06z8O73rBChxL9B9xe7tYsTRf
	q5Qp/RLmof1AMOZyoTs6V1hUZiKM1kUv1UIFJqDh6MhkQOfTmPSmBaaF1sftAnSX9e0vYxHK2DeiJ
	3Qe3I+d2jnYoljjKzxyk1XRLm/sGGhnnsJ9o2X0NKJtcwniC6dHqAlz7MhT/lb5jU12Q6W/44qN5I
	Ysi3C6k8TxwvZFCWUg8jCqc3RbmeH95fbuF49WoBvqvsJq/BoCPoUiusOEcGMj/8pp4z6Ac7mD3J6
	1z1nSV3A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGDA6-004FOq-1N;
	Fri, 13 Jan 2023 06:03:37 +0000
X-UUID: 0260aa2c930811eda08d4d6090ec5a5c-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=F4ZV6xzjZejZiT9UUWAGDwGBFilCWnMXsf8yFsCz4s4=;
	b=ghK/j8ikNhrRqIlkKg4ts6syqwyRvgeOPkSWn0W2UaAlXgOP5NM/RizOx+n0q4rUxZfmhRt2h5HjJrQvh39VcjnR0UKFAMwAkUveE15ok1+Kw30G52KIfY8AMgQtvRAnjRGcMUnubYQE2ilmEsg7Try68zxCF1UCQ7j5oIGsN84=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:538ed237-9093-49e3-b215-42cdc12c142d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:c7fb258c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 0260aa2c930811eda08d4d6090ec5a5c-20230112
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2006945616; Thu, 12 Jan 2023 23:03:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 14:02:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 14:02:57 +0800
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
	<mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, Yong Wu
	<yong.wu@mediatek.com>
Subject: [PATCH 07/10] iommu/mediatek: Add a gap for the iova regions
Date: Fri, 13 Jan 2023 14:01:30 +0800
Message-ID: <20230113060133.9394-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113060133.9394-1-yong.wu@mediatek.com>
References: <20230113060133.9394-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_060335_650504_81D4A1B1 
X-CRM114-Status: GOOD (  14.81  )
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

Currenly masters can not indicate its special dma-ranges. Prepare
for vcodec. some vcodec end address is address + size, if our size
is 4G, the end address may be 0x2_0000_0000. and the
register is u32, then it may get zero. thus add a gap(8M) for
all the regions.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e4b8c07d4dbd..dd63d9994133 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -304,15 +304,15 @@ static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
 #define for_each_m4u(data, head)  list_for_each_entry(data, head, list)
 
 static const struct mtk_iommu_iova_region single_domain[] = {
-	{.iova_base = 0,		.size = SZ_4G},
+	{.iova_base = 0,		.size = SZ_4G - SZ_8M},
 };
 
 static const struct mtk_iommu_iova_region mt8192_multi_dom[] = {
-	{ .iova_base = 0x0,		.size = SZ_4G},		/* 0 ~ 4G */
+	{ .iova_base = 0x0,		.size = SZ_4G - SZ_8M},	/* 0 ~ 4G, 8M as a gap. */
 	#if IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT)
-	{ .iova_base = SZ_4G,		.size = SZ_4G},		/* 4G ~ 8G */
-	{ .iova_base = SZ_4G * 2,	.size = SZ_4G},		/* 8G ~ 12G */
-	{ .iova_base = SZ_4G * 3,	.size = SZ_4G},		/* 12G ~ 16G */
+	{ .iova_base = SZ_4G,		.size = SZ_4G - SZ_8M},	/* 4G ~ 8G */
+	{ .iova_base = SZ_4G * 2,	.size = SZ_4G - SZ_8M},	/* 8G ~ 12G */
+	{ .iova_base = SZ_4G * 3,	.size = SZ_4G - SZ_8M},	/* 12G ~ 16G */
 
 	{ .iova_base = 0x240000000ULL,	.size = 0x4000000},	/* CCU0 */
 	{ .iova_base = 0x244000000ULL,	.size = 0x4000000},	/* CCU1 */
-- 
2.18.0


