Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09400C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQhQOe8Lkc+Cb5uLET8tQ6lXGst8nOdFVpodG6bud3Q=; b=BqfEQBcwWJsq2c
	q/oqWIuaiRbuK6M9626GjuvinfRkq2wIbZ5NJkjhqrWJlyTGAZP1qPIIIYYTNIdq/zLM5CdZzrKh9
	ZxPoOgof+Rtvi44Zs/99JXoKvUu2rX11Ll/v3Ns8IitLtiZ5cYofFYpmFMoHrsHyv4NOwmr7eDE4Z
	zZ6NgwbZYLlXkalaHouuTZ5xENS7MGyAMY0fxLJSQ0CQy7dva3AtUzNxxj9QKow4qE556lHemFkgf
	TaW5A4BNAK02kPOt6bCrZApO7Pdwx7SWY3UAbN4gZeof6ouhmHs+En2mVHsgQSl8OluDui6qjndDs
	xpYnWnDtsJWpCwm7WSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mucnE-009K1f-Bo; Tue, 07 Dec 2021 15:54:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mucmn-009Jot-4p; Tue, 07 Dec 2021 15:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sfApUIqhKc48crqN5d18eMH/aSEK8ckqe+ebo3ZZu+E=; b=LRH8An+cYDRGAI5ZCAYUb8WD1Y
 doWAtLt3KsNovoBA+2Wm/QnBzAfJq54NfQJ5HZYPJxDWRU7XRNB7MRzjDg9H7b2oaU3cgdSimwF3Q
 32FX2jBAm6JeLyXu/BahE931N5TSW5Brxl1FYBxmaPdoEvgXchDwHoW/JhHsodoxB27bPvlG9QMAV
 XlYuYZ609veWf7YowEsNV2LYGDXlhIE2VYi+iw35O5Q6OYJWr3er6uAjmbPz3//qGe0LQKurJVrc6
 FcBbaV4aQdUjLbO/LynCcgjGUKX7oCNKBJrdQisPO/V/PIxi0hkYe/Lfz5KODbSBf3LX909bz7w1D
 bVveQ1dw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56782 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mucml-0006P9-71; Tue, 07 Dec 2021 15:53:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mucmk-00EyCr-Oq; Tue, 07 Dec 2021 15:53:42 +0000
In-Reply-To: <DGaGmGgWrlVkW@shell.armlinux.org.uk>
References: <DGaGmGgWrlVkW@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 2/5] net: dsa: mark DSA phylink as
 legacy_pre_march2020
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mucmk-00EyCr-Oq@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Dec 2021 15:53:42 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_075345_228023_27A236BE 
X-CRM114-Status: GOOD (  10.47  )
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

The majority of DSA drivers do not make use of the PCS support, and
thus operate in legacy mode. In order to preserve this behaviour in
future, we need to set the legacy_pre_march2020 flag so phylink knows
this may require the legacy calls.

There are some DSA drivers that do make use of PCS support, and these
will continue operating as before - legacy_pre_march2020 will not
prevent split-PCS support enabling the newer phylink behaviour.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 net/dsa/port.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/dsa/port.c b/net/dsa/port.c
index 6d5ebe61280b..3b8d18e5b72c 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -1094,6 +1094,13 @@ int dsa_port_phylink_create(struct dsa_port *dp)
 	if (err)
 		mode = PHY_INTERFACE_MODE_NA;
 
+	/* Presence of phylink_mac_link_state or phylink_mac_an_restart is
+	 * an indicator of a legacy phylink driver.
+	 */
+	if (ds->ops->phylink_mac_link_state ||
+	    ds->ops->phylink_mac_an_restart)
+		dp->pl_config.legacy_pre_march2020 = true;
+
 	if (ds->ops->phylink_get_caps)
 		ds->ops->phylink_get_caps(ds, dp->index, &dp->pl_config);
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
