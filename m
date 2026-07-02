Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA60C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cvf2E/Sr8Di3zZhp26Vg9AffyL9oTXOTZb/a9Ug0O+U=; b=uloCYL+NWCT4/dbeQISbTqYgjb
	0EDHdopRQ0mnmoDarYpxr7ySjB6k/vhYX5XinY1HnkEzIz5JAmHYIrA2TncrBy61f5HDa1WvvsJkP
	vEwKOXGKCjVI819lpOTPvgsnEvZGDdjJIMnuCgNHt7a15LLQwRDPBgufhEfdUMaNd1um/J9IX/QbE
	3Cz1m6JR7zFEY/v1CQm0CyAth9ZlwdCEXkQdQEC5FlXAfL0mLVnNPDGLMx/IFDYs5cc9JUpCZiOCy
	y13Ts9ZOaJzSBtvH32+DsKws02x22+JXhMwiBdA71t8pbpxWAV+QpXRODRSJtGDAvOpAeB8OedmhO
	2dU29hKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfL3U-000000057AG-1pqw;
	Thu, 02 Jul 2026 17:18:28 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfL3R-00000005790-1zfH
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 17:18:27 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38101f85591so448468a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jul 2026 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783012704; x=1783617504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cvf2E/Sr8Di3zZhp26Vg9AffyL9oTXOTZb/a9Ug0O+U=;
        b=U3F4D8KqdRNJ8nUkHi3ipun9c8VLOZX0HtB9zHzWklz9ebFwfRdQPD6crXoP64dM93
         P9VtT0wlq8uFqxVfUsuuxENUeEgl8zCaAcSlrWY/W5HZKh2vsaWtjZdEq5ApG5J0UJYO
         OS6Xv6m03yk6OLO0/HvWTxtzgDMEfZSpMqg32kB8+nB5sAuvi/8xrHMS0SgJsxzviYWj
         aZDqt6glArG6ZqePNT5Fo2+sR1fJcxj1pJj0zNIfiSY1gdLC4/IGfwgyg/9oN7sDirhG
         AHjh+9JDa8yvHKCn5APIdLEmvn8UYaHmKcqRlPEvT9tBwjzODpMTH2ytKoeZs2HrsR+i
         Y4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012704; x=1783617504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cvf2E/Sr8Di3zZhp26Vg9AffyL9oTXOTZb/a9Ug0O+U=;
        b=ogn3hd4MnuqV2wrqR6bd0ff+6TfOK+/JoiTDf7/hhpFU/RXJqKW/9T2k1Me2gFgo5K
         d+llp2ZYcV+nJOLLI/1xGQ1l9gVPUUrBkJktR87BpDZEamU5Q6I+29yd+WLFoBU+2dxZ
         u3rqUUKldIfSwCvSDa4FYe9rvALbuRBwn5AJRON7uBTpim52h8KsietWtwCGDO+MMv/k
         +4POSXFLrNcbW2pgXP0jJwLE05WqjCRzpzGIRw8gbkaYTXL04GUoKH3eAmgBSMoA0QKs
         1kHKgBgiw3f55YneXOOTneETBKxtQ2YLM9l1TvhV+m4NNrdO5NqOcmh04ADfF6pokYE/
         7saw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9Ey7F7D5PTmhg5S+iRBvQeWyxb/lWWv4bPnOhih2kfuFY5sg68877MQAwFfC8kH7c1MSsEMFKqmNLZqtwug==@lists.infradead.org
X-Gm-Message-State: AOJu0YyitY8Txnyb1UU86+4BkRlg0CkhWGJdM0izliE2ryQKgi+ibK6C
	T6NFUk+L1hsZhGx8d0EAVCPeDghAZ7yBAmg/AYOo4jgJ0ZiHhajObNyW
