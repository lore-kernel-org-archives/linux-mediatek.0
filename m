Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BD9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 09:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIsxH68If12l6e8ZGZ2goEGKTqqr0gJFrRG91cWniFs=; b=OjNyev8ip3Uhy2okbJ12zquEQx
	V2xU7e+m9KgV/n7xuozIqN4NgDuKL+wKfQoFRW3JA+9hV+IZTUXl+Ivt/OVzyXIZq2nZZPzVn2Kw9
	jobOFdKzJHllR3Q5MpVf9a/c+VIuTcNWhvioyGkYgA3CN9d0XCzk9hxgXuNyjEhq5u7xBKagGyQuF
	UDOy1wYiBjqP7CPk+MOazf8juhTqdiacaweCb5ZIo0LSWS2sbgZcqM/dnLt2653F12QnqWYH6t0hP
	h2ksdarO6iC8Rv9c0LuD7rRLhvM1rkAhGxBDqXQlmM57hB3a1h+gB2VnoxYIbMpPGmGP2U0Bng7cG
	SL3X93HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Tzx-00Ag5K-3n; Wed, 29 Jun 2022 09:28:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6TzP-00Afjk-9m; Wed, 29 Jun 2022 09:28:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D66BB61DF0;
	Wed, 29 Jun 2022 09:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B7FC34114;
	Wed, 29 Jun 2022 09:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656494879;
	bh=zIzhNyDC6fL9K9eUM/aov3cJHME6f/of4wgLpItd2wg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gL5d1pDXiFrYmG1vipwNaPNaeo24jSfkfosQHThuaPsHqY/kw7NisJebTx8Cap+aw
	 xZLsVP8zkxiSWDbwbwR06IxiblOwZfCQ/HU19xiJWQ9O3TbNmYTpZTf5xqPofYt7y3
	 K52iRF/WIsV/CzDHbLpaBb6Phvwl/viS/5Jy8CQfh74LTYWrtdiAlW7C8nw0JrmZGf
	 ROtIHjc+8DIzb9dI5+xNXZwXC30i8U3ElT6vDoNbzT35rEdB9UfXrlP6nguAApbyyA
	 L6IRhPrxCDPBGk6CDOrKXzC5f3EY6+nFMRpA4WbnHhDJ2RkN3KnfbnfoLEEbSGWb2M
	 L74KvBGl1belQ==
Date: Wed, 29 Jun 2022 11:27:50 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alvin =?UTF-8?B?xaBpcHJhZ2E=?= <alsi@bang-olufsen.dk>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, "David S. Miller" <davem@davemloft.net>, DENG
 Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Florian
 Fainelli <f.fainelli@gmail.com>, George McCollister
 <george.mccollister@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Jakub
 Kicinski <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, Landen
 Chao <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next 0/4] net: dsa: always use phylink
Message-ID: <20220629112750.4e0ae994@thinkpad>
In-Reply-To: <Yrv8snvIChmoNPwh@lunn.ch>
References: <YrWi5oBFn7vR15BH@shell.armlinux.org.uk>
	<YrtvoRhUK+4BneYC@shell.armlinux.org.uk>
	<Yrv8snvIChmoNPwh@lunn.ch>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_022803_422094_14827A72 
X-CRM114-Status: GOOD (  21.13  )
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

On Wed, 29 Jun 2022 09:18:10 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > I should point out that if a DSA port can be programmed in software to
> > support both SGMII and 1000baseX, this will end up selecting SGMII
> > irrespective of what the hardware was wire-strapped to and how it was
> > initially configured. Do we believe that would be acceptable?  
> 
> I'm pretty sure the devel b board has 1000BaseX DSA links between its
> two switches. Since both should end up SGMII that should be O.K.
> 
> Where we potentially have issues is 1000BaseX to the CPU. This is not
> an issue for the Vybrid based boards, since they are fast Ethernet
> only, but there are some boards with an IMX6 with 1G ethernet. I guess
> they currently use 1000BaseX, and the CPU side of the link probably
> has a fixed-link with phy-mode = 1000BaseX. So we might have an issue
> there.

If one side of the link (e.g. only the CPU eth interface) has 1000base-x
specified in device-tree explicitly, the code should keep it at
1000base-x for the DSA CPU port...

Marek

