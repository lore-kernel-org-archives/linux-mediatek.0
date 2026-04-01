Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC50D3514A
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m68R+jbSgcypj3+TrwecZgemGcanx1vXvIkFRCeWPfY=; b=o5NRi77PUcJ/KaSBpG/mtD9F1n
	a+rC28F50MLn24B139434ZwWRUfr3+oc9HL2uZ8sBysp9Et1QlCCOBndshdSd1N2V03SSeCqOBV68
	xHKUiUEh0JgElJR6OV787TKP5OSLmZD2TuU7EmRdghJgOCw2pmw572ByJxwedPIBWrcqBzN+Ri2+K
	iADJC+Z9Ki84cSDIlsZFeoT3OVVoDUE13JicI/S2g9QfatqJs0yzYeqqY5FymxMNafqEViZjE8q/3
	XuaDqXKqSPWuSYbtkwysjfw0syrQ41dLeXdjTAgH/uWpThenrLuWHzBBOfJKABFuFHFNBtjzs0bqM
	ttK6Meag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pYq-0000000E99h-2Fz0;
	Wed, 01 Apr 2026 07:00:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pYl-0000000E94T-0p7T;
	Wed, 01 Apr 2026 07:00:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE7F04024A;
	Wed,  1 Apr 2026 07:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B1FC19423;
	Wed,  1 Apr 2026 07:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775026814;
	bh=2PkbsYIwmUHdckZLGVCyi116+qlNmGcTmfepf86eHCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZYUE6o86wv0JYOb53jWGI5pNHkm9JkEDN/T640nihAeM4RwN3rIERqcgg9va240rc
	 eZeMKFlGV14oKBB6QHjOEHQdayKe4FmB0mOsevOSC8FlEr96DvCwag2mKZpA6OBUwU
	 9eFJ+vFcA+mqskJFzCi7X9gzPa18SZ4AGVjD869BcS9Yym9nKQOUCf68Fky+bM3Hkm
	 4v0q8ut5DKKxmhjj/u5EZVWb8FKdPD7TkFCY4JUo/H31n7wrQBi4HQ20DpiadHCw4A
	 9913jdLccvTMTr8QgpH9Q7Z8O/RR5ds8D+ypRFu8iCEKr77qC2koiico1cGveDiuv4
	 Gd+2ePyovQUsw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 01 Apr 2026 08:59:23 +0200
Subject: [PATCH net-next v2 05/11] net: airoha: Rely on net_device pointer
 in ETS callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-airoha-eth-multi-serdes-v2-5-ac427ae4beeb@kernel.org>
References: <20260401-airoha-eth-multi-serdes-v2-0-ac427ae4beeb@kernel.org>
In-Reply-To: <20260401-airoha-eth-multi-serdes-v2-0-ac427ae4beeb@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_000015_293442_A8729098 
X-CRM114-Status: GOOD (  14.18  )
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

Remove airoha_gdm_port dependency in ETS tc callback signatures and rely
on net_device pointer instead. Please note this patch does not introduce
any logical change and it is a preliminary patch in order to support
multiple net_devices connected to the same GDM3 or GDM4 port via an
external hw arbiter.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 52599ebe85e6a74002c290edb82c55ba9fdfcc69..268f4e34f38d2df128f0be52ae00fec07e46b1bf 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2126,10 +2126,11 @@ airoha_ethtool_get_rmon_stats(struct net_device *dev,
 	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
 }
 
