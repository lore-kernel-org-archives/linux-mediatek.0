Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104EDC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cVVDeQc/1nZuBHmzu2DDRPtQM7Pbg8O+aJeGPtQbBxc=; b=q4CBfdXs6sbTfT
	7HLBsvjmyQg/zgqxpEPwkFTrJ2XFrk0/YMdEpQ/R7We3kfk8lqoSrY4DoThZqBDrrE1ymqDc+iK2p
	QKv1dcyeRszuL51tIhDP3+KI6xgKgRboevDCAWxcbFJxvwian2YwLjUUKgw6qunbbVLyjYYQ6RDaJ
	nV2mKEubzNB3yaZCxu6jeeoFUuYM+ZoKsELNf6M0cBu40+asMnbyL3cw1tgEfDlTJZAcUmdpKsl4e
	iBfUH1ZXUlaEnjWN9Yqgih64rt4IioSzqWVlalKl1dtrmoI9+iNqHVM68wUbtf8BThFSWXQ6o0qTh
	ttizAt+1shrCACCDTGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnGHG-006Z15-Qk; Sat, 07 May 2022 08:59:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnGH4-006YxS-FK; Sat, 07 May 2022 08:58:51 +0000
X-UUID: 208e29a0cc9542efaa88b32e50138165-20220507
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:508286f9-6ef8-4fc1-b384-b12f453febff, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:02798b16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 208e29a0cc9542efaa88b32e50138165-20220507
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yf.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 225382058; Sat, 07 May 2022 01:58:40 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 7 May 2022 01:58:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 7 May 2022 16:58:37 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 7 May 2022 16:58:35 +0800
From: <yf.wang@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Logan Gunthorpe <logang@deltatee.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Yong Wu
 <yong.wu@mediatek.com>, Ning Li <Ning.Li@mediatek.com>, Yunfei Wang
 <yf.wang@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH] iommu/dma: Fix iova map result check bug
Date: Sat, 7 May 2022 16:52:03 +0800
Message-ID: <20220507085204.16914-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_015850_571829_3A2EB041 
X-CRM114-Status: GOOD (  14.79  )
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

The data type of the return value of the iommu_map_sg_atomic
is ssize_t, but the data type of iova size is size_t,
e.g. one is int while the other is unsigned int.

When iommu_map_sg_atomic return value is compared with iova size,
it will force the signed int to be converted to unsigned int, if
iova map fails and iommu_map_sg_atomic return error code is less
than 0, then (ret < iova_len) is false, which will to cause not
do free iova, and the master can still successfully get the iova
of map fail, which is not expected.

Therefore, we need to check the return value of iommu_map_sg_atomic
in two cases according to whether it is less than 0.

Fixes: ad8f36e4b6b1 ("iommu: return full error code from iommu_map_sg[_atomic]()")
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
Cc: <stable@vger.kernel.org> # 5.15.*
---
 drivers/iommu/dma-iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 09f6e1c0f9c0..2932281e93fc 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -776,6 +776,7 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
 	unsigned int count, min_size, alloc_sizes = domain->pgsize_bitmap;
 	struct page **pages;
 	dma_addr_t iova;
+	ssize_t ret;
 
 	if (static_branch_unlikely(&iommu_deferred_attach_enabled) &&
 	    iommu_deferred_attach(dev, domain))
@@ -813,8 +814,8 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
 			arch_dma_prep_coherent(sg_page(sg), sg->length);
 	}
 
-	if (iommu_map_sg_atomic(domain, iova, sgt->sgl, sgt->orig_nents, ioprot)
-			< size)
+	ret = iommu_map_sg_atomic(domain, iova, sgt->sgl, sgt->orig_nents, ioprot);
+	if (ret < 0 || ret < size)
 		goto out_free_sg;
 
 	sgt->sgl->dma_address = iova;
@@ -1209,7 +1210,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	 * implementation - it knows better than we do.
 	 */
 	ret = iommu_map_sg_atomic(domain, iova, sg, nents, prot);
-	if (ret < iova_len)
+	if (ret < 0 || ret < iova_len)
 		goto out_free_iova;
 
 	return __finalise_sg(dev, sg, nents, iova);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
