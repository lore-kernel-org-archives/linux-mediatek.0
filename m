Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB37C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 02:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uns+KOB1u0em8yS53u1f4EzFO2f1PGbCLBnwwFShd9k=; b=0yGojPl+kVC98U
	HyD1ZjsRghMUn1CADsZiezPAvHZWfhA5y4oG63LicSNVM2SFZO2P9r8a2AIobsBA1DSHjkUTjm8aW
	X/QII5WtGssbFTmu0P5gAcQMTNhxcj2ibIIXrRvmnXxLOuSDQVDjvvQgny5E+KGrDt+q+DVheq+v5
	wED2mi5PHz/Gbv1+Gu1kxsFf2Lhg2nHwzXgfllz1fXYk/szbQkVfR4XLBxTyKPaELQOCErqfwMONl
	eSwEwBLM5HnnRZyVqpQEMLkcYV0YEqEz5CrBr1cdyw60YTFCmUlhwA45nQejvBvjbcj37W2RhzP9G
	ZBxsZSa4GklNSRraq1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxJqt-00GNRO-Lf; Wed, 15 Dec 2021 02:17:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxJqq-00GNNF-6C; Wed, 15 Dec 2021 02:17:05 +0000
X-UUID: 898c2c7de809409ea6d7455afd2b1592-20211214
X-UUID: 898c2c7de809409ea6d7455afd2b1592-20211214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 92758897; Tue, 14 Dec 2021 19:16:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Dec 2021 18:16:56 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 15 Dec 2021 10:16:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 15 Dec 2021 10:16:54 +0800
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
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Subject: [PATCH net-next v9 2/6] stmmac: dwmac-mediatek: Reuse more common
 features
Date: Wed, 15 Dec 2021 10:16:48 +0800
Message-ID: <20211215021652.7270-3-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215021652.7270-1-biao.huang@mediatek.com>
References: <20211215021652.7270-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_181704_264985_25C8396F 
X-CRM114-Status: GOOD (  11.62  )
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
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 32 +++++++++----------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 0ff57c268dca..8747aa4403e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -334,22 +334,20 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
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
@@ -422,15 +420,15 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
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
