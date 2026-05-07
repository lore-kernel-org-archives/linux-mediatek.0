Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A569CD37AA
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2026 21:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CU5hc1DA1CiGChg4fsggJp0axPdZ5rWF4k15UEJ0d14=; b=lLsHlVfNMXq3YDYoF30b5dx50H
	oYSqUdCWRCSy3cmwQB8ImD0+8AcSt94eurDw0TL8C6Jps1uVyFOO8VO7UgoGNVKXa5uEDZs2SIZB+
	g54th+lOtF8FFPwOQf1d8H04i428u8X6ISlpHeAYwbEooKvXM7xCZ0eiezw3PF9N2ObHqPEyZYE1g
	77y97uyW+wf8oASBPDCFr14LlLUi+ma5LXRpCLIM8eebSWOdvo8taBtuQ6RU84eLHTVTRgRTDyjmP
	+TtV/0NGM4qtMDyLZQ/ez9Y8PvMJQs/X85IcZBHxuVxpUY7WHJ4PsPZVksxo672xjR9lIiK0+JMXi
	jQRqaWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6BM-00000004ulV-0niM;
	Thu, 07 May 2026 21:22:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6BI-00000004ueG-1kj2;
	Thu, 07 May 2026 21:22:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5C9660181;
	Thu,  7 May 2026 21:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FFBC2BCF5;
	Thu,  7 May 2026 21:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778188971;
	bh=fcQuV8WMZWguNDOAHbXa5lYO/Ui/98EqaE3hlGtG44Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fm2Gguc/CP29SWELe5aR27miAGHD2sKbHJxjOSO75cX+a9JZ/ttCWEpYK8h4ypTfS
	 PqNOfQzmZBWWehIHrNRWLl7WhpOCe1wxeVUJl/gDQniKdzneE5NLsuCmTWexZFBiIw
	 rlDI7o2OS8U+2proT2vNEKDp18oYeooiS28VhN45y8c+BdIXXlpoOf204Ey3AATXAq
	 7ohK0B8dtjAuSREsFH7RQfNocorPPPjG7Y1iMzU2GWiPOD509deh+KJmtmuRDLmVa2
	 QGKGq0Q9kd9EjLqyMqSy21uG8NKSy8ku9IDRc0MYMAUAyNzTIRcABxW01Yo6jjA7H9
	 F37sIzNB1SG0Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 07 May 2026 23:21:53 +0200
Subject: [PATCH net-next v4 10/10] net: airoha: Support multiple LAN/WAN
 interfaces for hw MAC address configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-airoha-eth-multi-serdes-v4-10-af613b61ae02@kernel.org>
References: <20260507-airoha-eth-multi-serdes-v4-0-af613b61ae02@kernel.org>
In-Reply-To: <20260507-airoha-eth-multi-serdes-v4-0-af613b61ae02@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Madhur Agrawal <madhur.agrawal@airoha.com>
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

The EN7581 and AN7583 SoCs provide registers to configure hardware LAN/WAN
MAC addresses, used to determine whether received traffic is destined for
this host or should be forwarded to another device.
The SoC hardware design assumes all interfaces configured as LAN (or WAN)
share a common upper MAC address, which is programmed into the
REG_FE_{LAN,WAN}_MAC_H register. The lower bytes of 'local' addresses can
be expressed as a range via the REG_FE_MAC_LMIN and REG_FE_MAC_LMAX
registers.
Previously, only a single interface was considered when programming these
registers. Extend the logic to derive the correct minimum and maximum
values for REG_FE_MAC_LMIN/REG_FE_MAC_LMAX when two or more interfaces are
configured as LAN or WAN.

Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 73 +++++++++++++++++++++++++++-----
 1 file changed, 63 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8617dd4f7932..fbfefd0ec355 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -71,20 +71,67 @@ static void airoha_qdma_irq_disable(struct airoha_irq_bank *irq_bank,
 	airoha_qdma_set_irqmask(irq_bank, index, mask, 0);
 }
 
