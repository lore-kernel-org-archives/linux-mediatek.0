Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13385C636D4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 03:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peavVusQeZHXkfJ5gLzdRFCDza4y4JlhLRiqN/ma/lU=; b=3EZnbuYJjh/YBDq9WwmRrcvJku
	5R3uJJM2pN9DV3Ym1F5/0eYIi/OvOFkcWaHlvEK/pfkrppGUfdsykQ0eOTLa+0h4ize56oZTDe0Tm
	M4VMeGvtZawOp1YSEl9OKhwXz9ucE1oG1LL+NrLQbukTgRDT54oJaeVCl2FB+bMXYHVAqUOeM3zz4
	D6MgcFJQSSeazGwsfDS5hzKLkU11KT5HWsJNqGc6EuCMMNOJrV+rRZMFs2qzkCcDsD0ugg80lQ64i
	SWIO4s7CtEQ+WwZE2M6XkUJkoL9u5V38ZrBJ5apPSXxtOrNTOzjisKiff67diiWKtr7dwXIaiIQ7X
	JFiFqVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRm3O-00HK3Y-Pi; Tue, 14 Feb 2023 03:32:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRm3D-00HJzl-K5; Tue, 14 Feb 2023 03:32:17 +0000
X-UUID: 2808297aac1811eda08d4d6090ec5a5c-20230213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=peavVusQeZHXkfJ5gLzdRFCDza4y4JlhLRiqN/ma/lU=;
	b=W1A6hdbhIfd8V7v6rILa0p145TFqwfkXqwM2FMR869cF48S3Bef/ayu+Yorjh5GJPQoFWJBcrVCZM5V6lFwqKdlvkAvzfXA55Yq6kHnEF2HI+rmFNAWByX3+S8p+pTI1b6iQE1Xifq6q+rpolucmnbZg8LF/lhxp+ZbGwSSEoqA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:6593b1d1-e216-49b5-8a91-331c115af2c9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:885ddb2,CLOUDID:d6d73257-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 2808297aac1811eda08d4d6090ec5a5c-20230213
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1269230088; Mon, 13 Feb 2023 20:32:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 14 Feb 2023 11:12:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 14 Feb 2023 11:12:02 +0800
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
Subject: [PATCH v3 03/11] iommu/mediatek: Improve comment for the current region/bank
Date: Tue, 14 Feb 2023 11:11:06 +0800
Message-ID: <20230214031114.926-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230214031114.926-1-yong.wu@mediatek.com>
References: <20230214031114.926-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_193216_477806_36FF83C1 
X-CRM114-Status: GOOD (  15.58  )
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

No functional change. Just add more comment about the current region/bank
in the code.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d5a4955910ff..ab53edcb221f 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -197,12 +197,33 @@ struct mtk_iommu_plat_data {
 
 	char			*pericfg_comp_str;
 	struct list_head	*hw_list;
-	unsigned int		iova_region_nr;
-	const struct mtk_iommu_iova_region	*iova_region;
 
-	u8                  banks_num;
-	bool                banks_enable[MTK_IOMMU_BANK_MAX];
-	unsigned int        banks_portmsk[MTK_IOMMU_BANK_MAX];
+	/*
+	 * The IOMMU HW may support 16GB iova. In order to balance the IOVA ranges,
+	 * different masters will be put in different iova ranges, for example vcodec
+	 * is in 4G-8G and cam is in 8G-12G. Meanwhile, some masters may have the
+	 * special IOVA range requirement, like CCU can only support the address
+	 * 0x40000000-0x44000000.
+	 * Here list the iova ranges this SoC supports and which larbs/ports are in
+	 * which region.
+	 *
+	 * 16GB iova all use one pgtable, but each a region is a iommu group.
+	 */
+	struct {
+		unsigned int	iova_region_nr;
+		const struct mtk_iommu_iova_region	*iova_region;
+	};
+
+	/*
+	 * The IOMMU HW may have 5 banks. Each bank has a indenpendent pgtable.
+	 * Here list how many banks this SoC supports/enables and which ports are in which bank.
+	 */
+	struct {
+		u8		banks_num;
+		bool		banks_enable[MTK_IOMMU_BANK_MAX];
+		unsigned int	banks_portmsk[MTK_IOMMU_BANK_MAX];
+	};
+
 	unsigned char       larbid_remap[MTK_LARB_COM_MAX][MTK_LARB_SUBCOM_MAX];
 };
 
-- 
2.18.0


