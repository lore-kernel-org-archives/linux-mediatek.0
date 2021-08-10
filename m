Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2D4C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:12:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D0CE6105A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D0CE6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7S1NXV9+tyttw8KwMAocMZHp11CeSLAKG02Kd9w/R58=; b=YZBGwFvvS4NQUe
	TgdtfbxgFTvhZnhsr8gJV3KShfeaCx3v71tCytPcTN/4jbJv1YnKiqiGDCVbKzZrpGuoXVOI8pu0A
	LHdzCYoR75hrvSWyHd+2GqexzJFa/HuIj52gUABrNcbHKPVHXz9myibA1pe6cc5s/igTog0AbJo6h
	DKNP122uLkvN9DQn4QGpmy67kv0DVZT8MoIC1SGNMHK3w2ZDYzU0ct37M/7EbIWt6xe7KlbJAHd0d
	36nztgwgpm6KRzeMuBQiIWXr4HwJHljsPtNCkvgBu1Pl9CMyY40bUs5gWe1OCX5sA1vdKBYjv/fr+
	RAvtON8VX2Sdm2wxRznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMrS-002ucm-8x; Tue, 10 Aug 2021 08:11:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMqF-002tw5-VQ; Tue, 10 Aug 2021 08:10:33 +0000
X-UUID: 07954fc470b446aba55d15f94542a36e-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BPIA86ydOihaRW/IB1l21CFSUX2p7+jyLgknFMIZPd4=; 
 b=ijFKgJsl36LflWDMc0lBY+GFl/FqqAnDD5qaKwjg8teSvFsmgYVfGYP4g5GRsJB0xqvZ0sOrP/WY+q5phm4Mv60bhS34lAa2yGdsOBbWoyzUdFl0BjBWriaKqWjwMq+2eL2BLkzyS3dUUK9mcXlcudGohFJIYAWVV/76iBvySd8=;
X-UUID: 07954fc470b446aba55d15f94542a36e-20210810
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1393494596; Tue, 10 Aug 2021 01:10:30 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 01:10:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:10:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:10:25 +0800
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
 <anthony.huang@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v3 09/13] memory: mtk-smi: Use devm_platform_ioremap_resource
Date: Tue, 10 Aug 2021 16:08:55 +0800
Message-ID: <20210810080859.29511-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210810080859.29511-1-yong.wu@mediatek.com>
References: <20210810080859.29511-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_011032_049361_483FDF7A 
X-CRM114-Status: GOOD (  13.32  )
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
Reviewed-by: Ikjoon Jang <ikjn@chromium.org>
---
 drivers/memory/mtk-smi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 58d9f7667490..a001e41f5074 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -328,7 +328,6 @@ static int mtk_smi_dts_clk_init(struct device *dev, struct mtk_smi *smi,
 static int mtk_smi_larb_probe(struct platform_device *pdev)
 {
 	struct mtk_smi_larb *larb;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -337,8 +336,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	larb->larb_gen = of_device_get_match_data(dev);
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	larb->base = devm_ioremap_resource(dev, res);
+	larb->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(larb->base))
 		return PTR_ERR(larb->base);
 
@@ -460,7 +458,6 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_smi *common;
-	struct resource *res;
 	int ret, clk_required = MTK_SMI_COM_REQ_CLK_NR;
 
 	common = devm_kzalloc(dev, sizeof(*common), GFP_KERNEL);
@@ -486,8 +483,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 	 * base.
 	 */
 	if (common->plat->type == MTK_SMI_GEN1) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		common->smi_ao_base = devm_ioremap_resource(dev, res);
+		common->smi_ao_base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(common->smi_ao_base))
 			return PTR_ERR(common->smi_ao_base);
 
@@ -499,8 +495,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
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
