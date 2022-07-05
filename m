Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D63C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbDeC1AlBuTOWfz8CZE8RhaedXa7BIQPiHinMtouYyo=; b=DzL+DngbUqE6p1WXLpOuKvlVk6
	ARVEza9dVNluaov3/qJmb6twnK3FXGTFYqpIGSFMmxwm4BPdCXoGBT1P2c/HHKvAImzfELFLXkM9x
	NislR0kSvgGcuRRbIBMcEVzujpc4R5Hu+Nl1KSAeyVFO6U3Rj5YKjaXWaLap7QhM2YbGOYRi1O292
	hJ1MF495x28UaJzl92xQy6AtA2LHkHr5aEQXtcqLZpjlwJl5opSZ0CSeIj+L3yWJAHBjmS2QN3Whf
	UE3kr6LvoLB1ctH1plqHYTIjNobv4WiT7MQ8/x3wUGRwdAt4wg/4JdVI1JauruOXcavCDcEUXENAz
	MRe3AvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8gGX-00HJLC-W0; Tue, 05 Jul 2022 10:58:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8gGM-00HJGf-0K; Tue, 05 Jul 2022 10:58:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7F5F560AF9;
	Tue,  5 Jul 2022 10:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790F1C341C7;
	Tue,  5 Jul 2022 10:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657018716;
	bh=bbDeC1AlBuTOWfz8CZE8RhaedXa7BIQPiHinMtouYyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UlpXbHB7ZZ++kGerjYF15oZgtXRRxUaGQrHVmnacNBPwa8j3eq/fMMYn36Gs87qMu
	 G7UDGXmZBOEsBYTGcOyt01SXyJ6xU3QU1seAuKU257EDinBMvpusIRBC1c0XjiY+UU
	 RINzLXKZ75iZuI6sckFv26LTTetgO0UcTaGUY0nc5XdXaAbFDCxfKg3Jv2pIEcmTAH
	 pytVnlfQVF8P14YlhHAzigh36W4Gw3prqZpTz0wdTZYfuTJJL/kQ0HT2mIwHsniOnK
	 EzXM+VOOYoqnvpvbRbmqQiEsSGnGgHLDBHi+d7duveo0DxOnLYSMJucL+avpHK5nsK
	 Irv7aIWnRGdew==
Date: Tue, 5 Jul 2022 12:58:28 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, "Alvin __ipraga"
 <alsi@bang-olufsen.dk>, Claudiu Manoil <claudiu.manoil@nxp.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Hauke Mehrtens
 <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>, Kurt Kanzenbach
 <kurt@linutronix.de>, Landen Chao <Landen.Chao@mediatek.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next 4/5] net: phylink: add
 phylink_set_max_fixed_link()
Message-ID: <20220705125828.2e7c8296@thinkpad>
In-Reply-To: <E1o8fA2-0059aI-EN@rmk-PC.armlinux.org.uk>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
	<E1o8fA2-0059aI-EN@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_035838_126147_1E6C838E 
X-CRM114-Status: GOOD (  13.57  )
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

On Tue, 05 Jul 2022 10:48:02 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Add a function for DSA to use to configure phylink, in the absence of
> any other configuration, to a fixed link operating at the maximum
> supported link speed.
>=20
> This is needed so we can support phylink usage on CPU and DSA ports.
>=20
> We use the default interface that the DSA driver provides (if any)
> otherwise we attempt to find the first supported interface that gives
> the maximum speed for the link.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

