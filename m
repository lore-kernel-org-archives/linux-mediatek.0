Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBE4C678DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Mar 2023 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TK2MYOnEUQpy9DHBWwxhfWhmIIBNaRPdmCBmE+mQxdE=; b=AeIVZTj/kmyJa8
	oCYEZwo0zwJ3lctq4xyMpO4BVobgZwxQAu8DkqKyq29NE5CF5+FxBFziL2NQ1IGhKxYJY/sxp3KGc
	ca6L+A42bfeUEX2RXFiXbcsrm6C5hcoUEltWBWG9lseAKxUPbmoPyCKFtuOuueirPh5thAz4ov//l
	gbgB8VCZlTtA9wfagJefgeM7l9lty4GRXEJ8/e5Vf6CpjVc39zxg3Zr+evRjpJgyHNSodBEVwUgOS
	QAQeV7hJ9wzbo/f2UM8WAXmtCBQiJ0mMwaGAC2Tymvd1BRWF3m3PxMrcQ6kN3P23+yUDhHLAk4P6y
	gs9ECErIz95FKtvnDckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYRS5-008yYR-Vi; Sat, 04 Mar 2023 12:57:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYRRu-008yWh-Bg; Sat, 04 Mar 2023 12:57:20 +0000
Received: by mail-ed1-x52d.google.com with SMTP id g3so20763452eda.1;
        Sat, 04 Mar 2023 04:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677934634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TK2MYOnEUQpy9DHBWwxhfWhmIIBNaRPdmCBmE+mQxdE=;
        b=Ktlx34INoxQJChnZoahZyYBZgS6bKR33ULaJdQcKaHCqU1Nbnr9RXv/ytQyP0ajR0V
         cGBzgxH3Cwv9XkYRdYM3iQPggFV1VDbuVXwpFw6iyARrJ/uWTv7VUCvguXRfWuAvAlJ7
         Ak0aBOov6M5n1glfYP/BUfF6oeuZ0G8WtBtYgkN4/hqRQiuC/+D8jW8egGMzJbwtphk7
         rAsdJ7qaMZX8wFL3PVdZGLYq/XGEiJFwvqp3hJweoGNdisFNYOtE5H17ABu89XGUQoyO
         GK+N8SVLJjoWv3mpXv1CE9OSRfGISbxvne6snfhCGnRi+kG1sUQ/Sl5OSjOM0+eMfCmZ
         Nnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677934634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TK2MYOnEUQpy9DHBWwxhfWhmIIBNaRPdmCBmE+mQxdE=;
        b=qZU6lGFzt+PPOpo8Bd9nbnQIT7p0Q7MvrEVInDky2ejplHieG3QbjcekTuM8EzPwXY
         lM1ztKiyRyuyqOn59DZ11Q9ESoYL2soogCgdaCnIjhq6FPIA8yw+IL3LC/yLX3iB94ci
         3ng3qNWCnFWQL0ywR+gO3CCCBw8ixMh7K2tWgTUBGW/8PjGadali19SR2BQLXJT6a59Q
         UstZZAKXX3bt+d/60+jhIdk7Wkq96F6yw/4eem/wqQ1GSt3clFrCA3F4Tn5/if7OFH8E
         iPG/qcK7AnC3ZQJjZAyEIkEAmkG5xhmZ9uF8ehr7EYsGc/ZrV6fqKLrtYsIbEVQvC2Bp
         isww==
X-Gm-Message-State: AO0yUKVHptiwP7wNRtuZ4xUeubQ/ldcaXp8SXb4axWh8jnWq1VgCycwo
	Z7r6ZU4/l8ER+YGU0rGhFOs=
X-Google-Smtp-Source: AK7set+CELKl5rQ79SAC1Y9zMtUPGTbxR3AHVjzIrpsBc0fAIo5OjhGRIY//jGmXdTwemLo+uw5ZXA==
X-Received: by 2002:a17:907:8e9a:b0:86a:833d:e7d8 with SMTP id tx26-20020a1709078e9a00b0086a833de7d8mr5455768ejc.17.1677934633927;
        Sat, 04 Mar 2023 04:57:13 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v7-20020a170906338700b008e51a1fd7bfsm2064308eja.172.2023.03.04.04.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 04:57:13 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [RFC PATCH net] net: dsa: mt7530: move PLL setup out of port 6 pad configuration
Date: Sat,  4 Mar 2023 15:54:54 +0300
Message-Id: <20230304125453.53476-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_045718_486042_6B316A2E 
X-CRM114-Status: GOOD (  22.53  )
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
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>, Russell King <rmk+kernel@armlinux.org.uk>, Alexander Couzens <lynxis@fe80.eu>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Move the PLL setup of the MT7530 switch out of the pad configuration of
port 6 to mt7530_setup, after reset.

This fixes the improper initialisation of the switch when only port 5 is
used as a CPU port.

