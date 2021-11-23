Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF3DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeYI09hHvI9lZyTSep+mkuL6JQ55atANtspV5uLKG6Q=; b=AwdceuZcY6I828
	n0+5p6eIihNPrwhXqdbEelRdRdAPZnRS54pguG5I05BP6ZeV99+SWtQB5PZuLaS5T5yG3KgiP04nu
	C9b7ScDDUVgMpf03U1vqehWIHpAvYQoGHJD7qe9jwHvNev1keV7uKP3ow6xlZQYYGbSOATsNwDsxW
	3rqGzzA+D7Zf2zfyTgH45WUWc54ZIgULqZ0dhbIBuBPYV1ajnvExENjmG51b2WhseIJeEJ/yNeW0F
	RVONVyxQSd/Y5nUJHLs1QU5Dj4/Yvkb6YaOSsJPEbz1GZroPE9LUGRPXToq7wz9Hh/RDHg/VUClhC
	xmfXrMpw9q0SuX0b02ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpScU-001bIA-5Y; Tue, 23 Nov 2021 10:01:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpSbd-001awW-Nl; Tue, 23 Nov 2021 10:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4XNr7BR/5TNI3l9M9GhQTw+9AcyHIzcldXrTiciICEw=; b=jtOBoFyYnUmDSM0C8Gihatnao6
 TgqKkjPtCU/0kY0uDkGtR2xUUpuZw6hVB8DqU5UEwVddwdE9HXIkjXDjEszFHCTaON4CA4M1Qgde5
 8KVaRHKIPeh+I44LXgCFtpCa/cWvz7I0l91zc51+svkQ8GxyhK+nzalacD6KftHgmIrSTT6ozgyJF
 cbu/pKRjcF8XSRRs0XPZE3+h8iC8oDOuEvAI4VN18qsx2qmyNd6pbZpl/dfd7gVi6k+g/H7RcfCa3
 TeC5Co3htPtyuk/pd5QFiJeSlEarIotL2OPlf2uE9Aly6X5NlbG23dPFt6QqDeiQp7t9/HsofV5TB
 LICt3ikQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36056 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSba-0007jX-Oe; Tue, 23 Nov 2021 10:00:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSba-00BXp6-9e; Tue, 23 Nov 2021 10:00:50 +0000
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
Subject: [PATCH RFC net-next 8/8] net: phylink: allow PCS to be removed
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mpSba-00BXp6-9e@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Nov 2021 10:00:50 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_020053_804425_A202713D 
X-CRM114-Status: GOOD (  15.09  )
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

Allow phylink_set_pcs() to be called with a NULL pcs argument to remove
the PCS from phylink. This is only supported on non-legacy drivers
where doing so will have no effect on the mac_config() calling
behaviour.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a935655c39c0..9f0f0e0aad55 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1196,15 +1196,25 @@ EXPORT_SYMBOL_GPL(phylink_create);
  * in mac_prepare() or mac_config() methods if it is desired to dynamically
  * change the PCS.
  *
- * Please note that there are behavioural changes with the mac_config()
- * callback if a PCS is present (denoting a newer setup) so removing a PCS
- * is not supported, and if a PCS is going to be used, it must be registered
- * by calling phylink_set_pcs() at the latest in the first mac_config() call.
+ * Please note that for legacy phylink users, there are behavioural changes
+ * with the mac_config() callback if a PCS is present (denoting a newer setup)
+ * so removing a PCS is not supported. If a PCS is going to be used, it must
+ * be registered by calling phylink_set_pcs() at the latest in the first
+ * mac_config() call.
+ *
+ * For modern drivers, this may be called with a NULL pcs argument to
+ * disconnect the PCS from phylink.
  */
 void phylink_set_pcs(struct phylink *pl, struct phylink_pcs *pcs)
 {
+	if (pl->config->legacy_pre_march2020 && pl->pcs && !pcs) {
+		phylink_warn(pl,
+			     "Removing PCS is not supported in a legacy driver");
+		return;
+	}
+
 	pl->pcs = pcs;
-	pl->pcs_ops = pcs->ops;
+	pl->pcs_ops = pcs ? pcs->ops : NULL;
 }
 EXPORT_SYMBOL_GPL(phylink_set_pcs);
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
