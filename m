Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA124C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:28:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7017B2192A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:28:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FL7m2Otq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t68cxbSn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7017B2192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0IjUQ3fMQiMQwdo3xoEtVRiHKuT8RiGnYHVZG7iLYRg=; b=FL7m2OtqL0Ihyj67++TjcdhrE
	KYF2yE4lF34TwMFB1p/rs803EI5WeqfoLjEJluvrLnmEkM3BBCBWMS2RaHkiAgVyWfGksph3pISgm
	+iL9FtDEmRXD04nx2gkD3zqT/5COVuGT80H+YAopp3uD6x05k4U63o0P/FdOQo96Eyu4M/IKDrcfn
	ZollWy9mqGZ/xeUK4p2yxD3kOZNLxHcm4Z/1UvovwfveJJqJvP8aZIFL593eVXdX4JXSSr0oWbQWr
	ecyZPSK7sQ2bU3usIAJ1iCYxqHSf7lk9N6efGHMSeHfOyErC/eAu/tolN2FhJ9bi6C+QjTY0HjTVv
	ogceEV6JQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVtMp-0001xU-8O; Fri, 23 Oct 2020 09:28:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVtMA-0001g2-E8; Fri, 23 Oct 2020 09:27:32 +0000
X-UUID: 01a91038ac3543aba470d7cde9358751-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aYuyn9NjZBEM+oRnQ5ULA5ERNI6LEYnFPKeNFi8pApA=; 
 b=t68cxbSnlk2HoqECMOoGY/tZevDiss5sfGYnQlnmWAiYR/0iacDkeaZ5H1RXip6oAYroxHOuYqCCtdpSOeaTANlwER32SNOgnRI8QUu1tEWyfmWMVTjKquAo6zlQANFynx1R3TApFFk+DIiTCk0lNe5PYk9ocx3YuLEXSaeWu9Q=;
X-UUID: 01a91038ac3543aba470d7cde9358751-20201023
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 850186017; Fri, 23 Oct 2020 01:14:58 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 02:14:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 17:14:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Oct 2020 17:14:54 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Russell King
 <linux@armlinux.org.uk>, Minchan Kim <minchan@kernel.org>
Subject: [PATCH v2 2/4] arm: mm: reordering memory type table
Date: Fri, 23 Oct 2020 17:14:35 +0800
Message-ID: <20201023091437.8225-3-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201023091437.8225-1-miles.chen@mediatek.com>
References: <20201023091437.8225-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 39A6E743CB437B5F42C75816813A91AAC33538F9F78B64AC671EE6541AB26FFA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_052731_342641_50C90F73 
X-CRM114-Status: GOOD (  17.60  )
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
 Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Miles
 Chen <miles.chen@mediatek.com>, Simon
 Horman <horms@verge.net.au>, linux-mediatek@lists.infradead.org,
 Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Minchan Kim <minchan@kernel.org>

To use bit 5 in page table as L_PTE_SPECIAL, we need a room for that.
It seems we don't need 4 bits for the memory type with ARMv6+.
If it's true, let's reorder bits to make bit 5 free.

We will use the bit for L_PTE_SPECIAL in next patch.

A note from Catalin in [1]:
"
> Anyway, on ARMv7 or ARMv6+LPAE, the non-shared device gets mapped to
> shared device in hardware. Looking through the arm32 code, it seems that
> MT_DEVICE_NONSHARED is used by arch/arm/mach-shmobile/setup-r8a7779.c
> and IIUC that's a v7 platform (R-Car H1, Cortex-A9). I think the above
> should be defined to L_PTE_MT_DEV_SHARED, unless I miss any place where
> DEV_NONSHARED is relevant on ARMv6 (adding Simon to confirm on shmbile).
"

[1] https://lore.kernel.org/patchwork/patch/986574/

Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Steve Capper <steve.capper@linaro.org>
Cc: Simon Horman <horms@verge.net.au>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 arch/arm/include/asm/pgtable-2level.h | 21 +++++++++++++++++----
 arch/arm/mm/proc-macros.S             |  4 ++--
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index 27a8635abea0..cdcd55cca37d 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -161,14 +161,27 @@
 #define L_PTE_MT_BUFFERABLE	(_AT(pteval_t, 0x01) << 2)	/* 0001 */
 #define L_PTE_MT_WRITETHROUGH	(_AT(pteval_t, 0x02) << 2)	/* 0010 */
 #define L_PTE_MT_WRITEBACK	(_AT(pteval_t, 0x03) << 2)	/* 0011 */
