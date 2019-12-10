Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42880C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 08:15:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1528A20663
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 08:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j9WG0Cq9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A6fsNqWU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1528A20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVGZDCMTV+sJr3SwVa7gBwGmL5VU+NhIMoMB8Ab+5aA=; b=j9WG0Cq9BCRDoF
	FZTlC59PmmuWbDmqpCj3QWxr1vOsdtKScycjAarycZR0cEQ8ycsd03MOb1tHOARer5kay7K4WlBeP
	7ItpfkaMecxFg+xA5Vlrq+tJTsRlt5vwtB3Mh0FXRWoZeqhLQ4ec5xFQ3EwuNbtc16eLvPa5UVm5e
	Z3X8+wycImGtsMRX312XiZZ/L1YctexGR/kd86pGGKkfx3+PCGD/fdBeF6IooVtXsUwx3aBxK5GTU
	YVS2BYWO6teFDQV1K2wTRFtOcQo0VL8/z84dvRBuzSeYfWWSQM6V7XoEkBWQsLGqYE2tN3SAfOY0/
	61D67qMaNP5+xKmSnylg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieafl-0000q9-67; Tue, 10 Dec 2019 08:15:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieafW-0008Tr-QH
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 08:14:57 +0000
X-UUID: 41f535c874cc45099ec042719b4f063d-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sEkoMPWKI3m+K/8A3kC0uuYTNxZZaGCvfLKvnEmwQQ4=; 
 b=A6fsNqWUmjxIiZPLPb43Hs36qwwvYXMLQ/LlU24IcsfBro20uMkDbzGq522r69u0071Qgekwc/zs4yujo0pz40jCfnAo38JIDP73w4ZyVGuOENM5gdE+qNNUednOVSi052hcMRhS7zpVD0Rfl7vKKOU42F7Tl+cadVzjUl0ow/s=;
X-UUID: 41f535c874cc45099ec042719b4f063d-20191210
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 153767181; Tue, 10 Dec 2019 00:14:49 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 00:15:03 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 16:14:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 10 Dec 2019 16:14:26 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <vivien.didelot@savoirfairelinux.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH net-next 4/6] net: dsa: mt7530: Add the support of MT7531
 switch
Date: Tue, 10 Dec 2019 16:14:40 +0800
Message-ID: <6d608dd024edc90b09ba4fe35417b693847f973c.1575914275.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1575914275.git.landen.chao@mediatek.com>
References: <cover.1575914275.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_001454_918998_D8727FD5 
X-CRM114-Status: GOOD (  15.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Landen Chao <landen.chao@mediatek.com>,
 frank-w@public-files.de, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add new support for MT7531:

MT7531 is the next generation of MT7530. It is also a 7-ports switch with
5 giga embedded phys, 2 cpu ports, and the same MAC logic of MT7530. Cpu
port 6 only supports HSGMII interface. Cpu port 5 supports either RGMII
or HSGMII in different HW sku. Due to HSGMII interface support, pll, and
pad setting are different from MT7530. This patch adds different initial
setting of MT7531.

Signed-off-by: Landen Chao <landen.chao@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/dsa/Kconfig  |   6 +-
 drivers/net/dsa/mt7530.c | 643 ++++++++++++++++++++++++++++++++++++++-
 drivers/net/dsa/mt7530.h | 144 +++++++++
 3 files changed, 784 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index 467f80157acf..a77709469093 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -33,12 +33,12 @@ config NET_DSA_LANTIQ_GSWIP
 	  the xrx200 / VR9 SoC.
 
 config NET_DSA_MT7530
-	tristate "MediaTek MT7530 and MT7621 Ethernet switch support"
+	tristate "MediaTek MT753x and MT7621 Ethernet switch support"
 	depends on NET_DSA
 	select NET_DSA_TAG_MTK
 	---help---
-	  This enables support for the MediaTek MT7530 and MT7621 Ethernet
-	  switch chip.
+	  This enables support for the MediaTek MT7530, MT7531 and MT7621
+	  Ethernet switch chip.
 
 config NET_DSA_MV88E6060
 	tristate "Marvell 88E6060 ethernet switch chip support"
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9a648d1f5d09..4bee04d75b49 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -285,6 +285,12 @@ mt7530_write(struct mt7530_priv *priv, u32 reg, u32 val)
 	mutex_unlock(&bus->mdio_lock);
 }
 
+static u32
+_mt7530_unlocked_read(struct mt7530_dummy_poll *p)
+{
+	return mt7530_mii_read(p->priv, p->reg);
+}
+
 static u32
 _mt7530_read(struct mt7530_dummy_poll *p)
 {
@@ -338,6 +344,102 @@ mt7530_clear(struct mt7530_priv *priv, u32 reg, u32 val)
 	mt7530_rmw(priv, reg, val, 0);
 }
 
