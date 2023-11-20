Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F181AC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FX7V7trfh1DXAxYTuLbIm4MQGMj2UzdEIFOOsY5wQzg=; b=QUGPkQyBXvJYgBldiLnsvHRriW
	duJGt4uv70NUQijYREHwH98bbBCVVAjVp5JX/kss0oJbAapsxDbYXUIZsNkbmivsZnn8xFpebcs/a
	0HaVqHONbh45SmbfrS3QGLFEDF5dhwPRTJ1Z0bRiNAP81sD1FMrPqE+MH1meZYukGvHyxe88gwSNZ
	qYiNhrEx4TTidSGootEHJ0KMWapolMuth9HqaIyBnOEB/WNiVO9spT3On7gvgKvmsO9Xz2HMr3aDd
	t8hxgA5A/BqCd3aXGhGz0coQcWzbq0X0kd48OJa2Mn1lQ5gb3+6Ze4ec74VvOgR5qaGEiltq5oVxV
	/IafXIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r55lN-00CRoA-25;
	Mon, 20 Nov 2023 15:00:37 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gK-00CBf6-3D;
	Mon, 20 Nov 2023 13:51:23 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c5071165d5so54585541fa.0;
        Mon, 20 Nov 2023 05:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488278; x=1701093078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FX7V7trfh1DXAxYTuLbIm4MQGMj2UzdEIFOOsY5wQzg=;
        b=fGjfddqY2AbUACfSpKRdsbna4nQN0kMqycPCErk3pTli3xccmX5IW+9IN5wzub+L/H
         bSGFa7IHrntwL106wpYTb0dbdwSgJhzZO2pSFKtu1kuDtz/V1NGfT12/wj3EBAMObsrB
         SKspEyow9ooo9/pLbIbLqlS8f9crhu5CD6X/W3n0QO8JT2iyd0q56BbrrXepIerCwBoJ
         1FkvDtWiVCVVHG6s+Hhb8OQl+YTBSitapT2I63AE2MkAPyfddJLaAvnWY4WSu4e7aPPy
         Rtc+ID8TKmGV55LAQ6jWWEJpCnSY3weAlwygnDpQuYMDZSdK/auSuu/rRZ8+D5dMx7vQ
         4HIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488278; x=1701093078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FX7V7trfh1DXAxYTuLbIm4MQGMj2UzdEIFOOsY5wQzg=;
        b=PhOgqizdC0IKDyLSi16g7CZ/hTFZNXlxnAF+pqq77g2YQvDlQk5HFXNYq/sxiNjzk9
         weJkr7a7JMR8fENNXXCV3zNr8W6194MJqyg89h03p5odlWTJRKTihe/joHBXLVJTzy6I
         YuMpvcL0nUZaahPzK4KXGXK89b5VHl7Lp7VoEbNfUb4ogGWJA1WlQR8fIohIFHgO2o2k
         rVfAUl6xbvaO0E1Peq3Ch22wIM07/p3vOc0X7+h4LnKH00GBXTzFT+zGLp6VcTysvgsS
         +IVKNP7/FUULb5BKYTpsMYXKiMTkP5LpdQA8CkfG3702P1afPlHOmVCLfJcua/pQkOfy
         nEhw==
X-Gm-Message-State: AOJu0YypwuFAeEq+X4uOk34D071xSOFcZP59BceBIQRbjILjH1dd6aP+
	LMS8Mmf6XGi01Ymlwy3EOd4=
X-Google-Smtp-Source: AGHT+IF4ycEz6nEuh7H0LHPJzm7S6F42GA5GwMWhCXVp35tpWzh2Uz1UI71fbUqJe1Q0eWODeWR8WQ==
X-Received: by 2002:a2e:81d8:0:b0:2c6:f625:cc61 with SMTP id s24-20020a2e81d8000000b002c6f625cc61mr4805116ljg.31.1700488278078;
        Mon, 20 Nov 2023 05:51:18 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:17 -0800 (PST)
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
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 04/14] net: phy: add initial support for PHY package in DT
Date: Mon, 20 Nov 2023 14:50:31 +0100
Message-Id: <20231120135041.15259-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055121_058897_4E98A8E8 
X-CRM114-Status: GOOD (  32.67  )
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
mdio node. This dedicated node needs to have the compatible set to
"ethernet-phy-package" and define "global-phys" and "#global-phy-cells"
respectively to a list of phandle to the global phy to define for the
PHY package and 0 for cells as the phandle won't take any args.

With this defined, the generic PHY probe will join each PHY in this
dedicated node to the package.

PHY driver MUST set the required global PHY count in
.phy_package_global_phy_num to correctly verify that DT define the
correct number of phandle to the required global PHY.

