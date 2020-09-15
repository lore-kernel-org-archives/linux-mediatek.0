Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CF0C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:13:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6255C20738
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iisfx9Y8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Kj6kxhbj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6255C20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y7hm2PtQ9vfB4Yv4Ktv5EHuGkgiMMBMWIfbQl8BS1Io=; b=iisfx9Y8JCRWErVhiyumyNbGKj
	8h9+rm4JEb2hep8ONC24DxQ6YBH+6v0URtsFdSpOdR84lLYtwivLhkAtXYHOE/ty2epmG6D5SO+Mz
	Te4hWMpu5Y2NPtlUI4ro9yW+D8nvuj1OMU+W7WVIMZo8cY2E/nJ4JLY4jT29Bw5tK7kPCr8xmtlaC
	18g6lpQd+I/E1iINVnYedauj4Tw8TR7Hwo8uwqifEOUsl0LeHsBhxyHX0j8gGMGfmcDmS8lQSnLC1
	DzndiDvvP0RPe9NR+XBevMeLAieBSOoY6WUztdUpsKZUKbzOkvySfKRaHq6RuJ9Uk9jW5E3r2HDXT
	AmdliweQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICeD-0006Cg-KT; Tue, 15 Sep 2020 15:13:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICeA-0006Bf-Ul; Tue, 15 Sep 2020 15:13:32 +0000
X-UUID: 005cd3cd3e924162b9c28fff639c20ad-20200915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jhf6yLptTYEHUoTCMmm0pLT8bnD4HjopGFob8vx8D34=; 
 b=Kj6kxhbjLoLLe7pFkjCBrvOicQRpkJpRlZEj3SSLp+6fVHBzABbhrK2/XevAZn0VZWp5HsBmZa11Kol6VEZ+expo+xMd1HkIz5fsCsXCYF/S0BQY+drze08V/lN6r8IDcBB7PwzyYohofHfMk/UwauJbqF4XgRg8YDEkCa9+IAY=;
X-UUID: 005cd3cd3e924162b9c28fff639c20ad-20200915
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <phil.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1474479456; Tue, 15 Sep 2020 07:09:01 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Sep 2020 08:08:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Sep 2020 23:08:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Sep 2020 23:08:56 +0800
From: Phil Chang <phil.chang@mediatek.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] [PATCH] ARM64: Setup DMA32 zone size by bootargs
Date: Tue, 15 Sep 2020 23:08:55 +0800
Message-ID: <20200915150855.24825-1-phil.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_111331_118128_37403A64 
X-CRM114-Status: GOOD (  18.34  )
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
 linux-doc@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 YJ Chiang <yj.chiang@mediatek.com>, Jonathan Corbet <corbet@lwn.net>,
 Phil Chang <phil.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Allowing the DMA32 zone be configurable in ARM64 but at most 4Gb.

Signed-off-by: Alix Wu <alix.wu@mediatek.com>
Signed-off-by: YJ Chiang <yj.chiang@mediatek.com>
Signed-off-by: Phil Chang <phil.chang@mediatek.com>
---

 .../admin-guide/kernel-parameters.txt         |  3 ++
 arch/arm64/include/asm/memory.h               |  2 +
 arch/arm64/mm/init.c                          | 39 +++++++++++++++++--
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index bdc1f33fd3d1..5be6259e9ba8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -980,6 +980,9 @@
 			The filter can be disabled or changed to another
 			driver later using sysfs.
 
+	dma32_size=nn[MG]  [KNL,BOOT,ARM64]
+			Forces the DMA32 zone size of <nn> in MB.
+
 	driver_async_probe=  [KNL]
 			List of driver names to be probed asynchronously.
 			Format: <driver_name1>,<driver_name2>...
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index afa722504bfd..710de08ae8ae 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -175,6 +175,8 @@ extern u64			kimage_vaddr;
 /* the offset between the kernel virtual and physical mappings */
 extern u64			kimage_voffset;
 
+extern phys_addr_t		dma32_zone_size;
+
 static inline unsigned long kaslr_offset(void)
 {
 	return kimage_vaddr - KIMAGE_VADDR;
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 481d22c32a2e..c8af53680d46 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -60,6 +60,9 @@ EXPORT_SYMBOL(physvirt_offset);
 struct page *vmemmap __ro_after_init;
 EXPORT_SYMBOL(vmemmap);
 
+phys_addr_t dma32_zone_size __ro_after_init;
+EXPORT_SYMBOL(dma32_zone_size);
+
 /*
  * We create both ZONE_DMA and ZONE_DMA32. ZONE_DMA covers the first 1G of
  * memory as some devices, namely the Raspberry Pi 4, have peripherals with
@@ -242,6 +245,29 @@ static int __init early_mem(char *p)
 }
 early_param("mem", early_mem);
 
+static int __init setup_dma32_zone(char *p)
+{
+	u64 size;
+
+	if (!p)
+		return -EINVAL;
+
+	if (kstrtoull(p, 0, &size))
+		return -EINVAL;
+
+	/* DMA32 zone size should never grater than 4G */
+	if (size > max_zone_phys(32) / SZ_1M)
+		return -EINVAL;
+
+	pr_notice("Setup dma32 zone size to %llu Mb\n", size);
+
+	dma32_zone_size = size * SZ_1M;
+
+	return 0;
+}
+
+early_param("dma32_size", setup_dma32_zone);
+
 static int __init early_init_dt_scan_usablemem(unsigned long node,
 		const char *uname, int depth, void *data)
 {
@@ -392,10 +418,17 @@ void __init arm64_memblock_init(void)
 		arm64_dma_phys_limit = max_zone_phys(ARM64_ZONE_DMA_BITS);
 	}
 
-	if (IS_ENABLED(CONFIG_ZONE_DMA32))
-		arm64_dma32_phys_limit = max_zone_phys(32);
-	else
+	if (IS_ENABLED(CONFIG_ZONE_DMA32)) {
+		if (dma32_zone_size) {
+			arm64_dma32_phys_limit = min(max_zone_phys(32),
+				dma32_zone_size + memblock_start_of_DRAM());
+		} else {
+			arm64_dma32_phys_limit = max_zone_phys(32);
+			dma32_zone_size = arm64_dma32_phys_limit;
+		}
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
