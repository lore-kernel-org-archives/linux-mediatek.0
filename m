Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC923EE49A4
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Sep 2023 21:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06T7ZW4LuPl/Cgdnv4MquhODSK8njRq+s+CG1lR4tas=; b=C3Vab1ZDgCfy+lVWjOO49mQYjE
	Mr58IsmV055wCNix8hTSG60L40lrvZc21pzE7Q4kjST3Ml8kPAjabAVKvKum3e4p7s6iKP36iqTqG
	k1Jbii6OGH+K14668ldAu3t0h46cYS8baReKCSCBR+7gLH5Rwm6WpbY5cRndyT1MAPQTv15sHoDYz
	uJmuaPaAYo07ctEWwdUoweKHLrdiNsGcdFAhvVj8yb9wHTKPmEVHQ2W4OYtKahhVpEuoq3UR3fw64
	lt69PsNrvpZCLOdX/pbxmND5BhxAEgVk55aAq7mi0rsXFaFkc26EEfeIitgj6iU2TqBjTwkiRqzb+
	blBYW5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfSB6-00Gv3Y-04;
	Sun, 10 Sep 2023 21:41:12 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfSB3-00Gv2c-1d;
	Sun, 10 Sep 2023 21:41:10 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qfSAe-0005D1-19;
	Sun, 10 Sep 2023 21:40:44 +0000
Date: Sun, 10 Sep 2023 22:40:30 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Dan Carpenter <dan.carpenter@linaro.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2] net: ethernet: mtk_eth_soc: fix uninitialized variable
Message-ID: <30044cf16ff83f73e5ef852c25682e9fde63af51.1694376191.git.daniel@makrotopia.org>
References: <9918f1ae-5604-4bdc-a654-e0566ca77ad6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9918f1ae-5604-4bdc-a654-e0566ca77ad6@moroto.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_144109_549049_C64406D9 
X-CRM114-Status: GOOD (  13.70  )
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

Variable dma_addr in function mtk_poll_rx can be uninitialized on
some of the error paths. In practise this doesn't matter, even random
data present in uninitialized stack memory can safely be used in the
way it happens in the error path.

However, in order to make Smatch happy make sure the variable is
always initialized.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: initialize with DMA_MAPPING_ERROR instead of NULL

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 31090490d47ce..6145ddcff206c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2119,11 +2119,11 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 	u8 *data, *new_data;
 	struct mtk_rx_dma_v2 *rxd, trxd;
 	int done = 0, bytes = 0;
+	dma_addr_t dma_addr = DMA_MAPPING_ERROR;
 
 	while (done < budget) {
 		unsigned int pktlen, *rxdcsum;
 		struct net_device *netdev;
-		dma_addr_t dma_addr;
 		u32 hash, reason;
 		int mac = 0;
 
@@ -2300,7 +2300,8 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		else
 			rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size);
 
-		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA) &&
+		    likely(dma_addr != DMA_MAPPING_ERROR))
 			rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
 
 		ring->calc_idx = idx;
-- 
2.42.0

