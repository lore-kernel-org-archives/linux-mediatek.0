Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C21C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 11:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XRfkcUv7g40gglGVGhitqa+g0EVUFFRMfsu9citOfjs=; b=SsJX+UVb82So4ALNPj3BUYPm8c
	R6EdexIYgmXUiDVNqFc5Fw3B0h9tJyUM0ap7Di8t9J9VYj/+RQENThEvv+rwP6dpRharY9Ee3RBy3
	m2Ta+NFpLB0xGHDiszViy9mYKi4C5kE0eN6qe+FPcVBxI9GKGDvyYo+SqtMmlv3PuSvBqsjoMTgeB
	puXK4YuNYys2zRuypJdXoE+Y310dlSvq0EyVEbYMgoXRVDeSbZmx0XIXVMSn5mDkoGKeniX6DIOYe
	Nuul1rlysClJ/u5BbQze+BHUxW5Cl0cds8FUgFX+E+Z2rzNPTmoNidKquGdUpR1CHhAo2o9NLJ7/p
	bD/E1+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWUJ-0000000GpVe-2iMg;
	Tue, 30 Jun 2026 11:18:47 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWUH-0000000GpUn-3oZB
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 11:18:47 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ca06ad2d11so16926065ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 04:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782818324; x=1783423124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRfkcUv7g40gglGVGhitqa+g0EVUFFRMfsu9citOfjs=;
        b=d4vkeLLIxQ0Ma26IKhPU0kiR1BNnEI5Q107SHHsIc0udNhp/SLzduyW7u5Mg7Oy8PX
         9GKZAuUzfAwhMOSaa3krjQW2fyMnoKVtcwePhkluRl2UQsLGZNFMewH7iUk37F7LGXeq
         ECG7pix2EvJUNrjjKIkRYuGtgu+B5UaAdDLi05ljH70qrqsE2DvkLBcYTN6uzwoMfzFq
         GdhpNDHOZU7Nlq/7gGrlLqLRU5p6DMy3RKSUGaxD45louB5jChez+SgSOZsgduMdvo28
         Qbj09wSIiglR3eLNb+76Esfe2WVOj4Mak4h9p1weoLoGbg2Cz/STZ1CZUQERV2ME9fkI
         vXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782818324; x=1783423124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRfkcUv7g40gglGVGhitqa+g0EVUFFRMfsu9citOfjs=;
        b=E2+/9Ygi94bFMUX0w4TQfVh9FH3O31Bw2BYXLl899cRAIdePeg3mMukEGne3z+V4sE
         91AplDOqBSrbe24mrtDhp8Fy+B6vZpqKzbewTD1de3YEaaIR8W5JskW6K/2UVe9y8uMD
         6mKPjJZhMo0fhRnhFfm9wgHhmMUjoBImzOt92QV1ExF5oEEsOxjRK2X2gtZyWAPRCP21
         RgYJ4iZBMLH56k7wEo0RSAgsL3mn6IbU53AevAMtalDGuxmeLlz2eHShnN/ErHEtKA5c
         SfwWS8Rst/irsg+8le5tx1QDmfIYARJJvt3Crydxe+TW8PZZDt1kGIKJdfGPWiLFkhUp
         TOeA==
X-Forwarded-Encrypted: i=1; AHgh+RrycXfVWZRg8pbtLVUPAKoSRLA3IAPjx+3v6gSstWQ1084jAOrVob+gSBYTRLq/Y4rZ7rS4gTC8iz3CVVAyJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwM/vIgeseN986mnxrUBmXca6/LWv/8IOf4NEqZTHTWIo2UyOpC
	vgqnG7EwAoieyhpHDv0i0tZMIlLbqPFY7KFaA+PCo9bWmn+BqPglFre6
