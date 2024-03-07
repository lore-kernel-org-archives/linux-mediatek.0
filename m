Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D189AC54E49
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 11:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OrNnr6gHqc42Ky1FeFcCvehza56T+Pa8i2e3OFWYmw=; b=KdsyDPEzSOMQSBdg6Hlig6ZQgz
	MuXI2WpeFk467b0mzfeTsSg2+Yrhx8aI9et4V5CSGxr1FbzB/RIu6IvSFzsEQ2elVZeLxqZyrwpCj
	njSlcd2hZrhc4SMu2+U3S6XrmYJp3B3TsZkRqGApyhqj+Vipm23VPcT/uY4l2+KHw6SR9qBKr2qpt
	lgA/qIloG2bPg6F/TXeoH6QvtKeyIza1EcfpXNuXKOfBjMg5CWBXeQvgZ4r4itpHstIduGqxDtTo7
	T7s5GwggkVYJjhCKCHWysoDfOa1sHNOGMzizvyhTmaUw2ylXOphMj5WHtaRQZY+1EcoVzhlQMxBPJ
	Zr/mG78Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riBeW-00000004EDF-3hiw;
	Thu, 07 Mar 2024 11:11:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riBeO-00000004E73-1RLV
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Mar 2024 11:11:06 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dd2dca2007so5780475ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Mar 2024 03:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709809856; x=1710414656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OrNnr6gHqc42Ky1FeFcCvehza56T+Pa8i2e3OFWYmw=;
        b=eGcaILgQI2eSSwwXy8ENe1EYn82eS8nX2oDqQN+hMVwMXgYSgvRPkqY3CM6/fti581
         sNzlnywXHX9bZCHBwrVLbhOqPwjFuzXYj/1SbR5+vUBQ+ugpEq3eQXQvz3FplAh9FHiT
         ghIe7IAIypjRSuFhXBUHkKY/oAp1Q58qx582M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709809856; x=1710414656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OrNnr6gHqc42Ky1FeFcCvehza56T+Pa8i2e3OFWYmw=;
        b=TDlJe6c5R1gNokaEml8Gzb5AlBQlhQnWYTe+KlgT+ja9gWLggg9sGawQP7SLBnvIpr
         WamNLBHkbxld0WxJlWib5ut8GctNQJ2S+vk3mfgSzXMjmuXYvT897+wn93I5V076aMdj
         lOlQNOT6BWED9FbF1CuyoX14E+uaop/nzO7xYmt/li3pt2YecyTNBfCYMPVRXjcg29TV
         ES8P7srOdEyiOSV67sOtpY4fiqL/m/dtsXiLUInneLbMBh/X58tJdbY3ucR1IaYytENA
         Jf6WyRg2+PBzSaj1YLZfSVTSb5IKUOXvaHlG+PC74bRJ8pcD4ggUbRVt1OnCw6Cbve3E
         fXig==
X-Forwarded-Encrypted: i=1; AJvYcCVLKhWE4qI2E/F0HSpESI9Ax/P4HJsZecA8ofHGrQ0HzAS4HHAsrN1KjV1vf4jQuMGkhjN5H8HcJ/rMdwfwmfjEXQs+wHNAyNP+5f6lc4xgId9s
X-Gm-Message-State: AOJu0YyFe7tj7NkhcY0EBM9pR1tElevCH6eTe+K3eU9KfNH3pShOn1SR
	sV0s32E4A5I0t5hCaybZa4syT2kbQSM8RqCTzjpLSFAEQRVY3SxW7fydLK6bUVB3w+VYi99kZeC
	c4u1CBA2bHSjJ1cMxHXBxupxWLeQgJuCe62mG
X-Google-Smtp-Source: AGHT+IFxA69w3fb5rTaHx0WWeDwNDwE8addr1vYQfdEOYmu/vTHtVI+D/+lM+o+ttEqHQRihTUFAaiYFNtKyeHldlLU=
X-Received: by 2002:a17:902:e84d:b0:1db:c390:1fdc with SMTP id
 t13-20020a170902e84d00b001dbc3901fdcmr9601288plg.1.1709809855695; Thu, 07 Mar
 2024 03:10:55 -0800 (PST)
MIME-Version: 1.0
References: <20240108081834.408403-1-treapking@chromium.org>
 <CAGXv+5EnBt+7WrNb-QyziEaCihvjhFVf2tpzk=XyAoeELqucaw@mail.gmail.com>
 <e0e6febf-1045-49f8-a200-8bc095b0fa50@collabora.com> <CAGXv+5F5YFRKjaXu_XbXrUhqKL0NSRyt6tniQYfhRh+fsaxqmg@mail.gmail.com>
 <cc74422d-962f-4da5-867b-158a71db1a7b@collabora.com> <CAGXv+5EyRROsh_=J1Fg4K+ZgfkERF4dh4R6WoGw9MnTBMNUCgQ@mail.gmail.com>
 <dfdc6a65-3ccf-463c-95df-093f3c2fefd3@collabora.com>
