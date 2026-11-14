Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94AA606A32D
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G0EDCaRJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UNf/N/et
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1Qx/w97/Ge0dQ9t4hQAOOBki4nWw7shLdPCI1PWwoSs=; b=G0EDCaRJFajRHH
	L4iCvwgePChztNVd3by1Zuwa9o7eAjxXnzNeHhgcG3bGA8aZp07B8JO6pTLAqtQ0n1Xk4kkDFX4NM
	BeldIHEKq6f9maK+z0AdNMXtzCB5IMMcCVDYRCrgcIxJPsno7wndEnTYV1S/HrAks79b2oqgPFt4g
	mxypWsAnVYJb4AHtSuF1giUphWyqtuv2Kyrk4lGQN8craP9+MPzAPq97irjEw2HOvKxOkHreqC8zj
	V0w1RXaiBYXonJ5KemgIzG6hNf/he37VVjI3JQSStiqKn3FHqLOkhUJ8DnA3VXnV2Bz7K1FOgILe1
	3bOZ+FwlF/W+CypchSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBG3-0000000FnjX-2ACW;
	Sat, 14 Nov 2026 10:45:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFq-0000000FnHG-0JAd
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Nov 2026 10:45:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4bb5f49a61bso3150115e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 14 Nov 2026 02:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653104; x=1795257904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Qx/w97/Ge0dQ9t4hQAOOBki4nWw7shLdPCI1PWwoSs=;
        b=UNf/N/etoe93OT3VI38pHvmUNjwcdX2LEtCYJBXXd92nkHNQbg3jWpUTs/tzIAzj6Q
         iGFGZsw/d04QL3qIstJj/zShoio/QN+P1jObQcm/jLxpxStTOjRqvLBw462z/xh5d4Cq
         FrFZY9gVpkz32KGSdELtP1noQ13oZ7TAizZ7q02uCTUXdlckcihio7/IWYujFvJzBhJo
         0GqfPONoSEdHpZ67/WmSi7IWPolABYrOobaJvrXVq/L7KeVrjTf6UvRfivphhKTtqobF
         L06W66kbX+BeJaCaHEw5wS3A7MxHs3UPMK518gTYGeAesZKs/EghmdJFQA+hlII+ZAKx
         Db1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653104; x=1795257904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Qx/w97/Ge0dQ9t4hQAOOBki4nWw7shLdPCI1PWwoSs=;
        b=NPHQIe3LeT1mte/bp3eQWUdK2I0muA/dRvPZTmtePaYr3pwpPnofRqm6jsBbKoyzve
         +ftHYcCOgXyNegrfHr4jjDEP1a6TTJcrOUrLzVjQNkQEl9v1ZMU8NVr4qfnBpdvzNOKd
         1TjAIou7a31QN4cmmNYsHprqba2Hy2HzvbX0WbbCzfTegEeKTNwih0fCdUgChdPis+/g
         8tSa+MXj9DJAJxqcFYDt8Qz85ssyrTE+CsLXX8IL8i8OY9EfxzzUJfUC5gq3LhNogKvI
         5S/cZ2g2de8qt0RuI9sPn/rNmRsdLbDX5yORru7Q7YRpatT8K4w14y8QxxaI3ECC4oJk
         mXUg==
X-Forwarded-Encrypted: i=1; AL+hErHZ6yT5EWBYg63cyXW1svQX2siAwtt9MoRRUa3AaJrzpGDjYgggX/cjgvJF4zJBGEN/lSS22KHCnLJAhOEtvQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/HiNCSAk3myBvlRHQNp2PqqAVTgB34enltMLEPEw0kE3G4wRfV
	HRcX6a3DIqtEimulX6QdMO+2CEHxiraRbDf57B+YiGN5/PYBBVbQZshN
