Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E03C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qkU+JUGmSz2dbkFgrdtz5UY3lECyI8dUEzPOzoTd82A=; b=LHcGvuzVaCs2lH
	CVNqj+IZ6eG6XBs/d9f6ba3EkV2mOn3xMKzjnk+XMkU2W97ZbA1z9e9WJLEeVuedQmSGWJoMt5Nbt
	KdIIyM/nFZd8AA8Wys5hRzLHXdFW6h6JcQvs2T+eleiN8jp6QZsbuENe91a5y9sop1X6620c+4Iie
	Ycol/LTiFi9LNmMZCIPphg+cg/ZgSa8jVkMwJPAYPi5nimNrO/ozccsdgsLYtWD86G1g8PXDgd1Y9
	6+YIGGt2J0RXnAKezbFUHRIqEmvBl2SF6W4+9vanP23h+QiVRjz9IpqYTKQhZlkPOmaWu01+zxtfA
	q3afr7mQfVYsLzEgp9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrL9x-002g3y-0I; Wed, 18 May 2022 15:00:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrL5S-002cNt-Qq; Wed, 18 May 2022 14:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5qOrYZ9Ew3YUY1PEFEUvjASdmaLGxZuS6WSsdOEQ2c8=; b=zZ/Rkrg9ucS7QxfhCPTp2UtTDk
 UGhj3fJZ6haUpP2aBWi3QFW3ZamYCJWwfOza1jCfZWtsfPHiW2vAaSv7Uosyk00DEl/IUwOaxvjGI
 y0sVTQ6meX+gB9jWOtef53KXCenYeck7LTWh4Q2X8OeiiF8pOGTYmPivQ//V6Ri+KivWHSOMoi24E
 y7ugJrGeeSIfSUw7vcww8W5sWXvBLg1+wv7fdh/Ev+tx9fUESmkrDhSjgFYpvslTK4+iCas7QKqZJ
 Mwabl++VW0Ljj1zP6YXaBmeDRyNp7p/zDGhNc0P6xuBUaXSRX/ZhVgeNoYJ+bMB3drXrIisJGNMRN
 oHt+YQVA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60762)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nrL3D-0002DK-G9; Wed, 18 May 2022 15:53:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nrL39-0005fs-CY; Wed, 18 May 2022 15:53:19 +0100
Date: Wed, 18 May 2022 15:53:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH net-next 00/12] mtk_eth_soc phylink updates
Message-ID: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_075542_886725_8C1FEB6C 
X-CRM114-Status: GOOD (  16.15  )
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

This series ultimately updates mtk_eth_soc to use phylink_pcs, with some
fixes along the way.

Previous attempts to update this driver (which is now marked as legacy)
have failed due to lack of testing. I am hoping that this time will be
different; Marek can test RGMII modes, but not SGMII. So all that we
know is that this patch series probably doesn't break RGMII.

1) remove unused mac_mode and sgmii flags members from structures.
2) remove unnecessary interpretation of speed when configuring 1000
   and 2500 Base-X
3) move configuration of SGMII duplex setting from mac_config() to
   link_up()
4) only pass in interface mode to mtk_sgmii_setup_mode_force()
5) move decision about which mtk_sgmii_setup_mode_*() function to call
   into mtk_sgmii.c
6) add a fixme comment for RGMII explaning why the call to
   mtk_gmac0_rgmii_adjust() is completely wrong - this needs to be
   addressed by someone who has the hardware and can test an appropriate
   fix. This fixme means that the driver still can't become non-legacy.
7) move gmac setup from mac_config() to mac_finish() - this preserves
   the order that we write to the hardware when we eventually convert to
   phylink_pcs()
8) move configuration of syscfg0 in SGMII/802.3z mode to mac_finish()
   for the same reasons as (7).
9) convert mtk_sgmii.c code structure and the mtk_sgmii structure to
   suit conversion to phylink_pcs
10) finally convert to phylink_pcs

As there has been no feedback from mtk_eth_soc maintainers to my RFC
on April 6th, not my reminder on April 11th, so it's now time to merge
this anyway. Mediatek code seems to be submitted to the kernel and
then the maintainers scarper...

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 103 +++++++++-------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  40 +++----
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 176 ++++++++++++++++------------
 3 files changed, 186 insertions(+), 133 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
