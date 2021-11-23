Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFABC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 10:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/affAkTmaaiTTVyJOeqDcs82skEn9aypgF5FyPYUhQ=; b=uqP0f6wlVdpQJU
	l3REv0Srn/uvjuZT22FL3mU6fPsnBaJ7M/WDReFCNK3BB7xZX9WwZjGQ3snIb2HvECBTHLGjMV+Im
	zhi4m+LRLAfzBvOLw0dfSQFE24Mu0RQOuAw0MiGnwA7INMAzJ8WcI2JTFUBs1qynWUYil9CcqFCZd
	Gi4BnIwLb8qRkLoZxh6WLux14MgGJdY5RYi7dXl3nrbC1Tkeg9k8LiKfUguMjnLNjLJL8LFoT52a0
	OH2kUei8xXzL9iS6KjdR+cFKup/M6p4E8PqN8O6sPv+koFctuJRL2zH9BtT8g9///3q3HGYLYmefx
	smWFSDCfXYRaT72w22Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpSbd-001awg-I9; Tue, 23 Nov 2021 10:00:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpSbQ-001as8-Ac; Tue, 23 Nov 2021 10:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zGyMLwmozIGa5HKsKLxD/S/r9K2lopGCdgR2w8ENWEg=; b=Znx4acxXz0is16s2+/4xzxhLCN
 zoU22FidEK2K5oR9YW6ayPtd14p+wWQB4mHjq86r6sjM6FjMF+4AW0c2JfUWmZdYh7Sr8/V1s/cu2
 VvxYd3JudKmYfdmCcbYUFB8m12qImxEJQXZZ0mejJWnCku+/KYFKi/PMVJvRiXDp6W79I+A0vi0j+
 rgkG5+rv534rYDMBQTNpYJUPORWYk4DegC2BSztLNcABw6wgJY06tsgeHb0/cFhzUiQ8BNDdWFbq6
 HCW3DJo4e+uRJ8yEgMrVrts33zRyzRvl1QBbtgbAUWVYjeThjodIWFVPQMf0sUjZPwKOtPjY+4lN+
 ABfjaY6A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36046 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSbL-0007if-Cg; Tue, 23 Nov 2021 10:00:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSbK-00BXoo-UE; Tue, 23 Nov 2021 10:00:34 +0000
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
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: [PATCH RFC net-next 5/8] net: ag71xx: mark as a legacy_pre_march2020
 phylink driver
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mpSbK-00BXoo-UE@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Nov 2021 10:00:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_020040_393098_0D4FFA5F 
X-CRM114-Status: UNSURE (   8.93  )
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

ag71xx has a PCS, but does not make use of the phylink PCS support.
Mark it was a pre-March 2020 driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/atheros/ag71xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index ff924f06581e..89b6a8bfee43 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1111,6 +1111,7 @@ static int ag71xx_phylink_setup(struct ag71xx *ag)
 
 	ag->phylink_config.dev = &ag->ndev->dev;
 	ag->phylink_config.type = PHYLINK_NETDEV;
+	ag->phylink_config.legacy_pre_march2020 = true;
 	ag->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000FD;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