X-Gm-Gg: AYBFou3ZpJzWv1aDHeUvTAz6Qdz3DzMhRtmj6GEeTsIYN+eC6NT0gcPxhTy8FXebede
	PC6UMEALoIUehrS3sWt3UqbvqzD2mm6VlEXbFuru3dbmgARlcDL3u5lQHAuEFki69ciY9a+U7pH
	crSM1e0GHiIWXX0VeKKDP3MAk9qcCz3MrcGrx0V5S0n6N88hvjSxdjN1qzaTP+K8b01Q6MPQxTx
	ZqSjSRBkGx2uART853dFbwuFGfocllre8i80QOXIKB6P9bNLq6qxssL9PaVaQgTL9dhZkdokJGh
	jQ9ONpjqqg37KokIOLhLTOrawmpeph09kZMZL7YpmtcntNZ74ALqAIRwlhXQBjDoXL/l744dENp
	NUrnbplrSvzVtlFJ1co4bg1R3Z8RET9TWuyBaVHipL9V8RfjHqV4hk+LdDl+yqWHKXC//G7e/9S
	mYgBChkf+K5UythKVEzqzNN+Rbe7YH7v9W7s4lss4EEPWLyhI6Yqtt5qfi4wDYLF6lFsKYuZJrp
	wlAc0uHKw5lPcPwn22C8cgKK4MRF2pn0UPWVnlOS7aAdX0b+wByXYfLVRhV8CD69fxr76uV51sf
	+IAkc1noKvW/4MWoyfXjXIeasHcEX+eKquqZDstcBd33uL2ArJtIsTCSGxLjkX+lkmd9MpDlZK+
	+3CZMwB047dlDIrWflvAWGkik6MQbjonDCGIYh7HsGPOLHH2fUuDadQI=
X-Received: by 2002:a05:600c:34d2:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb55ac6cabmr104943615e9.34.1794653104327;
        Sat, 14 Nov 2026 02:45:04 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:45:03 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH net-next v20 15/15] net: airoha: add phylink support
Date: Sat, 14 Nov 2026 11:43:54 +0100
Message-ID: <20261114104426.235620-16-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024506_572306_2ECD083B 
X-CRM114-Status: GOOD (  25.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add phylink support for each GDM port. For GDM1 add the internal interface
mode as the only supported mode. For GDM2/3/4 add the required
configuration of the PCS to make the external PHY or attached SFP cage
work.

These needs to be defined in the GDM port node using the pcs-handle
property.

Update and provide a .get/set_link_ksettings function that use phylink
for ethtool OPs now that we fully support phylink.

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/Kconfig       |   2 +
 drivers/net/ethernet/airoha/airoha_eth.c  | 197 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   5 +
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 4 files changed, 213 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
index 1f6640a15fc9..5c54a07d2a76 100644
--- a/drivers/net/ethernet/airoha/Kconfig
+++ b/drivers/net/ethernet/airoha/Kconfig
@@ -20,6 +20,8 @@ config NET_AIROHA
 	depends on NET_DSA || !NET_DSA
 	select NET_AIROHA_NPU
 	select PAGE_POOL
+	select PCS_AIROHA
+	select PHYLINK
 	help
 	  This driver supports the gigabit ethernet MACs in the
 	  Airoha SoC family.
diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index b164a78ddac9..81a8da721c13 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -6,6 +6,7 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/pcs/pcs.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
 #include <linux/u64_stats_sync.h>
@@ -2194,10 +2195,18 @@ static int airoha_dev_open(struct net_device *netdev)
 		return -EBUSY;
 	}
 
+	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
+	if (err) {
+		netdev_err(netdev, "could not attach PHY: %d\n", err);
+		return err;
+	}
+
+	phylink_start(dev->phylink);
+
 	netif_tx_start_all_queues(netdev);
 	err = airoha_set_vip_for_gdm_port(dev, true);
 	if (err)
-		return err;
+		goto err_phy_stop;
 
 	if (netdev_uses_dsa(netdev))
 		airoha_fe_set(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
@@ -2219,6 +2228,12 @@ static int airoha_dev_open(struct net_device *netdev)
 		airoha_dev_lro_enable(dev);
 
 	return 0;
+
+err_phy_stop:
+	phylink_stop(dev->phylink);
+	phylink_disconnect_phy(dev->phylink);
+
+	return err;
 }
 
 static int airoha_dev_stop(struct net_device *netdev)