X-Gm-Gg: AfdE7cmxtcALLgNWpza2nx8y05DGpnTPsuADABDgfUfZ5jXZLIMl2EfDRtR/rDj59Wq
	VPjoGCCBQa0IMPWQMXxNO8bEfqbWmTZshd5fzxsPeOtymQg7R2U1uVYlu0eQPXpHgeHiDKbVKPN
	SdcVpFhSkTW8jmG2a7PM+zWKfehMJ1DYqm1nQgMXKby4Wtd6A3B59ZNmsYEL7jag6Huso8P9uNW
	Z7AXhu4C+j2wIXHP+WQ7gf9zC3K/mj/54UuwqeadwyZosM4nX7vReLfA9schcQGEF1ufyFu7Q8q
	Xm7dWL987iMhlOKCILmNqYK6I7zFjWXFmohqcAlpEbaZ0f9dHRPRG2rH2vPg6Q/Lkw2V1g2cPlG
	lCHjpoIqsksVzrTjgfAf/plz6olPzmQVqwBO83GHz9vktszdn4vaFnrK4k+dgerE5nxbcB+oHGt
	EYjmENOptxsFQGjJ7cKP35iQ==
X-Received: by 2002:a17:90b:4c52:b0:37c:8df2:9f58 with SMTP id 98e67ed59e1d1-381120ee1c1mr800372a91.7.1783012704187;
        Thu, 02 Jul 2026 10:18:24 -0700 (PDT)
Received: from nbai25050028.. ([2403:8600:2090:6f:9ad:7de7:16fc:b59f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f1595e912sm8488217eec.31.2026.07.02.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:18:23 -0700 (PDT)
From: Aniket Negi <aniket.negi03@gmail.com>
To: lorenzo@kernel.org,
	netdev@vger.kernel.org
Cc: Aniket Negi <aniket.negi03@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net: airoha: fix MIB stats collection to be lossless
Date: Thu,  2 Jul 2026 22:48:13 +0530
Message-ID: <20260702171814.11165-1-aniket.negi03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_101825_546346_6A2CC43A 
X-CRM114-Status: GOOD (  17.39  )
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

The current driver resets hardware MIB counters after every read via
REG_FE_GDM_MIB_CLEAR. This creates a race window: packets arriving
between the read and the clear are silently lost from statistics.

Fix this by removing the MIB clear and switching to a delta-based
software tracking approach:

- 64-bit H+L registers (tx/rx ok pkts, ok bytes, E64..L1023):
  read the absolute hardware total directly each poll.

- 32-bit registers (drops, bc, mc, errors, runt, long, ...):
  store the previous raw register value in mib_prev and accumulate
  (u32)(curr - prev) into a 64-bit software counter. Unsigned
  subtraction handles wrap-around transparently.

- tx_len[0]/rx_len[0] ({0,64} RMON bucket) combines RUNT_CNT
  (32-bit, delta-tracked via mib_prev.tx_runt) and E64_CNT
  (64-bit, absolute). A u64 accumulator tx_runt64 holds the
  running RUNT delta sum so that each poll sets:
    tx_len[0] = tx_runt64 + E64_abs
  without double-counting the E64 value.

Merge airoha_dev_get_hw_stats() into airoha_update_hw_stats(),
moving the port spin_lock inside so callers do not need a separate
wrapper.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Aniket Negi <aniket.negi03@gmail.com>
---

Changes in v3:
  - Link to V2: https://lore.kernel.org/20260701173941.314795-1-aniket.negi03@gmail.com/
  - Add Acked-by tag from Lorenzo
  - Rename from tx_runt_cnt to tx_runt, tx_long_cnt to tx_long,
    tx_runt_accum64 to tx_runt64
  - Rename from rx_runt_cnt to rx_runt, rx_long_cnt to rx_long,
    rx_runt_accum64 to rx_runt64
  - Condense the marked comments in V2, remove new line after comment

Changes in v2:
  - Store _CNT_L register reads in val before adding to stats, improving
    readability (suggested by Lorenzo Bianconi)
  - Fix double-counting bug in the RUNT+E64 combined bucket: previously
    "+=" for E64 re-added the full absolute counter each poll; now a
    dedicated tx_runt_accum64/rx_runt_accum64 accumulator holds the
    running RUNT delta, and tx_len[0] is assigned (not accumulated) each
    poll as runt_accum64 + E64_abs
  - Replace 7-element tx_len[]/rx_len[] shadow arrays in mib_prev with
    focused tx_runt_cnt/tx_long_cnt and rx_runt_cnt/rx_long_cnt fields;
    only RUNT and LONG are 32-bit and need wrap-around tracking
  - Rename inner struct hw_prev_stats to mib_prev; rename accumulator
    fields to tx_runt_accum64/rx_runt_accum64 for clarity
  - Fix comment alignment in mib_prev struct block
  - Rename airoha_dev_get_hw_stats() to airoha_update_hw_stats() and
    move the port spin_lock inside, removing the separate wrapper

 drivers/net/ethernet/airoha/airoha_eth.c | 107 ++++++++++++-----------
 drivers/net/ethernet/airoha/airoha_eth.h |  27 ++++++
 2 files changed, 84 insertions(+), 50 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 59001fd4b6f7..e009266fd268 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1686,12 +1686,14 @@ static void airoha_qdma_stop_napi(struct airoha_qdma *qdma)
 	}
 }
 
