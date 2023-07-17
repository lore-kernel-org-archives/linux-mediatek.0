Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C018AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yt173tLwIbPe+YbK3znGHZwS0g4noCyC2JN9YQ68Z8s=; b=Iz2vlEHUaL2Uz1d/ufChj5xtQb
	ZelcBJYlc0uK90TekpiuLK5sY63KXxrh22NpXs7Dd1d1FYnRWGAr8bYA7N9l4COZU1S5eGbmvpC4m
	0PReJuJAYEh3uS5ex6MPURpV/XY8fkME+XkVMBNuLJJgJr2y2yj4yGpp105Km4Maw/eO15/li+EH1
	PD44TafLNYQx21e63hwznUIstbNIhjl6iCBs8zkXgStHj9OjCH4LS+Fuwy/g2cXB5HBzkegCHURdk
	nvHt+3rfeyFn9rhGxfFOw6leKWhaWnboEIaJ8QfKtYORC8shfpQ0J7wWrzKINKauD9f2dWztS9jqJ
	FAWRzFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2c8-006NRY-2e;
	Wed, 19 Jul 2023 08:32:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2bz-006NOa-2o;
	Wed, 19 Jul 2023 08:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yt173tLwIbPe+YbK3znGHZwS0g4noCyC2JN9YQ68Z8s=; b=YCUAb/Rhs/+9hHxqvH8bFa/+I+
	Es/2TxVtzSMON0Iw5S3c4T/o045V3GYlvDg7NN12eDMPlkggD6TMpSUZ5bmew65l90D7lTTMxSYlH
	DZnBPoYY2CDV8idjt6XurTIPLZKzsRxZlQxmC5+4nH5cPaISbbluePG8GunRTyaOeM4RvLK/VFNbS
	fVrCNsTbQ+Wf6mGtG0E0ouSiISiubwjgoG99/BzfEek3riHXdidlGKEH3ZKjY9aIwButFYMkQMmsq
	GVv7EHFYUiaduyjo0pA0Ky7oBcaZ2plkevjRL8QFB5qw9+Cdd789iSVbg3bIXC53LMItvzHbz3tKM
	GxXqRnVg==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTUz-009E58-0d;
	Mon, 17 Jul 2023 19:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689620555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yt173tLwIbPe+YbK3znGHZwS0g4noCyC2JN9YQ68Z8s=;
	b=c3Rd4o7teINwDm4zLbJ7hj03jpsCZm2K394t4/gW6zNRs2lxBHCRz1jysBRKeYM2tHDF8+
	iKkl+Jx172ZuYKywtoVyQvr6uiurIQQp2n7PzXrFSOu8rmbSq8lnjiSUT3sFJzejJlG2EU
	hw0QAKrH1iDe6rH+5VzO53UI+5B7fRc=
Message-ID: <c47c26ba7ea5bcbdcbe1d001b6cc527cee6c7d03.camel@crapouillou.net>
Subject: Re: [PATCH v2 04/10] pinctrl: intel: Switch to use
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
Date: Mon, 17 Jul 2023 21:02:31 +0200
In-Reply-To: <20230717172821.62827-5-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_200309_548026_30CEA084 
X-CRM114-Status: GOOD (  17.20  )
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
> ---
> =C2=A0drivers/pinctrl/intel/pinctrl-intel.c | 5 +----
> =C2=A0drivers/pinctrl/intel/pinctrl-intel.h | 9 ++-------
> =C2=A02 files changed, 3 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
> b/drivers/pinctrl/intel/pinctrl-intel.c
> index 64c3e62b4348..40e45c4889ee 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -929,7 +929,7 @@ static int intel_gpio_to_pin(struct intel_pinctrl
> *pctrl, unsigned int offset,
> =C2=A0 *
> =C2=A0 * Return: a GPIO offset, or negative error code if translation
> can't be done.
> =C2=A0 */
> -static __maybe_unused int intel_pin_to_gpio(struct intel_pinctrl
> *pctrl, int pin)
> +static int intel_pin_to_gpio(struct intel_pinctrl *pctrl, int pin)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct intel_commun=
ity *community;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct intel_padgro=
up *padgrp;
> @@ -1488,7 +1488,6 @@ static int intel_pinctrl_pm_init(struct
> intel_pinctrl *pctrl)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!communities)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
> =C2=A0
> -

Unrelated change.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < pctrl->=
ncommunities; i++) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0struct intel_community *community =3D &pctrl-
> >communities[i];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0u32 *intmask, *hostown;
> @@ -1712,7 +1711,6 @@ const struct intel_pinctrl_soc_data
> *intel_pinctrl_get_soc_data(struct platform_
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(intel_pinctrl_get_soc_data);
> =C2=A0
> -#ifdef CONFIG_PM_SLEEP
> =C2=A0static bool __intel_gpio_is_direct_irq(u32 value)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return (value & PADCFG0_G=
PIROUTIOXAPIC) && (value &
> PADCFG0_GPIOTXDIS) &&
> @@ -1913,7 +1911,6 @@ int intel_pinctrl_resume_noirq(struct device
> *dev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(intel_pinctrl_resume_noirq);
> -#endif

So the correct way to update this driver would be to have a
conditionally-exported dev_pm_ops structure:

EXPORT_GPL_DEV_PM_OPS(intel_pinctrl_pm_ops) =3D {
    NOIRQ_SYSTEM_SLEEP_PM_OPS(intel_pinctrl_suspend_noirq,
intel_pinctrl_resume_noirq),
};

Then your two callbacks can be "static" and without #ifdef guards.

The resulting "intel_pinctrl_pm_ops" can be marked as "extern" in the
pinctrl-intel.h without any guards, as long as it is only referenced
with the pm_ptr() macro.

Cheers,
-Paul

> =C2=A0
> =C2=A0MODULE_AUTHOR("Mathias Nyman <mathias.nyman@linux.intel.com>");
> =C2=A0MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.h
> b/drivers/pinctrl/intel/pinctrl-intel.h
> index 1faf2ada480a..65b1699a2ed5 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.h
> +++ b/drivers/pinctrl/intel/pinctrl-intel.h
> @@ -255,15 +255,10 @@ struct intel_pinctrl {
> =C2=A0int intel_pinctrl_probe_by_hid(struct platform_device *pdev);
> =C2=A0int intel_pinctrl_probe_by_uid(struct platform_device *pdev);
> =C2=A0
> -#ifdef CONFIG_PM_SLEEP
> =C2=A0int intel_pinctrl_suspend_noirq(struct device *dev);
> =C2=A0int intel_pinctrl_resume_noirq(struct device *dev);
> -#endif
> =C2=A0
> -#define
> INTEL_PINCTRL_PM_OPS(_name)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0\
> -const struct dev_pm_ops _name =3D
> {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0\
> -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(i=
ntel_pinctrl_suspend_noirq,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0\
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> intel_pinctrl_resume_noirq)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
> -}
> +#define
> INTEL_PINCTRL_PM_OPS(_name)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_NOIRQ_DEV_PM_OPS(_name,=
 intel_pinctrl_suspend_noirq,
> intel_pinctrl_resume_noirq)
> =C2=A0
> =C2=A0#endif /* PINCTRL_INTEL_H */


