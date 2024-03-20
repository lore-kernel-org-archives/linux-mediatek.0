Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE3AC54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 20:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NGFfZsZ4Q8WXth7kWT0XfqRQkhecC/vcT9vhK/tQApM=; b=piLN/c6A5UDoQMg1GJ0S66NKoq
	VznhHz6i9tjN3R6sf2u5JvAQrV42YE3VFibkkgzlsDodKymZRABppQtf2dmF+LdyQCXGtnKfDRNyW
	jPtrdDzWdseennsK7S7v9tB4vwtfCJ5IqH5yxwE1lp3Vc2DmwJw6VIw9Byhxyxy5ncKzWwYzVATyu
	A2//VPBuEv5GqgMxuQ7CnfOfG4XWmspMy/K7hIs38fQPW38+PmdvtrQsh39GdpSXGcVLphu56f6rl
	ygcQIHzJ9A+wpne/99jd7PWu4BmMwcGmPeA4VP7rGP84Wj3T2G/ZyCEq5QUAI9VipB2QkBypdV9aN
	hjerzSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2ou-00000000vKB-0mmZ;
	Wed, 20 Mar 2024 20:45:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2oq-00000000vJe-2Gig;
	Wed, 20 Mar 2024 20:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4BA461073;
	Wed, 20 Mar 2024 20:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3714CC433F1;
	Wed, 20 Mar 2024 20:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967550;
	bh=DVMjMGP9QqjEmQ/ua/wWgAorznBOZGn26NsNd5cqvw4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fQWk37H3YAnWdUfmua2LrFMrdSv6ydI/zeM+G0NOt/G/k7k25jQvMj0nW5hLfXZSK
	 /Nn/SQYnrA7dO9G6cXz3P2jRXtyKmdrD4iI0xqozXV+4saEuMV9A25SV98lDqUPAoF
	 DiUJ6VaSy44Y9sqw2JI1zFzQWp/utcsb7lgTdKTA3gphXu+ExQmF+A3o8PkVA6cZC6
	 IO7RSb19qSNzTXXRP6KA/YbhDPXczoo+0aRvom2OpsCkXsgxkqf+tmq3JmYldpgXj2
	 aOOnM90wZLR9eHkGU9lmS4iCKTf4wrOtKjLtwRoUfDcfhKTIYViQKeGqgEWT4rNBbt
	 bZpStGapkm1wg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FCCC54E58;
	Wed, 20 Mar 2024 20:45:50 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Wed, 20 Mar 2024 23:45:30 +0300
Subject: [PATCH net] net: dsa: mt7530: fix improper frames on all 25MHz and
 40MHz XTAL MT7530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240320-for-net-mt7530-fix-25mhz-xtal-with-direct-phy-access-v1-1-d92f605f1160@arinc9.com>
X-B4-Tracking: v=1; b=H4sIAOlK+2UC/x2NQQrCMBBFr1Jm7YeYGgSvIi5CMpoBm5Zk0Grp3
 R3cfHiL/95GnZtwp8uwUeOXdJmrwfEwUCqxPhiSjck7f3Kjd7jPDZUVk57DaCgrfJjKF6vGJ96
 iBVkaJ8VSPogpce9gHyPnEJwNmXppbMd/9kpmo9u+/wAysgF6iwAAAA==
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Landen Chao <Landen.Chao@mediatek.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710967529; l=2945;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=IUAz2iG3lPTlOnHitW8WZ64dit6oJNL3iK9bUDlrZFc=;
 b=9MtA/Y9vEntM4ULwpnIWKrfqRMckl0Wp+4r/3tLyQSs8Vp/HogUBUCCrb6G8Bmi+gvgL+E48f
 eNL7rncPs4HDH+51dumgEwZZhzuvjTqevdlI0Ad8n0q7H08iJY9JB0M
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_134552_700168_BF4E2AFA 
X-CRM114-Status: GOOD (  14.05  )
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

The MT7530 switch after reset initialises with a core clock frequency that
works with a 25MHz XTAL connected to it. For 40MHz XTAL, the core clock
frequency must be set to 500MHz.

The mt7530_pll_setup() function is responsible of setting the core clock
frequency. Currently, it runs on MT7530 with 25MHz and 40MHz XTAL. This
causes MT7530 switch with 25MHz XTAL to egress and ingress frames
improperly.

Introduce a check to run it only on MT7530 with 40MHz XTAL.

The core clock frequency is set by writing to a switch PHY's register.
Access to the PHY's register is done via the MDIO bus the switch is also
on. Therefore, it works only when the switch makes switch PHYs listen on
the MDIO bus the switch is on. This is controlled either by the state of
the ESW_P1_LED_1 pin after reset deassertion or modifying bit 5 of the
modifiable trap register.

When ESW_P1_LED_1 is pulled high, PHY indirect access is used. That means
accessing PHY registers via the PHY indirect access control register of the
switch.

When ESW_P1_LED_1 is pulled low, PHY direct access is used. That means
accessing PHY registers via the MDIO bus the switch is on.

For MT7530 switch with 40MHz XTAL on a board with ESW_P1_LED_1 pulled high,
the core clock frequency won't be set to 500MHz, causing the switch to
egress and ingress frames improperly.

Run mt7530_pll_setup() after PHY direct access is set on the modifiable
trap register.

With these two changes, all MT7530 switches with 25MHz and 40MHz, and
P1_LED_1 pulled high or low, will egress and ingress frames properly.

Link: https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/4a5dd143f2172ec97a2872fa29c7c4cd520f45b5/linux-mt/drivers/net/ethernet/mediatek/gsw_mt7623.c#L1039
Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 6986f538a4d0..c856a13bc2f1 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2232,8 +2232,6 @@ mt7530_setup(struct dsa_switch *ds)
 		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
 		     SYS_CTRL_REG_RST);
 
-	mt7530_pll_setup(priv);
-
 	/* Lower Tx driving for TRGMII path */
 	for (i = 0; i < NUM_TRGMII_CTRL; i++)
 		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
@@ -2249,6 +2247,9 @@ mt7530_setup(struct dsa_switch *ds)
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
+	if ((val & HWTRAP_XTAL_MASK) == HWTRAP_XTAL_40MHZ)
+		mt7530_pll_setup(priv);
+
 	mt753x_trap_frames(priv);
 
 	/* Enable and reset MIB counters */

---
base-commit: 9c6a59543a3965071d65b0f9ea43aa396ce2ed14
change-id: 20240320-for-net-mt7530-fix-25mhz-xtal-with-direct-phy-access-e2aaed550ed5

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>



