Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E593C27C40
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 09:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QWfWxMile/WgNFhvo8ZVwxIXeay3uNKMaVUJZ+Cgck=; b=GQyhiGT73iND+NLSZZLm8qotpI
	LFTxx8UQS4wAO+WJ7QyWVUYiob3mCCvyNEfG+ZB2lJ3xFhhEc1HG2i1GbOGqyv7ch3xVNr4uYZdg/
	6WnzyoDh3XWvenXyEP0jozKAQw+CA90bYxx24v012aWXHP6x6i6ZnoRnfBnCqasiHulyZS8mv8vUo
	/mlAJcjpXSRsknJPb3qT7eqUqP5129j8Al6VjwS1qhDAGpf/RwV2LJb7pln5JdTyPTh499ueOrV5v
	NT1j73+uA8Ya0L5KRRwDdfdjhig3njEkWFPuYE+Bu+/97JgKhDX8Gn2Xkfl182dPamkqMVmYkZHKy
	S1zEjZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ6OF-002f5u-3A;
	Thu, 24 Aug 2023 09:12:31 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ6OC-002f58-1L
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Aug 2023 09:12:29 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5922b96c5fcso37998197b3.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Aug 2023 02:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692868346; x=1693473146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8QWfWxMile/WgNFhvo8ZVwxIXeay3uNKMaVUJZ+Cgck=;
        b=uAMAMZb+Pl3xrF//1gf2QoomFCCwtreyRs4xAteq5++ErX/Jag+1pyV60vqF13g6qc
         EWQYleaROyiNyiEmpy54E9f7zGOrUG370OYBBm53fN4GEz471yoC/pFSQ4b14keMgBFm
         7ng6XIVQDxokSMklzIx+h8oZmarkKwbhTXrdGoqOePObuS5InclzCeCyXR6taZUn2/wm
         U8QcZHCo3Fu9mOTcf8df+zbEUZ95ISfluXVW/6MIO2ViQ1iN12idqCJ7OBm8cAynaU/6
         8Rsxe2AbXcTdn7pUXHPXDkQsstCnPF7swZ8nB3HO7IXLrfEtfHeOeBuSelO97JOAqEdm
         5Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692868346; x=1693473146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QWfWxMile/WgNFhvo8ZVwxIXeay3uNKMaVUJZ+Cgck=;
        b=NAc10LxyQeIdIvhMNxs3pXOliGupEBfS08F3Rf6DwPcBMeoW6U0RRLx9iWWAR40zyF
         YdywuBPhbIhZnbjhnYg2sfFT3OtK9AJixF02sMjVHvG2eUGSJZIKNro0mBKaTv/XdnTm
         WYuFiBPBYhW2/poniYoNUoCCwbbeuzgjd4d3alCTgUWFf6cm+XsnqpIDJj2citEZTJ2g
         vrQ19S7TR+oPA4tpcp8ZA/g/1BT/Stv/QKzoPxuiA08VVVfAov2YTfP9qZtJpojWjqNN
         lm3m7PoeCmmNkolehSpuwd3vFP0QsD8pJ3y9pyTeZI+YVG9a2XspCIgn2saX9jHw1Xk0
         ucYw==
X-Gm-Message-State: AOJu0YxO2+xQ1+jI0YpLkrMjqmI2dL8G92V66ikHFw791RL6M5tlaJ1l
	6nwnNgWc9Ucq9Q/+0XnYegBso8dONZE3i1Pe8tKBaSLVVJDCEJy9vqg=
X-Google-Smtp-Source: AGHT+IG3MvSq6xCe2a9q8hrZuopq70FerXK1DSmW4enmcJthTLxeat5RRxOKu4JoydhBbHioOu9VOWz1zigWQTudXgY=
X-Received: by 2002:a0d:d713:0:b0:56d:d58:82b7 with SMTP id
 z19-20020a0dd713000000b0056d0d5882b7mr16106989ywd.23.1692868346583; Thu, 24
 Aug 2023 02:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230823170438.2489746-1-robh@kernel.org>
In-Reply-To: <20230823170438.2489746-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Aug 2023 11:11:49 +0200
Message-ID: <CAPDyKFrO5B-WoWgKYbogTwUEwCqm_0A_NEn0XV8hdQtpOkE0yQ@mail.gmail.com>
Subject: Re: [PATCH v2] genpd: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_021228_477495_91F6638F 
X-CRM114-Status: GOOD (  17.22  )
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

On Wed, 23 Aug 2023 at 19:05, Rob Herring <robh@kernel.org> wrote:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe

> ---
> v2: Previously sent for drivers/soc/. Gathered up files which got moved
>     to genpd to new patch.
> ---
>  drivers/genpd/mediatek/mtk-pm-domains.c | 2 +-
>  drivers/genpd/mediatek/mtk-scpsys.c     | 2 +-
>  drivers/genpd/sunxi/sun20i-ppu.c        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/genpd/mediatek/mtk-pm-domains.c b/drivers/genpd/mediatek/mtk-pm-domains.c
> index 354249cc1b12..ee962804b830 100644
> --- a/drivers/genpd/mediatek/mtk-pm-domains.c
> +++ b/drivers/genpd/mediatek/mtk-pm-domains.c
> @@ -8,8 +8,8 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/of.h>
>  #include <linux/of_clk.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/genpd/mediatek/mtk-scpsys.c b/drivers/genpd/mediatek/mtk-scpsys.c
> index 7a668888111c..b374d01fdac7 100644
> --- a/drivers/genpd/mediatek/mtk-scpsys.c
> +++ b/drivers/genpd/mediatek/mtk-scpsys.c
> @@ -7,7 +7,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/mfd/syscon.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/genpd/sunxi/sun20i-ppu.c b/drivers/genpd/sunxi/sun20i-ppu.c
> index 98cb41d36560..8700f9dd5f75 100644
> --- a/drivers/genpd/sunxi/sun20i-ppu.c
> +++ b/drivers/genpd/sunxi/sun20i-ppu.c
> @@ -5,7 +5,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/reset.h>
> --
> 2.40.1
>

