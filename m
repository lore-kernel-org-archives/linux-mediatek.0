Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C804AC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:54:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FA7220758
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:54:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T4zLNnXo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wLPAPYRw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FA7220758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRNcNK/dp4TvmI/Lq2L1MSGGCrIdP3hwY9uGFYzbgYg=; b=T4zLNnXoFUcahhRKcAmYwjwjGX
	fuZWo/zgqjI7d4uOp4twkHhvyT239aSn8oNooMcTPaC4FnStXBx3s0UMVI3jf/6I2+xFiiK3fC7M8
	o7dSSwO+SonOyxaoMQ2PGBtL1n2vlvCHlqh4FAPCywHEqcBD3e7TBRyU4kfxzhFXVPdFBJbO4iGsP
	BWYuA8oQ83XnULhV01dE/mPib3J42jg5pTI/FQpQaklwWsRbN49Gb4tgQShvxhdR0sX31BDp2jg8B
	821utXjVGZ24qYiPwsVed8zTVNHMnUkcYfDq9DCGKma6L5Wa4uKWqTw4RHG+TpH9jrww8dsBa4tCW
	ExgW6Xpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8SHm-0003bf-PW; Wed, 19 Aug 2020 17:54:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8SHe-0003YP-GA; Wed, 19 Aug 2020 17:53:59 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9AB2820758;
 Wed, 19 Aug 2020 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597859637;
 bh=REyX7sYO8cBj8Z4eVm4euOusP1EBARA9iuGH/ZQYyZQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=wLPAPYRwpltu3VW0bVUOD96vLGjXwrNSaz+RLccK+Phvh5dLo3t5bDRQiqQTrIVYd
 1pM8/WOpxVfWSEPmpUgYhUAYvJgRtYRZ6sa/6Wh+83LntvHVksz9n8XSLWzQBfA6Ut
 CeO+/5g+068DwMYaDArW+kDKTOchVtJ/TxaKUc14=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [RESEND PATCH 2/5] iommu: amd: Add missing function prototypes to fix
 -Wmissing-prototypes
Date: Wed, 19 Aug 2020 19:53:42 +0200
Message-Id: <20200819175345.20833-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819175345.20833-1-krzk@kernel.org>
References: <20200819175345.20833-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_135358_685314_1CF46102 
X-CRM114-Status: GOOD (  14.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Few exported functions from AMD IOMMU driver are missing prototypes.
They have declaration in arch/x86/events/amd/iommu.h but this file
cannot be included in the driver.  Add prototypes to fix W=1 warnings
like:

    drivers/iommu/amd/init.c:3066:19: warning:
        no previous prototype for 'get_amd_iommu' [-Wmissing-prototypes]
     3066 | struct amd_iommu *get_amd_iommu(unsigned int idx)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iommu/amd/amd_iommu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iommu/amd/amd_iommu.h b/drivers/iommu/amd/amd_iommu.h
index 57309716fd18..0781b7112467 100644
--- a/drivers/iommu/amd/amd_iommu.h
+++ b/drivers/iommu/amd/amd_iommu.h
@@ -41,6 +41,15 @@ extern int amd_iommu_guest_ir;
 struct iommu_domain;
 
 extern bool amd_iommu_v2_supported(void);
+extern struct amd_iommu *get_amd_iommu(unsigned int idx);
+extern u8 amd_iommu_pc_get_max_banks(unsigned int idx);
+extern bool amd_iommu_pc_supported(void);
+extern u8 amd_iommu_pc_get_max_counters(unsigned int idx);
+extern int amd_iommu_pc_get_reg(struct amd_iommu *iommu, u8 bank, u8 cntr,
+				u8 fxn, u64 *value);
+extern int amd_iommu_pc_set_reg(struct amd_iommu *iommu, u8 bank, u8 cntr,
+				u8 fxn, u64 *value);
+
 extern int amd_iommu_register_ppr_notifier(struct notifier_block *nb);
 extern int amd_iommu_unregister_ppr_notifier(struct notifier_block *nb);
 extern void amd_iommu_domain_direct_map(struct iommu_domain *dom);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
