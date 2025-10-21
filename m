Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8F7CCD1A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Oct 2025 19:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39TYCjslUWZvszjsRXmpGak+arWZ5M/6BDn3chbsEM8=; b=r7U9s9mP4nF8b9ZO964QC84KuY
	2QD9HiKNsGRZmKVQGT4WG5/BvheL3Y8cQ/aJWHfE1cBb0zlnuSse3LPxaN+ylqm8Dl20ki8HTtfrs
	cgmixY7w1oqKfDJySsH7d6rwckYW4BrH5idkWnw3bpBgzrSuqsdytRjkmHFH6IGbBMwNDwZAszSMj
	BJpZyJtovjDeH+dekoP+Rj0R1iuBJJKervlexo2mAqUwPRoSVcD0V87pAYk20Yq7KfyWOy3A0scWJ
	MvVKcS9fsYscI95Nopa76T4ZTjSJ6flr4AlITBeea2muK2Oc3h6MXfpTbDPAFcqJsVWkwcMCF7EOb
	ZZSzCGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI70-00000000V3X-2nVk;
	Tue, 21 Oct 2025 19:33:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI6s-00000000Uyz-2V5G
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Oct 2025 19:33:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso2751375f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Oct 2025 12:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761075209; x=1761680009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39TYCjslUWZvszjsRXmpGak+arWZ5M/6BDn3chbsEM8=;
        b=bFF7JACdutmVVb3AqJuj86yGdZIcEf7frE04Cd3vepgJ0tOWAWWPuMYOX28nS79joh
         bnHWEb2vnuNU0x0WECSXvwl2S7HPxlanUsskmLQDhWXymAm5ssuYVQOy2l9iGnUSl+lG
         evOHZHd/ccA+JI0j5huzQa7+EdqlvVrkWfk5B+jba8hSGGRvvorBjHUmqB5J7ep6Yp7M
         iJqI7gIyE+9VRawGJYPTNAEqfu/tXEfzivFKS48/bdOR/s5QGaDP6Lw/DVJiziSgg4/d
         NVyo45fbc4548vZmcF25QwVGVzz+bIEvPoAyc05I7E7rqERGM90Qrk1XRzycqiUVMS0M
         1lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761075209; x=1761680009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39TYCjslUWZvszjsRXmpGak+arWZ5M/6BDn3chbsEM8=;
        b=E/Vb92Yyma5v8YgcnsvL7x1t/Z8TCU4E6EVHZSLE3N9x9kXhzesMgrgqZFLPd30QAC
         QcCnr72ekB9ArRaRrgR6sDzY8mMOfWNRashxhEJseR9bn/kTzUgdCKNCTJnlbKcU3JHS
         tmtqVpbCQ8lK9LV9LoxHbwHFVcUjjfwffMJtkzcxaeZaGzFLtgba0w3SLj+Ag/9DD33g
         AISngvaTH42i9/+7c+17VeRdHfHZ7U8lWRwiYvm4wUZvPubTKHEapdn+0Jc0svzcLSOz
         Uyujz/canH63g2bUszX5JPoQqJbMjTPlYqAmCVLsC6HxAReFb18VhuxBJF0NzR20gacw
         CIAg==
X-Forwarded-Encrypted: i=1; AJvYcCVcI7AcxNUbySoXfLeKytskBGjNtKkz7IxLGUMvwXTFdudU46z+yHBKGpPML/eXQWryUvjceMUiN/G5ma5N7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdwhvFub1/L5jJn+GdAXJDFLi8rovvwJzRkD/RPKquKXXdr6zI
	xzC3DOgIAZV3ntgig46LMgVwOHVF2e2bIqWGt+Tz/dmOSOa0pi1M8tvq
X-Gm-Gg: ASbGncvdgPUrUSG6OrMtWSERNcX8FroDKa5hd7gx4TyFLs/bsLpC19MHuiqVkn5QGOg
	CeQMboAlLnh2gpNGRji0p/dBp0yz2PxQLmgWr2sBOuQpvRwBTR90Z9SMDaDxUEdbbLua5UGv0ct
	mXKgrlBLd9DPudcGC311KVNbF1m4ZwSVhwdTBbmu3qGB6zrTD+u9SDsZ4nWb4RCmQ5uw8/AK4li
	xDZzwId18mgqh4R17sDPemz8orM2sTBKQ2s0JigVZB47R1IRyN8ILDNX3y+7GxIJ3QRUBm6/zQa
	TXxSLMwtgnTEr89lIeTIPCYhDTJidIny6apCCZo8a5mHIsm8DxtE3xZHCyggg3mqcl/Axr7TR98
	k6M+nccX9w2vucfTMXr+aI1mE+dBxedhrZpIX0wsJce37eLN2EiNJZZCwcYYldYTesT3veMEGtc
	mJ9rWt5aXMdoZ7+ZWp9HD+crRnyJBOzBX+XPNzrgGnSow=
X-Google-Smtp-Source: AGHT+IElUppWel9b0RVHM4zvWcmJ3xHtW8J1ioZFPpIwENi2ahFIOIMw6b/9n0+AeyKKg/4kFhaXWQ==
X-Received: by 2002:a05:6000:144a:b0:427:e1bf:13bd with SMTP id ffacd0b85a97d-427e1bf1a74mr9524872f8f.52.1761075208724;
        Tue, 21 Oct 2025 12:33:28 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm21327187f8f.36.2025.10.21.12.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:33:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 2/2] net: airoha: add phylink support for GDM1
