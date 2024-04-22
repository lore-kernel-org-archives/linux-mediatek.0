Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8F6C07E8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 07:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAvkvzvAC2Sy/WrwlguS0ZDK4fs2tKHm3AEXuv7ueF4=; b=1S6CpqJGY4dnrfakNbXyTnhC2d
	mtQ8ibnyT3jCrZBtVrhDHt5UUBf9x48+usKXFZrPFAo3ZBqWVtrJPGN69btwL8zqQQEKJFxaJ6p+f
	FnSq5sM6OxUOv47kdDV2WH12HWKiwsKU5czCo1sEsOJ2pqxpsbR9MgacgWo11kM/hq8hM+eSiHOv4
	AI/XafQ6C/yrM4GffCJ5728GF0Gu5woNOOYTcVE4u+QKQFoQX9LizHn7GGNYxtc4NGz3kc3mD+9Yq
	ZxXnZNel2kSX77YaHC0uKwKikw5GViRtRHBcp3t/IesylhqsyOFL7ZrjnAERv/28yULXzmieT5ybr
	ZSa5iWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynva-0000000COQT-3Uvr;
	Mon, 22 Apr 2024 07:17:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryntn-0000000CNLe-0goF;
	Mon, 22 Apr 2024 07:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 71172CE0A0F;
	Mon, 22 Apr 2024 07:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84D14C2BD11;
	Mon, 22 Apr 2024 07:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713770130;
	bh=z4CnLGKrUD1pUXLNlD1qUSpXMrxsT8sEfZkE95NlMB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ezpE1ScZJCFXbxXHqCHd9SV9BHPnrxkMinxxGZn/HtpHykaf/WIebiSHLIZl2o63f
	 QzKwkcla9+eDNOaRWMlgaXMIKkFcht/eGCJ7EYYMpAH+kuCRPQ2XjbI37kAZlDQtEw
	 /9HrEO8hSdqE+EP/KEieeOP+1r03rvgUD/XFKdujWpAh8mHkCHsQVFh9vxvQMcH2pY
	 UkUpa4mCsWZGqFhhrglbGFGYYi6u9p0qQg/UOeEwV2XKG/FZmAA6E2ED92Mn1ro6Uy
	 LKA4LJV7JT8SzDgfGjEYrjra5bdEPwcuWk42P3prB0zqOoHrQhsTMROK21OE/6u/Rd
	 74AKgfl4qnbSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7139AC07E8F;
	Mon, 22 Apr 2024 07:15:30 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 22 Apr 2024 10:15:08 +0300
Subject: [PATCH net-next v2 01/15] net: dsa: mt7530: disable EEE abilities
 on failure on MT7531 and MT7988
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240422-for-netnext-mt7530-improvements-4-v2-1-a75157ba76ad@arinc9.com>
References: <20240422-for-netnext-mt7530-improvements-4-v2-0-a75157ba76ad@arinc9.com>
In-Reply-To: <20240422-for-netnext-mt7530-improvements-4-v2-0-a75157ba76ad@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713770127; l=3406;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=1dA5Tqo1oiLbTJdCrnbheqEyfiDY3WFrwARn+Ftc72o=;
 b=VtnuvYkOYN+vEkQPGT+08Dj8e91SfG1jvR2MB7fvYI4pfbzc+KCifP2+OI09UraHx7ga76W0i
 BmPeae9oPLBBPCT+uxq7/ZYsXjP47z7C5SjOZDfqp7Be7WI3T9ZJQpq
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_001535_602519_DAE33E2F 
X-CRM114-Status: GOOD (  19.17  )
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

The MT7531_FORCE_EEE1G and MT7531_FORCE_EEE100 bits let the
PMCR_FORCE_EEE1G and PMCR_FORCE_EEE100 bits determine the 1G/100 EEE
abilities of the MAC. If MT7531_FORCE_EEE1G and MT7531_FORCE_EEE100 are
unset, the abilities are left to be determined by PHY auto polling.

The commit 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
made it so that the PMCR_FORCE_EEE1G and PMCR_FORCE_EEE100 bits are set on
mt753x_phylink_mac_link_up(). But it did not set the MT7531_FORCE_EEE1G and
MT7531_FORCE_EEE100 bits. Because of this, the EEE abilities will be
determined by PHY auto polling, regardless of the result of phy_init_eee().

Define these bits and add them to the MT7531_FORCE_MODE mask which is set
in mt7531_setup_common(). With this, there won't be any EEE abilities set
when phy_init_eee() returns a negative value.

Thanks to Russell for explaining when phy_init_eee() could return a
negative value below.

Looking at phy_init_eee(), it could return a negative value when:

1. phydev->drv is NULL
2. if genphy_c45_eee_is_active() returns negative
3. if genphy_c45_eee_is_active() returns zero, it returns -EPROTONOSUPPORT
4. if phy_set_bits_mmd() fails (e.g. communication error with the PHY)

If we then look at genphy_c45_eee_is_active(), then:

genphy_c45_read_eee_adv() and genphy_c45_read_eee_lpa() propagate their
non-zero return values, otherwise this function returns zero or positive
integer.

If we then look at genphy_c45_read_eee_adv(), then a failure of
phy_read_mmd() would cause a negative value to be returned.

Looking at genphy_c45_read_eee_lpa(), the same is true.

So, it can be summarised as:

- phydev->drv is NULL
- there is a communication error accessing the PHY
- EEE is not active

otherwise, it returns zero on success.

If one wishes to determine whether an error occurred vs EEE not being
supported through negotiation for the negotiated speed, if it returns
-EPROTONOSUPPORT in the latter case. Other error codes mean either the
driver has been unloaded or communication error.

In conclusion, determining the EEE abilities by PHY auto polling shouldn't
result in having any EEE abilities enabled, when one of the last two
situations in the summary happens. And it seems that if phydev->drv is
NULL, there would be bigger problems with the device than a broken link. So
this is not a bugfix.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 94932c3dbde9..f7c5355c1642 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -328,11 +328,15 @@ enum mt7530_vlan_port_acc_frm {
 #define  MT7531_FORCE_DPX		BIT(29)
 #define  MT7531_FORCE_RX_FC		BIT(28)
 #define  MT7531_FORCE_TX_FC		BIT(27)
+#define  MT7531_FORCE_EEE100		BIT(26)
+#define  MT7531_FORCE_EEE1G		BIT(25)
 #define  MT7531_FORCE_MODE		(MT7531_FORCE_LNK | \
 					 MT7531_FORCE_SPD | \
 					 MT7531_FORCE_DPX | \
 					 MT7531_FORCE_RX_FC | \
-					 MT7531_FORCE_TX_FC)
+					 MT7531_FORCE_TX_FC | \
+					 MT7531_FORCE_EEE100 | \
+					 MT7531_FORCE_EEE1G)
 #define  PMCR_LINK_SETTINGS_MASK	(PMCR_TX_EN | PMCR_FORCE_SPEED_1000 | \
 					 PMCR_RX_EN | PMCR_FORCE_SPEED_100 | \
 					 PMCR_TX_FC_EN | PMCR_RX_FC_EN | \

-- 
2.40.1