X-Gm-Gg: AfdE7cldcmJwgsNhxnQubK399YbTuNkxe1CcpD6aTfTAWhNMk2UH/OWJH2HcdA/8jNn
	YE2rUfHPCyNFEUc8hh6Jk4X4DS97eU0NWRPfKQx6WePFIL1xrnLv0ZecMmBFTmYznf+tLi3WM/p
	XfysAsixaGfc6yWSn6ZNfX1hZLA8hFi4aUM0bulxE+zYDFmHY8hhIPuegCAp2LfWXZT0yhqmyaB
	2JPDtvWUYkIbidUwCbiDz4cPdCFyXt+U28AjvQj/p3yCOxkBZi1O4X1Tdow/1yxPq99eZezvP3F
	6EldMxXvYvXJpYrCQfqV/D94pNOu7eBT1qSPD1eGsGTVgwVhL6szck7Ea1OYrXLK6jzTPbdI2Br
	TA0HZjHMQP2T/h6gd324UB+8FYhPKCsHDvYIa6JxVcv2n/AF5tjk7ZpT4qkBznKWyGa0mTYripn
	A7kQ40e0wJDxHRRVIrKhD2LT0=
X-Received: by 2002:a17:903:3883:b0:2ca:52ce:6f74 with SMTP id d9443c01a7336-2ca5a5eb6f3mr833565ad.29.1782818323616;
        Tue, 30 Jun 2026 04:18:43 -0700 (PDT)
