Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 14:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sf8UnIYrQ0opw9G80LVqpejkFhVvlxXqMkSawCeK6ds=; b=DsreSIdHlbSK7L5PgVgEAUTU2h
	RU1PEM7YaDCfCeg3R2CSEY8ZK6Vs7pIABeleqEIJ9wcpGIGWLxCLjzBZlLKbwoOu43RLHY0qVZoiK
	JEnLVAOS1JLIuccVYqqa0KCdKXG4LBl5y8lO/fdMQo8UF/3PbNQD1Wv8pzJ2SGDyK18eRmN+SxoF/
	ikLQ36T55hsnMZAXojafP5rCdjxdlik6GTgY/aen1D3btQ8Lqih9LEDC+xjozmwKQKg2QPsXzxVY9
	l0px6EJ9vYsH3GWlW4L/XkQ+4KooIlpGR5dhALY8T4EZNKYcrD3UACLV1eQd4OhtbqlunlQmJRh/l
	JCw07ImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jHj-000jje-So; Tue, 05 Jul 2022 14:12:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jHW-000jfL-JW; Tue, 05 Jul 2022 14:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sf8UnIYrQ0opw9G80LVqpejkFhVvlxXqMkSawCeK6ds=; b=pIIA88AbSDSnHLOegzn2KGbJGp
	p4CKOF3tXiXWrrXWb2Bn978kVTcGePa/Et99GoxZ8gL0W+edX6L5gjS5ZAzSfwQp6HeOaTkDS/9zX
	z+g+Sv3sYwrBUvL/cRp2yu7a0dKjKa3/STWpHfd2KgKKyeN4b+GXwpiyAdAuON1ykvyBj6MMEGI8S
	NpvfJqh+P/Ym35WdGRWdGvKbnv49oncAkmTybKBCooAxl0OvmH2EahQ5gz0gwB3sYu575ICH8mIyy
	z964Us3tq4igj5wEvFK9vHAuZTUP2gjWzAr42IYVnW10ehM6Y34x7MWGgTdd9omb8lUJCoNkrNZZc
	oHI0A3og==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33192)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1o8jH7-0001OF-Rt; Tue, 05 Jul 2022 15:11:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1o8jH2-0003PP-0O; Tue, 05 Jul 2022 15:11:32 +0100
Date: Tue, 5 Jul 2022 15:11:31 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	"UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: DSA: request for your help with your DSA driver
Message-ID: <YsRGk1Z257N6OgzD@shell.armlinux.org.uk>
References: <20220705142236.1fab0033@thinkpad>
 <20220705134542.u4hi5acol4ws5mlo@bang-olufsen.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220705134542.u4hi5acol4ws5mlo@bang-olufsen.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_071202_683274_9E2FC9AD 
X-CRM114-Status: GOOD (  14.06  )
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

On Tue, Jul 05, 2022 at 01:45:42PM +0000, Alvin Šipraga wrote:
> For drivers/net/dsa/realtek/rtl8365mb:
> 
> I think we are OK. The .phylink_get_caps op will populate
> supported_interfaces faithfully for all port types, so in the absence of
> a fixed-link I think it is perfectly fine for phylink to calculate the
> highest speed interface and use that. The driver and hardware will be
> able to support whatever it advertises.
> 
> From reading the series I understand that the behaviour for DTs with
> fixed-link will remain unchanged.
> 
> With the above in mind, I think it's fine not to set default_interface
> in the .phylink_get_caps callback? This means "let phylink decide the
> most suitable default".

Yes, that is correct. Thanks for taking a look.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

