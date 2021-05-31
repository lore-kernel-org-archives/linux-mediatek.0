Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDD2C47080
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 21:36:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6D3261005
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 21:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6D3261005
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgnSh79hCmF0CbYpn2fYW7Bdiy+BxDQ2YhvXb7GoBnI=; b=khhF0sB32TvpMq
	cq/neKKPManB8uE20Wbh0sLpmwXc6BDZ5JtgXTtIPnzghWAhtucT1KKoPvm1QevBKjaSmdlQBl+DQ
	WloGRY6LLtFruPvsnS8F2uYgXpVp7N1zasULYr38zKy941a0Ppfa2GNwwfMfW5dSM/6r7U/y4nrvu
	iLWhGF5LGy90ZuS4qIQWGbukak1nD8VGaSwE/BAlzFiafICGJX8qnbFcVc5NWNi1h3va7kg7B0UVA
	1Nz2mLu31Sd131pkVlrBaJxCaMkLuWx5lW3R8hbfGkwuPi63Snu33FVSbn/ggKQzLJk6Xs8F4BHUJ
	jxdylknL8gv+y6wFeeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnpaN-00DUsl-7O; Mon, 31 May 2021 21:36:35 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnpaA-00DUqj-Ax; Mon, 31 May 2021 21:36:23 +0000
Received: by mail-oi1-x22b.google.com with SMTP id z3so13481979oib.5;
 Mon, 31 May 2021 14:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aMtcDguE8YDTale07cSMPpefpj+DlHJ0KoYhVMD5L80=;
 b=M0OsHNKzHvX9kahydNMpioIAmig3QZQ41zfG2b3MLBL2wE4hv7Pdd/3WQ96Flu//Tp
 S3VrjLJRnqbSIyrJO11g8c9Xaa4f2rd1nwqjygUGDD1+mb3awXrm6or5RhlITFsxRg6V
 PH2mqGNt40KoKrMgBzfdAAathNHw+G9CtjgAKSPSCx8E/ipevWOhbk2CSv7zOcIN1bAw
 g7LihQUfhAX3tTb3beU/UCltrrMsOm6aXLXxSWcKqah2KvzFF8Bk7kNzhN/rXGHyAqAE
 6g5J5oAyN3XC/tUCO0Ki+wDVC0qLWGjIYMM3+WLyQYG1i6j/tPU84RKUzu4FUUjbX7Hq
 aE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aMtcDguE8YDTale07cSMPpefpj+DlHJ0KoYhVMD5L80=;
 b=Lo8vbbLWjEx01LfRWdR/LMZxIyhrhYHvrzk+qkrToc7E0JKhPlcsfs97DqWYd0eeyM
 4IokftI9eliLPS3CNNII+OYb2w/JmzPQ12eZZcQH38RmV+gTZ015UlTMcWCFekumk3lX
 ouTLEn6SrQFdk2SE766JFaxzCY8n7QJijJBbrK00jMn6+NhIqcjXRfwPNPgIx8NP/xqR
 RXnNVgJiIAFVXM3VKzpY3wX+HgSk2sSd9oJlsRCFMk5h6BigL9hpPbj+hYvEVWIpyKP0
 316JSX9xMetuIaWYj6HVjiUMp49PNeGIjxjKeX8xZufK2MJONzbZRfdAGGjQylw/Cdqo
 5Ezg==
X-Gm-Message-State: AOAM533tzwktE9PSQHNSQb9nZKMKRtb6e2YYdApfw01/vaVxswAkL7LE
 IhYj9fhQfNXK7jq49BEPvErF6Ns7Dz8/7uupJUo=
X-Google-Smtp-Source: ABdhPJyoTQpB2iTv+37/sgEJHnO47tYP0raUCEPiRUXGrrgiJZx7g6Di6Q1zvS3z9SJ69+luGSrsExAS0m0Avm4IpqI=
X-Received: by 2002:aca:4b09:: with SMTP id y9mr673633oia.39.1622496979005;
 Mon, 31 May 2021 14:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210531043502.2702645-1-hsinyi@chromium.org>
 <20210531043502.2702645-2-hsinyi@chromium.org>
In-Reply-To: <20210531043502.2702645-2-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 31 May 2021 23:36:07 +0200
Message-ID: <CAFqH_53nNca8VG=09djYseJBWWg5j=YFTfPjxJL5w-aTyBmCng@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: mtk-pm-domains: do not register smi node as
 syscon
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 chun-jie.chen@mediatek.corp-partner.google.com, 
 Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_143622_405437_A8B0F403 
X-CRM114-Status: GOOD (  25.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

(again without html, sorry for the noise)

Thank you for the patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dl., 31 de maig
2021 a les 6:35:
>
> Mediatek requires mmsys clocks to be unprepared during suspend,
> otherwise system has chances to hang.
>
> syscon_regmap_lookup_by_phandle_optional() will attach and prepare the
> first clock in smi node, leading to additional prepare to the clock
> which is not balanced with the prepare/unprepare pair in resume/suspend
> callbacks.
>
> If a power domain node requests an smi node and the smi node's first
> clock is an mmsys clock, it will results in an unstabke suspend resume.

Typo s/unstabke/unstable/

I think it would be nice to have a Fixes tag for that patch. So can be
picked for the stable kernel more easily.

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

I have a nit below but the patch looks good to me. So

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/soc/mediatek/mtk-pm-domains.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 536d8c64b2b4..a9ba71eee4bb 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -296,7 +296,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>  {
>         const struct scpsys_domain_data *domain_data;
>         struct scpsys_domain *pd;
> -       struct device_node *root_node = scpsys->dev->of_node;
> +       struct device_node *root_node = scpsys->dev->of_node, *smi_node;

nit: Personal preference, but I'd prefer to add the smi_node in a new
line, so it's really clear that the only thing you are doing here is
adding a new variable.

>         struct property *prop;
>         const char *clk_name;
>         int i, ret, num_clks;
> @@ -352,9 +352,13 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>         if (IS_ERR(pd->infracfg))
>                 return ERR_CAST(pd->infracfg);
>
> -       pd->smi = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,smi");
> -       if (IS_ERR(pd->smi))
> -               return ERR_CAST(pd->smi);
> +       smi_node = of_parse_phandle(node, "mediatek,smi", 0);
> +       if (smi_node) {
> +               pd->smi = device_node_to_regmap(smi_node);
> +               of_node_put(smi_node);
> +               if (IS_ERR(pd->smi))
> +                       return ERR_CAST(pd->smi);
> +       }
>
>         num_clks = of_clk_get_parent_count(node);
>         if (num_clks > 0) {
> --
> 2.32.0.rc0.204.g9fa02ecfa5-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
