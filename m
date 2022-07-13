Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC4EC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 14:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJlaya3bj+MoS5OVPgQllizfALxL2/jWhyLEifRnbl8=; b=UxZP9WrgJP3QBe2sSAOLv2I5gP
	FB1p3vWchKVeOWo4VTJLYHSnVEGm3gp8vXW/5P7V53EoNSGlJk/Ela+NVRjyxvzyyoQGy9W4ZsDJ/
	aVeTw1vZYfe/T/DkmvVowb4W1tvz+uCXoqfOZLZ3hsoAwDV9z/dKSvLvY21hapZACNVOX4rUxpzN8
	wdFf4MTnvFqHcyV3Lu9cFCqfGiHgRLvDXHKamSJfIbiuFerYaFflMPfoT/1/mSQZzqV53KyxPk9FM
	OE9yV1G2W1mqr8IXZ3Hca9pvJqdKT0VlEcP8BiwCw+bKJ0cmd/FCpuSZA1vneikz+w54pBLZ4wT5U
	IuxefaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdgl-004jP3-NC; Wed, 13 Jul 2022 14:50:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdgZ-004j92-7P; Wed, 13 Jul 2022 14:49:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 95F5561E09;
	Wed, 13 Jul 2022 14:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4B2C3411E;
	Wed, 13 Jul 2022 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657723794;
	bh=ZJlaya3bj+MoS5OVPgQllizfALxL2/jWhyLEifRnbl8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sSYaYXACNRKzzvzpT00ioaFUcDG5yM5b4gVemr0HubsMlIIQHRKNc3EpjjglmOE3Y
	 ptn1xrd+m1KVimqL2OOtZ9mi3/Io4iYQcIYH1tvpmdFC7e50E1f9RC0jPEtuwmH2hs
	 20Tfb1vaUMzfkVTP4xUWOCM4A1XsZ0WDIuh+chFPwecQhKOs18udPveRTzkXBNjnE7
	 bWYtueeALl7mCWbqgXxrAzEjCaWREQ4cPhna6fybe/fafEp15HSxgSJV/tQE3kwPrB
	 Z9JaGIK/xx4BxTTZQTBbZpbUjcjprY3mitu6s4f2avNaE6Q9ssmRIpFibNt2D6OVcN
	 Pf3XAS9zAUPFw==
Date: Wed, 13 Jul 2022 16:49:44 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, "Alvin __ipraga"
 <alsi@bang-olufsen.dk>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Daniel Scally <djrscally@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Jakub Kicinski
 <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, Landen Chao
 <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next v2 6/6] net: dsa: mv88e6xxx: remove
 handling for DSA and CPU ports
Message-ID: <20220713164944.317f5d9b@thinkpad>
In-Reply-To: <E1oBd28-006UDF-6Q@rmk-PC.armlinux.org.uk>
References: <Ys7RdzGgHbYiPyB1@shell.armlinux.org.uk>
	<E1oBd28-006UDF-6Q@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_074955_322499_BD9A2227 
X-CRM114-Status: GOOD (  12.28  )
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

On Wed, 13 Jul 2022 15:08:08 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> As we now always use a fixed-link for DSA and CPU ports, we no longer
> need the hack in the Marvell code to make this work. Remove it.
>=20
> This is especially important with the conversion of DSA drivers to
> phylink_pcs, as the PCS code only gets called if we are using
> phylink for the port.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

