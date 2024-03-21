Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E61CC54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S37BRJRHUs0m9rmZYk8ZUm5BKpFpOo24Sstyet9sBCs=; b=1vGFyEOWoTXQSc4nvk+ylUFSL1
	pOyuVwsTuDwakoPnJrpIt112HwIBOsX5Ec6q8IRlsvIkk3ovRuV2dyv9qrNsE7G6Vr1XsbizMDyp+
	CWnOgorwQuWZOVD8ErunvRQqEdYfv/Ki+0YPddsF+OoNOz8XlkhoAFj9NR2mhX7U5xpd2o1xokpGh
	udLtmGqejL3HktJjlz2lswbYenIK0bnGg58eb2CdHO3t9jl/ExsjntkKIjsMV/lHF5Fvmz88Wio7v
	iKQud3YSboF6Ki69z9lNFXv7NPI/zAojsqdWf84zAXDcyUesNrIBWJcGde10c1dIEJwJBKUjKVHUT
	ogUDPRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnLIl-00000003moF-0Ozs;
	Thu, 21 Mar 2024 16:29:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnLIU-00000003mgJ-4Ar0;
	Thu, 21 Mar 2024 16:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C1BE0CE1397;
	Thu, 21 Mar 2024 16:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F12EBC433C7;
	Thu, 21 Mar 2024 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711038580;
	bh=Dm1PpESmKUiBkJ+3cICRSDiBnf/1JiIG6XDigLGXMlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FbmFLEAR2OjkUz89fFAGbWQaIBm7VPp+wrODGf3cgpaW90dcMMuLPUIBy4ru/hhLb
	 zfgNOMoZT4E2PAniw6E7a3cgj69iN8oHRRILIap1aZb7vlU72m1BtedZcv0Ia+qf9T
	 vuAP8YSIFtNAijVsMjR9CQ8nG8mT4zlWwoYDf19CkpQDwdS7pbWPG585rZI/KUoNIm
	 AVyj7tERnH4WO6w+4cFron94YQimE9rxVXrTVVp+Ge8/M9SV6CstakFSIFlInqNC+k
	 YN6FSt43taTpm3dvkiUPLu4r8exbptcplSQC7tDyKaEKHjZXtxMq7aDLz35zQTva21
	 c6h466+5AOmww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD1ECD11C2;
	Thu, 21 Mar 2024 16:29:39 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Thu, 21 Mar 2024 19:29:13 +0300
Subject: [PATCH net v2 1/2] net: dsa: mt7530: fix enabling EEE on MT7531
 switch on all boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-1-9af9d5041bfe@arinc9.com>
References: <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-0-9af9d5041bfe@arinc9.com>
In-Reply-To: <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-0-9af9d5041bfe@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
 Russell King <linux@armlinux.org.uk>, 
 SkyLake Huang <SkyLake.Huang@mediatek.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711038558; l=3102;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=jPUSZ3Gz1HwFE6kGrRuGpoudPKmyUngv0UO3D4WqCPk=;
 b=PDdYcDWLl5PpsAn992chSxQxfWJGD18RI8e2IpPDL4UEksOruuIlksuJkAwm3bSzIZepdQ05O
 Pv6HZ7ZaNQkBAN7PxMeFnwusBGvksLdTarcCSmntqk+/6dnQ1ijKJO6
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_092943_417005_DEBAEA68 
X-CRM114-Status: GOOD (  18.49  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The commit 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
brought EEE support but did not enable EEE on MT7531 switch MACs. EEE is
enabled on MT7531 switch MACs either by pulling the LAN2LED0 pin low on the
board (bootstrapping), or unsetting the EEE_DIS bit on the trap register.

There are existing boards that were not designed to pull the pin low.
Therefore, unset the EEE_DIS bit on the trap register.

Unlike MT7530, the modifiable trap register won't be populated identical to
the trap status register after reset. Therefore, read from the trap status
register, modify the bits, then write to the modifiable trap register.

My testing on MT7531 shows a certain amount of traffic loss when EEE is
enabled. That said, I haven't come across a board that enables EEE. So
enable EEE on the switch MACs but disable EEE advertisement on the switch
PHYs. This way, we don't change the behaviour of the majority of the boards
that have this switch.

With this change, EEE can now be enabled using ethtool.

The disable EEE bit on the trap pertains to the LAN2LED0 pin which is
usually used to control an LED. Once the bit is unset, the pin will be low.
That will make the active low LED turn on.

The pin is controlled by the switch PHY. It seems that the PHY controls the
pin in the way that it inverts the pin state. That means depending on the
wiring of the LED connected to LAN2LED0 on the board, the LED may be on
without an active link.

Fixes: 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 14 ++++++++++++++
 drivers/net/dsa/mt7530.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 678b51f9cea6..6aa99b590329 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2458,6 +2458,20 @@ mt7531_setup(struct dsa_switch *ds)
 	/* Reset the switch through internal reset */
 	mt7530_write(priv, MT7530_SYS_CTRL, SYS_CTRL_SW_RST | SYS_CTRL_REG_RST);
 
+	/* Allow modifying the trap and enable Energy-Efficient Ethernet (EEE).
+	 */
+	val = mt7530_read(priv, MT7531_HWTRAP);
+	val |= CHG_STRAP;
+	val &= ~EEE_DIS;
+	mt7530_write(priv, MT7530_MHWTRAP, val);
+
+	/* Disable EEE advertisement on the switch PHYs. */
+	for (i = MT753X_CTRL_PHY_ADDR;
+	     i < MT753X_CTRL_PHY_ADDR + MT7530_NUM_PHYS; i++) {
+		mt7531_ind_c45_phy_write(priv, i, MDIO_MMD_AN, MDIO_AN_EEE_ADV,
+					 0);
+	}
+
 	if (!priv->p5_sgmii) {
 		mt7531_pll_setup(priv);
 	} else {
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index a71166e0a7fc..509ed5362236 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -457,6 +457,7 @@ enum mt7531_clk_skew {
 #define  XTAL_FSEL_M			BIT(7)
 #define  PHY_EN				BIT(6)
 #define  CHG_STRAP			BIT(8)
+#define  EEE_DIS			BIT(4)
 
 /* Register for hw trap modification */
 #define MT7530_MHWTRAP			0x7804

-- 
2.40.1