-static int airoha_qdma_set_chan_tx_sched(struct airoha_gdm_port *port,
+static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
 					 int channel, enum tx_sched_mode mode,
 					 const u16 *weights, u8 n_weights)
 {
+	struct airoha_gdm_port *port = netdev_priv(netdev);
 	int i;
 
 	for (i = 0; i < AIROHA_NUM_TX_RING; i++)
@@ -2161,17 +2162,15 @@ static int airoha_qdma_set_chan_tx_sched(struct airoha_gdm_port *port,
 	return 0;
 }
 
-static int airoha_qdma_set_tx_prio_sched(struct airoha_gdm_port *port,
-					 int channel)
+static int airoha_qdma_set_tx_prio_sched(struct net_device *dev, int channel)
 {
 	static const u16 w[AIROHA_NUM_QOS_QUEUES] = {};
 
-	return airoha_qdma_set_chan_tx_sched(port, channel, TC_SCH_SP, w,
+	return airoha_qdma_set_chan_tx_sched(dev, channel, TC_SCH_SP, w,
 					     ARRAY_SIZE(w));
 }
 
-static int airoha_qdma_set_tx_ets_sched(struct airoha_gdm_port *port,
-					int channel,
+static int airoha_qdma_set_tx_ets_sched(struct net_device *dev, int channel,
 					struct tc_ets_qopt_offload *opt)
 {
 	struct tc_ets_qopt_offload_replace_params *p = &opt->replace_params;
@@ -2212,14 +2211,15 @@ static int airoha_qdma_set_tx_ets_sched(struct airoha_gdm_port *port,
 	else if (nstrict < AIROHA_NUM_QOS_QUEUES - 1)
 		mode = nstrict + 1;
 
-	return airoha_qdma_set_chan_tx_sched(port, channel, mode, w,
+	return airoha_qdma_set_chan_tx_sched(dev, channel, mode, w,
 					     ARRAY_SIZE(w));
 }
 
-static int airoha_qdma_get_tx_ets_stats(struct airoha_gdm_port *port,
-					int channel,
+static int airoha_qdma_get_tx_ets_stats(struct net_device *netdev, int channel,
 					struct tc_ets_qopt_offload *opt)
 {
+	struct airoha_gdm_port *port = netdev_priv(netdev);
+
 	u64 cpu_tx_packets = airoha_qdma_rr(port->qdma,
 					    REG_CNTR_VAL(channel << 1));
 	u64 fwd_tx_packets = airoha_qdma_rr(port->qdma,
@@ -2234,7 +2234,7 @@ static int airoha_qdma_get_tx_ets_stats(struct airoha_gdm_port *port,
 	return 0;
 }
 
-static int airoha_tc_setup_qdisc_ets(struct airoha_gdm_port *port,
+static int airoha_tc_setup_qdisc_ets(struct net_device *dev,
 				     struct tc_ets_qopt_offload *opt)
 {
 	int channel;
@@ -2247,12 +2247,12 @@ static int airoha_tc_setup_qdisc_ets(struct airoha_gdm_port *port,
 
 	switch (opt->command) {
 	case TC_ETS_REPLACE:
-		return airoha_qdma_set_tx_ets_sched(port, channel, opt);
+		return airoha_qdma_set_tx_ets_sched(dev, channel, opt);
 	case TC_ETS_DESTROY:
 		/* PRIO is default qdisc scheduler */
-		return airoha_qdma_set_tx_prio_sched(port, channel);
+		return airoha_qdma_set_tx_prio_sched(dev, channel);
 	case TC_ETS_STATS:
-		return airoha_qdma_get_tx_ets_stats(port, channel, opt);
+		return airoha_qdma_get_tx_ets_stats(dev, channel, opt);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -2797,11 +2797,9 @@ static int airoha_tc_setup_qdisc_htb(struct net_device *dev,
 static int airoha_dev_tc_setup(struct net_device *dev, enum tc_setup_type type,
 			       void *type_data)
 {
-	struct airoha_gdm_port *port = netdev_priv(dev);
-
 	switch (type) {
 	case TC_SETUP_QDISC_ETS:
-		return airoha_tc_setup_qdisc_ets(port, type_data);
+		return airoha_tc_setup_qdisc_ets(dev, type_data);
 	case TC_SETUP_QDISC_HTB:
 		return airoha_tc_setup_qdisc_htb(dev, type_data);
 	case TC_SETUP_BLOCK:

-- 
2.53.0


