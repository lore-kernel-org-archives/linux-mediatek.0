Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2665C61DF4
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 00:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQgR2jfnMMv7W0Th4DaHjvErxX4R3n2xwaVlAKSCuVc=; b=4683YlaTzOxEXneyjYPgYP89Y/
	O09j/P4vbPMvF/isa9bEtwyLFZngNLoSUf7qMxCcI444BO9EDwO6TmGHiUWs4aXrph8AapVAbQsMg
	oirg/Id0fDqgGV+LFTGvaiGIolMO9E/kL/Irhz32LljDUv3I7ejuqXYmjvbw72QJ0Ntgik9eTNnbi
	DRV96nF0WDH8/2cfF/DUryjUWi8AUQ338d9htLP54vq8I7TnEPCFzXdiLeXn7J0VahqCfViUsB6jo
	qAPRETck1x3QLGVe9h4oW9+fiyFB4OsAScFdT8zHu09B2cVdhSzXhW4I4+n8S/VuW65sNJCknm4SX
	u+mKiDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6geO-008FY5-0q;
	Sat, 25 Nov 2023 00:36:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6gds-008FAz-08;
	Sat, 25 Nov 2023 00:35:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40b3e7f2fd9so2637875e9.0;
        Fri, 24 Nov 2023 16:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872522; x=1701477322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQgR2jfnMMv7W0Th4DaHjvErxX4R3n2xwaVlAKSCuVc=;
        b=VpmZ0Hl9+ewSpn4DR4BTbPSVq9PjElLZvvNxn7+SBxHYrpD7JMcHl2eAfgATtQgghf
         IKYuXENh9goQTYw9GP8wnR231zMRypcje5ejEk6JR5efmWEau+gZTKLjzyCHLCT86hJm
         Bfc+QQ23O31wBfVBt3HTQPV9pd6DLZBZyyxsAGBXQTgL3gsSHt1eA7dh6P6ewl0Ow0Dm
         Kg3CDpagAD/wTJzt2I1cqeTKGELW0sAX6+0t50pqFtwamCh1ltkXiDSe0wZlg5cKc72L
         YhLQdICPj7VWU/oP3qQQY45pHUQE2wbN7Afbgr4qIC5pVob2C8MWIYa0SlJ+uDYoWOOr
         JOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872522; x=1701477322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQgR2jfnMMv7W0Th4DaHjvErxX4R3n2xwaVlAKSCuVc=;
        b=Dip4dbkiEEYR6sfYSekJvJHDV+gKW5TbmECf60bBSP7TejR4R/cQ+F0WaejgXyqOOO
         Do2OFiwpq69lSUUUbhS+AWsTpYv3BySpEhsK1YWW3PjSVg4VdTc9/HNwh+TeYeZVtgfG
         4mf1jmEkqd3Gzw6/NycXRcaZUjcuMTL8tvweA9CxpCShT3Pnn7pYLugiAvFZx5Up/o+I
         vmjPaus/M9jOWQ27FQ3pC3FccQzGIybgy01NlTkfB3JP79xQi1v/OmNRAWrDPur28dT5
         KmxLeG/VzyRP3cmNnx2lpUxE7ynlDBTP5/ATrEe+/kOnNsD+ZxNmG03ShRWjs53D7JVM
         4b/g==
X-Gm-Message-State: AOJu0YxdE0yX8pnn5RMO8eJLagxMZWTDrbvm/BYKn7YUSy9WI1jikYX/
	HqmAALbA2sUXTzB1l5lrpVU=
X-Google-Smtp-Source: AGHT+IH3Zuh20XPlulV/zgygp478aT9a7n7dkKQ/OgX1HZ9p0rkGGUQdnV7P6HuGLrzXJMq+ZhH6EA==
X-Received: by 2002:a05:600c:1ca5:b0:40b:3e7e:af56 with SMTP id k37-20020a05600c1ca500b0040b3e7eaf56mr901531wms.26.1700872521507;
        Fri, 24 Nov 2023 16:35:21 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:21 -0800 (PST)
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
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH v2 03/11] net: phy: add initial support for PHY package in DT
Date: Sat, 25 Nov 2023 01:11:19 +0100
Message-Id: <20231125001127.5674-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_163528_082530_3EB3DE5E 
X-CRM114-Status: GOOD (  32.39  )
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
prefix "ethernet-phy-package".

With this defined, the generic PHY probe will join each PHY in this
dedicated node to the package.

PHY driver MUST set the required global PHY count in
.phy_package_global_phy_num and define .phy_package_global_phys_offset
as the table of offset of the required global PHYs for PHY package
global configuration.

