Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97B4C369C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Apr 2025 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dy23SZTpPz/OtRsVa67VPlSbZbxd200TTdg7Zq9HNk=; b=bVzB6d3LpI6MxWplOmWOiizRmM
	f6Q+EAXFp8DB9IkK9mXPIWtl4U5xLbGxqZJLHaV/lHbpSBTozUEGnsXB6ocglOkQoPnrWTcRsdtUB
	hflQU6YMhnXKFg/bNQJ5jgDz76opPSOqIhaeOOFXFkrAtFbOCranb/EUBFdVYj89lmM/EJ/g7N3wX
	vBuuzQINyrS+37ZU6jXRJN1NS9sO7Qoeyz4jWShZvWku3OkOFFYOTKOyUuNti7A6VgMl3hBvlLcpb
	oO4K7GIbudZNRL8sNwHwv2qNb7rFw3CP3qwjtkH37dDrMNzVVv8xLNA7J3KgmFMl6T9m/ZdtNrhRt
	cixTp/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ho4-0000000H3xO-41pW;
	Fri, 25 Apr 2025 12:05:24 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GBN-0000000GiLs-2nPC
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Apr 2025 10:21:24 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-702628e34f2so18540057b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Apr 2025 03:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745576480; x=1746181280; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2dy23SZTpPz/OtRsVa67VPlSbZbxd200TTdg7Zq9HNk=;
        b=wCkW+99eWphLWYsdjv4GhAiCgn3I6HuGroJV/7J0F5tCHlhH7RMhArLYlsKzNHikqv
         Lpogx9sl2M9xmNK+bezjMKvczRiDeZw/+rT86ZZ2r/gnE18cajgWEkyCDkJgExEwoClN
         CsgVqcQBOa0GPgeLD2qdl9DFdFzA1SNn7IX/Cstk1dJSm8zfWv+G8jUJRio2x6dEaS/c
         zniZitz9NsnC6gGbQvYH8Q23+PVa5ChZc0hyzbAr1Tbc9jC6CCD2yxGacZyoAAUu8W3z
         yp9efBrCFRJ4cgPOnalA2p6wQJ8F7Tai0Yl7kNh95U68TVR+isiylYn7oIKQjhPzgwQN
         rRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745576480; x=1746181280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dy23SZTpPz/OtRsVa67VPlSbZbxd200TTdg7Zq9HNk=;
        b=m/kfQiGtcn921+bmBysLI2BV3V2TajNegMpD3TIzNCj4UWmI59++aF6cbtnacsGp8d
         vQRm5sGBZrLxjTitl5Oh0Vr0Lfzlj1P8EYcjgK/dj1QHxWCK/GQ1/9Glxwn3BT1Qvif1
         /6S/7d0u76JkLikZIgnz/X2r2nFYant67eqqNSZw2LEKVjcjwzR8/+oWrYOWalmJB+rC
         QdsmNdCg4KHCwpbYDlXMgvVwk0To5e1JlS3Ysf5aXHckUHFoPCVXfmile5e0s3KLOkZy
         qPfl+Jp7okWlLJdsM7C4kRzi1RxUod0uR7TB0rA/yOPT6+soajvQvlHuziX6wBL4y1Mb
         rt9w==
X-Forwarded-Encrypted: i=1; AJvYcCVncs+9PuW1kmriIEmOJYxmNaIB+rOFJ4UvT5cNp4WK3JCDGXLTfKUa/75NUg2krtF3wEP7BYTnDP5yvi7OhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnTY9uBV17ZprEqkdg892bRenCx9r3km6oOotuqGllzROhEyt7
	CzHIejUVWceXmy2cyo8m3y23cFQXxcLScXkWZ72lKlVJMOJ0wxgyUnA7cosTTKF3Mjfj9q7dkAA
	/3hXz5lMBayAc05sTVbH0QZQmaSxrXnaEUKlkXg==
X-Gm-Gg: ASbGncv7QIDlk4xfRwotgVF59wH8/b443aTNN+AvRl1h3FtXQGnixrGAE/dL2778xx+
	WPTtnM363y4XVS/HX4s7dTyzKK32qC6ku0kGVbvQkd58Pn2NCBjOwiMRAN/fFr9yJU66Yklz2QW
	IBFzbsYVrhHdRyj3Py/c45GZU=
X-Google-Smtp-Source: AGHT+IGCkeBYkL01Ob0/q+cYVVyOOQUT9d0JdZJ2RLVPcS+2b1wB0bERA+PHNQouav0l20rXKN6j1bHrWfsqVHaUuzI=
X-Received: by 2002:a05:690c:61c8:b0:705:6afe:4580 with SMTP id
 00721157ae682-708544de4demr18549377b3.19.1745576480517; Fri, 25 Apr 2025
 03:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250421090951.395467-1-wenst@chromium.org>
In-Reply-To: <20250421090951.395467-1-wenst@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 12:20:44 +0200
X-Gm-Features: ATxdqUFyawKWbJKKMCdA_eJxPR8YeUvlb5__azoGszdJwBU8e_s7VHYVEWsbp3g
Message-ID: <CAPDyKFroHJt7u6CzmPLnWv6rii4+adsFNDgoVqA-2AvN6S911g@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: Add error messages for missing regmaps
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_032121_723558_FA609536 
X-CRM114-Status: GOOD (  17.06  )
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

On Mon, 21 Apr 2025 at 11:09, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> A recent change to the syscon regmap API caused the MediaTek power
> controller drivers to fail, as the required regmap could no longer be
> retrieved. The error did not have an accompanying message, making the
> failure less obvious. The aforementioned change has since been reverted.
>
> Add error messages to all the regmap retrievals, thereby making all
> error paths in scpsys_add_one_domain() have visible error messages.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index b866b006af69..22cdd34ed008 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -397,20 +397,26 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>
>         pd->infracfg = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg");
>         if (IS_ERR(pd->infracfg))
> -               return ERR_CAST(pd->infracfg);
> +               return dev_err_cast_probe(scpsys->dev, pd->infracfg,
> +                                         "%pOF: failed to get infracfg regmap\n",
> +                                         node);
>
>         smi_node = of_parse_phandle(node, "mediatek,smi", 0);
>         if (smi_node) {
>                 pd->smi = device_node_to_regmap(smi_node);
>                 of_node_put(smi_node);
>                 if (IS_ERR(pd->smi))
> -                       return ERR_CAST(pd->smi);
> +                       return dev_err_cast_probe(scpsys->dev, pd->smi,
> +                                                 "%pOF: failed to get SMI regmap\n",
> +                                                 node);
>         }
>
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_HAS_INFRA_NAO)) {
>                 pd->infracfg_nao = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
>                 if (IS_ERR(pd->infracfg_nao))
> -                       return ERR_CAST(pd->infracfg_nao);
> +                       return dev_err_cast_probe(scpsys->dev, pd->infracfg_nao,
> +                                                 "%pOF: failed to get infracfg-nao regmap\n",
> +                                                 node);
>         } else {
>                 pd->infracfg_nao = NULL;
>         }
> --
> 2.49.0.805.g082f7c87e0-goog
>