Date: Tue, 21 Oct 2025 21:33:12 +0200
Message-ID: <20251021193315.2192359-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021193315.2192359-1-ansuelsmth@gmail.com>
References: <20251021193315.2192359-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_123330_761768_1DC7AF74 
X-CRM114-Status: GOOD (  20.50  )
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

In preparation for support of GDM2+ port, fill in phylink OPs for GDM1
that is an INTERNAL port for the Embedded Switch.

Rework the GDM init logic by first preparing the struct with all the
required info and creating the phylink interface and only after the
parsing register the related netdev.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 108 ++++++++++++++++++++---
 drivers/net/ethernet/airoha/airoha_eth.h |   3 +
 2 files changed, 99 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index ce6d13b10e27..fc237775a998 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1613,6 +1613,8 @@ static int airoha_dev_open(struct net_device *dev)
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_qdma *qdma = port->qdma;
 
+	phylink_start(port->phylink);
+
 	netif_tx_start_all_queues(dev);
 	err = airoha_set_vip_for_gdm_port(port, true);
 	if (err)
@@ -1665,6 +1667,8 @@ static int airoha_dev_stop(struct net_device *dev)
 		}
 	}
 
+	phylink_stop(port->phylink);
+
 	return 0;
 }
 
@@ -2813,6 +2817,17 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_link		= ethtool_op_get_link,
 };
 
+static struct phylink_pcs *airoha_phylink_mac_select_pcs(struct phylink_config *config,
+							 phy_interface_t interface)
+{
+	return NULL;
+}
+
+static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
+			      const struct phylink_link_state *state)
+{
+}
+
 static int airoha_metadata_dst_alloc(struct airoha_gdm_port *port)
 {
 	int i;
@@ -2857,6 +2872,55 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 	return false;
 }
 
+static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex, bool tx_pause, bool rx_pause)
+{
+}
+
+static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
+				 phy_interface_t interface)
+{
+}
+
+static const struct phylink_mac_ops airoha_phylink_ops = {
+	.mac_select_pcs = airoha_phylink_mac_select_pcs,
+	.mac_config = airoha_mac_config,
+	.mac_link_up = airoha_mac_link_up,
+	.mac_link_down = airoha_mac_link_down,
+};
+
+static int airoha_setup_phylink(struct net_device *netdev)
+{
+	struct airoha_gdm_port *port = netdev_priv(netdev);
+	struct device *dev = &netdev->dev;
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
+
+	phy_mode = device_get_phy_mode(dev);
+	if (phy_mode < 0) {
+		dev_err(dev, "incorrect phy-mode\n");
+		return phy_mode;
+	}
+
+	port->phylink_config.dev = dev;
+	port->phylink_config.type = PHYLINK_NETDEV;
+	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+						MAC_10000FD;
+
+	__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+		  port->phylink_config.supported_interfaces);
+
+	phylink = phylink_create(&port->phylink_config, dev_fwnode(dev),
+				 phy_mode, &airoha_phylink_ops);
+	if (IS_ERR(phylink))
+		return PTR_ERR(phylink);
+
+	port->phylink = phylink;
+
+	return 0;
+}
+
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 				 struct device_node *np, int index)
 {
@@ -2931,19 +2995,30 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	port->id = id;
 	eth->ports[p] = port;
 
-	err = airoha_metadata_dst_alloc(port);
-	if (err)
-		return err;
+	return airoha_metadata_dst_alloc(port);
+}
 
-	err = register_netdev(dev);
-	if (err)
-		goto free_metadata_dst;
+static int airoha_register_gdm_ports(struct airoha_eth *eth)
+{
+	int i;
 
-	return 0;
+	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
+		struct airoha_gdm_port *port = eth->ports[i];
+		int err;
 
-free_metadata_dst:
-	airoha_metadata_dst_free(port);
-	return err;
+		if (!port)
+			continue;
+
+		err = airoha_setup_phylink(port->dev);
+		if (err)
+			return err;
+
+		err = register_netdev(port->dev);
+		if (err)
+			return err;
+	}
+
+	return 0;
 }
 
 static int airoha_probe(struct platform_device *pdev)
@@ -3034,6 +3109,10 @@ static int airoha_probe(struct platform_device *pdev)
 		}
 	}
 
+	err = airoha_register_gdm_ports(eth);
+	if (err)
+		goto error_napi_stop;
+
 	return 0;
 
 error_napi_stop:
@@ -3047,10 +3126,14 @@ static int airoha_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
 
-		if (port && port->dev->reg_state == NETREG_REGISTERED) {
+		if (!port)
+			continue;
+
+		if (port->dev->reg_state == NETREG_REGISTERED) {
 			unregister_netdev(port->dev);
-			airoha_metadata_dst_free(port);
+			phylink_destroy(port->phylink);
 		}
+		airoha_metadata_dst_free(port);
 	}
 	free_netdev(eth->napi_dev);
 	platform_set_drvdata(pdev, NULL);
@@ -3076,6 +3159,7 @@ static void airoha_remove(struct platform_device *pdev)
 
 		airoha_dev_stop(port->dev);
 		unregister_netdev(port->dev);
+		phylink_destroy(port->phylink);
 		airoha_metadata_dst_free(port);
 	}
 	free_netdev(eth->napi_dev);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index eb27a4ff5198..c144c1ece23b 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -531,6 +531,9 @@ struct airoha_gdm_port {
 	struct net_device *dev;
 	int id;
 
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
+
 	struct airoha_hw_stats stats;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
-- 
2.51.0


