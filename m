Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FDDC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 02:17:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E882072E
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 02:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DrlinLrL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HaNc27xq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0E882072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NNOx02w+T9H/8Kjb2RMXUWYLJw3ESaCHXxJaiyPad08=; b=DrlinLrLqRcqkF223W/XcY3bCF
	RoT8FG4RYIpZtmEco7EbFtxCQAwKRWcuGyaV4Zx5KrEKW6JsSeOvfERD8k6AmW/xpoJp8SnKXN+xu
	8FNhdkBX0thgwGiQBAGJYLkWtAWArj4LCE2bCeDOK534/FaxoL15EoPIV3W0aOKO1Ao0hPZwNiY7Y
	NuM1kSA1gc5jg2H+QtNcSG2hiFYd2U99d/51wL0jv+yf0w4YUuD5pigB8XJyBWTN/HEFXmKkJjKWY
	bfSZTKnCdTK7juCNiUiNDPzgIBHIiyXvdLmKapVj7cxR/m/9jWKhJi26vIHI9LbxENpSp9HEwGrpI
	JzvVUyFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxhpz-0001OA-9h; Tue, 21 Jul 2020 02:16:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxhpw-0001Mz-4W; Tue, 21 Jul 2020 02:16:57 +0000
X-UUID: 1ff9fa2bd5a24563937ccca522d05515-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1bSgcMBsyM3c9aSUx6HgVWkvGxtBrg5PzcKspdBYPfE=; 
 b=HaNc27xq5DPTtzAGuxpd2P13oFaRDOYx5/wGDuGLsvvrgKcS+/fvy1GA/sq5a7G/qf9zoogckKT7BByIx78J+hzl2UxMzGUma3gzbVjzcx0mCpl77pzTarBnGUQv3nVyR1PG0NLb5pDZMQ1okKtjIsJ8lb2DhWjpPXeYa7C4cj8=;
X-UUID: 1ff9fa2bd5a24563937ccca522d05515-20200720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 605986940; Mon, 20 Jul 2020 18:16:43 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 19:16:21 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 10:16:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Jul 2020 10:16:21 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>
Subject: [PATCH v2] iommu/mediatek: check 4GB mode by reading infracfg
Date: Tue, 21 Jul 2020 10:16:19 +0800
Message-ID: <20200721021619.25575-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_221656_357280_2816EDD2 
X-CRM114-Status: GOOD (  18.26  )
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
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In previous discussion [1] and [2], we found that it is risky to
use max_pfn or totalram_pages to tell if 4GB mode is enabled.

Check 4GB mode by reading infracfg register, remove the usage
of the un-exported symbol max_pfn.

This is a step towards building mtk_iommu as a kernel module.

Change since v1:
1. remove the phandle usage, search for infracfg instead [3]
2. use infracfg instead of infracfg_regmap
3. move infracfg definitaions to linux/soc/mediatek/infracfg.h
4. update enable_4GB only when has_4gb_mode

[1] https://lkml.org/lkml/2020/6/3/733
[2] https://lkml.org/lkml/2020/6/4/136
[3] https://lkml.org/lkml/2020/7/15/1147

Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Chao Hao <chao.hao@mediatek.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/iommu/mtk_iommu.c             | 26 +++++++++++++++++++++-----
 include/linux/soc/mediatek/infracfg.h |  3 +++
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2be96f1cdbd2..16765f532853 100644
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
 
@@ -599,8 +601,10 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	struct resource         *res;
 	resource_size_t		ioaddr;
 	struct component_match  *match = NULL;
+	struct regmap		*infracfg;
 	void                    *protect;
 	int                     i, larb_nr, ret;
+	u32			val;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -614,10 +618,22 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
 
-	/* Whether the current dram is over 4GB */
-	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
-	if (!data->plat_data->has_4gb_mode)
-		data->enable_4GB = false;
+	data->enable_4GB = false;
+	if (data->plat_data->has_4gb_mode) {
+		infracfg = syscon_regmap_lookup_by_compatible(
+				"mediatek,mt8173-infracfg");
+		if (IS_ERR(infracfg)) {
+			infracfg = syscon_regmap_lookup_by_compatible(
+					"mediatek,mt2712-infracfg");
+			if (IS_ERR(infracfg))
+				return PTR_ERR(infracfg);
+
+		}
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
