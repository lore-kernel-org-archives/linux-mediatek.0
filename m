Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED29D7237B
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Jan 2026 22:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpLzaZNrjlWsLrvFCVaRso+CbpWjXp9kenKiBrfGf7Q=; b=04KIKq6ajNodriPUI2SxJ4Hzrh
	ZGVz+wNmIKk3yv4qvNhizq4fJF/zE95N66qi3WDuroKaDcg+L9mfk7W9FO5WRx0OZnNPLc1+VYwUE
	GLthS/XKFtEBUv+r9wnfMdU2NXynbvYoX6rTyAdxjdQPjzOsQAKFQzAd8sEibSOxc0S6KDhuH4Cj6
	l0ww4xsJDX2rpm7+BA6OjrPgukwxdmgYeb+S8gZ2QEVFWFFNYWQ/8xb9dC9baKnthS5c7/EZV1GUJ
	+GKgHnkPKVrtmHEnlEbtwTlpVIdvumdNz3nHbH1HqgK8cnhBjRCnGaitfqJB8Ir0FRBEQyfkHKWlb
	g+Jj3qxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8Ha-0000000BYPV-2UP6;
	Sun, 25 Jan 2026 22:08:34 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8HU-0000000BYLq-2yzU
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Jan 2026 22:08:30 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82318702afbso2708168b3a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Jan 2026 14:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769378908; x=1769983708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpLzaZNrjlWsLrvFCVaRso+CbpWjXp9kenKiBrfGf7Q=;
        b=OVDhv/7irmYJK8N04ncIjYSyQnAKFAYF0Z+j8EH7GD+DROFM99kx/BS3c5p0XKFQIf
         hAfOQT6AUKpEdLs8Xom0AvQWsuvX39mzy/BHMLL11YaSeuGyhq380IYWS5oL7F1q0Vhm
         WmYmXJWuwKfdSkV53Jg5n2QkeIGaMNcstcgds63YCse9gWmtHK2AbEdctrbpAinX3px6
         ewuhCmrH3YCJVd2q1O3qmb+WTVSU9TROY8zYPJ6J3mZAGT7dzuekUc/pBIxawB72zS8j
         ODfM5Rl3YuX6GjRvOVfi4CqEMJf0LbBKZXZl4sRlR3izM5ZD/JAC4SzQe8RYbMHkkG+i
         zonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769378908; x=1769983708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VpLzaZNrjlWsLrvFCVaRso+CbpWjXp9kenKiBrfGf7Q=;
        b=LLJPZYCuEldytfUH4/pDgipjUujUIbD/MyvDboWTagOpu2DuGbOfOw8TkRlaJ7BHtt
         ktuux0Y/1bDKkDQpifbS15QmMgKYtMe3R8j66gOkZ2Y4wUQexRMLB6/6voGP8BKv4Z+V
         QqM1eQHCRVF7nTD+gqs03a2sJZKy5aEE2twsgSe224JDy30JYTPgpSZ/RgnC+C5TcFMf
         e+1jb8XKtoP21nzc/uLR7CSVHkZY7HNtKIfLnlej8tOhZ1T3Yx5Zq7Mr8YtlMoJVQZ2x
         Pwr/mt7D/7YPl3ShecG1SQiCkhCGGo8MrmS3eOk9x1dqo1zvghgojv/UxRrjj1VTDpUu
         8ZRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD3urKVeVbNb3kqp/Am4lypNrYLiBlcn2NjReFfwu9mikmZX3goW53/N2+4LIc42HSot5VX86ArarkKf3Syw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf4iDepumJ8Vt9E2Y3xNuCfaL7WxaiwcAxuzHwQgsTqc5fSTJu
	zsk1kNhD6gBU+fjXlTq64NKKAi9wOLYnMCeU8NsV6WSrZQSHvR96VPJK
