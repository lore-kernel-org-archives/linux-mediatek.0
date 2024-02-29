Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1FFC54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWZLhJtXrXREGkrkVHASBqM4/svUa094tHpDRDPD6v0=; b=lAObde3UZnZm6khT+vrU4jyLlC
	sFbeBCNkMXfdmFN+hEmjaSrJGEeuSPl8SsMbaygMLl/maoHHS6pREq6tXJOTWeGvsH6tvyhpvH4Tv
	IUaLeUM3X3YT2LnqanlSohi9KvjMGphWTnkkvC0BHfKsXYbX0DqM085CWX+xkWHc9TpHWRZPm0myy
	zVJwVE36OkGbcxJBWwsTkYs6nh/CNq2HWUC4e8kkZolzQe24uN+Hx2i6e+1J4WP+3qWAupf98INNN
	dMXppCs4n4uuPOuXRvHHyyr3hkwNmbBj4b63cuv604lli9NiasXQ3uVpkP+VR4RW3aKR5knFttg/O
	OnOX7Y8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdk9-0000000DBXM-2FTq;
	Thu, 29 Feb 2024 10:34:25 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdk1-0000000DBUc-1ahj
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Feb 2024 10:34:21 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d28464c554so8237081fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Feb 2024 02:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709202855; x=1709807655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWZLhJtXrXREGkrkVHASBqM4/svUa094tHpDRDPD6v0=;
        b=fViiKI+mA7pfhvqrr+LlKfNIZxYzdOYG7a+F37l3X2QJ9c5fSumvVXcB5S6UpXB53w
         VjLIxa5ybL19sYhXKSWAsP3EpDmNRFianI66zMRRoQLJQZQFxq/qvP8Tbwrpl6uoxciT
         iKh74z3GfTXT9PSFUP0nfdWjkdONroJkZIzeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709202855; x=1709807655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWZLhJtXrXREGkrkVHASBqM4/svUa094tHpDRDPD6v0=;
        b=P18HGr/8DABI5PS+fRTKkVt+9mIl/2AQ9T8bo3fWQWrUezcdvBszwiE+5Yp5rasNbB
         laRe0Bq04mlouYj0l61Mm/QysPh5pkQYlsUldeKMioZdMJY5qYxiggtgsz+NJXTkrfrz
         lAfSEEAAUsCwAbVqXKBDxwOqOmfjt4juEKfz6Z6K/f+3fUozWKgmlH6ymMT8T+/04TvI
         kbycwt+lEQvn+RNXocbBQnal6XU73PGcDEO/rdXO8v6nP0npgcdEwlrWVzi92ayEIwsS
         mM8IdIl3BmbAltCH73f6WFOWZahvhxVXcpaHHmiNj1Oh16WmVYzBH0NQ8F+TrsiS2b6B
         EO/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEyCG3mzMs3RJJoe1zSSUE1K3pt5UHJInhiX5EUg/tsvy10ABIlQGefCD+SLWlPpAiOSmUwQPhk5pkNDPqtXIHc0YYLZz3NkSzTe/VJMF8ADTA
X-Gm-Message-State: AOJu0YzwhCKrw8YH72pZxZl9FRFZ4rgnCgXB8cajBGdYi6hYT/j/t/y5
	eYIew8LlDAhVWH+0++0rBZrQ5Q/6bg/yhWET62y3u9pNbMoL5DHjYS6YolVrsf9eTbO8dET3HK0
	QdbVitTUCwRkjGm8s+XkAKz3aamvM/qibxh2v
X-Google-Smtp-Source: AGHT+IELVLBuIjaHjgQS6YTzenmUUL0wJhr5x7w//aBk4NGvQfMzL/tLB7zOQ0ThYx2rN5H+hKvedRKUhGpFkSxdgmI=
X-Received: by 2002:a2e:9490:0:b0:2d2:5129:4ffd with SMTP id
 c16-20020a2e9490000000b002d251294ffdmr1046646ljh.53.1709202854811; Thu, 29
 Feb 2024 02:34:14 -0800 (PST)
