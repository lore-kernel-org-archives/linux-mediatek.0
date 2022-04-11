Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8297C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+6rrOiU0YgUdDMSCL0fs9X6IiLmYPTM+U1sOcO5Buj0=; b=Kh1TnnpR50c9MR
	txGoEi6W8nyS/nhu2UA3qXavvpjk4nDU3qau+yPRkKqqOogWmxr1962DS0xLOdFMPitqnMEQWy+KE
	wgTuOQQWBBZ7jorI7IZJFixNfFNkzGazY6eH3TMhXHQJ8NA4KgbxvFHe3I3JcEZ3HlNJjxKkL4hmF
	nEQGqY9zAJRIVZS2mTUzTX05lHKE7/HBIJSFm29qKseTuCF0u2fTlNrq8bgaMoI6NdLJ+TYT2wSrz
	0C8vxj7LqsrqpOb26WqwMYjqTua30hE88zq7zRP2UquY17bvJ+wUqd89w+OWWtG7KiOMWTPDb277S
	+2rGkhW1tpywMa1toL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndqcU-0080Ws-Ex; Mon, 11 Apr 2022 09:46:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndqcG-0080RP-Ie; Mon, 11 Apr 2022 09:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H0oe0ox/jDdJfU+U6l9V289aRt7erqVy7B2FoTU7YRs=; b=xykjidlHoTyE5ITFYYgbClNGDD
 6fm1K+HoUU5yIWRYF/l4MTKq05WD9J2t/1e11BduhdrXWWfERAPd+dl/1++rbK36At/WZqMCcl4mJ
 kox4w2u8RApVCDMO+UmU+QNNCCjWdlP/FtStn1jsSFERGpaukkJCSdIGXqrfsTrzRIxgyIsk58XL6
 LdG1Q/0AVOiCB+x/e7fz5cff4fKC+zOZePr/frQKddoBkXuONAG7eLIEOJjsOIena7n2O3XFQ8AEb
 bFJyUFOi/hF5XVNOEYWRXfakpxlgsoM0wVgl3sKBokchaTopiEHFHjpkbzleZZ1R6qLVzRTdlY71K
 J0ox1h7w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58202)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ndqc4-0000Fx-4A; Mon, 11 Apr 2022 10:45:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ndqc0-0001K5-Jq; Mon, 11 Apr 2022 10:45:32 +0100
Date: Mon, 11 Apr 2022 10:45:32 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 0/9] net: dsa: mt7530: updates for phylink changes
Message-ID: <YlP4vGKVrlIJUUHK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_024548_708083_80A41012 
X-CRM114-Status: GOOD (  15.50  )
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

Hi,

This revised series is a partial conversion of the mt7530 DSA driver to
the modern phylink infrastructure. This driver has some exceptional
cases which prevent - at the moment - its full conversion (particularly
with the Autoneg bit) to using phylink_generic_validate().

Patch 1 fixes the incorrect test highlighted in the first RFC series.

Patch 2 fixes the incorrect assumption that RGMII is unable to support
1000BASE-X.

Patch 3 populates the supported_interfaces for each port

Patch 4 removes the interface checks that become unnecessary as a result
of patch 3.

Patch 5 removes use of phylink_helper_basex_speed() which is no longer
required by phylink.

Patch 6 becomes possible after patch 5, only indicating the ethtool
modes that can be supported with a particular interface mode - this
involves removing some modes and adding others as per phylink
documentation.

Patch 7 switches the driver to use phylink_get_linkmodes(), which moves
the driver as close as we can to phylink_generic_validate() due to the
Autoneg bit issue mentioned above.

Patch 8 converts the driver to the phylink pcs support, removing a bunch
of driver private indirected methods. We include TRGMII as a PCS even
though strictly TRGMII does not have a PCS. This is convenient to allow
the change in patch 9 to be made.

Patch 9 moves the special autoneg handling to the PCS validate method,
which means we can convert the MAC side to the generic validator.

Patch 10 marks the driver as non-legacy.

The series was posted on 23 February, and a ping sent on 3 March, but
no feedback has been received. The previous posting also received no
feedback on the actual patches either.

v2:
- fix build issue in patch 5
- add Marek's tested-by

 drivers/net/dsa/mt7530.c | 330 +++++++++++++++++++++--------------------------
 drivers/net/dsa/mt7530.h |  26 ++--
 2 files changed, 159 insertions(+), 197 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