In-Reply-To: <dfdc6a65-3ccf-463c-95df-093f3c2fefd3@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 7 Mar 2024 19:10:44 +0800
Message-ID: <CAEXTbpcPfWQr4iuD2U0zgJUi+BF-rLfyF4iDDiQYBrrv9U=6Xg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_031100_599197_CAA34987 
X-CRM114-Status: GOOD (  60.39  )
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

Hi Angelo and Chen-yu,

I tried enabling the runtime PM regardless of the .need_pm_runtime
flag, and my MT8183 device works well with that with no obvious boot
regression.

Should I send out another patch that always enables runtime PM in
__mtk_clk_simple_probe()? Or is there anything I should test?

Regards,
Pin-yen

On Thu, Feb 29, 2024 at 6:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/02/24 11:34, Chen-Yu Tsai ha scritto:
> > On Thu, Feb 29, 2024 at 5:45=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 29/02/24 08:17, Chen-Yu Tsai ha scritto:
> >>> On Mon, Feb 26, 2024 at 7:16=E2=80=AFPM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> Il 23/02/24 05:27, Chen-Yu Tsai ha scritto:
> >>>>> On Mon, Jan 8, 2024 at 4:18=E2=80=AFPM Pin-yen Lin <treapking@chrom=
ium.org> wrote:
> >>>>>>
> >>>>>> Introduce a new need_pm_runtime variable to mtk_clk_desc to indica=
te
> >>>>>> this clock controller needs runtime PM for its operations.
> >>>>>> Also do a runtime PM get on the clock controller during the
> >>>>>> probing stage to workaround a possible deadlock.
> >>>>>>
> >>>>>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >>>>>
> >>>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>>>
> >>>>> The patch itself looks fine.
> >>>>>
> >>>>> Besides the MT8183 MFG clock issues, we do actually need this for t=
he
> >>>>> MT8192 ADSP clock. Its power domain is not enabled by default.
> >>>>>
> >>>>
> >>>> ...but on MT8195 the ADSP clock works - because the ADSP node exists=
.
> >>>
> >>> That's an indirect dependency that should not be relied on. Say the c=
lock
> >>> driver probed but the ADSP hasn't, and you try to read out the curren=
t
> >>> status. What would happen?
> >>>
> >>> - Read out works fine, because the power domain is default on, and ha=
sn't
> >>>     been turned off by late cleanup
> >>> - Read out is bogus (but you can't tell)
> >>> - Read out hangs.
> >>>
> >>> The third is what happens on MT8192. There's still some issues on tha=
t
> >>> front, as even after I applied the ADSP power domain patches from Med=
iaTek,
> >>> the readout was still hanging.
> >>>
> >>
> >> That MT8192 lockup story is getting crazy in my head... anyway, beside=
s that,
> >> I get the point - I was somehow ignoring the fact that kernel modules =
do exist.
> >>
> >> Eh, sorry about that :-)
> >>
> >>>> This poses a question: should we make clock controllers depend on po=
wer domains,
> >>>> or should we keep everything powered off (hence clocks down - no pow=
er consumption)
> >>>> *unless* the user exists?
> >>>
> >>> That's a policy discussion separate from actual hardware dependencies=
.
> >>> *If* the clock controller needs the power domain to be active for the
> >>> registers to be accessed, the clock controller *must* have a direct
> >>> dependency on the power domain.
> >>>
> >>
> >> I admit I should've worded that better.
> >>
> >> "should we make clock controllers depend on power domains" was actuall=
y implying
> >> "IF those need one" :-)
> >>
> >> I really wonder if - at this point - it's simply a better idea to not =
restrict
> >> the call to devm_pm_runtime_enable/resume_and_get to `need_runtime_pm =
=3D=3D true`.
> >>
> >> Do we really need to exclude that on other clock controllers that don'=
t have
> >> any power domain dependency? Any side effect?
> >>
> >> Saying this because if we can avoid yet another per-SoC flag I'm reall=
y happy,
> >> as readability is also impacted and besides - if we ever find out that=
 one of
> >> those need a power domain in the future, we'll need just one commit an=
d just
> >> only in the devicetree, instead of enabling a flag in driver X as well=
 as that,
> >> avoiding some (potentially unnecessary) noise... I guess.
> >>
> >> P.S.: I just noticed that the return value for the devm_pm_runtime_ena=
ble() call
> >>         is not being checked!
> >>
> >> .......
> >>
> >> In short....
> >>
> >> Chen-Yu, at this point, do you have any reason why we wouldn't be able=
 and/or it
> >> wouldn't be a good idea to just avoid adding the `need_runtime_pm` fla=
g (meaning
> >> that we perform pm_runtime calls for all clock drivers unconditionally=
)?
> >>
> >> If this is about longer boot time, I don't think that it's going to be=
 more than
