Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51202C07CA9
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Nov 2023 01:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOK9PAOl19fPFmgimOsyHNB983ByM9cI1PYSUQPStAQ=; b=dPE0hmNXBdXnE3G5TvonUuE4DW
	Yo1ytW+TsvaJNWXKKm1lhw5b3PiCp7Mc5vpla0zDZlMaBCcY57Dju3QVaZvEwUlk5jcLPkE1roWbK
	8QjWSYkXI6BZEYGQChCZMcj/PBhCrx8nQMJEShA4KMRyyaxuW8iOzUo9Bf/PrM1JTESF4jeRqSxlZ
	JLIkzYWxuRNL1+7FqEcouq4+62f/vSgnG7HcUIk1uYH1VwjiFSccGmBO9RsdfhpFvxymxDtCjg3RI
	9A131+xEb5w4dJyamNMFxen4NOi3Z1Qe8MMD3nzM6Tx/Q0Zf+3s4sqV+XKf1+SFN4FpCy5RV0YpN6
	pcNV8eNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r74LZ-00A4gD-0P;
	Sun, 26 Nov 2023 01:54:09 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r74LN-00A4ZG-1I;
	Sun, 26 Nov 2023 01:53:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40b2ad4953cso22873115e9.0;
        Sat, 25 Nov 2023 17:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963635; x=1701568435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOK9PAOl19fPFmgimOsyHNB983ByM9cI1PYSUQPStAQ=;
        b=RN52sa4BeTgS6jN/KaFRieJe/Fj2eh5OWU8ow12bEzNVCPlHuXEKSfKBwoltGMU8f2
         KPZISFNoyYQDZ2aOrqvS0jRzURh6b6LaeeQFuHt6Fe/HGh/FFNHlc6RrAIBByXaOf48t
         GtL5sQ/WrdZ5Gnr6wCd5985+nKw0P0D+nQ2HynofYL+avIuTbkVyjMv7VU/WP6RCoQ1K
         77kn9yWJU6NOEFEspDUi1vJLe4AH5QxIZX59sNqVjAXoLJ7N4VybUq90CKuZZQKdgzgW
         IO9FdR77cRZs+4C96DME2HvXD/2BV8JTAZi5txJjACpwdlaHFUf9vH5Pj+QkrSR2uJbl
         HTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963635; x=1701568435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOK9PAOl19fPFmgimOsyHNB983ByM9cI1PYSUQPStAQ=;
        b=DBT6sMEo1FJZV3KCzFKjhy4aNFvVYzkmJoRh8gQW01hZRWVNsCds4L2i6mpIis7WPM
         HzVqVSAWh4kwyKCQOE21B16zlA1t101SwH5EL23SU19T2N6XTxybTtQPUKMF6R7jRn1p
         q4F/x9B+KfAYtZveBRKjDxgP4xbNoZimEb4vJXXgO/q2D+6TRKZUbQj+OtGr82s88bVz
         Mfh05/SjliWcT/UVI4kIlkYWOi91rN1IkSiKg+6tO7Ta5ASLMsz7yr4llIVccfXB319s
         jrV4DE2Rq3KfbcDZ8QT4N5Q/P45oIaUdKeTih06MkRVwlhU8PUIxFK635cyne16G14pp
         Ypsw==
X-Gm-Message-State: AOJu0Yy2/uUWEfsOzNlP3PhcCGOKF0D/Gfzsp9/G8QMUvzTwACmNgauF
	EHvi+tLs8mJhGU5WNG+Agkc=
X-Google-Smtp-Source: AGHT+IG33CN2KwdqsLUMmsJRpojWbtR5CerjAlfyOT09LzeNoBrgNS94y/QS4NSpp0nmzyGoWCIkDA==
X-Received: by 2002:a05:600c:348f:b0:401:b92f:eec5 with SMTP id a15-20020a05600c348f00b00401b92feec5mr9238078wmq.9.1700963635593;
        Sat, 25 Nov 2023 17:53:55 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:53:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH RFC v3 2/8] net: phy: add initial support for PHY package in DT
Date: Sun, 26 Nov 2023 02:53:40 +0100
Message-Id: <20231126015346.25208-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_175357_438566_956543A6 
X-CRM114-Status: GOOD (  28.49  )
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

