Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D89C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxINe0XExOFmCtj576MgqcGdFE0lRnd+xk311qy3pAU=; b=mywoLj904wsiYB
	c043uJ8lto/Qx9aYtIaWh2J+ZRtubECDtAj4FoPRLSlFicVqDtJI9P1CP9rzzJQbuhbWsiLJSoH2A
	6r/LZ0QswpIfRE/AyDfVPR+ITKXk/cau2+Dx0jXQTbJGdqy0ITEIJuo5Eboo86/zFjRNNqtyCSODX
	NJfjLjHw0U+KMvyaVJdjBaErH30b7Y5i5HYOaFNRBcL9sB0tU44a7VYZnib7zqkSW9VzkPKE60mSl
	oIadFrbNP9Wc48hwF/Ha4bC2XDom9QPIjOmJdjct4jgmzs0SigXDaXK++/t3oRxtceGVkFCM9cC/C
	VoOe946wilg7XQfKK59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njbkw-0009zq-FO; Wed, 27 Apr 2022 07:06:34 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njbkV-0009je-H5; Wed, 27 Apr 2022 07:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651043134;
 bh=E31kil/RNvUPQgFAepzSBEELBXvKZrRDE3N9X6PH5T8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DjGNxyUD+bf4zvIFNz83qx3GE4Yvs5YLCQhUJ6l6Y9gGcU0a83Afo3A5hHD4aVhvY
 /Ax2SBesyOiMJXLpWyF8sGln6GLim0PTIW/W5aAFWK6guzToaoczP9HdTcMDSUppcU
 CFDxK3UdNucMrIOOjoj2JGyE5NOEba+Jpt3hmdm0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.148.41] ([217.61.148.41]) by web-mail.gmx.net
 (3c-app-gmx-bap04.server.lan [172.19.172.74]) (via HTTP); Wed, 27 Apr 2022
 09:05:34 +0200
MIME-Version: 1.0
Message-ID: <trinity-ba152dbe-5a7c-4098-acff-3e7b225f0349-1651043134680@3c-app-gmx-bap04>
From: Frank Wunderlich <frank-w@public-files.de>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Aw: Re: [RFC v1 1/3] net: dsa: mt753x: make reset optional
Date: Wed, 27 Apr 2022 09:05:34 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220426235713.engzue7ujwqjdyjc@skbuf>
References: <20220426134924.30372-1-linux@fw-web.de>
 <20220426134924.30372-2-linux@fw-web.de>
 <20220426235713.engzue7ujwqjdyjc@skbuf>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:BgK3bwwwsZyAlEyB2njy500W/y0pBdlhH28Qhy54gfqNlVJPhRCXN1L7fzbHRwm2NhWIt
 wtsoVISknJP68kmlU/Ne3LPu27zqumySiroUKNvD3n3rqoWlVnHOi13drtzrr6X+TADx7uJfTn1t
 9FuVVDgSJikg8OKzG6Ux/wmOpd2+Ha4EsuNnk/1NAUt6D0GiQ8XJ2/0ptYYgJM35Iogc9LRnTDY9
 0tQmjj2r9F5tJ1GixD+w366AYglq49w0uwB4bgYnAXf/7SZ/5cdOEZKx84mARgM8OEku6HY7ilQS
 po=
