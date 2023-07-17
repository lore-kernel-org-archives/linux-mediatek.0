Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27EAEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjvSgydsLBAt+kJ9U/k9BFTw7JpoLGf2fEESmtZCfmw=; b=fVDoOgcu+gYZQb9dIF4LpSdhXo
	z3I2JHHPTgdzb8wKcvr6ZAwSlszHaFQnRUyN12FxxLO18KQAAeAtzRimIYW2yEtd7T0xyRhV5q5Dg
	suQ8FxEEkMvB7ce4xMteXmJRKJMR6EjHOWVmQPrWgts91rToR6+YSzFQfx3nyrZTHkA6QnD9VrAw0
	ntnOusrp5pRELCnJFDnv0o0Y+vZWFppkddIZ7faAVuIkZMtneLajUDOra0hHjoLmiYGwpaCdV/4ne
	gMdllfuObJtMIIwpMhJHRYCZrcVY0vcgJPvZAGgCS9x6fKjLbPlUHlT7MXbQpYJjaw7dJ69eH4DwY
	MOnHjURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2JT-006GFM-29;
	Wed, 19 Jul 2023 08:13:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2JR-006GEX-3A;
	Wed, 19 Jul 2023 08:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xjvSgydsLBAt+kJ9U/k9BFTw7JpoLGf2fEESmtZCfmw=; b=e3qfXnrYB2iTa3Kx21oU8CkC1s
	Io9zs0VAovZZSscuVuo+xxKTUBkktxFwGn6zqLb7XL3ETuCcQzIcld2m7af1ruqxqZMl9lV1knUux
	fe7fU4OrJ+9ja0CEy48O4qpO8ojpGrkMEGiEyqnVOakiIQpvISZrq+uT9V8EgCd8HtZQWE5mmQHkS
	a79zYveUg3Yb5XX33NOr7qQDDeMQkUGfe6VRcsbO/qfS6eufGckJ6bF0JmHE7sYxEpS0w2rUXIzMF
	UdaI6Pd5maO/iy2CISCNz9OsAMb47qxI1p91VC4HTzT21Uhy+F1rbubOftnCSlxSyXKT5B/jfSAju
	q8FTIjpw==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTew-009ES7-2I;
	Mon, 17 Jul 2023 19:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689621174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjvSgydsLBAt+kJ9U/k9BFTw7JpoLGf2fEESmtZCfmw=;
	b=qeVCdSL1DB214zwLBzzpgW1NMPnfeFgV+Ul4yuE7BcFhqMCwo87py2QaHCdb3WJ1HVLVPR
	fkfBzWXAz4T9KH9iSCSzVhdwtSMTP+x2px4mS2rNi5fUY3UGIX3SJgUCiozeUlLvemRAVo
	SrkwqmTGB3bGFYaRrjrRbuvZxeZ7nGc=
Message-ID: <03592cf5d6854dd5e534e0416de946fd38e4380c.camel@crapouillou.net>
Subject: Re: [PATCH v2 09/10] pinctrl: renesas: Switch to use
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
Date: Mon, 17 Jul 2023 21:12:51 +0200
In-Reply-To: <20230717172821.62827-10-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-10-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_201327_302134_901A30DC 
X-CRM114-Status: GOOD (  15.05  )
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
> =C2=A0drivers/pinctrl/renesas/core.c | 16 +++++++---------
> =C2=A01 file changed, 7 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/pinctrl/renesas/core.c
> b/drivers/pinctrl/renesas/core.c
> index 0c8d081da6a8..34232b016960 100644
> --- a/drivers/pinctrl/renesas/core.c
> +++ b/drivers/pinctrl/renesas/core.c
> @@ -649,7 +649,7 @@ static const struct of_device_id
> sh_pfc_of_table[] =3D {
> =C2=A0};
> =C2=A0#endif
> =C2=A0
> -#if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM_PSCI_FW)
> +#if defined(CONFIG_ARM_PSCI_FW)
> =C2=A0static void sh_pfc_nop_reg(struct sh_pfc *pfc, u32 reg, unsigned in=
t
> idx)
> =C2=A0{
> =C2=A0}
> @@ -732,15 +732,13 @@ static int sh_pfc_resume_noirq(struct device
> *dev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0sh_pfc_walk_regs(pfc, sh_pfc_restore_reg);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> -
> -static const struct dev_pm_ops sh_pfc_pm=C2=A0 =3D {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(=
sh_pfc_suspend_noirq,
> sh_pfc_resume_noirq)
> -};
> -#define DEV_PM_OPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&sh_pfc_pm
> =C2=A0#else
> =C2=A0static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
> -#define DEV_PM_OPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL
> -#endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
> +static int sh_pfc_suspend_noirq(struct device *dev) { return 0; }
> +static int sh_pfc_resume_noirq(struct device *dev) { return 0; }
> +#endif=C2=A0/* CONFIG_ARM_PSCI_FW */
> +
> +static DEFINE_NOIRQ_DEV_PM_OPS(sh_pfc_pm, sh_pfc_suspend_noirq,
> sh_pfc_resume_noirq);
> =C2=A0
> =C2=A0#ifdef DEBUG
> =C2=A0#define SH_PFC_MAX_REGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0300
> @@ -1418,7 +1416,7 @@ static struct platform_driver sh_pfc_driver =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.name=C2=A0=C2=A0=C2=A0=3D DRV_NAME,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.of_match_table =3D of_match_ptr(sh_pfc_of_table),
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0.pm=C2=A0=C2=A0=C2=A0=C2=A0 =3D DEV_PM_OPS,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0.pm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D pm_sleep_ptr(&sh_pfc=
_pm),

I think you could do:

.pm =3D IF_PTR(IS_ENABLED(CONFIG_ARM_PSCI_FW), pm_sleep_ptr(&sh_pfc_pm)),

Then you wouldn't need the #if defined(CONFIG_ARM_PSCI_FW) guard either
(as long as the code still compiles fine when that config option is
disabled), and you wouldn't need those dummy callbacks.

Cheers,
-Paul

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0};
> =C2=A0


