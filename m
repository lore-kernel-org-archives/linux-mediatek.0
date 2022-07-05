Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38284C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUoK9UQUhSqzH1l8r/dSOXQ7dtAmmSxTrDlRxUddIWs=; b=Z3XpSzUlO5oLXBGaF2XKPy0ITT
	Zgo3IxHU5a+hvOWmRsQiSVWSps95/LZVKDyECYfPhkhaaHvXkF2qdFmT9Q2zx+Aj+2sa8iQv/6FH6
	ewbEv5yrFw/wGazznKh7CoNTyC2qa918Qhm3ntjQq1rUwSt5rIECzVH8XlINi1/5G3Sg59RcbRWMq
	6T8ER8+5PZ/p9Jbrzc5+o8p9ZzP4IS3UCXHCtWgBCmrCs99gu+OSN+Fe8ANTv3DADsGLdy/o+1T8b
	G3wNQtX9iZVh5Dc/Gw22cIg2lnIXJQlBLt6lhDbOOCSvZ1uyvap6oHdNiUwCixip/HYeyTzeicFe8
	pozlSRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jrH-000wod-RI; Tue, 05 Jul 2022 14:48:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jr6-000wmm-Qb; Tue, 05 Jul 2022 14:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GUoK9UQUhSqzH1l8r/dSOXQ7dtAmmSxTrDlRxUddIWs=; b=TgNS047Wpm9D+ufIhq/QStUVTn
	NYAON1kWOq/7fzmoBdv0soq+OibOav7fKmPcJogLyWMaw8vuDWQJOt3DjFNXLaw090h0R7+l48kG+
	jNrdK//b+93K+VRSVd3U3oNFNLZbWAUo7EWa582+SS7IwEMNq9zCQbOMJ/nB3xIXlytqGVDRC6E0n
	/dQSuDTVQo8diCWGmeOdBawFwjNRVnDuUygKrbjpz39xXj8webGA/NF1yAzM8aijlOQjsBgX1LNkk
	MsxJx1S5On85y4MoZorpzCDD20WrhhC8em9dpZ3iTjEXk/F65c1A2IHdFe225dps60GTeLtjo+IAR
	sYKa5vNA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33194)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1o8jqr-0001S0-Jk; Tue, 05 Jul 2022 15:48:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1o8jqn-0003Qp-U8; Tue, 05 Jul 2022 15:48:29 +0100
Date: Tue, 5 Jul 2022 15:48:29 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
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
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: DSA: request for your help with your DSA driver
Message-ID: <YsRPPdMc31hTHH5A@shell.armlinux.org.uk>
References: <20220705142236.1fab0033@thinkpad>
 <CACRpkdb1Z3jWy2VO2EiZ3JO_JtHz7xt24_bTcxCwGkLekea3AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb1Z3jWy2VO2EiZ3JO_JtHz7xt24_bTcxCwGkLekea3AA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_074848_899398_5B1432D7 
X-CRM114-Status: GOOD (  22.55  )
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

On Tue, Jul 05, 2022 at 03:32:50PM +0200, Linus Walleij wrote:
> I've seen Russell's patches and looked at the impact on the drivers
> I maintain:
> 
> drivers/net/dsa/realtek/rtl8366rb.c
> Uses
> phylink_mac_link_up -> rtl8366rb_mac_link_up()
> 
> This will simply (possibly erroneously WRT the API) force the
> CPU port link into 1GB mode with no autonegotiation and then
> enable the CPU port.
> 
> phylink_mac_link_down -> rtl8366rb_mac_link_down()
> 
> This will disable the CPU port.
> 
> I suspect this is maybe not ideal. I look at the (a bit horrible) vendor
> driver and I see it supports forcing:
> 
> - Link Up/Down
> - Link speed (10M, 100M, 1G)
> - Duplex (full/half)
> - Optional txPause
> - Optional rxPause
> 
> I suspect I should be handling all this properly with the
> .phylink_get_caps and augment .phylib_mac_link_up to properly
> force the requested features.
> 
> I'm a bit uncertain about .phylink_mac_config callbacks?
> 
> It seems if I should fix up this incomplete implementation I'd best do
> that on top of Russell's patches? I can also test with the patches
> applied but the way this driver (ab-)uses the API I think it probably
> us a no-op.

It would be good to know that this series at least does not break the
driver.

> The other switch chip I comaintain is drivers/net/dsa/vitesse-vsc73xx-core.c
> which isn't using any phylink callbacks at all, just .adjust_link.
> It might need some good patching as well but I am uncertain
> where to start with that one.

I don't see anything obvious in there which would prevent a conversion,
and I'd suggest doing it after this series has been applied, as it makes
the whole way phylink gets used in DSA much more sane (i.o.w. phylink
always gets used for every port in a phylink-converted DSA driver,
instead of only in most but not all situations.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

