Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3C7C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:35:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1622460F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1622460F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsZfaXu7SW7+Wx+JRQY5Afn+/4VtPh2atsstNuP/IfQ=; b=Mh6ZRxgRU3MUuY
	4YmuxhkB2sAvuJyC4Ec5yiOn68uQx59vSpmnkF6GLvSgt/ga8tPei6GiToYPBHF18m63JaOaWDhKy
	Wmg6ZR+BTL4F5mHrydhoMZZxvS6nDrXaaVU4n1VbcZOZ0urcMJ6J01g47Nx92HNbQZZAEokIt7owf
	bRF3/n66Oi7qvjSD/fAYSA5BrZhAI+qfdaXyRMeIa80uYhSHfc5Dx22L3nfYGK3wD9NGZxUlyuXNP
	w80Srkj9FiDnXVnd7zUOOd2fYmrPdyGJK959AT+V/qQOMzNqV3lLLTgV04CaRfEW7XwHzsPdgQFR7
	mrihfbXmYwuUkd56+Lgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkda-006KpP-P3; Wed, 11 Aug 2021 09:35:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDkOs-006Fmm-9R; Wed, 11 Aug 2021 09:19:51 +0000
X-UUID: 89aa02bd9c494dedb72b145f902dabae-20210811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hkHiwmQBkSBJTMrG1BbSAzQFqP14nDXKl93wu+CX4XE=; 
 b=UbBMtiOfCVXDjd3q+3Wgl5sMby0umOLZs7/G86n+5tSnw2ocbQAoIDjsy1HpnNV4WkrDNsjP1fJuT2HzHnJy2rl+m+WUcAjKMSivPRiw85UEMPfB6hzJ+2iZUX3QJHGXqM/2TXCUUChABZoUdFdRRssQvQ1qeBPvBmBiMS680OY=;
X-UUID: 89aa02bd9c494dedb72b145f902dabae-20210811
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 433261550; Wed, 11 Aug 2021 02:19:44 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 02:19:42 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 17:19:34 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Aug 2021 17:19:34 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 9/9] phy: phy-mtk-mipi-dsi: convert to
 devm_platform_ioremap_resource
Date: Wed, 11 Aug 2021 17:18:40 +0800
Message-ID: <1628673520-23537-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628673520-23537-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628673520-23537-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_021950_409188_46B2B6B2 
X-CRM114-Status: GOOD (  13.26  )
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
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
