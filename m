Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0D6C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 13:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZ5Z7IQkSGp+/GcqakMzUSRMBWPdISObt9CcYyKchgw=; b=tyNQU9dzn333i7M4HvOZh5IMtu
	Et6+jUUJAGr6S4XfJEAtTuHhKxVpT3i8iN4c2k76MeW14A2nWO8y2fDvo5WL077fvrY02WEUMHj2r
	BCUi6d3lkm0bHJJaJvSNa9DMki4FieneEhNwcYNBMo1NA+li1YxyxpwrytWOLPNVsLnUmKCRhFmYr
	cI2AR4CFi8ZCu/OUhVyaMIbKAKb1gItaMJpoMG0zBE74pghlnbHk4+uDQJsSC1+Npt7ZAZj63MC5E
	1sEhzxX80I04/hHcmpH4cAHtUznFT+X8zrTAk33y+dSOywdWeMVzh1KaFQqgDItmUj3pOVtiWL5e3
	ogihk8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ifs-000WCQ-Tq; Tue, 05 Jul 2022 13:33:08 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ifq-000W9Y-Nu
	for linux-mediatek@lists.infradead.org; Tue, 05 Jul 2022 13:33:08 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 76so6223986ybd.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Jul 2022 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YZ5Z7IQkSGp+/GcqakMzUSRMBWPdISObt9CcYyKchgw=;
        b=dGp1wVrWBruiIZdrlPjcqZpdDSpDNsFZgC0ZryKaMwSz0wOob9lSLCwHY0QoM4IGTF
         kuIPbAdyJ61cZzZl3Ps3GfSqyt4ebGzQAKW2y9ezR0IZyQTweXhmesmm72sOuCLnvedY
         ftHGFbg/yqN1MwYSW1Hsh4Nkn6g+SAfRtFO827d2QDeFAUw/ky8t93hA21OFGszO2mJ4
         1kC4szOTG9+YhAy4fEt9DXS69HFk3RMenjPknmPYgI1EmU0kP3k4KHOlZGTKjQk1L13K
         Wz0/TGn1vUab6680798fju1GEddmiotYQbAgDKx+49tzqTSaq4CSJDBEwr+9rxM9uK+l
         XjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YZ5Z7IQkSGp+/GcqakMzUSRMBWPdISObt9CcYyKchgw=;
        b=BLixDS7jccgeTA2uausKI7ipfqjIloyWvWpd2pDc1xV+UHAT13sclAPtJF8oIg4heg
         XxtZfAE8j82xM5Vh47yBm4AodA9TOU96pVA/1TwF4wxQd9+hZOSIWsAGVDP/HC8AmRji
         DtUx+zzEMoerMTAAuNadugQ6mQkYTm9SlVpcwtHUXRTrT1qJCJxJJFuALq3GVFVookwG
         e70QmzYes5FUhE/eXIFEW4TJZv3yAJa2WaPz2Ucq30GfnCuRkLTukjjP++NDHv8A1RgD
         PJ9MI6dN1ulG6uSnhqrNgdU3NRjHUkyuImSumN35xF0gEOJ67RPTkdUSjXxDcKMLx5e2
         Iqmg==
X-Gm-Message-State: AJIora9Uk4B0s1kXua+SElj/8rjKG3mTL/V7uE5n80dIMypBf8ur9s5C
	w8/TPOJfe+eSelfVK35bXZQD4ORRNCZDbZRVq4ETiw==
X-Google-Smtp-Source: AGRyM1s/tBIfQJsRN9Pn5tpBMoyVZJLkQyOUHDo5ao3pg7usrAXJq6et24qPIvWHQI0hhrZsky6Z3ZsgPy6IAOZDLo0=
X-Received: by 2002:a5b:c03:0:b0:66e:3f24:b0b4 with SMTP id
 f3-20020a5b0c03000000b0066e3f24b0b4mr13957262ybq.492.1657027982108; Tue, 05
 Jul 2022 06:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220705142236.1fab0033@thinkpad>
In-Reply-To: <20220705142236.1fab0033@thinkpad>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Jul 2022 15:32:50 +0200
Message-ID: <CACRpkdb1Z3jWy2VO2EiZ3JO_JtHz7xt24_bTcxCwGkLekea3AA@mail.gmail.com>
Subject: Re: DSA: request for your help with your DSA driver
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alvin __ipraga <alsi@bang-olufsen.dk>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
	DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, George McCollister <george.mccollister@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Landen Chao <Landen.Chao@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com, 
	Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Woojung Huh <woojung.huh@microchip.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_063306_825611_EADFF11B 
X-CRM114-Status: GOOD (  14.94  )
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

On Tue, Jul 5, 2022 at 2:22 PM Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> It is very probable that this will break your drivers, and so I ask you
> to look at the RFC series, maybe test it, and give your comments or
> additional patches that make it work.

I've seen Russell's patches and looked at the impact on the drivers
I maintain:

drivers/net/dsa/realtek/rtl8366rb.c
Uses
phylink_mac_link_up -> rtl8366rb_mac_link_up()

This will simply (possibly erroneously WRT the API) force the
CPU port link into 1GB mode with no autonegotiation and then
enable the CPU port.

phylink_mac_link_down -> rtl8366rb_mac_link_down()

This will disable the CPU port.

I suspect this is maybe not ideal. I look at the (a bit horrible) vendor
driver and I see it supports forcing:

- Link Up/Down
- Link speed (10M, 100M, 1G)
- Duplex (full/half)
- Optional txPause
- Optional rxPause

I suspect I should be handling all this properly with the
.phylink_get_caps and augment .phylib_mac_link_up to properly
force the requested features.

I'm a bit uncertain about .phylink_mac_config callbacks?

It seems if I should fix up this incomplete implementation I'd best do
that on top of Russell's patches? I can also test with the patches
applied but the way this driver (ab-)uses the API I think it probably
us a no-op.

The other switch chip I comaintain is drivers/net/dsa/vitesse-vsc73xx-core.=
c
which isn't using any phylink callbacks at all, just .adjust_link.
It might need some good patching as well but I am uncertain
where to start with that one.

Yours,
Linus Walleij

