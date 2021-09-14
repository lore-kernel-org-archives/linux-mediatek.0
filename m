Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC04BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 11:46:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 721D860E52
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 11:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 721D860E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5FtS33TSQzxZXsF9fJ/P+ZuMVoipnLRPBgjMMG7SXM=; b=zxiRmkZOA/pC+N
	CbLNEwmGiQiGtwarJGyItdL62sg2oYvBqeTn1dJqn1nSfgrf9Rn/PV4XcUEtStcpwYDR7yWKfW6gV
	d0SN3X4Rew8eJyobnIKUjSND2HelXk5heWs+elRoFsCaIg6HW393BL+9d9pA+U2NBzWwYlbHgFykH
	bMQwDIpto4PY/8jTu6txu6dzzQ/GST1tSsQ7ew0SMrhlS2FGtRnVWJ0jVPWgQ+4WlPtPox8EZMAGr
	CoOePCKRCTppCxcQlINFZ2YYRG4o1oVuEj2uMJLAo4QrljTkdTqDySPrxRViA36pMFKlb6PypDDLJ
	zsojS1ZDHhIQaS25A2NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ6t5-005SSl-SK; Tue, 14 Sep 2021 11:46:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ6sr-005SOv-Bh; Tue, 14 Sep 2021 11:45:54 +0000
X-UUID: d0416169d5fd485bb2a9024407c1673d-20210914
X-UUID: d0416169d5fd485bb2a9024407c1673d-20210914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2042871608; Tue, 14 Sep 2021 04:45:49 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 04:38:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 19:38:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 19:38:43 +0800
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
Subject: [PATCH v4 09/13] memory: mtk-smi: Use devm_platform_ioremap_resource
Date: Tue, 14 Sep 2021 19:36:59 +0800
Message-ID: <20210914113703.31466-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210914113703.31466-1-yong.wu@mediatek.com>
References: <20210914113703.31466-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_044553_450283_FA1C2D9F 
X-CRM114-Status: GOOD (  13.59  )
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
