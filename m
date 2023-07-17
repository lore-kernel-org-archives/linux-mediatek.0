Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDACCEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOp2ZZ3wc36w9kvHwXp3awpd0wFGnA+hVpdKbz6GNXU=; b=lgKyXMwlXdNsMX5y4bTcA9oxDN
	A4YYkdap4dFgbPWwsWgNVyH0e0hNPB0zXVNMbukhDKeu19TCIvgb/MgSknQNa4X8GKveIh97yLPf5
	T/fH2CqiaJXCV3zy604EF66KCKLQ9XuysiNthZRXt+koJ1V+k1OqJcqe8jHeF16uW0L0FFFDC8XoJ
	hrmAO4pln055A+5IQF9KYwKA1C35hUPGaIZINCmmz+Po6e4mMeclNtewxXm3dm5H6X6fNI8q2HgE5
	Lp4iMdoJkbJ27Gm58ZjaZBi3mXrS4J2RHvoln4FOQfGhLtQ5b21YBF/+pwcDJtRAdwORmTR5USzye
	Tw7rhQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Fi-006EsT-2Q;
	Wed, 19 Jul 2023 08:09:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Fh-006ErA-2B;
	Wed, 19 Jul 2023 08:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SOp2ZZ3wc36w9kvHwXp3awpd0wFGnA+hVpdKbz6GNXU=; b=UGuD/M5chL1X6wGDM3e/7Pnr4E
	7jAyTGJzgKpgFBJoV/NKobqZtG35sqC0P2SDJYeSna+XoJ2aWrDnkySTVxAezsUfNp8PpsOUKs1M5
	T7HB+VlVrUDV3LsMtW7Z3x1Kbm1BqSgRPzyJbplpADqqTI3Rivuxa0LgU37zlzOQTzOkK3lE2E88l
	kMJTubDEM2JR4/QYMXPsDOg9j1dW4jgdVaHJKTr6eYB1XjfIUWn6uGTFSmojqmDm48J4htChzfXk8
	+ZyynMZTpXv9YXtXBYBxzcQw6a0BUPZr3b0qtjljTnRHmhtEPxHAFmbuCTmvpfSOmnh5OB+MOQMGM
	ZUfoP9aw==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLU6v-009FU9-2u;
	Mon, 17 Jul 2023 19:42:23 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso699998166b.3;
        Mon, 17 Jul 2023 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689622791; x=1692214791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOp2ZZ3wc36w9kvHwXp3awpd0wFGnA+hVpdKbz6GNXU=;
        b=DheUe9jqHtnMNx6N40uCc5AiolO11iz7WAmfwD5rCkeOqGj09Sx8tR6PZERo3jKe1m
         yaSa6GpCqRVUSf4+acnPacv2dNnsDZqeVxuPDfHw4Td6k3oLcEekxIHVL5DM7lUydvFZ
         1yH4MXeuVnqFJR6JiFjmP4gXyjIUorYoxdLot1ekrL0gkrY6mjCO0iNwacJwU8c9fBaD
         emJeHw+wYJaUYZTUsjKIXvMc6zD8+c9HU+BwD/q0gBAYdVVCZBwJXCBRrVJJgz75L9I3
         qltW9FwH9S69mpWDlwv4/kUfAUFPPoUC25iZ/kMewrK0Gq+l2iI7fBTRnFlkzWzGH6za
         OPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689622791; x=1692214791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOp2ZZ3wc36w9kvHwXp3awpd0wFGnA+hVpdKbz6GNXU=;
        b=h1YB0H53Ab/a8IfaVGiramdvsgR8qbHaaciJlQgJQD3e3kqBh9svcP91aDomicfBrR
         WKvLVyvNiRY9tftAWp81XvXW/saR5gLR+CcoqVclG87lL/E+MjgBMT3IE3KydZ/1vBF6
         +L6Lu49+uqpE9YZMzKDyElPmhWtr2mvLylvj97a9QZ+n87NQQInX7uSuv4LA/9e6Pd6Z
         7CjtAWN/uDRZJ2txvXLLdfFxpNLR9UrCUUd10cLP7LL8cQgxhde0MM/UykF3GasSP0wT
         QJApnNqqCis/7AJRctLScAf2jDq13naLd9HYUUlMZnV2Aq/QccE1OukMbFjsFYTjx6pZ
         RvFg==
X-Gm-Message-State: ABy/qLalD3X9jCF3j0HMxfaMsH0dUegXsQK1PfIK6cyKvX2k7hw/UDqw
	2BKN8zcd8vyPjpuWHDOaVz2v5CxTiEQSZYxckOc=
X-Google-Smtp-Source: APBJJlG66q2eVrKtgpAASjhMjhczg4W5QDeuTaoOb4zn9mrNG3umEbjvgyH7X6msZHAYfZ9gd95bh+fbUtFHCcQUtj8=
X-Received: by 2002:a17:907:1c1a:b0:992:ef60:ab0d with SMTP id
 nc26-20020a1709071c1a00b00992ef60ab0dmr12390276ejc.69.1689622790750; Mon, 17
 Jul 2023 12:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com> <13f7153786cfcdc3c6185a3a674686f7fbf480dc.camel@crapouillou.net>
In-Reply-To: <13f7153786cfcdc3c6185a3a674686f7fbf480dc.camel@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jul 2023 22:39:14 +0300
Message-ID: <CAHp75VdVM87gbFX9sPKo-+eVRUsK8pmC_fyCQ-_6oMMm1aAQ9Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] pinctrl: tegra: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
To: Paul Cercueil <paul@crapouillou.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Balsam CHIHI <bchihi@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_204222_330115_AE1839F4 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 17, 2023 at 10:14=E2=80=AFPM Paul Cercueil <paul@crapouillou.ne=
t> wrote:
> Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9crit=
 :

...

> Another driver where using EXPORT_GPL_DEV_PM_OPS() would make more
> sense.

OK.

...

Thank you for the review of the series!

--=20
With Best Regards,
Andy Shevchenko

