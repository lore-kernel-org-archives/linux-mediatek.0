Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36531C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 05:59:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B96BF64F3E
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 05:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B96BF64F3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DzZxn4ejNJYo7gtHeJLM8xL83edVvK6nOEf6zBrpqA8=; b=h9A7o9Lhv8qnDUF7kChfZd/coU
	7byw04uT66nkFIEvYJJ0JafvjUXt215oMA97w5rkUhfETHb5MBR0+GQxa2ZayYU/utNw+ePbPYdfd
	DDKJtPyWJ1ISjQKZPs/vs8/u+hWQGq1lKz0l3Z8nX+yOoDVumjblXUyRlYGTLrX7/Kef4k3uBATWW
	vRrOAKS8/aGF5ok/VaC+wbrig6odvEi5TcQIQjkD61/vULHksaroO1E+1iK58/tT3HswSZ7eLX+9o
	o4ea0w95gW/l6W5k+X/5Ddh+6MMvTPXNR82kGMqcEA7I29IdP88pGS+T89tGrP7s1mr0aRI0ObeTR
	u41F2Slw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMPDG-002WMU-Um; Wed, 17 Mar 2021 05:59:23 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMPD4-002WKT-KQ; Wed, 17 Mar 2021 05:59:12 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso734074pjb.3; 
 Tue, 16 Mar 2021 22:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7kgTgl5Lk4YBTT/f5PQYaTPsw7lPuwKB6cHK7aX5OYo=;
 b=WFndP0xEksylxRu1x0rkdukJzOsVr49B7UZMVr6XrSDxUqwOuRZuhwphw8hFGE+RwZ
 U4O4ftdbJUeu8SCo3ZO/LWuWLosJgUOsLKUwlwUxjzsQVeTsvylN+yG0Xs8x89VFxFcA
 NG6u05wG1Spi0NJWQ3Ap3wg1UPM5bc5WvYd1eazQVu0ihm+NA2GOLqy9mKR2q5im4hsX
 jaiIvTTkkK848Wsh5qd7zeqKBiy1xRYxW+WUo8c+qVylmVJwKw0duZTGtx8l2egQkyUS
 bZFva9DBc+k186UcYy8kcv9iNy3W5HMN1SObCdKA1xSuLwsm5mmTG8TLuc2OckyN78+t
 sIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7kgTgl5Lk4YBTT/f5PQYaTPsw7lPuwKB6cHK7aX5OYo=;
 b=DYSY9b+6t6ORuhisQsea7Yx1H0cHHDKrtuPCplnP6Bzl5Q36rYBkC+iomFDm0eKniw
 uents68q0pfQ9FcSKY07IFXQT93WjaF9gun8EK8RVo6biIO65hX677MwGVY993ASBeK/
 f9nk5/vDbI6bb7uBaWsiWu7GCvVgxgTzBN3PasnVlbCiaJpEwOGzy2VilV9v3y9Pge8Z
 gFX26QOYenm98zRcujf63f5S3B27zuNu5eQTZ1YPJ+BzA4SYoGV2iScXD+XyDtRwNrMc
 32b8PQmEJvMQj1kmhITrrSodOrmDUi/1TOPEoRIhohWhI38PMT6A/KSSf+AbgDwiN60h
 bYyA==
X-Gm-Message-State: AOAM53018yLSc5NMUBO+mqwGaevIIwZZbpR5jwTUIp6Mbk6JHGpQ/9Sf
 1YYP0/lXK2gfNRkJMNYjsjg=
X-Google-Smtp-Source: ABdhPJwsKJU5jbmr5boZZ/qRk4PJh6dB6ozpqqeDldjX/NvpRpi8QwtkjDK9KiW7OyQEhWcyWKRrWw==
X-Received: by 2002:a17:90a:4b8c:: with SMTP id
 i12mr2810810pjh.76.1615960748099; 
 Tue, 16 Mar 2021 22:59:08 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:738f:1000::678])
 by smtp.gmail.com with ESMTPSA id i2sm16952169pgs.82.2021.03.16.22.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 22:59:07 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Chuanhong Guo <gch981213@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH] MIPS: ralink: mt7621: add memory detection support
Date: Tue, 16 Mar 2021 22:59:02 -0700
Message-Id: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_055911_085012_DF1BE693 
X-CRM114-Status: GOOD (  17.98  )
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

From: Chuanhong Guo <gch981213@gmail.com>

mt7621 has the following memory map:
0x0-0x1c000000: lower 448m memory
0x1c000000-0x2000000: peripheral registers
0x20000000-0x2400000: higher 64m memory

detect_memory_region in arch/mips/kernel/setup.c only adds the first
memory region and isn't suitable for 512m memory detection because
it may accidentally read the memory area for peripheral registers.