mdio_bus.c and of_mdio.c is updated to now support and parse also
PHY package subnote that have the compatible "phy-package".

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/of_mdio.c   | 60 ++++++++++++++++++++++-----------
 drivers/net/phy/mdio_bus.c   | 33 ++++++++++++++-----
 drivers/net/phy/phy_device.c | 64 ++++++++++++++++++++++++++++++++++++
 include/linux/phy.h          |  5 +++
 4 files changed, 135 insertions(+), 27 deletions(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index 64ebcb6d235c..bb910651118f 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -139,6 +139,44 @@ bool of_mdiobus_child_is_phy(struct device_node *child)
 }
 EXPORT_SYMBOL(of_mdiobus_child_is_phy);
 
+static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
+				   bool *scanphys)
+{
+	struct device_node *child;
+	int addr, rc;
+
+	/* Loop over the child nodes and register a phy_device for each phy */
+	for_each_available_child_of_node(np, child) {
+		if (of_device_is_compatible(child, "ethernet-phy-package")) {
+			rc = __of_mdiobus_parse_phys(mdio, child, scanphys);
+			if (rc && rc != -ENODEV)
+				return rc;
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
+			return rc;
+	}
+
+	return 0;
+}
+
 /**
  * __of_mdiobus_register - Register mii_bus and create PHYs from the device tree
  * @mdio: pointer to mii_bus structure
@@ -180,25 +218,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
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
diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 25dcaa49ab8b..ecec20fd3fd3 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -455,19 +455,23 @@ EXPORT_SYMBOL(of_mdio_find_bus);
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
+			if (!of_mdiobus_find_phy(dev, mdiodev, child))
+				return 0;
+
+			continue;
+		}
+
 		addr = of_mdio_parse_addr(dev, child);
 		if (addr < 0)
 			continue;
@@ -477,9 +481,22 @@ static void of_mdiobus_link_mdiodev(struct mii_bus *bus,
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
index e016dbfb0d27..9ff76d84dca0 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3193,6 +3193,65 @@ static int of_phy_leds(struct phy_device *phydev)
 	return 0;
 }
 
+static int of_phy_package(struct phy_device *phydev)
+{
+	struct device_node *node = phydev->mdio.dev.of_node;
+	struct of_phandle_args phy_phandle;
+	struct device_node *package_node;
+	int i, global_phys_num, ret;
+	int *global_phy_addrs;
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
+	ret = of_count_phandle_with_args(package_node, "global-phys", NULL);
+	if (ret < 0)
+		return 0;
+	global_phys_num = ret;
+
+	if (global_phys_num != phydev->drv->phy_package_global_phy_num)
+		return -EINVAL;
+
+	global_phy_addrs = kmalloc_array(global_phys_num, sizeof(*global_phy_addrs),
+					 GFP_KERNEL);
+	if (!global_phy_addrs)
+		return -ENOMEM;
+
+	for (i = 0; i < global_phys_num; i++) {
+		int addr;
+
+		ret = of_parse_phandle_with_args(package_node, "global-phys",
+						 NULL, i, &phy_phandle);
+		if (ret)
+			goto exit;
+
+		ret = of_property_read_u32(phy_phandle.np, "reg", &addr);
+		if (ret)
+			goto exit;
+
+		global_phy_addrs[i] = addr;
+	}
+
+	ret = devm_phy_package_join(&phydev->mdio.dev, phydev, global_phy_addrs,
+				    global_phys_num, 0);
+	if (ret)
+		goto exit;
+
+	phydev->shared->np = package_node;
+
+exit:
+	kfree(global_phy_addrs);
+
+	return ret;
+}
+
 /**
  * fwnode_mdio_find_device - Given a fwnode, find the mdio_device
  * @fwnode: pointer to the mdio_device's fwnode
@@ -3301,6 +3360,11 @@ static int phy_probe(struct device *dev)
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
index c2bb3f0b9dda..5bf90c49e5bd 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -339,6 +339,8 @@ struct mdio_bus_stats {
  * phy_package_leave().
  */
 struct phy_package_shared {
+	/* With PHY package defined in DT this points to the PHY package node */
+	struct device_node *np;
 	/* addrs list pointer */
 	/* note that this pointer is shared between different phydevs.
 	 * It is allocated and freed automatically by phy_package_join() and
@@ -888,6 +890,8 @@ struct phy_led {
  * @flags: A bitfield defining certain other features this PHY
  *   supports (like interrupts)
  * @driver_data: Static driver data
+ * @phy_package_global_phy_num: Num of the required global phy
+ *   for PHY package global configuration.
  *
  * All functions are optional. If config_aneg or read_status
  * are not implemented, the phy core uses the genphy versions.
@@ -905,6 +909,7 @@ struct phy_driver {
 	const unsigned long * const features;
 	u32 flags;
 	const void *driver_data;
+	unsigned int phy_package_global_phy_num;
 
 	/**
 	 * @soft_reset: Called to issue a PHY software reset
-- 
2.40.1


