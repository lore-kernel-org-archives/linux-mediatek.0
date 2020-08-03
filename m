Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432A2C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 14:37:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F8AA2076E
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 14:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nnOe4ALo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="soMN2V8o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F8AA2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q6dK9VgFdYFwSZWTBqVZfGOWnPy1KPEHHXUPW2UY6ls=; b=nnOe4ALonqZ6Tf+HW59aK7G9KO
	cTqCsOkAPLnVezrsTC9J0KNUkN7LIGIVi2vMuaCIcbD9lyHb3oQuYCCunPOB2qOwGbOcr9ohZDGtp
	jiianpwaxO9WReznQx+uvRIVpwL4NUEMvWLAIk5KYBVJ/qtuUatS3H/eyVbw5CX3Lj+kbKvDyQ4BC
	DmKlesQRlxQXmLI7PfJbNzVKfnhkz2O0Bot2J/Ce7ngjuIeAG1uQug7kh2sctlaPCQXOYhq5KeU4Y
	NIPEe9IllFaF3sDAz5OuAKIqXV5a1kd115GIgcvtENjrTjLNeou5ajSOtgrM8puiRmnz51yBy8vaI
	vksfr1vA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2bac-0004GW-O8; Mon, 03 Aug 2020 14:37:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2baa-0004Eb-6I; Mon, 03 Aug 2020 14:37:21 +0000
X-UUID: 479bdfdc42854687b8871e70c88ddba2-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nsGyLTdk49+hu3aL4BVtR/HEa0bcGywBTHa+PUZ1YqE=; 
 b=soMN2V8oCtOYFsNZRwJX/U4PQ3sBu5MK9fDDTZU6gZvBck5BZsSRL/+E4Tem3kBRlQ7tfwn+FW1dJYIAZhc6ArtGd+m6PRcpLwZr+dFzZOX2UWpTP9WiAban1Tq4wpvvFypW6Laq6AqTzET4K/wpiTfdUc28GlGOYGGHG22lNuE=;
X-UUID: 479bdfdc42854687b8871e70c88ddba2-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <phil.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1156730549; Mon, 03 Aug 2020 06:36:49 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 07:26:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 22:26:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Aug 2020 22:26:49 +0800
From: Phil Chang <phil.chang@mediatek.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] ARM64: Setup DMA32 zone size by bootargs
Date: Mon, 3 Aug 2020 22:26:47 +0800
Message-ID: <20200803142647.16737-1-phil.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 62935B82062BCF856BA87E395D17F26700271321499917426F984D3EA0F62E462000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_103720_437058_6F299C01 
X-CRM114-Status: GOOD (  19.80  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alix Wu <alix.wu@mediatek.com>,
 linux-doc@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, Steve
 Capper <steve.capper@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 YJ Chiang <yj.chiang@mediatek.com>, Jonathan Corbet <corbet@lwn.net>, Phil
 Chang <phil.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

this patch allowing the arm64 DMA zone be configurable.

Signed-off-by: Alix Wu <alix.wu@mediatek.com>
Signed-off-by: YJ Chiang <yj.chiang@mediatek.com>
Signed-off-by: Phil Chang <phil.chang@mediatek.com>
---
Hi

For some devices, the main memory split into 2 part due to the memory architecture,
the efficient and less inefficient part.
One of the use case is fine-tune the dma32 size to contain all the
efficient part of memory block on this kind of architecture,
but in general, the DMA32 zone size is hardcode to 4G.

 .../admin-guide/kernel-parameters.txt         |  3 ++
 arch/arm64/include/asm/memory.h               |  2 ++
 arch/arm64/mm/init.c                          | 33 +++++++++++++++++--
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb95fad81c79..441ad3cb8ee8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -956,6 +956,9 @@
 			The filter can be disabled or changed to another
 			driver later using sysfs.
 
+	dma32_zone=nn	[KMG] [KNL,BOOT]
+			Forces the DMA32 zone size of <nn> in mb, arm64 only.
+
 	driver_async_probe=  [KNL]
 			List of driver names to be probed asynchronously.
 			Format: <driver_name1>,<driver_name2>...
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index a1871bb32bb1..377f2252618a 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -174,6 +174,8 @@ extern u64			kimage_vaddr;
 /* the offset between the kernel virtual and physical mappings */
 extern u64			kimage_voffset;
 
+extern phys_addr_t		arm_dma_zone_size;
+
 static inline unsigned long kaslr_offset(void)
 {
 	return kimage_vaddr - KIMAGE_VADDR;
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 1e93cfc7c47a..642ab323392c 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -60,6 +60,9 @@ EXPORT_SYMBOL(physvirt_offset);
 struct page *vmemmap __ro_after_init;
 EXPORT_SYMBOL(vmemmap);
 
+phys_addr_t arm_dma_zone_size __ro_after_init;
+EXPORT_SYMBOL(arm_dma_zone_size);
+
 /*
  * We create both ZONE_DMA and ZONE_DMA32. ZONE_DMA covers the first 1G of
  * memory as some devices, namely the Raspberry Pi 4, have peripherals with
@@ -242,6 +245,25 @@ static int __init early_mem(char *p)
 }
 early_param("mem", early_mem);
 
+/*
+ * Setup the dma32 zone size
+ */
+static int __init setup_dma32_zone(char *p)
+{
+	if (!p)
+		return -EINVAL;
+
+	if (kstrtoull(p, 0, &arm_dma_zone_size))
+		return -EINVAL;
+
+	arm_dma_zone_size *= SZ_1M;
+	pr_notice("Setup dma32 zone size to %llu Mb\n", arm_dma_zone_size);
+
+	return 0;
+}
+
+early_param("dma32_zone", setup_dma32_zone);
+
 static int __init early_init_dt_scan_usablemem(unsigned long node,
 		const char *uname, int depth, void *data)
 {
@@ -392,10 +414,15 @@ void __init arm64_memblock_init(void)
 		arm64_dma_phys_limit = max_zone_phys(ARM64_ZONE_DMA_BITS);
 	}
 
-	if (IS_ENABLED(CONFIG_ZONE_DMA32))
-		arm64_dma32_phys_limit = max_zone_phys(32);
-	else
+	if (IS_ENABLED(CONFIG_ZONE_DMA32)) {
+		if (arm_dma_zone_size)
+			arm64_dma32_phys_limit = arm_dma_zone_size +
+						memblock_start_of_DRAM();
+		else
+			arm64_dma32_phys_limit = max_zone_phys(32);
+	} else {
 		arm64_dma32_phys_limit = PHYS_MASK + 1;
+	}
 
 	reserve_crashkernel();
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
