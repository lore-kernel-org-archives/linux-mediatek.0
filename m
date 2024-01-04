Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACA4C47074
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=or1h/yMnjb6tVAyJBd6HlW28SfRdcpAwUGvNMzv3A58=; b=D8BbueDvpaLAmWyjyur7pEnxkQ
	Hqs7Fw5SQ/3DB+lkTnfx9Qp4v4/qvclUhn71BWnpMToNLfJOMqr73haa6gVhrAwJvAAyaGV767R3n
	ubZafvokC0Y1JhfLeBOCNHDetGRVnKuErh9TlHsnly0VlnPbUwvOt93Q21LE8IYdJm5Nmyw2QxWnI
	mkpp1+Xr6fQJ29qhkizdVLp9Z6sg64jRuwg3E7MrhiF7maREXPaGleoiok75PcBVrwUD8CwydHsbP
	2OwsyR7q4bJK3+R9uvHSo7x3ibmqbwIoOIJYUIVT4DKxAWz5FFw9e80AT+Cy/AtSlzrvb+540+hrb
	np8uuBMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLP4Y-00EOm5-1G;
	Thu, 04 Jan 2024 14:51:50 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLP4V-00EOlQ-02
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jan 2024 14:51:48 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-35fea35c432so2504525ab.0
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Jan 2024 06:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704379904; x=1704984704; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=or1h/yMnjb6tVAyJBd6HlW28SfRdcpAwUGvNMzv3A58=;
        b=DJs8fwLP7RKa5+pHr7JfyGIq+Y0nX/Li+/HZarRA70jFpiwAvuDi6zZp84rB1edf1a
         goqd9OJa+kwrqHozahM5PbFxQthDm1Zutap595obv1cd64gdKBxqgxmN8wdFuetabUSD
         qYt4df7Etoe1u2jFoyi41EZSGG3RLkknmYsF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704379904; x=1704984704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=or1h/yMnjb6tVAyJBd6HlW28SfRdcpAwUGvNMzv3A58=;
        b=in0v55mZKmdIFdVZNx+zVbgG6kI7a1kyZpA3f0E1+IOUSSEDQyGL2F+VXAXVyA0jXc
         xW3Ygsm5VFkgqv1Uz3B9DXN68SUof52uJbJ7OZR497ae63BFMXYW1Jx4fwd4m8JjdwI5
         vpSh2YDH1+kQfrYN2tUJNBBJ2PbGokh7FpCUZ3NuQzsntoIXoRCR7G+6AzLQCMRc1u7P
         Sm0i/Ic77GTcAcixwVOr2Zi6SkS4p4h/sWYf4FFkYeaJ17eoGV3xQKEkJhkCr96WGDhn
         jr8niS6B6W7YozgMZ6QuexH8wdX4rkyDVSJ16nxiF5micBIR/aQ3aszkzsWHeWI5utTX
         hTWA==
X-Gm-Message-State: AOJu0YwKhiv6j53zyM4zK+IfEbUpsBR0Uswp9OBFJd9kZNgh5r72fLQI
	DTbL05xHDYpRsJycALpMciIizQQEf5/gJg6x7/bC/OH+COcDu7dIP3ZuVm8=
X-Google-Smtp-Source: AGHT+IEYU2DLzWSUIVJNOwHaKCi+sergeBd9wsnJzrR/LxrNBZKPhWi9MLRYEkvnXrh64TiDxyY+/OhPCjGRQQYclA8=
X-Received: by 2002:a05:6e02:1689:b0:35d:58ce:2322 with SMTP id
 f9-20020a056e02168900b0035d58ce2322mr876045ila.5.1704379904640; Thu, 04 Jan
 2024 06:51:44 -0800 (PST)
MIME-Version: 1.0
References: <20240102081402.1226795-1-treapking@chromium.org>
 <eed88b36-ae56-40d3-8588-0d5d75da71a6@collabora.com> <5520e8e3-c75b-480f-b831-c40b5cca029f@collabora.com>
In-Reply-To: <5520e8e3-c75b-480f-b831-c40b5cca029f@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 4 Jan 2024 22:51:33 +0800
Message-ID: <CAEXTbpeqRsWNgZE3ZgcFKogxv-tjAmQT=D6o6X4ViuG5ZZFCHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
To: Eugen Hristev <eugen.hristev@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_065147_079660_A0886512 
X-CRM114-Status: GOOD (  33.90  )
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

