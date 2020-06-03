Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80061C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 16:12:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5302320738
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 16:12:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lB/5MpoI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NChHWJY8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5302320738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6eD7Y8Dk1tVSh7ab6BaekhAgnqSSDxCPWQKDgG2dExs=; b=lB/5MpoIRNzAp1
	fx82O9uuCs9U6cjOk1dKJABv/C564IuecqQ0yS5x8VEzDV2leRJzfHv4VPS871xw1uLqOWquUZgpz
	DP3DR57mA8fjDbeBy1Y7aVL8AMS+5VAZZiLLazTctp4N7Jt63W39nFehMYAokSoXzRl30xUE0kY7Z
	mxdl/EReWGbGssaJIC5lPBAq3KX+m3n1qy4xrx40R71xRjC49n6bqlAQRTT1gV2zvOgVSNJRKrClT
	Q7OMZuzdutItmHHIWs+XC7GNG7zUqqaNb0xaM6e9TsC17gbzdxhUfrON5zoWYQE2W7AgPN97xz7RH
	Jts5He3qo6Wcp5nQUN5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgVzd-0006j2-Td; Wed, 03 Jun 2020 16:11:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgVzW-0006ct-Sv; Wed, 03 Jun 2020 16:11:49 +0000
X-UUID: 52c81e604f064e968c089ccecedc9cf6-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=dcLz9a48qWis1A4C8qZ1IIJYb+koWT5X7xxpq9JWgPU=; 
 b=NChHWJY8XfG9/EQKsn4lxUe19eQYv9kB+Boz1ySvE6Dxc1nQDvN4vfCEZZHhsESN8HWojhwltbEIx1Dau/nQ2QVSh39EZWwk8NuJEpByYdZqlNzA2Iv0tP+mul5nKEINcPW01/8iYuzy1z4PEIp02GxJCl9CJm2SdP5Xe5+pVVA=;
X-UUID: 52c81e604f064e968c089ccecedc9cf6-20200603
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 395526929; Wed, 03 Jun 2020 08:11:13 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 09:11:33 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 00:11:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 4 Jun 2020 00:11:30 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Mike Rapoport <rppt@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] mm/memblock: export max_pfn for kernel modules
Date: Thu, 4 Jun 2020 00:11:32 +0800
Message-ID: <20200603161132.2441-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_091146_937832_31828B78 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

max_pfn is uesd to get the highest pfn in the system. Drivers like
drivers/iommu/mtk_iommu.c checks max_pfn to see if it should enable
its "4GB mode".

This patch exports the max_pfn symbol, so we can build the driver as
a kernel module.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 mm/memblock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index c79ba6f9920c..3b2b21ecebb6 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -99,6 +99,7 @@ EXPORT_SYMBOL(contig_page_data);
 unsigned long max_low_pfn;
 unsigned long min_low_pfn;
 unsigned long max_pfn;
+EXPORT_SYMBOL(max_pfn);
 unsigned long long max_possible_pfn;
 
 static struct memblock_region memblock_memory_init_regions[INIT_MEMBLOCK_REGIONS] __initdata_memblock;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
