Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6041BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 19:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEu/u9dgfs1RHHkM0fkOgtAUXU1kmpj5LCeuGMQMttI=; b=scW/RMMs4mWrnaHZtnK3vfghQE
	xF66QE9pzzqvHjSLrJ2uAN0ckKHGBtiC6DT9E5y2NoH0GwVTsaLEKTg6yQ33sGH19eiRRIBHzIKB8
	z2y85hRl04XeMk8hB99ZwHVBgsJupnxbGLrX+4xfZgZtU9sZ+bMX6KbXt3bNp2L6GVjO8TrteJEOd
	/6XHGdQojCiTYbCpho/2Y0zKxTnOt7T2UXtHlfkCh/McNjYOZGSibTZzxIbjr56fvm3O4fxJGtD3K
	p0Ks9/Gd7r2gNwUaxwtik5Wx00sqXUTHpp25EO7SlUAJuk7YdG7iBOzbcYz/svAvf/6850nVTFFDy
	KIuLewPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MQH-006d2m-6M; Fri, 01 Jul 2022 19:35:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MPf-006cpw-8w; Fri, 01 Jul 2022 19:34:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9AF75B80D15;
	Fri,  1 Jul 2022 19:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AE7C3411E;
	Fri,  1 Jul 2022 19:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656704084;
	bh=dEu/u9dgfs1RHHkM0fkOgtAUXU1kmpj5LCeuGMQMttI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jdzO9DswH3WCzTLver5Ukfwgcu1y3kEayD2Udew/YpxLqyMuG4k2AmOajMU5ZhEdr
	 4DPH8fYP89C473mASb73jj2AGtVbyT+65zfdfVZIN+zQPw5pNL50WCxTc9e5gbiY7R
	 diNX+0lYiYuAaDSJrj7OeFyNvWM4YJ6bDYn9j45g2P0NWEi45kswkf41xp3EoT8VRT
	 ikHAgseGyuPYr+gGznoao+WcJDGN39lJCacnrzhVr2AcrlkYUP8A6IKP7sO5hZYzJ7
	 B0GzDZZiyWkoiJQhQeozynCH+I4ITfPubb1KENP352K5CjOGH6f1wrsi4vR1w0EvQQ
	 rSSCigcEt6dpA==
Date: Fri, 1 Jul 2022 21:34:35 +0200
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
Subject: Re: [PATCH RFC net-next 5/6] net: dsa: always use phylink for CPU
 and DSA ports
Message-ID: <20220701213435.53ecdd70@thinkpad>
In-Reply-To: <E1o6XAV-004pW2-Ct@rmk-PC.armlinux.org.uk>
References: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
	<E1o6XAV-004pW2-Ct@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_123447_529829_F97394AC 
X-CRM114-Status: GOOD (  18.00  )
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

On Wed, 29 Jun 2022 13:51:43 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Currently, we only use phylink for CPU and DSA ports if there is a
> fixed-link specification, or a PHY specified. The reason for this
> behaviour is that when neither is specified, there was no way for
> phylink to know the link parameters.
>=20
> Now that we have phylink_set_max_link_speed() (which has become
> possible through the addition of mac_capabilities) we now have the
> ability to know the maximum link speed for a specific link, and can
> now use phylink for this case as well.
>=20
> However, we need DSA drivers to report the interface mode being used
> on these ports so that we can select a maximum speed appropriate for
> the interface mode that hardware may have configured for the port.
>=20
> This is especially important with the conversion of DSA drivers to
> phylink_pcs, as the PCS code only gets called if we are using
> phylink for the port.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

So this is the one that may break other drivers?

Marek

