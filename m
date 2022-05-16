Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19911C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMKuIrUnW0Ee8ynaEJIX81TicbW2BAhqz4H7EqZP3Gw=; b=y1EZ8NO5y16jzr
	YlKQT0LARyqxl9BpncqleD5H0vHrzLmdn3jFwXfQwiSmyEhJWv8Ro3LQSm3PModxfPVZwvZuTZ2aI
	gtp6Iz5KmQP+ouwAyoHNbbrVjNah1usJZpb/Ev8PfBlTqbM1QHTawcLF49CNrPU5vqT4QJKPcYP2S
	pJ3le5/4RCaeoHX8j+7a+SuvCU6TzWymJlflTSe4e6lqMy72fyJkZfPp4abYGHSyEnCR+UvoN0ZIN
	X93zGxehbeK5VnDfujEqAKEUh7MGoy0grjIL6unHCpUNm92vK2ipDTngUr0pN0DfML61yLAt4N9zY
	mXhDN10J5gnbWipZaqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdHs-008sXh-Gu; Mon, 16 May 2022 16:09:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdGp-008rdU-Da
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 16:08:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13C02B81262;
 Mon, 16 May 2022 16:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46D9C385AA;
 Mon, 16 May 2022 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717308;
 bh=uM3ccAJWdxDoSZRLhAr0NaFqOgPx8bqnk2xxzO/IuVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oO4zdUWmjDwrudVQk++1yhWHpuI30+WM5WktqlkYfCcNzj6W4Oe7NHz0BdvW0fj3G
 jJn551vhucEYa8Mb1+qKJdXOZRDWLF00DFr12zsxVmLF/21LeCQu2lkODd2NCR6U1m
 pCKtSLJ6twW+Mh+wftLj2j4+dkG5OgDtDIOOQax59mamKsLkiIZ6XbKpDXcg17tPap
 5oeW295IHSZztTsRxmwT/ELdvhbY0l6+iVlcnhJf4iIBzeI0PBi6gwk9kkJmxGFuqe
 7YPSOx3uWQmFoyHq+Se1l6JXTElwjfRH2Fg6+s4ONwqWhPenAl0CwgygP6kLcMqLCk
 Rhm338CZyo8SA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v2 net-next 15/15] net: ethernet: mtk_eth_soc: introduce
 support for mt7986 chipset
Date: Mon, 16 May 2022 18:06:42 +0200
Message-Id: <5b8e9a0256bd1da216ff508d70bd5a8b9f3113f1.1652716741.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090831_804973_696B1C61 
X-CRM114-Status: GOOD (  13.55  )
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

Add support for mt7986-eth driver available on mt7986 soc.

Tested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 29 ++++++++++++++++++++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 18 +++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 373d9733e66f..ce3c242f14fa 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -45,6 +45,17 @@ static const u32 mtk_reg_map[] = {
 	[MTK_PDMA_RSS_GLO_BASE]			= 0x3000,
 };
 
+static const u32 mt7986_reg_map[] = {
+	[MTK_PDMA_BASE]				= 0x6000,
+	[MTK_PDMA_LRO_CTRL]			= 0x6408,
+	[MTK_PDMA_ALT_SCORE_DELTA_BASE]		= 0x641c,
+	[MTK_PDMA_LRO_RX_RING_DIP_BASE]		= 0x6414,
+	[MTK_PDMA_LRO_RX_RING_CTRL_BASE]	= 0x6438,
+	[MTK_QDMA_BASE]				= 0x4400,
+	[MTK_GDM1_TX_STAT_BASE]			= 0x1c00,
+	[MTK_PDMA_RSS_GLO_BASE]			= 0x6800,
+};
+
 /* strings used by ethtool */
 static const struct mtk_ethtool_stats {
 	char str[ETH_GSTRING_LEN];
@@ -68,7 +79,7 @@ static const char * const mtk_clks_source_name[] = {
 	"ethif", "sgmiitop", "esw", "gp0", "gp1", "gp2", "fe", "trgpll",
 	"sgmii_tx250m", "sgmii_rx250m", "sgmii_cdr_ref", "sgmii_cdr_fb",
 	"sgmii2_tx250m", "sgmii2_rx250m", "sgmii2_cdr_ref", "sgmii2_cdr_fb",
-	"sgmii_ck", "eth2pll",
+	"sgmii_ck", "eth2pll", "wocpu0", "wocpu1", "netsys0", "netsys1"
 };
 
 void mtk_w32(struct mtk_eth *eth, u32 val, unsigned reg)
@@ -3625,6 +3636,21 @@ static const struct mtk_soc_data mt7629_data = {
 	},
 };
 