+#define L_PTE_MT_DEV_SHARED	(_AT(pteval_t, 0x04) << 2)	/* 0100 */
+#define L_PTE_MT_VECTORS	(_AT(pteval_t, 0x05) << 2)	/* 0101 */
 #define L_PTE_MT_MINICACHE	(_AT(pteval_t, 0x06) << 2)	/* 0110 (sa1100, xscale) */
 #define L_PTE_MT_WRITEALLOC	(_AT(pteval_t, 0x07) << 2)	/* 0111 */
-#define L_PTE_MT_DEV_SHARED	(_AT(pteval_t, 0x04) << 2)	/* 0100 */
-#define L_PTE_MT_DEV_NONSHARED	(_AT(pteval_t, 0x0c) << 2)	/* 1100 */
+#if defined(CONFIG_CPU_V7) || defined(CONFIG_CPU_V6) || defined(CONFIG_CPU_V6K)
+/*
+ * On ARMv7 or ARMv7+LPAE, the non-shared and shared device types get
+ * mapped to the same TEX remapping index. On classic ARMv7, the
+ * shareability is controlled by the PRRR[17:16] field, indexed by
+ * L_PTE_SHARED. On ARMv7+LPAE the device mapping is always shareable.
+ */
+#define L_PTE_MT_DEV_NONSHARED	L_PTE_MT_DEV_SHARED
+#define L_PTE_MT_DEV_WC		L_PTE_MT_BUFFERABLE
+#define L_PTE_MT_DEV_CACHED	L_PTE_MT_WRITEBACK
+#define L_PTE_MT_MASK		(_AT(pteval_t, 0x07) << 2)
+#else
 #define L_PTE_MT_DEV_WC		(_AT(pteval_t, 0x09) << 2)	/* 1001 */
 #define L_PTE_MT_DEV_CACHED	(_AT(pteval_t, 0x0b) << 2)	/* 1011 */
-#define L_PTE_MT_VECTORS	(_AT(pteval_t, 0x0f) << 2)	/* 1111 */
-#define L_PTE_MT_MASK		(_AT(pteval_t, 0x0f) << 2)
+#define L_PTE_MT_DEV_NONSHARED	(_AT(pteval_t, 0x0c) << 2)	/* 1100 */
+#define L_PTE_MT_MASK           (_AT(pteval_t, 0x0f) << 2)
+#endif
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
index e2c743aa2eb2..dde1d6374250 100644
--- a/arch/arm/mm/proc-macros.S
+++ b/arch/arm/mm/proc-macros.S
@@ -137,7 +137,7 @@
 	.long	PTE_CACHEABLE					@ L_PTE_MT_WRITETHROUGH
 	.long	PTE_CACHEABLE | PTE_BUFFERABLE			@ L_PTE_MT_WRITEBACK
 	.long	PTE_BUFFERABLE					@ L_PTE_MT_DEV_SHARED
-	.long	0x00						@ unused
+	.long	PTE_CACHEABLE | PTE_BUFFERABLE | PTE_EXT_APX	@ L_PTE_MT_VECTORS
 	.long	0x00						@ L_PTE_MT_MINICACHE (not present)
 	.long	PTE_EXT_TEX(1) | PTE_CACHEABLE | PTE_BUFFERABLE	@ L_PTE_MT_WRITEALLOC
 	.long	0x00						@ unused
@@ -147,7 +147,7 @@
 	.long	PTE_EXT_TEX(2)					@ L_PTE_MT_DEV_NONSHARED
 	.long	0x00						@ unused
 	.long	0x00						@ unused
-	.long	PTE_CACHEABLE | PTE_BUFFERABLE | PTE_EXT_APX	@ L_PTE_MT_VECTORS
+	.long	0x00						@ unused
 	.endm
 
 	.macro	armv6_set_pte_ext pfx
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