Hi Eugen and Angelo,

Unfortunately, I don't have a way to reliably reproduce this either.

We notice this issue from the automatic crash reports sent from the
users, but we are still not able to reproduce this locally.  So our
plan is to ship this patch to the users and see if the crash rate goes
down after a month or so.

Regards,
Pin-yen

On Wed, Jan 3, 2024 at 9:20=E2=80=AFPM Eugen Hristev
<eugen.hristev@collabora.com> wrote:
>
> On 1/3/24 14:19, AngeloGioacchino Del Regno wrote:
> > Il 02/01/24 09:12, Pin-yen Lin ha scritto:
> >> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
> >> this clock needs a runtime PM get on the clock controller during the
> >> probing stage.
> >>
> >> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > Hello Pin-yen,
> >
> > We have experienced something similar, but it was really hard to reprod=
uce after
> > some changes.
> >
> > In an effort to try to solve this issue (but again, reproducing is real=
ly hard),
> > Eugen has sent a commit in the hope that someone else found a way to ea=
sily
> > reproduce. Please look at [1].
> >
> > I'm also adding Eugen to the Cc's of this email.
> >
> > Cheers,
> > Angelo
> >
> > [1]:
> > https://patchwork.kernel.org/project/linux-pm/patch/20231225133615.7899=
3-1-eugen.hristev@collabora.com/
>
> Hello Pin-yen,
>
> Can you try my patch and let me know if this changes anything for you ?
>
> If it does not change anything, can you also try this one as well ? It's =
another
> attempt to fix the synchronization with genpd.
>
> https://lore.kernel.org/linux-arm-kernel/20231129113120.4907-1-eugen.hris=
tev@collabora.com/
>
> Thanks,
> Eugen
>
> >
> >> ---
> >>
> >> Changes in v2:
> >> - Fix the order of error handling
> >> - Update the commit message and add a comment before the runtime PM ca=
ll
> >>
> >>   drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
> >>   drivers/clk/mediatek/clk-mtk.h |  2 ++
> >>   2 files changed, 17 insertions(+)
> >>
> >> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk=
-mtk.c
> >> index 2e55368dc4d8..c31e535909c8 100644
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
> >> @@ -494,6 +495,14 @@ static int __mtk_clk_simple_probe(struct platform=
_device *pdev,
> >>                      return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
> >>      }
> >>
> >> +
> >> +    if (mcd->need_runtime_pm) {
> >> +            devm_pm_runtime_enable(&pdev->dev);
> >> +            r =3D pm_runtime_resume_and_get(&pdev->dev);
> >> +            if (r)
> >> +                    return r;
> >> +    }
> >> +
> >>      /* Calculate how many clk_hw_onecell_data entries to allocate */
> >>      num_clks =3D mcd->num_clks + mcd->num_composite_clks;
> >>      num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clks;
> >> @@ -574,6 +583,9 @@ static int __mtk_clk_simple_probe(struct platform_=
device *pdev,
> >>                      goto unregister_clks;
> >>      }
> >>
> >> +    if (mcd->need_runtime_pm)
> >> +            pm_runtime_put(&pdev->dev);
> >> +
> >>      return r;
> >>
> >>   unregister_clks:
> >> @@ -604,6 +616,9 @@ static int __mtk_clk_simple_probe(struct platform_=
device *pdev,
> >>   free_base:
> >>      if (mcd->shared_io && base)
> >>              iounmap(base);
> >> +
> >> +    if (mcd->need_runtime_pm)
> >> +            pm_runtime_put(&pdev->dev);
> >>      return r;
> >>   }
> >>
> >> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk=
-mtk.h
> >> index 22096501a60a..c17fe1c2d732 100644
> >> --- a/drivers/clk/mediatek/clk-mtk.h
> >> +++ b/drivers/clk/mediatek/clk-mtk.h
> >> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
> >>
> >>      int (*clk_notifier_func)(struct device *dev, struct clk *clk);
> >>      unsigned int mfg_clk_idx;
> >> +
> >> +    bool need_runtime_pm;
> >>   };
> >>
> >>   int mtk_clk_pdev_probe(struct platform_device *pdev);
> >
> >
> >
> >
>

