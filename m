Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1721FCD98C4
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 15:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKAHZBj8Q4+vRNpcM7hRX5sDNhQM8RLIVJoZZt90zy8=; b=M/NnCwTR6emQIcv9Jssv9fwjIX
	TnAxZDnTN9o3E232nHtEB2UmDHxh4o3gwZvsizSzg9BCRADsMyTTQS/gCDJfUEgITEOBZ+S+4Phid
	bcbywWbI40uUeU7741QZXlb1C+u++TFB12VeOy0CY738u58irwJ3goE0OMi2kO5o5RdNBvdORcrCy
	x8NUjtdemSDFxlqGAGPYFXZeJeYMFIRO7wVLcy5sgJzib5oBnpt7r9dujK/YIYyryqapl21DuO17+
	XUs+3xBnlAbqIapNcIjOviVqbEyHfNeqOACKfG0eBNhiSSIBwTXS++s53xkewv6e8GgsJzVzpoCae
	Zk5qDY6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy9D-00000005ssI-0KRD;
	Tue, 09 Jun 2026 15:13:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy99-00000005ski-0JZK
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Jun 2026 15:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=BKAHZBj8Q4+vRNpcM7hRX5sDNhQM8RLIVJoZZt90zy8=; b=JkEguaKZaaC/NWn/K7/03cpLj6
	qXK/mS0tyQub+CQ8vOV+w1V8rhCvkWCiqfDaOAVl+13bIqJ9YUKGjKtrOt6zYcxvbaqxXXmnAdF5b
	Xr+DCF5BKfvV240ti87uf3npXh0CkuJvojzBT+ipd+QZmfSBXKo8jOU/uEQa6e/LCS/dDrbwQLicU
	4aS5Nl5W6IZmZcAichFKUB1TdjSVwy3Zk/4OVDp0KFOHs2racdZRBHFDBDwWTN08ZJ02Nl9CF52oZ
	KxmjENnJEXYSEyjSiowJ7Z4y2+SlDEn77hmZIpliPJoETVx6vHC1tgEeIWOAsRbe+mdnbcRv0gG4I
	QPEESWDQ==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWy96-00000002i3I-0TzW
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 15:13:41 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-beeba001887so751359466b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018019; x=1781622819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKAHZBj8Q4+vRNpcM7hRX5sDNhQM8RLIVJoZZt90zy8=;
        b=ebOk+kJkYJIssTTWdEKujX3deCH5CmQT3wAQ/xJMUc548RblciR3HOGs5prGCSDr9E
         0ZjS4aeZY193/Mj/WrtsX/CYqdO76LdZmK40jKtb4zMakodon23+OdAlyCKHH7VUJVGI
         fbje1ISkh9YNRgWK8CSMvGXJYOribjXFzzIyjxH2JDQo297oLUdrAtzAlX+JCJL6DLbY
         52fmgxXTnrt9cyPoMAZ5MzrvkPCABSk8AHD/dewyFk7BS/RIH55XmfQj4HYraicdUTZa
         e3dWW+OvdehjUT5vcjA+Fyv48z9i5DM/cwqnxRlnM3PLU0gb5GmSueuzhwYX3GdBs2/Q
         djWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018019; x=1781622819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BKAHZBj8Q4+vRNpcM7hRX5sDNhQM8RLIVJoZZt90zy8=;
        b=Mg0AUiHLxvdiQym6QhENRWGn2rNJ/0MTWSnDgt0Qxxu0eGvX8cTZb8p5iHlOndSy+x
         q/GYoyEIk6F59mPiMwkzDiNAMrO02LOc4zAOZZL2kAjfsQXWJcWt07965qvvmDpqY5J4
         eK1mSqqzbLjcVnJDa0OtvgYVJNzFMVbdNiJpx+DZeDfikWhiTXz6ijyJd/+37J+ujEIW
         D+Eitv8OS8YNiF1yhivcdjV6btwLcon2zb4s838CLUQZxP+LBoCCekXKPToFGAL8Y5Cy
         3ZurPDFZigjsNFmB9sCPrfhcglHF0+QMylT5fBherIGvZKKTMKbVcbzjKiTQSLj3TIAf
         5+jg==