@@ -2226,6 +2241,8 @@ static int airoha_dev_stop(struct net_device *netdev)
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
 
+	phylink_stop(dev->phylink);
+
 	netif_tx_disable(netdev);
 	airoha_set_vip_for_gdm_port(dev, false);
 
@@ -2239,6 +2256,8 @@ static int airoha_dev_stop(struct net_device *netdev)
 	if (netdev->features & NETIF_F_LRO)
 		airoha_dev_lro_disable(dev);
 
+	phylink_disconnect_phy(dev->phylink);
+
 	return 0;
 }
 
@@ -2829,6 +2848,24 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
 	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
 }
 
+static int
+airoha_ethtool_get_link_ksettings(struct net_device *netdev,
+				  struct ethtool_link_ksettings *cmd)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+
+	return phylink_ethtool_ksettings_get(dev->phylink, cmd);
+}
+
+static int
+airoha_ethtool_set_link_ksettings(struct net_device *netdev,
+				  const struct ethtool_link_ksettings *cmd)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+
+	return phylink_ethtool_ksettings_set(dev->phylink, cmd);
+}
+
 static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
 					 int channel, enum tx_sched_mode mode,
 					 const u16 *weights, u8 n_weights)
@@ -3696,7 +3733,8 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_drvinfo		= airoha_ethtool_get_drvinfo,
 	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
-	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
+	.get_link_ksettings	= airoha_ethtool_get_link_ksettings,
+	.set_link_ksettings	= airoha_ethtool_set_link_ksettings,
 	.get_link		= ethtool_op_get_link,
 };
 
@@ -3752,6 +3790,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
 	return false;
 }
 
+/* Nothing to do in MAC, everything is handled in PCS */
+static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
+			      const struct phylink_link_state *state)
+{
+}
+
+static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex, bool tx_pause, bool rx_pause)
+{
+	struct airoha_gdm_dev *dev = container_of(config, struct airoha_gdm_dev,
+						  phylink_config);
+	struct airoha_gdm_port *port = dev->port;
+	struct airoha_eth *eth = dev->eth;
+	u32 frag_size_tx, frag_size_rx;
+
+	/* TX/RX frag is configured only for GDM4 */
+	if (port->id != AIROHA_GDM4_IDX)
+		return;
+
+	switch (speed) {
+	case SPEED_10000:
+	case SPEED_5000:
+		frag_size_tx = 8;
+		frag_size_rx = 8;
+		break;
+	case SPEED_2500:
+		frag_size_tx = 2;
+		frag_size_rx = 1;
+		break;
+	default:
+		frag_size_tx = 1;
+		frag_size_rx = 0;
+		break;
+	}
+
+	mutex_lock(&port->link_lock);
+
+	/* Configure TX/RX frag based on speed */
+	if (dev->nbq == 1) {
+		airoha_fe_rmw(eth, REG_FE_GDM4_TMBI_FRAG,
+			      GDM4_SGMII1_TX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII1_TX_FRAG_SIZE_MASK,
+					 frag_size_tx));
+
+		airoha_fe_rmw(eth, REG_FE_GDM4_RMBI_FRAG,
+			      GDM4_SGMII1_RX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII1_RX_FRAG_SIZE_MASK,
+					 frag_size_rx));
+	} else {
+		airoha_fe_rmw(eth, REG_FE_GDM4_TMBI_FRAG,
+			      GDM4_SGMII0_TX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII0_TX_FRAG_SIZE_MASK,
+					 frag_size_tx));
+
+		airoha_fe_rmw(eth, REG_FE_GDM4_RMBI_FRAG,
+			      GDM4_SGMII0_RX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII0_RX_FRAG_SIZE_MASK,
+					 frag_size_rx));
+	}
+
+	mutex_unlock(&port->link_lock);
+}
+
+/* Nothing to do in MAC, everything is handled in PCS */
+static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
+				 phy_interface_t interface)
+{
+}
+
+static const struct phylink_mac_ops airoha_phylink_ops = {
+	.mac_config = airoha_mac_config,
+	.mac_link_up = airoha_mac_link_up,
+	.mac_link_down = airoha_mac_link_down,
+};
+
+static int airoha_fill_available_pcs(struct phylink_config *config,
+				     struct phylink_pcs **available_pcs,
+				     unsigned int num_possible_pcs)
+{
+	struct device *dev = config->dev;
+
+	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+					num_possible_pcs);
+}
+
+static int airoha_setup_phylink(struct net_device *netdev)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	struct device_node *np = netdev->dev.of_node;
+	struct airoha_gdm_port *port = dev->port;
+	struct phylink_config *config;
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
+	int err;
+
+	err = of_get_phy_mode(np, &phy_mode);
+	if (err) {
+		dev_err(&netdev->dev, "incorrect phy-mode\n");
+		return err;
+	}
+
+	config = &dev->phylink_config;
+	config->dev = &netdev->dev;
+	config->type = PHYLINK_NETDEV;
+
+	/*
+	 * GDM1 only supports internal for Embedded Switch
+	 * and doesn't require a PCS.
+	 */
+	if (port->id == AIROHA_GDM1_IDX) {
+		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+					   MAC_10000FD;
+
+		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+			  config->supported_interfaces);
+	} else {
+		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+					   MAC_10 | MAC_100 | MAC_1000 |
+					   MAC_2500FD | MAC_5000FD | MAC_10000FD;
+
+		config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(config->dev));
+		config->fill_available_pcs = airoha_fill_available_pcs;
+
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_10GBASER,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_USXGMII,
+			  config->supported_interfaces);
+
+		phy_interface_copy(config->pcs_interfaces,
+				   config->supported_interfaces);
+	}
+
+	phylink = phylink_create(config, of_fwnode_handle(np),
+				 phy_mode, &airoha_phylink_ops);
+	if (IS_ERR(phylink))
+		return PTR_ERR(phylink);
+
+	dev->phylink = phylink;
+
+	return 0;
+}
+
 static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 				   struct airoha_gdm_port *port,
 				   int nbq, struct device_node *np)
