Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323E9EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XXAvWK8rNQ/H4MBZnhz1+8BiEC/rhEPybQEdDVdR8c=; b=WKGdoDWZu3s9POsJJg/Z43nknZ
	WevqGtAkVonUA+tYMEQzD9ewDl03iaEnlmLy4GSyiwrsfS3sRR+1Ra+Gh3z4RiHXQ1AqN+BCCYdO2
	dEflvZf6p+xGjQxv1Th6vu/T5IGS/9ikldij2l3jita9QExq+x75NdD5x7VVEszGZ8ws5lrrRUQsr
	lcLRHND9jEoh9cajSbGkTuA+1nJMCtY39k5QOuX9z3cOdZaO0w7PMlQjqA38cmi+puyyHiMd9Iqcn
	f+zJOSmWPhR52hEqaxOp8G++eC51nRpNT32DfH7EAQ2MrOchw+8ut+FLT+ySxUiC5JfK4V7/UyUfA
	RRVqEXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Tq-005dRT-36;
	Wed, 19 Jul 2023 06:16:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Tp-005dQI-2H;
	Wed, 19 Jul 2023 06:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4XXAvWK8rNQ/H4MBZnhz1+8BiEC/rhEPybQEdDVdR8c=; b=EBOn7P2Ol6+5cmNEsrxenZqeUE
	D+52sk6mD8+rc8HoVFwSgIQ6SBYROemSbm19JEChwNhpsAyMozGxY4Pbik5WIQk8B6oLPdqirHxQG
	keJMy10BeiIHdpI44MFXCMf5cqNXcbMG97hqn9qeHwmAfsX92r1PBD64176MB15T+4wp6XZ8at+Dx
	craSbJWX3Sya/mHF3YaVnGa1YQuhpDE8Ckq3WN2Rew/GnTQ3/gcCfZ6iXv5asKwycGvKS403mnSB+
	LGibj9GI41hvJKxvUEFEioQg5byaub6FS35u1vT4s3UEYX9N08cU2oqnrDIHVpQhDfFe/E4HYboWi
	Jmot0hOw==;
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhaW-00BOiy-0c;
	Tue, 18 Jul 2023 10:05:50 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6b73741a632so4371108a34.3;
        Tue, 18 Jul 2023 03:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689674739; x=1692266739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XXAvWK8rNQ/H4MBZnhz1+8BiEC/rhEPybQEdDVdR8c=;
        b=UeVgFOdl5KifdCnlY8V2BhuTZpU6K4MSuEeyfCy4Z17f9Vy0l/Ca7MmscFRgv+c9QF
         67KU7ryZjdRpvTxdxwOoxxSrTWah0nGeIG1alEoXbWYiLI152R++T1iPL7SySeyOH+Qf
         9amXlOpqQPX335+Mf1iX4FkHOXfric6LSLLNix8dl2dUhvmvlAZcvu9MYcZZvUuE+cJg
         5F6ZWevR6mUY+X5X/kbICUwVjyDvj6XMIdy0KO/w/YTy6EMUEvGI3sBSIxU/n8gfG/EP
         6KqkeQuVuzXHqsfbU/rmQ/l7Cz/K6qvrY+SIiVosAJJqs3ns/G+9o2LHZ1I3zQwaMw1P
         jW0w==
X-Gm-Message-State: ABy/qLYqa3dtggMQGIOjs7jo+QxxPYUhZ/NP94hzDqBGZIu9ElYWl8cH
	KCXVBCSxQMyrpZmay08k60e6AHpguqb0bw==
X-Google-Smtp-Source: APBJJlFA4n2nV1Yrvsyob0guhqD4TLs3L+zy+3c08axlS0QL/q2nd4VprEq8jUL/bPWZF62/ADBjDA==
X-Received: by 2002:a9d:7e86:0:b0:6b9:b0f6:eab8 with SMTP id m6-20020a9d7e86000000b006b9b0f6eab8mr14645187otp.5.1689674738014;
        Tue, 18 Jul 2023 03:05:38 -0700 (PDT)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com. [209.85.161.44])
        by smtp.gmail.com with ESMTPSA id g9-20020a9d6c49000000b006b991ac6408sm702228otq.40.2023.07.18.03.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 03:05:37 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5633b7e5f90so3686568eaf.1;
        Tue, 18 Jul 2023 03:05:37 -0700 (PDT)
