Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E041C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 03:34:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7AF61A2A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 03:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED7AF61A2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VUkl47iAc4Tyz0x7aGeccYy9P/FrlWy3UmCjyTNgfZU=; b=RrzDVUx99wnRBsEM4OfSO//ViL
	FyjIEV05/5xLIesYKz8TJv3i+Ljk9mx3CTjhSAb7ODj5iCNpyPaHIDYNbDWusFuYHD8bkNAYYD1Yl
	wuZejd7MEsGuSeI/ajRRRMQwkHg6XwqRh+vhUTJ8qohrTkzFWVjWaXl4U6QZDAeRXrt9pZ4k+JZJ6
	Ci0Y+H1lfZZ5o/hygQK4JocKMVtlPw0hcnmTU4WuMwcLT0NKjDvLMxAoNPjTLOKQdOfJmDRvZXk7U
	Pnnk2ED5fqtKfXoIgNSQN9H0ixo0/IGGqUk2GG3bGLY5In5uvXRoHWEHUzxQ6xcjseQDNz3+lbe8j
	W9bv390g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPdEn-002has-Bg; Fri, 26 Mar 2021 03:34:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPdEU-002hZP-E7; Fri, 26 Mar 2021 03:34:02 +0000
X-UUID: fe8501d39cdd436e80980fc7996e034b-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=K5uTgX6ufySmOuOYzU0mHlJO4rr1ylIaLoA3Lg7RzqY=; 
 b=kFN2TFgYA3ZrdApRi0w1KxzAatu5se9wAIXrhjKI1TPgiCgMw3rtAqNpnSNHybyFGZ89D8onBT5ISIec7c92s9iDyW1lalkiFKD3Es5rhF8yjEBZIDQ93lU0H1qy/z6Hz8yQEw70/ZjkFtt9HddE8hcIveYolpXplBVg087qpxc=;
X-UUID: fe8501d39cdd436e80980fc7996e034b-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1659927313; Thu, 25 Mar 2021 19:33:49 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 20:23:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Mar 2021 11:23:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Mar 2021 11:23:44 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Subject: [PATCH v2 1/2] iommu/mediatek-v1: Allow building as module
Date: Fri, 26 Mar 2021 11:23:36 +0800
Message-ID: <20210326032337.24578-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_033400_293368_7DF81D9D 
X-CRM114-Status: GOOD (  15.92  )
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

This patch only adds support for building the IOMMU-v1 driver as module.
Correspondingly switch the config to tristate and update the iommu_ops's
owner to THIS_MODULE.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
v2: change note:
    a) Update iommu_ops's owner to THIS_MODULE
    b) Fix typo in the title from "Alloc" to "Allow"

v1: rebase on v5.12-rc2
---
 drivers/iommu/Kconfig        |  2 +-
 drivers/iommu/mtk_iommu_v1.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 192ef8f61310..bc93da48bed0 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -364,7 +364,7 @@ config MTK_IOMMU
 	  If unsure, say N here.
 
 config MTK_IOMMU_V1
-	bool "MTK IOMMU Version 1 (M4U gen1) Support"
+	tristate "MediaTek IOMMU Version 1 (M4U gen1) Support"
 	depends on ARM
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 82ddfe9170d4..be1b20e3f20e 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -20,6 +20,7 @@
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
 #include <linux/list.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_iommu.h>
 #include <linux/of_irq.h>
@@ -529,6 +530,7 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.def_domain_type = mtk_iommu_def_domain_type,
 	.device_group	= generic_device_group,
 	.pgsize_bitmap	= ~0UL << MT2701_IOMMU_PAGE_SHIFT,
+	.owner          = THIS_MODULE,
 };
 
 static const struct of_device_id mtk_iommu_of_ids[] = {
@@ -691,9 +693,7 @@ static struct platform_driver mtk_iommu_driver = {
 		.pm = &mtk_iommu_pm_ops,
 	}
 };
+module_platform_driver(mtk_iommu_driver);
 
-static int __init m4u_init(void)
-{
-	return platform_driver_register(&mtk_iommu_driver);
-}
-subsys_initcall(m4u_init);
+MODULE_DESCRIPTION("IOMMU API for MediaTek M4U v1 implementations");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