@@ -3815,7 +4002,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 	dev->nbq = nbq;
 	port->devs[index] = dev;
 
-	return 0;
+	return airoha_setup_phylink(netdev);
 }
 
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
@@ -3851,6 +4038,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 
 	port->id = id;
 	spin_lock_init(&port->stats_lock);
+	mutex_init(&port->link_lock);
 	eth->ports[p] = port;
 
 	err = airoha_metadata_dst_alloc(port);
@@ -4047,6 +4235,8 @@ static int airoha_probe(struct platform_device *pdev)
 			netdev = netdev_from_priv(dev);
 			if (netdev->reg_state == NETREG_REGISTERED)
 				unregister_netdev(netdev);
+			if (dev->phylink)
+				phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
@@ -4085,6 +4275,7 @@ static void airoha_remove(struct platform_device *pdev)
 
 			netdev = netdev_from_priv(dev);
 			unregister_netdev(netdev);
+			phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index d270729e22ff..909e75fec279 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -612,6 +612,9 @@ struct airoha_gdm_dev {
 	 * QDMA migration.
 	 */
 	spinlock_t txq_lock[AIROHA_NUM_NETDEV_TX_RINGS];
+
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
 };
 
 struct airoha_gdm_port {
@@ -621,6 +624,8 @@ struct airoha_gdm_port {
 
 	/* protect concurrent hw_stats accesses */
 	spinlock_t stats_lock;
+	/* protect concurrent GDM4 register access */
+	struct mutex link_lock;
 
 	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
 };
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 07dd04859fde..94d53d4c3ab7 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -371,6 +371,18 @@
 #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
 #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
 
+#define REG_FE_GDM4_TMBI_FRAG		0x2028
+#define GDM4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDM4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDM4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDM4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
+#define REG_FE_GDM4_RMBI_FRAG		0x202c
+#define GDM4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDM4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDM4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDM4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
 #define REG_MC_VLAN_EN			0x2100
 #define MC_VLAN_EN_MASK			BIT(0)
 
-- 
2.55.0


