Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C7CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 07:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cq59VQ2dSHE6xaI7Pbsqqgq8D5533IX7o8SCXesMJIs=; b=l9c6f+D4Qnlj3HIYPl7IRldS7f
	RnGOq8ZTN528jXo8TfYdTCO/HnAJ030sFNPG32PdTc2WTF+30Q9VMvgegDr13rWy7Cz7YoGeYAiUi
	MFNSoLLjnJdFzmbJPuF9GsFTmu+wZXO/xB6AfwQHQn1R+2YCaYoRfldlNOMCmwhSlzkUCGOK4JcOS
	jRU+DJ6P+yNezAycsNkdiUmi+Fgx6mU/Kf6nYXe/BLWOWngvPfE8MLCgiBofLX6LZW282nmGQzEBC
	f+htgjnqOtDWslDvbQOQU5S0rHSJcyRGr61OGkQiMybI/ZtMcs9ERvF+zvbpkf0w/H5MA78tL7mAy
	ANC8I9/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6RyN-00A3nG-Jh; Wed, 29 Jun 2022 07:18:51 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6RyA-00A3k9-LS; Wed, 29 Jun 2022 07:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Cq59VQ2dSHE6xaI7Pbsqqgq8D5533IX7o8SCXesMJIs=; b=JXYLFEoJvCJ6PtUCZrHzXOhlrH
	cn+qk8P7DL6mDrz2hWRosAyg/fnsg9NMu57z5oFPFi2We6yU6jDLs8X9gPa/YZ5e97NqhtdL6fw1a
	q7bY8ljFm36fkcazi3TeVZB9wpP33S9YfniJgDXuG+MF5mChu/CsG3iaRx7SL68iUmOk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1o6Rxi-008gMy-4y; Wed, 29 Jun 2022 09:18:10 +0200
Date: Wed, 29 Jun 2022 09:18:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
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
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next 0/4] net: dsa: always use phylink
Message-ID: <Yrv8snvIChmoNPwh@lunn.ch>
References: <YrWi5oBFn7vR15BH@shell.armlinux.org.uk>
 <YrtvoRhUK+4BneYC@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrtvoRhUK+4BneYC@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_001838_742302_2A651565 
X-CRM114-Status: GOOD (  12.07  )
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

> I should point out that if a DSA port can be programmed in software to
> support both SGMII and 1000baseX, this will end up selecting SGMII
> irrespective of what the hardware was wire-strapped to and how it was
> initially configured. Do we believe that would be acceptable?

I'm pretty sure the devel b board has 1000BaseX DSA links between its
two switches. Since both should end up SGMII that should be O.K.

Where we potentially have issues is 1000BaseX to the CPU. This is not
an issue for the Vybrid based boards, since they are fast Ethernet
only, but there are some boards with an IMX6 with 1G ethernet. I guess
they currently use 1000BaseX, and the CPU side of the link probably
has a fixed-link with phy-mode = 1000BaseX. So we might have an issue
there.

	Andrew

