Return-Path: <SRS0=qWQ0=HI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF82C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Feb 2021 08:47:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB50F64FD4
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Feb 2021 08:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB50F64FD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PvLnd335N49Wp+qrv4L+bbQM2W/Ye0C/faY2QQ91TDM=; b=ffCwHGw3oZTppdaBcOUVZni3q
	o3U6fj+J5KomXFNMgxNB1EjaI1RGOMWe25U8cdC10tS8LdQXgp62c2Qji3V5AtGdsLgFFEUA0GWxI
	dq04NQzRlTPCWp0rD4t2u8trTjTia0VwK188UVOqOTzWgBgMkNMiLC7P4Z2gPKM+I7LfZEymkir8A
	U8yo4lO9vET2q+KdVUmJ1ChOBBmbVs3duPnxocWsIERCrPKOctwtHnum3g56RIKJZ2wg3X0Z8kTg0
	0e3ngOwILiMvGKQHm7XhTcQpDvNQK1OGyjIWyW8uRRsGKVDS/Jng4o760wx8NLVSKA3jCH4zzWdCO
	xQtd8z/0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8JEz-0003JZ-RA; Sat, 06 Feb 2021 08:46:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8JEh-0003CJ-FQ; Sat, 06 Feb 2021 08:46:37 +0000
X-UUID: cbe07f2d0ff34cd1b20425c108b71281-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=65Ivu8gApRNNi6Lwj0SA/pyl/Qy3p6z6fJGg1EtUvuY=; 
 b=X6si4/YOcNbz0X1RY0JAv8jC8taUNSVgHxUMr2SZj9Kg/8iKDqL4m8U4F1Q3T66Np8WNcdwM6u9IJFsg+koyFV8sY9EUiA4jtRf+ZpaczVO/DB9eXDB2GU7MyUOhsr7fiSv8yW7IlY7TNfqyhoUM2N13AG2F4GA4N0auXLoWh3c=;
X-UUID: cbe07f2d0ff34cd1b20425c108b71281-20210206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 337137046; Sat, 06 Feb 2021 00:46:21 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 00:36:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 16:36:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 6 Feb 2021 16:36:08 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <linux-arm-kernel@lists.infradead.org>,
 <will@kernel.org>
Subject: [PATCH v3 5/5] arm64: Kconfig: select KASAN_VMALLOC if KANSAN_GENERIC
 is enabled
Date: Sat, 6 Feb 2021 16:35:52 +0800
Message-ID: <20210206083552.24394-6-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210206083552.24394-1-lecopzer.chen@mediatek.com>
References: <20210206083552.24394-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_034635_668583_0B638FD1 
X-CRM114-Status: GOOD (  11.10  )
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

Before this patch, someone who wants to use VMAP_STACK when
KASAN_GENERIC enabled must explicitly select KASAN_VMALLOC.

From Will's suggestion [1]:
  > I would _really_ like to move to VMAP stack unconditionally, and
  > that would effectively force KASAN_VMALLOC to be set if KASAN is in use.

Because VMAP_STACK now depends on either HW_TAGS or KASAN_VMALLOC if
KASAN enabled, in order to make VMAP_STACK selected unconditionally,
we bind KANSAN_GENERIC and KASAN_VMALLOC together.

Note that SW_TAGS supports neither VMAP_STACK nor KASAN_VMALLOC now,
so this is the first step to make VMAP_STACK selected unconditionally.

Bind KANSAN_GENERIC and KASAN_VMALLOC together is supposed to cost more
memory at runtime, thus the alternative is using SW_TAGS KASAN instead.

[1]: https://lore.kernel.org/lkml/20210204150100.GE20815@willie-the-truck/

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a8f5a9171a85..9be6a57f6447 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -190,6 +190,7 @@ config ARM64
 	select IOMMU_DMA if IOMMU_SUPPORT
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
+	select KASAN_VMALLOC if KASAN_GENERIC
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