Add initial support for PHY package in DT.

Make it easier to define PHY package and describe the global PHY
directly in DT by refereincing them by phandles instead of custom
functions in each PHY driver.

Each PHY in a package needs to be defined in a dedicated node in the
mdio node. This dedicated node needs to have the node name with the
prefix "ethernet-phy-package" and compatible set to
"ethernet-phy-package".

With this defined, the generic PHY probe will join each PHY in this
dedicated node to the package.

PHY package will be joined based on the reg defined in the
ethernet-phy-package node.

mdio_bus.c and of_mdio.c is updated to now support and parse also
PHY package subnote by checking if the node compatible is
"ethernet-phy-package".

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/of_mdio.c   | 68 +++++++++++++++++++++++++-----------
 drivers/net/phy/mdio_bus.c   | 35 ++++++++++++++-----
 drivers/net/phy/phy_device.c | 35 +++++++++++++++++++
 include/linux/phy.h          |  3 ++
 4 files changed, 112 insertions(+), 29 deletions(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index 64ebcb6d235c..c98e9f7fa3d4 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -139,6 +139,47 @@ bool of_mdiobus_child_is_phy(struct device_node *child)
 }
 EXPORT_SYMBOL(of_mdiobus_child_is_phy);
 
+static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
+				   bool *scanphys)
+{
+	struct device_node *child;
+	int addr, rc = 0;
+
+	/* Loop over the child nodes and register a phy_device for each phy */
+	for_each_available_child_of_node(np, child) {
+		if (of_device_is_compatible(child, "ethernet-phy-package")) {
+			rc = __of_mdiobus_parse_phys(mdio, child, scanphys);
+			if (rc && rc != -ENODEV)
+				goto exit;
+
+			continue;
+		}
+
+		addr = of_mdio_parse_addr(&mdio->dev, child);
+		if (addr < 0) {
+			*scanphys = true;
+			continue;
+		}
+
+		if (of_mdiobus_child_is_phy(child))
+			rc = of_mdiobus_register_phy(mdio, child, addr);
+		else
+			rc = of_mdiobus_register_device(mdio, child, addr);
+
+		if (rc == -ENODEV)
+			dev_err(&mdio->dev,
+				"MDIO device at address %d is missing.\n",
+				addr);
+		else if (rc)
+			goto exit;
+	}
+
+	return 0;
+exit:
+	of_node_put(child);
+	return rc;
+}
+
 /**
  * __of_mdiobus_register - Register mii_bus and create PHYs from the device tree
  * @mdio: pointer to mii_bus structure
@@ -180,25 +221,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		return rc;
 
 	/* Loop over the child nodes and register a phy_device for each phy */
-	for_each_available_child_of_node(np, child) {
-		addr = of_mdio_parse_addr(&mdio->dev, child);
-		if (addr < 0) {
-			scanphys = true;
-			continue;
-		}
-
-		if (of_mdiobus_child_is_phy(child))
-			rc = of_mdiobus_register_phy(mdio, child, addr);
-		else
-			rc = of_mdiobus_register_device(mdio, child, addr);
-
-		if (rc == -ENODEV)
-			dev_err(&mdio->dev,
-				"MDIO device at address %d is missing.\n",
-				addr);
-		else if (rc)
-			goto unregister;
-	}
+	rc = __of_mdiobus_parse_phys(mdio, np, &scanphys);
+	if (rc)
+		goto unregister;
 
 	if (!scanphys)
 		return 0;
@@ -227,15 +252,16 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 				if (!rc)
 					break;
 				if (rc != -ENODEV)
-					goto unregister;
+					goto put_unregister;
 			}
 		}
 	}
 
 	return 0;
 
-unregister:
+put_unregister:
 	of_node_put(child);
+unregister:
 	mdiobus_unregister(mdio);
 	return rc;
 }
diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 25dcaa49ab8b..05f2e8e01a03 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -455,19 +455,25 @@ EXPORT_SYMBOL(of_mdio_find_bus);
  * found, set the of_node pointer for the mdio device. This allows
  * auto-probed phy devices to be supplied with information passed in
  * via DT.