X-Forwarded-Encrypted: i=1; AFNElJ8kZZv/MsucrQlVss6EHLJoGVHvOSe1AW1PTgYdQ0Z+qb1SyQPzzvAfbdUTVIl5IRKj/rludys58Zjiesql8w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3AQdShFkO/1LLpR9SJQc0a0md5AEFMUxLJx2e555BgNt/Jj8f
	RbRT1r6Sabh4OtL4JwldbHy8KnT+ScoYyEZyyMJz9mWOYHTB3qweO8Ff
X-Gm-Gg: Acq92OGYnScdnaR4m1dBbrgAjOvz6p9wmBbgSZzLgOnK/zbwJ/A7qJvbJGzA1SJgNZm
	1HOL0fq9zTRH/sNswVz9Z2CbWRACe/QXO/EZB+yGdwzoIyLFyG/RGROcQnqkhLBEp0o7DWOSMLT
	Btay9fbq04m7ez5r8sppiFXUs/6ATCxVTVJPWcAHtgnKO2xS0atBhwhlfg9ajEqpiE8Q0/89rvX
	YYF72prML6dfg5SaHLCb9SX3AZNdSujDaqUMTFzsF5CEaFWnIHsBycf3Vb0JfZrdVESR36eHXSv
	HVqvxuiNO45fNulfTbX4RJB4kT/zBobZBpHzjM1+hwRd1scL806vhzS1hrquBeZnS5F6yX4NBQR
	KNFvIMeAy5EBn7Bwafe8GG2E7YZUMzrXWZGIjRlaUvbxqGHysRYN/0kwEgqGfvQqQaQEEfw76YB
	fgB62Z2QOhhBCE93Q9trLhr1ragE76zyXV
X-Received: by 2002:a17:907:7289:b0:bf3:230c:4c64 with SMTP id a640c23a62f3a-bf371f52a44mr1059828766b.16.1781018018452;
        Tue, 09 Jun 2026 08:13:38 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 12/12] net: airoha: add phylink support
Date: Tue,  9 Jun 2026 17:12:08 +0200
Message-ID: <20260609151212.29469-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_161340_354854_3EE94538 
X-CRM114-Status: GOOD (  24.18  )
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

Add phylink support for each GDM port. For GDM1 add the internal interface
mode as the only supported mode. For GDM2/3/4 add the required
configuration of the PCS to make the external PHY or attached SFP cage
work.

These needs to be defined in the GDM port node using the pcs-handle
property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/Kconfig       |   1 +
 drivers/net/ethernet/airoha/airoha_eth.c  | 167 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 4 files changed, 181 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
index ad3ce501e7a5..38dcc76e5998 100644
--- a/drivers/net/ethernet/airoha/Kconfig
+++ b/drivers/net/ethernet/airoha/Kconfig
@@ -20,6 +20,7 @@ config NET_AIROHA
 	depends on NET_DSA || !NET_DSA
 	select NET_AIROHA_NPU
 	select PAGE_POOL
+	select PHYLINK
 	help
 	  This driver supports the gigabit ethernet MACs in the
 	  Airoha SoC family.
diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5a8e84fa9918..eabd7b058f82 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -8,6 +8,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
+#include <linux/pcs/pcs.h>
 #include <linux/u64_stats_sync.h>
 #include <net/dst_metadata.h>
 #include <net/page_pool/helpers.h>
@@ -1779,6 +1780,15 @@ static int airoha_dev_open(struct net_device *netdev)
 	u32 cur_len, pse_port = FE_PSE_PORT_PPE1;
 	struct airoha_qdma *qdma = dev->qdma;
 