Received: from nbai25050028.. ([2403:8600:2090:6f:c162:d20a:68d9:13ea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c7456bsm11688285ad.25.2026.06.30.04.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:18:43 -0700 (PDT)
From: Aniket Negi <aniket.negi03@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aniket Negi <aniket.negi03@gmail.com>
Subject: [PATCH] net: airoha: fix MIB stats collection to be lossless
Date: Tue, 30 Jun 2026 16:48:34 +0530
Message-ID: <20260630111834.233643-1-aniket.negi03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_041845_969419_F3258D59 
X-CRM114-Status: GOOD (  17.18  )
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

The airoha_dev_get_hw_stats() function had two correctness issues in the
way it collects hardware MIB counters.

Bug 1: Read-clear race causes silent packet loss in statistics

airoha_update_hw_stats() read all MIB registers and then cleared them
via REG_FE_GDM_MIB_CLEAR. There is a time window between the last
register read and the hardware clear. Any packet that the hardware
counts during this window is lost: the register is incremented, then
cleared, without the increment ever being read by software. Under
sustained traffic this causes a permanent and growing undercount in all
reported statistics.

This is particularly misleading for tx_ok_pkts and tx_ok_bytes, which
routers and traffic monitors use to detect packet forwarding loss
between two points in a hardware-accelerated path (e.g., between two
netdevs in the QDMA/PPE fast-path). An inaccurate count makes it
impossible to reliably attribute drops in the forwarding pipeline
without capturing traffic at both ends independently.

Bug 2: 32-bit counter overflow causes stat corruption

Several MIB registers are only 32 bits wide: tx_drops, tx_broadcast,
tx_multicast, rx_drops, rx_broadcast, rx_multicast, rx_errors,
rx_crc_error, rx_over_errors, rx_fragment, rx_jabber, and the runt and
long buckets of the tx_len[]/rx_len[].

The original code relied on MIB_CLEAR to keep register values small
enough that a simple '+= val' per cycle did not lose data across a
wrap. Once clearing is removed (to fix Bug 1), raw '+= val' silently
corrupts the accumulated software counter on overflow.

Fix both issues together:

- 64-bit H+L register pairs (tx_ok_pkts, tx_ok_bytes, tx_len[1..5],
  rx_ok_pkts, rx_ok_bytes, rx_len[1..5]): read directly from hardware
  without clearing. Hardware accumulates the full running total; a
  single direct assignment per poll is correct and lossless.

- 32-bit registers (tx_drops, tx_broadcast, tx_multicast, rx_drops,
  rx_broadcast, rx_multicast, rx_errors, rx_crc_error, rx_over_errors,
  rx_fragment, rx_jabber, and the runt/long buckets in tx_len[0]/[6]
  and rx_len[0]/[6]): track the previous hardware value in a new
  hw_prev_stats sub-struct inside airoha_hw_stats and accumulate
  (u32)(curr - prev) into the 64-bit software counter. Unsigned
  subtraction handles wrap-around transparently:
  prev=0xFFFFFF00, curr=0x00000010 -> delta=(u32)(0x10-0xFFFFFF00)=0x110

Remove the REG_FE_GDM_MIB_CLEAR write from airoha_update_hw_stats()
entirely. Because the driver no longer clears hardware counters, the
read-clear race window is eliminated.

The hw_prev_stats fields are zero-initialised by the existing
devm_kzalloc() call in airoha_alloc_gdm_device().

Fixes: 8f4695fb67b2 ("net: airoha: better handle MIBs for GDM ports with multiple devs attached")
Signed-off-by: Aniket Negi <aniket.negi03@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 132 +++++++++++------------
 drivers/net/ethernet/airoha/airoha_eth.h |  22 ++++
 2 files changed, 86 insertions(+), 68 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 1caf6766f2c0..7ae4e294478e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1696,133 +1696,133 @@ static void airoha_dev_get_hw_stats(struct airoha_gdm_dev *dev)
 
 	u64_stats_update_begin(&dev->stats.syncp);
 
-	/* TX */
+	/* TX - 64-bit H+L registers: hw accumulates the total, read directly. */
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
-	dev->stats.tx_ok_pkts += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
-	dev->stats.tx_ok_pkts += val;
+	dev->stats.tx_ok_pkts = (u64)val << 32;
+	dev->stats.tx_ok_pkts += airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_H(port->id));
-	dev->stats.tx_ok_bytes += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
-	dev->stats.tx_ok_bytes += val;
+	dev->stats.tx_ok_bytes = (u64)val << 32;
+	dev->stats.tx_ok_bytes += airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
 
+	/* TX - 32-bit registers: accumulate delta to handle wrap-around. */
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_DROP_CNT(port->id));
-	dev->stats.tx_drops += val;
+	dev->stats.tx_drops += (u32)(val - dev->stats.hw_prev_stats.tx_drops);
+	dev->stats.hw_prev_stats.tx_drops = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_BC_CNT(port->id));
-	dev->stats.tx_broadcast += val;
+	dev->stats.tx_broadcast += (u32)(val - dev->stats.hw_prev_stats.tx_broadcast);
+	dev->stats.hw_prev_stats.tx_broadcast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_MC_CNT(port->id));
-	dev->stats.tx_multicast += val;
+	dev->stats.tx_multicast += (u32)(val - dev->stats.hw_prev_stats.tx_multicast);
+	dev->stats.hw_prev_stats.tx_multicast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_RUNT_CNT(port->id));
-	dev->stats.tx_len[i] += val;
+	dev->stats.tx_len[i] += (u32)(val - dev->stats.hw_prev_stats.tx_len[i]);
+	dev->stats.hw_prev_stats.tx_len[i] = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i] += (u64)val << 32;
+	dev->stats.tx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i] = (u64)val << 32;
+	dev->stats.tx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i] = (u64)val << 32;
+	dev->stats.tx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i] = (u64)val << 32;
+	dev->stats.tx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i] = (u64)val << 32;
+	dev->stats.tx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i] = (u64)val << 32;
+	dev->stats.tx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_LONG_CNT(port->id));
-	dev->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i] += (u32)(val - dev->stats.hw_prev_stats.tx_len[i]);
+	dev->stats.hw_prev_stats.tx_len[i++] = val;
 
 	/* RX */
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_H(port->id));
-	dev->stats.rx_ok_pkts += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_L(port->id));
-	dev->stats.rx_ok_pkts += val;
+	dev->stats.rx_ok_pkts = (u64)val << 32;
+	dev->stats.rx_ok_pkts += airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_H(port->id));
-	dev->stats.rx_ok_bytes += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_L(port->id));
-	dev->stats.rx_ok_bytes += val;
+	dev->stats.rx_ok_bytes = (u64)val << 32;
+	dev->stats.rx_ok_bytes += airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_DROP_CNT(port->id));
-	dev->stats.rx_drops += val;
+	dev->stats.rx_drops += (u32)(val - dev->stats.hw_prev_stats.rx_drops);
+	dev->stats.hw_prev_stats.rx_drops = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_BC_CNT(port->id));
-	dev->stats.rx_broadcast += val;
+	dev->stats.rx_broadcast += (u32)(val - dev->stats.hw_prev_stats.rx_broadcast);
+	dev->stats.hw_prev_stats.rx_broadcast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_MC_CNT(port->id));
-	dev->stats.rx_multicast += val;
+	dev->stats.rx_multicast += (u32)(val - dev->stats.hw_prev_stats.rx_multicast);
+	dev->stats.hw_prev_stats.rx_multicast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ERROR_DROP_CNT(port->id));
-	dev->stats.rx_errors += val;
+	dev->stats.rx_errors += (u32)(val - dev->stats.hw_prev_stats.rx_errors);
+	dev->stats.hw_prev_stats.rx_errors = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_CRC_ERR_CNT(port->id));
-	dev->stats.rx_crc_error += val;
+	dev->stats.rx_crc_error += (u32)(val - dev->stats.hw_prev_stats.rx_crc_error);
+	dev->stats.hw_prev_stats.rx_crc_error = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OVERFLOW_DROP_CNT(port->id));
-	dev->stats.rx_over_errors += val;
+	dev->stats.rx_over_errors += (u32)(val - dev->stats.hw_prev_stats.rx_over_errors);
+	dev->stats.hw_prev_stats.rx_over_errors = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_FRAG_CNT(port->id));
-	dev->stats.rx_fragment += val;
+	dev->stats.rx_fragment += (u32)(val - dev->stats.hw_prev_stats.rx_fragment);
+	dev->stats.hw_prev_stats.rx_fragment = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_JABBER_CNT(port->id));
-	dev->stats.rx_jabber += val;
+	dev->stats.rx_jabber += (u32)(val - dev->stats.hw_prev_stats.rx_jabber);
+	dev->stats.hw_prev_stats.rx_jabber = val;
 
 	i = 0;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_RUNT_CNT(port->id));
