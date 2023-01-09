Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C289DC67871
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 09:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BAp+xDBGU54PPm/5VMviuQnl/KdEsY0dtwop6ZaDpbE=; b=K7i/JE+a7Gdxh7XIlrUr0LOyhw
	H2Vw0/YUb6ohlW+Qu9WmoFGRuSgOySSTlOj0wlGuEWv7gJ3/3DAfhiZurPoEg1XSKWkNSd77yDE9Y
	bIVgsQRFnklzQ2WkziQbg+i3wgPVTewm6r5uKyDhFQLSFs0tbfa5eOA2N/hlpnwqbDaukXLkOZeGV
	gyZzwgvM1FO2GpRHUkVc6OBcJvGlvheS+CcV0cX5EwAoJhsUmnTC5v7+W6nn3skxq9MO9rU8oadIx
	i1yGK3cAnqi6Ia17+VMOunPAbIp9I6I61RaCW7v/E35VWbqRlDdNr22IRp5fKeYiouHmhFkU9rlPO
	u4mn2ZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEo76-000W3E-FL; Mon, 09 Jan 2023 09:06:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEo6z-000W0w-DE; Mon, 09 Jan 2023 09:06:38 +0000
X-UUID: 031caa71e34749e08fb8fe507b8f0136-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BAp+xDBGU54PPm/5VMviuQnl/KdEsY0dtwop6ZaDpbE=;
	b=Lh6Kv2eOAHNBuX+fabw0f7BoGh6FE2jcq2Vq+/TjNFfhU3uaXKcfsW08fR7rQxpsYJvEGFPniqHjHnqsyRCgnDJnQfPf6fKc1iiSSBDy1FxG6iYedTeNbjfXuhHGScAiZASD9auB7+9Hk0L1UdvpUPHtyB65eNizFYTuQtMCuO8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:7965be99-6c5c-41ac-be93-880f70483e31,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:3a0742f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 031caa71e34749e08fb8fe507b8f0136-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 543536284; Mon, 09 Jan 2023 02:06:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 9 Jan 2023 16:45:51 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 9 Jan 2023 16:45:50 +0800
From: <yf.wang@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:IOMMU DMA-API LAYER" <iommu@lists.linux.dev>, open list
	<linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Yong Wu
	<yong.wu@mediatek.com>, Ning Li <Ning.Li@mediatek.com>, jianjiao zeng
	<jianjiao.zeng@mediatek.com>, Yunfei Wang <yf.wang@mediatek.com>
Subject: [PATCH] iommu/iova: Fix alloc iova overflows issue
Date: Mon, 9 Jan 2023 16:34:28 +0800
Message-ID: <20230109083429.25622-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_010636_145383_30BB9D1F 
X-CRM114-Status: GOOD (  15.87  )
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

From: Yunfei Wang <yf.wang@mediatek.com>

In __alloc_and_insert_iova_range, there is an issue that retry_pfn
overflows. The value of iovad->anchor.pfn_hi is ~0UL, then when
iovad->cached_node is iovad->anchor, curr_iova->pfn_hi + 1 will
overflow. As a result, if the retry logic is executed, low_pfn is
updated to 0, and then new_pfn < low_pfn returns false to make the
allocation successful.

This issue occurs in the following two situations:
1. The first iova size exceeds the domain size. When initializing
iova domain, iovad->cached_node is assigned as iovad->anchor. For
example, the iova domain size is 10M, start_pfn is 0x1_F000_0000,
and the iova size allocated for the first time is 11M. The
following is the log information, new->pfn_lo is smaller than
iovad->cached_node.

Example log:
[  223.798112][T1705487] sh: [name:iova&]__alloc_and_insert_iova_range
start_pfn:0x1f0000,retry_pfn:0x0,size:0xb00,limit_pfn:0x1f0a00
[  223.799590][T1705487] sh: [name:iova&]__alloc_and_insert_iova_range
success start_pfn:0x1f0000,new->pfn_lo:0x1efe00,new->pfn_hi:0x1f08ff

2. The node with the largest iova->pfn_lo value in the iova domain
is deleted, iovad->cached_node will be updated to iovad->anchor,
and then the alloc iova size exceeds the maximum iova size that can
be allocated in the domain.

Adding judgment that retry_pfn must be greater than iovad->start_pfn
can fix this issue.

Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
---
 drivers/iommu/iova.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index a44ad92fc5eb..0073206c2a95 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -209,7 +209,8 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
 	} while (curr && new_pfn <= curr_iova->pfn_hi && new_pfn >= low_pfn);
 
 	if (high_pfn < size || new_pfn < low_pfn) {
-		if (low_pfn == iovad->start_pfn && retry_pfn < limit_pfn) {
+		if (low_pfn == iovad->start_pfn &&
+		    retry_pfn >= iovad->start_pfn && retry_pfn < limit_pfn) {
 			high_pfn = limit_pfn;
 			low_pfn = retry_pfn;
 			curr = iova_find_limit(iovad, limit_pfn);
-- 
2.18.0


