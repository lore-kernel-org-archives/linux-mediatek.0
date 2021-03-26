Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2764AC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 06:27:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA8661A3F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 06:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFA8661A3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c7Z6JMw6aXhVaJVpKZGwj6PvXHwi/Y75xM3SMfNBaBk=; b=OamEI+le8HOd8wy8ZMMp7do4o
	AvKPk8Tp8jhkhwjjpef4bgMfMO43iktNKmelzGtvZXugFvuzVGHCO+wyprvUgWUkU9swKMIzKUm4x
	E36xzN4GQBg/wFmF2+3CxhdzYGgtQrOqLuEZyjCSkoQD2pxHNBAwVWFk3DxsMoJqOjvMv85I88Z05
	S5vR344CLORoUWIGY3YqzS21zblKeIMhbgkRZi/r/KukHL4cB4FeE6nXx5G9LTPr97ZQkTJJ2Ljjf
	TH6lMAMpXzFdcGKrf8xgOkrzl/9peS5jiePnElS+s4aLwf6TuU7m0A7u/U70hQ7KcgaD8H825DbcE
	neUbpL2ZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPfw3-002rhB-Ph; Fri, 26 Mar 2021 06:27:07 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPfue-002rHS-Qh; Fri, 26 Mar 2021 06:25:48 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F6Bjj5r0mznWsn;
 Fri, 26 Mar 2021 14:23:05 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 14:25:32 +0800
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
Subject: [PATCH 6/8] iommu/amd: fix a couple of spelling mistakes
Date: Fri, 26 Mar 2021 14:24:10 +0800
Message-ID: <20210326062412.1262-7-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210326062412.1262-1-thunder.leizhen@huawei.com>
References: <20210326062412.1262-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_062541_991607_AD26BCDB 
X-CRM114-Status: GOOD (  13.87  )
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
alignement ==> alignment
programing ==> programming
implemtation ==> implementation
assignement ==> assignment

By the way, both "programing" and "programming" are acceptable, but the
latter seems more formal.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/iommu/amd/amd_iommu_types.h | 2 +-
 drivers/iommu/amd/init.c            | 4 ++--
 drivers/iommu/amd/iommu.c           | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 6937e3674a16e26..dc1814c355cff77 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -446,7 +446,7 @@ struct irq_remap_table {
 /* Interrupt remapping feature used? */
 extern bool amd_iommu_irq_remap;
 
-/* kmem_cache to get tables with 128 byte alignement */
+/* kmem_cache to get tables with 128 byte alignment */
 extern struct kmem_cache *amd_iommu_irq_cache;
 
 /*
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 321f5906e6ed3a5..48799002b3571d1 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -1734,7 +1734,7 @@ static void __init init_iommu_perf_ctr(struct amd_iommu *iommu)
 		goto pc_false;
 
 	/*
-	 * Disable power gating by programing the performance counter
+	 * Disable power gating by programming the performance counter
 	 * source to 20 (i.e. counts the reads and writes from/to IOMMU
 	 * Reserved Register [MMIO Offset 1FF8h] that are ignored.),
 	 * which never get incremented during this init phase.
@@ -2088,7 +2088,7 @@ static int intcapxt_irqdomain_activate(struct irq_domain *domain,
 	xt.destid_24_31 = cfg->dest_apicid >> 24;
 
 	/**
-	 * Current IOMMU implemtation uses the same IRQ for all
+	 * Current IOMMU implementation uses the same IRQ for all
 	 * 3 IOMMU interrupts.
 	 */
 	writeq(xt.capxt, iommu->mmio_base + MMIO_INTCAPXT_EVT_OFFSET);
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index a69a8b573e40d00..d14e4698f507b89 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1865,7 +1865,7 @@ int __init amd_iommu_init_dma_ops(void)
  * The following functions belong to the exported interface of AMD IOMMU
  *
  * This interface allows access to lower level functions of the IOMMU
- * like protection domain handling and assignement of devices to domains
+ * like protection domain handling and assignment of devices to domains
  * which is not possible with the dma_ops interface.
  *
  *****************************************************************************/
-- 
1.8.3



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
