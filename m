Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875C6C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:51:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E86E2337F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E86E2337F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cYij3uZ0M0Q+iJ6gbOfvpqHFwAD+OsNNJKLKHQkpyXY=; b=Y3z/btKjqBgbnoT1cWtVW7SJK
	dYxTkURouKb0cKe8ChFBYW3e8OKgQx8yZHx3p4OtYV/kSit7UVphGzXfrdexxYYlL+puEAXFCZC3M
	R1uchtj6GrID3YXml37HyEZaE6JhZuw6P8VDtxaij8YDlVaGWGA6gv1g5JTvsfz6C++ksyYUM0GSd
	xD9wyiKj8csFb9e9Fz9Gzmsg2OB3dJ1OTE3meHqogSwDBo9c5fqcYWbE3wZMi8BTcIYSPXNKwU9PX
	CxqNu2NnOxNY3uOv1ZozzcGzMD2MfZI0XF15oe5XFWSSmIZDNoy7yhkQ48TPoINI0lderK74PTjMp
	AmSTYKUUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUkk-0003ys-6K; Thu, 07 Jan 2021 12:50:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUdF-0008MQ-Dp; Thu, 07 Jan 2021 12:43:14 +0000
X-UUID: e0077c68d6244dd5ada4951342b3585d-20210107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dc2f8oz6/iKBiR1qD0t7z7FH7LG0gQH66d13TrVLf1w=; 
 b=E3HYCV0px7pE2GCI5WJrw14g9SAW8y137wz2EF97yMe9bKP5oSvPiWTY+tt5Kd9h75mVFhPEZI/xN5CIJKxdUUzKqKHIwYPR0JNtYQq7YsP4NdQRkVCyl3PwrB/ORLaeT04XEqZ3noJ0tqbYFcqD0roUq+QIGtTBFUigJwt5+30=;
X-UUID: e0077c68d6244dd5ada4951342b3585d-20210107
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 12446638; Thu, 07 Jan 2021 04:29:38 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 04:29:37 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 20:29:35 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jan 2021 20:29:34 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH v4 1/7] iommu: Move iotlb_sync_map out from __iommu_map
Date: Thu, 7 Jan 2021 20:29:03 +0800
Message-ID: <20210107122909.16317-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210107122909.16317-1-yong.wu@mediatek.com>
References: <20210107122909.16317-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_074313_650791_17991338 
X-CRM114-Status: GOOD (  15.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 David Laight <David.Laight@ACULAB.COM>, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the end of __iommu_map, It alway call iotlb_sync_map.

This patch moves iotlb_sync_map out from __iommu_map since it is
unnecessary to call this for each sg segment especially iotlb_sync_map
is flush tlb all currently. Add a little helper _iommu_map for this.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/iommu.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index ffeebda8d6de..c304a6a30d42 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2426,9 +2426,6 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
 		size -= pgsize;
 	}
 
-	if (ops->iotlb_sync_map)
-		ops->iotlb_sync_map(domain);
-
 	/* unroll mapping in case something went wrong */
 	if (ret)
 		iommu_unmap(domain, orig_iova, orig_size - size);
@@ -2438,18 +2435,31 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
 	return ret;
 }
 
+static int _iommu_map(struct iommu_domain *domain, unsigned long iova,
+		      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
+{
+	const struct iommu_ops *ops = domain->ops;
+	int ret;
+
+	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
+	if (ret == 0 && ops->iotlb_sync_map)
+		ops->iotlb_sync_map(domain);
+
+	return ret;
+}
+
 int iommu_map(struct iommu_domain *domain, unsigned long iova,
 	      phys_addr_t paddr, size_t size, int prot)
 {
 	might_sleep();
-	return __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
+	return _iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
 }
 EXPORT_SYMBOL_GPL(iommu_map);
 
 int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
 	      phys_addr_t paddr, size_t size, int prot)
 {
-	return __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
+	return _iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
 }
 EXPORT_SYMBOL_GPL(iommu_map_atomic);
 
@@ -2533,6 +2543,7 @@ static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			     struct scatterlist *sg, unsigned int nents, int prot,
 			     gfp_t gfp)
 {
+	const struct iommu_ops *ops = domain->ops;
 	size_t len = 0, mapped = 0;
 	phys_addr_t start;
 	unsigned int i = 0;
@@ -2563,6 +2574,8 @@ static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			sg = sg_next(sg);
 	}
 
+	if (ops->iotlb_sync_map)
+		ops->iotlb_sync_map(domain);
 	return mapped;
 
 out_err:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
