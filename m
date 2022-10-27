Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF17BECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A49PgTi5SeZp6nc1oTy8pXJQi4hZGA2yQzp5TsF0JYU=; b=MfJ89u3OhYoylq3NWB0GqP4H85
	cr1PyK+QkiZa6Hf+U2nVFQYAWcG18Rh0AzNMGb3nnN+EwLIb9YyLb3AJ8w/cOyce7bP9BKnoufSIW
	TPhiBKkXVHs/sWsmmToSKKzrhRuCEG4bzYb3pucR2dXHseIrqdr/HgmCXn+KIbGskMDBUfLvloYGp
	ZDb+2KhN4gX31VEz0Pn2pWIMNokTzM//s7GQL8ytyGWtZqrxvHpguP0Ft8YSYwl18bKIpUiZz7dXg
	GrColuvtdlwTwlIg+RsAhufMO7ALV7opAQK3d/H6aBKwwf8zBuN38Uw++XHS+/WSzS6Kc2pbaNZFc
	n0ZcnScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2st-00DUTV-LI; Thu, 27 Oct 2022 13:25:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2gU-00DMj6-Cb; Thu, 27 Oct 2022 13:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A49PgTi5SeZp6nc1oTy8pXJQi4hZGA2yQzp5TsF0JYU=; b=xw+hrfjSv7Q/X1gOdVu/x6X0Ps
	LnZG6dVuUsXXZvnOSrtAC/XVoo4kEz1ZWRq+8+1yVYOCvmC6taUvJb0txh6T4jEiX39hQwEXRUOsP
	cIAymFIH37Nex8EN1Rt44kAj/DZlwd/a8wjP6mupjJT6bDk+zVFH9EoLImH4a7Vitxel1jQpfO63U
	a8JPKtOftbOU/U596Bgg6Ohl91d/KTCxbTwQMtfabwOpasASVxcovcJE5YpDQzRa6jT+c2XoRHh1/
	qsGU/aFatQaeJlS6osXGF9mkKRQrqPfXDRsK7fgGMNBXo+VBozKUuvazqJ1aDWUNIM6iwOPjNUn0g
	/1xnhfSw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34970)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oo2eF-0006xD-V0; Thu, 27 Oct 2022 14:10:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oo2eB-0001Zx-Ii; Thu, 27 Oct 2022 14:10:11 +0100
Date: Thu, 27 Oct 2022 14:10:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>
Cc: Eric Dumazet <edumazet@google.com>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH net-next 00/11] net: mtk_eth_soc: improve PCS implementation
Message-ID: <Y1qDMw+DJLAJHT40@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061234_457965_C9C21C61 
X-CRM114-Status: GOOD (  14.41  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

As a result of invesigations from Frank Wunderlich, we know a lot more
about the Mediatek "SGMII" PCS block, and can implement the PCS support
correctly. This series achieves that, and Frank has tested the final
result and reports that it works for him. The series could do with
further testing by others, but I suspect that is unlikely to happen
until it is merged based on past performances with this driver.

Briefly, the patches in order:

1. Add a new helper to get the link timer duration in nanoseconds
2. Add definitions for the newly discovered registers and updates to
   bit definitions, including bitmasks for the BMCR, BMSR and two
   advertisement registers.
3. Remove unnecessary/unused error handling (functions always returning
   zero.)
4. Adding the missing pcs_get_state() implementation.
5. Converting the code to use regmap_update_bits() rather than
   open-coding read-modify-write sequences.
6. Adding out-of-band speed and duplex forcing for all non-inband modes
   not just the 802.3z link modes the code currently does.
7. Moving the release of the PHY power down to the main pcs_config()
   function.
8. Moving the interface speed selection to the main pcs_config()
   function.
9. Adding advertisement programming.
10. Adding correct link timer programming using the new helper in the
    first patch.
11. Adding support for 802.3z negotiation.

There is one remaining issue - when configuring the PCS for in-band,
for some reason the AN restart bit is always set. This should not be
necessary, but requires further investigation with the hardware to
find out whether it is really necessary. I suspect this was a work
around for a previous poor implementation.

 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  13 ++-
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 174 ++++++++++++++++------------
 include/linux/phylink.h                     |  24 ++++
 3 files changed, 134 insertions(+), 77 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