+static int
+mt7531_ind_mmd_phy_read(struct mt7530_priv *priv, int port, int devad,
+			int regnum)
+{
+	struct mii_bus *bus = priv->bus;
+	struct mt7530_dummy_poll p;
+	u32 reg, val;
+	int ret;
+
+	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+
+	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+				 !(val & PHY_ACS_ST), 20, 100000);
+	if (ret < 0) {
+		dev_err(priv->dev, "poll timeout\n");
+		goto out;
+	}
+
+	reg = MDIO_CL45_ADDR | MDIO_PHY_ADDR(port) | MDIO_DEV_ADDR(devad) |
+	      regnum;
+	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | PHY_ACS_ST);
+
+	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+				 !(val & PHY_ACS_ST), 20, 100000);
+	if (ret < 0) {
+		dev_err(priv->dev, "poll timeout\n");
+		goto out;
+	}
+
+	reg = MDIO_CL45_READ | MDIO_PHY_ADDR(port) | MDIO_DEV_ADDR(devad);
+	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | PHY_ACS_ST);
+
+	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+				 !(val & PHY_ACS_ST), 20, 100000);
+	if (ret < 0) {
+		dev_err(priv->dev, "poll timeout\n");
+		goto out;
+	}
+
+	ret = val & MDIO_RW_DATA_MASK;
+out:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret;
+}
+
+static int
+mt7531_ind_mmd_phy_write(struct mt7530_priv *priv, int port, int devad,
+			 int regnum, u32 data)
+{
+	struct mii_bus *bus = priv->bus;
+	struct mt7530_dummy_poll p;
+	u32 val, reg;
+	int ret;
+
+	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+
+	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+				 !(val & PHY_ACS_ST), 20, 100000);
+	if (ret < 0) {
+		dev_err(priv->dev, "poll timeout\n");
+		goto out;
+	}
+
+	reg = MDIO_CL45_ADDR | MDIO_PHY_ADDR(port) | MDIO_DEV_ADDR(devad) |
+	      regnum;
+	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | PHY_ACS_ST);
+
+	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+				 !(val & PHY_ACS_ST), 20, 100000);
+	if (ret < 0) {
+		dev_err(priv->dev, "poll timeout\n");
+		goto out;
+	}
+
+	reg = MDIO_CL45_WRITE | MDIO_PHY_ADDR(port) | MDIO_DEV_ADDR(devad) |
+	      data;
+	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | PHY_ACS_ST);
+
+	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+				 !(val & PHY_ACS_ST), 20, 100000);
+	if (ret < 0) {
+		dev_err(priv->dev, "poll timeout\n");
+		goto out;
+	}
+
+out:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret;
+}
+
 static int
 mt7530_fdb_cmd(struct mt7530_priv *priv, enum mt7530_fdb_cmd cmd, u32 *rsp)
 {
@@ -589,6 +691,83 @@ static int mt7530_phy_write(struct dsa_switch *ds, int port, int regnum,
 	return mdiobus_write_nested(priv->bus, port, regnum, val);
 }
 
+static int
+mt7531_ind_phy_read(struct dsa_switch *ds, int port, int regnum)
+{
+	struct mt7530_priv *priv = ds->priv;
+	struct mii_bus *bus = priv->bus;
+	struct mt7530_dummy_poll p;
+	int ret;
+	u32 val;
+
+	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+
+	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+				 !(val & PHY_ACS_ST), 20, 100000);
+	if (ret < 0) {
+		dev_err(priv->dev, "poll timeout\n");
+		goto out;
+	}
+
+	val = MDIO_CL22_READ | MDIO_PHY_ADDR(port) | MDIO_REG_ADDR(regnum);
+
+	mt7530_mii_write(priv, MT7531_PHY_IAC, val | PHY_ACS_ST);
+
+	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
+				 !(val & PHY_ACS_ST), 20, 100000);
+	if (ret < 0) {
+		dev_err(priv->dev, "poll timeout\n");
+		goto out;
+	}
+
+	ret = val & MDIO_RW_DATA_MASK;
+out:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret;
+}
+
+static int
+mt7531_ind_phy_write(struct dsa_switch *ds, int port, int regnum,
+		     u16 data)
+{
+	struct mt7530_priv *priv = ds->priv;
+	struct mii_bus *bus = priv->bus;
+	struct mt7530_dummy_poll p;
+	int ret;
+	u32 reg;
+
+	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+
+	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, reg,
+				 !(reg & PHY_ACS_ST), 20, 100000);
+	if (ret < 0) {
+		dev_err(priv->dev, "poll timeout\n");
+		goto out;
+	}
+
+	reg = MDIO_CL22_WRITE | MDIO_PHY_ADDR(port) | MDIO_REG_ADDR(regnum) |
+	      data;
+
+	mt7530_mii_write(priv, MT7531_PHY_IAC, reg | PHY_ACS_ST);
+
+	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, reg,
+				 !(reg & PHY_ACS_ST), 20, 100000);
+	if (ret < 0) {
+		dev_err(priv->dev, "poll timeout\n");
+		goto out;
+	}
+
+out:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret;
+}
+
 static void
 mt7530_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 		   uint8_t *data)
@@ -1380,6 +1559,86 @@ mt7530_setup(struct dsa_switch *ds)
 	return 0;
 }
 
