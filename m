Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D70C61D97
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 00:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=170V99bF9fbfKYiUs+utHt6sltSk5a5hRXsRWfq9j/0=; b=z/jBQbbsBUzJ56RFmNAOZDxisV
	aMSIFoTXmJ6fvxCoi3r67vZ1jdZLPCVqUOohsI561+oI6Z6wwjKZiEyC9qhDSmO2ajmXSimfBUmCB
	x2QYuQhgI793GlC1YqbyTlgX8F1zAAfgal+HSR6ZFuItRDH/VIoEUJMaI8UkkmbMJ12O7l4bgiwQA
	tnj7Wx16mb0+xb29jCYXjJwSmBnQ8VPe/ImTI0dI7YHX58ypVBuZ/5mweAcfhz5ag0rUDXrdJCgeh
	gUEQjmaWie+29jL3OQZRBqOW45AtesUUuiL7qPnB1UWPwdTWsY7XzHc7jQbDYArYZYyHHld4hT6bO
	J74cW84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6gdw-008FF6-2I;
	Sat, 25 Nov 2023 00:35:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6gdk-008FAL-2e;
	Sat, 25 Nov 2023 00:35:23 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40b2ddab817so17150165e9.3;
        Fri, 24 Nov 2023 16:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872519; x=1701477319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=170V99bF9fbfKYiUs+utHt6sltSk5a5hRXsRWfq9j/0=;
        b=LyZdtEQoGr1IjmLwolqdN56emekiXqtYUC/jmxQktaG7cO1tuSPqpjS7usjQwnH+wf
         C+jMflUSneypDzRv/LQhSk+0IwBQnoDA9ogfU67Mx+cy/lnL9/apnHdmqiV03+0dmfQb
         vh3NlT4myKWnfvvEkKhmG25FyBS+cEvJ3E3asqDNrthR5lLOSH55++nJGxLu6PdtYwqK
         0pF+qMnt+b1nO+O9ISuHvOk3Z3Q9IqjIMWHWEFTZ0OXQxANeHWoRXI/y5VSiwYHiPSIe
         BkMh2XMIk29/I0dCU7vXJ6uKN+56X1rhKP/GJaqEUgVc2e9MtV660YBSOia+P/66P7+V
         AU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872519; x=1701477319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=170V99bF9fbfKYiUs+utHt6sltSk5a5hRXsRWfq9j/0=;
        b=KKjDKU/cuW+lEWfpG0d/8Z+UEmIQbvCDC1DMMvftyB9sEV4QKN2aR8OehNrqInaQOU
         +EALdsWq9tNM55AYIO3PSBPFOoiyk5BztwyVCEoWUXxNVORI+uCg2lhzrmC4P3RbxF1A
         DOveL9H4vgdqW3dWWnS+/WcpneeNmpmKdD78/B7+u54dWxpCoANx/kln8gZJOEOK5XT8
         qhW24NHdEExT3sF6vDhQZ/to7pDC5jmiOOKyEQA2Dsr0dKKIyapbo6BFldGz/oyUO9xX
         Z+TDJ5GR0EZqVkoALJq8s1tzhyvzbbwdxnF/+Roar7+HTLcaqvD1l/pmwAsZUEkWmCB5
         P2Gw==
X-Gm-Message-State: AOJu0YxglMvvWBz7sXNYzhc9N8OkLfDwaW027SskJYQFIl7nYziHfK/3
	sgTEiIViJF/utLCefDA8cUI=
X-Google-Smtp-Source: AGHT+IEMHpczOiP3Q7wU7IBEqropKVuE8Jhtmw0bYQnfIP+ill6XeVc+Yn33EYb8aHrCInbyKgVw4w==
X-Received: by 2002:a05:600c:444b:b0:401:b204:3b97 with SMTP id v11-20020a05600c444b00b00401b2043b97mr4029095wmn.4.1700872518348;
        Fri, 24 Nov 2023 16:35:18 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:18 -0800 (PST)
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
Subject: [net-next RFC PATCH v2 01/11] net: phy: extend PHY package API to support multiple global address
Date: Sat, 25 Nov 2023 01:11:17 +0100
Message-Id: <20231125001127.5674-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_163520_865255_E4868F7E 
X-CRM114-Status: GOOD (  29.31  )
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

