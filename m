Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B03C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 09:37:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5452820855
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 09:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5452820855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Fz/5VlojpRKPdWysoWKIXr8tHYpRTZ38i0h2dpZN5o=; b=a5tYV5MiFYwQ1pQY+40FzNcYp
	31ZVJXF67c5IPQ4bQh4DK+Tv40mQ81UYuUKkcH1wE1wAJ1pPUMauZhwJlvT1d13SRQYt3G/yeHvBU
	W4VmZOxF+1mnqT2OFPdMRPkhDbvq/B4RgzKJTxh38T0LEBQMfgbTOl2/BreTP2C8I0wcY/K1uU6g3
	TQpK/j1/09F64HMjCnRYdaTByYNtP5jsrb2HpbMICexUsNdNZBYXU/m6CDU7+I/PVZzb8JY6rtyYJ
	QxRMr2pbohGXhLvEIOb7uM+v2ekhOSGWjj7AbKwTVebc3Bs70aiaIalIsmYcC+VFJHjyg5HIdNmcA
	sM+flvp4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks0Zq-00076g-Nt; Wed, 23 Dec 2020 09:37:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks0Zn-00075G-BU; Wed, 23 Dec 2020 09:37:00 +0000
X-UUID: 860c528896214ca7b7f98a6ff55bc669-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ahbWRcPcWQCgNbqrlq91xsX5/hkLrfZyOxN384yVm+I=; 
 b=T70vTQ/EjaJOAEZC0qahv5IiJktedFnD/dBUlMSfICpoYdPzYdMCnK8b06A2fXUxQgZoJbHCCHgZiRuPlhagVPIAW406PVMXWv/J5QVQPcom0Yw146wCQQv6/S1+tA/UXaU4OlnJVN9ylKVwSTXD9rEXWy7jJk5MJKHvwEngrHw=;
X-UUID: 860c528896214ca7b7f98a6ff55bc669-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 687040666; Wed, 23 Dec 2020 01:36:55 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 01:31:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 17:31:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Dec 2020 17:31:05 +0800
From: EastL Lee <EastL.Lee@mediatek.com>
To: Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v8 3/4] dmaengine: mediatek-cqdma: add dma mask for capability
Date: Wed, 23 Dec 2020 17:30:46 +0800
Message-ID: <1608715847-28956-4-git-send-email-EastL.Lee@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1608715847-28956-1-git-send-email-EastL.Lee@mediatek.com>
References: <1608715847-28956-1-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_043659_600031_28CF2FB7 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, cc.hwang@mediatek.com,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 EastL Lee <EastL.Lee@mediatek.com>, dmaengine@vger.kernel.org,
 vkoul@kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch add dma mask for capability.

Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/dma/mediatek/mtk-cqdma.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 905bbcb..1610632 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -117,6 +117,7 @@ struct mtk_cqdma_vchan {
  * @clk:                    The clock that device internal is using
  * @dma_requests:           The number of VCs the device supports to
  * @dma_channels:           The number of PCs the device supports to
+ * @dma_mask:               A mask for DMA capability
  * @vc:                     The pointer to all available VCs
  * @pc:                     The pointer to all the underlying PCs
  */
@@ -126,6 +127,7 @@ struct mtk_cqdma_device {
 
 	u32 dma_requests;
 	u32 dma_channels;
+	u32 dma_mask;
 	struct mtk_cqdma_vchan *vc;
 	struct mtk_cqdma_pchan **pc;
 };
@@ -607,6 +609,21 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
 		cqdma->dma_channels = MTK_CQDMA_NR_PCHANS;
 	}
 
+	if (pdev->dev.of_node)
+		err = of_property_read_u32(pdev->dev.of_node,
+					   "dma-channel-mask",
+					   &cqdma->dma_mask);
+	if (err) {
+		dev_warn(&pdev->dev,
+			 "Using 0 as missing dma-channel-mask property\n");
+		cqdma->dma_mask = 0;
+	}
+
+	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(cqdma->dma_mask))) {
+		dev_warn(&pdev->dev, "DMA set mask failed\n");
+		return -EINVAL;
+	}
+
 	cqdma->pc = devm_kcalloc(&pdev->dev, cqdma->dma_channels,
 				 sizeof(*cqdma->pc), GFP_KERNEL);
 	if (!cqdma->pc)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
