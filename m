Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B012EC47DDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 12:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i2JkhvjeVmwGZk7KmpKzIYKY/0vcbt6K1rVecnj+is=; b=Vp26MOI9hd9piulMW/54lOj/Ng
	/2cym2Xbz4oZgLzNOzwymDIu7+RsZFENWZu+IQMxHyVZwBf/4GTFGgDCb0Rk1xYNg9YdgE18BcVm/
	SmN1hCSn5IN7lJKw/gXgEVkhQotquNXBtz5zrguXSJQGbFLzYYes7BuxU0BxxUkBozzCgsfTSX16l
	3nbpUNft/w2XnnPId89X5gUwJ6GNfk4RTP6zLLm77CSg10hxkB9raTOm4slFVtzqRGt6roqN/rTQU
	OU+0k2iKTK2GHnoGtd1WvZaUtdlQ9Emj04GCnbq+t8KMRA4udMWXUWBHAmZghD1sYFx+kzNCScWLS
	GuyBFJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFnr-00GOWf-2h;
	Tue, 23 Jan 2024 12:22:55 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFnn-00GOUr-1S
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jan 2024 12:22:54 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-dc24ead4428so2801456276.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Jan 2024 04:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706012568; x=1706617368; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2i2JkhvjeVmwGZk7KmpKzIYKY/0vcbt6K1rVecnj+is=;
        b=E48vcdr+7478w5kDdzw9TSRref1lym6bTgRDbvrsVlSH2yekbSA9yCGceAcsXb2AEX
         Fug7OjfQAJktCaTqQePbs9r/aF6cDvbQ8SOeHxlQvvp12z/u7Z+M0dbx4KziNjQtA2Ku
         OM91yhNP+KQT5WIzJbrjU8QlQUzfGQU7YbCR/61DE6nU0TCdQkjrmPsnr+gsiGGX9Abt
         Bxy1SuK/gQbU4NfH9jYgGy3zvD+EDg9UzkJ3N7ymWEUvrUB4IVsDkKC0Vegxycv5DhZz
         gbYDgAmASbQMsMbyprBhqRW033mdLQS2Huu4/E67UgcdGHcKfcjc6gOHvCWaX+7GDObN
         d6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706012568; x=1706617368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2i2JkhvjeVmwGZk7KmpKzIYKY/0vcbt6K1rVecnj+is=;
        b=YojXHLh6OUVgvKT031vb7GR8+FiV0nufVa6m6wURQPDtIrHxgf1tbk/ooZhwd/cmvN
         xxqutS7ZZWjYQ4XUBazyK2kb/E0rRMfY0TtcxaKH853wsEtE6HUhuqkemxZdtwxtjJQ4
         EGWHeYitV455fL/XMLQT3l+0lup73uKRTuc/gLuxv3DG0sgTwJUxjxu0Uw0iib9dngUY
         jyID59VGCK/RQ44m5qrvFLzSl7St66Iexbh3nBjqgga5Os7K83ebKfzu5Oe5diFBcviV
         5eH4fuFgtZGomouBMPPsFX/RalqeYb7s8qgmhJHQYkpOs0B1UtLWC6caMGKVixgYwTVN
         UTag==
X-Gm-Message-State: AOJu0YxMCLP4m5jhDMD9EWHPZ4I9c4qCpvJHkSDCOrgfxaNKLyKoCXiW
	zSox13NeOktIRVGGlmUVypqS0vDFp3hd9GYkoNKRtXytAhWC4u+8cTZFqU6p/8DLe9E9/6Vj0GV
	H0YAGx6iuAxzK2g+Sr1Eop6NQljUOcQ8F7vS/xA==
X-Google-Smtp-Source: AGHT+IHRYpBdL+ROMhEUsObvUM8ZcI+g0eEAzyEDHj0Yi0tXAbx/m8ujU8Z/pG8HvhWj58H8mBPxPah0p/6uQX6mzx0=
X-Received: by 2002:a5b:d0d:0:b0:dc2:46cd:eeef with SMTP id
 y13-20020a5b0d0d000000b00dc246cdeeefmr3299310ybp.130.1706012568299; Tue, 23
 Jan 2024 04:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20231225133615.78993-1-eugen.hristev@collabora.com>
