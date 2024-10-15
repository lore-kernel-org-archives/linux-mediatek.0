Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A59CFC288
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 11:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FT6atkLxU1yFTV6GUySFpuOea9HLCvMp3YdIekBRWKI=; b=R+Iij8qKtLDAGMKPsinL6uQR6K
	HldfOmlg6B/6oVmunauO+6s0MsK/2kSrFcnTKhqnTRgyBO2pc0mE1wHBe9/qkAyrIHyySqPLO8JVs
	1qfdn0UaCc+ZvaNn2F6vD9ZDFFsxdP9qd7/yXeSf8S6HqIMHVb2r0MkUFc3+olJAYfcyAddkpo77a
	9sWTokdGqBWFmd1g4wpDlDCk/6dfmY6qS+SD1alQ2u7JqQ4QCaNDSGkVUebPn0HIQ6RA6CL95DG4C
	Qoxgwq+fHlB9/hBtjRCl5Sizr49L6GyqEAjpxGGfI5DNByDnKncZzxR5CVuBBGQRZ885WwqW2/d3R
	e7lCZAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fa9-00000007zWO-2fqo;
	Tue, 15 Oct 2024 11:19:17 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fR7-00000007xwq-3Jxa;
	Tue, 15 Oct 2024 11:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FT6atkLxU1yFTV6GUySFpuOea9HLCvMp3YdIekBRWKI=; b=aD1+u7GXCpWjfSmqmQjmJhwpN6
	Uz8ZkaHBcyaKEkE4nxpT+yAfBSmu/sm5ZrcuhKXnAXbJ0f35IdbnjnRn82RwumQu6nGrZhGiRbvXs
	Zmz9PhpuhMXWHVU5ylyUHDCHw01JBL84acUYr6r0GJcHF+Qa35Sf5UwVjd63L663KN/M=;
Received: from p54ae9bfc.dip0.t-ipconnect.de ([84.174.155.252] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1t0fQs-0096bC-2a;
	Tue, 15 Oct 2024 13:09:42 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Frank Wunderlich <frank-w@public-files.de>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 3/4] net: ethernet: mtk_eth_soc: reduce rx ring size for older chipsets
Date: Tue, 15 Oct 2024 13:09:37 +0200
Message-ID: <20241015110940.63702-3-nbd@nbd.name>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015110940.63702-1-nbd@nbd.name>
References: <20241015110940.63702-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_040957_871244_86E4EA1B 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit c57e55819443 ("net: ethernet: mtk_eth_soc: handle dma buffer
size soc specific") resolved some tx timeout issues by bumping FQ and
tx ring sizes from 512 to 2048 entries (the value used in the MediaTek
SDK), however it also changed the rx ring size for all chipsets in the
same way.

Based on a few tests, it seems that a symmetric rx/tx ring size of 2048
really only makes sense on MT7988, which is capable of 10G ethernet links.

Older chipsets are typically deployed in systems that are more memory
constrained and don't actually need the larger rings to handle received
packets.

In order to reduce wasted memory set the ring size based on the SoC to
the following values:
- 2048 on MT7988
- 1024 on MT7986
- 512 (previous value) on everything else, except:
- 256 on RT5350 (the oldest supported chipset)

Fixes: c57e55819443 ("net: ethernet: mtk_eth_soc: handle dma buffer size soc specific")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 4e4ece5e257a..58b80af7230b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -5140,7 +5140,7 @@ static const struct mtk_soc_data mt2701_data = {
 		.desc_size = sizeof(struct mtk_rx_dma),
 		.irq_done_mask = MTK_RX_DONE_INT,
 		.dma_l4_valid = RX_DMA_L4_VALID,
-		.dma_size = MTK_DMA_SIZE(2K),
+		.dma_size = MTK_DMA_SIZE(512),
 		.dma_max_len = MTK_TX_DMA_BUF_LEN,
 		.dma_len_offset = 16,
 	},
@@ -5168,7 +5168,7 @@ static const struct mtk_soc_data mt7621_data = {
 		.desc_size = sizeof(struct mtk_rx_dma),
 		.irq_done_mask = MTK_RX_DONE_INT,
 		.dma_l4_valid = RX_DMA_L4_VALID,
-		.dma_size = MTK_DMA_SIZE(2K),
+		.dma_size = MTK_DMA_SIZE(512),
 		.dma_max_len = MTK_TX_DMA_BUF_LEN,
 		.dma_len_offset = 16,
 	},
@@ -5198,7 +5198,7 @@ static const struct mtk_soc_data mt7622_data = {
 		.desc_size = sizeof(struct mtk_rx_dma),
 		.irq_done_mask = MTK_RX_DONE_INT,
 		.dma_l4_valid = RX_DMA_L4_VALID,
-		.dma_size = MTK_DMA_SIZE(2K),
+		.dma_size = MTK_DMA_SIZE(512),
 		.dma_max_len = MTK_TX_DMA_BUF_LEN,
 		.dma_len_offset = 16,
 	},
@@ -5227,7 +5227,7 @@ static const struct mtk_soc_data mt7623_data = {
 		.desc_size = sizeof(struct mtk_rx_dma),
 		.irq_done_mask = MTK_RX_DONE_INT,
 		.dma_l4_valid = RX_DMA_L4_VALID,
-		.dma_size = MTK_DMA_SIZE(2K),
+		.dma_size = MTK_DMA_SIZE(512),
 		.dma_max_len = MTK_TX_DMA_BUF_LEN,
 		.dma_len_offset = 16,
 	},
@@ -5253,7 +5253,7 @@ static const struct mtk_soc_data mt7629_data = {
 		.desc_size = sizeof(struct mtk_rx_dma),
 		.irq_done_mask = MTK_RX_DONE_INT,
 		.dma_l4_valid = RX_DMA_L4_VALID,
-		.dma_size = MTK_DMA_SIZE(2K),
+		.dma_size = MTK_DMA_SIZE(512),
 		.dma_max_len = MTK_TX_DMA_BUF_LEN,
 		.dma_len_offset = 16,
 	},
@@ -5285,7 +5285,7 @@ static const struct mtk_soc_data mt7981_data = {
 		.dma_l4_valid = RX_DMA_L4_VALID_V2,
 		.dma_max_len = MTK_TX_DMA_BUF_LEN,
 		.dma_len_offset = 16,
-		.dma_size = MTK_DMA_SIZE(2K),
+		.dma_size = MTK_DMA_SIZE(512),
 	},
 };
 
@@ -5315,7 +5315,7 @@ static const struct mtk_soc_data mt7986_data = {
 		.dma_l4_valid = RX_DMA_L4_VALID_V2,
 		.dma_max_len = MTK_TX_DMA_BUF_LEN,
 		.dma_len_offset = 16,
-		.dma_size = MTK_DMA_SIZE(2K),
+		.dma_size = MTK_DMA_SIZE(1K),
 	},
 };
 
@@ -5368,7 +5368,7 @@ static const struct mtk_soc_data rt5350_data = {
 		.dma_l4_valid = RX_DMA_L4_VALID_PDMA,
 		.dma_max_len = MTK_TX_DMA_BUF_LEN,
 		.dma_len_offset = 16,
-		.dma_size = MTK_DMA_SIZE(2K),
+		.dma_size = MTK_DMA_SIZE(256),
 	},
 };
 
-- 
2.47.0


