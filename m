Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B31C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 17:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3c1k1Q3ApvJaByE7UzpJm0lAyf/Usjo0Wmeo/mAXEI=; b=yoCjXriEHd0doe+U/jGW7kTbgK
	nUV78Zl5/1a3duO8t2r1B1MjYsx4P3MjR+4WGjchFSyzegpJ7zMnQL/GiO2De/aiUD9jrrmTONVqe
	J/wwVjhLdeTCgAOXpaZJAS2/ZNt+CiAYmtwZvr5TA5MOA6rb95CuApVess5hhzfASY0orUlAy+kwT
	0kdkuY4hK2QMmjmUey1kyvHi+3GDfuk2IX6ZPTPCMu8jFqDA/DU6X3iQoTTi+69tyvmkXHYASjGIg
	IbY1GFen/EreRnSRzjjcpsuVk11ms8wP04LtFlv4XjilFNN2GyQiMYdJCag4tGl9jcCvPnG8CwHue
	9CNat9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHwr-00DM1D-D3; Sat, 22 Oct 2022 17:06:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHwm-00DLzv-9F; Sat, 22 Oct 2022 17:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d3c1k1Q3ApvJaByE7UzpJm0lAyf/Usjo0Wmeo/mAXEI=; b=rEvE2qyxhFj7395f/2q7CmUF/6
	o5U4TRsEG6cVOE2W5+64dcet5kM2j3EyCUa+5z8ZTOhq9ZQmxna9AV+O6PgK/ekU6NcASkawnNSEq
	mpY3JZGN82EPHo7RzGiWdgdVzkGFLiZi+dmw3YSP2nWTfBo+DJ7lec3UtD3Iu3U+iSkKrQ7IZX02S
	E9iOBR2HTZFzqHp7td16XXo9aqX5HW5d2415mhvpSq+weh3yTIjLe23EpZeGsTr2cHgunOp8TfdTJ
	LqTwOIGMrkxN95vGOe86qU9rIeeJRinF4OHWnSWU6ZaBBmgjG1ecmz4JdWk8m/gbSceCEFg9qlhiI
	xqa9FVbg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34890)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1omHwa-0001SX-VY; Sat, 22 Oct 2022 18:05:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1omHwN-0005Fx-Op; Sat, 22 Oct 2022 18:05:43 +0100
Date: Sat, 22 Oct 2022 18:05:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
	Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y1Qi55IwJZulL1X/@shell.armlinux.org.uk>
References: <Y1F0pSrJnNlYzehq@shell.armlinux.org.uk>
 <02A54E45-2084-440A-A643-772C0CC9F988@public-files.de>
 <Y1JhEWU5Ac6kd2ne@shell.armlinux.org.uk>
 <trinity-e60759de-3f0f-4b1e-bc0f-b33c4f8ac201-1666374467573@3c-app-gmx-bap55>
 <Y1LlnMdm8pGVXC6d@shell.armlinux.org.uk>
 <trinity-b567c57e-b87f-4fe8-acf7-5c9020f85aed-1666381956560@3c-app-gmx-bap55>
 <Y1MO6cyuVtFxTGuP@shell.armlinux.org.uk>
 <9BC397B2-3E0B-4687-99E5-B15472A1762B@fw-web.de>
 <Y1Ozp2ASm2Y+if3Q@shell.armlinux.org.uk>
 <trinity-4470b00b-771b-466e-9f3a-a3df72758208-1666435920485@3c-app-gmx-bs49>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-4470b00b-771b-466e-9f3a-a3df72758208-1666435920485@3c-app-gmx-bs49>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_100608_614486_380014F7 
X-CRM114-Status: GOOD (  18.91  )
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

