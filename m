Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C980C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l83a6q/zZUDbfVh0PBXf53aDnwNcqHEUlUbAHqbYyjc=; b=NZiNtZSpHyWVxR
	Wjws+JPkzuFyYwy1IASR28/ak+355ZEq6SRo4SaUEcz0oNQX/BOSE7Bs/WdbiizjnL9btNntxclG/
	b0kyyxhpWiLRYNZIRK3pZAtKydFauqdGGMYvYe8hRylB1Tizk0GuuToMmphvN+Hei/AaW5jdeW8S1
	VDv9/fDrjxKXbEB0gC9W1wJlt/2cN9TI0jmYpAV91ps2HdS8fan1FZSjVO/WpmWg/Pk0bNYKwzRsn
	8MzQ1qsIN5CavoSDonKmKDcUXnYtl+hG2CaMb9zhbMWI8JlddhCNnuh+3vEtihW19DK87JIlWsF1+
	6rolXvNjY8H0B7sqw46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpSei-001cWM-2I; Tue, 23 Nov 2021 10:04:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpSdC-001apg-Cq; Tue, 23 Nov 2021 10:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qTGDaNQC8dzlK7EnxMVipMoSGhh3jfdSBn/mQjw1NJw=; b=vQyZmHOFMEP749C7l9bAHqV755
 qedpKIxajNJc8B0BMyYjGhimcCF8zEEkbA/OxagFs1zEfeDL2wbV6CSSu61t5AJPS2VdgGiq3g7tY
 kUxqts6yexqEgyWmYSvUHcIvwdt9zqG4rMF0n+KawC+/8uZB8vh1dV2BkDAEuXlXgY2N4jNv7duH5
 hmUI0dNg8HEel2ERGrtbi21OWgjq2Y5v04sn+f/VvP/dzmciuovcxBhJp+93J4Tfwcwz8ntAzMqVP
 Re/a8oOShJ1X+BWoCz/5LL4SJwS57rhHrNQ9jt7/tLYXvt6Q8900hNU63+slzlplRZf4QLInu8wge
 w4rUeHpw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36038 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSbB-0007i6-5F; Tue, 23 Nov 2021 10:00:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSbA-00BXob-MG; Tue, 23 Nov 2021 10:00:24 +0000
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
Subject: [PATCH RFC net-next 3/8] net: dsa: mark DSA phylink as
 legacy_pre_march2020
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mpSbA-00BXob-MG@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Nov 2021 10:00:24 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_020230_489634_38E23A06 
X-CRM114-Status: UNSURE (   9.32  )
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

As DSA doesn't make use of the PCS support, but it does have PCS, it
must be marked as a pre-March 2020 driver to maintain the old phylink
behaviour.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 net/dsa/port.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/dsa/port.c b/net/dsa/port.c
index eaa66114924b..cfb48dc57f73 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -1091,6 +1091,13 @@ int dsa_port_phylink_create(struct dsa_port *dp)
 	if (err)
 		mode = PHY_INTERFACE_MODE_NA;
 
+	/* Presence of phylink_mac_link_state or phylink_mac_an_restart is
+	 * an indicator of a legacy phylink driver.
+	 */
+	if (ds->ops->phylink_mac_link_state ||
+	    ds->ops->phylink_mac_an_restart)
+		dp->pl_config.legacy_pre_march2020 = true;
+
 	if (ds->ops->phylink_get_interfaces)
 		ds->ops->phylink_get_interfaces(ds, dp->index,
 					dp->pl_config.supported_interfaces);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
