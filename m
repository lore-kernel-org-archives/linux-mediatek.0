Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A91C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stZtAhmuNpwwNr+Q894m8k3WKh9stUMtdjvWGZCxIHo=; b=LMhUpAaPHXRGoFGJx2JK8NUs8L
	oRYpy6FJH53b5TEpupBNdbpTlpC3+q8+iYiRvR1w+akw3nK617cLUx+w+5RI5cDHrIfv+TBJRNt6b
	kZMEmn71tRBY2zKbhFCjPeVmQwW9m7lPdSAYIiJRs/iZLpS1T+5KuF0eZxZ79bkSUF2HxWVsYepT3
	BU8N/Z3AHM7MGlxJ0a++6RRkMTCnOW1lP1y4wfjTEDW3WcVqRjd91aTEuZiywsFsNF02z3z+0hhxR
	fRPFsdCNnkyJ9kN2vbRMCFjYuOX5jKeTbil35CePxjjBf22aePT9EnksgXjEkofU/e9Vu8yIz/Wtc
	AGPKhN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI9of-001RyB-F9; Wed, 18 Jan 2023 14:53:29 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI9ob-001RxB-21
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 14:53:27 +0000
Received: by mail-ej1-x62a.google.com with SMTP id tz11so19439824ejc.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jan 2023 06:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stZtAhmuNpwwNr+Q894m8k3WKh9stUMtdjvWGZCxIHo=;
        b=gMIaZ3BgtMrjudzAxsdaMJEgFE4F9gzWsZ1Yg5Xs9B0YV57CZWNK1/tM+ECj0CcKEd
         xIuekHOqdSaVJlEZnnRWUwaH1iUk1ApyvsCUsQQXCGD2B4NQI9afHBgmp1wCwexCngOt
         zzX/DRCOZlNNUG4j4wQVTNCWbz25KgX8Vytb7DWsJeRsJnmBbyIEOQbsX9towt1QVbRI
         YBI7zXGE9epoTzVPz7ce3Eel4B3wP3NPdaa1RUeWh4axIjSsnEszLvmCuPKmBQ+5xbF1
         Yv+ZBWZMREChJCcVzSRJSmn+Rub06XXL3yUlgpZyKmilLtCpt+TUt1DP6Nh4KcbukFdd
         obZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stZtAhmuNpwwNr+Q894m8k3WKh9stUMtdjvWGZCxIHo=;
        b=fxh6Lkl1P5Y041AucDrvueQUXNi0al8ppxWhWGx0qGSFjsRIdiyfYoy3eLyF7xdAWA
         XsZAvLOtNaRBdFRARQcNxBpDtgACM5c3UoHOsaF3mlNvaGSNRQbcaJVfJYcoR3OeROX5
         GI2LTfGVZJyACvrpBqRkLTuI3jAqCckZH8q8Wq8KMoWiCH+gkWUAJLt8txsMNcYcsxu0
         /gV1/r0fNxnXvgo/9g/XfgFljr0BfU9PyB9WH2JHkB+CMkqZRX6K13EXVLmovMIhal4s
         Rjdss0Gp2eqC9LEqgt7m55wvAmLTN9Q87/nD/idQrA9uGUf24gJbrwfPFlMYGsFJkufG
         TrCw==
X-Gm-Message-State: AFqh2kqYCHdgCkyjwSuLRb7m+Rq1FAlfKsaoU02oJM6VILBgkNuj8BB7
	ex7mAjUyTdhlXjl5epuJFnBOP+qBosN/5hRvUCbIyg==
X-Google-Smtp-Source: AMrXdXsy2xOVzKPF0BPi56xPXa3Dor+FMxBaDAcYFF6uykQ8n333+Ht+vnPUlk+XgfFvmMKAR3q9fU8or89lfSRfdyU=
X-Received: by 2002:a17:906:4a99:b0:86f:3748:a4ef with SMTP id
 x25-20020a1709064a9900b0086f3748a4efmr874161eju.462.1674053602831; Wed, 18
 Jan 2023 06:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20230112152855.216072-1-bchihi@baylibre.com> <20230112152855.216072-5-bchihi@baylibre.com>
 <feab4ff4-b874-aa10-2031-ad6b84cbc004@collabora.com> <CAGuA+ooxTf-j957gQ1zRe2-+u2kphaaLGvTDi1=kit5Q3bKOxA@mail.gmail.com>
 <71e5c68a-dbc7-caac-d6d4-5a8cd5b20d5e@linaro.org>
In-Reply-To: <71e5c68a-dbc7-caac-d6d4-5a8cd5b20d5e@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 18 Jan 2023 15:52:46 +0100
Message-ID: <CAGuA+oqQt_qZpep_77j=wCS_CuXTVz9mHYdT91+NP96JP8UKLQ@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] thermal/drivers/mediatek: Add the Low Voltage
 Thermal Sensor driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, rafael@kernel.org, 
	amitk@kernel.org, rui.zhang@intel.com, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, khilman@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_065325_121442_03929438 