Add supported phy modes of port 5 on the PLL setup.

Remove now incorrect comment regarding P5 as GMAC5.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

I'm trying to mimic this change by Alexander [0] for the MT7530 switch.
This is already the case for MT7530 and MT7531 on the MediaTek ethernet
driver on U-Boot [1] [2].

[0] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=42bc4fafe359ed6b73602b7a2dba0dd99588f8ce
[1] https://github.com/u-boot/u-boot/blob/a94ab561e2f49a80d8579930e840b810ab1a1330/drivers/net/mtk_eth.c#L729
[2] https://github.com/u-boot/u-boot/blob/a94ab561e2f49a80d8579930e840b810ab1a1330/drivers/net/mtk_eth.c#L903

There are some parts I couldn't figure out myself with my limited C
knowledge. I've pointed them out on the code. Vladimir, could you help?

There is a lot of code which is only needed for port 6 or trgmii on port 6,
but runs whether port 6 or trgmii is used or not. For now, the best I can
do is to fix port 5 so it works without port 6 being used.

The U-Boot driver seems to be much more organised so it could be taken as
a reference to sort out this DSA driver further.

Also, now that the pad setup for mt7530 is also moved somewhere else, can
we completely get rid of @pad_setup?

Arınç

---
 drivers/net/dsa/mt7530.c | 46 +++++++++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 0e99de26d159..fb20ce4f443e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -395,9 +395,8 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
 
 /* Setup TX circuit including relevant PAD and driving */
 static int
-mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+mt7530_pad_clk_setup(struct mt7530_priv *priv, phy_interface_t interface)
 {
-	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, i, xtal;
 
 	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
@@ -409,9 +408,32 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		return -EINVAL;
 	}
 
+	/* Is setting trgint to 0 really needed for the !trgint check? */
+	trgint = 0;
+
+	/* FIXME: run this switch if p5 is defined on the devicetree */
+	/* and change interface to the phy-mode of port 5 */
+	switch (interface) {
+	case PHY_INTERFACE_MODE_GMII:
+		/* PLL frequency: 125MHz */
+		ncpo1 = 0x0c80;
+		break;
+	case PHY_INTERFACE_MODE_MII:
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+		/* PLL frequency: 125MHz */
+		ncpo1 = 0x0c80;
+		break;
+	default:
+		dev_err(priv->dev, "xMII interface %d not supported\n",
+			interface);
+		return -EINVAL;
+	}
+
+	/* FIXME: run this switch if p6 is defined on the devicetree */
+	/* and change interface to the phy-mode of port 6 */
 	switch (interface) {
 	case PHY_INTERFACE_MODE_RGMII:
-		trgint = 0;
 		/* PLL frequency: 125MHz */
 		ncpo1 = 0x0c80;
 		break;
@@ -2172,7 +2194,11 @@ mt7530_setup(struct dsa_switch *ds)
 		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
 		     SYS_CTRL_REG_RST);
 
-	/* Enable Port 6 only; P5 as GMAC5 which currently is not supported */
+	/* Setup switch core pll */
+	/* FIXME: feed the phy-mode of port 5 and 6, if the ports are defined on the devicetree */
+	mt7530_pad_clk_setup(priv, interface);
+
+	/* Enable Port 6 */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
@@ -2491,11 +2517,9 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 }
 
 static int
-mt753x_pad_setup(struct dsa_switch *ds, const struct phylink_link_state *state)
+mt7530_pad_setup(struct dsa_switch *ds, phy_interface_t interface)
 {
-	struct mt7530_priv *priv = ds->priv;
-
-	return priv->info->pad_setup(ds, state->interface);
+	return 0;
 }
 
 static int
@@ -2769,8 +2793,6 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		if (priv->p6_interface == state->interface)
 			break;
 
-		mt753x_pad_setup(ds, state);
-
 		if (mt753x_mac_config(ds, port, mode, state) < 0)
 			goto unsupported;
 
@@ -3187,7 +3209,7 @@ static const struct mt753x_info mt753x_table[] = {
 		.phy_write_c22 = mt7530_phy_write_c22,
 		.phy_read_c45 = mt7530_phy_read_c45,
 		.phy_write_c45 = mt7530_phy_write_c45,
-		.pad_setup = mt7530_pad_clk_setup,
+		.pad_setup = mt7530_pad_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
 		.mac_port_config = mt7530_mac_config,
 	},
@@ -3199,7 +3221,7 @@ static const struct mt753x_info mt753x_table[] = {
 		.phy_write_c22 = mt7530_phy_write_c22,
 		.phy_read_c45 = mt7530_phy_read_c45,
 		.phy_write_c45 = mt7530_phy_write_c45,
-		.pad_setup = mt7530_pad_clk_setup,
+		.pad_setup = mt7530_pad_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
 		.mac_port_config = mt7530_mac_config,
 	},
-- 
2.37.2


