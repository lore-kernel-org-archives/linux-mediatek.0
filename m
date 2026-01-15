Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5848CD44C59
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4pj0G+Abgyush+HjB0g/8sWijDo1hvace6ej6tDD+M=; b=itlvHkbug4GGo3i68v78Y0nF7b
	L81ex6zonKCyjiYdRdFRYxUhRhxWodhaPdOmBDn9ZuIIixEobviWF0oQUeFRz0jo1RGGDvGdQcPe4
	l/JQ2RB3A7vJetzLY04ZRi4TCqPky46slbsHkSyhuXDx0xicNcYAG+SRkU7RRv9s7tW7DIizXskJo
	ZuLeMe9JZljx1DN4AHiQmDhjbfGc1d32fn2QR0MpznHSQKiW+uML2DRM6oleQSQ36aPDRb2Ac97hf
	raWKbfDZ5NsrY/w1BeYIAl+oP0qZpAR6/NRFRcvSNi4UyuPk7rPZfLTHtufsH1ZZZ69puIhfNNJPf
	5wREGTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUN-0000000CUyf-08Ih;
	Thu, 15 Jan 2026 14:38:19 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUJ-0000000CUu0-37dx
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:16 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4042f55de3aso640088fac.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 06:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487894; x=1769092694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4pj0G+Abgyush+HjB0g/8sWijDo1hvace6ej6tDD+M=;
        b=fFrG9F2aPUquQjxYWjuH9zYs3AC+nw6er4weVXuHkVM4cBD3uFhlP7A7jy8CbG5n6N
         eak56zzmW1RU9D+Xis+OV3aFxXLdL8lqfWq/Jj8uhSEWMuXr/SqDNIjNHUIz9Nf8Bjo2
         d409b+sMxKxeucy48+dT+isZ6U5djJVyrExLQFFeHr8SSeOBJiYxX4pbZEnm3TJ/USAG
         0lb/65p7d4zAh0+LxvCAdu50x8qytGYguUIf1exjf/q96kENtZQuHJcZs8auIHOaWsRC
         9Qxo3i4xbJlArhWWMgTKA1iz+bgOEej3wqzTWiB5iBvqsPEfKi5gqnyKIWNVNT9GUvfU
         FkYA==
X-Forwarded-Encrypted: i=1; AJvYcCXYoCJ4LNDw8Py0/TDZW5nCTnQWqnxgSJOxI0OnVXrMND4XhPTJjmujGieWjbd51veFfqtz93Q5LdZr8QcTog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwT14jsvsyN6bHqTYg8g343uCPmb7tm98kA3pQUCDgT0ZaSwtq4
	AFfTHpcIc6UnqXAGOtYA7qKEXU4MRvxP8qcgO0h9ZvKruJfC+Ss7pBDJ
X-Gm-Gg: AY/fxX7FWjVFm9YL413ctCrhGkoSS0xGKMvZMgD4loG1xIHYs0A5bdHVT4oNayKZ4oF
	nmQgXRR2nrZBzuPoAuRbGCK4tQu31D2XUx0R+c5Kwgn6mIVMiMWXoqC9oQ5EhCjWTXM+0BRtm1O
	RZcz4O5m9u8x4g41YL4axTP8WsKuBVtktgva77Zd6HFT1v7MizvGcbB09sDU8FZB2TG6JyeRnRg
	cYjqAC95osoAxXFVziJXdtTYeUXSxGStE8hNqMf/oowZsStz/e0JO9YDjjV7Sd6LRguZ08p0byX
	RPKASELKFntMVckbkN6UePTc8zbPu5GK7QdCZw0Ibu1BwdVwLrAi6IQE8/oiYZBTeSv9HBky/UV
	sQ028RKuQZrkgqHSBPDZFRvEsOP0nOB6IjzoV2QNWrQYNVXMhOhh5VuPMG1QAoDgCNinkwdXRTY
	FaYQ==
X-Received: by 2002:a05:6871:e2d7:b0:3ff:c029:d24c with SMTP id 586e51a60fabf-40429044c12mr1905592fac.17.1768487894611;
        Thu, 15 Jan 2026 06:38:14 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:42::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4040cba2d2asm3965570fac.5.2026.01.15.06.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:14 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:49 -0800
