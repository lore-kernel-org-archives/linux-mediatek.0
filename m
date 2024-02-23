Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F63CC54798
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 04:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDgHpddbeDRitK+X3PotUxSVopTporXEfeUFX+IG05I=; b=JdsGJR7/Ur3zyIsG7CDF5z5kte
	g0/RKFwiAo6XBGEkV4IVks856K+Oh2UGO5srViHUZOX+tcManNsl+Mis3umkM4GnhNqj6QmTfKF9x
	B/EJ6N0hQUWT3OJWNIDLp11ix+J+WxSt1QCJ6vTBx7VqVVW2bMZaXJUIhhJ8gW3GFF0Jc00icVJLJ
	SLsZn355GT4po44pCUhmqEtfLwR24a/WnlEpGgaqiF549HtG36W1nzH/ARWTMiRAQnu99q7qOJM+A
	J8U48PxETRvZHCzLD/FRJrX+uXw9fm/h7DFWfL1SIdRxDMZdq5grltVDU3gjevkkGDbomhxG2ELy4
	6R1PXPew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNAV-00000007puS-1VxI;
	Fri, 23 Feb 2024 04:28:15 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNA4-00000007pWS-3C7K
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Feb 2024 04:27:50 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-512b29f82d1so761557e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Feb 2024 20:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708662460; x=1709267260; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDgHpddbeDRitK+X3PotUxSVopTporXEfeUFX+IG05I=;
        b=FjKdGUK1LthYMRTBUcCDG8hK6Lnt6FaqNp0UgnuaUBNqwCP87G2Ja6AfZ4Lytoda8e
         XGdAeoycN6R1bf0WyTkKlYFunncBCUzjtLrLsCGuYpVSJAoAjLuoOBMsiW3I0AC33r1b
         mmlORNXY/bIQ2wsKvJOSBYXWAUjKUFZvs6W00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708662460; x=1709267260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDgHpddbeDRitK+X3PotUxSVopTporXEfeUFX+IG05I=;
        b=JXubw1dWYZJJWqJPH2YydtUr0pi020rPY1fOcTd/fsBrPUn87wemlTVTcTZ2Q0IOEo
         WnzVpLkiF7xdKCVECO+ElyDIOPHU27/Md6NJdaEHyZyxw0NjJ7bkXHlZqvqqix5bJZ0d
         MGz9npfGJJUeJF8066wCU77L127X7rZC99mCfy0V96wKCGeec/QqrbxmcRWDpg9i/ckW
         TwkQT8rvazTFstKua7/RE1AsduroaViCiFPdGHGdjyFwtSQMzAcsaiprktLbwWOzT+J7
         9Q3qGf992Jn5an+L9QUC1n+FJ6N8nfs5JIDG/eKoIjQWFZ+XGLFTke9QK+D84IdtqZZ1
         8XSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVahx1fJrz2p74eM8hQVoF0L057SCvC1aEut4scz69aUAQHQUCo1DscF9epMy21H0/sSKWOmNQIXk6Fw3wcJDJu2RVU9p67LrIZERXlGzDvDaNr
X-Gm-Message-State: AOJu0YyvjwYezZUouQt5U2G3ewQE3TAgecAW8QmHburkgCG4axqgvgdy
	sixoD8YfGN8FU9oVQygqAd/XXKbgJGzhVjz4wuT9sdRM7mZg7U4zotSUHcfP1XvKRiGpI28aaSt
	kj1FCRR7oxIqv+X+erQiDPCpKKb4HyqFnTUBa
X-Google-Smtp-Source: AGHT+IG1gpB6olc4CmFRKGnaml07scqjkk6frDritOolB30oK3tyv/MOjQ+fLmmeie41GBXOwScJywtfR3U5/7Iy6Hw=
X-Received: by 2002:ac2:4249:0:b0:512:c1ba:9115 with SMTP id
 m9-20020ac24249000000b00512c1ba9115mr562755lfl.57.1708662460080; Thu, 22 Feb
 2024 20:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20240108081834.408403-1-treapking@chromium.org>
In-Reply-To: <20240108081834.408403-1-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Feb 2024 12:27:28 +0800
Message-ID: <CAGXv+5EnBt+7WrNb-QyziEaCihvjhFVf2tpzk=XyAoeELqucaw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
To: Pin-yen Lin <treapking@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_202748_905120_CC4FCA51 
X-CRM114-Status: GOOD (  22.98  )
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

On Mon, Jan 8, 2024 at 4:18=E2=80=AFPM Pin-yen Lin <treapking@chromium.org>=
 wrote:
>
> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
> this clock controller needs runtime PM for its operations.
> Also do a runtime PM get on the clock controller during the
> probing stage to workaround a possible deadlock.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

The patch itself looks fine.

Besides the MT8183 MFG clock issues, we do actually need this for the
MT8192 ADSP clock. Its power domain is not enabled by default.

> ---
>
> Changes in v3:
> - Update the commit message and the comments before runtime PM call
>
> Changes in v2:
> - Fix the order of error handling
> - Update the commit message and add a comment before the runtime PM call
>
>  drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index 2e55368dc4d8..ba1d1c495bc2 100644
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
> @@ -494,6 +495,18 @@ static int __mtk_clk_simple_probe(struct platform_de=
vice *pdev,
>                         return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
>         }
>
> +
> +       if (mcd->need_runtime_pm) {
> +               devm_pm_runtime_enable(&pdev->dev);
> +               /*
> +                * Do a pm_runtime_resume_and_get() to workaround a possi=
ble
> +                * deadlock between clk_register() and the genpd framewor=
k.
> +                */
> +               r =3D pm_runtime_resume_and_get(&pdev->dev);
> +               if (r)
> +                       return r;
> +       }
> +
>         /* Calculate how many clk_hw_onecell_data entries to allocate */
>         num_clks =3D mcd->num_clks + mcd->num_composite_clks;
>         num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clks;
> @@ -574,6 +587,9 @@ static int __mtk_clk_simple_probe(struct platform_dev=
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
> @@ -604,6 +620,9 @@ static int __mtk_clk_simple_probe(struct platform_dev=
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

