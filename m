Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E378EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 02:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyybfrquoL5GLZFF7GBV9iukj14dfUad0dvZ0Y/U75U=; b=AMT3kmhwSvuovw2YvByEOTk2Uq
	oyJulFzGEFVLmoDrDShN8pS3nk/keYJrZ3vIypUbN0TxPDkcP95gRbb+AKkfpbba1NUvVn/5Pkbfz
	Fh7Jflm74PTt9qBHs1ndhtPiBe6xV+e5yxNaJyRGc5RyqnkMuFU8WhMLxbL46uZ6AZnLjq8/08xuX
	/ZEQuMXNb3JcO9Ig5hdruEFiCWZZU/dMxBVHnbjz008peIItExMF/I+bntVo//M3iCt3oJLZfmPbn
	e2paru8WtTgdOD6KuJgzoemW1dacROZ+HXq5JukEWco7rQYpU3gVklxGuVXOQA1bCZImC5vbKiRkk
	kp2DxU0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlvc-001iPO-06;
	Thu, 13 Jul 2023 02:19:36 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlvZ-001iNu-1k;
	Thu, 13 Jul 2023 02:19:35 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qJlvX-0005Y3-0t;
	Thu, 13 Jul 2023 02:19:31 +0000
Date: Thu, 13 Jul 2023 03:19:18 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Ungerer <gerg@kernel.org>
Subject: [PATCH v2 net-next 5/9] net: ethernet: mtk_eth_soc: rely on
 MTK_MAX_DEVS and remove MTK_MAC_COUNT
