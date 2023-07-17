Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAFDC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYJF9jUuoH8+OSLTUvKgDFX+MUf4KcBqy49yggghDsQ=; b=Pp9Yq2TDtP9OJ02x9n5GWx/icN
	xmYJ0d/coanmF0gi75DSZ5tAWguoocgkqyVa1NtdkTBpxtYWiSQ0lsK9as1C4w3Qpl+mkIoYRsnFa
	VQIRoNYBDUnZ/9jDtXzWmLlGeVD0in/lWvaMI+0+m+86wNMbCNy2tLicSQTddX+hxsIIY4nUbc05s
	RZ/wwBVrghzp8y1rY7OPEx6/5J3ykHJgMtW0MwoV/EeFDYr8eP1fpSNoib4U/oF6UCghWJ694Dr05
	pPt3spycZDhAapDZjUZE+rp9Mb+x7TwEWZhwEHtaM15Wmora/BasUCtfammRGpmO7SodwldkZAa0I
	kFBvkK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzgQ-005Hhf-3C;
	Wed, 19 Jul 2023 05:25:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzg7-005HSE-15;
	Wed, 19 Jul 2023 05:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JYJF9jUuoH8+OSLTUvKgDFX+MUf4KcBqy49yggghDsQ=; b=oNK3THIuHDuHiDnjE6yxHpiCCl
	fiYMOQF7iBcEFf3r4QeRhju3szUlgj1Wox0C57tiu5BlIuDUflaKHzkfjDwZaSsn/5dS8KgwWtST8
	gp9LEnJTIfWUL11+VFjsKgwX0TNDCv8KldiNzYFFLYnjsPZmayRhMd8lb+JY+kth5gfZ8SPBcm9Ns
	D/GMxTo7qTtzWpYnB5aHplNIToOvtLLxfrpRwVGMMdBbfzK3+JH3+j+BxntACtq4fv4bjmFZQhjMR
	QO0YXk2dFCceXpSfIbCrOmpPE3amgNK8pxrn7mDSPmNro+AktISPNngQ5TzAQSYLWZJRyZeMdnz94
	MNWYNJ3g==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTnk-009Ej3-2i;
	Mon, 17 Jul 2023 19:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689621722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYJF9jUuoH8+OSLTUvKgDFX+MUf4KcBqy49yggghDsQ=;
	b=oUtYDNGboR/faJdt+5APnkwTfthP6RjP3VjaPaKSTvgHCJAXiUfjanp7jmD1aZrczGxWJg
	4h2wwFdqw/Gq5YP2uux75jP3mi5Z7BQHSHXbltNX+W/OC8y+fyApzhTIfFV+CIBBIjFF8V
	t5zXX7QCaIuYrRWE4BnWL3FaDNFov1I=
Message-ID: <73161288a07eb34a458061151d9d9a5c10d79c1b.camel@crapouillou.net>
Subject: Re: [PATCH v2 03/10] pinctrl: cherryview: Switch to use
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
Date: Mon, 17 Jul 2023 21:21:59 +0200
In-Reply-To: <20230717172821.62827-4-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_202233_243868_E4CA33AD 
X-CRM114-Status: GOOD (  13.60  )
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
> =C2=A0drivers/pinctrl/intel/pinctrl-cherryview.c | 9 ++-------
> =C2=A01 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c
> b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index eee0f9bc3d32..7a2fc9fe175d 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1793,7 +1793,6 @@ static int chv_pinctrl_remove(struct
> platform_device *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> -#ifdef CONFIG_PM_SLEEP
> =C2=A0static int chv_pinctrl_suspend_noirq(struct device *dev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_pinctrl *pct=
rl =3D dev_get_drvdata(dev);
> @@ -1877,12 +1876,8 @@ static int chv_pinctrl_resume_noirq(struct
> device *dev)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> -#endif
> =C2=A0
> -static const struct dev_pm_ops chv_pinctrl_pm_ops =3D {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(=
chv_pinctrl_suspend_noirq,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chv_p=
inctrl_resume_noirq)
> -};
> +static DEFINE_NOIRQ_DEV_PM_OPS(chv_pinctrl_pm_ops,
> chv_pinctrl_suspend_noirq, chv_pinctrl_resume_noirq);

That's over 100 characters, please break this line.

Cheers,
-Paul

> =C2=A0
> =C2=A0static const struct acpi_device_id chv_pinctrl_acpi_match[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "INT33FF", (kernel_ulon=
g_t)chv_soc_data },
> @@ -1895,7 +1890,7 @@ static struct platform_driver
> chv_pinctrl_driver =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove =3D chv_pinctrl_r=
emove,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "cherryview-pinctrl",
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0.pm =3D &chv_pinctrl_pm_ops,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0.pm =3D pm_sleep_ptr(&chv_pinctrl_pm_ops),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.acpi_match_table =3D chv_pinctrl_acpi_match,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0};