MIME-Version: 1.0
References: <20240108081834.408403-1-treapking@chromium.org>
 <CAGXv+5EnBt+7WrNb-QyziEaCihvjhFVf2tpzk=XyAoeELqucaw@mail.gmail.com>
 <e0e6febf-1045-49f8-a200-8bc095b0fa50@collabora.com> <CAGXv+5F5YFRKjaXu_XbXrUhqKL0NSRyt6tniQYfhRh+fsaxqmg@mail.gmail.com>
 <cc74422d-962f-4da5-867b-158a71db1a7b@collabora.com>
In-Reply-To: <cc74422d-962f-4da5-867b-158a71db1a7b@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Feb 2024 18:34:03 +0800
Message-ID: <CAGXv+5EyRROsh_=J1Fg4K+ZgfkERF4dh4R6WoGw9MnTBMNUCgQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_023418_052579_75432750 
X-CRM114-Status: GOOD (  56.98  )
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

On Thu, Feb 29, 2024 at 5:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/02/24 08:17, Chen-Yu Tsai ha scritto:
> > On Mon, Feb 26, 2024 at 7:16=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 23/02/24 05:27, Chen-Yu Tsai ha scritto:
> >>> On Mon, Jan 8, 2024 at 4:18=E2=80=AFPM Pin-yen Lin <treapking@chromiu=
m.org> wrote:
> >>>>
> >>>> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
> >>>> this clock controller needs runtime PM for its operations.
> >>>> Also do a runtime PM get on the clock controller during the
> >>>> probing stage to workaround a possible deadlock.
> >>>>
> >>>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >>>
> >>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>
> >>> The patch itself looks fine.
> >>>
> >>> Besides the MT8183 MFG clock issues, we do actually need this for the
> >>> MT8192 ADSP clock. Its power domain is not enabled by default.
> >>>
> >>
> >> ...but on MT8195 the ADSP clock works - because the ADSP node exists.
> >
> > That's an indirect dependency that should not be relied on. Say the clo=
ck
> > driver probed but the ADSP hasn't, and you try to read out the current
> > status. What would happen?
> >
> > - Read out works fine, because the power domain is default on, and hasn=
't
> >    been turned off by late cleanup
> > - Read out is bogus (but you can't tell)
> > - Read out hangs.
> >
> > The third is what happens on MT8192. There's still some issues on that
> > front, as even after I applied the ADSP power domain patches from Media=
Tek,
> > the readout was still hanging.
> >
>
> That MT8192 lockup story is getting crazy in my head... anyway, besides t=
hat,
> I get the point - I was somehow ignoring the fact that kernel modules do =
exist.
>
> Eh, sorry about that :-)
>
> >> This poses a question: should we make clock controllers depend on powe=
r domains,
> >> or should we keep everything powered off (hence clocks down - no power=
 consumption)
> >> *unless* the user exists?
> >
> > That's a policy discussion separate from actual hardware dependencies.
> > *If* the clock controller needs the power domain to be active for the
> > registers to be accessed, the clock controller *must* have a direct
> > dependency on the power domain.
> >
>
> I admit I should've worded that better.
>
> "should we make clock controllers depend on power domains" was actually i=
mplying
> "IF those need one" :-)
>
> I really wonder if - at this point - it's simply a better idea to not res=
trict
> the call to devm_pm_runtime_enable/resume_and_get to `need_runtime_pm =3D=
=3D true`.
>
> Do we really need to exclude that on other clock controllers that don't h=
ave
> any power domain dependency? Any side effect?
>
> Saying this because if we can avoid yet another per-SoC flag I'm really h=
appy,
> as readability is also impacted and besides - if we ever find out that on=
e of
> those need a power domain in the future, we'll need just one commit and j=
ust
> only in the devicetree, instead of enabling a flag in driver X as well as=
 that,
> avoiding some (potentially unnecessary) noise... I guess.
>
> P.S.: I just noticed that the return value for the devm_pm_runtime_enable=
() call
>        is not being checked!
>
> .......
>
> In short....
>
> Chen-Yu, at this point, do you have any reason why we wouldn't be able an=
d/or it
> wouldn't be a good idea to just avoid adding the `need_runtime_pm` flag (=
meaning
> that we perform pm_runtime calls for all clock drivers unconditionally)?
>
> If this is about longer boot time, I don't think that it's going to be mo=
re than
> a millisecond or two, so that should be completely ignorable.

I think it's just more of a "don't enable features you don't need" thing.
We already ran into a weird deadlock, which is why the devm_pm_runtime_enab=
le()
call has that comment.

