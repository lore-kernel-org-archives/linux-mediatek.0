Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A59C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBoCTwcq7pci0b+BR7iC+iY6mCiT99/lXvhVjcXfrek=; b=aZcDYUwwbGh9kS
	98rlbLt7LysBJHnRgUMmEnspjPuttURQ3dksen3EuCmr/ksP4lp6tKgeUgUo+E9DR4rDNhcTeVN2+
	PZ3aXlxHiGOzPLnwI4o1LtF93Eb64gpnCLexmLfOCtW9BF5M2ocj2jg1UnMxZ+m+PteBXH/CuL/aa
	OqqB81lmJgvi6Px2Rgheh+HQLaZQHDmWrnMR0Di3Qz4VtWQxz6bUTNsSqGkzukETaHRxOrM7nSISR
	JmnGMM9e82TjvSBWfTEAfJnNffahglqPab+imlk5btuqK1TWdB/hJHACVl2s918sEixeJI4mkqWzW
	YcVuz/kOHypNN1hYJ+sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvJDf-00G1Jh-Af; Thu, 09 Dec 2021 13:12:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvJD3-00G16N-5t; Thu, 09 Dec 2021 13:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O63xYY4WTkxVuqPi0iAnNn7QvWPMaZMM+ioaw94+SgQ=; b=B9J+z/iHSerOmebuCJ2O0HycC3
 DaHwE5l4rDxxN7hknBwkoSWBEHSvBhaufgpPCkVjnFTM35xkLdvfIL/pWE+RpAmOCYGw93IUmGn25
 OBCyHNcPHUkzq1/HRiO2nuVFJDNoDEbgD3zJU4eQaFYCUQNJwEM1gWxYV9MZqP7ZEA4BNBT9sqhJo
 JcqOKQWrOkg9cDCI/xhsNpijrczauww4U4b3FtTzjCnb56gb2YMPLX1vkJHddF8Ye2RNtXoiJKMLY
 lrj1x8tMs/i3/TJG5/ZzPOhKWjj6O50bTdYSK5E1pchY56c/Ee/rryVkzgXfNLG/jy/+DGGn3tO6a
 eZBApMxA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45530 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mvJD0-0008Sq-Fl; Thu, 09 Dec 2021 13:11:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mvJD0-00F93x-1i; Thu, 09 Dec 2021 13:11:38 +0000
In-Reply-To: <Ya+DGaGmGgWrlVkW@shell.armlinux.org.uk>
References: <Ya+DGaGmGgWrlVkW@shell.armlinux.org.uk>
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
Message-Id: <E1mvJD0-00F93x-1i@rmk-PC.armlinux.org.uk>
Date: Thu, 09 Dec 2021 13:11:38 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_051141_268745_A601188E 
X-CRM114-Status: GOOD (  10.31  )
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
Resent with the correct cover-letter message-ID.

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
