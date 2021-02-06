Return-Path: <SRS0=qWQ0=HI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1318EC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Feb 2021 08:46:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B93A164F06
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Feb 2021 08:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B93A164F06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=niM9cfZma/IeJy3e7xNY3JJcAYPTAdo3X+mNWACFxGY=; b=zrFJzv6WM8Ht1Bl81N5qBcIlb
	fr/epeAUODn8O1Xu7Xk+P9TCjFRX8eUnBSUSpxXbznRxH5vXwT1DfggLgSpuIwvip5DXaojSGLVJt
	7SdHPxCkpwY2lwFj/HaPSW3FDjMQx8bVXzSNLWF49sjCBBE8StD8Kcc2ggy3+KmXa85Je+nVawZ29
	68ZpLN6ACzURaeMlVu2h4J0KYZ8zMWwwXEX0yY969j9r43KsDBh9drgaWkcpWAQcZ6/cyUqheZQPI
	ySm4jZtM2Tu5Y9J4S+hIqJHD5aeRxEanxFNFwZzAqviv+3JIrMo+Q/NfdQHWjSjpZuNS5pIzK65yV
	y9I3HWyQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8JEp-0003HJ-2I; Sat, 06 Feb 2021 08:46:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8JEb-0003CJ-OO; Sat, 06 Feb 2021 08:46:35 +0000
X-UUID: a66758f1e6dc4b9cb8d8c3be4f5b97c1-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RJsdBav28u+xEHqL8wgRxv+tvf9NJqx84WQg+n9KsZA=; 
 b=hUrYpLDLVZlUrlQmL5FYS/0V6WcTCiB2NZJORdC3eJjzC03vdCCx7faet5D4p9aWnLesMwHpTYOxu6vWC7Vx8Lu7iWzDllOQuh0NExEuv9q2asA5d9dMWaocx+zHCsTzG/y77/PK+t6BuKMznE01vWv40s2rURk7yaKT3oWbpVI=;
X-UUID: a66758f1e6dc4b9cb8d8c3be4f5b97c1-20210206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1409640097; Sat, 06 Feb 2021 00:46:21 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 00:36:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 16:36:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 6 Feb 2021 16:36:07 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <linux-arm-kernel@lists.infradead.org>,
 <will@kernel.org>
Subject: [PATCH v3 3/5] arm64: Kconfig: support CONFIG_KASAN_VMALLOC
Date: Sat, 6 Feb 2021 16:35:50 +0800
Message-ID: <20210206083552.24394-4-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210206083552.24394-1-lecopzer.chen@mediatek.com>
References: <20210206083552.24394-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_034629_923466_9A56C12F 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: tyhicks@linux.microsoft.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 glider@google.com, yj.chiang@mediatek.com, gustavoars@kernel.org,
 andreyknvl@google.com, ardb@kernel.org, lecopzer@gmail.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux@roeck-us.net, rppt@kernel.org,
 catalin.marinas@arm.com, aryabinin@virtuozzo.com, dan.j.williams@intel.com,
 vincenzo.frascino@arm.com, robin.murphy@arm.com, akpm@linux-foundation.org,
 dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Now we can backed shadow memory in vmalloc area,
thus make KASAN_VMALLOC selectable.

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f39568b28ec1..a8f5a9171a85 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -136,6 +136,7 @@ config ARM64
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN if !(ARM64_16K_PAGES && ARM64_VA_BITS_48)
+	select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
 	select HAVE_ARCH_KGDB
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
