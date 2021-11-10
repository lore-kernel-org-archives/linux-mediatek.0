Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A4BC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 08:42:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB5D061076
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 08:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB5D061076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyh2SLzV7MqlHwjGcDi8LFjMxNmoTI7MovwfIz8up18=; b=g+QnDKmi2CAoNO
	BGRHVOIq/zYQ4KjoO5by1SNo9xANuXmrY/qxq3LiA6HZ2yDsNlpZ92q9W9DLIIazxv7WBnFlMvIv+
	+whjyPNtoQqJwDQlnozpsYXl4+MhLEgO3DkFNJ7h19VWTOGbqzbT8/leMUp6npRUtKvRxaABxd3lz
	TW6S5qbtr1LQshRFkl6JejmIobiyu9NFW2ziL5voqsevX6eFxNrNPleU/sO+bjjqX3WKUVmJpLz3s
	iaEl6VqCtSFkAkCn5CppcT5kDjXQS5EPHakbRX9hCGPVwVuZVCx3GrlOkrcW1dPpZkE0HktvKjlHf
	4qqyCeIXDg7Ipk7FNSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkjBL-004qwV-0y; Wed, 10 Nov 2021 08:42:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkjAD-004qDc-N5; Wed, 10 Nov 2021 08:41:03 +0000
X-UUID: 09640f0913da4b3c9136abdb7c3b2799-20211110
X-UUID: 09640f0913da4b3c9136abdb7c3b2799-20211110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 592122692; Wed, 10 Nov 2021 01:40:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Nov 2021 00:40:09 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 10 Nov 2021 16:40:08 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Wed, 10 Nov 2021 16:40:07 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>
Subject: [PATCH 2/5] net: stmmac: dwmac-mediatek: Reuse more common features
Date: Wed, 10 Nov 2021 16:39:45 +0800
Message-ID: <20211110083948.6082-3-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110083948.6082-1-biao.huang@mediatek.com>
References: <20211110083948.6082-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_004101_793704_61840414 
X-CRM114-Status: GOOD (  12.61  )
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

This patch makes dwmac-mediatek reuse more features
supported by stmmac_platform.c.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 32 +++++++++----------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 157ff655c85e..6ea972e96665 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -335,22 +335,20 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
 	const struct mediatek_dwmac_variant *variant = plat->variant;
 	int ret;
 
-	ret = dma_set_mask_and_coherent(plat->dev, DMA_BIT_MASK(variant->dma_bit_mask));
-	if (ret) {
-		dev_err(plat->dev, "No suitable DMA available, err = %d\n", ret);
-		return ret;
-	}
-
-	ret = variant->dwmac_set_phy_interface(plat);
-	if (ret) {
-		dev_err(plat->dev, "failed to set phy interface, err = %d\n", ret);
-		return ret;
+	if (variant->dwmac_set_phy_interface) {
+		ret = variant->dwmac_set_phy_interface(plat);
+		if (ret) {
+			dev_err(plat->dev, "failed to set phy interface, err = %d\n", ret);
+			return ret;
+		}
 	}
 
-	ret = variant->dwmac_set_delay(plat);
-	if (ret) {
-		dev_err(plat->dev, "failed to set delay value, err = %d\n", ret);
-		return ret;
+	if (variant->dwmac_set_delay) {
+		ret = variant->dwmac_set_delay(plat);
+		if (ret) {
+			dev_err(plat->dev, "failed to set delay value, err = %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = clk_bulk_prepare_enable(plat->num_clks_to_config, plat->clks);
@@ -423,15 +421,15 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(plat_dat);
 
 	plat_dat->interface = priv_plat->phy_mode;
-	plat_dat->has_gmac4 = 1;
-	plat_dat->has_gmac = 0;
-	plat_dat->pmt = 0;
+	plat_dat->use_phy_wol = 1;
 	plat_dat->riwt_off = 1;
 	plat_dat->maxmtu = ETH_DATA_LEN;
+	plat_dat->addr64 = priv_plat->variant->dma_bit_mask;
 	plat_dat->bsp_priv = priv_plat;
 	plat_dat->init = mediatek_dwmac_init;
 	plat_dat->exit = mediatek_dwmac_exit;
 	plat_dat->clks_config = mediatek_dwmac_clks_config;
+
 	mediatek_dwmac_init(pdev, priv_plat);
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
