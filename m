Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017DCC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 09:47:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C676D20760
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 09:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k744+dfF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="d04RkMfU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C676D20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ld8jlujVqY5/PWjBuKq0uiIpHDDOvKELEjuBUcdEuO4=; b=k744+dfFJNSTwfmm76iSQqDcV
	CZwyqXj8KM6Yy87AtOVeEO2uYlJlzUxMIPEC5g6oS2eqNgTSsijeLFJwF+Zqi7SV6WPwiqsPXCqjq
	fApnwOEtUfx65XcKq6t+99FIunFKnqszQibjYl4kp02crwsKSmd0p71pIeIqBdvomLT0L27PPC/D1
	fi0Mm1kccJbwyprYOXWhN0jXlwXcfNFm9d8ADpGrprGVU3AUG4DbjouHTJ4vVRFWBeVie90nbJLq9
	td3+ewdLfA/foVW8hmkh481UhVHg9zCUKFn77tsTNMSGRlkO+QZYb9+uUj8e76Rydy5TvJBqZNspW
	KDWi2K6/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqvoc-0004Cm-3A; Thu, 02 Jul 2020 09:47:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqvoZ-0004Bs-U1; Thu, 02 Jul 2020 09:47:33 +0000
X-UUID: a165b62a0b5b47f2b5e32cd6bc9fc84d-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=srCB5XNrPlYp3HSyZlphU1Xk3HZN3j+BE4+7DogmQy4=; 
 b=d04RkMfU9EEqJeKEwo7o1DnXRaHWMjOkYhIFMB0C9xSuyPLpqrVb9omggr+PdHRxQkFwazeX5rVhqqUWEV7Q4c4Z8YR3OJh4VMwr5v58E3NIJ8cflP4HM9EnX2m6pdNVjFY+iPmg8BsXOu5W1sXoWHjfC+npzWpK22Tc6hcbG8w=;
X-UUID: a165b62a0b5b47f2b5e32cd6bc9fc84d-20200702
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1196126974; Thu, 02 Jul 2020 01:47:23 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 02:37:24 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 17:37:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Jul 2020 17:37:21 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH 4/4] iommu/mediatek: check 4GB mode by reading infracfg
Date: Thu, 2 Jul 2020 17:37:20 +0800
Message-ID: <20200702093721.6063-4-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200702093721.6063-1-miles.chen@mediatek.com>
References: <20200702093721.6063-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A048809BF75A2565D4E6E6BBA7AA1D99F242281B24CA77BCBD8A0D61FB421EA72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_054732_165192_DF06CACB 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Mike
 Rapoport <rppt@linux.ibm.com>, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In previous disscusion [1] and [2], we found that it is risky to
use max_pfn or totalram_pages to tell if 4GB mode is enabled.

Check 4GB mode by reading infracfg register, remove the usage
of the unexported symbol max_pfn.

[1] https://lkml.org/lkml/2020/6/3/733
[2] https://lkml.org/lkml/2020/6/4/136

Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2be96f1cdbd2..09be57bd8d74 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2015-2016 MediaTek Inc.
  * Author: Yong Wu <yong.wu@mediatek.com>
  */
-#include <linux/memblock.h>
 #include <linux/bug.h>
 #include <linux/clk.h>
 #include <linux/component.h>
@@ -15,11 +14,13 @@
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
 #include <linux/list.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of_address.h>
 #include <linux/of_iommu.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <asm/barrier.h>
@@ -91,6 +92,9 @@
 #define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
 #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
 
+#define REG_INFRA_MISC				0xf00
+#define F_DDR_4GB_SUPPORT_EN			BIT(13)
+
 #define MTK_PROTECT_PA_ALIGN			128
 
 /*
@@ -599,8 +603,10 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	struct resource         *res;
 	resource_size_t		ioaddr;
 	struct component_match  *match = NULL;
+	struct regmap		*infracfg_regmap;
 	void                    *protect;
 	int                     i, larb_nr, ret;
+	u32			val;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -614,10 +620,18 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
 
-	/* Whether the current dram is over 4GB */
-	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
-	if (!data->plat_data->has_4gb_mode)
+	if (data->plat_data->has_4gb_mode) {
+		infracfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
+				"mediatek,infracfg");
+		if (IS_ERR(infracfg_regmap))
+			return PTR_ERR(infracfg_regmap);
+		ret = regmap_read(infracfg_regmap, REG_INFRA_MISC, &val);
+		if (ret)
+			return ret;
+		data->enable_4GB = !!(val & F_DDR_4GB_SUPPORT_EN);
+	} else {
 		data->enable_4GB = false;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	data->base = devm_ioremap_resource(dev, res);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