Subject: [PATCH net-next 2/9] net: tsnep: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-2-b3e1b58bced5@debian.org>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
In-Reply-To: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
To: Ajit Khaparde <ajit.khaparde@broadcom.com>, 
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, 
 Somnath Kotur <somnath.kotur@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, 
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, 
 Bryan Whitehead <bryan.whitehead@microchip.com>, 
 UNGLinuxDriver@microchip.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=leitao@debian.org;
 h=from:subject:message-id; bh=VqwV07kQH4CtC2dzFBLL5ZX1yoUM3ruiZh1l3J4At1o=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvRXdQiLep1rFYIYQ2D4H5vs5OvolAtazC0M
 O/7iI/pc/uJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70QAKCRA1o5Of/Hh3
 bdcNEACK6R+vJJPtW8yLH04hKVq5d3PRhPSvRYiADaz5srmrMsfCXAVavitSAfOLb29EpgQlEef
 6I95MtC+vloxjsg+uluNGS/j5LTm2U3A8fHWijO3PQXNngVL1c5I+rBBBWZQqJEb3UEaKgtIBKz
 MLowyR2FFvubs0MEGXemyyR67ofdf5CtNDGpd8TPz0WmBkjX8DJ7bvjqG6mZ624T00ODQWAY2lv
 PHEMcm9ZfccLDCJiQhRk5+gdrSjED1Gz9+Ku5yOPue7p6ArvHR1z4vDWrjVgtMBs4I/l6P39tw9
 lsHE4X+ZRFztAZam0EzU1nF/0n1idvfdRN9boefz6WwwnzShz0tpgvq8U6BW8PoEFFLeGfeW1PG
 fmzmZSWz7D5RcOiTubf/h7/+vqsk7bD1EDJwVBanoEUYv8J+rbRSGgye321FGo/6hPSIW8gYB8a
 OodoPKdZoNLbib5yL+VPTnXSjFn0uilyPPw/Vsb7HF+E/nEtd+0qLUlpUue93flveq8kf/6OggZ
 43tIwDvSUydlJEGQfOAEbIC0eh1u+fuLacrxoxvTJKaT79Ea0gWw8/5n/cxTOBj3NOX2URG2UDK
 yqsKFU04o2wH1tFSJTpwYsNEY+KGV+igZGmLK76DdcwsVlIXCevVKZ6+SMQsluSW7n26vLg4fWE
 Q+QEg46BHDlNhlw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063815_793556_CD06EFA3 
X-CRM114-Status: GOOD (  11.21  )
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

Use the newly introduced .get_rx_ring_count ethtool ops callback instead
of handling ETHTOOL_GRXRINGS directly in .get_rxnfc().

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/engleder/tsnep_ethtool.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/engleder/tsnep_ethtool.c b/drivers/net/ethernet/engleder/tsnep_ethtool.c
index 228a638eae16..d11168278515 100644
--- a/drivers/net/ethernet/engleder/tsnep_ethtool.c
+++ b/drivers/net/ethernet/engleder/tsnep_ethtool.c
@@ -257,15 +257,19 @@ static int tsnep_ethtool_get_sset_count(struct net_device *netdev, int sset)
 	}
 }
 
+static u32 tsnep_ethtool_get_rx_ring_count(struct net_device *netdev)
+{
+	struct tsnep_adapter *adapter = netdev_priv(netdev);
+
+	return adapter->num_rx_queues;
+}
+
 static int tsnep_ethtool_get_rxnfc(struct net_device *netdev,
 				   struct ethtool_rxnfc *cmd, u32 *rule_locs)
 {
 	struct tsnep_adapter *adapter = netdev_priv(netdev);
 
 	switch (cmd->cmd) {
-	case ETHTOOL_GRXRINGS:
-		cmd->data = adapter->num_rx_queues;
-		return 0;
 	case ETHTOOL_GRXCLSRLCNT:
 		cmd->rule_cnt = adapter->rxnfc_count;
 		cmd->data = adapter->rxnfc_max;
@@ -469,6 +473,7 @@ const struct ethtool_ops tsnep_ethtool_ops = {
 	.get_sset_count = tsnep_ethtool_get_sset_count,
 	.get_rxnfc = tsnep_ethtool_get_rxnfc,
 	.set_rxnfc = tsnep_ethtool_set_rxnfc,
+	.get_rx_ring_count = tsnep_ethtool_get_rx_ring_count,
 	.get_channels = tsnep_ethtool_get_channels,
 	.get_ts_info = tsnep_ethtool_get_ts_info,
 	.get_coalesce = tsnep_ethtool_get_coalesce,

-- 
2.47.3


