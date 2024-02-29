Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56EEC54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 07:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vsIc33sKeduHZUUC8l8uIRDY5GIY+lHtM3gIzAb8YQ=; b=V+d67hL7jHl/1eMCnXzd+yVuL7
	JT4HRQkSeosSO3R+NF6VzZ2tb/6T3ffU9YO4Ax/+JWW9hKvNFTYEPiBJPM5gYGY+FdMm21jYDG0MO
	V8YVysPwwruweuGj62XYsApPEcHh+9kznlxNj5FAyxU5IIRrDuf5a4jgrzwF7/bWvWXxYKREmmv/5
	hJtM1FumxWze7SmSA1pHV6NnyxE0D9i+ZJXMvh/uiXsK3RhhCTGxq+j13FQdJQ5XNcVym40xCE3st
	bCHvKy0aZslDiU6rBeixKIVtYkeXZ2BSVSeM9+f+4IgiTVsWUu2d/Cz5EeD1eDMRSZ+Z5kudl+Sul
	crDjtECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfafv-0000000CR40-1PG2;
	Thu, 29 Feb 2024 07:17:51 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfafr-0000000CR3C-2Muo
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Feb 2024 07:17:48 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so5820111fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Feb 2024 23:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709191065; x=1709795865; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vsIc33sKeduHZUUC8l8uIRDY5GIY+lHtM3gIzAb8YQ=;
        b=RUHFOPxAWSxqHNM9O5hv3Tgxmc76fqF3RaFPVJculdSWtcJlTzF0sbbC1stqpd/5z6
         qPx8VIdMyKG6a4IGwH0SskEjKBDy1EwcOYH4BLrC0urOiDlX35y5OzcxyNwyC2PTIfoN
         ZTZPAwbElaKRApWnnCdCXH1qefNe/ra9rumDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709191065; x=1709795865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vsIc33sKeduHZUUC8l8uIRDY5GIY+lHtM3gIzAb8YQ=;
        b=C5HDO53c0ylCtiUSdLBVaQ7UmG+5zAcQt7WuBCd4scQsKxRMOnpo7pzSisX5Z9vcvI
         Pnjn5FT0r3bJz521jmo6jx/oz36c2bfIohDYVCe4UzK7mEmu4LEdenOSiRRmbMENLkyZ
         X7ngY1tteyl1sD6Ww4inwnjxpLx92+QUSFwwq7Nh276sRmayZm5dt2ZOEhxaYEV2zjeR
         sujd2owF0Jx9itcDlWiExP7lVJlPKH5kU0eVr6KSI26Qr+/bUQsn1Bv/sLzBzgKCO125
         /DkJ7I1iM18qVYM8WccbA3E3FhwUQAUzVzliwT7Adg2yry7I5u+Goz3wd3zvxMrI/mPC
         Wtrg==
X-Forwarded-Encrypted: i=1; AJvYcCVpaii395XiaWe/XkCILSlMYAGd5V0c7MbnfkzT2qaqc/cu2ejd8NgtMrT4HmVJb2udll8PsIlJtEq39uCSzeMXllxCV6qNt+x7iie1xx59sGb7
X-Gm-Message-State: AOJu0YxSaM0YAjY+ZM6niVE2wLVH3ggkaTzdV6DzeBoE0Xp1gmk85SNm
	iXeQFhffyECSzqI5N+bM0XBEtcw5CSvGfAaVUgXG3k1/WXspolXkzu7CLvAqejjjT4oI+LkuYYg
	o/DqH/f8LEUDSyE0J3bIgl5dmLOP4LHYIP3fm
X-Google-Smtp-Source: AGHT+IFGnhfqo9wpMLbUOWT9xaaCwa78RftbvQ4WT4QBDMgmaFEdTyD2WRaCG81GIICXSZk9azfqp0otmo8BfGfqq8w=
X-Received: by 2002:a2e:98c6:0:b0:2d2:3b9e:dcff with SMTP id
 s6-20020a2e98c6000000b002d23b9edcffmr691931ljj.46.1709191065361; Wed, 28 Feb
 2024 23:17:45 -0800 (PST)
MIME-Version: 1.0
References: <20240108081834.408403-1-treapking@chromium.org>
 <CAGXv+5EnBt+7WrNb-QyziEaCihvjhFVf2tpzk=XyAoeELqucaw@mail.gmail.com> <e0e6febf-1045-49f8-a200-8bc095b0fa50@collabora.com>
In-Reply-To: <e0e6febf-1045-49f8-a200-8bc095b0fa50@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Feb 2024 15:17:34 +0800
Message-ID: <CAGXv+5F5YFRKjaXu_XbXrUhqKL0NSRyt6tniQYfhRh+fsaxqmg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240228_231747_658508_6F7ADEFF 
X-CRM114-Status: GOOD (  32.57  )
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

