Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D591C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 08:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZ+2B+xaLfX8+tFnRPAnP1FR0Q3RyX1768KOIO+38mE=; b=wRwy1Q4gMl0dP4PqcNg2CndQuy
	Ir4rwUIfxG/kkSL2RQapitIoo++kVEFt7IA4VKVtAsfzG8beOYsVq0nSU6soB81jolo9Iw3T3sx+q
	MEognw1C4z8x/tcurEQDbF0XSqRoPUdjn6Ihy0S4AAfVio2gNIY0lYQd/yiilOqRPB64MXbZ65+kj
	IfVK+YgU6q7D4THSLstPQA0MtNAVFUMAM8PVUR3uxqiC+R5TfGpXOk0Bq/2ilIe38Mv8ePGCAhv3x
	HZzGQBRM5ep+NIuf65n9fxZ/57w26JfB0yhcu2KNR2xJYY6hOcjy7gIFeqBpYz1Qd+HukYE3waFNy
	Gwem26TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq1J-00000000zG3-1Yiy;
	Wed, 01 Jul 2026 08:10:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq1H-00000000zE2-21RZ;
	Wed, 01 Jul 2026 08:10:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FE6443AD1;
	Wed,  1 Jul 2026 08:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4DE1F00A3A;
	Wed,  1 Jul 2026 08:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782893407;
	bh=nZ+2B+xaLfX8+tFnRPAnP1FR0Q3RyX1768KOIO+38mE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZDtPr+zcus8B3Tw2C4LzlJqZhau8ISDZEqkExI4VtHOAQ2R9yfUMVyJMUKvrx7uQ6
	 K/B28O3j5r5fjsuY+JH3vT9WEtz1bL2TvlQKQaNAeB9FY64pduBMpmQ6lQGy37aA5V
	 b30BcxXCjzRm4hhVuzhQo7E2Kd0RJfCXIRaMKcShixUl1SjclbDnemTfmXY+PkUcJX
	 noOw64er8atV8v19tIW7qkJngZviAimVicpb7w0IldUIOeMZk0FE5B+HoWZ7EIt79Y
	 4zJhRMic3sfNSEDPdba6KylwBsRJxC5kH2i3qcxec5NNEWmkT2H2+XyO1djZu7OHXS
	 b3RP3P1q71YAw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 01 Jul 2026 10:09:26 +0200
Subject: [PATCH net-next v7 2/3] net: airoha: fix ETS QoS stats counter
 underflow and cross-channel corruption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-airoha-ethtool-priv_flags-v7-2-b4153bd44428@kernel.org>
References: <20260701-airoha-ethtool-priv_flags-v7-0-b4153bd44428@kernel.org>
In-Reply-To: <20260701-airoha-ethtool-priv_flags-v7-0-b4153bd44428@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org
X-Mailer: b4 0.14.3
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

airoha_qdma_get_tx_ets_stats() has two bugs:
- The hardware counters read via airoha_qdma_rr() are 32-bit values
  but are stored in u64 locals and subtracted from u64 baselines. When
  a 32-bit hardware counter wraps around, the subtraction produces a
  large underflow value passed to _bstats_update().
- The baseline counters (cpu_tx_packets, fwd_tx_packets) are stored as
  single per-device fields, but airoha_qdma_get_tx_ets_stats() is
  called with different channel values (0-3). Each call reads a
  different channel's hardware counter but overwrites the same
  baseline, corrupting the delta computation for other channels.

Fix both by:
- Narrowing the counter locals and baselines to u32 so that 32-bit
  unsigned subtraction handles wrap-around naturally.
- Grouping the baselines into a per-channel qos_stats array so each
  channel tracks its own previous counter value independently.

Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 18 +++++++++++-------
 drivers/net/ethernet/airoha/airoha_eth.h |  7 ++++---
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8bba54ebcf07..2c9ceb9f16f8 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2491,16 +2491,20 @@ static int airoha_qdma_get_tx_ets_stats(struct net_device *netdev, int channel,
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_qdma *qdma = dev->qdma;
+	u32 cpu_tx_packets, fwd_tx_packets;
+	u64 tx_packets;
 
-	u64 cpu_tx_packets = airoha_qdma_rr(qdma, REG_CNTR_VAL(channel << 1));
-	u64 fwd_tx_packets = airoha_qdma_rr(qdma,
-					    REG_CNTR_VAL((channel << 1) + 1));
-	u64 tx_packets = (cpu_tx_packets - dev->cpu_tx_packets) +
-			 (fwd_tx_packets - dev->fwd_tx_packets);
+	cpu_tx_packets = airoha_qdma_rr(qdma, REG_CNTR_VAL(channel << 1));
+	fwd_tx_packets = airoha_qdma_rr(qdma,
+					REG_CNTR_VAL((channel << 1) + 1));
+	tx_packets = (u32)(cpu_tx_packets -
+			   dev->qos_stats[channel].cpu_tx_packets) +
+		     (u32)(fwd_tx_packets -
+			   dev->qos_stats[channel].fwd_tx_packets);
 
 	_bstats_update(opt->stats.bstats, 0, tx_packets);
-	dev->cpu_tx_packets = cpu_tx_packets;
-	dev->fwd_tx_packets = fwd_tx_packets;
+	dev->qos_stats[channel].cpu_tx_packets = cpu_tx_packets;
+	dev->qos_stats[channel].fwd_tx_packets = fwd_tx_packets;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 87ab3ea10664..ac5f571f3e53 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -545,9 +545,10 @@ struct airoha_gdm_dev {
 	struct airoha_eth *eth;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
-	/* qos stats counters */
-	u64 cpu_tx_packets;
-	u64 fwd_tx_packets;
+	struct {
+		u32 cpu_tx_packets;
+		u32 fwd_tx_packets;
+	} qos_stats[AIROHA_NUM_QOS_CHANNELS];
 
 	u32 flags;
 	int nbq;

-- 
2.54.0


