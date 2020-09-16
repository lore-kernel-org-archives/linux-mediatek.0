Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CEEC43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 13:41:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CFEB22247
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 13:41:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bWSFmbeS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G6GxLqE+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CFEB22247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GNbSzjyPK792+jCZd7eOoMyReEOJXWp3Go60DDToEJ0=; b=bWSFmbeS0+sryaXQbz4/vzZ7R
	TygzMNauYeHlmd9MjYBegntJ9TXDoxCQCid25l5PxbXCorOdvu4HxU6QyZabkBWPOseoYsXv9clAV
	Eud66VyXS+EaxevjgfX3uuETUV21GEtnQkNljWUbBeHUiw2u/7DMBN0xdWMivBFMSAoAq1c1wknWy
	UH3oTWSeuwFNgPMdfMdzKrzP86LzLNyGNj1DXutFk9v+OSoY/b12Wg0i1lmY8FTyhV1rRMVGiCN9p
	Kl5ys04Q/8qwOWecWsF2dzIm2pwkzuHq0AFvFmM6iOAgDRQv3rGVWyITYIXQGHDpN3thEh8RA76VR
	tzQ/oxIMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIXga-0006DT-Nw; Wed, 16 Sep 2020 13:41:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIXgY-0006CU-1s; Wed, 16 Sep 2020 13:41:23 +0000
X-UUID: 1e8f0888a4c74a4bb8a83ff73d2f1938-20200916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BkNbMfMCtHSTLPIRTXVMYgSBeI9NJYXxpzZromyW7mk=; 
 b=G6GxLqE+1xGOhpzugERUel/cQOlB/91DW2mjX7HLEmdY0JxU5ZkFjRuemhc8nLIhANS1uig7zL7x+D05VDbkW8DDM61bb9SNn/auSbq+KbkDABXRIriu2l/HFegPa5+qWLH499moJS6hmDOc/Rzu85HW5/kqlCvQMIBGXqvi5S8=;
X-UUID: 1e8f0888a4c74a4bb8a83ff73d2f1938-20200916
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <phil.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1288083268; Wed, 16 Sep 2020 05:41:15 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Sep 2020 06:33:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Sep 2020 21:33:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Sep 2020 21:33:24 +0800
From: Phil Chang <phil.chang@mediatek.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] [PATCH] ARM64: Setup DMA32 zone size by bootargs
Date: Wed, 16 Sep 2020 21:33:24 +0800
Message-ID: <20200916133324.6280-1-phil.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200916083703.GA26411@infradead.org>
References: <20200916083703.GA26411@infradead.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_094122_289866_2A165FEC 
X-CRM114-Status: GOOD (  20.09  )
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

this patch allowing the DMA32 zone be configurable in ARM64.
For some devices, the main memory split into 2 part due to the memory
architecture, the efficient and less inefficient part.
One of the use case is fine-tune the dma32 size to contain all the
efficient part of memory block on this kind of architecture

Signed-off-by: Alix Wu <alix.wu@mediatek.com>
Signed-off-by: YJ Chiang <yj.chiang@mediatek.com>
Signed-off-by: Phil Chang <phil.chang@mediatek.com>
---
Hi

supplement the reason of this usage.

Thanks.

 .../admin-guide/kernel-parameters.txt         |  3 +++
 arch/arm64/include/asm/memory.h               |  2 ++
 arch/arm64/mm/init.c                          | 26 ++++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index bdc1f33fd3d1..ef3bc3d4931a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -980,6 +980,9 @@
 			The filter can be disabled or changed to another
 			driver later using sysfs.
 
+	dma32_size=nn[KMG]  [KNL,BOOT,ARM64]
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
index 481d22c32a2e..fd1b85e131cc 100644
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
@@ -189,7 +192,12 @@ static void __init reserve_elfcorehdr(void)
 static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
 {
 	phys_addr_t offset = memblock_start_of_DRAM() & GENMASK_ULL(63, zone_bits);
-	return min(offset + (1ULL << zone_bits), memblock_end_of_DRAM());
+	phys_addr_t zone_size = (1ULL << zone_bits);
+
+	if (IS_ENABLED(CONFIG_ZONE_DMA32) && zone_bits == 32 && dma32_zone_size)
+		zone_size = min(zone_size, dma32_zone_size);
+
+	return min(offset + zone_size, memblock_end_of_DRAM());
 }
 
 static void __init zone_sizes_init(unsigned long min, unsigned long max)
@@ -242,6 +250,22 @@ static int __init early_mem(char *p)
 }
 early_param("mem", early_mem);
 
+static int __init setup_dma32_zone(char *p)
+{
+	unsigned long long size = memparse(p, NULL);
+
+	/* DMA32 zone size should never grater than 4G */
+	if (size > SZ_4G)
+		return -EINVAL;
+
+	pr_notice("Setup dma32 zone size to %llu Mb\n", size >> 20);
+	dma32_zone_size = size;
+
+	return 0;
+}
+
+early_param("dma32_size", setup_dma32_zone);
+
 static int __init early_init_dt_scan_usablemem(unsigned long node,
 		const char *uname, int depth, void *data)
 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
