Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E80C46467
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 23:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HenFeMJJHR8jOxjl7oLQQnysEHe4M2/BX8/WSa6lrOA=; b=wUSkFMUfQFSpysr8u75NfrAWYa
	mneubTrqGdyEI0lejeFrBoc8A+rN1iHQIJY+ZhmgIx9JCj6BbdQeG5urSQR/O2uMyYhhkcZij8pnr
	gpVGGMAe40tIfuVVFA+/N3mekg1jbV8jqX124TYG7KjJoBRM9si/MNe/O9kX8W+1R7zWpf3olevbI
	imT5T+vS6ERPYxmid/mxWJQg16WaIAUnXsQ3uCuc3SWUsdi2Jo5iwu77Yfu90z+bvz0Cemf63AkRI
	G9e/HGHFsv+IenfW8ZMCF1poGpL0fHzHhyZopmw8xzGITmb8oEZfIqf3Iw3odmWNzR+6fMwXGu204
	ecS2PHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJCR-00HB3G-1E; Tue, 27 Dec 2022 23:17:35 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJ2i-00H6U4-Uk; Tue, 27 Dec 2022 23:07:37 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0A70416E2;
	Wed, 28 Dec 2022 00:07:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1672182448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HenFeMJJHR8jOxjl7oLQQnysEHe4M2/BX8/WSa6lrOA=;
	b=DlENZoXaTXR+4O5KCi8ja8pPuN6LAX0jrjx4eXQ8np0YGdJTAdomcUVXYvjJJtnTE9d2Ck
	lTWUh4x+GFmWDLMwv8kjp4hTtV8UBZXZjtJ3qrbXAQfU/ytp0xKhiWa8V9qR2crFswImW0
	6nHjUiKNfZr51h01XVNFdVxis4cNyVvbzdNP6eWKUpQ0yjtk9Ew4fHpHoxiD3UlVPy2P0A
	+dS3RO3dwUR2KzRjqYOEmFDmqi5VjPseZdAIMxPAxsNkGnr6udgZhd3keSAks3CmqHhzLz
	MjcNIXbDL+uxU6HAFYQvcenoVKBPi0MXlU1OdQOf8D4WQwGhB1StdM06jXZyAQ==
From: Michael Walle <michael@walle.cc>
Date: Wed, 28 Dec 2022 00:07:22 +0100
Subject: [PATCH RFC net-next v2 06/12] net: mdio: mdio-bitbang: Separate C22
 and C45 transactions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221227-v6-2-rc1-c45-seperation-v2-6-ddb37710e5a7@walle.cc>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <michael@walle.cc>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_150733_226868_5D8FFFA3 
X-CRM114-Status: GOOD (  16.85  )
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

From: Andrew Lunn <andrew@lunn.ch>

The bitbbanging bus driver can perform both C22 and C45 transfers.
Create separate functions for each and register the C45 versions using
the new driver API calls.

The SH Ethernet driver places wrappers around these functions. In
order to not break boards which might be using C45, add similar
wrappers for C45 operations.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/ethernet/renesas/sh_eth.c | 37 ++++++++++++++---
 drivers/net/mdio/mdio-bitbang.c       | 77 +++++++++++++++++++++++------------
 include/linux/mdio-bitbang.h          |  6 ++-
 3 files changed, 87 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 71a499113308..ed17163d7811 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -3044,23 +3044,46 @@ static int sh_mdio_release(struct sh_eth_private *mdp)
 	return 0;
 }
 
-static int sh_mdiobb_read(struct mii_bus *bus, int phy, int reg)
+static int sh_mdiobb_read_c22(struct mii_bus *bus, int phy, int reg)
 {
 	int res;
 
 	pm_runtime_get_sync(bus->parent);
-	res = mdiobb_read(bus, phy, reg);
+	res = mdiobb_read_c22(bus, phy, reg);
 	pm_runtime_put(bus->parent);
 
 	return res;
 }
 