Current API for PHY package are limited to single address to configure
global settings for the PHY package.

It was found that some PHY package (for example the qca807x, a PHY
package that is shipped with a bundle of 5 PHY) require multiple PHY
address to configure global settings. An example scenario is a PHY that
have a dedicated PHY for PSGMII/serdes calibrarion and have a specific
PHY in the package where the global PHY mode is set and affects every
other PHY in the package.

Change the API in the following way:
- Make phy_package_join() require a list of address to be passed and the
  number of address in the list
- On shared data init, each address is the list is checked and added to
  the shared struct.
- Make __/phy_package_write/read() require an additional arg that
  select what global PHY address to use in the provided list.

Each user of this API is updated to follow this new implementation
following a pattern where an enum is defined to declare the index of the
addr and the addr list is passed.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/bcm54140.c        | 23 +++++++--
 drivers/net/phy/mediatek-ge-soc.c | 11 +++-
 drivers/net/phy/micrel.c          | 13 +++--
 drivers/net/phy/mscc/mscc.h       |  7 +++
 drivers/net/phy/mscc/mscc_main.c  | 16 ++++--
 drivers/net/phy/phy_device.c      | 85 ++++++++++++++++++++-----------
 include/linux/phy.h               | 51 +++++++++++++------
 7 files changed, 147 insertions(+), 59 deletions(-)

diff --git a/drivers/net/phy/bcm54140.c b/drivers/net/phy/bcm54140.c
index d43076592f81..89c735b386d3 100644
--- a/drivers/net/phy/bcm54140.c
+++ b/drivers/net/phy/bcm54140.c
@@ -128,6 +128,12 @@
 #define BCM54140_DEFAULT_DOWNSHIFT 5
 #define BCM54140_MAX_DOWNSHIFT 9
 
