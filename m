Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA140C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 19:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zY2qYSxISx4hCMQU0t0luuI8qiBU93KBahj0z1z59vM=; b=xS2qXPg8cZkPc0tS04Zxmn3YNy
	r0lk4BFc2xYPLUKNwh25quQ+pVmMdBn/3dmOwkEkWdPFNtF7eHO4ZjnENx7uxPumhG+fo2/7+8CEe
	Xx97gySpvS52M9i/D22uuQBmG2NjR+mNApVzcodNI1Jcrmmii2hhcQ/K5ZpMAfiv6jCT7RzWztNrL
	B9gl7BhJhgHB8Crpm1fLW6Qoc+hRfzh7KZJ1dhFBrDU96j+fjeTIZ/I/IB2S4F8p2emqYFbf3ZYai
	z1ziWFX45uI22PuYpR8rnkICMO+1OjPx+EY/PZuhlxNo98uQsHhCNZaDwOdOsOkEchZFJFJj6kI9o
	lyV3+3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MBz-006WcR-DZ; Fri, 01 Jul 2022 19:20:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MBo-006WZh-2G; Fri, 01 Jul 2022 19:20:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 91B3CB831A4;
	Fri,  1 Jul 2022 19:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D10C3411E;
	Fri,  1 Jul 2022 19:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656703224;
	bh=zY2qYSxISx4hCMQU0t0luuI8qiBU93KBahj0z1z59vM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lNiv0701zDuP4hNtkFPn0GmsHGXoppx+x1YbNyw1DIfzUQDFVYwPT8uA/cscBrllB
	 fja9TFWuvFPrWhnkn6z2kKV9oY2+fSZ04lcDD1EJyn9QbfKa3Bn87B/zgISLsQod5u
	 4suqjA2GDyaVhUrHZvbxHCvnfkvO52uVDTvmHQOobzRfsgB9JR2EBohJtTABUP26ux
	 2ghokLvkpbDz0W/bA03ZKXGBDzwew0SOryECDUJrc7da56ni+qx7Gsp+/Ccqa0J3y/
	 ef/wwWtyq3k2+8wtzP37QrOmdVGZ4j3eoaM18mb6EcqxV6geviPY8BRIKhJpL0MyeJ
	 eMFDPjYWjNkVg==
Date: Fri, 1 Jul 2022 21:20:15 +0200
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
Subject: Re: [PATCH RFC net-next 1/6] net: dsa: add support for retrieving
 the interface mode
Message-ID: <20220701212015.638e163c@thinkpad>
In-Reply-To: <E1o6XAA-004pVc-Pd@rmk-PC.armlinux.org.uk>
References: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
	<E1o6XAA-004pVc-Pd@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_122028_296188_38E96968 
X-CRM114-Status: GOOD (  15.27  )
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

On Wed, 29 Jun 2022 13:51:22 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> DSA port bindings allow for an optional phy interface mode. When an
> interface mode is not specified, DSA uses the NA interface mode type.
>=20
> However, phylink needs to know the parameters of the link, and this
> will become especially important when using phylink for ports that
> are devoid of all properties except the required "reg" property, so
> that phylink can select the maximum supported link settings. Without
> knowing the interface mode, phylink can't truely know the maximum
> link speed.
>=20
> Update the prototype for the phylink_get_caps method to allow drivers
> to report this information back to DSA, and update all DSA
> implementations function declarations to cater for this change. No
> code is added to the implementations.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

