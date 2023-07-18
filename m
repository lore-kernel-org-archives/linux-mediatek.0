Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CE6C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjafSjwhPYU7xqZqTIKooSTK5vgwuXrvEkZkgBS1tpQ=; b=V8a62puMCtp9jjYW9PHpias+SU
	dHpTUToDLwMV0UCn1/hpDgHt1C5fx3n6AqKoqHXuf4dL2Yp/Ye4/beseHR2c9c+IOP5gRgTQUGlNF
	yFaxDFuBvevlrPBUsPqsgl0P53VN1YveJSujp2L4uPDb/pRrk/a1X+HmjmcCZ8J2Rz+Omwfr2g7j7
	3YGn6oTjza5/RqkMvcDmOMOXl5xPlr50wK+/W7Zcu6Tx9HbZ11K2fO4dwZDwGz8Tv5e+ur1J9yhz3
	I8PYDHeIMfGhNAmHRp8KOg3PVfFKcDlkN+9c5AcjGULQApfUmLghrT7eypz7OokqnmCBwWKF5UVa+
	rfWz8wKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM09u-005SZz-0N;
	Wed, 19 Jul 2023 05:55:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM09s-005SZ4-2Y;
	Wed, 19 Jul 2023 05:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rjafSjwhPYU7xqZqTIKooSTK5vgwuXrvEkZkgBS1tpQ=; b=DF00aI1H6VvnKmgOehHcv4bmqU
	WZDJffAPKCSeJjFm4JRjfuZmj9K1F0SN8v1lsi9CgP4fww/BG2gOCisWNR7hnpco9Rt2fpywwt8ih
	8vAk1k31Y+A3DHJo35C1AlPFcXp9FrU9aq4msJGBkCYx/jQSklR83zdZE2Ghqbqy7wQntboO7Ik/c
	n4DAzL7RTBgJJWJtMfN9rfKnodPrCV/xegxz2S4gcyvkG6TsQIKDkApwZKedxNdq8tb17F/te+03l
	xL6NKSMu5jZRSwjJ/QaW3M/KsQh/QIWe93IQCzPzfTQlYmvXmtSWcbs9e3vv4IIJzvjH/mpIfLavU
	T6jPxuYg==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLk4x-00BWVk-0m;
	Tue, 18 Jul 2023 12:45:25 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9936b3d0286so801042166b.0;
        Tue, 18 Jul 2023 05:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689684252; x=1692276252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjafSjwhPYU7xqZqTIKooSTK5vgwuXrvEkZkgBS1tpQ=;
        b=svWBMpAzUIcAKZFhbHmS1VForkB52Iwtil3hYos/NhMBLkdcnjFkQYfMA27oQkeQ0c
         J8gz0UU9uTFqvcyqYgZItHaSIGB9kZpwgzHISgERQJAXsUOB2kdPZJk2GEOJ7TvDhA91
         oltJy+6JfEkrHkOzlR2nmE22d1ttxlNPAs+b7TUOyNW9gwl4anIMdjZab5YvdHSMHCAB
         rHEv6KI1D7LUHjErwNrACg0CbZeFJmTBkY6pdFswB7i1RrOuBU80ZlNb31wgTtpX+T8C
         602eYVK4LPPZ+vyCtu0zQWz6sM4CVSq9dFS9vQjUaWIQYCzVmQUPT4HexvKIFyGUEqrM
         3Prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689684252; x=1692276252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjafSjwhPYU7xqZqTIKooSTK5vgwuXrvEkZkgBS1tpQ=;
        b=AZCmnsRZGxZ6c9t1T30p7SuZkNuMRUtZQOpEQ24Ue1gBeQi7zsxSB+nVvNazHTRaWq
         ea6Wcsekn2ljghUJOhwA6c+c8K5q7u4PqybSwxCp2alCAabXEWe1Fbd3WWQTnv6lQCry
         edSPRVBy3oQMcSZXwL1l156eAl8grG0F4f16MHtRU9Rrfr36SqFOIdsSB/CMSlf9Rs9e
         5EZWH4NVxMhsUReeCub3V9jBTIktT8IaUNjNWbTvsPW3iLP8axK8EForyrfzlJEmBdEG
         pCDQqmaxLrGKJaaRmeW/Z2bIri92ROhN+G4xflm6dRzEfqLPQRUpfwUQvCdV5/7h60aq
         KHDw==
X-Gm-Message-State: ABy/qLZHeh+4YUQ7gxTvxxQdJ8UotSmmstQaMOw2971neEPVKPZpXQSu
	qsWZo2zYlTz+/pKD2Q37ECvumI2l0Un+TIjwMcc=
X-Google-Smtp-Source: APBJJlG9m2BdQIW7onW1xnE8sV9rYPKp5JUOVkqIggApCTArboC/1wLbwqqnhKpHXdE0VmBN/AdKoTT/9mSwxAThd1A=
X-Received: by 2002:a17:906:1054:b0:994:569b:61b4 with SMTP id
 j20-20020a170906105400b00994569b61b4mr9894424ejj.28.1689684251957; Tue, 18
 Jul 2023 05:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-10-andriy.shevchenko@linux.intel.com>
 <03592cf5d6854dd5e534e0416de946fd38e4380c.camel@crapouillou.net> <CAMuHMdWMHjFdh0Ze9k8gZC_Cjp62zdwDK1cvehHb5WXYw+p1XQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWMHjFdh0Ze9k8gZC_Cjp62zdwDK1cvehHb5WXYw+p1XQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Jul 2023 15:43:35 +0300
Message-ID: <CAHp75VeVvUL29KUKaLHMpBnQE+WTkQmp=cC2y=dcjjv_d=D8vQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] pinctrl: renesas: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Cercueil <paul@crapouillou.net>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20230718_134523_569432_7F084FCD 
X-CRM114-Status: GOOD (  13.87  )
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

On Tue, Jul 18, 2023 at 1:12=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Mon, Jul 17, 2023 at 9:12=E2=80=AFPM Paul Cercueil <paul@crapouillou.n=
et> wrote:
> > Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9cr=
it :

...

> > I think you could do:
> >
> > .pm =3D IF_PTR(IS_ENABLED(CONFIG_ARM_PSCI_FW), pm_sleep_ptr(&sh_pfc_pm)=
),
> >
> > Then you wouldn't need the #if defined(CONFIG_ARM_PSCI_FW) guard either
> > (as long as the code still compiles fine when that config option is
> > disabled), and you wouldn't need those dummy callbacks.
>
> Unfortunately not, as the code refers to psci_ops.cpu_suspend.
>
> You could create a small wrapper for that, though.

 I think it's already too many wrappers mentioned and since you
reviewed and acknowledged the change (thanks!) I will stick with my
initial version.

--=20
With Best Regards,
Andy Shevchenko

