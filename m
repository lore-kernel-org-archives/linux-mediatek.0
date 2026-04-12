Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15827E937F6
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Apr 2026 17:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbtX0VejGYm++geRf9JR5ILTRowmHo+ukrxj65iS2CU=; b=GFzd9AX8IHocbncMwXtxXEaDUZ
	ggZ/Hp9Wg2AoS38kTGSvRLP1iuHuMqAOJcJrx0VeoijjAQUf/b9CZtQzlhnNQ8ZhSgNRKhqN+XnDa
	LGm+vUD77kWbKgS/taAWjEVuxOTYPop0MjX5759UKxYK+MOQ20SGhgxoqSPXmpzn36iflHhoLLfUl
	HNTpS6gWQUldTPydhfymaMVL935UyKDB4Eq5IZuHpW9b1X77sK3Y6i2PFc2stRUkDAlb/UMvYNa5Z
	84hRBESOAZKkv8ppes8BZ2XOqAMpaLf4DC5+hz9eu9RKvFJSdYn5lQOf7nrd1n+K5Ey9poZBapqAL
	39OYrMLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByNS-0000000EWp3-0okl;
	Sun, 12 Apr 2026 17:13:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByNP-0000000EWmq-48Vb;
	Sun, 12 Apr 2026 17:13:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B46D43E4B;
	Sun, 12 Apr 2026 17:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9BBC19424;
	Sun, 12 Apr 2026 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776014019;
	bh=A4vZOYrBFXrwCZ6XgUhSyRpm2VWlm0ssITNmstnf8Mc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gcy7CzmuqisLOIAuH949XOiGosGD7HaGaJ027XCTpQjl8BKqBEMuIi1RqPjaE4diK
	 blxLgrGXCj66PBP/XpCJfhKQ+AFB5WCeIydywpgAzAWDntsytdndL/SVh7EO6uzCbk
	 /RJDNvXKFbBFf7O/p5nv5Q79973ual5VAZ0h3xO6okEskj7JKiHbE+lzMPpn/sJFwJ
	 l+KVVO6YgYFNT3wGDCbxDSxZG20BVlbI2BfNjYKusp0KFCkivDEvk6Ne2tposaeLAm
	 jLDn44I9bEtg1nXJss1aGg5HYFt1cZ+tuHI1TMND/nrj5Sk9h86IUBj2KH/Y5ptBsw
	 qt6t/u7xTaqdw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 12 Apr 2026 19:13:12 +0200
Subject: [PATCH net-next 1/3] net: airoha: Rely on net_device pointer in
 airoha_dev_setup_tc_block signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-airoha-multi-serdes-preliminary-patch-v1-1-08d5b670ca8f@kernel.org>
References: <20260412-airoha-multi-serdes-preliminary-patch-v1-0-08d5b670ca8f@kernel.org>
In-Reply-To: <20260412-airoha-multi-serdes-preliminary-patch-v1-0-08d5b670ca8f@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_101340_071400_2AD08574 
X-CRM114-Status: GOOD (  11.97  )
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

Remove airoha_gdm_port dependency in airoha_dev_setup_tc_block routine
signature and rely on net_device pointer instead. Please note this patch
does not introduce any logical change and it is a preliminary patch to
support multiple net_devices connected to the GDM3 or GDM4 ports via an
external hw arbiter.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8e4b043af4bc..a98512e963b5 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2687,7 +2687,7 @@ static int airoha_dev_setup_tc_block_cb(enum tc_setup_type type,
 	}
 }
 
-static int airoha_dev_setup_tc_block(struct airoha_gdm_port *port,
+static int airoha_dev_setup_tc_block(struct net_device *dev,
 				     struct flow_block_offload *f)
 {
 	flow_setup_cb_t *cb = airoha_dev_setup_tc_block_cb;
@@ -2700,12 +2700,12 @@ static int airoha_dev_setup_tc_block(struct airoha_gdm_port *port,
 	f->driver_block_list = &block_cb_list;
 	switch (f->command) {
 	case FLOW_BLOCK_BIND:
-		block_cb = flow_block_cb_lookup(f->block, cb, port->dev);
+		block_cb = flow_block_cb_lookup(f->block, cb, dev);
 		if (block_cb) {
 			flow_block_cb_incref(block_cb);
 			return 0;
 		}
-		block_cb = flow_block_cb_alloc(cb, port->dev, port->dev, NULL);
+		block_cb = flow_block_cb_alloc(cb, dev, dev, NULL);
 		if (IS_ERR(block_cb))
 			return PTR_ERR(block_cb);
 
@@ -2714,7 +2714,7 @@ static int airoha_dev_setup_tc_block(struct airoha_gdm_port *port,
 		list_add_tail(&block_cb->driver_list, &block_cb_list);
 		return 0;
 	case FLOW_BLOCK_UNBIND:
-		block_cb = flow_block_cb_lookup(f->block, cb, port->dev);
+		block_cb = flow_block_cb_lookup(f->block, cb, dev);
 		if (!block_cb)
 			return -ENOENT;
 
@@ -2813,7 +2813,7 @@ static int airoha_dev_tc_setup(struct net_device *dev, enum tc_setup_type type,
 		return airoha_tc_setup_qdisc_htb(port, type_data);
 	case TC_SETUP_BLOCK:
 	case TC_SETUP_FT:
-		return airoha_dev_setup_tc_block(port, type_data);
+		return airoha_dev_setup_tc_block(dev, type_data);
 	default:
 		return -EOPNOTSUPP;
 	}

-- 
2.53.0