X-Received: by 2002:a05:6358:339a:b0:132:962d:b5c5 with SMTP id
 i26-20020a056358339a00b00132962db5c5mr12434640rwd.30.1689674736826; Tue, 18
 Jul 2023 03:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-10-andriy.shevchenko@linux.intel.com> <03592cf5d6854dd5e534e0416de946fd38e4380c.camel@crapouillou.net>
In-Reply-To: <03592cf5d6854dd5e534e0416de946fd38e4380c.camel@crapouillou.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jul 2023 12:05:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMHjFdh0Ze9k8gZC_Cjp62zdwDK1cvehHb5WXYw+p1XQ@mail.gmail.com>
Message-ID: <CAMuHMdWMHjFdh0Ze9k8gZC_Cjp62zdwDK1cvehHb5WXYw+p1XQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] pinctrl: renesas: Switch to use
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
X-CRM114-CacheID: sfid-20230718_110548_646828_4CAF1436 
X-CRM114-Status: GOOD (  29.58  )
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

Hi Paul,

On Mon, Jul 17, 2023 at 9:12=E2=80=AFPM Paul Cercueil <paul@crapouillou.net=
> wrote:
> Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9crit=
 :
> > Since pm.h provides a helper for system no-IRQ PM callbacks,
> > switch the driver to use it instead of open coded variant.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/pinctrl/renesas/core.c | 16 +++++++---------
> >  1 file changed, 7 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/pinctrl/renesas/core.c
> > b/drivers/pinctrl/renesas/core.c
> > index 0c8d081da6a8..34232b016960 100644
> > --- a/drivers/pinctrl/renesas/core.c
> > +++ b/drivers/pinctrl/renesas/core.c
> > @@ -649,7 +649,7 @@ static const struct of_device_id
> > sh_pfc_of_table[] =3D {
> >  };
> >  #endif
> >
> > -#if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM_PSCI_FW)
> > +#if defined(CONFIG_ARM_PSCI_FW)
> >  static void sh_pfc_nop_reg(struct sh_pfc *pfc, u32 reg, unsigned int
> > idx)
> >  {
> >  }
> > @@ -732,15 +732,13 @@ static int sh_pfc_resume_noirq(struct device
> > *dev)
> >                 sh_pfc_walk_regs(pfc, sh_pfc_restore_reg);
> >         return 0;
> >  }
> > -
> > -static const struct dev_pm_ops sh_pfc_pm  =3D {
> > -       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(sh_pfc_suspend_noirq,
> > sh_pfc_resume_noirq)
> > -};
> > -#define DEV_PM_OPS     &sh_pfc_pm
> >  #else
> >  static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
> > -#define DEV_PM_OPS     NULL
> > -#endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
> > +static int sh_pfc_suspend_noirq(struct device *dev) { return 0; }
> > +static int sh_pfc_resume_noirq(struct device *dev) { return 0; }
> > +#endif /* CONFIG_ARM_PSCI_FW */
> > +
> > +static DEFINE_NOIRQ_DEV_PM_OPS(sh_pfc_pm, sh_pfc_suspend_noirq,
> > sh_pfc_resume_noirq);
> >
> >  #ifdef DEBUG
> >  #define SH_PFC_MAX_REGS                300
> > @@ -1418,7 +1416,7 @@ static struct platform_driver sh_pfc_driver =3D {
> >         .driver         =3D {
> >                 .name   =3D DRV_NAME,
> >                 .of_match_table =3D of_match_ptr(sh_pfc_of_table),
> > -               .pm     =3D DEV_PM_OPS,
> > +               .pm     =3D pm_sleep_ptr(&sh_pfc_pm),
>
> I think you could do:
>
> .pm =3D IF_PTR(IS_ENABLED(CONFIG_ARM_PSCI_FW), pm_sleep_ptr(&sh_pfc_pm)),
>
> Then you wouldn't need the #if defined(CONFIG_ARM_PSCI_FW) guard either
> (as long as the code still compiles fine when that config option is
> disabled), and you wouldn't need those dummy callbacks.

Unfortunately not, as the code refers to psci_ops.cpu_suspend.

You could create a small wrapper for that, though.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

