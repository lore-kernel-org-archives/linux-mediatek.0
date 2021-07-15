Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AF6C1B08C
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 12:24:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C451613BC
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 12:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C451613BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0KkAZIsPxFJNqFjd2mOKMQBiTCTHj2E/dd1R+PZm5g=; b=msdiAr42xzpAmy
	0JJmzGZUfM1F2EVIx/f6IgT5zpl8U71j8ycPd/xDGc47V+PfFmewyUEDuygKUXANrShlY2+Z9mOT3
	U7PZi2sqvGJGjYOBMNjGY/7jqku33yQ9MTPbugokTsqriWBPkOCIWZk38gx+/M9gFHMjQDVqad1v7
	u7TGCZsZb+6yun4jBU98df8KunEy4TdN/A5OQRd3i1NsZz/15JPp8gdBrvwWlBXzoaSx7o1zXkPtC
	tNNbYG1JxUf6w1nRsqVHot/tnsjWCiLrfTBGt/ctzXQ1GPK8Xw/lKfH3gbfr4osZxg96y+De3uftE
	NgcDIW+avgQUD7mjnSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m40Ps-000mLC-4U; Thu, 15 Jul 2021 12:24:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m40OH-000lVH-Sk; Thu, 15 Jul 2021 12:22:59 +0000
X-UUID: 3209cd22f0da43b4b8c8dc913006d26e-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EdALkmVUI7cZJxGcQ5DTGDv9uqIt4BRJq5jJtYDFi8A=; 
 b=OtMqOHjjqDk/7OSooB2IPwOYAib86wOdmWSP+CTqQFlhhOrTjp9YM2ZCXcHa84NjZjXiv7XkVF+KgTjh9hLewcfb9gic6F2wUDst0iB6pRaDjJB5m7CxWA9R1cGOdjNkagpf2/ljrVj1eLfpKFGoRJuvrV4rLKUGS5mA8nKt9pQ=;
X-UUID: 3209cd22f0da43b4b8c8dc913006d26e-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1782707040; Thu, 15 Jul 2021 05:22:49 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 05:13:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 20:13:29 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 20:13:28 +0800
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
Subject: [PATCH v2 08/11] memory: mtk-smi: Use devm_platform_ioremap_resource
Date: Thu, 15 Jul 2021 20:12:06 +0800
Message-ID: <20210715121209.31024-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210715121209.31024-1-yong.wu@mediatek.com>
References: <20210715121209.31024-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_052258_024168_24DFED99 
X-CRM114-Status: GOOD (  13.46  )
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

No functional change. Simplify probing code.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index ee49bb50f5f5..e5a34b3952a0 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -317,7 +317,6 @@ static int mtk_smi_dts_clk_init(struct device *dev, struct mtk_smi *smi,
 static int mtk_smi_larb_probe(struct platform_device *pdev)
 {
 	struct mtk_smi_larb *larb;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -326,8 +325,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	larb->larb_gen = of_device_get_match_data(dev);
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	larb->base = devm_ioremap_resource(dev, res);
+	larb->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(larb->base))
 		return PTR_ERR(larb->base);
 
@@ -447,7 +445,6 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_smi *common;
-	struct resource *res;
 	int ret;
 
 	common = devm_kzalloc(dev, sizeof(*common), GFP_KERNEL);
@@ -468,8 +465,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 	 * base.
 	 */
 	if (common->plat->type == MTK_SMI_GEN1) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		common->smi_ao_base = devm_ioremap_resource(dev, res);
+		common->smi_ao_base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(common->smi_ao_base))
 			return PTR_ERR(common->smi_ao_base);
 
@@ -481,8 +477,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	} else {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		common->base = devm_ioremap_resource(dev, res);
+		common->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(common->base))
 			return PTR_ERR(common->base);
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
