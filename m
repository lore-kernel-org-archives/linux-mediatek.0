Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7729FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cxr9fWceLkGPcYfxEhCKEDQZAeSb94u/SLK4USTJRC0=; b=hJKCrtiGl3nUWF
	WqB616sTqaViQVQWjecrGdUaySFvMhzxnTa0B+iMN9YTmwBw4sRGX4x+Tgo9xd16pKH1RsxVrT7+0
	o0j/dX5LHOGyz8z8tFImGybcJWD/5qfLBbe3OS2yq8GnMo5kmzdmtihoSFXMi7AKALgb9BN4+75Gl
	tfpd8PZZJHS9MeRbHWpvIYvLxwPqkHA1Uvz8H/1KLsWEQ1iKhAe0CDI5vT6Kr+UZUtz+J6Gab8hUx
	c0qeiv8S7iEaC5BUhz7bbhShZrXXHlwlahCT+Ur0CEzS0qki7CLGRc93BNWmjNVsUAcZsNVILCRNI
	/IQN63Akv1kPabPJgsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpSfD-001cmV-5D; Tue, 23 Nov 2021 10:04:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpSdG-001aqz-Nd; Tue, 23 Nov 2021 10:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bPIJgLfiVHs9dWh/I88pAMSJy+rMDL+vIYEYo3gmZ14=; b=0J2qxzsH7fGBBtlRugWWBIYhnk
 P0fwJie7lLGJyIb6LgwFkOnpK+DGNb4Gjv2BxjMtWR2wmL4XMRGrZzA2bbpXq0BgfwmbA+aNpYZWx
 9H9RkZSWl3od6wTSWftgZPciNiratuPQDwNQ65VQvb/gTTouXd3NcUt4ZWw9KgJLtA3fHDYcgkdVb
 CfLRjKOGqsTmocCssXjYnlkusAgSfWSdMC8/MCriVwZgqOUpcNzF/xKgsVKsblCWSkfA6w8TlV8M2
 dyQEX8cCgom8JixGqX/GZR4QbiAZkUakpyNUbpQZluTSMhes8TByPg9MBML3opBNizZYpBmvbS8qC
 lk9YGM7Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36040 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSbG-0007iN-9X; Tue, 23 Nov 2021 10:00:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSbF-00BXoh-Qb; Tue, 23 Nov 2021 10:00:29 +0000
In-Reply-To: <YZy59OTNCpKoPZT/@shell.armlinux.org.uk>
References: <YZy59OTNCpKoPZT/@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>,
 John Crispin <john@phrozen.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,"David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: [PATCH RFC net-next 4/8] net: mtk_eth_soc: mark as a
 legacy_pre_march2020 driver
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mpSbF-00BXoh-Qb@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Nov 2021 10:00:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_020234_805912_1F42007A 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_eth_soc has not been updated for commit 7cceb599d15d ("net: phylink:
avoid mac_config calls"), so mark it as a legacy driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index de4152e2e3e4..a068cf5c970f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2923,6 +2923,10 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 
 	mac->phylink_config.dev = &eth->netdev[id]->dev;
 	mac->phylink_config.type = PHYLINK_NETDEV;
+	/* This driver makes use of state->speed/state->duplex in
+	 * mac_config
+	 */
+	mac->phylink_config.legacy_pre_march2020 = true;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