On Mon, Feb 26, 2024 at 7:16=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 23/02/24 05:27, Chen-Yu Tsai ha scritto:
> > On Mon, Jan 8, 2024 at 4:18=E2=80=AFPM Pin-yen Lin <treapking@chromium.=
org> wrote:
> >>
> >> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
> >> this clock controller needs runtime PM for its operations.
> >> Also do a runtime PM get on the clock controller during the
> >> probing stage to workaround a possible deadlock.
> >>
> >> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > The patch itself looks fine.
> >
> > Besides the MT8183 MFG clock issues, we do actually need this for the
> > MT8192 ADSP clock. Its power domain is not enabled by default.
> >
>
> ...but on MT8195 the ADSP clock works - because the ADSP node exists.

That's an indirect dependency that should not be relied on. Say the clock
driver probed but the ADSP hasn't, and you try to read out the current
status. What would happen?

- Read out works fine, because the power domain is default on, and hasn't
  been turned off by late cleanup
- Read out is bogus (but you can't tell)
- Read out hangs.

The third is what happens on MT8192. There's still some issues on that
front, as even after I applied the ADSP power domain patches from MediaTek,
the readout was still hanging.

> This poses a question: should we make clock controllers depend on power d=
omains,
> or should we keep everything powered off (hence clocks down - no power co=
nsumption)
> *unless* the user exists?

That's a policy discussion separate from actual hardware dependencies.
*If* the clock controller needs the power domain to be active for the
registers to be accessed, the clock controller *must* have a direct
dependency on the power domain.

> For the second one, this means that the *device* gets the power domain (a=
dsp), and
> not the clock controller (which clocks are effectively useless if there's=
 no user).

No. See my previous paragraph.

ChenYu

> Angelo
>
> >> ---
> >>
> >> Changes in v3:
> >> - Update the commit message and the comments before runtime PM call
> >>
> >> Changes in v2:
> >> - Fix the order of error handling
> >> - Update the commit message and add a comment before the runtime PM ca=
ll
> >>
> >>   drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
> >>   drivers/clk/mediatek/clk-mtk.h |  2 ++
> >>   2 files changed, 21 insertions(+)
> >>
> >> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk=
-mtk.c
> >> index 2e55368dc4d8..ba1d1c495bc2 100644
> >> --- a/drivers/clk/mediatek/clk-mtk.c
> >> +++ b/drivers/clk/mediatek/clk-mtk.c
> >> @@ -13,6 +13,7 @@
> >>   #include <linux/of.h>
> >>   #include <linux/of_address.h>
> >>   #include <linux/platform_device.h>
> >> +#include <linux/pm_runtime.h>
> >>   #include <linux/slab.h>
> >>
> >>   #include "clk-mtk.h"
> >> @@ -494,6 +495,18 @@ static int __mtk_clk_simple_probe(struct platform=
_device *pdev,
> >>                          return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM=
;
> >>          }
> >>
> >> +
> >> +       if (mcd->need_runtime_pm) {
> >> +               devm_pm_runtime_enable(&pdev->dev);
> >> +               /*
> >> +                * Do a pm_runtime_resume_and_get() to workaround a po=
ssible
> >> +                * deadlock between clk_register() and the genpd frame=
work.
> >> +                */
> >> +               r =3D pm_runtime_resume_and_get(&pdev->dev);
> >> +               if (r)
> >> +                       return r;
> >> +       }
> >> +
> >>          /* Calculate how many clk_hw_onecell_data entries to allocate=
 */
> >>          num_clks =3D mcd->num_clks + mcd->num_composite_clks;
> >>          num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clks;
> >> @@ -574,6 +587,9 @@ static int __mtk_clk_simple_probe(struct platform_=
device *pdev,
> >>                          goto unregister_clks;
> >>          }
> >>
> >> +       if (mcd->need_runtime_pm)
> >> +               pm_runtime_put(&pdev->dev);
> >> +
> >>          return r;
> >>
> >>   unregister_clks:
> >> @@ -604,6 +620,9 @@ static int __mtk_clk_simple_probe(struct platform_=
device *pdev,
> >>   free_base:
> >>          if (mcd->shared_io && base)
> >>                  iounmap(base);
> >> +
> >> +       if (mcd->need_runtime_pm)
> >> +               pm_runtime_put(&pdev->dev);
> >>          return r;
> >>   }
> >>
> >> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk=
-mtk.h
> >> index 22096501a60a..c17fe1c2d732 100644
> >> --- a/drivers/clk/mediatek/clk-mtk.h
> >> +++ b/drivers/clk/mediatek/clk-mtk.h
> >> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
> >>
> >>          int (*clk_notifier_func)(struct device *dev, struct clk *clk)=
;
> >>          unsigned int mfg_clk_idx;
> >> +
> >> +       bool need_runtime_pm;
> >>   };
> >>
> >>   int mtk_clk_pdev_probe(struct platform_device *pdev);
> >> --
> >> 2.43.0.472.g3155946c3a-goog
> >>
>
>
>

