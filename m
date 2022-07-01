Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F510C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 19:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qb8vhqSSIX5gIPVYerY+osM9H3IkKn7DwTR56CMqlg=; b=r3sJ5PEnoVC4PWZc+ziO+E1IxF
	HqS7F6QG157Xd5sNrAO0GExoSaOegMjQykKqEZpuhFJqHQgzJHTgoxr940UfPa8kjl1/hDs8U7lK4
	W3eQGqazJrUowPMu7v4F6Dyjgjt8DIbNpFuaIwKxEyk3gG0sq9VQ5cRdlQjl7mxvbe0hqHpOAZtCy
	USrEEQhsqBs451ZYD0TsG6fY9AyU84WixdEpB1DCEqK2CDDkEkV1IUthEVoZnjLRTs6UQHxKERmMN
	9FC/EedwZRPhtjZIJ7fbxeF+K9kTzz1f6133UjO/6gMtLGsPU3fWJBt+zHiFlK/Urc8Zu4RzHvH1z
	PCz+4v/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MO7-006cCO-DF; Fri, 01 Jul 2022 19:33:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MMc-006bZ6-W1; Fri, 01 Jul 2022 19:31:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 37DF7620FF;
	Fri,  1 Jul 2022 19:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C35C3411E;
	Fri,  1 Jul 2022 19:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656703897;
	bh=2qb8vhqSSIX5gIPVYerY+osM9H3IkKn7DwTR56CMqlg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JBAJOMqk/toX6QQVXfsdJ/Yfyarr/eJ7izTsPsnkqk7dqpfGamryFRoF7cBp2vLsP
	 Vc64zHyQ7buTSQyYBADVB4viEVcPITSpmKV+UnneMUsJAtTO835UnESZwdq/HARF9u
	 9wFFWrnjKxcmJ1uJd55oGa9zfiTWqFYWR/OSRj4/i2lYXxQAZtCZ8g1qdDSZvSKUtJ
	 ZNPSA3M0Vi7fbGrTmtrIL2OYAPgKHynqGRGAtTu9aFPjOTuBldjnkI4GDj2cF9yhao
	 JnsY8l53UJsWeeYXTuGr80ityjHpiN/c3BNuvDv4004G5SRG2roZKxhYgUcJlO5KEV
	 vBOUTjo831QzQ==
Date: Fri, 1 Jul 2022 21:31:28 +0200
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
Subject: Re: [PATCH RFC net-next 4/6] net: phylink: add
 phylink_set_max_fixed_link()
Message-ID: <20220701213128.04adf92e@thinkpad>
In-Reply-To: <E1o6XAQ-004pVw-7o@rmk-PC.armlinux.org.uk>
References: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
	<E1o6XAQ-004pVw-7o@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_123139_139672_A4555DE9 
X-CRM114-Status: GOOD (  11.74  )
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

On Wed, 29 Jun 2022 13:51:38 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Add a function for DSA to use to configure phylink, in the absence of
> any other configuration, to a fixed link operating at the maximum
> supported link speed.
>=20
> This is needed so we can support phylink usage on CPU and DSA ports.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

