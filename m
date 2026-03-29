Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF6FF3D603
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Mar 2026 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOwPiFeHtk98f3yVo5FWd3NKyO34x2E2ZRsudEcrmKE=; b=Ud41hbiSrK6KTQrFtaodqIJ5VB
	EC8d6VB6IK85JtkQDhxBHfI0orNOXFFGFemeJTlp/V7JRw21b2PiMEihOpJ/FXs8uuCdwzGXXC1dL
	pHp8Urm2fkVofq9FH1Y9RclyxYq1QqpkTWOAJmOVSj4dEiF86A5jeD2p9n/rbmB28ytlQKJfzLvr4
	Vbdo6wdI0cQ+8RHWbq9dKWVlUNW+9+DbLxn6WnqqoZ1nSZzyabmY/2S/WFJYps8CXcUwddtZGUWLB
	+OY0m1GqZOgx1XetSG48+FhiZb7QxZJgsIrDsVBRTGUgUotLqVTrc3k4MmxBR8Bf5q/g2BT5tEOuy
	5Dbq3hGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psV-00000009wpT-3VyD;
	Sun, 29 Mar 2026 13:08:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psL-00000009wkx-2zhb;
	Sun, 29 Mar 2026 13:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29FDA60126;
	Sun, 29 Mar 2026 13:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86001C19423;
	Sun, 29 Mar 2026 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774789700;
	bh=4EhZThLH7oO/aeN4dZc7bHt9j7nfkfQrYsBvUetgK48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H58wW6ItX9MBfojrR0xjlUdD3KnMeTSkBWPW95ulvBn9jtgdtdzS3zsHhjapFH1Fb
	 pL0nKhSS5UMZRCup4AiQn9vttyMZFOOSy+Y42Iox6gWUjWjuiOX/KME4y83A647dQC
	 qKHrNA6nbWapc4yLekKrDi/QTGiYvYNLHppRJC5+ThuDpUy14oCYFVbpDrPahLxG+3
	 4Euk2Hxqo+yAPTezhxEpuLGurqW+i28Nt75piIi3FI15/w6x7zDspDCm3KThC3fEtU
	 7G/VlAjnNb/KWebtZdVcrgvS5rFMzU2n2Ao4kGSsnc2Jn+j819ERlVf5BAwqJdBHLA
	 3/XZ2kurDshDQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 29 Mar 2026 15:07:52 +0200
Subject: [PATCH net-next 02/10] net: airoha: Rely on net_device pointer in
 airoha_dev_setup_tc_block signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-airoha-eth-multi-serdes-v1-2-00f52dc360ca@kernel.org>
References: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
In-Reply-To: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
X-Mailer: b4 0.14.2
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
external hw multiplexer.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 743ef0db30980ce74059dfb63553030ef3bf735f..421a154ee7189eb7919382b6cd893ae5d4e03766 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2671,7 +2671,7 @@ static int airoha_dev_setup_tc_block_cb(enum tc_setup_type type,
 	}
 }
 
-static int airoha_dev_setup_tc_block(struct airoha_gdm_port *port,
+static int airoha_dev_setup_tc_block(struct net_device *dev,
 				     struct flow_block_offload *f)
 {
 	flow_setup_cb_t *cb = airoha_dev_setup_tc_block_cb;
@@ -2684,12 +2684,12 @@ static int airoha_dev_setup_tc_block(struct airoha_gdm_port *port,
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
 
@@ -2698,7 +2698,7 @@ static int airoha_dev_setup_tc_block(struct airoha_gdm_port *port,
 		list_add_tail(&block_cb->driver_list, &block_cb_list);
 		return 0;
 	case FLOW_BLOCK_UNBIND:
-		block_cb = flow_block_cb_lookup(f->block, cb, port->dev);
+		block_cb = flow_block_cb_lookup(f->block, cb, dev);
 		if (!block_cb)
 			return -ENOENT;
 
@@ -2797,7 +2797,7 @@ static int airoha_dev_tc_setup(struct net_device *dev, enum tc_setup_type type,
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


