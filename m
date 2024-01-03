Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CB7C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qp6FcFL6ukPLR5E+VXKBAlytc1GJbe7ZjRNXKkg7yJE=; b=w0l7TCA8YAaxlfPAeB0xynaW34
	PLe12eJFwoS5bPakTtesvxfWLwEehfhdq8uH/Xo673Ju+sPYOoITBl9iZ7qL5oy/xJ33h6nCNX7B+
	GRiEOBn2TC8Mk4swYymt5DdwheNcgYV+o5adPkDyj6bUPUEp9dXM6bKt3q7e1OKDMe/SA+kakzr12
	BTLNqktqamZGjnp2zkJRkPdCjXeUXVrEmMC97LUUSfFpI4mdJmp+ZIicLfw2EC/WaUZpC/b1zH3Cq
	lXKQ/7DOApxbZRKxqqQoO74kg3IfYv0+2tshMtWOP/9SYXyf9dbsFEFooyb34lOa5SXQ0U84LY/BZ
	zJtdQ4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKvwT-00A0Wk-2y;
	Wed, 03 Jan 2024 07:45:33 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKvwR-00A0VX-0h
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jan 2024 07:45:32 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50e80d14404so170628e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jan 2024 23:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704267928; x=1704872728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qp6FcFL6ukPLR5E+VXKBAlytc1GJbe7ZjRNXKkg7yJE=;
        b=ScYMEkj1sOeIgHZvqEh0GoBbUQ+OCbeYAsYFAWKvWTZsrihuFg2IMSLcdtuEKDMB2c
         /vUZAk6GvoeBv0t726EOPmnWFL2GJpU27hN8kEdCe4MOJOVdgG7rAxVBMXDiOytSuTn1
         bONYmniRg3C0Bhony4ZvpSqiMRiInj0Wi6uHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704267928; x=1704872728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qp6FcFL6ukPLR5E+VXKBAlytc1GJbe7ZjRNXKkg7yJE=;
        b=i5LXEoFI+otN69AYoe9L+tlX58caflzWaiH/uL7VPm8CUFbnGQJXR+peENItQEiHlK
         GGwlPq+6ZV0TP4dRAJI65wj1WVhIJLHFC116NddJ5h9H7kSMyYNN6p5bYVtvqO0OMcbJ
         HO++p1WX/0PfEPMHGteLL7/WL0HoVa4x4ZZromtWVqsmsBmu9a9UHyZv0PqeTQGblPso
         MX2qpzn3vw7EeZYV8byA80zTtCOPwYtbTxQ9grBpqliE5LVSQiBOOB+AQyPrDQ7n8WCR
         eT8j5nVaD8K1GMXIqXHAIvmM/sf2R6zNC2Lki84n1KRBk6L5rR46kWfwBKMhIebhQLTL
         mAtw==
X-Gm-Message-State: AOJu0Yyx0T1JavwWbQTZ3Or2VObOx7reKWDgb6o1xNOIW7o3zMcmd9DU
	pR2UTo0kAXGSVJ+ylPxrTrCdA+wEDWEIMTRWiPUlCUIgQXWe
X-Google-Smtp-Source: AGHT+IFyXu8My+izeEzyJdZ8sEntbdgwFjGfLGe2KKcFBr1ZqJrFAIQn6XWRmJwJINhZghJGH2+U4BezZsczM7OOQkw=
X-Received: by 2002:a2e:a487:0:b0:2cd:19ba:36f0 with SMTP id
 h7-20020a2ea487000000b002cd19ba36f0mr130664lji.17.1704267928052; Tue, 02 Jan
 2024 23:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20240102081402.1226795-1-treapking@chromium.org>
In-Reply-To: <20240102081402.1226795-1-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 3 Jan 2024 15:45:17 +0800
Message-ID: <CAGXv+5F1AjQYf0qVd5PwZobkvHLCczX_KcGEebNP5JvJCHb9rw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
To: Pin-yen Lin <treapking@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_234531_255240_D44E9EBB 
X-CRM114-Status: GOOD (  22.47  )
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

On Tue, Jan 2, 2024 at 4:14=E2=80=AFPM Pin-yen Lin <treapking@chromium.org>=
 wrote:
>
> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
> this clock needs a runtime PM get on the clock controller during the
> probing stage.

No. The flag indicates that the clock controller needs runtime PM
for its operation, likely because it needs some power domain enabled.

The runtime PM get during the probe phase is a workaround to prevent
a deadlock in clk_register.

These are two separate things. The second part also should be documented
in the code with a comment, i.e. a comment should be placed before
pm_runtime_resume_and_get().

ChenYu

> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
> Changes in v2:
> - Fix the order of error handling
> - Update the commit message and add a comment before the runtime PM call
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
>         return r;
>  }
>
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