+ * If a PHY package is found, PHY is searched also there.
  */
-static void of_mdiobus_link_mdiodev(struct mii_bus *bus,
-				    struct mdio_device *mdiodev)
+static int of_mdiobus_find_phy(struct device *dev, struct mdio_device *mdiodev,
+			       struct device_node *np)
 {
-	struct device *dev = &mdiodev->dev;
 	struct device_node *child;
 
-	if (dev->of_node || !bus->dev.of_node)
-		return;
-
-	for_each_available_child_of_node(bus->dev.of_node, child) {
+	for_each_available_child_of_node(np, child) {
 		int addr;
 
+		if (of_device_is_compatible(child, "ethernet-phy-package")) {
+			if (!of_mdiobus_find_phy(dev, mdiodev, child)) {
+				of_node_put(child);
+				return 0;
+			}
+
+			continue;
+		}
+
 		addr = of_mdio_parse_addr(dev, child);
 		if (addr < 0)
 			continue;
@@ -477,9 +483,22 @@ static void of_mdiobus_link_mdiodev(struct mii_bus *bus,
 			/* The refcount on "child" is passed to the mdio
 			 * device. Do _not_ use of_node_put(child) here.
 			 */
-			return;
+			return 0;
 		}
 	}
+
+	return -ENODEV;
+}
+
+static void of_mdiobus_link_mdiodev(struct mii_bus *bus,
+				    struct mdio_device *mdiodev)
+{
+	struct device *dev = &mdiodev->dev;
+
+	if (dev->of_node || !bus->dev.of_node)
+		return;
+
+	of_mdiobus_find_phy(dev, mdiodev, bus->dev.of_node);
 }
 #else /* !IS_ENABLED(CONFIG_OF_MDIO) */
 static inline void of_mdiobus_link_mdiodev(struct mii_bus *mdio,
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 823b25bb3e3e..f416f7434697 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3174,6 +3174,36 @@ static int of_phy_leds(struct phy_device *phydev)
 	return 0;
 }
 
+static int of_phy_package(struct phy_device *phydev)
+{
+	struct device_node *node = phydev->mdio.dev.of_node;
+	struct device_node *package_node;
+	u32 base_addr;
+	int ret;
+
+	if (!node)
+		return 0;
+
+	package_node = of_get_parent(node);
+	if (!package_node)
+		return 0;
+
+	if (!of_device_is_compatible(package_node, "ethernet-phy-package"))
+		return 0;
+
+	if (of_property_read_u32(package_node, "reg", &base_addr))
+		return -EINVAL;
+
+	ret = devm_phy_package_join(&phydev->mdio.dev, phydev,
+				    base_addr, 0);
+	if (ret)
+		return ret;
+
+	phydev->shared->np = package_node;
+
+	return ret;
+}
+
 /**
  * fwnode_mdio_find_device - Given a fwnode, find the mdio_device
  * @fwnode: pointer to the mdio_device's fwnode
@@ -3282,6 +3312,11 @@ static int phy_probe(struct device *dev)
 	if (phydrv->flags & PHY_IS_INTERNAL)
 		phydev->is_internal = true;
 
+	/* Parse DT to detect PHY package and join them */
+	err = of_phy_package(phydev);
+	if (err)
+		goto out;
+
 	/* Deassert the reset signal */
 	phy_device_reset(phydev, 0);
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 342f750e8a30..80a4adaeb817 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -329,6 +329,7 @@ struct mdio_bus_stats {
  * struct phy_package_shared - Shared information in PHY packages
  * @base_addr: Base PHY address of PHY package used to combine PHYs
  *   in one package and for offset calculation of phy_package_read/write
+ * @np: Pointer to the Device Node if PHY package defined in DT
  * @refcnt: Number of PHYs connected to this shared data
  * @flags: Initialization of PHY package
  * @priv_size: Size of the shared private data @priv
@@ -340,6 +341,8 @@ struct mdio_bus_stats {
  */
 struct phy_package_shared {
 	int base_addr;
+	/* With PHY package defined in DT this points to the PHY package node */
+	struct device_node *np;
 	refcount_t refcnt;
 	unsigned long flags;
 	size_t priv_size;
-- 
2.40.1


