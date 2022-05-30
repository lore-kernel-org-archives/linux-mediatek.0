Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8DBC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LqzueZ327oI6DH/BTPKIRa/CtjZgg8Qa30dO+j4uFoM=; b=XmpDwws61FD7d1
	yWKivNvmHWWPCikahIaBnFF/8106oEId1pBGz/q+Ne/erNIzIt0gGAwY5C0w+fXvbDLFKJO0Msy1O
	q8rqcO+ehvvcFUgffBcHJ8esBfvmU6H75IMYpLvMpU4dVdGM4oDVGSSvxOudUTan6PyP6yY7LrHJq
	FTMoZ2t7hyolGNeLxTLInueqVqEqdLDusk0xTgsy67+m+EMoWz3JbbWKc/oDM3Hp8pgqkO4rw1k3o
	gzcT/51LUbD6xopbJKfmKHgMy3Wn+yVMyXCADFt8Kly0uf3jWTDNZLkNrmxEiYcnYqUPNk8yROHR4
	ZWcr1Cyl+PeH63q7Xbyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nveIW-006TuH-Am; Mon, 30 May 2022 12:15:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nveII-006TqP-SO; Mon, 30 May 2022 12:14:51 +0000
X-UUID: 1f8252d6d3714858a21fc80511a8a8e9-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:b74b6741-6a07-454d-902c-1a3843b9cafc,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:b7f30548-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 1f8252d6d3714858a21fc80511a8a8e9-20220530
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 924010972; Mon, 30 May 2022 05:14:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 05:14:31 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 30 May 2022 20:14:30 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 May 2022 20:14:29 +0800
From: <yf.wang@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "open list:IOMMU DRIVERS"
	<iommu@lists.linux-foundation.org>, open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, "Miles
 Chen" <miles.chen@mediatek.com>, Yong Wu <Yong.Wu@mediatek.com>, Yunfei Wang
	<yf.wang@mediatek.com>, Ning Li <ning.li@mediatek.com>
Subject: [PATCH] iommu/dma: Fix race condition during iova_domain initialization
Date: Mon, 30 May 2022 20:07:45 +0800
Message-ID: <20220530120748.31733-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_051446_967299_59C3F3EA 
X-CRM114-Status: GOOD (  13.72  )
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

From: Yunfei Wang <yf.wang@mediatek.com>

When many devices share the same iova domain, iommu_dma_init_domain()
may be called at the same time. The checking of iovad->start_pfn will
all get false in iommu_dma_init_domain() and both enter init_iova_domain()
to do iovad initialization.

Fix this by protecting init_iova_domain() with iommu_dma_cookie->mutex.

Exception backtrace:
rb_insert_color(param1=0xFFFFFF80CD2BDB40, param3=1) + 64
init_iova_domain() + 180
iommu_setup_dma_ops() + 260
arch_setup_dma_ops() + 132
of_dma_configure_id() + 468
platform_dma_configure() + 32
really_probe() + 1168
driver_probe_device() + 268
__device_attach_driver() + 524
__device_attach() + 524
bus_probe_device() + 64
deferred_probe_work_func() + 260
process_one_work() + 580
worker_thread() + 1076
kthread() + 332
ret_from_fork() + 16

Signed-off-by: Ning Li <ning.li@mediatek.com>
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
---
 drivers/iommu/dma-iommu.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 09f6e1c0f9c0..b38c5041eeab 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -63,6 +63,7 @@ struct iommu_dma_cookie {
 
 	/* Domain for flush queue callback; NULL if flush queue not in use */
 	struct iommu_domain		*fq_domain;
+	struct mutex			mutex;
 };
 
 static DEFINE_STATIC_KEY_FALSE(iommu_deferred_attach_enabled);
@@ -309,6 +310,7 @@ int iommu_get_dma_cookie(struct iommu_domain *domain)
 	if (!domain->iova_cookie)
 		return -ENOMEM;
 
+	mutex_init(&domain->iova_cookie->mutex);
 	return 0;
 }
 
@@ -549,26 +551,33 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 	}
 
 	/* start_pfn is always nonzero for an already-initialised domain */
+	mutex_lock(&cookie->mutex);
 	if (iovad->start_pfn) {
 		if (1UL << order != iovad->granule ||
 		    base_pfn != iovad->start_pfn) {
 			pr_warn("Incompatible range for DMA domain\n");
-			return -EFAULT;
+			ret = -EFAULT;
+			goto done_unlock;
 		}
 
-		return 0;
+		ret = 0;
+		goto done_unlock;
 	}
 
 	init_iova_domain(iovad, 1UL << order, base_pfn);
 	ret = iova_domain_init_rcaches(iovad);
 	if (ret)
-		return ret;
+		goto done_unlock;
 
 	/* If the FQ fails we can simply fall back to strict mode */
 	if (domain->type == IOMMU_DOMAIN_DMA_FQ && iommu_dma_init_fq(domain))
 		domain->type = IOMMU_DOMAIN_DMA;
 
-	return iova_reserve_iommu_regions(dev, domain);
+	ret = iova_reserve_iommu_regions(dev, domain);
+
+done_unlock:
+	mutex_unlock(&cookie->mutex);
+	return ret;
 }
 
 /**
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