X-CRM114-Status: GOOD (  23.06  )
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

Hi Daniel,

On Wed, Jan 18, 2023 at 3:30 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
>
> Hi Balsam,
>
> On 18/01/2023 14:58, Balsam CHIHI wrote:
>
> [ ... ]
>
> >> You're describing the register with nice words, but there's another wa=
y to do
> >> the same that will be even more effective.
> >>
> >> /*
> >>    * LVTS MONINT: Interrupt Monitoring register
> >>    * Each bit describes the enable status of per-sensor interrupts.
> >>    */
> >> #define LVTS_MONINT_THRES_COLD  BIT(0)  /* Cold threshold */
> >> #define LVTS_MONINT_THRES_HOT   BIT(1)  /* Hot threshold */
> >> #define LVTS_MONINT_OFFST_LOW   BIT(2)  /* Low offset */
> >> #define LVTS_MONINT_OFFST_HIGH  BIT(3)  /* High offset */
> >> #define LVTS_MONINT_OFFST_NTH   BIT(4)  /* Normal To Hot */
> >> #define EVERYTHING_ELSE ........................
> >>
> >> #define LVTS_MONINT_SNS0_MASK   GENMASK( ... )
> >> #define LVTS_MONINT_SNS1_MASK   GENMASK .....
> >>
> >> /* Find a better name for this one */
> >> #define LVTS_MONINT_EN_IRQS     ( LVTS_MONINT_THRES_COLD | LVTS_MONINT=
_THRES_HOT |
> >>                                    LVTS_MONINT_OFFST_LOW ..... etc etc=
)
> >>
> >
> > Given the complexity of the controller and the number of registers,
> > if we create a define per bits, we will end up with a huge list of
> > defines (~300).
>
> Yeah, that is too much for a little gain.
>
> However, a few can be added for the interrupt only.
>
> Instead of LVTS_MONINT_THRES ..., it could be LVTS_INT_THRES_... and
> reused for LVTS_MONINTSTS and LVTS_MONINT setup as the bits position are
> the same?
>

OK, I will add a few for the interrupts.

> [ ... ]
>
>
> >>> +static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl =
*lvts_ctrl)
> >>> +{
> >>> +     u32 period_unit =3D (118 * 1000) / (256 * 38);
> >>
> >> #define SOMETHING       118
> >> #define SOMETHING_ELSE  1000
> >> #define ....
> >>
> >> const u32 period_unit =3D (SOMETHING * SOMETHING_ELSE) / ....
> >>
> >
> > Constifying "u32 period_unit" generates the following compilation warni=
ng :
> > ./include/asm-generic/io.h:273:61: note: expected =E2=80=98volatile voi=
d *=E2=80=99
> > but argument is of type =E2=80=98const void *=E2=80=99
> >    273 | static inline void writel(u32 value, volatile void __iomem *ad=
dr)
> >        |                                      ~~~~~~~~~~~~~~~~~~~~~~~^~=
~~
>
> That is strange. period_unit is the 'value', not the 'addr'. Are you
> sure about the warning?

I double-checked and you are right.
The warning is not related to "const u32 period_unit".
It is related to the previous one, which is "const void __iomem *lvts_edata=
".
And this is the full log :

drivers/thermal/mediatek/lvts_thermal.c: In function =E2=80=98lvts_ctrl_cal=
ibrate=E2=80=99:
drivers/thermal/mediatek/lvts_thermal.c:835:47: warning: passing
argument 2 of =E2=80=98writel=E2=80=99 discards =E2=80=98const=E2=80=99 qua=
lifier from pointer target
type [-Wdiscarded-qualifiers]
  835 |   writel(lvts_ctrl->calibration[i], lvts_edata[i]);
      |                                     ~~~~~~~~~~^~~
In file included from ./arch/arm64/include/asm/io.h:163,
                 from ./include/linux/io.h:13,
                 from ./include/linux/irq.h:20,
                 from ./include/asm-generic/hardirq.h:17,
                 from ./arch/arm64/include/asm/hardirq.h:17,
                 from ./include/linux/hardirq.h:11,
                 from ./include/linux/interrupt.h:11,
                 from drivers/thermal/mediatek/lvts_thermal.c:12:
./include/asm-generic/io.h:273:61: note: expected =E2=80=98volatile void *=
=E2=80=99
but argument is of type =E2=80=98const void *=E2=80=99
  273 | static inline void writel(u32 value, volatile void __iomem *addr)
      |                                      ~~~~~~~~~~~~~~~~~~~~~~~^~~~

>
>
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>

Best regards,
Balsam

