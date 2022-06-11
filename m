Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF94CCA47A
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 10:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWuA/oCXJy09cWmfOM1VrASZvBlGD7MF2AzgUydnT9M=; b=pD/fanB44rfemb
	DcGh4ArX+NYEMHfHfXrJlWCstIzRMAGNY+7TJV4MkU6qAlC5lBoYMPH2NjNkfyBozdLmKU8IRri2N
	KIB2IFRoKtFngkJQz0KAcxVpY0QJ4SPLHZ+DdnTkHs495KUzAxaRjVpAIbkiUnXCrTmPqO5VBQuAE
	qDcQZfeYtWOU5f4zvMuAIR6uHVhGivHVzoHtgOqHNyMObgF6NfaVX5EKKK5qWR//AO0VDksitlrzk
	JxhTygV56hSLARrqvm9hVfam0MdbDpGtJkpMt0j93co59UBy4U8ZMwmh/VEqHIqkE6H5NYWqZIXO6
	UeJkgmldEOGKvWd4feWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzyRS-00CV0Y-VJ; Sat, 11 Jun 2022 10:34:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzyRN-00CUxU-AJ; Sat, 11 Jun 2022 10:34:02 +0000
X-UUID: b1d2ec04fad54d3bbee53087ee957c47-20220611
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:c5fe947d-9592-4032-9264-9a1ffd480505,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:e02385e7-1f03-4449-90ad-e6cb8f3d1399,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: b1d2ec04fad54d3bbee53087ee957c47-20220611
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1389619890; Sat, 11 Jun 2022 03:33:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jun 2022 03:33:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Jun 2022 18:33:55 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jun 2022 18:33:54 +0800
From: <yf.wang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:MEDIATEK IOMMU DRIVER" <iommu@lists.linux-foundation.org>, "moderated
 list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "open
 list" <linux-kernel@vger.kernel.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Yong Wu
	<Yong.Wu@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Yunfei Wang
	<yf.wang@mediatek.com>, Ning Li <ning.li@mediatek.com>
Subject: [PATCH v8 2/3] iommu/mediatek: Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR
Date: Sat, 11 Jun 2022 18:26:54 +0800
Message-ID: <20220611102656.10954-3-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220611102656.10954-1-yf.wang@mediatek.com>
References: <20220611102656.10954-1-yf.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_033401_407216_5D72BECA 
X-CRM114-Status: GOOD (  10.24  )
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

From: Yunfei Wang <yf.wang@mediatek.com>

Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR, and update MTK_IOMMU_ADDR
definition for better generality.

Signed-off-by: Ning Li <ning.li@mediatek.com>
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index bb9dd92c9898..3d62399e8865 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -265,8 +265,8 @@ static const struct iommu_ops mtk_iommu_ops;
 
 static int mtk_iommu_hw_init(const struct mtk_iommu_data *data, unsigned int bankid);
 
-#define MTK_IOMMU_TLB_ADDR(iova) ({					\
-	dma_addr_t _addr = iova;					\
+#define MTK_IOMMU_ADDR(addr) ({						\
+	unsigned long long _addr = addr;				\
 	((lower_32_bits(_addr) & GENMASK(31, 12)) | upper_32_bits(_addr));\
 })
 
@@ -381,8 +381,8 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
 			       base + data->plat_data->inv_sel_reg);
 
-		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova), base + REG_MMU_INVLD_START_A);
-		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova + size - 1),
+		writel_relaxed(MTK_IOMMU_ADDR(iova), base + REG_MMU_INVLD_START_A);
+		writel_relaxed(MTK_IOMMU_ADDR(iova + size - 1),
 			       base + REG_MMU_INVLD_END_A);
 		writel_relaxed(F_MMU_INV_RANGE, base + REG_MMU_INVALIDATE);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
