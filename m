Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E779C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPytza0FzLurbgMNNTIgRyVfzPQAcL6r2G/Kltyw3k0=; b=Osc41Hodv1OpG6nKPbcNqeGjuO
	O26rGv9CJhAj5X+9D2hus3HPRqM8R2KbtNdlFZ8cNRVwmrHBaD0PPq3VKCg/iosD3nUniWKb3NE4E
	IhMPcF137CAhG/V9y28DiX63QbL9O4jmAIC8W8DV1YD2p0hMe8o4TO3CY6ylCG03qRnSC7F7/Wbkg
	XYZ53O7eWLuyTjLVNWgqQ0+qTyLgYsQBP3+wENEkdnrT25JqHw8llw3vxzeti+tOA9WXGjENMa3Gl
	fcSYj9X6mdEeiDYopaT8Ne+FQWb7NqPjtdy/HntD8YqwAvJH1nX7BmZboZ4oXPckKWxUrLmZUw479
	ByxIVOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzVA-005BX4-0B;
	Wed, 19 Jul 2023 05:13:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzV8-005BVy-0c;
	Wed, 19 Jul 2023 05:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WPytza0FzLurbgMNNTIgRyVfzPQAcL6r2G/Kltyw3k0=; b=IBPkIQvmUHQQvVwbYhP58j05tY
	HK4UUDyAQLtjBjNoPF/jsPVUFeoAd9kylCI5+GE/c/HshOkwFeE2n4sptEQAnDJTFCUox883eKBXh
	HXRCLUNdV49F/BFM2pZCgZUt+sCWw8sKHn1Zbf46CqndA2Tjw3NFImcbI9L5Bc/vRhp1sgGHxwsg8
	RM/OlSY7P7zVMtkUJr7imxj7qdBnrFHmuGuQ1qf45ZgidJ9LNQ6yEStXI23nhq0psJPGSlg/huqoO
	cPbLTRgM0tVsyVQ8QhHfhDlIV5QU+z6yfIXkL/hSsfOQzDYFikVNPsil19g8STrqrRGWJf6vatwrB
	JTO8O1yA==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTgD-009EVL-0n;
	Mon, 17 Jul 2023 19:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689621254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPytza0FzLurbgMNNTIgRyVfzPQAcL6r2G/Kltyw3k0=;
	b=WDrNej2khKT49u/ZfzL6yobm0Zeq0Qp0TNdRO4GnsqipcI1U4g3vs8VJvik7jgqPbb+x/K
	wI4DNWpNCRBaUxv2JjYJputr6VXkICPXLO+fYZFLN7mHFvzTlCvE7+z96AuKoK9PuM1tOU
	ep6N1O1jqullaYEUkUSlrwzlhPyQY/M=
Message-ID: <13f7153786cfcdc3c6185a3a674686f7fbf480dc.camel@crapouillou.net>
Subject: Re: [PATCH v2 10/10] pinctrl: tegra: Switch to use
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
Date: Mon, 17 Jul 2023 21:14:12 +0200
In-Reply-To: <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_201445_650152_6B1E70E8 
X-CRM114-Status: GOOD (  12.14  )
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
> =C2=A0drivers/pinctrl/tegra/pinctrl-tegra.c | 5 +----
> =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
> b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 4547cf66d03b..734c71ef005b 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -747,10 +747,7 @@ static int tegra_pinctrl_resume(struct device
> *dev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> -const struct dev_pm_ops tegra_pinctrl_pm =3D {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.suspend_noirq =3D &tegra_pinc=
trl_suspend,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.resume_noirq =3D &tegra_pinct=
rl_resume
> -};
> +DEFINE_NOIRQ_DEV_PM_OPS(tegra_pinctrl_pm, tegra_pinctrl_suspend,
> tegra_pinctrl_resume);
> =C2=A0
> =C2=A0static bool tegra_pinctrl_gpio_node_has_range(struct tegra_pmx *pmx=
)
> =C2=A0{

Another driver where using EXPORT_GPL_DEV_PM_OPS() would make more
sense.

Cheers,
-Paul