-static void airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *addr)
+static int airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *addr)
 {
 	struct airoha_eth *eth = dev->eth;
-	u32 val, reg;
+	u8 ref_addr[ETH_ALEN] = {};
+	u32 reg, val, lmin, lmax;
+	int i;
+
+	lmin = (addr[3] << 16) | (addr[4] << 8) | addr[5];
+	lmax = lmin;
+
+	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
+		struct airoha_gdm_port *port = eth->ports[i];
+		int j;
+
+		if (!port)
+			continue;
+
+		for (j = 0; j < ARRAY_SIZE(port->devs); j++) {
+			struct airoha_gdm_dev *iter_dev;
+			struct net_device *netdev;
+
+			iter_dev = port->devs[j];
+			if (!iter_dev || iter_dev == dev)
+				continue;
+
+			if (airoha_is_lan_gdm_dev(iter_dev) !=
+			    airoha_is_lan_gdm_dev(dev))
+				continue;
+
+			netdev = iter_dev->dev;
+			if (netdev->reg_state != NETREG_REGISTERED)
+				continue;
+
+			ether_addr_copy(ref_addr, netdev->dev_addr);
+			val = (netdev->dev_addr[3] << 16) |
+			      (netdev->dev_addr[4] << 8) | netdev->dev_addr[5];
+			if (val < lmin)
+				lmin = val;
+			if (val > lmax)
+				lmax = val;
+		}
+	}
+
+	if (!is_zero_ether_addr(ref_addr) && memcmp(ref_addr, addr, 3)) {
+		/* According to the HW design, hw mac address MS bits
+		 * must be the same for each net_device with the same
+		 * LAN/WAN configuration.
+		 */
+		return -EINVAL;
+	}
 
 	reg = airoha_is_lan_gdm_dev(dev) ? REG_FE_LAN_MAC_H : REG_FE_WAN_MAC_H;
 	val = (addr[0] << 16) | (addr[1] << 8) | addr[2];
 	airoha_fe_wr(eth, reg, val);
 
-	val = (addr[3] << 16) | (addr[4] << 8) | addr[5];
-	airoha_fe_wr(eth, REG_FE_MAC_LMIN(reg), val);
-	airoha_fe_wr(eth, REG_FE_MAC_LMAX(reg), val);
+	airoha_fe_wr(eth, REG_FE_MAC_LMIN(reg), lmin);
+	airoha_fe_wr(eth, REG_FE_MAC_LMAX(reg), lmax);
 
 	airoha_ppe_init_upd_mem(dev);
+
+	return 0;
 }
 
 static void airoha_set_gdm_port_fwd_cfg(struct airoha_eth *eth, u32 addr,
@@ -1792,13 +1839,18 @@ static int airoha_dev_stop(struct net_device *netdev)
 static int airoha_dev_set_macaddr(struct net_device *netdev, void *p)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	struct sockaddr *addr = p;
 	int err;
 
-	err = eth_mac_addr(netdev, p);
+	err = eth_prepare_mac_addr_change(netdev, p);
 	if (err)
 		return err;
 
-	airoha_set_macaddr(dev, netdev->dev_addr);
+	err = airoha_set_macaddr(dev, addr->sa_data);
+	if (err)
+		return err;
+
+	eth_commit_mac_addr_change(netdev, p);
 
 	return 0;
 }
@@ -1903,6 +1955,7 @@ static int airoha_dev_init(struct net_device *netdev)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
+	int err;
 
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
@@ -1922,12 +1975,12 @@ static int airoha_dev_init(struct net_device *netdev)
 	}
 
 	airoha_dev_set_qdma(dev);
-	airoha_set_macaddr(dev, netdev->dev_addr);
+	err = airoha_set_macaddr(dev, netdev->dev_addr);
+	if (err)
+		return err;
 
 	if (!airoha_is_lan_gdm_dev(dev) &&
 	    (port->id == AIROHA_GDM3_IDX || port->id == AIROHA_GDM4_IDX)) {
-		int err;
-
 		err = airoha_set_gdm2_loopback(dev);
 		if (err) {
 			dev->flags &= ~PRIV_FLAG_WAN;

-- 
2.54.0


