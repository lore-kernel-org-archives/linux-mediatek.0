Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CED8C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 08:58:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14AFD2071E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 08:58:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PB832fEr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dXl+zvhc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14AFD2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xWGRQJO/lGbzEkQagKIIzvD/cjEgJ3GHeZcepkJIEDc=; b=PB832fEraSbKugUVEVKmPy2iC+
	yPlxGumOspAK7uEOt/DBLx3OW7d0fGCcPgiXm2ik6uH1UrcLauuDhW9WmA8/zatZw6AdKUod13aDl
	PnPSdUyRgZ7q5FKwHnYJoVMeS/qd7+PF5CEzAwR7Bxs1/zXeDpuzzh/j2UN+zXimwpQEY44slSUQi
	e3dkW+3O4Yqgc6TJBn3f9Yz/3mfJOMhtUhq5+OqK+7/Fu8LTiYJSee/h2He62oQhFebOPy/1M1Iut
	5KJqE6QI82oauc90egvH5e/Z+UY6DFMUmuip+D2CcnvCsl0mrTH/zzU2hAkW1ymOy6LzrO+JOykgg
	LZ0HLgLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kArFz-00026a-GG; Wed, 26 Aug 2020 08:58:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kArFu-00023o-Vu; Wed, 26 Aug 2020 08:58:09 +0000
X-UUID: c135f1f9de2944558d178f23f4f17924-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0y0Vfo6/get6fXxv+JKbgOiwCIDoQLsBCkYvCv7n8ek=; 
 b=dXl+zvhcYrl8p8d5NfEo7PN4kA9+ASs8We5Vwv/79IFswTa7cnEML8McBtFIxIE+xlclDi4spAsRjedYCN+es2SfJGawIFfrdLscB3BePTxfnrFFQBCTtBVOwCGGjmNCjMuZRriU3pDMS9ZL7sDj0MZW77NgSqPKfYezFQOHfxk=;
X-UUID: c135f1f9de2944558d178f23f4f17924-20200826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1314069595; Wed, 26 Aug 2020 00:57:49 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 01:56:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 16:56:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Aug 2020 16:56:17 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v4] iommu/mediatek: check 4GB mode by reading infracfg
Date: Wed, 26 Aug 2020 16:56:18 +0800
Message-ID: <20200826085618.2889-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_045807_210326_02025161 
X-CRM114-Status: GOOD (  21.01  )
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
Cc: wsd_upstream@mediatek.com, David
 Hildenbrand <david@redhat.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In previous discussion [1] and [2], we found that it is risky to
use max_pfn or totalram_pages to tell if 4GB mode is enabled.

Check 4GB mode by reading infracfg register, remove the usage
of the un-exported symbol max_pfn.

This is a step towards building mtk_iommu as a kernel module.

[1] https://lore.kernel.org/lkml/20200603161132.2441-1-miles.chen@mediatek.com/
[2] https://lore.kernel.org/lkml/20200604080120.2628-1-miles.chen@mediatek.com/
[3] https://lore.kernel.org/lkml/20200715205120.GA778876@bogus/

Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>

---

Change since v3
- use lore.kernel.org links
- move "change since..." after "---"

Change since v2:
- determine compatible string by m4u_plat
- rebase to next-20200720
- add "---"

Change since v1:
- remove the phandle usage, search for infracfg instead [3]
- use infracfg instead of infracfg_regmap
- move infracfg definitaions to linux/soc/mediatek/infracfg.h
- update enable_4GB only when has_4gb_mode
---
 drivers/iommu/mtk_iommu.c             | 34 +++++++++++++++++++++++----
 include/linux/soc/mediatek/infracfg.h |  3 +++
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 785b228d39a6..adc350150492 100644
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
@@ -15,13 +14,16 @@
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
+#include <linux/soc/mediatek/infracfg.h>
 #include <asm/barrier.h>
 #include <soc/mediatek/smi.h>
 
@@ -640,8 +642,11 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	struct resource         *res;
 	resource_size_t		ioaddr;
 	struct component_match  *match = NULL;
+	struct regmap		*infracfg;
 	void                    *protect;
 	int                     i, larb_nr, ret;
+	u32			val;
+	char                    *p;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -655,10 +660,29 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
 
-	/* Whether the current dram is over 4GB */
-	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
-	if (!MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
-		data->enable_4GB = false;
+	data->enable_4GB = false;
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE)) {
+		switch (data->plat_data->m4u_plat) {
+		case M4U_MT2712:
+			p = "mediatek,mt2712-infracfg";
+			break;
+		case M4U_MT8173:
+			p = "mediatek,mt8173-infracfg";
+			break;
+		default:
+			p = NULL;
+		}
+
+		infracfg = syscon_regmap_lookup_by_compatible(p);
+
+		if (IS_ERR(infracfg))
+			return PTR_ERR(infracfg);
+
+		ret = regmap_read(infracfg, REG_INFRA_MISC, &val);
+		if (ret)
+			return ret;
+		data->enable_4GB = !!(val & F_DDR_4GB_SUPPORT_EN);
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	data->base = devm_ioremap_resource(dev, res);
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index fd25f0148566..233463d789c6 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -32,6 +32,9 @@
 #define MT7622_TOP_AXI_PROT_EN_WB		(BIT(2) | BIT(6) | \
 						 BIT(7) | BIT(8))
 
+#define REG_INFRA_MISC				0xf00
+#define F_DDR_4GB_SUPPORT_EN			BIT(13)
+
 int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
 		bool reg_update);
 int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
