Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A909D6CFA2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jan 2026 18:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TWzta/r/B2JAGtHGJUL2js2kTmC/9to7xiyXgiuBd3M=; b=RjvUnfR9KzQb+KILqwieiilatt
	iv5hxPQDZfc9rmxgDL0egZZK06oJGFJFPPqR0OOz28/VIiL/OCupQNEH8tjMdYgNd4n7+teiMBERA
	Eba6FfwLzk6dXxH2JOXFxyWGROztHge0tAqwEAtE7o3ru0EUhfr8eEjfaq6GWuW/rniOS80NOcxsF
	jb4pzgq+oUL8xn6rYIlHzewRXPS9G26UnETMngDmPV+QkOtPr+X0eHTmpDMvceAevPqv1uHYWdDhJ
	uYAgtN7yJGS7t+qeewGJvw4KP7HcA0DHmCDwmZpdTvBD1+yeJUAS6vOtvOA348Zj13Ewm9HFKopYk
	2NYUqraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viznz-00000007fNu-0Fqm;
	Thu, 22 Jan 2026 18:53:19 +0000
Received: from mail-pf1-f181.google.com ([209.85.210.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viznw-00000007fMd-1nPw
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Jan 2026 18:53:17 +0000
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82311f4070cso308848b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Jan 2026 10:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769107995; x=1769712795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWzta/r/B2JAGtHGJUL2js2kTmC/9to7xiyXgiuBd3M=;
        b=Ln4WtxUAaOKhpyZzBqvGbVA11gQeIpUBvNV2BISULkK2jIxA/L2nYekVgTntdy+Hmu
         V8cvSLoAO0ZLraZ3CbUjvKEaxqET5+nUZ26BaHZhUbVBrcS3JBxN45V81/QapVXX3ecx
         W77RjzMgRgv7kp4DO9nnfirXAVEus+4ZAS3GvQ1y7yc8F69YVT4uBaQuPmCCkaEywzBx
         SG8nF3rusSuQTVljXoqOhNgQJTNZOxPwiAtcILAfY4ELjyXXN+7Nd5RiRwbRXk/iwr8Q
         a5VZX5R4Iog3ELdvFa2V76ZOlAIM99GUMGvUoIPpK65Y8KeV7rXVanXii8WFk/ovDq5O
         ax2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769107995; x=1769712795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWzta/r/B2JAGtHGJUL2js2kTmC/9to7xiyXgiuBd3M=;
        b=Z2Yv0ROcH1Fuyxfm/s5TNDD/UeR+xtpA8wXAAvAfCZBqkeSJpZFaCwCgu+ZecmRMaO
         XJ2XxvzwhSyNAwCFjMBxtOMa0NwbpsOAKgehxeSj/scD/gyJ5oQJZBSlrEMJqYmpx7/i
         cApmetqMi0QJUmYmXa97Nr6VfUuB92O/rNhjpjIHLY8td6n9DrJSjNihqRvaesiiLH6/
         7N3yDMbYq90i3iK7wMqIx7Vg5vRi6Wbj3MLhbHOz3/2kbdSUXCo4r8D+YZeyBFXiOBlV
         Mh+0WvmwzxADHoLOl6KfQ2T+hEfA1sazZbB56tsP5lTjJ9YYDuAmoT4wv9V6c6tpLj/i
         LOog==
X-Forwarded-Encrypted: i=1; AJvYcCVb92tp5CDYdtineQXsoQyxyLaNWEyLU8EGImqaqAcEczi9WE0w4MuQ2ilxevSCR4JyEvS4kb2vGi4coRim0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4IFGqNS8tBLqCmS+ypz0MCpNHbW4dkB7rucj5HfD6egy2+GQ3
	JKlEOQtRDlutbm6hpmmXky/8Xd182VPZiyEoPaAvxVCSjA3qIvgzHYeh
X-Gm-Gg: AZuq6aIQ5dPBXaW3h5shOXu/g0rouyyjZkvmabTbs/hbxek30tGT9QmjzQdIWXj7Cft
	ws61GJn4vW405VfS0MOoI/od47NIkUi/LsLPJvUQl2Pdlm6WsHA6gUMuDJbEJM/L8G0Sm9pVtT+
	D5wYLTP27fdKMlffBysEzZgmOXOWI7OgitvjUNOm5MgOhTH4OC20Yf7CmdOpB7o9be+I8rchbwr
	3zydqQ53BvWWq9F/9kuTcMfDLHcFW0Rlbl7rFRBgS3SHWxj3qPtXpCPDssgRvtZfTqHMNYH04kX
	qfhp0M9IFFMY7S10sj+GS89mdkdcnFyx+vfzy4otmGMfb/B6J9fRUtFbmnpk5exjcDRA+BhNPG3
	0xro6aHu14p2fEDqAnquM0W1WmerXqHzUCaNdanQSMsbVm7b1DAO9nAiHkWKGQ1MxkbbYs5aGj5
	Uckm+KIGFyxKv2k2e0NLG9dUQ7EFKo8U9Bh8yIPOfXKf8wHExFItgh33NKcuHqxqno
X-Received: by 2002:a05:6a00:1c90:b0:81f:832a:174 with SMTP id d2e1a72fcca58-82317b00f17mr301414b3a.16.1769107995037;
        Thu, 22 Jan 2026 10:53:15 -0800 (PST)
Received: from d.home.mmyangfl.tk ([2001:19f0:8001:1644:5400:5ff:fe3e:12b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-823186838dfsm90058b3a.30.2026.01.22.10.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:53:14 -0800 (PST)
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
Subject: [PATCH net-next] net: airoha: Use u64_stats_t with u64_stats_sync properly
Date: Fri, 23 Jan 2026 02:52:51 +0800
Message-ID: <20260122185255.2761568-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_105316_473295_8B7A67B3 
X-CRM114-Status: GOOD (  10.23  )
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
---
 drivers/net/ethernet/airoha/airoha_eth.c | 136 +++++++++++------------
 drivers/net/ethernet/airoha/airoha_eth.h |  34 +++---
 2 files changed, 85 insertions(+), 85 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 62bcbbbe2a95..6ed220e5a094 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1472,131 +1472,131 @@ static void airoha_update_hw_stats(struct airoha_gdm_port *port)
 
 	/* TX */
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
-	port->stats.tx_ok_pkts += ((u64)val << 32);
+	u64_stats_add(&port->stats.tx_ok_pkts, (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
-	port->stats.tx_ok_pkts += val;
+	u64_stats_add(&port->stats.tx_ok_pkts, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_H(port->id));
-	port->stats.tx_ok_bytes += ((u64)val << 32);
+	u64_stats_add(&port->stats.tx_ok_bytes, (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
-	port->stats.tx_ok_bytes += val;
+	u64_stats_add(&port->stats.tx_ok_bytes, val);
 
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
+	u64_stats_add(&port->stats.tx_len[i], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	u64_stats_add(&port->stats.tx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	u64_stats_add(&port->stats.tx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	u64_stats_add(&port->stats.tx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	u64_stats_add(&port->stats.tx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	u64_stats_add(&port->stats.tx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_H(port->id));
-	port->stats.tx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_L(port->id));
-	port->stats.tx_len[i++] += val;
+	u64_stats_add(&port->stats.tx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_LONG_CNT(port->id));
-	port->stats.tx_len[i++] += val;
+	u64_stats_add(&port->stats.tx_len[i++], val);
 
 	/* RX */
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_H(port->id));
-	port->stats.rx_ok_pkts += ((u64)val << 32);
+	u64_stats_add(&port->stats.rx_ok_pkts, (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_L(port->id));
-	port->stats.rx_ok_pkts += val;
+	u64_stats_add(&port->stats.rx_ok_pkts, val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_H(port->id));
-	port->stats.rx_ok_bytes += ((u64)val << 32);
+	u64_stats_add(&port->stats.rx_ok_bytes, (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_L(port->id));
-	port->stats.rx_ok_bytes += val;
+	u64_stats_add(&port->stats.rx_ok_bytes, val);
 
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
+	u64_stats_add(&port->stats.rx_len[i], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	u64_stats_add(&port->stats.rx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	u64_stats_add(&port->stats.rx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	u64_stats_add(&port->stats.rx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	u64_stats_add(&port->stats.rx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	u64_stats_add(&port->stats.rx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_H(port->id));
-	port->stats.rx_len[i] += ((u64)val << 32);
+	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_L(port->id));
-	port->stats.rx_len[i++] += val;
+	u64_stats_add(&port->stats.rx_len[i++], val);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_LONG_CNT(port->id));
-	port->stats.rx_len[i++] += val;
+	u64_stats_add(&port->stats.rx_len[i++], val);
 
 	/* reset mib counters */
 	airoha_fe_set(eth, REG_FE_GDM_MIB_CLEAR(port->id),
@@ -1795,16 +1795,16 @@ static void airoha_dev_get_stats64(struct net_device *dev,
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
 
@@ -2057,13 +2057,13 @@ static void airoha_ethtool_get_mac_stats(struct net_device *dev,
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
 
@@ -2098,12 +2098,12 @@ airoha_ethtool_get_rmon_stats(struct net_device *dev,
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