+static int mt7531_setup(struct dsa_switch *ds)
+{
+	struct mt7530_priv *priv = ds->priv;
+	struct mt7530_dummy_poll p;
+	u32 val, id;
+	int ret, i;
+
+	/* Reset whole chip through gpio pin or memory-mapped registers for
+	 * different type of hardware
+	 */
+	if (priv->mcm) {
+		reset_control_assert(priv->rstc);
+		usleep_range(1000, 1100);
+		reset_control_deassert(priv->rstc);
+	} else {
+		gpiod_set_value_cansleep(priv->reset, 0);
+		usleep_range(1000, 1100);
+		gpiod_set_value_cansleep(priv->reset, 1);
+	}
+
+	/* Waiting for MT7530 got to stable */
+	INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_HWTRAP);
+	ret = readx_poll_timeout(_mt7530_read, &p, val, val != 0,
+				 20, 1000000);
+	if (ret < 0) {
+		dev_err(priv->dev, "reset timeout\n");
+		return ret;
+	}
+
+	id = mt7530_read(priv, MT7531_CREV);
+	id >>= CHIP_NAME_SHIFT;
+
+	if (id != MT7531_ID) {
+		dev_err(priv->dev, "chip %x can't be supported\n", id);
+		return -ENODEV;
+	}
+
+	/* Reset the switch through internal reset */
+	mt7530_write(priv, MT7530_SYS_CTRL,
+		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
+		     SYS_CTRL_REG_RST);
+
+	priv->p6_interface = PHY_INTERFACE_MODE_NA;
+
+	/* Enable PHY power, since phy_device has not yet been created
+	 * provided for phy_[read,write]_mmd_indirect is called, we provide
+	 * our own mt7531_ind_mmd_phy_[read,write] to complete this
+	 * function.
+	 */
+	val = mt7531_ind_mmd_phy_read(priv, 0, PHY_DEV1F,
+				      MT7531_PHY_DEV1F_REG_403);
+	val |= MT7531_PHY_EN_BYPASS_MODE;
+	val &= ~MT7531_PHY_POWER_OFF;
+	mt7531_ind_mmd_phy_write(priv, 0, PHY_DEV1F,
+				 MT7531_PHY_DEV1F_REG_403, val);
+
+	/* Enable and reset MIB counters */
+	mt7530_mib_reset(ds);
+
+	mt7530_clear(priv, MT7530_MFC, UNU_FFP_MASK);
+
+	for (i = 0; i < MT7530_NUM_PORTS; i++) {
+		/* Disable forwarding by default on all ports */
+		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
+			   PCR_MATRIX_CLR);
+
+		if (dsa_is_cpu_port(ds, i))
+			mt7530_cpu_port_enable(priv, i);
+		else
+			mt7530_port_disable(ds, i);
+	}
+
+	/* Flush the FDB table */
+	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static bool mt7530_phy_supported(struct dsa_switch *ds, int port,
 				 const struct phylink_link_state *state)
 {
@@ -1417,6 +1676,49 @@ static bool mt7530_phy_supported(struct dsa_switch *ds, int port,
 	return false;
 }
 
+static bool mt7531_dual_sgmii_supported(struct mt7530_priv *priv)
+{
+	u32 val;
+
+	val = mt7530_read(priv, MT7531_TOP_SIG_SR);
+	return ((val & PAD_DUAL_SGMII_EN) != 0);
+}
+
+static bool mt7531_phy_supported(struct dsa_switch *ds, int port,
+				 const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	switch (port) {
+	case 0: /* Internal phy */
+	case 1:
+	case 2:
+	case 3:
+	case 4:
+		if (state->interface != PHY_INTERFACE_MODE_GMII)
+			goto unsupported;
+		break;
+	case 5: /* 2nd cpu port supports either rgmii or sgmii/8023z */
+		if (!mt7531_dual_sgmii_supported(priv))
+			return phy_interface_mode_is_rgmii(state->interface);
+		/* fall through */
+	case 6: /* 1st cpu port supports sgmii/8023z only */
+		if (state->interface != PHY_INTERFACE_MODE_SGMII &&
+		    !phy_interface_mode_is_8023z(state->interface))
+			goto unsupported;
+		break;
+	default:
+		dev_err(priv->dev, "%s: unsupported port: %i\n", __func__,
+			port);
+		goto unsupported;
+	}
+
+	return true;
+
+unsupported:
+	return false;
+}
+
 static bool mt753x_phy_supported(struct dsa_switch *ds, int port,
 				 const struct phylink_link_state *state)
 {
@@ -1444,6 +1746,143 @@ mt7530_pad_setup(struct dsa_switch *ds, const struct phylink_link_state *state)
 	return 0;
 }
 
+static int
+mt7531_pad_setup(struct dsa_switch *ds, const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+	u32 xtal, val;
+
+	if (mt7531_dual_sgmii_supported(priv))
+		return 0;
+
+	xtal = mt7530_read(priv, MT7531_HWTRAP) & HWTRAP_XTAL_FSEL_MASK;
+
+	switch (xtal) {
+	case HWTRAP_XTAL_FSEL_25MHZ:
+		/* Step 1 : Disable MT7531 COREPLL */
+		val = mt7530_read(priv, MT7531_PLLGP_EN);
+		val &= ~EN_COREPLL;
+		mt7530_write(priv, MT7531_PLLGP_EN, val);
+
+		/* Step 2: switch to XTAL output */
+		val = mt7530_read(priv, MT7531_PLLGP_EN);
+		val |= SW_CLKSW;
+		mt7530_write(priv, MT7531_PLLGP_EN, val);
+
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val &= ~RG_COREPLL_EN;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+
+		/* Step 3: disable PLLGP and enable program PLLGP */
+		val = mt7530_read(priv, MT7531_PLLGP_EN);
+		val |= SW_PLLGP;
+		mt7530_write(priv, MT7531_PLLGP_EN, val);
+
+		/* Step 4: program COREPLL output frequency to 500MHz */
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val &= ~RG_COREPLL_POSDIV_M;
+		val |= 2 << RG_COREPLL_POSDIV_S;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+		usleep_range(25, 35);
+
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val &= ~RG_COREPLL_SDM_PCW_M;
+		val |= 0x140000 << RG_COREPLL_SDM_PCW_S;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+
+		/* Set feedback divide ratio update signal to high */
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val |= RG_COREPLL_SDM_PCW_CHG;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+		/* Wait for at least 16 XTAL clocks */
+		usleep_range(10, 20);
+
+		/* Step 5: set feedback divide ratio update signal to low */
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val &= ~RG_COREPLL_SDM_PCW_CHG;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+
+		/* Enable 325M clock for SGMII */
+		mt7530_write(priv, MT7531_ANA_PLLGP_CR5, 0xad0000);
+
+		/* Enable 250SSC clock for RGMII */
+		mt7530_write(priv, MT7531_ANA_PLLGP_CR2, 0x4f40000);
+
+		/* Step 6: Enable MT7531 PLL */
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val |= RG_COREPLL_EN;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+
+		val = mt7530_read(priv, MT7531_PLLGP_EN);
+		val |= EN_COREPLL;
+		mt7530_write(priv, MT7531_PLLGP_EN, val);
+		usleep_range(25, 35);
+		break;
+	case HWTRAP_XTAL_FSEL_40MHZ:
+		/* Step 1 : Disable MT7531 COREPLL */
+		val = mt7530_read(priv, MT7531_PLLGP_EN);
+		val &= ~EN_COREPLL;
+		mt7530_write(priv, MT7531_PLLGP_EN, val);
+
+		/* Step 2: switch to XTAL output */
+		val = mt7530_read(priv, MT7531_PLLGP_EN);
+		val |= SW_CLKSW;
+		mt7530_write(priv, MT7531_PLLGP_EN, val);
+
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val &= ~RG_COREPLL_EN;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+
+		/* Step 3: disable PLLGP and enable program PLLGP */
+		val = mt7530_read(priv, MT7531_PLLGP_EN);
+		val |= SW_PLLGP;
+		mt7530_write(priv, MT7531_PLLGP_EN, val);
+
+		/* Step 4: program COREPLL output frequency to 500MHz */
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val &= ~RG_COREPLL_POSDIV_M;
+		val |= 2 << RG_COREPLL_POSDIV_S;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+		usleep_range(25, 35);
+
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val &= ~RG_COREPLL_SDM_PCW_M;
+		val |= 0x190000 << RG_COREPLL_SDM_PCW_S;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+
+		/* Set feedback divide ratio update signal to high */
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val |= RG_COREPLL_SDM_PCW_CHG;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+		/* Wait for at least 16 XTAL clocks */
+		usleep_range(10, 20);
+
+		/* Step 5: set feedback divide ratio update signal to low */
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val &= ~RG_COREPLL_SDM_PCW_CHG;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+
+		/* Enable 325M clock for SGMII */
+		mt7530_write(priv, MT7531_ANA_PLLGP_CR5, 0xad0000);
+
+		/* Enable 250SSC clock for RGMII */
+		mt7530_write(priv, MT7531_ANA_PLLGP_CR2, 0x4f40000);
+
+		/* Step 6: Enable MT7531 PLL */
+		val = mt7530_read(priv, MT7531_PLLGP_CR0);
+		val |= RG_COREPLL_EN;
+		mt7530_write(priv, MT7531_PLLGP_CR0, val);
+
+		val = mt7530_read(priv, MT7531_PLLGP_EN);
+		val |= EN_COREPLL;
+		mt7530_write(priv, MT7531_PLLGP_EN, val);
+		usleep_range(25, 35);
+		break;
+	}
+
+	return 0;
+}
+
 static int
 mt753x_pad_setup(struct dsa_switch *ds, const struct phylink_link_state *state)
 {
@@ -1467,6 +1906,149 @@ mt7530_mac_setup(struct dsa_switch *ds, int port, unsigned int mode,
 	return 0;
 }
 
+static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port)
+{
+	u32 val;
+
+	if (port != 5) {
+		dev_err(priv->dev, "RGMII mode is not available for port %d\n",
+			port);
+		return -EINVAL;
+	}
+
+	val = mt7530_read(priv, MT7531_CLKGEN_CTRL);
+	val |= GP_CLK_EN;
+	val &= ~GP_MODE_MASK;
+	val |= GP_MODE(MT7531_GP_MODE_RGMII);
+	val |= TXCLK_NO_REVERSE;
+	val |= RXCLK_NO_DELAY;
+	val &= ~CLK_SKEW_IN_MASK;
+	val |= CLK_SKEW_IN(MT7531_CLK_SKEW_NO_CHG);
+	val &= ~CLK_SKEW_OUT_MASK;
+	val |= CLK_SKEW_OUT(MT7531_CLK_SKEW_NO_CHG);
+	mt7530_write(priv, MT7531_CLKGEN_CTRL, val);
+
+	return 0;
+}
+
+static int mt7531_sgmii_setup_mode_force(struct mt7530_priv *priv, u32 port,
+					 const struct phylink_link_state *state)
+{
+	u32 val;
+
+	if (port != 5 && port != 6)
+		return -EINVAL;
+
+	val = mt7530_read(priv, MT7531_QPHY_PWR_STATE_CTRL(port));
+	val |= MT7531_SGMII_PHYA_PWD;
+	mt7530_write(priv, MT7531_QPHY_PWR_STATE_CTRL(port), val);
+
+	val = mt7530_read(priv, MT7531_PHYA_CTRL_SIGNAL3(port));
+	val &= ~MT7531_RG_TPHY_SPEED_MASK;
+	if (state->interface == PHY_INTERFACE_MODE_2500BASEX)
+		val |= MT7531_RG_TPHY_SPEED_3_125G;
+	mt7530_write(priv, MT7531_PHYA_CTRL_SIGNAL3(port), val);
+
+	val = mt7530_read(priv, MT7531_PCS_CONTROL_1(port));
+	val &= ~MT7531_SGMII_AN_ENABLE;
+	mt7530_write(priv, MT7531_PCS_CONTROL_1(port), val);
+
+	val = mt7530_read(priv, MT7531_SGMII_MODE(port));
+	val &= ~MT7531_SGMII_IF_MODE_MASK;
+
+	switch (state->speed) {
+	case SPEED_10:
+		val |= MT7531_SGMII_FORCE_SPEED_10;
+		break;
+	case SPEED_100:
+		val |= MT7531_SGMII_FORCE_SPEED_100;
+		break;
+	case SPEED_2500:
+	case SPEED_1000:
+		val |= MT7531_SGMII_FORCE_SPEED_1000;
+		break;
+	};
+
+	val &= ~MT7531_SGMII_FORCE_DUPLEX;
+	/* For sgmii force mode, 0 is full duplex and 1 is half duplex */
+	if (state->duplex == DUPLEX_HALF)
+		val |= MT7531_SGMII_FORCE_DUPLEX;
+
+	mt7530_write(priv, MT7531_SGMII_MODE(port), val);
+
+	val = mt7530_read(priv, MT7531_QPHY_PWR_STATE_CTRL(port));
+	val &= ~MT7531_SGMII_PHYA_PWD;
+	mt7530_write(priv, MT7531_QPHY_PWR_STATE_CTRL(port), val);
+
+	return 0;
+}
+
+static int mt7531_sgmii_setup_mode_an(struct mt7530_priv *priv, int port,
+				      const struct phylink_link_state *state)
+{
+	u32 val;
+
+	if (port != 5 && port != 6)
+		return -EINVAL;
+
+	val = mt7530_read(priv, MT7531_QPHY_PWR_STATE_CTRL(port));
+	val |= MT7531_SGMII_PHYA_PWD;
+	mt7530_write(priv, MT7531_QPHY_PWR_STATE_CTRL(port), val);
+
+	switch (state->speed) {
+	case SPEED_10:
+	case SPEED_100:
+	case SPEED_1000:
+		val = mt7530_read(priv, MT7531_PHYA_CTRL_SIGNAL3(port));
+		val &= ~MT7531_RG_TPHY_SPEED_MASK;
+		mt7530_write(priv, MT7531_PHYA_CTRL_SIGNAL3(port), val);
+		break;
+	default:
+		dev_info(priv->dev, "invalid SGMII speed idx %d for port %d\n",
+			 state->speed, port);
+
+		return -EINVAL;
+	}
+
+	val = mt7530_read(priv, MT7531_SGMII_MODE(port));
+	val |= MT7531_SGMII_REMOTE_FAULT_DIS;
+	mt7530_write(priv, MT7531_SGMII_MODE(port), val);
+
+	val = mt7530_read(priv, MT7531_PCS_CONTROL_1(port));
+	val |= MT7531_SGMII_AN_RESTART;
+	mt7530_write(priv, MT7531_PCS_CONTROL_1(port), val);
+
+	val = mt7530_read(priv, MT7531_QPHY_PWR_STATE_CTRL(port));
+	val &= ~MT7531_SGMII_PHYA_PWD;
+	mt7530_write(priv, MT7531_QPHY_PWR_STATE_CTRL(port), val);
+
+	return 0;
+}
+
+static int
+mt7531_mac_setup(struct dsa_switch *ds, int port, unsigned int mode,
+		 const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	if (port < 5 || port >= MT7530_NUM_PORTS) {
+		dev_err(priv->dev, "port %d is not a MAC port\n", port);
+		return -EINVAL;
+	}
+
+	switch (state->interface) {
+	case PHY_INTERFACE_MODE_RGMII:
+		return mt7531_rgmii_setup(priv, port);
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return mt7531_sgmii_setup_mode_force(priv, port, state);
+	case PHY_INTERFACE_MODE_SGMII:
+		return mt7531_sgmii_setup_mode_an(priv, port, state);
+	default:
+		return -EINVAL;
+	}
+}
+
 static int mt753x_mac_setup(struct dsa_switch *ds, int port, unsigned int mode,
 			    const struct phylink_link_state *state)
 {
@@ -1501,6 +2083,8 @@ static void mt753x_phylink_mac_config(struct dsa_switch *ds, int port,
 		if (mt753x_mac_setup(ds, port, mode, state) < 0)
 			goto unsupported;
 
+		priv->p5_interface = state->interface;
+
 		break;
 	case 6: /* 1st cpu port */
 		if (priv->p6_interface == state->interface)
@@ -1515,11 +2099,11 @@ static void mt753x_phylink_mac_config(struct dsa_switch *ds, int port,
 		break;
 	default:
 unsupported:
-		dev_err(ds->dev, "%s: unsupported port: %i\n", __func__, port);
 		return;
 	}
 
-	if (phylink_autoneg_inband(mode)) {
+	if (phylink_autoneg_inband(mode) &&
+	    state->interface != PHY_INTERFACE_MODE_SGMII) {
 		dev_err(ds->dev, "%s: in-band negotiation unsupported\n",
 			__func__);
 		return;
@@ -1530,13 +2114,15 @@ static void mt753x_phylink_mac_config(struct dsa_switch *ds, int port,
 	mcr_new &= ~(PMCR_FORCE_SPEED_1000 | PMCR_FORCE_SPEED_100 |
 		     PMCR_FORCE_FDX | PMCR_TX_FC_EN | PMCR_RX_FC_EN);
 	mcr_new |= PMCR_IFG_XMIT(1) | PMCR_MAC_MODE | PMCR_BACKOFF_EN |
-		   PMCR_BACKPR_EN | PMCR_FORCE_MODE | PMCR_FORCE_LNK;
+		   PMCR_BACKPR_EN | PMCR_FORCE_MODE_ID(priv->id) |
+		   PMCR_FORCE_LNK;
 
 	/* Are we connected to external phy */
 	if (port == 5 && dsa_is_user_port(ds, 5))
 		mcr_new |= PMCR_EXT_PHY;
 
 	switch (state->speed) {
+	case SPEED_2500:
 	case SPEED_1000:
 		mcr_new |= PMCR_FORCE_SPEED_1000;
 		break;
@@ -1556,6 +2142,27 @@ static void mt753x_phylink_mac_config(struct dsa_switch *ds, int port,
 		mt7530_write(priv, MT7530_PMCR_P(port), mcr_new);
 }
 
+void mt7531_sgmii_restart_an(struct dsa_switch *ds, int port)
+{
+	struct mt7530_priv *priv = ds->priv;
+	u32 val;
+
+	val = mt7530_read(priv, MT7531_PCS_CONTROL_1(port));
+	val |= MT7531_SGMII_AN_RESTART;
+	mt7530_write(priv, MT7531_PCS_CONTROL_1(port), val);
+}
+
+static void
+mt753x_phylink_mac_an_restart(struct dsa_switch *ds, int port)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	if (!priv->info->port_an_restart)
+		return;
+
+	priv->info->port_an_restart(ds, port);
+}
+
 static void mt7530_phylink_mac_link_down(struct dsa_switch *ds, int port,
 					 unsigned int mode,
 					 phy_interface_t interface)
@@ -1590,9 +2197,20 @@ static void mt753x_phylink_validate(struct dsa_switch *ds, int port,
 	phylink_set_port_modes(mask);
 	phylink_set(mask, Autoneg);
 
-	if (state->interface == PHY_INTERFACE_MODE_TRGMII) {
+	switch (state->interface) {
+	case PHY_INTERFACE_MODE_TRGMII:
 		phylink_set(mask, 1000baseT_Full);
-	} else {
+		break;
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		phylink_set(mask, 1000baseX_Full);
+		phylink_set(mask, 2500baseX_Full);
+		break;
+	case PHY_INTERFACE_MODE_SGMII:
+		phylink_set(mask, 1000baseT_Full);
+		phylink_set(mask, 1000baseX_Full);
+		/* fall through */
+	default:
 		phylink_set(mask, 10baseT_Half);
 		phylink_set(mask, 10baseT_Full);
 		phylink_set(mask, 100baseT_Half);
@@ -1604,6 +2222,7 @@ static void mt753x_phylink_validate(struct dsa_switch *ds, int port,
 			if (port == 5)
 				phylink_set(mask, 1000baseX_Full);
 		}
+		break;
 	}
 
 	phylink_set(mask, Pause);
@@ -1698,8 +2317,9 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.port_vlan_add		= mt7530_port_vlan_add,
 	.port_vlan_del		= mt7530_port_vlan_del,
 	.phylink_validate	= mt753x_phylink_validate,
-	.phylink_mac_link_state = mt7530_phylink_mac_link_state,
+	.phylink_mac_link_state	= mt7530_phylink_mac_link_state,
 	.phylink_mac_config	= mt753x_phylink_mac_config,
+	.phylink_mac_an_restart	= mt753x_phylink_mac_an_restart,
 	.phylink_mac_link_down	= mt7530_phylink_mac_link_down,
 	.phylink_mac_link_up	= mt7530_phylink_mac_link_up,
 };
@@ -1723,11 +2343,22 @@ static const struct mt753x_info mt753x_table[] = {
 		.pad_setup = mt7530_pad_setup,
 		.mac_setup = mt7530_mac_setup,
 	},
+	[ID_MT7531] = {
+		.id = ID_MT7531,
+		.setup = mt7531_setup,
+		.phy_read = mt7531_ind_phy_read,
+		.phy_write = mt7531_ind_phy_write,
+		.phy_supported = mt7531_phy_supported,
+		.pad_setup = mt7531_pad_setup,
+		.mac_setup = mt7531_mac_setup,
+		.port_an_restart = mt7531_sgmii_restart_an,
+	},
 };
 
 static const struct of_device_id mt7530_of_match[] = {
 	{ .compatible = "mediatek,mt7621", .data = &mt753x_table[ID_MT7621], },
 	{ .compatible = "mediatek,mt7530", .data = &mt753x_table[ID_MT7530], },
+	{ .compatible = "mediatek,mt7531", .data = &mt753x_table[ID_MT7531], },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mt7530_of_match);
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index aac86e4fc148..557328c6c032 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -14,6 +14,7 @@
 enum mt753x_id {
 	ID_MT7530 = 0,
 	ID_MT7621 = 1,
+	ID_MT7531 = 2,
 };
 
 #define	NUM_TRGMII_CTRL			5
@@ -201,6 +202,19 @@ enum mt7530_vlan_port_attr {
 #define  PMCR_FORCE_LNK			BIT(0)
 #define  PMCR_SPEED_MASK		(PMCR_FORCE_SPEED_100 | \
 					 PMCR_FORCE_SPEED_1000)
+#define  MT7531_FORCE_LNK		BIT(31)
+#define  MT7531_FORCE_SPD		BIT(30)
+#define  MT7531_FORCE_DPX		BIT(29)
+#define  MT7531_FORCE_RX_FC		BIT(28)
+#define  MT7531_FORCE_TX_FC		BIT(27)
+#define  MT7531_FORCE_MODE		(MT7531_FORCE_LNK | \
+					 MT7531_FORCE_SPD | \
+					 MT7531_FORCE_DPX | \
+					 MT7531_FORCE_RX_FC | \
+					 MT7531_FORCE_TX_FC)
+#define  PMCR_FORCE_MODE_ID(id)		(((id) == ID_MT7531) ? \
+					 MT7531_FORCE_MODE : \
+					 PMCR_FORCE_MODE)
 
 #define MT7530_PMSR_P(x)		(0x3008 + (x) * 0x100)
 #define  PMSR_EEE1G			BIT(7)
@@ -231,12 +245,111 @@ enum mt7530_vlan_port_attr {
 					 CCR_RX_OCT_CNT_BAD | \
 					 CCR_TX_OCT_CNT_GOOD | \
 					 CCR_TX_OCT_CNT_BAD)
+
+/* SGMII registers */
+#define MT7531_SGMII_REG_BASE		0x5000
+#define MT7531_SGMII_REG(p, r)		(MT7531_SGMII_REG_BASE + \
+					((p) - 5) * 0x1000 + (r))
+
+/* SGMII PCS_CONTROL_1 */
+#define MT7531_PCS_CONTROL_1(p)		MT7531_SGMII_REG(p, 0x00)
+#define  MT7531_SGMII_LINK_STATUS	BIT(18)
+#define  MT7531_SGMII_AN_ENABLE		BIT(12)
+#define  MT7531_SGMII_AN_RESTART	BIT(9)
+
+/* Fields of SGMII_MODE */
+#define MT7531_SGMII_MODE(p)		MT7531_SGMII_REG(p, 0x20)
+#define  MT7531_SGMII_REMOTE_FAULT_DIS	BIT(8)
+#define  MT7531_SGMII_FORCE_DUPLEX	BIT(4)
+#define  MT7531_SGMII_IF_MODE_MASK	GENMASK(5, 1)
+#define  MT7531_SGMII_FORCE_SPEED_10	0x0
+#define  MT7531_SGMII_FORCE_SPEED_100	BIT(2)
+#define  MT7531_SGMII_FORCE_SPEED_1000	BIT(3)
+
+/* Fields of QPHY_PWR_STATE_CTRL */
+#define MT7531_QPHY_PWR_STATE_CTRL(p)	MT7531_SGMII_REG(p, 0xe8)
+#define  MT7531_SGMII_PHYA_PWD		BIT(4)
+
+/* Values of SGMII SPEED */
+#define MT7531_PHYA_CTRL_SIGNAL3(p)	MT7531_SGMII_REG(p, 0x128)
+#define  MT7531_RG_TPHY_SPEED_MASK	(BIT(2) | BIT(3))
+#define  MT7531_RG_TPHY_SPEED_1_25G	0x0
+#define  MT7531_RG_TPHY_SPEED_3_125G	BIT(2)
+
 /* Register for system reset */
 #define MT7530_SYS_CTRL			0x7000
 #define  SYS_CTRL_PHY_RST		BIT(2)
 #define  SYS_CTRL_SW_RST		BIT(1)
 #define  SYS_CTRL_REG_RST		BIT(0)
 
+/* Register for PHY Indirect Access Control */
+#define MT7531_PHY_IAC			0x701C
+#define  PHY_ACS_ST			BIT(31)
+#define  MDIO_REG_ADDR_MASK		(0x1f << 25)
+#define  MDIO_PHY_ADDR_MASK		(0x1f << 20)
+#define  MDIO_CMD_MASK			(0x3 << 18)
+#define  MDIO_ST_MASK			(0x3 << 16)
+#define  MDIO_RW_DATA_MASK		(0xffff)
+#define  MDIO_REG_ADDR(x)		(((x) & 0x1f) << 25)
+#define  MDIO_DEV_ADDR(x)		(((x) & 0x1f) << 25)
+#define  MDIO_PHY_ADDR(x)		(((x) & 0x1f) << 20)
+#define  MDIO_CMD(x)			(((x) & 0x3) << 18)
+#define  MDIO_ST(x)			(((x) & 0x3) << 16)
+
+enum mt7531_phy_iac_cmd {
+	MT7531_MDIO_ADDR = 0,
+	MT7531_MDIO_WRITE = 1,
+	MT7531_MDIO_READ = 2,
+	MT7531_MDIO_READ_CL45 = 3,
+};
+
+/* MDIO_ST: MDIO start field */
+enum mt7531_mdio_st {
+	MT7531_MDIO_ST_CL45 = 0,
+	MT7531_MDIO_ST_CL22 = 1,
+};
+
+#define  MDIO_CL22_READ			(MDIO_ST(MT7531_MDIO_ST_CL22) | \
+					 MDIO_CMD(MT7531_MDIO_READ))
+#define  MDIO_CL22_WRITE		(MDIO_ST(MT7531_MDIO_ST_CL22) | \
+					 MDIO_CMD(MT7531_MDIO_WRITE))
+#define  MDIO_CL45_ADDR			(MDIO_ST(MT7531_MDIO_ST_CL45) | \
+					 MDIO_CMD(MT7531_MDIO_ADDR))
+#define  MDIO_CL45_READ			(MDIO_ST(MT7531_MDIO_ST_CL45) | \
+					 MDIO_CMD(MT7531_MDIO_READ))
+#define  MDIO_CL45_WRITE		(MDIO_ST(MT7531_MDIO_ST_CL45) | \
+					 MDIO_CMD(MT7531_MDIO_WRITE))
+
+#define MT7531_CLKGEN_CTRL		0x7500
+#define  CLK_SKEW_OUT(x)		(((x) & 0x3) << 8)
+#define  CLK_SKEW_OUT_MASK		(0x3 << 8)
+#define  CLK_SKEW_IN(x)			(((x) & 0x3) << 6)
+#define  CLK_SKEW_IN_MASK		(0x3 << 6)
+#define  RXCLK_NO_DELAY			BIT(5)
+#define  TXCLK_NO_REVERSE		BIT(4)
+#define  GP_MODE(x)			(((x) & 0x3) << 1)
+#define  GP_MODE_MASK			(0x3 << 1)
+#define  GP_CLK_EN			BIT(0)
+
+#define PHY_DEV1F			0x1f
+#define MT7531_PHY_DEV1F_REG_403	0x403
+
+#define MT7531_PHY_EN_BYPASS_MODE	BIT(4)
+#define MT7531_PHY_POWER_OFF		BIT(5)
+
+enum mt7531_gp_mode {
+	MT7531_GP_MODE_RGMII = 0,
+	MT7531_GP_MODE_MII = 1,
+	MT7531_GP_MODE_REV_MII = 2
+};
+
+enum mt7531_clk_skew {
+	MT7531_CLK_SKEW_NO_CHG = 0,
+	MT7531_CLK_SKEW_DLY_100PPS = 1,
+	MT7531_CLK_SKEW_DLY_200PPS = 2,
+	MT7531_CLK_SKEW_REVERSE = 3,
+};
+
 /* Register for hw trap status */
 #define MT7530_HWTRAP			0x7800
 #define  HWTRAP_XTAL_MASK		(BIT(10) | BIT(9))
