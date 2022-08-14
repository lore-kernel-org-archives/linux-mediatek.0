Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D85CC25B06
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Aug 2022 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BufiCKQq70iP4kpmLVl7bD6nkPJELy1R8RlOhVI4RY=; b=mUjQSww/7UIQIlW6vx44X47ztt
	EQ7uKRmJYzxDB9lYXG1xlZoE9bP/Vwqets9hv8LIlTu1by/LqGNNPY2Ves7sjgXmv9IBp8wiWexN2
	kQlK9tPCy/cCAz4Nsr8z5xKR3QCur7ukfzZjIq+iCYKIueTSoeTtRWgtVYdHnHciBGNGxjWxNk322
	R82qq1iTArTqmqkR53K66Ud8DFAy9K1JuGjLbWmctzxhrvURv1f5M2/nUGW6Phiew0cC/3rwnwtaP
	jkyT2WSmfq8GlpE/Qo1Nh9kmfB30d/JDCLTx9cvFP//zF6rXrTXqjq7BYAx15V07z5uWs+sq++mTw
	Tkn5irBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNFnr-007YZ0-3c; Sun, 14 Aug 2022 15:45:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNFcz-007Rfu-AY; Sun, 14 Aug 2022 15:34:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DBFE960DBC;
	Sun, 14 Aug 2022 15:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B189C433D6;
	Sun, 14 Aug 2022 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660491252;
	bh=KrGw3jvz3VlrB6s/KQb6fT3Ak7ZC19uSgWY1w7Xat7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VdcMjWcXeSdwWxkGrBuF0iuEWlEXQw8yaSclbeTX3dMgg5AHUsmOrqS3XyDfY0+Jp
	 0ZpZCuaDzc+jiKcXEEiaEwqqCi0U9MZMLycMZiiA/qHYqD+IAnMZshSFy4CRTquzKn
	 hL4F4YkhKbapdWSTLszS19F2PQedDG4+QTqGxBIt5P22xvkcm2ouYCfuxHkccWceM/
	 wLaYhFLJ+66n/rVvJKWuJNrX0oY4QCUq6GVr/73Cy3T57IaZV0eudCi6RrAYl36wsh
	 0jxZd7MX3GbnXEcRFKGJZHMGS9hWIIQ1ArwxhimeNoEfMcr9kkvhCE2q5zB91cAdyp
	 I9CKDKuhEd8wA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>,
	linux@armlinux.org.uk,
	ryabinin.a.a@gmail.com,
	matthias.bgg@gmail.com,
	arnd@arndb.de,
	ardb@kernel.org,
	rostedt@goodmis.org,
	nick.hawkins@hpe.com,
	john@phrozen.org,
	linux-arm-kernel@lists.infradead.org,
	kasan-dev@googlegroups.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 38/46] ARM: 9202/1: kasan: support CONFIG_KASAN_VMALLOC
Date: Sun, 14 Aug 2022 11:32:39 -0400
Message-Id: <20220814153247.2378312-38-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814153247.2378312-1-sashal@kernel.org>
References: <20220814153247.2378312-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_083414_009709_DD55EC67 
X-CRM114-Status: GOOD (  12.37  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lecopzer Chen <lecopzer.chen@mediatek.com>

[ Upstream commit 565cbaad83d83e288927b96565211109bc984007 ]

Simply make shadow of vmalloc area mapped on demand.

Since the virtual address of vmalloc for Arm is also between
MODULE_VADDR and 0x100000000 (ZONE_HIGHMEM), which means the shadow
address has already included between KASAN_SHADOW_START and
KASAN_SHADOW_END.
Thus we need to change nothing for memory map of Arm.

This can fix ARM_MODULE_PLTS with KASan, support KASan for higmem
and support CONFIG_VMAP_STACK with KASan.

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Tested-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/Kconfig         | 1 +
 arch/arm/mm/kasan_init.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4ebd512043be..44f328fa5996 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -71,6 +71,7 @@ config ARM
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
 	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32 && MMU
 	select HAVE_ARCH_KASAN if MMU && !XIP_KERNEL
+	select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_PFN_VALID
 	select HAVE_ARCH_SECCOMP
diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index 4b1619584b23..040346cc4a3a 100644
--- a/arch/arm/mm/kasan_init.c
+++ b/arch/arm/mm/kasan_init.c
@@ -236,7 +236,11 @@ void __init kasan_init(void)
 
 	clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
 
-	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
+	if (!IS_ENABLED(CONFIG_KASAN_VMALLOC))
+		kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
+					    kasan_mem_to_shadow((void *)VMALLOC_END));
+
+	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_END),
 				    kasan_mem_to_shadow((void *)-1UL) + 1);
 
 	for_each_mem_range(i, &pa_start, &pa_end) {
-- 
2.35.1