X-UI-Out-Filterresults: notjunk:1;V03:K0:BfBhc8THtNQ=:FmPM6Sbgg35utsLpoBVKWj
 RhwN3n5dcfttYrYGD3nUUmgyz76ELiRfChWBqtFpLRf+MYrR5Ovp4+BqDcC26HH6JKvRQbPA7
 RY/gZe/B3B0VSfioY+L02yptu7tp9RvbtU7AWa5JSX+XWhozJufzh3yqru38GrlZVSZ9Q5M2B
 cfEonm56YX4DHY19Gr7L6RooIe9tEZsITo4k60kO0NMGOFKJWkXUp9zVug4rxzq8oVAnpQQAj
 nWiljo9mOsuXrzJh4PXopgPEnxOL1GvFzn/l2UPX6nYp3RDn/oyMJl433iPbJPdjv+NBNwNiX
 jz89CSuXtv3yPSBI4jx6Jp1Gwbc9JV0CpiROCbLdPcUHTdBmMTZEl4J0s35pE4pLX23aOIZo8
 oU1E6gOG0Lj4xYRAuxWIIGuaTEuYW/rc462iUD0AKSkJBpO0SQ5Gq/V89G5VTPlhdfdZqrFH5
 YpRQV5TIUS4pzKIWDsuvQ4ol0910PCH3+EpUOQLVv83DVHqSyLdwbScd6q1MX+GAvNzrDrtvS
 r/AJEaZWNqnyCnWnMUQKqWGPC0fBDfbn5Fp0+XC9NZrZQLDnVmXruO5sImrB6WskfJKLmlXgF
 U/+iex/+cLAuPWqcCSir5czEZDNBdMUdqnDU8pynYFW26/3/UZfgdFpaZQ7qLfwqc/bsChUmQ
 13DrwQHm3aFthJPqAnRJ8IcCKf/VPY1sa/o6vlLRVs4cd4wZ5J3yNxXmda1BRDVMMEbzO58zR
 BwFBEfj5Rhax1Vm1nW1RhOAs8hKEO1XC6T+7tcn5n1OQ8jY0bu7oKg3w5ky/Di554zjAphU7V
 hfikbdB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_000608_137794_2C177765 
X-CRM114-Status: GOOD (  24.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

you're right, reset is already optional...

idk why it was failing before the patch...i guess i had always defined the reset in dts on switch-side and dropped it same time with this patch.

Reset on both nodes (gmac+switch) blocks in switch driver because of exclusive (error message "could not get our reset line") and after dropping the reset on gmac-side the mdio-bus does not come up after switch driver resets gmac+switch (in loop with edefer).

> Gesendet: Mittwoch, 27. April 2022 um 01:57 Uhr
> Von: "Vladimir Oltean" <olteanv@gmail.com>
> On Tue, Apr 26, 2022 at 03:49:22PM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Currently a reset line is required, but on BPI-R2-Pro board
> > this reset is shared with the gmac and prevents the switch to
> > be initialized because mdio is not ready fast enough after
> > the reset.
> >
> > So make the reset optional to allow shared reset lines.
>
> What does it mean "to allow shared reset lines"? Allow as in "allow them
> to sit there, unused"?

for switch part unused right, but reset-line is used by gmac. If switch does the reset, it resets the gmac too and so the mdio goes down. It took longer to get up than the wait-poll after the reset and so i got mdio read errors.

> > -	} else {
> > +	} else if (priv->reset) {
>
> I don't really understand this patch. gpiod_set_value_cansleep() can
> tolerate NULL GPIO descriptors.

had not looked for NULL-tolerance, so i precautionary added the check.

> >  		gpiod_set_value_cansleep(priv->reset, 0);
> >  		usleep_range(1000, 1100);
> >  		gpiod_set_value_cansleep(priv->reset, 1);

> > @@ -3272,8 +3272,7 @@ mt7530_probe(struct mdio_device *mdiodev)
> >  		priv->reset = devm_gpiod_get_optional(&mdiodev->dev, "reset",
> >  						      GPIOD_OUT_LOW);
> >  		if (IS_ERR(priv->reset)) {
> > -			dev_err(&mdiodev->dev, "Couldn't get our reset line\n");
> > -			return PTR_ERR(priv->reset);
> > +			dev_warn(&mdiodev->dev, "Couldn't get our reset line\n");
>
> I certainly don't understand why you're suppressing the pointer-encoded
> errors here. The function used is devm_gpiod_get_optional(), which
> returns NULL for a missing reset-gpios, not IS_ERR(something). The
> IS_ERR(something) is actually important to not ignore, maybe it's
> IS_ERR(-EPROBE_DEFER). And this change breaks waiting for the descriptor
> to become available.

you're right...the intention was to not leave the probe function if not reset was defined...but yes, devm_gpiod_get_optional is called so reset is already optional.

> So what doesn't work without this patch, exactly?

reverted the Patch in my repo and it is still working :)

just ignore it. something went wrong during my tests...

sorry for the inconvenience.

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