@@ -244,6 +357,11 @@ enum mt7530_vlan_port_attr {
 #define  HWTRAP_XTAL_40MHZ		(BIT(10))
 #define  HWTRAP_XTAL_20MHZ		(BIT(9))
 
+#define MT7531_HWTRAP			0x7800
+#define  HWTRAP_XTAL_FSEL_MASK		BIT(7)
+#define  HWTRAP_XTAL_FSEL_25MHZ		BIT(7)
+#define  HWTRAP_XTAL_FSEL_40MHZ		0
+
 /* Register for hw trap modification */
 #define MT7530_MHWTRAP			0x7804
 #define  MHWTRAP_PHY0_SEL		BIT(20)
@@ -258,14 +376,34 @@ enum mt7530_vlan_port_attr {
 #define MT7530_TOP_SIG_CTRL		0x7808
 #define  TOP_SIG_CTRL_NORMAL		(BIT(17) | BIT(16))
 
+#define MT7531_TOP_SIG_SR		0x780c
+#define  PAD_DUAL_SGMII_EN		BIT(1)
+
 #define MT7530_IO_DRV_CR		0x7810
 #define  P5_IO_CLK_DRV(x)		((x) & 0x3)
 #define  P5_IO_DATA_DRV(x)		(((x) & 0x3) << 4)
 
+#define MT7531_PLLGP_EN			0x7820
+#define  EN_COREPLL			BIT(2)
+#define  SW_CLKSW			BIT(1)
+#define  SW_PLLGP			BIT(0)
+
+#define MT7531_PLLGP_CR0		0x78a8
+#define  RG_COREPLL_EN			BIT(22)
+#define  RG_COREPLL_POSDIV_S		23
+#define  RG_COREPLL_POSDIV_M		0x3800000
+#define  RG_COREPLL_SDM_PCW_S		1
+#define  RG_COREPLL_SDM_PCW_M		0x3ffffe
+#define  RG_COREPLL_SDM_PCW_CHG		BIT(0)
+
 #define MT7530_P6ECR			0x7830
 #define  P6_INTF_MODE_MASK		0x3
 #define  P6_INTF_MODE(x)		((x) & 0x3)
 
+/* RGMII and SGMII PLL clock */
+#define MT7531_ANA_PLLGP_CR2		0x78b0
+#define MT7531_ANA_PLLGP_CR5		0x78bc
+
 /* Registers for TRGMII on the both side */
 #define MT7530_TRGMII_RCK_CTRL		0x7a00
 #define GSW_TRGMII_RCK_CTRL		0x300
@@ -316,6 +454,9 @@ enum mt7530_vlan_port_attr {
 #define  CHIP_NAME_SHIFT		16
 #define  MT7530_ID			0x7530
 
+#define MT7531_CREV			0x781C
+#define  MT7531_ID			0x7531
+
 /* Registers for core PLL access through mmd indirect */
 #define CORE_PLL_GROUP2			0x401
 #define  RG_SYSPLL_EN_NORMAL		BIT(15)
@@ -439,6 +580,8 @@ static const char *p5_intf_modes(unsigned int p5_interface)
  *			port
  * @mac_setup:		Holding the way setting up the PHY attribute for a
  *			certain MAC port
+ * @port_an_restart	Holding the way restarting 802.3z BaseX autonegotiation
+ *			for a certain MAC port
  */
 struct mt753x_info {
 	enum mt753x_id id;
@@ -452,6 +595,7 @@ struct mt753x_info {
 			 const struct phylink_link_state *state);
 	int (*mac_setup)(struct dsa_switch *ds, int port, unsigned int mode,
 			 const struct phylink_link_state *state);
+	void (*port_an_restart)(struct dsa_switch *ds, int port);
 };
 
 /* struct mt7530_priv -	This is the main data structure for holding the state
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
