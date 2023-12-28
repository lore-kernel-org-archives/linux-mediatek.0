Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEA2C46CD2
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 01:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abPHoTgkKdKqNv7pVii73M9V/jiTguCmzH4R/B50i7k=; b=aQksX1/62drBGdFm+psDnaFd4k
	fXuI/eGwBNjNA8NRsf8axc4m7I1+Bi7MbIAhjBUxTGmADY7i9gAYpwT3R2tO/fOT7zZDT2YEPYH7/
	b7zY1NTtaE1CUGzcGGAqRPxGwmls9sIZYfAKz1Gvtp9WoNgdNEVHFNgcusNDdYVZNCRjojK5thh5J
	qzMs5ZAWHmZ/twBV9tlLrxTP1bESTwhSfZuLwo/fehnbQR+yDsl4ci4vAAAFTLPhpxFQ9PF120+aY
	DhJgA7+soblAvg0UX3Gyn92najOrRhcXKTDyoF5LS3g6CRzlwP2CIIkt8jjV3fDH/M724nnjwl0TW
	MkvvTKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfTH-00FuFB-31;
	Thu, 28 Dec 2023 01:46:03 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfTC-00FuBD-1K
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Dec 2023 01:46:02 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ccbc328744so30571171fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Dec 2023 17:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703727955; x=1704332755; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abPHoTgkKdKqNv7pVii73M9V/jiTguCmzH4R/B50i7k=;
        b=fVJGagZyBUnBKJdF0Y76JTjau+eoubSoyCO2nh8dknGdvsYNt3e8P0o/5f0zhS7zYP
         nZuj3IBFuizro9oH0ZHNHH7A5fkDueW8IAJ6M7FDMTCsJEVAgX0mdrXbbyfvZFe4Z58h
         2SUXPePymK3DJy5l4sS41r5BZBzI+pkAsmotc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727955; x=1704332755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abPHoTgkKdKqNv7pVii73M9V/jiTguCmzH4R/B50i7k=;
        b=P1e3VJqEFifRTnPPuxyRdHuKoBJGgM8C3czeKFMxMZcCrULZac2LvGtFX0UlTs3BO4
         c8UPF/UWykezz+MTHArvSFIRiGZYt++eMFA2u6TWlIx84xk5MN/vewIBkhimzIi0pdzd
         IqudM8Om6KKIkdKWxG5LLlaVDDQllTPehZnUBJfak3R/1zAb/yE3IY+Yw2LHJOyRVjPC
         Cbm4qVSCdvzacbZIdxkK9O+oDL2qUz0fp2fCFdkW8Ojcq20gBCOkvvtiVCrtPW5SVOzA
         tpDW5isIQCKgK/j2Y4cb7uM+Z5HiQlvqMCVm7MG7VBugF1u7ILEvl+LXfkwANNqIrdsZ
         7oDg==
X-Gm-Message-State: AOJu0Yz0L3UtRev5d7k7yHcG20rUtdZwMTn+l7doFxRVLaVsHO1TwKze
	4Mt08jEonIuoZCfw0Nll58s3pCqG0e5eALSiWzViMBdlrqv5
X-Google-Smtp-Source: AGHT+IFyQEVrdKaoeisrsf6Cy6K+2KeyCzfsqubA3HFnZaUvyDBGCdUMwxp3ymD+S4mf0mWRWa1471JPFZh8SGIkSiM=
X-Received: by 2002:a2e:460a:0:b0:2cc:7445:bbc2 with SMTP id
 t10-20020a2e460a000000b002cc7445bbc2mr3496636lja.32.1703727955400; Wed, 27
 Dec 2023 17:45:55 -0800 (PST)
MIME-Version: 1.0
References: <20231227090448.2216295-1-treapking@chromium.org>
In-Reply-To: <20231227090448.2216295-1-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 Dec 2023 10:45:44 +0900
Message-ID: <CAGXv+5E-vn4pCCJr-Qs4tcbMAyGBWk4YQEzm=fkHjE0U9nBpiA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
To: Pin-yen Lin <treapking@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174558_483463_651A3871 
X-CRM114-Status: GOOD (  21.58  )
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

On Wed, Dec 27, 2023 at 6:05=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate this
> clock needs a runtime PM get during the probing stage.

Actually it means (based on our discussions and your code here) that
runtime PM should be enabled for the clock controller. If runtime PM
is not enabled before the clocks are registered, the CCF subsequently
never toggles runtime PM.

The runtime PM get during the probe stage is to avoid triggering runtime
suspend/resume during each clock registration, and hopefully avoid a
deadlock. It should be mentioned separately. A comment should be added
so that folks going over the code in the future don't remove it.

> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  2 files changed, 17 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index 2e55368dc4d8..c31e535909c8 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -13,6 +13,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>
>  #include "clk-mtk.h"
> @@ -494,6 +495,14 @@ static int __mtk_clk_simple_probe(struct platform_de=
vice *pdev,
>                         return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
>         }
>
> +
> +       if (mcd->need_runtime_pm) {
> +               devm_pm_runtime_enable(&pdev->dev);
> +               r =3D pm_runtime_resume_and_get(&pdev->dev);

A comment for the resume and get should be added. Otherwise someone looking
at this and the CCF could think that this isn't needed, since the CCF alrea=
dy
has similar calls.

> +               if (r)
> +                       return r;
> +       }
> +
>         /* Calculate how many clk_hw_onecell_data entries to allocate */
>         num_clks =3D mcd->num_clks + mcd->num_composite_clks;
>         num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clks;
> @@ -574,6 +583,9 @@ static int __mtk_clk_simple_probe(struct platform_dev=
ice *pdev,
>                         goto unregister_clks;
>         }
>
> +       if (mcd->need_runtime_pm)
> +               pm_runtime_put(&pdev->dev);
> +
>         return r;
>
>  unregister_clks:
> @@ -604,6 +616,9 @@ static int __mtk_clk_simple_probe(struct platform_dev=
ice *pdev,
>  free_base:
>         if (mcd->shared_io && base)
>                 iounmap(base);
> +
> +       if (mcd->need_runtime_pm)
> +               pm_runtime_put(&pdev->dev);

Please keep the error path calls strictly in reverse order of the setup
calls. So this should go before iounmap().

ChenYu

>         return r;
>  }

> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index 22096501a60a..c17fe1c2d732 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
>
>         int (*clk_notifier_func)(struct device *dev, struct clk *clk);
>         unsigned int mfg_clk_idx;
> +
> +       bool need_runtime_pm;
>  };
>
>  int mtk_clk_pdev_probe(struct platform_device *pdev);
> --
> 2.43.0.472.g3155946c3a-goog
>

