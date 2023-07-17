Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5669C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUbYZ8pSTKDyookB+Z63SW+UrzvlNrmn7Cc06biQ1RY=; b=3u5ZGLL/8zxXHLR6nyBrRM7NEu
	47CktxBOvSm4auUkLfs9p17zu84iCOYpaouV16NoiXxRNQxftJuvA5O6QtDFqpULkD0O+Ce3I4XW4
	SmaCgaP7hI5VcINubDwhZLDefthahpVzJRt/Sypln2CESBpB+u9loztp7H3w5bpGoeC0rwYaKGu8l
	p+hMdkmTJbRcErbQGJE5ndk7OZb/WKM1N/IgDAs8x52dStooAeIsfdfGwQ4cvXVHpy/Be9wmco93G
	nUYOfEbgnbUT9pidiaRLSRobYFN1tUTopTNfBD6k6AtjO1rp19MCEyyR56ChYlXcQY09XX+IJebxw
	vxk8gZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Vk-005eSG-1v;
	Wed, 19 Jul 2023 06:18:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Vi-005eQ2-0m;
	Wed, 19 Jul 2023 06:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EUbYZ8pSTKDyookB+Z63SW+UrzvlNrmn7Cc06biQ1RY=; b=dWnL1tqFFNxQo/b1RlJdvNsolQ
	6mX9ZUOipbK8sNEUby+JSUm3XIFJZiI5NFFb5qTr6uLrPPmna+F6mS59tXACz0yaCVbsFoaOD/M44
	VMd0MMNyrYLzhuLfaK2Dpa1YBueawRffZs2CZPHJQyRncvyzo2tYJvMwvB/F2SE84EWsuYP9PkrCy
	/ObMqblYTc7FBty1p0xNmoO9xedi6HhZXrH5jZZRcOr/ve0Ztbgi2bMy2bmDc63y1FlsxnEgDYaz3
	vcujqHgLfH497KHDZAmOODviWYL/EUfrLRcrmA8mysSCXJNsAXIxOw6kDt9lgkOinBCh/liq/YhA1
	/tgozpEw==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTZA-009EDs-0C;
	Mon, 17 Jul 2023 19:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689620817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUbYZ8pSTKDyookB+Z63SW+UrzvlNrmn7Cc06biQ1RY=;
	b=Vy1ZpdaCi5k3cwLDqwOtFWg7A3zS5kYwD68mlYCpmulFhmikPGznp1UU+O/FzmpYurkTQU
	dE1B9mWihM5B463eQv1jcypFaAEP/zRd2Wqcerui3nFeqrtlJnmHBxpmHHYUQq6LE2xUnR
	df3C1TFbJNELgy4uN2FVXJBkJfK6YxA=
Message-ID: <f48a35d596694839665bc5883260cbae3ae01d9c.camel@crapouillou.net>
Subject: Re: [PATCH v2 07/10] pinctrl: mediatek: Switch to use
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
Date: Mon, 17 Jul 2023 21:06:54 +0200
In-Reply-To: <20230717172821.62827-8-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-8-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_200730_716886_4B791239 
X-CRM114-Status: GOOD (  15.25  )
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
> =C2=A0drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 5 +----
> =C2=A0drivers/pinctrl/mediatek/pinctrl-paris.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 9 +++------
> =C2=A02 files changed, 4 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 665dec419e7c..2bf5082d3aa9 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -922,10 +922,7 @@ static int mtk_eint_resume(struct device
> *device)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return mtk_eint_do_resume=
(pctl->eint);
> =C2=A0}
> =C2=A0
> -const struct dev_pm_ops mtk_eint_pm_ops =3D {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.suspend_noirq =3D mtk_eint_su=
spend,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.resume_noirq =3D mtk_eint_res=
ume,
> -};
> +DEFINE_NOIRQ_DEV_PM_OPS(mtk_eint_pm_ops, mtk_eint_suspend,
> mtk_eint_resume);
> =C2=A0
> =C2=A0static int mtk_pctrl_build_state(struct platform_device *pdev)
> =C2=A0{
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c
> b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 33d6c3fb7908..b1cbd5bafa2e 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -1119,24 +1119,21 @@ int mtk_paris_pinctrl_probe(struct
> platform_device *pdev)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe);
> =C2=A0
> -static int mtk_paris_pinctrl_suspend(struct device *device)
> +static int mtk_paris_suspend(struct device *device)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mtk_pinctrl *pctl =
=3D dev_get_drvdata(device);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return mtk_eint_do_suspen=
d(pctl->eint);
> =C2=A0}
> =C2=A0
> -static int mtk_paris_pinctrl_resume(struct device *device)
> +static int mtk_paris_resume(struct device *device)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mtk_pinctrl *pctl =
=3D dev_get_drvdata(device);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return mtk_eint_do_resume=
(pctl->eint);
> =C2=A0}
> =C2=A0
> -const struct dev_pm_ops mtk_paris_pinctrl_pm_ops =3D {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.suspend_noirq =3D mtk_paris_p=
inctrl_suspend,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.resume_noirq =3D mtk_paris_pi=
nctrl_resume,
> -};
> +DEFINE_NOIRQ_DEV_PM_OPS(mtk_paris_pinctrl_pm_ops, mtk_paris_suspend,
> mtk_paris_resume);

It's a bit more work, but I think you should use EXPORT_GPL_DEV_PM_OPS
(or even better, EXPORT_NS_GPL_DEV_PM_OPS) so that the dev_pm_ops is
conditionally exported. All callers would have to be updated to use
pm_ptr().

Cheers,
-Paul

> =C2=A0
> =C2=A0MODULE_LICENSE("GPL v2");
> =C2=A0MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Paris");