Message-ID: <57e3be6406efeb082ca4552aefc7bf509471ecf7.1689012506.git.daniel@makrotopia.org>
References: <cover.1689012506.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689012506.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_191933_580248_56419EB3 
X-CRM114-Status: GOOD (  20.01  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

Get rid of MTK_MAC_COUNT since it is a duplicated of MTK_MAX_DEVS.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 49 ++++++++++++---------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  1 -
 2 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 7f191e4337dd8..c001e877167c0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -963,7 +963,7 @@ static void mtk_stats_update(struct mtk_eth *eth)
 {
 	int i;
 
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
 		if (!eth->mac[i] || !eth->mac[i]->hw_stats)
 			continue;
 		if (spin_trylock(&eth->mac[i]->hw_stats->stats_lock)) {
@@ -1468,7 +1468,7 @@ static int mtk_queue_stopped(struct mtk_eth *eth)
 {
 	int i;
 
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
 		if (!eth->netdev[i])
 			continue;
 		if (netif_queue_stopped(eth->netdev[i]))
@@ -1482,7 +1482,7 @@ static void mtk_wake_queue(struct mtk_eth *eth)
 {
 	int i;
 
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
 		if (!eth->netdev[i])
 			continue;
 		netif_tx_wake_all_queues(eth->netdev[i]);
@@ -1941,7 +1941,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			 !(trxd.rxd4 & RX_DMA_SPECIAL_TAG))
 			mac = RX_DMA_GET_SPORT(trxd.rxd4) - 1;
 
-		if (unlikely(mac < 0 || mac >= MTK_MAC_COUNT ||
+		if (unlikely(mac < 0 || mac >= MTK_MAX_DEVS ||
 			     !eth->netdev[mac]))
 			goto release_desc;
 
@@ -2978,7 +2978,7 @@ static void mtk_dma_free(struct mtk_eth *eth)
 	const struct mtk_soc_data *soc = eth->soc;
 	int i;
 
-	for (i = 0; i < MTK_MAC_COUNT; i++)
+	for (i = 0; i < MTK_MAX_DEVS; i++)
 		if (eth->netdev[i])
 			netdev_reset_queue(eth->netdev[i]);
 	if (eth->scratch_ring) {
@@ -3132,8 +3132,13 @@ static void mtk_gdm_config(struct mtk_eth *eth, u32 config)
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
 		return;
 
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
-		u32 val = mtk_r32(eth, MTK_GDMA_FWD_CFG(i));
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
+		u32 val;
+
+		if (!eth->netdev[i])
+			continue;
+
+		val = mtk_r32(eth, MTK_GDMA_FWD_CFG(i));
 
 		/* default setup the forward port to send frame to PDMA */
 		val &= ~0xffff;
@@ -3143,7 +3148,7 @@ static void mtk_gdm_config(struct mtk_eth *eth, u32 config)
 
 		val |= config;
 
-		if (eth->netdev[i] && netdev_uses_dsa(eth->netdev[i]))
+		if (netdev_uses_dsa(eth->netdev[i]))
 			val |= MTK_GDMA_SPECIAL_TAG;
 
 		mtk_w32(eth, val, MTK_GDMA_FWD_CFG(i));
@@ -3745,15 +3750,15 @@ static int mtk_hw_init(struct mtk_eth *eth, bool reset)
 	 * up with the more appropriate value when mtk_mac_config call is being
 	 * invoked.
 	 */
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
 		struct net_device *dev = eth->netdev[i];
 
-		mtk_w32(eth, MAC_MCR_FORCE_LINK_DOWN, MTK_MAC_MCR(i));
-		if (dev) {
-			struct mtk_mac *mac = netdev_priv(dev);
+		if (!dev)
+			continue;
 
-			mtk_set_mcr_max_rx(mac, dev->mtu + MTK_RX_ETH_HLEN);
-		}
+		mtk_w32(eth, MAC_MCR_FORCE_LINK_DOWN, MTK_MAC_MCR(i));
+		mtk_set_mcr_max_rx(netdev_priv(dev),
+				   dev->mtu + MTK_RX_ETH_HLEN);
 	}
 
 	/* Indicates CDM to parse the MTK special tag from CPU
@@ -3950,7 +3955,7 @@ static void mtk_pending_work(struct work_struct *work)
 	mtk_prepare_for_reset(eth);
 
 	/* stop all devices to make sure that dma is properly shut down */
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
 		if (!eth->netdev[i] || !netif_running(eth->netdev[i]))
 			continue;
 
@@ -3966,8 +3971,8 @@ static void mtk_pending_work(struct work_struct *work)
 	mtk_hw_init(eth, true);
 
 	/* restart DMA and enable IRQs */
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
-		if (!test_bit(i, &restart))
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
+		if (!eth->netdev[i] || !test_bit(i, &restart))
 			continue;
 
 		if (mtk_open(eth->netdev[i])) {
@@ -3994,7 +3999,7 @@ static int mtk_free_dev(struct mtk_eth *eth)
 {
 	int i;
 
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
 		if (!eth->netdev[i])
 			continue;
 		free_netdev(eth->netdev[i]);
@@ -4013,7 +4018,7 @@ static int mtk_unreg_dev(struct mtk_eth *eth)
 {
 	int i;
 
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
 		struct mtk_mac *mac;
 		if (!eth->netdev[i])
 			continue;
@@ -4320,7 +4325,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	}
 
 	id = be32_to_cpup(_id);
-	if (id >= MTK_MAC_COUNT) {
+	if (id >= MTK_MAX_DEVS) {
 		dev_err(eth->dev, "%d is not a valid mac id\n", id);
 		return -EINVAL;
 	}
@@ -4465,7 +4470,7 @@ void mtk_eth_set_dma_device(struct mtk_eth *eth, struct device *dma_dev)
 
 	rtnl_lock();
 
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
 		dev = eth->netdev[i];
 
 		if (!dev || !(dev->flags & IFF_UP))
@@ -4772,7 +4777,7 @@ static int mtk_remove(struct platform_device *pdev)
 	int i;
 
 	/* stop all devices to make sure that dma is properly shut down */
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
 		if (!eth->netdev[i])
 			continue;
 		mtk_stop(eth->netdev[i]);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index b18ce4430d437..03510302df9e4 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -33,7 +33,6 @@
 #define MTK_TX_DMA_BUF_LEN_V2	0xffff
 #define MTK_QDMA_RING_SIZE	2048
 #define MTK_DMA_SIZE		512
-#define MTK_MAC_COUNT		2
 #define MTK_RX_ETH_HLEN		(ETH_HLEN + ETH_FCS_LEN)
 #define MTK_RX_HLEN		(NET_SKB_PAD + MTK_RX_ETH_HLEN + NET_IP_ALIGN)
 #define MTK_DMA_DUMMY_DESC	0xffffffff
-- 
2.41.0

