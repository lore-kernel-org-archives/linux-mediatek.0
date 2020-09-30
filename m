Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6371AC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:12:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81EC72075F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:12:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1dhIx1sp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oYVnmnPa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81EC72075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+RGsl17Tpipc8edQta/mabaGDJbKBPSE7bPYsF6JYZ8=; b=1dhIx1spC784WjmXw71KDAZ6v
	2d1c4gXHQqqKtGTdPaeBzfjAQ0kXjke5w6hsgNmnZPyxKDNOQK+Td7U6zWF/2kF0qxCNcYUpW3S7w
	b8on1lIIYFg+43fZRfAK1V9ANJcoo+J8QUAJVtLI/mQPG3Bel9IzxHNQwSGJZghIskjervkrum3Xe
	kJC6EvPN/iIKefCRQlW1aqXC00fRKEEE1+0fLRKQLlLoFKXGa6rogEjcDPo7FIxiSSkqUkvJsrkK0
	p7V9ihfjVGQRpkuZHky2KiZS/7UZOVb7ziuD6Cdtx/c4lWkT+wN+0fBSFDz1/PtzXM/4+sT4BODDJ
	LryIpi5IQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWI8-0008HP-ST; Wed, 30 Sep 2020 07:12:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWI2-0008EG-TP; Wed, 30 Sep 2020 07:12:41 +0000
X-UUID: fd494a1820994b67bc1dda2f05226af2-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JcmdGf1tbwWxv9BVjsAg+AHjaleWPK/+Qqe58lDd1XI=; 
 b=oYVnmnPaCrIgu9+zcuVNPUi3Jl470Fw0IiRZqMAi2rbmVPB4xIl62ZIAUbRnKKKTuK0EDJavhozqV2qvlgFaehWPoKsff/P8lZgbCBr96hk2OdZzBpDXExQ8Siy6qEu1ba+CG9G8mnR7hYzedb8dBReeMCQYyrMicTGj8LgJXqw=;
X-UUID: fd494a1820994b67bc1dda2f05226af2-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 331260764; Tue, 29 Sep 2020 23:12:34 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 00:09:41 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:09:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:09:39 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 13/24] iommu/mediatek: Add device link for smi-common and
 m4u
Date: Wed, 30 Sep 2020 15:06:36 +0800
Message-ID: <20200930070647.10188-14-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930070647.10188-1-yong.wu@mediatek.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CDE450FF0684FFB6D676A5EEF365F04D0BFE5E2C3181397D656404828B20D2812000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_031239_452746_3FDBD218 
X-CRM114-Status: GOOD (  19.29  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the lastest SoC, M4U has its special power domain. thus, If the engine
begin to work, it should help enable the power for M4U firstly.
Currently if the engine work, it always enable the power/clocks for
smi-larbs/smi-common. This patch adds device_link for smi-common and M4U.
then, if smi-common power is enabled, the M4U power also is powered on
automatically.

Normally M4U connect with several smi-larbs and their smi-common always
are the same, In this patch it get smi-common dev from the first smi-larb
device(i==0), then add the device_link only while m4u has power-domain.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 24 +++++++++++++++++++++++-
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 940b7a9191b2..5625458b21ba 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -20,6 +20,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <asm/barrier.h>
@@ -681,7 +682,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		return larb_nr;
 
 	for (i = 0; i < larb_nr; i++) {
-		struct device_node *larbnode;
+		struct device_node *larbnode, *smicomm_node;
 		struct platform_device *plarbdev;
 		u32 id;
 
@@ -707,6 +708,15 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 
 		component_match_add_release(dev, &match, release_of,
 					    compare_of, larbnode);
+		if (!i) {
+			smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
+			if (!smicomm_node)
+				return -EINVAL;
+
+			plarbdev = of_find_device_by_node(smicomm_node);
+			of_node_put(smicomm_node);
+			data->smicomm_dev = &plarbdev->dev;
+		}
 	}
 
 	platform_set_drvdata(pdev, data);
@@ -729,6 +739,16 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	if (!iommu_present(&platform_bus_type))
 		bus_set_iommu(&platform_bus_type, &mtk_iommu_ops);
 
+	if (dev->pm_domain) {
+		struct device_link *link;
+
+		link = device_link_add(data->smicomm_dev, dev,
+				       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+		if (!link) {
+			dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
+			return -EINVAL;
+		}
+	}
 	return component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
 }
 
@@ -743,6 +763,8 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 		bus_set_iommu(&platform_bus_type, NULL);
 
 	clk_disable_unprepare(data->bclk);
+	if (pdev->dev.pm_domain)
+		device_link_remove(data->smicomm_dev, &pdev->dev);
 	devm_free_irq(&pdev->dev, data->irq, data);
 	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
 	return 0;
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index a2e2c844b96e..ae7909815cdb 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -67,6 +67,7 @@ struct mtk_iommu_data {
 
 	struct iommu_device		iommu;
 	const struct mtk_iommu_plat_data *plat_data;
+	struct device			*smicomm_dev;
 
 	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