X-Gm-Gg: AZuq6aLquvcqo+XvVl8xAbYxfmygEghXO4erZJSxUMJ6p2MIa66zfNvDGcbUtMcTOOv
	gCzvJ6LNtfuZpjfcYBUaeOSDeR3QKkgEpVa2qlIeYiv1X6Zi/PFvh+Jvwz/tRvkguDLJzcXWohu
	Jqn4pH9zl6MBiaBid5XOY14d282ZdPwISJmrarRI/vehFRZusw071C3OeaM+JhdVIa7txlNziay
	bB/4midy7sBygJ7YaL/dGWFh1MR3+KcCMclE8jLWpto1OR7N5eYkgW9wDO36c544DpFR17t/b7J
	1aLH70prKi55uYQTGKiOH47C/Z506h1B3NBmajSYdG5Ta04l4X1j6yvEzhdkKq8OFuBcwroKKNT
	EDO8NWAm/9qkwLgoZIGASbEcpE6iMCVb8Va+2W/tZCzwKSbQdLCD9zbLSecAXTyQT6uNAxJKfko
	3eXZ5v4Ybz8KIhnPNSzik5/2uEEb8ZaN51tJQsqe1WHSCHboSixw==
X-Received: by 2002:a05:6a00:8087:b0:823:a81:fe85 with SMTP id d2e1a72fcca58-823412bb5c2mr2275538b3a.54.1769378907690;
        Sun, 25 Jan 2026 14:08:27 -0800 (PST)
Received: from d.home.mmyangfl.tk ([45.32.227.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e60fsm7651286b3a.48.2026.01.25.14.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:08:27 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] net: airoha: Use u64_stats_t with u64_stats_sync properly
Date: Mon, 26 Jan 2026 06:07:50 +0800
Message-ID: <20260125220753.3984326-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125220753.3984326-1-mmyangfl@gmail.com>
References: <20260125220753.3984326-1-mmyangfl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_140828_772175_7C8FD242 
X-CRM114-Status: GOOD (  11.38  )
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

On 64bit arches, struct u64_stats_sync is empty and provides no help
against load/store tearing. Convert to u64_stats_t to ensure atomic
operations.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 153 +++++++++++++----------
 drivers/net/ethernet/airoha/airoha_eth.h |  34 ++---
 2 files changed, 102 insertions(+), 85 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 62bcbbbe2a95..fe53aa93a003 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1466,137 +1466,154 @@ static void airoha_update_hw_stats(struct airoha_gdm_port *port)
 {
 	struct airoha_eth *eth = port->qdma->eth;
 	u32 val, i = 0;
+	u64 val64;
 
 	spin_lock(&port->stats.lock);
 	u64_stats_update_begin(&port->stats.syncp);
 
 	/* TX */
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
-	port->stats.tx_ok_pkts += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
-	port->stats.tx_ok_pkts += val;
+	val64 += val;
+	u64_stats_add(&port->stats.tx_ok_pkts, val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_H(port->id));
-	port->stats.tx_ok_bytes += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
-	port->stats.tx_ok_bytes += val;
+	val64 += val;
+	u64_stats_add(&port->stats.tx_ok_bytes, val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_DROP_CNT(port->id));
-	port->stats.tx_drops += val;
+	u64_stats_add(&port->stats.tx_drops, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_BC_CNT(port->id));
-	port->stats.tx_broadcast += val;
+	u64_stats_add(&port->stats.tx_broadcast, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_MC_CNT(port->id));
-	port->stats.tx_multicast += val;
+	u64_stats_add(&port->stats.tx_multicast, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_RUNT_CNT(port->id));
-	port->stats.tx_len[i] += val;
+	val64 = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	val64 += (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.tx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.tx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.tx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.tx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.tx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.tx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_LONG_CNT(port->id));
-	port->stats.tx_len[i++] += val;
+	u64_stats_add(&port->stats.tx_len[i++], val);
 
 	/* RX */
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_H(port->id));
-	port->stats.rx_ok_pkts += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_L(port->id));
-	port->stats.rx_ok_pkts += val;
+	val64 += val;
+	u64_stats_add(&port->stats.rx_ok_pkts, val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_H(port->id));
-	port->stats.rx_ok_bytes += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_L(port->id));
-	port->stats.rx_ok_bytes += val;
+	val64 += val;
+	u64_stats_add(&port->stats.rx_ok_bytes, val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_DROP_CNT(port->id));
-	port->stats.rx_drops += val;
+	u64_stats_add(&port->stats.rx_drops, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_BC_CNT(port->id));
-	port->stats.rx_broadcast += val;
+	u64_stats_add(&port->stats.rx_broadcast, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_MC_CNT(port->id));
-	port->stats.rx_multicast += val;
+	u64_stats_add(&port->stats.rx_multicast, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ERROR_DROP_CNT(port->id));
-	port->stats.rx_errors += val;
+	u64_stats_add(&port->stats.rx_errors, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_CRC_ERR_CNT(port->id));
-	port->stats.rx_crc_error += val;
+	u64_stats_add(&port->stats.rx_crc_error, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OVERFLOW_DROP_CNT(port->id));
-	port->stats.rx_over_errors += val;
+	u64_stats_add(&port->stats.rx_over_errors, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_FRAG_CNT(port->id));
-	port->stats.rx_fragment += val;
+	u64_stats_add(&port->stats.rx_fragment, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_JABBER_CNT(port->id));
-	port->stats.rx_jabber += val;
+	u64_stats_add(&port->stats.rx_jabber, val);
 
 	i = 0;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_RUNT_CNT(port->id));