-	dev->stats.rx_len[i] += val;
+	dev->stats.rx_len[i] += (u32)(val - dev->stats.hw_prev_stats.rx_len[i]);
+	dev->stats.hw_prev_stats.rx_len[i] = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i] += (u64)val << 32;
+	dev->stats.rx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i] = (u64)val << 32;
+	dev->stats.rx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i] = (u64)val << 32;
+	dev->stats.rx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i] = (u64)val << 32;
+	dev->stats.rx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i] = (u64)val << 32;
+	dev->stats.rx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
-	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i] = (u64)val << 32;
+	dev->stats.rx_len[i++] += airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_L(port->id));
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_LONG_CNT(port->id));
-	dev->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i] += (u32)(val - dev->stats.hw_prev_stats.rx_len[i]);
+	dev->stats.hw_prev_stats.rx_len[i++] = val;
 
 	u64_stats_update_end(&dev->stats.syncp);
 }
@@ -1839,10 +1839,6 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 			airoha_dev_get_hw_stats(port->devs[i]);
 	}
 
-	/* Reset MIB counters */
-	airoha_fe_set(dev->eth, REG_FE_GDM_MIB_CLEAR(port->id),
-		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
-
 	spin_unlock(&port->stats_lock);
 }
 
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 2765244d937c..af12ad6eac17 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -244,6 +244,28 @@ struct airoha_hw_stats {
 	u64 rx_fragment;
 	u64 rx_jabber;
 	u64 rx_len[7];
+
+	struct {
+	/* Previous HW register values for 32-bit counter delta tracking.
+	 * Storing the last seen value and accumulating (u32)(curr - prev)
+	 * in 64-bit software counter & handles wrap-around transparently
+	 * via unsigned arithmetic. These fields are never reported to
+	 * userspace.
+	 */
+		u32 tx_drops;
+		u32 tx_broadcast;
+		u32 tx_multicast;
+		u32 tx_len[7];
+		u32 rx_drops;
+		u32 rx_broadcast;
+		u32 rx_multicast;
+		u32 rx_errors;
+		u32 rx_crc_error;
+		u32 rx_over_errors;
+		u32 rx_fragment;
+		u32 rx_jabber;
+		u32 rx_len[7];
+	} hw_prev_stats;
 };
 
 enum {
-- 
2.43.0