I don't think anyone has actually looked at it. As you said it shouldn't be
much, at least during boot time. It's one call per clock controller.

> Can you please do a test for that, or should I?

The earliest I can work on it would be some time next week. Does that work
for you?

ChenYu

> Cheers
> Angelo
>
> >> For the second one, this means that the *device* gets the power domain=
 (adsp), and
> >> not the clock controller (which clocks are effectively useless if ther=
e's no user).
> >
> > No. See my previous paragraph.
> >
> > ChenYu
> >
> >> Angelo
> >>
> >>>> ---
> >>>>
> >>>> Changes in v3:
> >>>> - Update the commit message and the comments before runtime PM call
> >>>>
> >>>> Changes in v2:
> >>>> - Fix the order of error handling
> >>>> - Update the commit message and add a comment before the runtime PM =
call
> >>>>
> >>>>    drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
> >>>>    drivers/clk/mediatek/clk-mtk.h |  2 ++
> >>>>    2 files changed, 21 insertions(+)
> >>>>
> >>>> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/c=
lk-mtk.c
> >>>> index 2e55368dc4d8..ba1d1c495bc2 100644
> >>>> --- a/drivers/clk/mediatek/clk-mtk.c
> >>>> +++ b/drivers/clk/mediatek/clk-mtk.c
> >>>> @@ -13,6 +13,7 @@
> >>>>    #include <linux/of.h>
> >>>>    #include <linux/of_address.h>
> >>>>    #include <linux/platform_device.h>
> >>>> +#include <linux/pm_runtime.h>
> >>>>    #include <linux/slab.h>
> >>>>
> >>>>    #include "clk-mtk.h"
> >>>> @@ -494,6 +495,18 @@ static int __mtk_clk_simple_probe(struct platfo=
rm_device *pdev,
> >>>>                           return IS_ERR(base) ? PTR_ERR(base) : -ENO=
MEM;
> >>>>           }
> >>>>
> >>>> +
> >>>> +       if (mcd->need_runtime_pm) {
> >>>> +               devm_pm_runtime_enable(&pdev->dev);
> >>>> +               /*
> >>>> +                * Do a pm_runtime_resume_and_get() to workaround a =
possible
> >>>> +                * deadlock between clk_register() and the genpd fra=
mework.
> >>>> +                */
> >>>> +               r =3D pm_runtime_resume_and_get(&pdev->dev);
> >>>> +               if (r)
> >>>> +                       return r;
> >>>> +       }
> >>>> +
> >>>>           /* Calculate how many clk_hw_onecell_data entries to alloc=
ate */
> >>>>           num_clks =3D mcd->num_clks + mcd->num_composite_clks;
> >>>>           num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clks;
> >>>> @@ -574,6 +587,9 @@ static int __mtk_clk_simple_probe(struct platfor=
m_device *pdev,
> >>>>                           goto unregister_clks;
> >>>>           }
> >>>>
> >>>> +       if (mcd->need_runtime_pm)
> >>>> +               pm_runtime_put(&pdev->dev);
> >>>> +
> >>>>           return r;
> >>>>
> >>>>    unregister_clks:
> >>>> @@ -604,6 +620,9 @@ static int __mtk_clk_simple_probe(struct platfor=
m_device *pdev,
> >>>>    free_base:
> >>>>           if (mcd->shared_io && base)
> >>>>                   iounmap(base);
> >>>> +
> >>>> +       if (mcd->need_runtime_pm)
> >>>> +               pm_runtime_put(&pdev->dev);
> >>>>           return r;
> >>>>    }
> >>>>
> >>>> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/c=
lk-mtk.h
> >>>> index 22096501a60a..c17fe1c2d732 100644
> >>>> --- a/drivers/clk/mediatek/clk-mtk.h
> >>>> +++ b/drivers/clk/mediatek/clk-mtk.h
> >>>> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
> >>>>
> >>>>           int (*clk_notifier_func)(struct device *dev, struct clk *c=
lk);
> >>>>           unsigned int mfg_clk_idx;
> >>>> +
> >>>> +       bool need_runtime_pm;
> >>>>    };
> >>>>
> >>>>    int mtk_clk_pdev_probe(struct platform_device *pdev);
> >>>> --
> >>>> 2.43.0.472.g3155946c3a-goog
> >>>>
> >>
> >>
> >>
>
>
>

