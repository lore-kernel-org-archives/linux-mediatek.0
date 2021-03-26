Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C8AC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 06:27:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5CC961A3F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 06:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5CC961A3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZvdSKvKIaPqje5upzOdNSRzrk845weZ8KbbryNZVj2k=; b=S3pYxWoAhgUWJwlPiMZzzzZPo
	W+abnKptHK8mEFi99DH+fSTIiRqML5dZlLl7FpW2PVjdYu9eyOUrFd1wVCSehXBZVxhbhPyhwn5U8
	luaMwb4BJiE+VR/oDkyX2//q6UcpRXAYZd9/KhmnvMnMd/uRNvvpUczTmjA2VSzbs3k1/tXrj0k5V
	/gbyL/oomBl3nrBU7sVbVAGR1uNp3lKTZ+u+F5xRAUTWisw1O5KYrEQsta0ubAKCOyjCicqJzTyrn
	qZtSAevFmB3hCSCvy8G2I0N11h7fIKIozSmtcrJOjB/AU3aU87wIRJaMJj7ALsU3ZFPA0riUELtvi
	Klj69Cy+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPfwe-002s4Z-3Q; Fri, 26 Mar 2021 06:27:44 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPfuj-002rJn-HL; Fri, 26 Mar 2021 06:25:50 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6BkR0RpgzyP0l;
 Fri, 26 Mar 2021 14:23:43 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 14:25:34 +0800
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
Subject: [PATCH 8/8] iommu/vt-d: fix a couple of spelling mistakes
Date: Fri, 26 Mar 2021 14:24:12 +0800
Message-ID: <20210326062412.1262-9-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210326062412.1262-1-thunder.leizhen@huawei.com>
References: <20210326062412.1262-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_062548_690026_32FA50D6 
X-CRM114-Status: GOOD (  14.78  )
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
guarentees ==> guarantees
resgister ==> register
insufficent ==> insufficient
creats ==> creates
tabke ==> take

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/iommu/intel/dmar.c          | 6 +++---
 drivers/iommu/intel/iommu.c         | 2 +-
 drivers/iommu/intel/irq_remapping.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index d5c51b5c20aff4b..bb6f0880f6f4db0 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -45,7 +45,7 @@ struct dmar_res_callback {
 
 /*
  * Assumptions:
- * 1) The hotplug framework guarentees that DMAR unit will be hot-added
+ * 1) The hotplug framework guarantees that DMAR unit will be hot-added
  *    before IO devices managed by that unit.
  * 2) The hotplug framework guarantees that DMAR unit will be hot-removed
  *    after IO devices managed by that unit.
@@ -960,10 +960,10 @@ static void unmap_iommu(struct intel_iommu *iommu)
 /**
  * map_iommu: map the iommu's registers
  * @iommu: the iommu to map
- * @phys_addr: the physical address of the base resgister
+ * @phys_addr: the physical address of the base register
  *
  * Memory map the iommu's registers.  Start w/ a single page, and
- * possibly expand if that turns out to be insufficent.
+ * possibly expand if that turns out to be insufficient.
  */
 static int map_iommu(struct intel_iommu *iommu, u64 phys_addr)
 {
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index ee0932307d646bb..f9a2277fba99f9f 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -288,7 +288,7 @@ static inline void context_clear_entry(struct context_entry *context)
 
 /*
  * This domain is a statically identity mapping domain.
- *	1. This domain creats a static 1:1 mapping to all usable memory.
+ *	1. This domain creates a static 1:1 mapping to all usable memory.
  * 	2. It maps to each iommu if successful.
  *	3. Each iommu mapps to this domain if successful.
  */
diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index 611ef5243cb63b9..12e9f2cf84e5101 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -74,7 +74,7 @@ struct intel_ir_data {
  *	->iommu->register_lock
  * Note:
  * intel_irq_remap_ops.{supported,prepare,enable,disable,reenable} are called
- * in single-threaded environment with interrupt disabled, so no need to tabke
+ * in single-threaded environment with interrupt disabled, so no need to take
  * the dmar_global_lock.
  */
 DEFINE_RAW_SPINLOCK(irq_2_ir_lock);
-- 
1.8.3



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
