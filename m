Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ki3Il3DnBY0QlDat/5g0CnbI0kYoYCMqVu2X4F/0W8E=; b=gI2pxbk8EXr2wHUcSarFICkGxb
	vTalJdW6cm7y31HotJLU3F8VfSeo00G1+pOEdHnk0fHuq9pC73CMy8gD3dkdcLpSqxq59homRHaK9
	tED+oSEBCw0l05BMSv5IEbb17NSRxxevhYc7rtvBdaWDQDvmNXbeM5gybPK8IskO6hLHwWbUXTz/r
	Zbg4Q/DVH69sbgHG9VwmHPDvv2qQJL59Hqe+ReJVdLgyVZHRiq26fw76adlHBhdoJNzXXBj9Arz4O
	BSoNuf9P+4Evv8EbtdYOt7IiXLeP2np9/LtxkoREEwfb5dtS3qKYCiSvrPIPWZRAOmOTlXVjHFZ3r
	Zavzt1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8gDE-00HI9M-CU; Tue, 05 Jul 2022 10:55:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8gD2-00HI5u-MB; Tue, 05 Jul 2022 10:55:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E6B7FB817AD;
	Tue,  5 Jul 2022 10:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EE4C341C7;
	Tue,  5 Jul 2022 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657018509;
	bh=Ki3Il3DnBY0QlDat/5g0CnbI0kYoYCMqVu2X4F/0W8E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pBsF4oVT5py0/qMuyBsxVgtedQGhBDne/OXAPKU/IEJoN5H42JRBhW8WJURZKgc+V
	 7WSeFv3FMQ8x563aq0wH4F/S3XQQxaVaVL1o3Ko+DhQGVWrAXBozU9gaRfBuwYWYgc
	 3NRog0EEQJ6wqC3y8oe0DPtm8FdsmhXtavcuZfS+cLCnlRsMkJHfAGFyrlSNua8YhP
	 c3IGt0c8pzLxrbbaymOB4Vzj/BHGHRKbcJIgUjaKhUONXkzUQ+ZBdGcPM8DHVK0v6O
	 ygxCSlYx7YwvNhwPQVyqq418FBk6Sktf5InQNQKHiZ1Alf/WS61f68HA1ThIg2Khe3
	 B041Mqp8Lz71w==
Date: Tue, 5 Jul 2022 12:55:00 +0200
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
Subject: Re: [PATCH RFC net-next 2/5] net: dsa: mv88e6xxx: report the
 default interface mode for the port
Message-ID: <20220705125500.3c57b531@thinkpad>
In-Reply-To: <E1o8f9s-0059a6-3S@rmk-PC.armlinux.org.uk>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
	<E1o8f9s-0059a6-3S@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_035512_929548_EBD8B6E2 
X-CRM114-Status: GOOD (  13.27  )
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

On Tue, 05 Jul 2022 10:47:52 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Report the maximum speed interface mode for the port, or if we don't
> have that information, the hardware configured interface mode for
> the port.
>=20
> This allows phylink to know which interface mode CPU and DSA ports
> are operating, which will be necessary when we want to select the
> maximum speed for the port (required for such ports without a PHY or
> fixed-link specified in firmware.)
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

