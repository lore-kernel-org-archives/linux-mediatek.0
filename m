Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770C9C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 06:26:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1763B61A42
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 06:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1763B61A42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J7cKSZ1puzBxzm/D9HWh4s01o1IKs6W4Ud0aUazAFlg=; b=oosxXXnozRiAu2+UlTgHdJz+V
	0CZsdqEacaHdyj+y/aO5/HR/MgW/SQ7LgDk5A0m/ot/NW8ilp7ZNOdSSODKa13d0bRv7X8x9Drmwy
	SPL2kCAGYnLXhHmfG56zqwIXM8arvx18TzAKkwxfTSwQuxW7Dns0z9XAw701xy3NbJbkONIQ17Fh6
	gZ2S0/OS1z7EP3rKFcQO0xTli7ksd+81bT1zHHfeZ8yk6Yoje8LjV2JcqFyWxAKQltjdkkHSg5RnU
	5k9NicS3Fcux3hAqT0M+wguxyoqFOPh6Kq2XyEAK1Edy6sXotfUlM6oCBeSn2+yIbwRVXYkee+qWU
	8IrH25ieA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPfv5-002rOP-Ib; Fri, 26 Mar 2021 06:26:07 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPfud-002rGn-TW; Fri, 26 Mar 2021 06:25:42 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6Bjc15hyzNqS0;
 Fri, 26 Mar 2021 14:23:00 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 14:25:27 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 "Joerg Roedel" <joro@8bytes.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 "David Woodhouse" <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/8] iommu/pamu: fix a couple of spelling mistakes
Date: Fri, 26 Mar 2021 14:24:05 +0800
Message-ID: <20210326062412.1262-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210326062412.1262-1-thunder.leizhen@huawei.com>
References: <20210326062412.1262-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_062540_499746_D3B54A0E 
X-CRM114-Status: GOOD (  12.08  )
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

There are several spelling mistakes, as follows:
Returs  ==> Returns
defaul ==> default
assocaited ==> associated

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/iommu/fsl_pamu.c        | 2 +-
 drivers/iommu/fsl_pamu_domain.c | 2 +-
 drivers/iommu/fsl_pamu_domain.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index b9a974d9783113d..48ebbf0daa21cf9 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -503,7 +503,7 @@ void get_ome_index(u32 *omi_index, struct device *dev)
  * @stash_dest_hint: L1, L2 or L3
  * @vcpu: vpcu target for a particular cache type.
  *
- * Returs stash on success or ~(u32)0 on failure.
+ * Returns stash on success or ~(u32)0 on failure.
  *
  */
 u32 get_stash_id(u32 stash_dest_hint, u32 vcpu)
diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index b2110767caf49c8..be664cd18c51970 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -418,7 +418,7 @@ static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
 		pr_debug("dma_domain allocation failed\n");
 		return NULL;
 	}
-	/* defaul geometry 64 GB i.e. maximum system address */
+	/* default geometry 64 GB i.e. maximum system address */
 	dma_domain->iommu_domain. geometry.aperture_start = 0;
 	dma_domain->iommu_domain.geometry.aperture_end = (1ULL << 36) - 1;
 	dma_domain->iommu_domain.geometry.force_aperture = true;
diff --git a/drivers/iommu/fsl_pamu_domain.h b/drivers/iommu/fsl_pamu_domain.h
index 2865d42782e8021..4f508fa041080e3 100644
--- a/drivers/iommu/fsl_pamu_domain.h
+++ b/drivers/iommu/fsl_pamu_domain.h
@@ -24,7 +24,7 @@ struct fsl_dma_domain {
 	 */
 	dma_addr_t			geom_size;
 	/*
-	 * Number of windows assocaited with this domain.
+	 * Number of windows associated with this domain.
 	 * During domain initialization, it is set to the
 	 * the maximum number of subwindows allowed for a LIODN.
 	 * Minimum value for this is 1 indicating a single PAMU
-- 
1.8.3



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
