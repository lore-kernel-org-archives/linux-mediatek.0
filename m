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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4BCC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:54:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86AC52336D
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86AC52336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GmQYzrEk2l+aGAYXgFjxK+1AgiV/C5lvIeOdxU9OetY=; b=PWJ2E/+icLS8tLtTXbJsfzMVp
	+Nlgx17uz1Pd47OUpdaJq57Iml9heKsF6dVWaail0/qHySDTwqTE1ImVdPx6Bv6yWhCskFVIamGVx
	6LCVmHB23wgU2h8Y3JfFtMQyKt667r+UhDmwgPq/VNFSHd3yv5X5coASpR9nGCkXS2l4CieEAK2LF
	tX6Zxqgrwq0M/4zEsyacLqFecRYwNfIfUuN+LWc6jDObIHA8sxZey3uJqOpz9xAunZCBxZFgfWfgH
	cKI8K7G4vEbFfAiBkyBpLXzCBDIIOL8hkh1DCkG4SQrpAoXChXc59p+drxN/XwigSlPvsZjLW7Na8
	hhFpnYXrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUnQ-0005NX-IP; Thu, 07 Jan 2021 12:53:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUdR-0008TL-Nv; Thu, 07 Jan 2021 12:43:29 +0000
X-UUID: 2152627db67d4848bed0c3f89af17010-20210107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Fr87Cno+1tQz0C+qnFx6+F3EuRJjuBoYQ9O/I0ug7oo=; 
 b=cZTHt8LNcTVLaTm8ugZNBQ8sBrh6UUiYZ75ZKCaSIx1EHrIJYGNnpblsd4ntSW1mmvq76QZnflhr2Gr11qe8QG0MyMkK4+xK4ahTb4prBaSc5pSVrpIBBqa+vktkapDzscS5616BTJlyTvklwVJuKWdbL/73GPQKvTNODJRnb0Y=;
X-UUID: 2152627db67d4848bed0c3f89af17010-20210107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1396426720; Thu, 07 Jan 2021 04:40:10 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 04:30:08 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 20:30:06 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jan 2021 20:30:00 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH v4 4/7] iommu: Switch gather->end to the inclusive end
Date: Thu, 7 Jan 2021 20:29:06 +0800
Message-ID: <20210107122909.16317-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210107122909.16317-1-yong.wu@mediatek.com>
References: <20210107122909.16317-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_074326_202360_F024C91C 
X-CRM114-Status: GOOD (  17.52  )
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

Currently gather->end is "unsigned long" which may be overflow in
arch32 in the corner case: 0xfff00000 + 0x100000(iova + size).
Although it doesn't affect the size(end - start), it affects the checking
"gather->end < end"

This patch changes this "end" to the real end address
(end = start + size - 1). Correspondingly, update the length to
"end - start + 1".

Fixes: a7d20dc19d9e ("iommu: Introduce struct iommu_iotlb_gather for batching TLB flushes")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
 drivers/iommu/mtk_iommu.c                   | 2 +-
 drivers/iommu/tegra-gart.c                  | 2 +-
 include/linux/iommu.h                       | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8ca7415d785d..c70d6e79f534 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2280,7 +2280,7 @@ static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 
-	arm_smmu_tlb_inv_range(gather->start, gather->end - gather->start,
+	arm_smmu_tlb_inv_range(gather->start, gather->end - gather->start + 1,
 			       gather->pgsize, true, smmu_domain);
 }
 
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index f579fc21971e..66a00a2cb445 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -443,7 +443,7 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
 				 struct iommu_iotlb_gather *gather)
 {
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
-	size_t length = gather->end - gather->start;
+	size_t length = gather->end - gather->start + 1;
 
 	if (gather->start == ULONG_MAX)
 		return;
diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index 05e8e19b8269..6f130e51f072 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -270,7 +270,7 @@ static void gart_iommu_sync_map(struct iommu_domain *domain, unsigned long iova,
 static void gart_iommu_sync(struct iommu_domain *domain,
 			    struct iommu_iotlb_gather *gather)
 {
-	size_t length = gather->end - gather->start;
+	size_t length = gather->end - gather->start + 1;
 
 	gart_iommu_sync_map(domain, gather->start, length);
 }
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 9ce0aa9e236b..ae8eddd4621b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -170,7 +170,7 @@ enum iommu_dev_features {
  * struct iommu_iotlb_gather - Range information for a pending IOTLB flush
  *
  * @start: IOVA representing the start of the range to be flushed
- * @end: IOVA representing the end of the range to be flushed (exclusive)
+ * @end: IOVA representing the end of the range to be flushed (inclusive)
  * @pgsize: The interval at which to perform the flush
  *
  * This structure is intended to be updated by multiple calls to the
@@ -539,7 +539,7 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
 					       struct iommu_iotlb_gather *gather,
 					       unsigned long iova, size_t size)
 {
-	unsigned long start = iova, end = start + size;
+	unsigned long start = iova, end = start + size - 1;
 
 	/*
 	 * If the new page is disjoint from the current range or is mapped at
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