-	port->stats.rx_len[i] += val;
+	val64 = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	val64 += (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.rx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.rx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.rx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.rx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.rx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	val64 = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	val64 += val;
+	u64_stats_add(&port->stats.rx_len[i++], val64);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_LONG_CNT(port->id));
-	port->stats.rx_len[i++] += val;
+	u64_stats_add(&port->stats.rx_len[i++], val);
 
 	/* reset mib counters */
 	airoha_fe_set(eth, REG_FE_GDM_MIB_CLEAR(port->id),
@@ -1795,16 +1812,16 @@ static void airoha_dev_get_stats64(struct net_device *dev,
 	airoha_update_hw_stats(port);
 	do {
 		start = u64_stats_fetch_begin(&port->stats.syncp);
-		storage->rx_packets = port->stats.rx_ok_pkts;
-		storage->tx_packets = port->stats.tx_ok_pkts;
-		storage->rx_bytes = port->stats.rx_ok_bytes;
-		storage->tx_bytes = port->stats.tx_ok_bytes;
-		storage->multicast = port->stats.rx_multicast;
-		storage->rx_errors = port->stats.rx_errors;
-		storage->rx_dropped = port->stats.rx_drops;
-		storage->tx_dropped = port->stats.tx_drops;
-		storage->rx_crc_errors = port->stats.rx_crc_error;
-		storage->rx_over_errors = port->stats.rx_over_errors;
+		storage->rx_packets = u64_stats_read(&port->stats.rx_ok_pkts);
+		storage->tx_packets = u64_stats_read(&port->stats.tx_ok_pkts);
+		storage->rx_bytes = u64_stats_read(&port->stats.rx_ok_bytes);
+		storage->tx_bytes = u64_stats_read(&port->stats.tx_ok_bytes);
+		storage->multicast = u64_stats_read(&port->stats.rx_multicast);
+		storage->rx_errors = u64_stats_read(&port->stats.rx_errors);
+		storage->rx_dropped = u64_stats_read(&port->stats.rx_drops);
+		storage->tx_dropped = u64_stats_read(&port->stats.tx_drops);
+		storage->rx_crc_errors = u64_stats_read(&port->stats.rx_crc_error);
+		storage->rx_over_errors = u64_stats_read(&port->stats.rx_over_errors);
 	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
 }
 
@@ -2057,13 +2074,13 @@ static void airoha_ethtool_get_mac_stats(struct net_device *dev,
 	airoha_update_hw_stats(port);
 	do {
 		start = u64_stats_fetch_begin(&port->stats.syncp);
-		stats->FramesTransmittedOK = port->stats.tx_ok_pkts;
-		stats->OctetsTransmittedOK = port->stats.tx_ok_bytes;
-		stats->MulticastFramesXmittedOK = port->stats.tx_multicast;
-		stats->BroadcastFramesXmittedOK = port->stats.tx_broadcast;
-		stats->FramesReceivedOK = port->stats.rx_ok_pkts;
-		stats->OctetsReceivedOK = port->stats.rx_ok_bytes;
-		stats->BroadcastFramesReceivedOK = port->stats.rx_broadcast;
+		stats->FramesTransmittedOK = u64_stats_read(&port->stats.tx_ok_pkts);
+		stats->OctetsTransmittedOK = u64_stats_read(&port->stats.tx_ok_bytes);
+		stats->MulticastFramesXmittedOK = u64_stats_read(&port->stats.tx_multicast);
+		stats->BroadcastFramesXmittedOK = u64_stats_read(&port->stats.tx_broadcast);
+		stats->FramesReceivedOK = u64_stats_read(&port->stats.rx_ok_pkts);
+		stats->OctetsReceivedOK = u64_stats_read(&port->stats.rx_ok_bytes);
+		stats->BroadcastFramesReceivedOK = u64_stats_read(&port->stats.rx_broadcast);
 	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
 }
 
@@ -2098,12 +2115,12 @@ airoha_ethtool_get_rmon_stats(struct net_device *dev,
 		int i;
 
 		start = u64_stats_fetch_begin(&port->stats.syncp);
-		stats->fragments = hw_stats->rx_fragment;
-		stats->jabbers = hw_stats->rx_jabber;
+		stats->fragments = u64_stats_read(&hw_stats->rx_fragment);
+		stats->jabbers = u64_stats_read(&hw_stats->rx_jabber);
 		for (i = 0; i < ARRAY_SIZE(airoha_ethtool_rmon_ranges) - 1;
 		     i++) {
-			stats->hist[i] = hw_stats->rx_len[i];
-			stats->hist_tx[i] = hw_stats->tx_len[i];
+			stats->hist[i] = u64_stats_read(&hw_stats->rx_len[i]);
+			stats->hist_tx[i] = u64_stats_read(&hw_stats->tx_len[i]);
 		}
 	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 20e602d61e61..b2e9bd849f8b 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -215,24 +215,24 @@ struct airoha_hw_stats {
 	struct u64_stats_sync syncp;
 
 	/* get_stats64 */
-	u64 rx_ok_pkts;
-	u64 tx_ok_pkts;
-	u64 rx_ok_bytes;
-	u64 tx_ok_bytes;
-	u64 rx_multicast;
-	u64 rx_errors;
-	u64 rx_drops;
-	u64 tx_drops;
-	u64 rx_crc_error;
-	u64 rx_over_errors;
+	u64_stats_t rx_ok_pkts;
+	u64_stats_t tx_ok_pkts;
+	u64_stats_t rx_ok_bytes;
+	u64_stats_t tx_ok_bytes;
+	u64_stats_t rx_multicast;
+	u64_stats_t rx_errors;
+	u64_stats_t rx_drops;
+	u64_stats_t tx_drops;
+	u64_stats_t rx_crc_error;
+	u64_stats_t rx_over_errors;
 	/* ethtool stats */
-	u64 tx_broadcast;
-	u64 tx_multicast;
-	u64 tx_len[7];
-	u64 rx_broadcast;
-	u64 rx_fragment;
-	u64 rx_jabber;
-	u64 rx_len[7];
+	u64_stats_t tx_broadcast;
+	u64_stats_t tx_multicast;
+	u64_stats_t tx_len[7];
+	u64_stats_t rx_broadcast;
+	u64_stats_t rx_fragment;
+	u64_stats_t rx_jabber;
+	u64_stats_t rx_len[7];
 };
 
 enum {
-- 
2.51.0


