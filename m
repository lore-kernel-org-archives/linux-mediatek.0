Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B520EC388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:27:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 078ED20770
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GsxtFtx1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aWGzMDSn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 078ED20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/NkR8c1bN4d315lvUO7mh+K/uG144uGda+Yp50qPdc0=; b=GsxtFtx1Te4RKrYgNKggddbQJ
	c0DA/UXJo2l3WLdqyex20aA4cwnax9ttxcukgtq+KFW7gDXgGR4aKFDqVesmYDKBFhfYguv8DXQKj
	2YL3dQpjfsuJPozPeGz5L/usurysFxSKswWGNk6eEcLGMiGiCcUgrk7A9Y/44GXMQs7ZwJsjXO7mZ
	IoFjjpDzh74V8F9WCPKnXD+/Xo+Cx1zmaIJVpnMgmlrP7x1nYKgaIO4iS8OY9qTNv+Nr+ZhMywpIo
	wLsXHz/iv2MY3x0yowxouY+R+UG+VLHbw+9sAm3WIDqNfClJw+hTP2kK4cRmk280NtmN77Ghh5A4e
	dCNih2pzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVtM4-0001dK-J6; Fri, 23 Oct 2020 09:27:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVtM1-0001bS-Jv; Fri, 23 Oct 2020 09:27:22 +0000
X-UUID: 14f800cd2d0544d6b56c82c3aa63ae36-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BR60j2F54p2pGcLrRVjIn/yPVbDNmaSCHOH23EULGII=; 
 b=aWGzMDSnvY6a3HhH+Y3/wjSuQLfNTMZx/CLd7uersbcqTnJONkSdQ6VLGmBt1D0FVz2TSp/0q5hMvYNGr7uJPrGuHQrK1lRl2SnaAQaCZTNzuBFDgriAlc+FlZmydJoaldG6m7eUCbeG+fEpVUpMLXWw2FlEZAOKpVTrGYgwNNI=;
X-UUID: 14f800cd2d0544d6b56c82c3aa63ae36-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1426969810; Fri, 23 Oct 2020 01:20:52 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 02:15:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 17:14:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Oct 2020 17:14:54 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Russell King
 <linux@armlinux.org.uk>, Minchan Kim <minchan@kernel.org>
Subject: [PATCH v2 4/4] arm: replace vector mem type with read-only type
Date: Fri, 23 Oct 2020 17:14:37 +0800
Message-ID: <20201023091437.8225-5-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201023091437.8225-1-miles.chen@mediatek.com>
References: <20201023091437.8225-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E8A464A3D2B693A78F39320912CA98801136E8EB1B1EEC0E5212E5D3E01CC5D02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_052721_859403_97732250 
X-CRM114-Status: GOOD (  19.70  )
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

Since kernel no longer writes to the vector, try to replace
the vector mem type with read-only type and remove L_PTE_MT_VECTORS.

from Catalin in [1]:
"
> I don't think this matters since the kernel no longer writes to the
> vectors page at run-time but it needs cleaning up a bit (and testing in
> case I missed something). IOW, do we still need a dedicated mapping type
> for the vectors or we can simply use the read-only user page attributes?
"

[1] https://lore.kernel.org/patchwork/patch/986574/

Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 arch/arm/include/asm/pgtable-2level.h | 1 -
 arch/arm/mm/mmu.c                     | 7 +++----
 arch/arm/mm/proc-macros.S             | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index 385e7a32394e..438359d3675f 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -163,7 +163,6 @@
 #define L_PTE_MT_WRITETHROUGH	(_AT(pteval_t, 0x02) << 2)	/* 0010 */
 #define L_PTE_MT_WRITEBACK	(_AT(pteval_t, 0x03) << 2)	/* 0011 */
 #define L_PTE_MT_DEV_SHARED	(_AT(pteval_t, 0x04) << 2)	/* 0100 */
-#define L_PTE_MT_VECTORS	(_AT(pteval_t, 0x05) << 2)	/* 0101 */
 #define L_PTE_MT_MINICACHE	(_AT(pteval_t, 0x06) << 2)	/* 0110 (sa1100, xscale) */
 #define L_PTE_MT_WRITEALLOC	(_AT(pteval_t, 0x07) << 2)	/* 0111 */
 #if defined(CONFIG_CPU_V7) || defined(CONFIG_CPU_V6) || defined(CONFIG_CPU_V6K)
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index ab69250a86bc..0b6b377e2cce 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -536,12 +536,11 @@ static void __init build_mem_type_table(void)
 
 #ifndef CONFIG_ARM_LPAE
 	/*
-	 * We don't use domains on ARMv6 (since this causes problems with
-	 * v6/v7 kernels), so we must use a separate memory type for user
-	 * r/o, kernel r/w to map the vectors page.
+	 * We no longer write to the vector pages ar run-time, to
+	 * use read-only user page attribute for vector.
 	 */
 	if (cpu_arch == CPU_ARCH_ARMv6)
-		vecs_pgprot |= L_PTE_MT_VECTORS;
+		vecs_pgprot |= L_PTE_RDONLY;
 
 	/*
 	 * Check is it with support for the PXN bit
diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
index dde1d6374250..f3e6551b4a7e 100644
--- a/arch/arm/mm/proc-macros.S
+++ b/arch/arm/mm/proc-macros.S
@@ -137,7 +137,7 @@
 	.long	PTE_CACHEABLE					@ L_PTE_MT_WRITETHROUGH
 	.long	PTE_CACHEABLE | PTE_BUFFERABLE			@ L_PTE_MT_WRITEBACK
 	.long	PTE_BUFFERABLE					@ L_PTE_MT_DEV_SHARED
-	.long	PTE_CACHEABLE | PTE_BUFFERABLE | PTE_EXT_APX	@ L_PTE_MT_VECTORS
+	.long	0x00						@ unused
 	.long	0x00						@ L_PTE_MT_MINICACHE (not present)
 	.long	PTE_EXT_TEX(1) | PTE_CACHEABLE | PTE_BUFFERABLE	@ L_PTE_MT_WRITEALLOC
 	.long	0x00						@ unused
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
