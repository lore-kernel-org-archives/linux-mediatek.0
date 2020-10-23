Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B73C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:27:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F412192A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:27:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eOrcv7BH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="erwrWHQN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F412192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TbCHWMIScTUwFFWWAn2t6JxCr0t3tAnd1LpGAwtKOL0=; b=eOrcv7BH65sBdrfIheo8r3laz
	5Nux6ZUcE9+DMbBRQuozo0ltDU4mrHj4m1gh+OsEWsbNrB9WEVu3JMTwOxYLPViyx1eAAmDK1gDxS
	mjy7Bs0ifqNogm8ta9Y53UclSueB+1/ofIRXY0mcLZ8MXj2mBK9sistRCa00qKwiuSbEd2QgJUa65
	T/Nf+r0cU6C7vJk3pxJ67V7byuI5IZwXrPt7cHrf6xmfastyzMncKAgTZx4UvAIivDa8OeggLjC90
	C3isjW9Amtz8OdisW3aWmUDDtc91Sfi+O5ghnZnTXDFkelB1wai6zNVZJM9m8/RizLogGt793VZTT
	+0O53nX+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVtMF-0001i1-Q8; Fri, 23 Oct 2020 09:27:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVtM2-0001bV-3j; Fri, 23 Oct 2020 09:27:24 +0000
X-UUID: b4890bf064214b3eb1f2b632cbd10bf1-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NJ00D3ADH+TaQiR+vIP4cEWpTaYnE61vqjYFfO4icjA=; 
 b=erwrWHQN9DIYmDmMLyKJXJVX6fR1fFbSe0DNHi/RXcbrn05LGP/TCEfeuLbnzYxTYmMxhNoEYu158CXlHuKUnvY6Smq6UvvLdZM4DXFMnoi81kF3B9CukEiKHQN55RKhtY+DW5ZjWINb+urcEELAiDlbTVA8JP/i2/IEYmvl01Y=;
X-UUID: b4890bf064214b3eb1f2b632cbd10bf1-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1411791551; Fri, 23 Oct 2020 01:25:10 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 02:15:07 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 17:14:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Oct 2020 17:14:54 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Russell King
 <linux@armlinux.org.uk>, Minchan Kim <minchan@kernel.org>
Subject: [PATCH v2 1/4] arm: mm: use strict p[gum]d types
Date: Fri, 23 Oct 2020 17:14:34 +0800
Message-ID: <20201023091437.8225-2-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201023091437.8225-1-miles.chen@mediatek.com>
References: <20201023091437.8225-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_052722_301200_023E12E1 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When use mm/gup.c, it is necessary to use strict p*d types.
Otherwise, we will get build breaks such as:

mm/gup.c:2589:9: error: incompatible pointer types passing 'pmdval_t **'
(aka 'unsigned int **') to parameter of type 'pgd_t *'
(aka 'pmdval_t (*)[2]') [-Werror,-Wincompatible-pointer-types]
mm/gup.c:2616:9: error: array initializer must be an initializer list

Fix some types errors in fixmap.h after using strict types.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 arch/arm/include/asm/fixmap.h               |  6 ++---
 arch/arm/include/asm/pgtable-2level-types.h | 26 ---------------------
 arch/arm/include/asm/pgtable-2level.h       |  1 +
 3 files changed, 4 insertions(+), 29 deletions(-)

diff --git a/arch/arm/include/asm/fixmap.h b/arch/arm/include/asm/fixmap.h
index fc56fc3e1931..3ea12b2da708 100644
--- a/arch/arm/include/asm/fixmap.h
+++ b/arch/arm/include/asm/fixmap.h
@@ -42,11 +42,11 @@ static const enum fixed_addresses __end_of_fixed_addresses =
 
 #define FIXMAP_PAGE_COMMON	(L_PTE_YOUNG | L_PTE_PRESENT | L_PTE_XN | L_PTE_DIRTY)
 
-#define FIXMAP_PAGE_NORMAL	(pgprot_kernel | L_PTE_XN)
-#define FIXMAP_PAGE_RO		(FIXMAP_PAGE_NORMAL | L_PTE_RDONLY)
+#define FIXMAP_PAGE_NORMAL	__pgprot(pgprot_val(pgprot_kernel) | L_PTE_XN)
+#define FIXMAP_PAGE_RO		__pgprot(pgprot_val(FIXMAP_PAGE_NORMAL) | L_PTE_RDONLY)
 
 /* Used by set_fixmap_(io|nocache), both meant for mapping a device */
-#define FIXMAP_PAGE_IO		(FIXMAP_PAGE_COMMON | L_PTE_MT_DEV_SHARED | L_PTE_SHARED)
+#define FIXMAP_PAGE_IO		__pgprot(FIXMAP_PAGE_COMMON | L_PTE_MT_DEV_SHARED | L_PTE_SHARED)
 #define FIXMAP_PAGE_NOCACHE	FIXMAP_PAGE_IO
 
 #define __early_set_fixmap	__set_fixmap
diff --git a/arch/arm/include/asm/pgtable-2level-types.h b/arch/arm/include/asm/pgtable-2level-types.h
index 650e793f4142..64fd5b8d9dc2 100644
--- a/arch/arm/include/asm/pgtable-2level-types.h
+++ b/arch/arm/include/asm/pgtable-2level-types.h
@@ -12,12 +12,6 @@
 typedef u32 pteval_t;
 typedef u32 pmdval_t;
 
-#undef STRICT_MM_TYPECHECKS
-
-#ifdef STRICT_MM_TYPECHECKS
-/*
- * These are used to make use of C type-checking..
- */
 typedef struct { pteval_t pte; } pte_t;
 typedef struct { pmdval_t pmd; } pmd_t;
 typedef struct { pmdval_t pgd[2]; } pgd_t;
@@ -32,24 +26,4 @@ typedef struct { pteval_t pgprot; } pgprot_t;
 #define __pmd(x)        ((pmd_t) { (x) } )
 #define __pgprot(x)     ((pgprot_t) { (x) } )
 
-#else
-/*
- * .. while these make it easier on the compiler
- */
-typedef pteval_t pte_t;
-typedef pmdval_t pmd_t;
-typedef pmdval_t pgd_t[2];
-typedef pteval_t pgprot_t;
-
-#define pte_val(x)      (x)
-#define pmd_val(x)      (x)
-#define pgd_val(x)	((x)[0])
-#define pgprot_val(x)   (x)
-
-#define __pte(x)        (x)
-#define __pmd(x)        (x)
-#define __pgprot(x)     (x)
-
-#endif /* STRICT_MM_TYPECHECKS */
-
 #endif	/* _ASM_PGTABLE_2LEVEL_TYPES_H */
diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index 3502c2f746ca..27a8635abea0 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -180,6 +180,7 @@
 #define pud_none(pud)		(0)
 #define pud_bad(pud)		(0)
 #define pud_present(pud)	(1)
+#define pud_page(pud)		pmd_page(__pmd(pud_val(pud)))
 #define pud_clear(pudp)		do { } while (0)
 #define set_pud(pud,pudp)	do { } while (0)
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
