Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3520FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gtPl/P6LaA39wDsprJHsP4rSUbsWb1ExiuMDZxxlZDc=; b=kejzhcm8A2ndCC
	3X5yK/gtV1vuj+cUeLq9kqaWCr6eSsXlhuQmNsVIXgdWlJDlunyIbmM3+2tgh9Eydz5rfHIU4xI+3
	LeZXz7m7JSC7tNDXYFtoZdp+L2g8nRD3ZEEANfkPoHAATyRbKmznh5Qorh7MnmajoCvGWN6xZukdB
	IFIP/NfKihGrZvpnQxspMKJyzN/iLqrhh50+weXTK+7pViqldsYWea6wViQzFhtPpuzsnCFKMd2CP
	9G5NOD7Qw7JGhTVK3bNm4m/NLhRAQaRFE7Uj6Q7Fm6hgDUXqfxp8uukn9Fp7qcbUBzIRBx7Uh+6Zo
	sAtNya0QgC+X1lHrPHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6kO-006Xd0-Qk; Wed, 06 Apr 2022 14:35:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6k7-006XUY-7C; Wed, 06 Apr 2022 14:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zzkoDaINZ+gLK8TuKhSiIzaVc1cKAzjQiu56MMZAxVY=; b=UdEw+O+evcTtk7HiR6VaoTzLVY
 3/hleNnCkSftbhyDgikJuJdN241DKmca5s4HkEoXpp+nL1AnxmzJJLIjxvShTbNQsDhicT1RT6QlX
 bUcNOjKE7e/9FP/Ju8lY4pEoSBlQR57m7/nqtfRITeYDsxj1EOAin17e1uQQZ5oGBTlT2p3o8YFCm
 oz+miU0+7E4pCofLXMI+k7X2GPHAInH2CDhoH2+7pAsksw0BAUgsoFkWJlzB/orNtHhwJ+1VW6uHN
 TuA0ZWjqIfd0ttFCITM5Vw4DidL1GMWCCD+i0UPU61oJN5XEg/D81eRtSrFTBuFQIHi56nwcye+hz
 mxSx3Fbw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58148)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nc6jw-0002tc-K8; Wed, 06 Apr 2022 15:34:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nc6js-0005Dm-H3; Wed, 06 Apr 2022 15:34:28 +0100
Date: Wed, 6 Apr 2022 15:34:28 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>,
 Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH RFC 00/12] mtk_eth_soc phylink updates
Message-ID: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073443_304429_391C8E0F 
X-CRM114-Status: GOOD (  15.85  )
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

It would be nice to get these changes fully tested, but past experience
has shown that for this driver, that's unfortunately very unlikely. So,
I propose that the merging plan for this is that if there are no
comments after three weeks to a month, I'll send this for inclusion in
net-next.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 103 +++++++++-------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  40 +++----
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 174 ++++++++++++++++------------
 3 files changed, 185 insertions(+), 132 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