+	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
+	if (err) {
+		netdev_err(netdev, "%s: could not attach PHY: %d\n", __func__,
+			   err);
+		return err;
+	}
+
+	phylink_start(dev->phylink);
+
 	netif_tx_start_all_queues(netdev);
 	err = airoha_set_vip_for_gdm_port(dev, true);
 	if (err)
@@ -1876,6 +1886,9 @@ static int airoha_dev_stop(struct net_device *netdev)
 		}
 	}
 
+	phylink_stop(dev->phylink);
+	phylink_disconnect_phy(dev->phylink);
+
 	return 0;
 }
 
@@ -3148,6 +3161,153 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
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
+	u32 mask, val;
+
+	/* TX/RX frag is configured only for GDM4 */
+	if (port->id != 4)
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
+	}
+
+	/* Configure TX/RX frag based on speed */
+	if (dev->nbq == 1) {
+		mask = GDMA4_SGMII1_TX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDMA4_SGMII1_TX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	}  else {
+		mask = GDMA4_SGMII0_TX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	}
+	airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG, mask, val);
+
+	if (dev->nbq == 1) {
+		mask = GDMA4_SGMII1_RX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDMA4_SGMII1_RX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	} else {
+		mask = GDMA4_SGMII0_RX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	}
+	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG, mask, val);
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
+				     unsigned int num_available_pcs)
+{
+	struct device *dev = config->dev;
+
+	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+					&num_available_pcs);
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
+
+	config->dev = &netdev->dev;
+	config->type = PHYLINK_NETDEV;
+	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |  MAC_10000FD;
+	if (port->id > AIROHA_GDM1_IDX)
+		config->mac_capabilities |= MAC_10 | MAC_100 | MAC_1000 |
+					    MAC_2500FD | MAC_5000FD;
+
+	err = fwnode_phylink_pcs_parse(dev_fwnode(&netdev->dev), NULL,
+				       &config->num_available_pcs);
+	if (err)
+		return err;
+
+	config->fill_available_pcs = airoha_fill_available_pcs;
+
+	/*
+	 * GDM1 only supports internal for Embedded Switch
+	 * and doesn't require a PCS.
+	 */
+	if (port->id == AIROHA_GDM1_IDX) {
+		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+			  config->supported_interfaces);
+	} else {
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
@@ -3210,7 +3370,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 	dev->nbq = nbq;
 	port->devs[index] = dev;
 
-	return 0;
+	return airoha_setup_phylink(netdev);
 }
 
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
@@ -3435,8 +3595,10 @@ static int airoha_probe(struct platform_device *pdev)
 				continue;
 
 			netdev = netdev_from_priv(dev);
-			if (netdev->reg_state == NETREG_REGISTERED)
+			if (netdev->reg_state == NETREG_REGISTERED) {
+				phylink_destroy(dev->phylink);
 				unregister_netdev(netdev);
+			}
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
@@ -3472,6 +3634,7 @@ static void airoha_remove(struct platform_device *pdev)
 				continue;
 
 			netdev = netdev_from_priv(dev);
+			phylink_destroy(dev->phylink);
 			unregister_netdev(netdev);
 			of_node_put(netdev->dev.of_node);
 		}
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 8f42973f9cf5..1b25603dc64d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -554,6 +554,9 @@ struct airoha_gdm_dev {
 
 	u32 flags;
 	int nbq;
+
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
 };
 
 struct airoha_gdm_port {
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 436f3c8779c1..27f2583e143a 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -358,6 +358,18 @@
 #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
 #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
 
+#define REG_GDMA4_TMBI_FRAG		0x2028
+#define GDMA4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDMA4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDMA4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDMA4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
+#define REG_GDMA4_RMBI_FRAG		0x202c
+#define GDMA4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDMA4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDMA4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDMA4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
 #define REG_MC_VLAN_EN			0x2100
 #define MC_VLAN_EN_MASK			BIT(0)
 
-- 
2.53.0


