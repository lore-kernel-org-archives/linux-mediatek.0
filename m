Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 03:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uns+KOB1u0em8yS53u1f4EzFO2f1PGbCLBnwwFShd9k=; b=Tv40SZmxBPElei
	pg7RlmQMQ/FHe7qQp1Vjo+EtJsPDHJdBetdCV53USkZm5f63i+WSRivTuDttNyDsUadHtefVFvhPh
	jIwVlnAvK0Nwx8OI9dRv0fGq2CPX0OJGWg1xErIROWU+uOD+4aZuru083SIy8Fp5WgtJtfdZcmQm7
	wFVK9hzvevKgSKqki71sQeuubpvo8qlGn+mDiiC0sHqVeaI37Z/XLAnjcbDNi0hzfU1uq9DkHkQep
	vFPCtPCYrr8Q9iLDTgwcUj3q9NDOxi4GSE8ZkqFF/j2cHamGrxYVqEw6tIwKxxaoOAm0R0bugF2vW
	BefmehRE6XjLvzTptVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4ag8-00AFtl-GA; Tue, 04 Jan 2022 03:40:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4ag1-00AFoX-GI; Tue, 04 Jan 2022 03:39:58 +0000
X-UUID: 3bddc2698a9e472eb6c5bfd50cdb186d-20220103
X-UUID: 3bddc2698a9e472eb6c5bfd50cdb186d-20220103
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1170615655; Mon, 03 Jan 2022 20:39:53 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Jan 2022 19:39:52 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 4 Jan 2022 11:39:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Jan 2022 11:39:44 +0800
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
Subject: [PATCH net-next v11 2/6] stmmac: dwmac-mediatek: Reuse more common
 features
Date: Tue, 4 Jan 2022 11:39:36 +0800
Message-ID: <20220104033940.5497-3-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104033940.5497-1-biao.huang@mediatek.com>
References: <20220104033940.5497-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_193957_576644_12DBA7B9 
X-CRM114-Status: GOOD (  12.16  )
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
