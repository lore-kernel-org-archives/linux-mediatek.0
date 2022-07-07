Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 10:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZ+bPiROGTE8sHDprL7+lIw6Ab8tvR3a5jFg3qvX6mQ=; b=PyT3a6FtfQnmuyJPlCI7KEXz/R
	kjWvhEmAynkP6sO60qNw9oKTJ02ufhd2LwB5WSzif5NCS3jFTThaVqgEWks2Dh83j2v31r5l58YBM
	HVcwrUsDMOWt82pZE3t/Xs0kayo3gs6WUKv3tcaabcXj92woZpY7LqMo6N9aKE1651JMsycU4v4jG
	KHDjtVvhGDGE2TqVcYoQMTqcCvVoo9GdXmheMpo7xQ7fvqWM0DVO+ndVDo6j9L2fBA9+owpQeZVGj
	eieroF1jPIVTT/5qwB/62SxpUcAoMC8tc1toXO9YYoOjNB67hxBpjjS0SDwjY2DgaLKksCo/sZ4xr
	Jkoknjcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OSk-00FWWo-T4; Thu, 07 Jul 2022 10:10:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OSZ-00FWSQ-T3; Thu, 07 Jul 2022 10:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eZ+bPiROGTE8sHDprL7+lIw6Ab8tvR3a5jFg3qvX6mQ=; b=02iAzfeQ/yZqUO0/u3P+egYNDe
	R+W1qsGOemDKoKnkb7E4WifOYghSXtaClenT7GWjMlP7OtSEBBJaNg0wcyLjePxJNO3PrbRwJydju
	PsboGgnKZ4qlS1yma9Xj1QuVjV66NVGqucHHeiqWVc87F0ZzfiMXHjsDNrtoB2lZelCjtAdqctguB
	DsXgfJ2cnxDmM/nnwP/zeQJHk4WV/fB5zmk+IvBdCunKzUefYJ2ncNQywrX4Ta0cjuiZKrFW3X5VD
	B7PRWCqS76RsGTC5HiXAnJF2M6mCFZThbKtLWbvVHpNe2rAb2MoeNuytPAVMU1UgKyeqr+Qwp0cIX
	0zzlLeGQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33216)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1o9OSH-0003k1-4N; Thu, 07 Jul 2022 11:09:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1o9OS7-0005CP-R5; Thu, 07 Jul 2022 11:09:43 +0100
Date: Thu, 7 Jul 2022 11:09:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH RFC net-next 5/5] net: dsa: always use phylink for CPU
 and DSA ports
Message-ID: <Ysaw56lKTtKMh84b@shell.armlinux.org.uk>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
 <E1o8fA7-0059aO-K8@rmk-PC.armlinux.org.uk>
 <20220706102621.hfubvn3wa6wlw735@skbuf>
 <YsW3KSeeQBiWQOz/@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsW3KSeeQBiWQOz/@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_031011_989446_1F1C2222 
X-CRM114-Status: GOOD (  19.66  )
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

On Wed, Jul 06, 2022 at 05:24:09PM +0100, Russell King (Oracle) wrote:
> On Wed, Jul 06, 2022 at 01:26:21PM +0300, Vladimir Oltean wrote:
> > Can we please limit phylink_set_max_link_speed() to just the CPU ports
> > where a fixed-link property is also missing, not just a phy-handle?
> > Although to be entirely correct, we can also have MLO_AN_INBAND, which
> > wouldn't be covered by these 2 checks and would still represent a valid
> > DT binding.
> 
> phylink_set_max_fixed_link() already excludes itself:
> 
>         if (pl->cfg_link_an_mode != MLO_AN_PHY || pl->phydev || pl->sfp_bus)
>                 return -EBUSY;
> 
> intentionally so that if there is anything specified for the port, be
> that a fixed link or in-band, then phylink_set_max_fixed_link() errors
> out with -EBUSY.
> 
> The only case that it can't detect is if there is a PHY that may be
> added to phylink at a later time, and that is what the check above
> is for.

I've updated the function description to mention this detail:

+/**
+ * phylink_set_max_fixed_link() - set a fixed link configuration for phylink
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * Set a maximum speed fixed-link configuration for the chosen interface mode
+ * and MAC capabilities for the phylink instance if the instance has not
+ * already been configured with a SFP, fixed link, or in-band AN mode. If the
+ * interface mode is PHY_INTERFACE_MODE_NA, then search the supported
+ * interfaces bitmap for the first interface that gives the fastest supported
+ * speed.

Does this address your concern?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