-static void airoha_dev_get_hw_stats(struct airoha_gdm_dev *dev)
+static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 {
 	struct airoha_gdm_port *port = dev->port;
 	struct airoha_eth *eth = dev->eth;
 	u32 val, i = 0;
 
+	spin_lock(&port->stats_lock);
+
 	/* Read relevant MIB for GDM with multiple port attached */
 	if (port->id == AIROHA_GDM3_IDX || port->id == AIROHA_GDM4_IDX)
 		airoha_fe_rmw(eth, REG_FE_GDM_MIB_CFG(port->id),
@@ -1701,152 +1703,157 @@ static void airoha_dev_get_hw_stats(struct airoha_gdm_dev *dev)
 
 	u64_stats_update_begin(&dev->stats.syncp);
 
-	/* TX */
+	/* TX - 64-bit H+L registers: hw accumulates the total, read directly. */
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
-	dev->stats.tx_ok_pkts += ((u64)val << 32);
+	dev->stats.tx_ok_pkts = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
 	dev->stats.tx_ok_pkts += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_H(port->id));
-	dev->stats.tx_ok_bytes += ((u64)val << 32);
+	dev->stats.tx_ok_bytes = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
 	dev->stats.tx_ok_bytes += val;
 
+	/* TX - 32-bit registers: accumulate delta to handle wrap-around. */
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_DROP_CNT(port->id));
-	dev->stats.tx_drops += val;
+	dev->stats.tx_drops += (u32)(val - dev->stats.mib_prev.tx_drops);
+	dev->stats.mib_prev.tx_drops = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_BC_CNT(port->id));
-	dev->stats.tx_broadcast += val;
+	dev->stats.tx_broadcast += (u32)(val - dev->stats.mib_prev.tx_broadcast);
+	dev->stats.mib_prev.tx_broadcast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_MC_CNT(port->id));
-	dev->stats.tx_multicast += val;
+	dev->stats.tx_multicast += (u32)(val - dev->stats.mib_prev.tx_multicast);
+	dev->stats.mib_prev.tx_multicast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_RUNT_CNT(port->id));
-	dev->stats.tx_len[i] += val;
+	dev->stats.mib_prev.tx_runt64 +=
+		(u32)(val - dev->stats.mib_prev.tx_runt);
+	dev->stats.mib_prev.tx_runt = val;
 
+	/* tx_len[0]: RUNT (32-bit, delta) + E64 (64-bit, absolute). */
+	dev->stats.tx_len[i] = dev->stats.mib_prev.tx_runt64;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] += (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
 	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_L(port->id));
 	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_L(port->id));
 	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_L(port->id));
 	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_L(port->id));
 	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	dev->stats.tx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_L(port->id));
 	dev->stats.tx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_LONG_CNT(port->id));
-	dev->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i++] += (u32)(val - dev->stats.mib_prev.tx_long);
+	dev->stats.mib_prev.tx_long = val;
 
 	/* RX */
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_H(port->id));
-	dev->stats.rx_ok_pkts += ((u64)val << 32);
+	dev->stats.rx_ok_pkts = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_L(port->id));
 	dev->stats.rx_ok_pkts += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_H(port->id));
-	dev->stats.rx_ok_bytes += ((u64)val << 32);
+	dev->stats.rx_ok_bytes = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_L(port->id));
 	dev->stats.rx_ok_bytes += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_DROP_CNT(port->id));
