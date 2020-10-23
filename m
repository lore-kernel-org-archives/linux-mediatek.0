Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0571C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:28:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 691322225F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:28:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z01sLX6O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cbvsxBAD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 691322225F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MM036lR7NuDEELpZYo/ki1Dk5h5lMeqBTtgHi1ooB5k=; b=Z01sLX6OWZ4TMjG/66TDaVPn6
	pTmF7MCTWixR0A4f1bvQ9zrArD7EIZoEgfMK/nZvec5EsTexTciVU+FNU3PacI7a6Y1xlODXET7RH
	v8XcQGeezNjERy6oNi9tlPuuis/p2q9jRlYBxoxqztXjDoOeZz2kpAKcG/gCCjRig4gpLR7nVuyxB
	6jJJOX2UXs4smuLXk4Wo1sQiIQB/zH/Qs26g2XIXRlo2H1ucy9+y6df7agEFzmZyKRsxn1i8qpEPV
	0t8fDwAjP0k4yzvbTQhAYpHG+fC+1dmEIrJXN716GusQgWPTmQW8ak6I87VVWpLDqR8ZOzW+y7KSS
	uvbyf3jeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVtMV-0001np-1K; Fri, 23 Oct 2020 09:27:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVtM4-0001bV-LG; Fri, 23 Oct 2020 09:27:26 +0000
X-UUID: 93b0baf5a4034c79a4c618581ff9916f-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LFxbOOl0A2kIOyhu8/sycF3YNV75YE/93bSFD6Yl2wM=; 
 b=cbvsxBADek+rvwMG6nw5Cl1r9TQWXhoelUI++NbYbnZG5y7wboSjIEh8Heiu48V8DlH6SRcBUDM6FBVOziUGgi49VDgmPGYcyOqTDvA8H8yvvV8OZsq9KNdYb0GniXp7Hfvxgpk+m0QaOIuyhfsRdnWqCVSzTiQdO89edhrCqNc=;
X-UUID: 93b0baf5a4034c79a4c618581ff9916f-20201023
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1981476347; Fri, 23 Oct 2020 01:14:58 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 02:14:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 17:14:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Oct 2020 17:14:54 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Russell King
 <linux@armlinux.org.uk>, Minchan Kim <minchan@kernel.org>
Subject: [PATCH v2 3/4] arm: mm: introduce L_PTE_SPECIAL
Date: Fri, 23 Oct 2020 17:14:36 +0800
Message-ID: <20201023091437.8225-4-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201023091437.8225-1-miles.chen@mediatek.com>
References: <20201023091437.8225-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_052724_900373_55EE228F 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: Steve Capper <steve.capper@linaro.org>, wsd_upstream@mediatek.com, Will
 Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Suren
 Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Minchan Kim <minchan@kernel.org>

This patch introduces L_PTE_SPECIAL and pte functions for supporting
get_user_pages_fast.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Steve Capper <steve.capper@linaro.org>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 arch/arm/Kconfig                      |  4 ++--
 arch/arm/include/asm/pgtable-2level.h |  1 +
 arch/arm/include/asm/pgtable-3level.h |  6 ------
 arch/arm/include/asm/pgtable.h        | 13 +++++++++++++
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index c18fa9d382b7..1f75864b7c7a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -13,7 +13,7 @@ config ARM
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
-	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
+	select ARCH_HAS_PTE_SPECIAL if (ARM_LPAE || CPU_V7 || CPU_V6 || CPUV6K)
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_MEMORY
@@ -82,7 +82,7 @@ config ARM
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS if (CPU_V6 || CPU_V6K || CPU_V7) && MMU
 	select HAVE_EXIT_THREAD
-	select HAVE_FAST_GUP if ARM_LPAE
+	select HAVE_FAST_GUP if (ARM_LPAE || CPU_V7 || CPU_V6 || CPUV6K)
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER if !THUMB2_KERNEL && !CC_IS_CLANG
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index cdcd55cca37d..385e7a32394e 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -117,6 +117,7 @@
 #define L_PTE_VALID		(_AT(pteval_t, 1) << 0)		/* Valid */
 #define L_PTE_PRESENT		(_AT(pteval_t, 1) << 0)
 #define L_PTE_YOUNG		(_AT(pteval_t, 1) << 1)
+#define L_PTE_SPECIAL		(_AT(pteval_t, 1) << 5)
 #define L_PTE_DIRTY		(_AT(pteval_t, 1) << 6)
 #define L_PTE_RDONLY		(_AT(pteval_t, 1) << 7)
 #define L_PTE_USER		(_AT(pteval_t, 1) << 8)
diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index fbb6693c3352..46fcc6725d3e 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -175,12 +175,6 @@ static inline pmd_t *pud_page_vaddr(pud_t pud)
 
 #define pmd_present(pmd)	(pmd_isset((pmd), L_PMD_SECT_VALID))
 #define pmd_young(pmd)		(pmd_isset((pmd), PMD_SECT_AF))
-#define pte_special(pte)	(pte_isset((pte), L_PTE_SPECIAL))
-static inline pte_t pte_mkspecial(pte_t pte)
-{
-	pte_val(pte) |= L_PTE_SPECIAL;
-	return pte;
-}
 
 #define pmd_write(pmd)		(pmd_isclear((pmd), L_PMD_SECT_RDONLY))
 #define pmd_dirty(pmd)		(pmd_isset((pmd), L_PMD_SECT_DIRTY))
diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index c02f24400369..4092154ca779 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -195,6 +195,11 @@ static inline pte_t *pmd_page_vaddr(pmd_t pmd)
 #define pte_dirty(pte)		(pte_isset((pte), L_PTE_DIRTY))
 #define pte_young(pte)		(pte_isset((pte), L_PTE_YOUNG))
 #define pte_exec(pte)		(pte_isclear((pte), L_PTE_XN))
+#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
+#define pte_special(pte)	(pte_isset((pte), L_PTE_SPECIAL))
+#else
+#define pte_special(pte)	(0)
+#endif
 
 #define pte_valid_user(pte)	\
 	(pte_valid(pte) && pte_isset((pte), L_PTE_USER) && pte_young(pte))
@@ -274,6 +279,14 @@ static inline pte_t pte_mknexec(pte_t pte)
 	return set_pte_bit(pte, __pgprot(L_PTE_XN));
 }
 
+#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
+static inline pte_t pte_mkspecial(pte_t pte)
+{
+	return set_pte_bit(pte, __pgprot(L_PTE_SPECIAL));
+}
+#else
+static inline pte_t pte_mkspecial(pte_t pte) { return pte; }
+#endif
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
 	const pteval_t mask = L_PTE_XN | L_PTE_RDONLY | L_PTE_USER |
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