+static const struct mtk_soc_data mt7986_data = {
+	.reg_map = mt7986_reg_map,
+	.ana_rgc3 = 0x128,
+	.caps = MT7986_CAPS,
+	.required_clks = MT7986_CLKS_BITMAP,
+	.required_pctl = false,
+	.txrx = {
+		.txd_size = sizeof(struct mtk_tx_dma_v2),
+		.rxd_size = sizeof(struct mtk_rx_dma_v2),
+		.rx_irq_done_mask = MTK_RX_DONE_INT_V2,
+		.dma_max_len = MTK_TX_DMA_BUF_LEN_V2,
+		.dma_len_offset = 8,
+	},
+};
+
 static const struct mtk_soc_data rt5350_data = {
 	.reg_map = mtk_reg_map,
 	.caps = MT7628_CAPS,
@@ -3647,6 +3673,7 @@ const struct of_device_id of_mtk_match[] = {
 	{ .compatible = "mediatek,mt7622-eth", .data = &mt7622_data},
 	{ .compatible = "mediatek,mt7623-eth", .data = &mt7623_data},
 	{ .compatible = "mediatek,mt7629-eth", .data = &mt7629_data},
+	{ .compatible = "mediatek,mt7986-eth", .data = &mt7986_data},
 	{ .compatible = "ralink,rt5350-eth", .data = &rt5350_data},
 	{},
 };
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index d955af42ad93..1972bc18af0c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -763,6 +763,10 @@ enum mtk_clks_map {
 	MTK_CLK_SGMII2_CDR_FB,
 	MTK_CLK_SGMII_CK,
 	MTK_CLK_ETH2PLL,
+	MTK_CLK_WOCPU0,
+	MTK_CLK_WOCPU1,
+	MTK_CLK_NETSYS0,
+	MTK_CLK_NETSYS1,
 	MTK_CLK_MAX
 };
 
@@ -793,6 +797,16 @@ enum mtk_clks_map {
 				 BIT(MTK_CLK_SGMII2_CDR_FB) | \
 				 BIT(MTK_CLK_SGMII_CK) | \
 				 BIT(MTK_CLK_ETH2PLL) | BIT(MTK_CLK_SGMIITOP))
+#define MT7986_CLKS_BITMAP	(BIT(MTK_CLK_FE) | BIT(MTK_CLK_GP2) | BIT(MTK_CLK_GP1) | \
+				 BIT(MTK_CLK_WOCPU1) | BIT(MTK_CLK_WOCPU0) | \
+				 BIT(MTK_CLK_SGMII_TX_250M) | \
+				 BIT(MTK_CLK_SGMII_RX_250M) | \
+				 BIT(MTK_CLK_SGMII_CDR_REF) | \
+				 BIT(MTK_CLK_SGMII_CDR_FB) | \
+				 BIT(MTK_CLK_SGMII2_TX_250M) | \
+				 BIT(MTK_CLK_SGMII2_RX_250M) | \
+				 BIT(MTK_CLK_SGMII2_CDR_REF) | \
+				 BIT(MTK_CLK_SGMII2_CDR_FB))
 
 enum mtk_dev_state {
 	MTK_HW_INIT,
@@ -991,6 +1005,10 @@ enum mkt_eth_capabilities {
 		      MTK_MUX_U3_GMAC2_TO_QPHY | \
 		      MTK_MUX_GMAC12_TO_GEPHY_SGMII | MTK_QDMA)
 
+#define MT7986_CAPS  (MTK_GMAC1_SGMII | MTK_GMAC2_SGMII | \
+		      MTK_MUX_GMAC12_TO_GEPHY_SGMII | MTK_QDMA | \
+		      MTK_NETSYS_V2 | MTK_RSTCTRL_PPE1)
+
 struct mtk_tx_dma_desc_info {
 	dma_addr_t addr;
 	u32 size;
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
