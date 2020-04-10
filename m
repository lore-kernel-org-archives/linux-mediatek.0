Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0C6C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 14:31:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A153D206C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 14:31:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zl5z0F8v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A153D206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EAWnIctI58CMlkU+v4t3uihOCD22oo7As8dgq86Xf18=; b=Zl5
	z0F8vkbgisOrlnTQ0YhopzD/00gt8dV/mYMj4/D8DkrsPEyDMgKHM9v7+Cm8VqpsIBx2fwKbovmAG
	7qEeJWKQPHZFwBkmoZSW4CS5CmbpetLzRi4DPWrwGduPSIUFWNDGxmABnHu0hii7AQZGll9/lxakq
	d8RUo4yYyqaUsW6rxGgW5RuhUD1OOcdffltPMTOEeOUUGYbvijHxoTgqXOhrI+IVF1fLqtdqZIuuD
	wj17BYo6ndR1UMgVSM7rF4qZhAUn2z6NcciMe6khIr1HML91GKcYqcbgGbEFqV6eqGK6Fn9f/u0PI
	Ub7lu9ol7dVAUxgtPAoKd5Mfi4CyrNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMugP-0002pc-W0; Fri, 10 Apr 2020 14:31:01 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMugI-0002iG-7H
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 14:30:55 +0000
Received: from ramsan ([84.195.182.253]) by michel.telenet-ops.be with bizsmtp
 id R2Wp2200M5USYZQ062Wp8i; Fri, 10 Apr 2020 16:30:49 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jMugD-0004re-5L; Fri, 10 Apr 2020 16:30:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jMugD-00058K-3B; Fri, 10 Apr 2020 16:30:49 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] iommu: Fix MTK_IOMMU dependencies
Date: Fri, 10 Apr 2020 16:30:47 +0200
Message-Id: <20200410143047.19691-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_073054_412569_24302FE8 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If NO_DMA=y (e.g. Sun-3 all{mod,yes}-config):

    drivers/iommu/dma-iommu.o: In function `iommu_dma_mmap':
    dma-iommu.c:(.text+0x836): undefined reference to `dma_pgprot'

IOMMU_DMA must not be selected, unless HAS_DMA=y.

Hence fix this by making MTK_IOMMU depend on HAS_DMA.
While at it, remove the dependency on ARM || ARM64, as that is already
implied by the dependency on ARCH_MEDIATEK.

Fixes: e93a1695d7fb5513 ("iommu: Enable compile testing for some of drivers")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 58b4a4dbfc78b9a5..bead9aaea8429447 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -457,7 +457,7 @@ config S390_AP_IOMMU
 
 config MTK_IOMMU
 	bool "MTK IOMMU Support"
-	depends on ARM || ARM64 || COMPILE_TEST
+	depends on HAS_DMA
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