On Sat, Oct 22, 2022 at 12:52:00PM +0200, Frank Wunderlich wrote:
> > Gesendet: Samstag, 22. Oktober 2022 um 11:11 Uhr
> > Von: "Russell King (Oracle)" <linux@armlinux.org.uk>
> 
> > Please try this untested patch, which should setup the PCS to perform
> > autonegotiation when using in-band mode for 1000base-X, write the
> > correct to offset 8, and set the link timer correctly.
> 
> hi,
> 
> this patch breaks connectivity at least on the sfp-port (eth1).
> 
> root@bpi-r3:~# ip link set eth1 up
> [   65.457521] mtk_soc_eth 15100000.ethernet eth1: configuring for inband/1000base-x link mode
> root@bpi-r3:~# [   65.522936] offset:0 0x2c1140
> [   65.522950] offset:4 0x4d544950
> [   65.525914] offset:8 0x40e041a0
> [   65.529064] mtk_soc_eth 15100000.ethernet eth1: Link is Up - 1Gbps/Unknown - flow control off
> [   65.540733] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
> 
> root@bpi-r3:~# ip a a 192.168.0.19/24 dev eth1
> root@bpi-r3:~# ip r a default via 192.168.0.10
> root@bpi-r3:~# iperf3 -c 192.168.0.21 #ping does not work too
> iperf3: error - unable to send control message: Bad file descriptor
> root@bpi-r3:~# ethtool eth1
> [  177.346183] offset:0 0x2c1140
> [  177.346202] offset:4 0x4d544950
> Settings for eth[  177.349168] offset:8 0x40e041a0
> 1:
>         Supported p[  177.352477] offset:0 0x2c1140
> [  177.356952] offset:4 0x4d544950
> 
>         Supported link modes:   1000baseX/Full
>         Supported pause frame use: Symmetric Receive-only
>         Supports auto-negotiation: Yes
>         Supported FEC modes: Not reported
>         Advertised link modes:  1000baseX/Full
>         Advertised pause frame use: Symmetric Receive-only
>         Advertised auto-negotiation: Yes
>         Advertised FEC modes: Not reported
>         Speed: 1000Mb/s
>         Duplex: Unknown! (255)
>         Auto-negotiation: on
>         Port: FIBRE
>         PHYAD: 0
>         Transceiver: internal
>         Current message level: 0x000000ff (255)
>                                drv probe link timer ifdown ifup rx_err tx_err
>         Link detected: yes
> root@bpi-r3:~#
> 
> from sgmii_init
> [    1.091796] dev: 1 offset:0 0x81140
> [    1.094977] dev: 1 offset:4 0x4d544950
> [    1.098456] dev: 1 offset:8 0x1
> ...
> pcs_get_state
> [   65.522936] offset:0 0x2c1140
> [   65.522950] offset:4 0x4d544950
> [   65.525914] offset:8 0x40e041a0
> [  177.346183] offset:0 0x2c1140
> [  177.346202] offset:4 0x4d544950
> [  177.349168] offset:8 0x40e041a0
> [  177.352477] offset:0 0x2c1140
> [  177.356952] offset:4 0x4d544950

Hi,

Thanks. Well, the results suggest that the register at offset 8 is
indeed the advertisement and link-partner advertisement register. So
we have a bit of progress and a little more understanding of this
hardware.

Do you know if your link partner also thinks the link is up?

What I notice is:

mtk_soc_eth 15100000.ethernet eth1: Link is Up - 1Gbps/Unknown - flow control off

The duplex is "unknown" which means you're not filling in the
state->duplex field in your pcs_get_state() function. Given the
link parter adverisement is 0x00e0, this means the link partner
supports PAUSE, 1000base-X/Half and 1000base-X/Full. The resolution
is therefore full duplex, so can we hack that in to your
pcs_get_state() so we're getting that right for this testing please?

Now, I'm wondering what SGMII_IF_MODE_BIT0 and SGMII_IF_MODE_BIT5 do
in the SGMSYS_SGMII_MODE register. Does one of these bits set the
format for the 16-bit control word that's used to convey the
advertisements. I think the next step would be to play around with
these and see what effect setting or clearing these bits has -
please can you give that a go?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

