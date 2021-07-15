Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F35CC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 12:25:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CE11611AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 12:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CE11611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNlvwDiLqPtM476kNwFqT6+ODjmiKMhJI69WLwI7cfA=; b=rloSglDdLREjWW
	vD1cCX9DeEzic1QIaeoLFIRABcgpX5ZfuwWQ1o5nSdnKIi3UHYGdyAlp5mKtvNbbEZp2I79NxDjH5
	SaO5u6RcxRHIYxOGt9a/FrolLgZp/2gbOR+ydFbaFXaZ/ZMpFSuhnYJpdeGRUe9gK5aSsa33yUO6F
	iell4F7VBmaNq6hUoS2slBIogH5SMjr6nBIQqvQqHi2CH6FnoOxdAKjyk+9NBrYT3o1pZVfLbiM0I
	eHbr579qEVnfhJlwsLYds+A7Zzg2BWQU7x9LxdvFB6eiHYVb+L4mztLc5rcyWGufvOfU6ggYPnfVJ
	9UeKU4+kWx2VJSepZIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m40QT-000mid-TU; Thu, 15 Jul 2021 12:25:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m40Om-000liE-DQ; Thu, 15 Jul 2021 12:23:31 +0000
X-UUID: 454e84c8367443f0a922ffee83279f7e-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Qpaa8N+mAKhy+Qf1/arPnmaJzjekIoVdxpUiob0UyHA=; 
 b=gbel1QdgiuN91UWMS+mMS1Ige4RiI+2mDjr8Yl/9Yty3PYne4iD7Mao1yOuUeKvji7CV7kdsKivQ73I1E6XpLBoO+eVAp1vbrzNUCy2I1Zba1MXDcQjsUiuXP5iwsDyjlPAZ7XM6d2gK09rG+1b0hJV2TBpE89RO1iS6RUge6BU=;
X-UUID: 454e84c8367443f0a922ffee83279f7e-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1789824779; Thu, 15 Jul 2021 05:23:27 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 05:13:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 20:13:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 20:13:21 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>
Subject: [PATCH v2 07/11] memory: mtk-smi: Add smi sub common support
Date: Thu, 15 Jul 2021 20:12:05 +0800
Message-ID: <20210715121209.31024-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210715121209.31024-1-yong.wu@mediatek.com>
References: <20210715121209.31024-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_052328_507191_4C855F68 
X-CRM114-Status: GOOD (  23.34  )
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

In mt8195, there are some larbs connect with the smi-sub-common, then
connect with smi-common.

Before we create device link between smi-larb with smi-common. If we have
sub-common, we should use device link the smi-larb and smi-sub-common,
then use device link between the smi-sub-common with smi-common. This is
for enabling clock/power automatically.

Move the device link code to a new interface for reusing.

There is no SW extra setting for smi-sub-common.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 75 +++++++++++++++++++++++++++-------------
 1 file changed, 51 insertions(+), 24 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index e68cbb51dd12..ee49bb50f5f5 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -60,7 +60,8 @@
 
 enum mtk_smi_type {
 	MTK_SMI_GEN1,
-	MTK_SMI_GEN2
+	MTK_SMI_GEN2,		/* gen2 smi common */
+	MTK_SMI_GEN2_SUB_COMM,	/* gen2 smi sub common */
 };
 
 #define MTK_SMI_CLK_NR_MAX			4
@@ -90,13 +91,14 @@ struct mtk_smi {
 		void __iomem		*smi_ao_base; /* only for gen1 */
 		void __iomem		*base;	      /* only for gen2 */
 	};
+	struct device			*smi_common_dev; /* for sub common */
 	const struct mtk_smi_common_plat *plat;
 };
 
 struct mtk_smi_larb { /* larb: local arbiter */
 	struct mtk_smi			smi;
 	void __iomem			*base;
-	struct device			*smi_common_dev;
+	struct device			*smi_common_dev; /* common or sub-common dev */
 	const struct mtk_smi_larb_gen	*larb_gen;
 	int				larbid;
 	u32				*mmu;
@@ -259,6 +261,38 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{}
 };
 
+static int mtk_smi_device_link_common(struct device *dev, struct device **com_dev)
+{
+	struct platform_device *smi_com_pdev;
+	struct device_node *smi_com_node;
+	struct device *smi_com_dev;
+	struct device_link *link;
+
+	smi_com_node = of_parse_phandle(dev->of_node, "mediatek,smi", 0);
+	if (!smi_com_node)
+		return -EINVAL;
+
+	smi_com_pdev = of_find_device_by_node(smi_com_node);
+	of_node_put(smi_com_node);
+	if (smi_com_pdev) {
+		/* smi common is the supplier, Make sure it is ready before */
+		if (!platform_get_drvdata(smi_com_pdev))
+			return -EPROBE_DEFER;
+		smi_com_dev = &smi_com_pdev->dev;
+		link = device_link_add(dev, smi_com_dev,
+				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+		if (!link) {
+			dev_err(dev, "Unable to link smi-common dev\n");
+			return -ENODEV;
+		}
+		*com_dev = smi_com_dev;
+	} else {
+		dev_err(dev, "Failed to get the smi_common device\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int mtk_smi_dts_clk_init(struct device *dev, struct mtk_smi *smi,
 				unsigned int clk_nr_optional,
 				const char * const clk_optional[])
@@ -285,9 +319,6 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	struct mtk_smi_larb *larb;
 	struct resource *res;
 	struct device *dev = &pdev->dev;
-	struct device_node *smi_node;
-	struct platform_device *smi_pdev;
-	struct device_link *link;
 	int ret;
 
 	larb = devm_kzalloc(dev, sizeof(*larb), GFP_KERNEL);
@@ -307,26 +338,10 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 		return ret;
 
 	larb->smi.dev = dev;
-	smi_node = of_parse_phandle(dev->of_node, "mediatek,smi", 0);
-	if (!smi_node)
-		return -EINVAL;
 
-	smi_pdev = of_find_device_by_node(smi_node);
-	of_node_put(smi_node);
-	if (smi_pdev) {
-		if (!platform_get_drvdata(smi_pdev))
-			return -EPROBE_DEFER;
-		larb->smi_common_dev = &smi_pdev->dev;
-		link = device_link_add(dev, larb->smi_common_dev,
-				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
-		if (!link) {
-			dev_err(dev, "Unable to link smi-common dev\n");
-			return -ENODEV;
-		}
-	} else {
-		dev_err(dev, "Failed to get the smi_common device\n");
-		return -EINVAL;
-	}
+	ret = mtk_smi_device_link_common(dev, &larb->smi_common_dev);
+	if (ret < 0)
+		return ret;
 
 	pm_runtime_enable(dev);
 	platform_set_drvdata(pdev, larb);
@@ -471,6 +486,14 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 		if (IS_ERR(common->base))
 			return PTR_ERR(common->base);
 	}
+
+	/* link its smi-common if this is smi-sub-common */
+	if (common->plat->type == MTK_SMI_GEN2_SUB_COMM) {
+		ret = mtk_smi_device_link_common(dev, &common->smi_common_dev);
+		if (ret < 0)
+			return ret;
+	}
+
 	pm_runtime_enable(dev);
 	platform_set_drvdata(pdev, common);
 	return 0;
@@ -478,6 +501,10 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 
 static int mtk_smi_common_remove(struct platform_device *pdev)
 {
+	struct mtk_smi *common = dev_get_drvdata(&pdev->dev);
+
+	if (common->plat->type == MTK_SMI_GEN2_SUB_COMM)
+		device_link_remove(&pdev->dev, common->smi_common_dev);
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