mdio_bus.c and of_mdio.c is updated to now support and parse also
PHY package subnote by checking if the node name have the prefix
"ethernet-phy-package".

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/of_mdio.c   | 68 +++++++++++++++++++++++++-----------
 drivers/net/phy/mdio_bus.c   | 35 ++++++++++++++-----
 drivers/net/phy/phy_device.c | 61 ++++++++++++++++++++++++++++++++
 include/linux/phy.h          |  9 +++++
 4 files changed, 144 insertions(+), 29 deletions(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index 64ebcb6d235c..de2ebb59d2d2 100644
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
+		if (of_node_name_prefix(child, "ethernet-phy-package")) {
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
index 25dcaa49ab8b..5ba43d593c6b 100644
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
 
+		if (of_node_name_prefix(child, "ethernet-phy-package")) {
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
index e016dbfb0d27..f25bedb69b90 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3193,6 +3193,62 @@ static int of_phy_leds(struct phy_device *phydev)
 	return 0;
 }
 
+static int of_phy_package(struct phy_device *phydev)
+{
+	struct device_node *node = phydev->mdio.dev.of_node;
+	struct device_node *package_node;
+	const u8 *global_phys_offset;
+	int *global_phys_addr;
+	u8 global_phys_num;
+	u32 base_addr;
+	int i, ret;
+
+	if (!node)
+		return 0;
+
+	package_node = of_get_parent(node);
+	if (!package_node)
+		return 0;
+
+	if (!of_node_name_prefix(package_node, "ethernet-phy-package"))
+		return 0;
+
+	if (of_property_read_u32(package_node, "reg", &base_addr))
+		return -EINVAL;
+
+	global_phys_num = phydev->drv->phy_package_global_phys_num;
+	global_phys_offset = phydev->drv->phy_package_global_phys_offset;
+	if (!global_phys_num || !global_phys_offset)
+		return -EINVAL;
+
+	global_phys_addr = kmalloc_array(global_phys_num, sizeof(*global_phys_addr),
+					 GFP_KERNEL);
+	if (!global_phys_addr)
+		return -ENOMEM;
+
+	for (i = 0; i < global_phys_num; i++) {
+		int addr = base_addr + global_phys_offset[i];
+
+		/* Make sure the calculated address is valid */
+		if (unlikely(addr >= PHY_MAX_ADDR))
+			return -EINVAL;
+
+		global_phys_addr[i] = addr;
+	}
+
+	ret = devm_phy_package_join(&phydev->mdio.dev, phydev, global_phys_addr,
+				    global_phys_num, 0);
+	if (ret)
+		goto exit;
+
+	phydev->shared->np = package_node;
+
+exit:
+	kfree(global_phys_addr);
+
+	return ret;
+}
+
 /**
  * fwnode_mdio_find_device - Given a fwnode, find the mdio_device
  * @fwnode: pointer to the mdio_device's fwnode
@@ -3301,6 +3357,11 @@ static int phy_probe(struct device *dev)
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
index c2bb3f0b9dda..3f75ae85b740 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -327,6 +327,7 @@ struct mdio_bus_stats {
 
 /**
  * struct phy_package_shared - Shared information in PHY packages
+ * @np: Pointer to the Device Node if PHY package defined in DT
  * @addrs: List of common PHY addresses used to combine PHYs in one package
  * @addrs_num: Number of common PHY addresses in addrs list
  * @refcnt: Number of PHYs connected to this shared data
@@ -339,6 +340,8 @@ struct mdio_bus_stats {
  * phy_package_leave().
  */
 struct phy_package_shared {
+	/* With PHY package defined in DT this points to the PHY package node */
+	struct device_node *np;
 	/* addrs list pointer */
 	/* note that this pointer is shared between different phydevs.
 	 * It is allocated and freed automatically by phy_package_join() and
@@ -888,6 +891,10 @@ struct phy_led {
  * @flags: A bitfield defining certain other features this PHY
  *   supports (like interrupts)
  * @driver_data: Static driver data
+ * @phy_package_global_phys_offset: Table of offset of the required
+ *  global PHYs for PHY package global configuration.
+ * @phy_package_global_phys_num: Num of the required global PHYs
+ *   for PHY package global configuration.
  *
  * All functions are optional. If config_aneg or read_status
  * are not implemented, the phy core uses the genphy versions.
@@ -905,6 +912,8 @@ struct phy_driver {
 	const unsigned long * const features;
 	u32 flags;
 	const void *driver_data;
+	const u8 *phy_package_global_phys_offset;
+	const u8 phy_package_global_phys_num;
 
 	/**
 	 * @soft_reset: Called to issue a PHY software reset
-- 
2.40.1


