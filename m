Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NU8OypqVZWbDq3LN3K/TRKjJTK+Vb+/xX2ssPq6Xf8=; b=p8vfbs9nr8tJN0
	R6wlziN4MqqzSaA9ULA6r6VWYVf0RL1Nbsyb2OYfbFHZGW8vDPfE3Drie208S2/4TFSluWYtd4v+A
	c8/JEKKsE/uxK43Cladc8nbolN4Nzp1wHXrSHspuzZICNI95mG8OIs7JnuFZ8gJun0FD6EHJ4UJZB
	sFpyUIGieur65kkI97zPtxKoG4FmYruW5doQLoBE7+2oI2W0ZCk17NiODSUk5M4uVUJI3KEXYf9Hg
	R0qQKeJTWHpl+QGyuWc6qxhz+K9cFfkIYgthKI9XnXlbJWkn/SOVuLQwOevv+ZvF2FcCQcd/N9jsv
	x0fbNw11Rg0eX3SOiBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndu7z-009AXJ-Qv; Mon, 11 Apr 2022 13:30:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndu7n-009ATp-4N; Mon, 11 Apr 2022 13:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nWobsV/+KPeCMvMr9OiCUDsatbyuU3uq3Cjnj3cPUVU=; b=VYHOOaB6u7ojLHmk9jy8mqibh6
 2iOxiaMB9Bdk6ac9eYbKkbcEkzbsDkfDi0l3CzV+OWPZwTDQL4DQnlHQAWvafWnaI7dsFHIWGUGSA
 H6nPuA8JBp7qg9KJcqMwXyP2B5SuynGn1zgbMCAW3f/Le3mdILUs9rIZKrnwtZgqy3ByiR+Ty+Y0w
 n/I/pAV1LBd0/NotBa3SXCzB63S5Qap/ZnpLMcXPQo65cO/Pif70tRfxfT0gq5ZBIV4nNR0sVveyJ
 AMGvj8yuIBoSlNofyfqtqdy747Ck58OUm2rsv3x54yTpTIY1wJIko1Tjxql9T4bwtm3o9hpPmMQHC
 vE3P5jrA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58212)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ndu7c-0000aU-HX; Mon, 11 Apr 2022 14:30:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ndu7X-0001Rm-TU; Mon, 11 Apr 2022 14:30:19 +0100
Date: Mon, 11 Apr 2022 14:30:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>,
 Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH RFC 00/12] mtk_eth_soc phylink updates
Message-ID: <YlQta3Qu1aM4De9n@shell.armlinux.org.uk>
References: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_063035_216161_DED44D9B 
X-CRM114-Status: GOOD (  25.70  )
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

A gentle reminder to those who either worked on or who look after
this driver to test this series and report back please.

Thanks.

On Wed, Apr 06, 2022 at 03:34:28PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> This series ultimately updates mtk_eth_soc to use phylink_pcs, with some
> fixes along the way.
> 
> Previous attempts to update this driver (which is now marked as legacy)
> have failed due to lack of testing. I am hoping that this time will be
> different; Marek can test RGMII modes, but not SGMII. So all that we
> know is that this patch series probably doesn't break RGMII.
> 
> 1) remove unused mac_mode and sgmii flags members from structures.
> 2) remove unnecessary interpretation of speed when configuring 1000
>    and 2500 Base-X
> 3) move configuration of SGMII duplex setting from mac_config() to
>    link_up()
> 4) only pass in interface mode to mtk_sgmii_setup_mode_force()
> 5) move decision about which mtk_sgmii_setup_mode_*() function to call
>    into mtk_sgmii.c
> 6) add a fixme comment for RGMII explaning why the call to
>    mtk_gmac0_rgmii_adjust() is completely wrong - this needs to be
>    addressed by someone who has the hardware and can test an appropriate
>    fix. This fixme means that the driver still can't become non-legacy.
> 7) move gmac setup from mac_config() to mac_finish() - this preserves
>    the order that we write to the hardware when we eventually convert to
>    phylink_pcs()
> 8) move configuration of syscfg0 in SGMII/802.3z mode to mac_finish()
>    for the same reasons as (7).
> 9) convert mtk_sgmii.c code structure and the mtk_sgmii structure to
>    suit conversion to phylink_pcs
> 10) finally convert to phylink_pcs
> 
> It would be nice to get these changes fully tested, but past experience
> has shown that for this driver, that's unfortunately very unlikely. So,
> I propose that the merging plan for this is that if there are no
> comments after three weeks to a month, I'll send this for inclusion in
> net-next.
> 
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 103 +++++++++-------
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  40 +++----
>  drivers/net/ethernet/mediatek/mtk_sgmii.c   | 174 ++++++++++++++++------------
>  3 files changed, 185 insertions(+), 132 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