> >> a millisecond or two, so that should be completely ignorable.
> >
> > I think it's just more of a "don't enable features you don't need" thin=
g.
> > We already ran into a weird deadlock, which is why the devm_pm_runtime_=
enable()
> > call has that comment.
> >
> > I don't think anyone has actually looked at it. As you said it shouldn'=
t be
> > much, at least during boot time. It's one call per clock controller.
> >
> >> Can you please do a test for that, or should I?
> >
> > The earliest I can work on it would be some time next week. Does that w=
ork
> > for you?
> >
>
> The earliest I'd be able to work on this myself would be at the end of ne=
xt
> week if not later.. so yes, please take your time, no worries.
>
> Thank you!
>
> > ChenYu
> >
> >> Cheers
> >> Angelo
> >>
> >>>> For the second one, this means that the *device* gets the power doma=
in (adsp), and
> >>>> not the clock controller (which clocks are effectively useless if th=
ere's no user).
> >>>
> >>> No. See my previous paragraph.
> >>>
> >>> ChenYu
> >>>
> >>>> Angelo
> >>>>
> >>>>>> ---
> >>>>>>
> >>>>>> Changes in v3:
> >>>>>> - Update the commit message and the comments before runtime PM cal=
l
> >>>>>>
> >>>>>> Changes in v2:
> >>>>>> - Fix the order of error handling
> >>>>>> - Update the commit message and add a comment before the runtime P=
M call
> >>>>>>
> >>>>>>     drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
> >>>>>>     drivers/clk/mediatek/clk-mtk.h |  2 ++
> >>>>>>     2 files changed, 21 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek=
/clk-mtk.c
> >>>>>> index 2e55368dc4d8..ba1d1c495bc2 100644
> >>>>>> --- a/drivers/clk/mediatek/clk-mtk.c
> >>>>>> +++ b/drivers/clk/mediatek/clk-mtk.c
> >>>>>> @@ -13,6 +13,7 @@
> >>>>>>     #include <linux/of.h>
> >>>>>>     #include <linux/of_address.h>
> >>>>>>     #include <linux/platform_device.h>
> >>>>>> +#include <linux/pm_runtime.h>
> >>>>>>     #include <linux/slab.h>
> >>>>>>
> >>>>>>     #include "clk-mtk.h"
> >>>>>> @@ -494,6 +495,18 @@ static int __mtk_clk_simple_probe(struct plat=
form_device *pdev,
> >>>>>>                            return IS_ERR(base) ? PTR_ERR(base) : -=
ENOMEM;
> >>>>>>            }
> >>>>>>
> >>>>>> +
> >>>>>> +       if (mcd->need_runtime_pm) {
> >>>>>> +               devm_pm_runtime_enable(&pdev->dev);
> >>>>>> +               /*
> >>>>>> +                * Do a pm_runtime_resume_and_get() to workaround =
a possible
> >>>>>> +                * deadlock between clk_register() and the genpd f=
ramework.
> >>>>>> +                */
> >>>>>> +               r =3D pm_runtime_resume_and_get(&pdev->dev);
> >>>>>> +               if (r)
> >>>>>> +                       return r;
> >>>>>> +       }
> >>>>>> +
> >>>>>>            /* Calculate how many clk_hw_onecell_data entries to al=
locate */
> >>>>>>            num_clks =3D mcd->num_clks + mcd->num_composite_clks;
> >>>>>>            num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clk=
s;
> >>>>>> @@ -574,6 +587,9 @@ static int __mtk_clk_simple_probe(struct platf=
orm_device *pdev,
> >>>>>>                            goto unregister_clks;
> >>>>>>            }
> >>>>>>
> >>>>>> +       if (mcd->need_runtime_pm)
> >>>>>> +               pm_runtime_put(&pdev->dev);
> >>>>>> +
> >>>>>>            return r;
> >>>>>>
> >>>>>>     unregister_clks:
> >>>>>> @@ -604,6 +620,9 @@ static int __mtk_clk_simple_probe(struct platf=
orm_device *pdev,
> >>>>>>     free_base:
> >>>>>>            if (mcd->shared_io && base)
> >>>>>>                    iounmap(base);
> >>>>>> +
> >>>>>> +       if (mcd->need_runtime_pm)
> >>>>>> +               pm_runtime_put(&pdev->dev);
> >>>>>>            return r;
> >>>>>>     }
> >>>>>>
> >>>>>> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek=
/clk-mtk.h
> >>>>>> index 22096501a60a..c17fe1c2d732 100644
> >>>>>> --- a/drivers/clk/mediatek/clk-mtk.h
> >>>>>> +++ b/drivers/clk/mediatek/clk-mtk.h
> >>>>>> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
> >>>>>>
> >>>>>>            int (*clk_notifier_func)(struct device *dev, struct clk=
 *clk);
> >>>>>>            unsigned int mfg_clk_idx;
> >>>>>> +
> >>>>>> +       bool need_runtime_pm;
> >>>>>>     };
> >>>>>>
> >>>>>>     int mtk_clk_pdev_probe(struct platform_device *pdev);
> >>>>>> --
> >>>>>> 2.43.0.472.g3155946c3a-goog
> >>>>>>
> >>>>
> >>>>
> >>>>
> >>
> >>
> >>
>