-static int sh_mdiobb_write(struct mii_bus *bus, int phy, int reg, u16 val)
+static int sh_mdiobb_write_c22(struct mii_bus *bus, int phy, int reg, u16 val)
 {
 	int res;
 
 	pm_runtime_get_sync(bus->parent);
-	res = mdiobb_write(bus, phy, reg, val);
+	res = mdiobb_write_c22(bus, phy, reg, val);
+	pm_runtime_put(bus->parent);
+
+	return res;
+}
+
+static int sh_mdiobb_read_c45(struct mii_bus *bus, int phy, int devad, int reg)
+{
+	int res;
+
+	pm_runtime_get_sync(bus->parent);
+	res = mdiobb_read_c45(bus, phy, devad, reg);
+	pm_runtime_put(bus->parent);
+
+	return res;
+}
+
+static int sh_mdiobb_write_c45(struct mii_bus *bus, int phy, int devad,
+			       int reg, u16 val)
+{
+	int res;
+
+	pm_runtime_get_sync(bus->parent);
+	res = mdiobb_write_c45(bus, phy, devad, reg, val);
 	pm_runtime_put(bus->parent);
 
 	return res;
@@ -3091,8 +3114,10 @@ static int sh_mdio_init(struct sh_eth_private *mdp,
 		return -ENOMEM;
 
 	/* Wrap accessors with Runtime PM-aware ops */
-	mdp->mii_bus->read = sh_mdiobb_read;
-	mdp->mii_bus->write = sh_mdiobb_write;
+	mdp->mii_bus->read = sh_mdiobb_read_c22;
+	mdp->mii_bus->write = sh_mdiobb_write_c22;
+	mdp->mii_bus->read_c45 = sh_mdiobb_read_c45;
+	mdp->mii_bus->write_c45 = sh_mdiobb_write_c45;
 
 	/* Hook up MII support for ethtool */
 	mdp->mii_bus->name = "sh_mii";
diff --git a/drivers/net/mdio/mdio-bitbang.c b/drivers/net/mdio/mdio-bitbang.c
index 07609114a26b..b83932562be2 100644
--- a/drivers/net/mdio/mdio-bitbang.c
+++ b/drivers/net/mdio/mdio-bitbang.c
@@ -127,14 +127,12 @@ static void mdiobb_cmd(struct mdiobb_ctrl *ctrl, int op, u8 phy, u8 reg)
 
 /* In clause 45 mode all commands are prefixed by MDIO_ADDR to specify the
    lower 16 bits of the 21 bit address. This transfer is done identically to a
-   MDIO_WRITE except for a different code. To enable clause 45 mode or
-   MII_ADDR_C45 into the address. Theoretically clause 45 and normal devices
-   can exist on the same bus. Normal devices should ignore the MDIO_ADDR
+   MDIO_WRITE except for a different code. Theoretically clause 45 and normal
+   devices can exist on the same bus. Normal devices should ignore the MDIO_ADDR
    phase. */
-static int mdiobb_cmd_addr(struct mdiobb_ctrl *ctrl, int phy, u32 addr)
+static void mdiobb_cmd_addr(struct mdiobb_ctrl *ctrl, int phy, int dev_addr,
+			    int reg)
 {
-	unsigned int dev_addr = (addr >> 16) & 0x1F;
-	unsigned int reg = addr & 0xFFFF;
 	mdiobb_cmd(ctrl, MDIO_C45_ADDR, phy, dev_addr);
 
 	/* send the turnaround (10) */
@@ -145,21 +143,13 @@ static int mdiobb_cmd_addr(struct mdiobb_ctrl *ctrl, int phy, u32 addr)
 
 	ctrl->ops->set_mdio_dir(ctrl, 0);
 	mdiobb_get_bit(ctrl);
-
-	return dev_addr;
 }
 
-int mdiobb_read(struct mii_bus *bus, int phy, int reg)
+static int mdiobb_read_common(struct mii_bus *bus, int phy)
 {
 	struct mdiobb_ctrl *ctrl = bus->priv;
 	int ret, i;
 
-	if (reg & MII_ADDR_C45) {
-		reg = mdiobb_cmd_addr(ctrl, phy, reg);
-		mdiobb_cmd(ctrl, MDIO_C45_READ, phy, reg);
-	} else
-		mdiobb_cmd(ctrl, ctrl->op_c22_read, phy, reg);
-
 	ctrl->ops->set_mdio_dir(ctrl, 0);
 
 	/* check the turnaround bit: the PHY should be driving it to zero, if this
@@ -180,17 +170,31 @@ int mdiobb_read(struct mii_bus *bus, int phy, int reg)
 	mdiobb_get_bit(ctrl);
 	return ret;
 }
-EXPORT_SYMBOL(mdiobb_read);
 
-int mdiobb_write(struct mii_bus *bus, int phy, int reg, u16 val)
+int mdiobb_read_c22(struct mii_bus *bus, int phy, int reg)
 {
 	struct mdiobb_ctrl *ctrl = bus->priv;
 
-	if (reg & MII_ADDR_C45) {
-		reg = mdiobb_cmd_addr(ctrl, phy, reg);
-		mdiobb_cmd(ctrl, MDIO_C45_WRITE, phy, reg);
-	} else
-		mdiobb_cmd(ctrl, ctrl->op_c22_write, phy, reg);
+	mdiobb_cmd(ctrl, ctrl->op_c22_read, phy, reg);
+
+	return mdiobb_read_common(bus, phy);
+}
+EXPORT_SYMBOL(mdiobb_read_c22);
+
+int mdiobb_read_c45(struct mii_bus *bus, int phy, int devad, int reg)
+{
+	struct mdiobb_ctrl *ctrl = bus->priv;
+
+	mdiobb_cmd_addr(ctrl, phy, devad, reg);
+	mdiobb_cmd(ctrl, MDIO_C45_READ, phy, reg);
+
+	return mdiobb_read_common(bus, phy);
+}
+EXPORT_SYMBOL(mdiobb_read_c45);
+
+static int mdiobb_write_common(struct mii_bus *bus, u16 val)
+{
+	struct mdiobb_ctrl *ctrl = bus->priv;
 
 	/* send the turnaround (10) */
 	mdiobb_send_bit(ctrl, 1);
@@ -202,7 +206,27 @@ int mdiobb_write(struct mii_bus *bus, int phy, int reg, u16 val)
 	mdiobb_get_bit(ctrl);
 	return 0;
 }
-EXPORT_SYMBOL(mdiobb_write);
+
+int mdiobb_write_c22(struct mii_bus *bus, int phy, int reg, u16 val)
+{
+	struct mdiobb_ctrl *ctrl = bus->priv;
+
+	mdiobb_cmd(ctrl, ctrl->op_c22_write, phy, reg);
+
+	return mdiobb_write_common(bus, val);
+}
+EXPORT_SYMBOL(mdiobb_write_c22);
+
+int mdiobb_write_c45(struct mii_bus *bus, int phy, int devad, int reg, u16 val)
+{
+	struct mdiobb_ctrl *ctrl = bus->priv;
+
+	mdiobb_cmd_addr(ctrl, phy, devad, reg);
+	mdiobb_cmd(ctrl, MDIO_C45_WRITE, phy, reg);
+
+	return mdiobb_write_common(bus, val);
+}
+EXPORT_SYMBOL(mdiobb_write_c45);
 
 struct mii_bus *alloc_mdio_bitbang(struct mdiobb_ctrl *ctrl)
 {
@@ -214,8 +238,11 @@ struct mii_bus *alloc_mdio_bitbang(struct mdiobb_ctrl *ctrl)
 
 	__module_get(ctrl->ops->owner);
 
-	bus->read = mdiobb_read;
-	bus->write = mdiobb_write;
+	bus->read = mdiobb_read_c22;
+	bus->write = mdiobb_write_c22;
+	bus->read_c45 = mdiobb_read_c45;
+	bus->write_c45 = mdiobb_write_c45;
+
 	bus->priv = ctrl;
 	if (!ctrl->override_op_c22) {
 		ctrl->op_c22_read = MDIO_READ;
diff --git a/include/linux/mdio-bitbang.h b/include/linux/mdio-bitbang.h
index 373630fe5c28..cffabdbce075 100644
--- a/include/linux/mdio-bitbang.h
+++ b/include/linux/mdio-bitbang.h
@@ -38,8 +38,10 @@ struct mdiobb_ctrl {
 	u8 op_c22_write;
 };
 
-int mdiobb_read(struct mii_bus *bus, int phy, int reg);
-int mdiobb_write(struct mii_bus *bus, int phy, int reg, u16 val);
+int mdiobb_read_c22(struct mii_bus *bus, int phy, int reg);
+int mdiobb_write_c22(struct mii_bus *bus, int phy, int reg, u16 val);
+int mdiobb_read_c45(struct mii_bus *bus, int devad, int phy, int reg);
+int mdiobb_write_c45(struct mii_bus *bus, int devad, int phy, int reg, u16 val);
 
 /* The returned bus is not yet registered with the phy layer. */
 struct mii_bus *alloc_mdio_bitbang(struct mdiobb_ctrl *ctrl);

-- 
2.30.2