+enum bcm54140_global_phy {
+	BCM54140_BASE_ADDR = 0,
+
+	__BCM54140_GLOBAL_PHY_MAX,
+};
+
 struct bcm54140_priv {
 	int port;
 	int base_addr;
@@ -429,11 +435,13 @@ static int bcm54140_base_read_rdb(struct phy_device *phydev, u16 rdb)
 	int ret;
 
 	phy_lock_mdio_bus(phydev);
-	ret = __phy_package_write(phydev, MII_BCM54XX_RDB_ADDR, rdb);
+	ret = __phy_package_write(phydev, BCM54140_BASE_ADDR,
+				  MII_BCM54XX_RDB_ADDR, rdb);
 	if (ret < 0)
 		goto out;
 
-	ret = __phy_package_read(phydev, MII_BCM54XX_RDB_DATA);
+	ret = __phy_package_read(phydev, BCM54140_BASE_ADDR,
+				 MII_BCM54XX_RDB_DATA);
 
 out:
 	phy_unlock_mdio_bus(phydev);
@@ -446,11 +454,13 @@ static int bcm54140_base_write_rdb(struct phy_device *phydev,
 	int ret;
 
 	phy_lock_mdio_bus(phydev);
-	ret = __phy_package_write(phydev, MII_BCM54XX_RDB_ADDR, rdb);
+	ret = __phy_package_write(phydev, BCM54140_BASE_ADDR,
+				  MII_BCM54XX_RDB_ADDR, rdb);
 	if (ret < 0)
 		goto out;
 
-	ret = __phy_package_write(phydev, MII_BCM54XX_RDB_DATA, val);
+	ret = __phy_package_write(phydev, BCM54140_BASE_ADDR,
+				  MII_BCM54XX_RDB_DATA, val);
 
 out:
 	phy_unlock_mdio_bus(phydev);
@@ -570,6 +580,7 @@ static int bcm54140_get_base_addr_and_port(struct phy_device *phydev)
 
 static int bcm54140_probe(struct phy_device *phydev)
 {
+	int addrs[__BCM54140_GLOBAL_PHY_MAX];
 	struct bcm54140_priv *priv;
 	int ret;
 
@@ -583,7 +594,9 @@ static int bcm54140_probe(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
-	devm_phy_package_join(&phydev->mdio.dev, phydev, priv->base_addr, 0);
+	addrs[BCM54140_BASE_ADDR] = priv->base_addr;
+	devm_phy_package_join(&phydev->mdio.dev, phydev, addrs,
+			      ARRAY_SIZE(addrs), 0);
 
 #if IS_ENABLED(CONFIG_HWMON)
 	mutex_init(&priv->alarm_lock);
diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek-ge-soc.c
index 8a20d9889f10..3f2043fe05ed 100644
--- a/drivers/net/phy/mediatek-ge-soc.c
+++ b/drivers/net/phy/mediatek-ge-soc.c
@@ -298,6 +298,12 @@ struct mtk_socphy_priv {
 	unsigned long		led_state;
 };
 
+enum mtk_global_phy {
+	MTK_BASE_ADDR = 0,
+
+	__MTK_GLOBAL_PHY_MAX
+};
+
 struct mtk_socphy_shared {
 	u32			boottrap;
 	struct mtk_socphy_priv	priv[4];
@@ -1431,13 +1437,16 @@ static void mt798x_phy_leds_state_init(struct phy_device *phydev)
 static int mt7988_phy_probe(struct phy_device *phydev)
 {
 	struct mtk_socphy_shared *shared;
+	int addrs[__MTK_GLOBAL_PHY_MAX];
 	struct mtk_socphy_priv *priv;
 	int err;
 
 	if (phydev->mdio.addr > 3)
 		return -EINVAL;
 
-	err = devm_phy_package_join(&phydev->mdio.dev, phydev, 0,
+	addrs[MTK_BASE_ADDR] = 0;
+	err = devm_phy_package_join(&phydev->mdio.dev, phydev,
+				    addrs, ARRAY_SIZE(addrs),
 				    sizeof(struct mtk_socphy_shared));
 	if (err)
 		return err;
diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 08e3915001c3..94a4c7d9ae9c 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -328,6 +328,12 @@ struct kszphy_ptp_priv {
 	spinlock_t seconds_lock;
 };
 
+enum ksz_global_phy {
+	KSZ_BASE_ADDR = 0,
+
+	__KZS_GLOBAL_PHY_MAX,
+};
+
 struct kszphy_priv {
 	struct kszphy_ptp_priv ptp_priv;
 	const struct kszphy_type *type;
@@ -3274,8 +3280,8 @@ static int lan8814_release_coma_mode(struct phy_device *phydev)
 static int lan8814_probe(struct phy_device *phydev)
 {
 	const struct kszphy_type *type = phydev->drv->driver_data;
+	int addrs[__KZS_GLOBAL_PHY_MAX];
 	struct kszphy_priv *priv;
-	u16 addr;
 	int err;
 
 	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
@@ -3291,9 +3297,10 @@ static int lan8814_probe(struct phy_device *phydev)
 	/* Strap-in value for PHY address, below register read gives starting
 	 * phy address value
 	 */
-	addr = lanphy_read_page_reg(phydev, 4, 0) & 0x1F;
+	addrs[KSZ_BASE_ADDR] = lanphy_read_page_reg(phydev, 4, 0) & 0x1F;
 	devm_phy_package_join(&phydev->mdio.dev, phydev,
-			      addr, sizeof(struct lan8814_shared_priv));
+			      addrs, ARRAY_SIZE(addrs),
+			      sizeof(struct lan8814_shared_priv));
 
 	if (phy_package_init_once(phydev)) {
 		err = lan8814_release_coma_mode(phydev);
diff --git a/drivers/net/phy/mscc/mscc.h b/drivers/net/phy/mscc/mscc.h
index 7a962050a4d4..88da8eca2b94 100644
--- a/drivers/net/phy/mscc/mscc.h
+++ b/drivers/net/phy/mscc/mscc.h
@@ -416,6 +416,13 @@ struct vsc8531_private {
  * gpio_lock: used for PHC operations. Common for all PHYs as the load/save GPIO
  * is shared.
  */
+
+enum vsc85xx_global_phy {
+	VSC88XX_BASE_ADDR = 0,
+
+	__VSC8XX_GLOBAL_PHY_MAX,
+};
+
 struct vsc85xx_shared_private {
 	struct mutex gpio_lock;
 };
diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index 4171f01d34e5..749d4a6be60c 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -711,7 +711,7 @@ int phy_base_write(struct phy_device *phydev, u32 regnum, u16 val)
 		dump_stack();
 	}
 
-	return __phy_package_write(phydev, regnum, val);
+	return __phy_package_write(phydev, VSC88XX_BASE_ADDR, regnum, val);
 }
 
 /* phydev->bus->mdio_lock should be locked when using this function */
@@ -722,7 +722,7 @@ int phy_base_read(struct phy_device *phydev, u32 regnum)
 		dump_stack();
 	}
 
-	return __phy_package_read(phydev, regnum);
+	return __phy_package_read(phydev, VSC88XX_BASE_ADDR, regnum);
 }
 
 u32 vsc85xx_csr_read(struct phy_device *phydev,
@@ -2204,6 +2204,7 @@ static int vsc85xx_read_status(struct phy_device *phydev)
 
 static int vsc8514_probe(struct phy_device *phydev)
 {
+	int addrs[__VSC8XX_GLOBAL_PHY_MAX];
 	struct vsc8531_private *vsc8531;
 	u32 default_mode[4] = {VSC8531_LINK_1000_ACTIVITY,
 	   VSC8531_LINK_100_ACTIVITY, VSC8531_LINK_ACTIVITY,
@@ -2216,8 +2217,9 @@ static int vsc8514_probe(struct phy_device *phydev)
 	phydev->priv = vsc8531;
 
 	vsc8584_get_base_addr(phydev);
+	addrs[VSC88XX_BASE_ADDR] = vsc8531->base_addr;
 	devm_phy_package_join(&phydev->mdio.dev, phydev,
-			      vsc8531->base_addr, 0);
+			      addrs, ARRAY_SIZE(addrs), 0);
 
 	vsc8531->nleds = 4;
 	vsc8531->supp_led_modes = VSC85XX_SUPP_LED_MODES;
@@ -2233,6 +2235,7 @@ static int vsc8514_probe(struct phy_device *phydev)
 
 static int vsc8574_probe(struct phy_device *phydev)
 {
+	int addrs[__VSC8XX_GLOBAL_PHY_MAX];
 	struct vsc8531_private *vsc8531;
 	u32 default_mode[4] = {VSC8531_LINK_1000_ACTIVITY,
 	   VSC8531_LINK_100_ACTIVITY, VSC8531_LINK_ACTIVITY,
@@ -2245,8 +2248,9 @@ static int vsc8574_probe(struct phy_device *phydev)
 	phydev->priv = vsc8531;
 
 	vsc8584_get_base_addr(phydev);
+	addrs[VSC88XX_BASE_ADDR] = vsc8531->base_addr;
 	devm_phy_package_join(&phydev->mdio.dev, phydev,
-			      vsc8531->base_addr, 0);
+			      addrs, ARRAY_SIZE(addrs), 0);
 
 	vsc8531->nleds = 4;
 	vsc8531->supp_led_modes = VSC8584_SUPP_LED_MODES;
@@ -2262,6 +2266,7 @@ static int vsc8574_probe(struct phy_device *phydev)
 
 static int vsc8584_probe(struct phy_device *phydev)
 {
+	int addrs[__VSC8XX_GLOBAL_PHY_MAX];
 	struct vsc8531_private *vsc8531;
 	u32 default_mode[4] = {VSC8531_LINK_1000_ACTIVITY,
 	   VSC8531_LINK_100_ACTIVITY, VSC8531_LINK_ACTIVITY,
@@ -2280,7 +2285,8 @@ static int vsc8584_probe(struct phy_device *phydev)
 	phydev->priv = vsc8531;
 
 	vsc8584_get_base_addr(phydev);
-	devm_phy_package_join(&phydev->mdio.dev, phydev, vsc8531->base_addr,
+	addrs[VSC88XX_BASE_ADDR] = vsc8531->base_addr;
+	devm_phy_package_join(&phydev->mdio.dev, phydev, addrs, ARRAY_SIZE(addrs),
 			      sizeof(struct vsc85xx_shared_private));
 
 	vsc8531->nleds = 4;
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 478126f6b5bc..e016dbfb0d27 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1648,59 +1648,80 @@ EXPORT_SYMBOL_GPL(phy_driver_is_genphy_10g);
 /**
  * phy_package_join - join a common PHY group
  * @phydev: target phy_device struct
- * @addr: cookie and PHY address for global register access
+ * @addrs: list of cookies and PHY addresses for global register access
+ * @addrs_num: num of cookies and PHY address in addrs list
  * @priv_size: if non-zero allocate this amount of bytes for private data
  *
  * This joins a PHY group and provides a shared storage for all phydevs in
  * this group. This is intended to be used for packages which contain
  * more than one PHY, for example a quad PHY transceiver.
  *
- * The addr parameter serves as a cookie which has to have the same value
+ * The addrs parameters serves as cookies which has to have the same values
  * for all members of one group and as a PHY address to access generic
  * registers of a PHY package. Usually, one of the PHY addresses of the
  * different PHYs in the package provides access to these global registers.
- * The address which is given here, will be used in the phy_package_read()
+ * The addresses which is given here, will be used in the phy_package_read()
  * and phy_package_write() convenience functions. If your PHY doesn't have
  * global registers you can just pick any of the PHY addresses.
+ * In some special PHY package, multiple PHY are used for global init of
+ * the entire PHY package. In the scenario, multiple address are defined.
+ * phy_package_read() and phy_package_write() requires an index to be passed
+ * to communicate which PHY to use for global init on read/write.
  *
  * This will set the shared pointer of the phydev to the shared storage.
  * If this is the first call for a this cookie the shared storage will be
  * allocated. If priv_size is non-zero, the given amount of bytes are
  * allocated for the priv member.
+ * A list is allocated based on the addrs_num value and the passed list in
+ * addrs is copied to the just allocated list.
  *
  * Returns < 1 on error, 0 on success. Esp. calling phy_package_join()
  * with the same cookie but a different priv_size is an error.
  */
-int phy_package_join(struct phy_device *phydev, int addr, size_t priv_size)
+int phy_package_join(struct phy_device *phydev, int *addrs, size_t addrs_num,
+		     size_t priv_size)
 {
 	struct mii_bus *bus = phydev->mdio.bus;
 	struct phy_package_shared *shared;
-	int ret;
+	int *shared_addrs;
+	int i, addr, ret;
 
-	if (addr < 0 || addr >= PHY_MAX_ADDR)
+	if (!addrs || !addrs_num)
 		return -EINVAL;
 
+	for (i = 0; i < addrs_num; i++)
+		if (addrs[i] < 0 || addrs[i] >= PHY_MAX_ADDR)
+			return -EINVAL;
+
 	mutex_lock(&bus->shared_lock);
-	shared = bus->shared[addr];
-	if (!shared) {
-		ret = -ENOMEM;
-		shared = kzalloc(sizeof(*shared), GFP_KERNEL);
-		if (!shared)
-			goto err_unlock;
-		if (priv_size) {
-			shared->priv = kzalloc(priv_size, GFP_KERNEL);
-			if (!shared->priv)
-				goto err_free;
-			shared->priv_size = priv_size;
+	for (i = 0; i < addrs_num; i++) {
+		addr = addrs[i];
+		shared = bus->shared[addr];
+		if (!shared) {
+			ret = -ENOMEM;
+			shared = kzalloc(sizeof(*shared), GFP_KERNEL);
+			if (!shared)
+				goto err_unlock;
+			if (priv_size) {
+				shared->priv = kzalloc(priv_size, GFP_KERNEL);
+				if (!shared->priv)
+					goto err_free;
+				shared->priv_size = priv_size;
+			}
+			shared_addrs = kmalloc_array(addrs_num, sizeof(*addrs), GFP_KERNEL);
+			if (!shared_addrs)
+				goto err_free_priv;
+			memcpy(shared_addrs, addrs, sizeof(*addrs) * addrs_num);
+			shared->addrs = shared_addrs;
+			shared->addrs_num = addrs_num;
+			refcount_set(&shared->refcnt, 1);
+			bus->shared[addr] = shared;
+		} else {
+			ret = -EINVAL;
+			if (priv_size && priv_size != shared->priv_size)
+				goto err_unlock;
+			refcount_inc(&shared->refcnt);
 		}
-		shared->addr = addr;
-		refcount_set(&shared->refcnt, 1);
-		bus->shared[addr] = shared;
-	} else {
-		ret = -EINVAL;
-		if (priv_size && priv_size != shared->priv_size)
-			goto err_unlock;
-		refcount_inc(&shared->refcnt);
 	}
 	mutex_unlock(&bus->shared_lock);
 
@@ -1708,6 +1729,8 @@ int phy_package_join(struct phy_device *phydev, int addr, size_t priv_size)
 
 	return 0;
 
+err_free_priv:
+	kfree(shared->priv);
 err_free:
 	kfree(shared);
 err_unlock:
@@ -1728,13 +1751,16 @@ void phy_package_leave(struct phy_device *phydev)
 {
 	struct phy_package_shared *shared = phydev->shared;
 	struct mii_bus *bus = phydev->mdio.bus;
+	int i;
 
 	if (!shared)
 		return;
 
 	if (refcount_dec_and_mutex_lock(&shared->refcnt, &bus->shared_lock)) {
-		bus->shared[shared->addr] = NULL;
+		for (i = 0; i < shared->addrs_num; i++)
+			bus->shared[shared->addrs[i]] = NULL;
 		mutex_unlock(&bus->shared_lock);
+		kfree(shared->addrs);
 		kfree(shared->priv);
 		kfree(shared);
 	}
@@ -1752,7 +1778,8 @@ static void devm_phy_package_leave(struct device *dev, void *res)
  * devm_phy_package_join - resource managed phy_package_join()
  * @dev: device that is registering this PHY package
  * @phydev: target phy_device struct
- * @addr: cookie and PHY address for global register access
+ * @addrs: list of cookies and PHY addresses for global register access
+ * @addrs_num: num of cookies and PHY address in addrs list
  * @priv_size: if non-zero allocate this amount of bytes for private data
  *
  * Managed phy_package_join(). Shared storage fetched by this function,
@@ -1760,7 +1787,7 @@ static void devm_phy_package_leave(struct device *dev, void *res)
  * phy_package_join() for more information.
  */
 int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
-			  int addr, size_t priv_size)
+			  int *addrs, size_t addrs_num, size_t priv_size)
 {
 	struct phy_device **ptr;
 	int ret;
@@ -1770,7 +1797,7 @@ int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
 	if (!ptr)
 		return -ENOMEM;
 
-	ret = phy_package_join(phydev, addr, priv_size);
+	ret = phy_package_join(phydev, addrs, addrs_num, priv_size);
 
 	if (!ret) {
 		*ptr = phydev;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3cc52826f18e..c2bb3f0b9dda 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -327,7 +327,8 @@ struct mdio_bus_stats {
 
 /**
  * struct phy_package_shared - Shared information in PHY packages
- * @addr: Common PHY address used to combine PHYs in one package
+ * @addrs: List of common PHY addresses used to combine PHYs in one package
+ * @addrs_num: Number of common PHY addresses in addrs list
  * @refcnt: Number of PHYs connected to this shared data
  * @flags: Initialization of PHY package
  * @priv_size: Size of the shared private data @priv
@@ -338,7 +339,14 @@ struct mdio_bus_stats {
  * phy_package_leave().
  */
 struct phy_package_shared {
-	int addr;
+	/* addrs list pointer */
+	/* note that this pointer is shared between different phydevs.
+	 * It is allocated and freed automatically by phy_package_join() and
+	 * phy_package_leave(), the list passed to phy_package_join() is copied
+	 * to the new allocated list.
+	 */
+	int *addrs;
+	size_t addrs_num;
 	refcount_t refcnt;
 	unsigned long flags;
 	size_t priv_size;
@@ -1970,10 +1978,11 @@ int phy_ethtool_get_link_ksettings(struct net_device *ndev,
 int phy_ethtool_set_link_ksettings(struct net_device *ndev,
 				   const struct ethtool_link_ksettings *cmd);
 int phy_ethtool_nway_reset(struct net_device *ndev);
-int phy_package_join(struct phy_device *phydev, int addr, size_t priv_size);
+int phy_package_join(struct phy_device *phydev, int *addrs, size_t addrs_num,
+		     size_t priv_size);
 void phy_package_leave(struct phy_device *phydev);
 int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
-			  int addr, size_t priv_size);
+			  int *addrs, size_t addrs_num, size_t priv_size);
 
 int __init mdio_bus_init(void);
 void mdio_bus_exit(void);
@@ -1996,46 +2005,56 @@ int __phy_hwtstamp_set(struct phy_device *phydev,
 		       struct kernel_hwtstamp_config *config,
 		       struct netlink_ext_ack *extack);
 
-static inline int phy_package_read(struct phy_device *phydev, u32 regnum)
+static inline int phy_package_read(struct phy_device *phydev,
+				   int global_phy_index, u32 regnum)
 {
 	struct phy_package_shared *shared = phydev->shared;
+	int addr;
 
-	if (!shared)
+	if (!shared || global_phy_index > shared->addrs_num - 1)
 		return -EIO;
 
-	return mdiobus_read(phydev->mdio.bus, shared->addr, regnum);
+	addr = shared->addrs[global_phy_index];
+	return mdiobus_read(phydev->mdio.bus, addr, regnum);
 }
 
-static inline int __phy_package_read(struct phy_device *phydev, u32 regnum)
+static inline int __phy_package_read(struct phy_device *phydev,
+				     int global_phy_index, u32 regnum)
 {
 	struct phy_package_shared *shared = phydev->shared;
+	int addr;
 
-	if (!shared)
+	if (!shared || global_phy_index > shared->addrs_num - 1)
 		return -EIO;
 
-	return __mdiobus_read(phydev->mdio.bus, shared->addr, regnum);
+	addr = shared->addrs[global_phy_index];
+	return __mdiobus_read(phydev->mdio.bus, addr, regnum);
 }
 
 static inline int phy_package_write(struct phy_device *phydev,
-				    u32 regnum, u16 val)
+				    int global_phy_index, u32 regnum, u16 val)
 {
 	struct phy_package_shared *shared = phydev->shared;
+	int addr;
 
-	if (!shared)
+	if (!shared || global_phy_index > shared->addrs_num - 1)
 		return -EIO;
 
-	return mdiobus_write(phydev->mdio.bus, shared->addr, regnum, val);
+	addr = shared->addrs[global_phy_index];
+	return mdiobus_write(phydev->mdio.bus, addr, regnum, val);
 }
 
 static inline int __phy_package_write(struct phy_device *phydev,
-				      u32 regnum, u16 val)
+				      int global_phy_index, u32 regnum, u16 val)
 {
 	struct phy_package_shared *shared = phydev->shared;
+	int addr;
 
-	if (!shared)
+	if (!shared || global_phy_index > shared->addrs_num - 1)
 		return -EIO;
 
-	return __mdiobus_write(phydev->mdio.bus, shared->addr, regnum, val);
+	addr = shared->addrs[global_phy_index];
+	return __mdiobus_write(phydev->mdio.bus, addr, regnum, val);
 }
 
 static inline bool __phy_package_set_once(struct phy_device *phydev,
-- 
2.40.1