In-Reply-To: <20231225133615.78993-1-eugen.hristev@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Jan 2024 13:22:12 +0100
Message-ID: <CAPDyKFoNuKv3BSifiuJrYQ7JSKo6OHaugrWChhKWB3BxKrdKCQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: fix race conditions with genpd
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_042251_485959_C6437986 
X-CRM114-Status: GOOD (  36.02  )
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

On Mon, 25 Dec 2023 at 14:36, Eugen Hristev <eugen.hristev@collabora.com> wrote:
>
> If the power domains are registered first with genpd and *after that*
> the driver attempts to power them on in the probe sequence, then it is
> possible that a race condition occurs if genpd tries to power them on
> in the same time.
> The same is valid for powering them off before unregistering them
> from genpd.

Right. When the PM domain has been registered with genpd, attempts to
power-on/off the PM domain need to be synchronized with genpd.

> Attempt to fix race conditions by first removing the domains from genpd
> and *after that* powering down domains.
> Also first power up the domains and *after that* register them
> to genpd.

This seems like a reasonable approach to me.

>
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Applied for fixes and by adding a stable tag, thanks! Although,
please, see some more comments below.

> ---
>
> This comes as another way to fix the problem as described in this thread:
> https://lore.kernel.org/linux-arm-kernel/20231129113120.4907-1-eugen.hristev@collabora.com/
>
> I have not been able to reproduce the problem with either fix anymore
> (so far).
>
> I have a few doubts about this one though, if I really covered the
> way it's supposed to work, and registering the pmdomains in the recursive
> function in the reversed order has any side effect or if it does not
> work correctly.
> Tested on mt8186 where it appears to be fine.

I had a quick look at the code in the driver and a few things caught my eyes.

*) The error path in scpsys_probe() doesn't seem to handle removal of
the link between parent/child-domains (subdomains).
**) An option that might simplify the code and error path too, could
be to convert into using of_genpd_add|remove_subdomain() in favor or
pm_genpd_add|remove_subdomain().

Kind regards
Uffe


>
> Eugen
>
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index e26dc17d07ad..e274e3315fe7 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -561,6 +561,11 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
>                         goto err_put_node;
>                 }
>
> +               /* recursive call to add all subdomains */
> +               ret = scpsys_add_subdomain(scpsys, child);
> +               if (ret)
> +                       goto err_put_node;
> +
>                 ret = pm_genpd_add_subdomain(parent_pd, child_pd);
>                 if (ret) {
>                         dev_err(scpsys->dev, "failed to add %s subdomain to parent %s\n",
> @@ -570,11 +575,6 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
>                         dev_dbg(scpsys->dev, "%s add subdomain: %s\n", parent_pd->name,
>                                 child_pd->name);
>                 }
> -
> -               /* recursive call to add all subdomains */
> -               ret = scpsys_add_subdomain(scpsys, child);
> -               if (ret)
> -                       goto err_put_node;
>         }
>
>         return 0;
> @@ -588,9 +588,6 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>  {
>         int ret;
>
> -       if (scpsys_domain_is_on(pd))
> -               scpsys_power_off(&pd->genpd);
> -
>         /*
>          * We're in the error cleanup already, so we only complain,
>          * but won't emit another error on top of the original one.
> @@ -600,6 +597,8 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>                 dev_err(pd->scpsys->dev,
>                         "failed to remove domain '%s' : %d - state may be inconsistent\n",
>                         pd->genpd.name, ret);
> +       if (scpsys_domain_is_on(pd))
> +               scpsys_power_off(&pd->genpd);
>
>         clk_bulk_put(pd->num_clks, pd->clks);
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
> --
> 2.34.1
>
>