-	dev->stats.rx_drops += val;
+	dev->stats.rx_drops += (u32)(val - dev->stats.mib_prev.rx_drops);
+	dev->stats.mib_prev.rx_drops = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_BC_CNT(port->id));
-	dev->stats.rx_broadcast += val;
+	dev->stats.rx_broadcast += (u32)(val - dev->stats.mib_prev.rx_broadcast);
+	dev->stats.mib_prev.rx_broadcast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_MC_CNT(port->id));
-	dev->stats.rx_multicast += val;
+	dev->stats.rx_multicast += (u32)(val - dev->stats.mib_prev.rx_multicast);
+	dev->stats.mib_prev.rx_multicast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ERROR_DROP_CNT(port->id));
-	dev->stats.rx_errors += val;
+	dev->stats.rx_errors += (u32)(val - dev->stats.mib_prev.rx_errors);
+	dev->stats.mib_prev.rx_errors = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_CRC_ERR_CNT(port->id));
-	dev->stats.rx_crc_error += val;
+	dev->stats.rx_crc_error += (u32)(val - dev->stats.mib_prev.rx_crc_error);
+	dev->stats.mib_prev.rx_crc_error = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OVERFLOW_DROP_CNT(port->id));
-	dev->stats.rx_over_errors += val;
+	dev->stats.rx_over_errors += (u32)(val - dev->stats.mib_prev.rx_over_errors);
+	dev->stats.mib_prev.rx_over_errors = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_FRAG_CNT(port->id));
-	dev->stats.rx_fragment += val;
+	dev->stats.rx_fragment += (u32)(val - dev->stats.mib_prev.rx_fragment);
+	dev->stats.mib_prev.rx_fragment = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_JABBER_CNT(port->id));
-	dev->stats.rx_jabber += val;
+	dev->stats.rx_jabber += (u32)(val - dev->stats.mib_prev.rx_jabber);
+	dev->stats.mib_prev.rx_jabber = val;
 
 	i = 0;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_RUNT_CNT(port->id));
-	dev->stats.rx_len[i] += val;
+	dev->stats.mib_prev.rx_runt64 +=
+		(u32)(val - dev->stats.mib_prev.rx_runt);
+	dev->stats.mib_prev.rx_runt = val;
 
+	/* rx_len[0]: RUNT (32-bit, delta) + E64 (64-bit, absolute). */
+	dev->stats.rx_len[i] = dev->stats.mib_prev.rx_runt64;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] += (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
 	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_L(port->id));
 	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_L(port->id));
 	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_L(port->id));
 	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_L(port->id));
 	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	dev->stats.rx_len[i] = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_L(port->id));
 	dev->stats.rx_len[i++] += val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_LONG_CNT(port->id));
-	dev->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i] += (u32)(val - dev->stats.mib_prev.rx_long);
+	dev->stats.mib_prev.rx_long = val;
 
 	u64_stats_update_end(&dev->stats.syncp);
-}
-
-static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
-{
-	struct airoha_gdm_port *port = dev->port;
-	int i;
-
-	spin_lock(&port->stats_lock);
-
-	for (i = 0; i < ARRAY_SIZE(port->devs); i++) {
-		if (port->devs[i])
-			airoha_dev_get_hw_stats(port->devs[i]);
-	}
-
-	/* Reset MIB counters */
-	airoha_fe_set(dev->eth, REG_FE_GDM_MIB_CLEAR(port->id),
-		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
 
 	spin_unlock(&port->stats_lock);
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index f6d01a8e8da1..dae9cfa6cc06 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -245,6 +245,33 @@ struct airoha_hw_stats {
 	u64 rx_fragment;
 	u64 rx_jabber;
 	u64 rx_len[7];
+
+	struct {
+		/* Previous HW register values for 32-bit counter delta
+		 * tracking. Storing the last seen value and accumulating
+		 * (u32)(curr - prev) into the 64-bit software counter
+		 * handles wrap-around transparently via unsigned arithmetic.
+		 * tx_runt64/rx_runt64 hold the running sum of runt deltas.
+		 * These fields are never reported to userspace.
+		 */
+		u32 tx_drops;
+		u32 tx_broadcast;
+		u32 tx_multicast;
+		u32 tx_runt;
+		u32 tx_long;
+		u64 tx_runt64;
+		u32 rx_drops;
+		u32 rx_broadcast;
+		u32 rx_multicast;
+		u32 rx_errors;
+		u32 rx_crc_error;
+		u32 rx_over_errors;
+		u32 rx_fragment;
+		u32 rx_jabber;
+		u32 rx_runt;
+		u32 rx_long;
+		u64 rx_runt64;
+	} mib_prev;
 };
 
 enum {

base-commit: a225f8c20712713406ae47024b8df42deacddd4a
-- 
2.43.0


