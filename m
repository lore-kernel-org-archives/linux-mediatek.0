Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B6BC4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:21:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B75BA60F11
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B75BA60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnEqWb7NtxxxdQZqz0JneRHiOj6JfxFu09jZj12i6Y0=; b=QPot3UdIbZOnTz
	9rU4oREiWkh7Y798NYnuMHk0lwpXFUEex7FNZ8kNdnnnhQ97lwJB2OMZKn1+ccy5JtzuKgS4W6qJC
	/LeAj/7J6+wkNZdO181/4m+amWFyyX188kTweqNBjw1xoT8hguD9ku/kqk4vrOpHz11zvupX4XMwi
	Gfh4/G0m/VvQ/KzkP16t3KJufAIQXvI9CFt9SdAcm0eP0UNa+Y41Yy2FRwgiyGiZj2yYFeV+1xX1l
	7T7D66tURVoqxQco2HdxIPmo6kkR2iRQsJ74WL+o7f4o8D6T2AOn5/HK8dfciUQj/xgLmlZ4tl5l+
	MM+TsEN2irEiog1iXE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFvHv-001mJ4-Vh; Tue, 17 Aug 2021 09:21:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFvGd-001lfj-Eq; Tue, 17 Aug 2021 09:20:22 +0000
X-UUID: de831d96d85045cc823a1975b768df7e-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8pqQG7zU+DEbeOSp4edBC9vn9HQw5looQuneG7tFPdU=; 
 b=dTL7ezACsfowBFEPgItw+SLC9mzkjOjyNdgWjrqb10c9HACgDThR0TQMnXBcFtjZQZ+aVKDiP2XPEbTrKKM179xbA4bFRvtIykrfhhUG2Q525jlec1FCexBmNOzq1p8uUrGXIKk8lzUpdKZSWsX84Ev6/iMqjmpAc9M8jxZjWOw=;
X-UUID: de831d96d85045cc823a1975b768df7e-20210817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 918850194; Tue, 17 Aug 2021 02:20:18 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 02:20:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 17:20:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 17:20:14 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v3 9/9] phy: phy-mtk-mipi-dsi: convert to
 devm_platform_ioremap_resource
Date: Tue, 17 Aug 2021 17:19:47 +0800
Message-ID: <1629191987-20774-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_022019_556851_125C27CB 
X-CRM114-Status: GOOD (  12.87  )
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

Use devm_platform_ioremap_resource to simplify code

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: no changes
v2: add acked-by CK
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 61c942fbf4a1..28ad9403c441 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -130,7 +130,6 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_mipi_tx *mipi_tx;
-	struct resource *mem;
 	const char *ref_clk_name;
 	struct clk *ref_clk;
 	struct clk_init_data clk_init = {
@@ -148,11 +147,9 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 
 	mipi_tx->driver_data = of_device_get_match_data(dev);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mipi_tx->regs = devm_ioremap_resource(dev, mem);
-	if (IS_ERR(mipi_tx->regs)) {
+	mipi_tx->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mipi_tx->regs))
 		return PTR_ERR(mipi_tx->regs);
-	}
 
 	ref_clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(ref_clk)) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
