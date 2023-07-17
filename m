Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0BCC001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOtYH4hKBzhGlvN/2fJcmQb/NBgM69hMecTKLntsWYw=; b=Wvgivw/Zv/qsOPByevSSU0R/MI
	G5yo1u+e/0cKYEBjdj7Eb1ombTy7/M5V8DcyGwJw844t99cve1GqOdW35p6ydLU73hsn0QPrUDqDN
	zMqFgjD5msyK0dOWCy7VzTZ31WF1u9yZaS2Cx24lFxl4+sRqtib9axBWhEugBsxQ5249RV9NrNKR9
	p+V0niASx+ku6+PFIp2cK0mdw2xTwMKNm+LamoLDMkDiQf/4CnAXVRoF+Qy0rscswkgNHHWwR4Vrb
	3+I2xnn7CGEMs3AySp9N3rVXRhTNjaygaNl+7pLifNbbwG9Y4vBtUK7IP8Bila53S27vMY0LAGN5L
	nxe5Gmrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0nZ-005o67-28;
	Wed, 19 Jul 2023 06:36:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0nX-005o4c-1y;
	Wed, 19 Jul 2023 06:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eOtYH4hKBzhGlvN/2fJcmQb/NBgM69hMecTKLntsWYw=; b=MMOhe6UH3hBo3ZIeSZwmGhD108
	tvh9/8sFNwVvauLFHf9+4W4S0m+TW6rWumrRWMjDjOovMfxmJbRWNW5qPGL/IhdrcKOuSTPBphl97
	hoZ1HwvGLSj7ACFtE3IQcJVDNlddC2hLysGujUmmn1OFSlx6DAShmoQGpCBbWY356JeAuMRD7P6EK
	W7CXaOw5Nqks3SYQdQIMXCZ7pm/V0gcKGbiMLUIBGw/e0G8ErE1ezHAztQJlRHlAc5nJEMwpvkBgD
	xUg9fTphxDoscGv69lkWSOcoYmh3UgC/wIhHeZmZyJyemy78Ueb/HCVUsDD1+KZSfoQLjClVYmBSB
	A7aQMNww==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTrY-009Eq0-0G;
	Mon, 17 Jul 2023 19:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689621956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eOtYH4hKBzhGlvN/2fJcmQb/NBgM69hMecTKLntsWYw=;
	b=fHjDCzU4z1U9SSlFa3/lUwZK96EDFjpO/zr6IzuhUvDGLP7d8yoCF79Jk5d8FEC1OUnO65
	hHw88RTt5nyzHziz9KI8NhteJirq0XzqMM+He1hvrnBAre+PYf2PfrVO8Jy6Cs9fmjo9WE
	ww3ao4cdyfwmSh+hig5l1G/je/6rhGY=
Message-ID: <e356066d5e4001d5ae26a1f55996086ce0b59cf2.camel@crapouillou.net>
Subject: Re: [PATCH v2 06/10] pinctrl: at91: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
From: Paul Cercueil <paul@crapouillou.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Balsam CHIHI <bchihi@baylibre.com>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
  Thierry Reding <thierry.reding@gmail.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org,  linux-pm@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>
Date: Mon, 17 Jul 2023 21:25:53 +0200
In-Reply-To: <20230717172821.62827-7-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_202628_591522_EDAD39C6 
X-CRM114-Status: GOOD (  15.81  )
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

Hi Andy,

Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9crit=
=C2=A0:
> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Although you could add a bit more info in the message of this patch, to
explain why it's OK to remove the __maybe_unused tags (the code is
always visible) and why switch from pm_ptr() to pm_sleep_ptr() (it's
only used for system-PM callbacks).

Cheers,
-Paul

> ---
> =C2=A0drivers/pinctrl/pinctrl-at91.c | 10 ++++------
> =C2=A01 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-at91.c
> b/drivers/pinctrl/pinctrl-at91.c
> index 39956d821ad7..608f55c5ba5f 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -1657,7 +1657,7 @@ static int gpio_irq_set_wake(struct irq_data
> *d, unsigned state)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> -static int __maybe_unused at91_gpio_suspend(struct device *dev)
> +static int at91_gpio_suspend(struct device *dev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct at91_gpio_chip *at=
91_chip =3D dev_get_drvdata(dev);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *pio =3D at9=
1_chip->regbase;
> @@ -1675,7 +1675,7 @@ static int __maybe_unused
> at91_gpio_suspend(struct device *dev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> -static int __maybe_unused at91_gpio_resume(struct device *dev)
> +static int at91_gpio_resume(struct device *dev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct at91_gpio_chip *at=
91_chip =3D dev_get_drvdata(dev);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *pio =3D at9=
1_chip->regbase;
> @@ -1903,15 +1903,13 @@ static int at91_gpio_probe(struct
> platform_device *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> -static const struct dev_pm_ops at91_gpio_pm_ops =3D {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NOIRQ_SYSTEM_SLEEP_PM_OPS(at91=
_gpio_suspend,
> at91_gpio_resume)
> -};
> +static DEFINE_NOIRQ_DEV_PM_OPS(at91_gpio_pm_ops, at91_gpio_suspend,
> at91_gpio_resume);
> =C2=A0
> =C2=A0static struct platform_driver at91_gpio_driver =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "gpio-at91",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.of_match_table =3D at91_gpio_of_match,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0.pm =3D pm_ptr(&at91_gpio_pm_ops),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0.pm =3D pm_sleep_ptr(&at91_gpio_pm_ops),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.probe =3D at91_gpio_prob=
e,
> =C2=A0};


