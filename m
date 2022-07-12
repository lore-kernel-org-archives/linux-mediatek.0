Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50723C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 21:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svneFFDnDhi7ZYnF4O9borRrydeapxU0ET4P1cloBxU=; b=z7ksjv+4zcUwTw16c8WnPsyyON
	1wNkAur4jszTomXGA/yC6dGcRqij/kiKbLFCflw1abq56QsFIt9Pb6mFgNdlzEPUcCJORL4S4Bl9o
	J+YE1uFnim8RL7EcTPicxNKpn7mkNFHmcl6R0BCTLLovhfk/6GsMF/OPPiiuFI8JcVTTu1tTXDFl9
	FeJHk1vdlua7FljWQZ+ohfPML78P2M3PdOcZl4gyuLblB1E/1jU3Bg6dwHTiWm4oiZtgOthsx4a6s
	JmW3tmXwoR1J/gfYpgVktVsWQzer7tpUexkRFCZikUd7eWobtRrXKaehXW1KCXD4dxujxdrrHUYhs
	YLo8FpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBNFQ-00EsBB-OA; Tue, 12 Jul 2022 21:16:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBNFN-00Es8s-N9
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 21:16:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6E542B81BE8;
	Tue, 12 Jul 2022 21:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE77AC3411E;
	Tue, 12 Jul 2022 21:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657660603;
	bh=eHCnglvXcP6xPa/5IZ6pLscvyaJp+dxgMavU45mz7A8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pxq7XajEzDELsaAxozIxASBlQapSZkLriAYJq9SglcKsACuJScNRI32Z8oG3MY9uZ
	 zXWajK8o8cnllj+SY0oi0F8MOnWl0w1z/eO/zI1HOm9crLpgBQRXe0E18ZehAnDosy
	 q1N8bnMXMs12sB3t4xPo93wSWrLFvtXo/IH3u1mnvscXR8plST1wfhS+QFza+kC1AN
	 HJPaC75s9ambOPDuUWfTgyqPia1w6ZRo2NPF1/5nKleNyf15v2OdK6AhTAz9zzN8Bi
	 N4j/7oE6Gu7NeR9LNYfVeR1JFmIdzEOqQyaqnDD5akXz43kyLu446JREYq8TAhJvyb
	 iUFPffpubOG0Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	ilias.apalodimas@linaro.org,
	lorenzo.bianconi@redhat.com,
	jbrouer@redhat.com
Subject: [PATCH v2 net-next 3/4] net: ethernet: mtk_eth_soc: introduce xdp ethtool counters
Date: Tue, 12 Jul 2022 23:16:16 +0200
Message-Id: <bc5f24b74312955eb7b492533b05c7c78d26a69b.1657660277.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657660277.git.lorenzo@kernel.org>
References: <cover.1657660277.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_141646_051307_9D70C60B 
X-CRM114-Status: GOOD (  14.20  )
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

Report xdp stats through ethtool

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 32 ++++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 12 ++++++++
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 2521cc9c6575..da8cb7332a72 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -34,6 +34,10 @@ MODULE_PARM_DESC(msg_level, "Message level (-1=defaults,0=none,...,16=all)");
 #define MTK_ETHTOOL_STAT(x) { #x, \
 			      offsetof(struct mtk_hw_stats, x) / sizeof(u64) }
 
+#define MTK_ETHTOOL_XDP_STAT(x) { #x, \
+				  offsetof(struct mtk_hw_stats, xdp_stats.x) / \
+				  sizeof(u64) }
+
 static const struct mtk_reg_map mtk_reg_map = {
 	.tx_irq_mask		= 0x1a1c,
 	.tx_irq_status		= 0x1a18,
@@ -141,6 +145,13 @@ static const struct mtk_ethtool_stats {
 	MTK_ETHTOOL_STAT(rx_long_errors),
 	MTK_ETHTOOL_STAT(rx_checksum_errors),
 	MTK_ETHTOOL_STAT(rx_flow_control_packets),
+	MTK_ETHTOOL_XDP_STAT(rx_xdp_redirect),
+	MTK_ETHTOOL_XDP_STAT(rx_xdp_pass),
+	MTK_ETHTOOL_XDP_STAT(rx_xdp_drop),
+	MTK_ETHTOOL_XDP_STAT(rx_xdp_tx),
+	MTK_ETHTOOL_XDP_STAT(rx_xdp_tx_errors),
+	MTK_ETHTOOL_XDP_STAT(tx_xdp_xmit),
+	MTK_ETHTOOL_XDP_STAT(tx_xdp_xmit_errors),
 };
 
 static const char * const mtk_clks_source_name[] = {
@@ -1498,6 +1509,9 @@ static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
 		       struct xdp_buff *xdp, struct net_device *dev)
 {
 	struct bpf_prog *prog = rcu_dereference(eth->prog);
+	struct mtk_mac *mac = netdev_priv(dev);
+	struct mtk_hw_stats *hw_stats = mac->hw_stats;
+	u64 *count = &hw_stats->xdp_stats.rx_xdp_drop;
 	u32 act;
 
 	if (!prog)
@@ -1506,11 +1520,16 @@ static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
 	act = bpf_prog_run_xdp(prog, xdp);
 	switch (act) {
 	case XDP_PASS:
-		return XDP_PASS;
+		count = &hw_stats->xdp_stats.rx_xdp_pass;
+		goto update_stats;
 	case XDP_REDIRECT:
-		if (unlikely(xdp_do_redirect(dev, xdp, prog)))
+		if (unlikely(xdp_do_redirect(dev, xdp, prog))) {
+			act = XDP_DROP;
 			break;
-		return XDP_REDIRECT;
+		}
+
+		count = &hw_stats->xdp_stats.rx_xdp_redirect;
+		goto update_stats;
 	default:
 		bpf_warn_invalid_xdp_action(dev, prog, act);
 		fallthrough;
@@ -1523,7 +1542,12 @@ static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
 
 	page_pool_put_full_page(ring->page_pool,
 				virt_to_head_page(xdp->data), true);
-	return XDP_DROP;
+update_stats:
+	u64_stats_update_begin(&hw_stats->syncp);
+	*count = *count + 1;
+	u64_stats_update_end(&hw_stats->syncp);
+
+	return act;
 }
 
 static int mtk_poll_rx(struct napi_struct *napi, int budget,
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index cfb7aeda3f49..2775da1a6ec3 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -570,6 +570,16 @@ struct mtk_tx_dma_v2 {
 struct mtk_eth;
 struct mtk_mac;
 
+struct mtk_xdp_stats {
+	u64 rx_xdp_redirect;
+	u64 rx_xdp_pass;
+	u64 rx_xdp_drop;
+	u64 rx_xdp_tx;
+	u64 rx_xdp_tx_errors;
+	u64 tx_xdp_xmit;
+	u64 tx_xdp_xmit_errors;
+};
+
 /* struct mtk_hw_stats - the structure that holds the traffic statistics.
  * @stats_lock:		make sure that stats operations are atomic
  * @reg_offset:		the status register offset of the SoC
@@ -593,6 +603,8 @@ struct mtk_hw_stats {
 	u64 rx_checksum_errors;
 	u64 rx_flow_control_packets;
 
+	struct mtk_xdp_stats	xdp_stats;
+
 	spinlock_t		stats_lock;
 	u32			reg_offset;
 	struct u64_stats_sync	syncp;
-- 
2.36.1