This commit adds memory detection capability for mt7621:
  1. Add the highmem area when 512m is detected.
  2. Guard memcmp from accessing peripheral registers:
     This only happens when a user decided to change kernel load address
     to 256m or higher address. Since this is a quite unusual case, we
     just skip 512m testing and return 256m as memory size.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Minor commit message reword, make mt7621_memory_detect static]
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/include/asm/mach-ralink/mt7621.h |  7 +++---
 arch/mips/ralink/common.h                  |  1 +
 arch/mips/ralink/mt7621.c                  | 29 +++++++++++++++++++---
 arch/mips/ralink/of.c                      |  2 ++
 4 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/mach-ralink/mt7621.h b/arch/mips/include/asm/mach-ralink/mt7621.h
index e1af1ba50bd8..6bbf082dd149 100644
--- a/arch/mips/include/asm/mach-ralink/mt7621.h
+++ b/arch/mips/include/asm/mach-ralink/mt7621.h
@@ -24,9 +24,10 @@
 #define CHIP_REV_VER_SHIFT		8
 #define CHIP_REV_ECO_MASK		0xf
 
-#define MT7621_DRAM_BASE                0x0
-#define MT7621_DDR2_SIZE_MIN		32
-#define MT7621_DDR2_SIZE_MAX		256
+#define MT7621_LOWMEM_BASE		0x0
+#define MT7621_LOWMEM_MAX_SIZE		0x1C000000
+#define MT7621_HIGHMEM_BASE		0x20000000
+#define MT7621_HIGHMEM_SIZE		0x4000000
 
 #define MT7621_CHIP_NAME0		0x3637544D
 #define MT7621_CHIP_NAME1		0x20203132
diff --git a/arch/mips/ralink/common.h b/arch/mips/ralink/common.h
index 4bc65b7a3241..113dca5ac129 100644
--- a/arch/mips/ralink/common.h
+++ b/arch/mips/ralink/common.h
@@ -17,6 +17,7 @@ struct ralink_soc_info {
 	unsigned long mem_size;
 	unsigned long mem_size_min;
 	unsigned long mem_size_max;
+	void (*mem_detect)(void);
 };
 extern struct ralink_soc_info soc_info;
 
diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index ca0ac607b0f3..d6616b0ad610 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -9,7 +9,9 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
+#include <linux/memblock.h>
 
+#include <asm/bootinfo.h>
 #include <asm/mipsregs.h>
 #include <asm/smp-ops.h>
 #include <asm/mips-cps.h>
@@ -49,6 +51,8 @@
 #define MT7621_GPIO_MODE_SDHCI_SHIFT	18
 #define MT7621_GPIO_MODE_SDHCI_GPIO	1
 
+static void *detect_magic __initdata = detect_memory_region;
+
 static struct rt2880_pmx_func uart1_grp[] =  { FUNC("uart1", 0, 1, 2) };
 static struct rt2880_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 3, 2) };
 static struct rt2880_pmx_func uart3_grp[] = {
@@ -110,6 +114,26 @@ phys_addr_t mips_cpc_default_phys_base(void)
 	panic("Cannot detect cpc address");
 }
 
+static void __init mt7621_memory_detect(void)
+{
+	void *dm = &detect_magic;
+	phys_addr_t size;
+
+	for (size = 32 * SZ_1M; size < 256 * SZ_1M; size <<= 1) {
+		if (!__builtin_memcmp(dm, dm + size, sizeof(detect_magic)))
+			break;
+	}
+
+	if ((size == 256 * SZ_1M) &&
+	    (CPHYSADDR(dm + size) < MT7621_LOWMEM_MAX_SIZE) &&
+	    __builtin_memcmp(dm, dm + size, sizeof(detect_magic))) {
+		memblock_add(MT7621_LOWMEM_BASE, MT7621_LOWMEM_MAX_SIZE);
+		memblock_add(MT7621_HIGHMEM_BASE, MT7621_HIGHMEM_SIZE);
+	} else {
+		memblock_add(MT7621_LOWMEM_BASE, size);
+	}
+}
+
 void __init ralink_of_remap(void)
 {
 	rt_sysc_membase = plat_of_remap_node("mtk,mt7621-sysc");
@@ -194,10 +218,7 @@ void prom_soc_init(struct ralink_soc_info *soc_info)
 		(rev >> CHIP_REV_VER_SHIFT) & CHIP_REV_VER_MASK,
 		(rev & CHIP_REV_ECO_MASK));
 
-	soc_info->mem_size_min = MT7621_DDR2_SIZE_MIN;
-	soc_info->mem_size_max = MT7621_DDR2_SIZE_MAX;
-	soc_info->mem_base = MT7621_DRAM_BASE;
-
+	soc_info->mem_detect = mt7621_memory_detect;
 	rt2880_pinmux_data = mt7621_pinmux_data;
 
 	soc_dev_init(soc_info, rev);
diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index 8286c3521476..0c5de07da097 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -78,6 +78,8 @@ void __init plat_mem_setup(void)
 	of_scan_flat_dt(early_init_dt_find_memory, NULL);
 	if (memory_dtb)
 		of_scan_flat_dt(early_init_dt_scan_memory, NULL);
+	else if (soc_info.mem_detect)
+		soc_info.mem_detect();
 	else if (soc_info.mem_size)
 		memblock_add(soc_info.mem_base, soc_info.mem_size * SZ_1M);
 	else
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
