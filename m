Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D3CC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 10:41:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A920208C7
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 10:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uh18cY7M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="vDafAjZh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A920208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HaW+8t5hw2emg7EcgKc+un2MYhpn5v24EPm0zpXjP1o=; b=uh18cY7Mi6PSdlkHdKBBlhRcaV
	XUzKPBL4HXCZa1rzAAYgRvRl985xjQ3u6kzpISUfH3ICULSFI2oPB1H2odkilw/wPc+ywIOBnSVXh
	nyGcnJXVCIIFOQSc6Qgrl5vvswOpPKlteifKIk9SZufPAzgcxkxyuAtyCXSKXKtLSlpfm1+klvVdW
	hppaQN4QNz8HehCZbsYk100TLymzTu4f4JjLTVXmxkigWTqkejlIDaqXbnmy5u4+NgVD3ySW0w79Z
	HIhg10Sakt0AjmX+8xquSnLaBFlzcD31t6s/Mr+G4jDzUbZ3ypqp823Gc2SsOfRu7cJjw0ppOIePs
	TQFaXM3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE99K-0002jY-Lt; Fri, 04 Sep 2020 10:40:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE99I-0002i0-2y; Fri, 04 Sep 2020 10:40:53 +0000
X-UUID: b5ddd92ee60b4daebe61c74b31a4244c-20200904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+foNOXIgIh1kuuS1RTWqR7W2PgiV9fXKECaUSNGOkmY=; 
 b=vDafAjZhBr9b/kXzS0qNaq3RDs99RuSW6YrpiKIdChoe8TQO7mt2uBDWk+92uM/+9gZRLjnCkoK6zbTx7aXf8zJ6bIjOkKKERyhmYW+6RE67OHhLNhhO1V9nTG5Jk4l8BlQ3Tc1vBujjLyDBio9VvAMZDQgF2oAg6W/8mkwIDus=;
X-UUID: b5ddd92ee60b4daebe61c74b31a4244c-20200904
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1487320958; Fri, 04 Sep 2020 02:40:49 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 03:40:47 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 18:40:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Sep 2020 18:40:37 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [RESEND PATCHv5] iommu/mediatek: check 4GB mode by reading infracfg
Date: Fri, 4 Sep 2020 18:40:38 +0800
Message-ID: <20200904104038.4979-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_064052_338227_6FC5E94D 
X-CRM114-Status: GOOD (  21.49  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, Mike
 Rapoport <rppt@linux.ibm.com>, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Christoph Hellwig <hch@lst.de>,
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
Cc: Joerg Roedel <joro@8bytes.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>

---

Change since v4
- remove unnecessary data->enable_4GB = false, since it is kzalloc()ed.

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
 drivers/iommu/mtk_iommu.c             | 33 +++++++++++++++++++++++----
 include/linux/soc/mediatek/infracfg.h |  3 +++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 785b228d39a6..e7b8b2bb08a9 100644
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
@@ -655,10 +660,28 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
 
-	/* Whether the current dram is over 4GB */
-	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
-	if (!MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
-		data->enable_4GB = false;
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
