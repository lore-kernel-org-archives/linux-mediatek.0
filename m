Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990A1EB4908
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Feb 2026 11:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ct48jaILiyeWuqBIUxAF+6ly5hlTe20+NjTg9trJyi0=; b=og42ezGDCsv2BNBuAfEcLwI0Zl
	Kp1NBcjoi+u/hUHvxD5TXTHke/TmzMKDHNmUli+/KbCZYGYwZ7okhOQb/OWG4ZxSwkfnV6Er8ZXRc
	rj+v3lbRHgqNg31LggOmdTdUZyksVOtLQcKPi4dR4rVjaM5gf7C/Oq5m/1apHpeXG2Q9S7Tm764CM
	0JAYucyUvytjsZ7mDTNHqQaPe83sNTNT+sqxrBlb4NoHJCZURuFa8HwL2qSKqecPoGB1SNXw0E/l8
	6e1LcEe1qY2NenNYQ0oUHuTYs3JeRCc7y6rajslnFGh8zSsMkp47m/lDV0O8FMVRcyitoQWdxavOf
	a1M5HDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUy8-000000020Hw-44tE;
	Thu, 12 Feb 2026 11:34:49 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUy5-000000020Gm-4AI5
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Feb 2026 11:34:47 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59e5eaa491cso1742128e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Feb 2026 03:34:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770896084; cv=none;
        d=google.com; s=arc-20240605;
        b=EsUhkOHaZaNWYtbNy4TCndb8bxFm78lay6BhcUuUitrwRLfrhW12hMV/OBNRGHtdgB
         5l8rxvj/2G+WFgFZSxtEIY9CguAfOVuubehNodfwJtg6nooRJWoUUhurpPHMz9/ixRqi
         Vt4/9AnI6W5+o4+fMgpiQ4pKFg2/n9ayQUT2MDIYRdprc7SZb7FuKJbEAGE9ih0tNcQh
         76D4LUOvADeDvYrggF05RV5KrglafISgMrAYQiOPG/Ho8knc42Z4FPKYtGqUsIcgXKkm
         dzrl5SIbC/PCQsyhVELVDUJVqHqwwNT8D53nWMWhfAkUgjctyz9U9Rk5IkJpRZZuotGK
         Ss5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ct48jaILiyeWuqBIUxAF+6ly5hlTe20+NjTg9trJyi0=;
        fh=qEAlfxu88ajznVE4aCZ5uWVY7kvcdGgxIinhcMBZqEA=;
        b=IV3TMJ1JrW4BuQiSRCEGnoB3LIzxV6eir126Qg97rjHzmID4XftnBbpKBi+3JtdT4L
         kia9CDZSlJc9VIk9+hfBfF2uwxv47j3zEGBJ/wWSfkzdSWgkzxWmw2wsVE+k8DoYlSgZ
         MtqiGepT1EJnW4G1rxwjIdLjfj9SldutD7f3n7iiz1WI1/Ac3C3kme6umhKZ2FSkc0ai
         99QPIbI4W2ERhiM6+lR28JI9hMafClB5tVbwOx5UzIEMURPMZbWLhYK3m0YFfoE/x8hp
         kcmwqfA/dXRMTWglqrXsxg8RjBgefgjn9aZE6ZKMc+HsC6LKB6w9JJEeF0lnRdkCuP6N
         +Uww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770896084; x=1771500884; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ct48jaILiyeWuqBIUxAF+6ly5hlTe20+NjTg9trJyi0=;
        b=anTog9fFfMKuBGIec8jQqZvgUCIbac83No+hVmDmyRhKixRfoMKzDc5v1fAHZ5zujg
         FBK6sHzHwX6DK1j/+YEnnHJgOodJK6qU5l8ogEyRPQQNYiZ2BYRsqw2y7gHf5bLMdpOn
         ZIddcKHSRzc6BhIx/cxoxJLDalnZb9LfqQ0Yc6khoV047sgE5kcWufNA2Oq1FD72zF1J
         z6225xZ7yYGVyi6ZORflg4Kdd2wk4X97St76NtnZTwE3PHnyJ5ywKww1dnpHwfAdjifJ
         BhJhjxlS8XITwhJ8ZQwughJMcKylDx8eLb5e4M7HbKIKwAM6qa4IXo/XQUx/sUbVH0RO
         9iFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896084; x=1771500884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ct48jaILiyeWuqBIUxAF+6ly5hlTe20+NjTg9trJyi0=;
        b=hRse1gPMfytcZDo8dte5q1t3okvFwQFd+HwgfESTsMGhV+ZZTIg1M0JOGIEJpYLNMw
         n7EqgFU4P/NkFnd70CZUnSESZXpCotBMz7g0Lp7SQR0QEca8Om/6drr2xPi7yW7MQDQQ
         hevqbtOfZa/MNcC01bO8IN3q943ieqbcuSuE6Tr8hJGfXMPEZeJe7Z7NsaPlUlGac8lD
         zN5hEb68W9EA8HdTQbrjIxbHL1dW7BjsvcWnFeqy/n/h+l3luDDRrc8VdAWIMP4EELZ7
         xpYRJRLp+naF73OEfe/efUVQ2RzeQbVmkLhE/pi3Yhyqhfp+zW+zxfluna5KZQOvHMhy
         FLpQ==
X-Gm-Message-State: AOJu0YwJa95HySb85X/v0wsVwL96SNEgFaCO899OTN99Qnd+k79uiWsb
	vtoS2ErlWRGWRdqf4/Hl2jsg/58UmvYFtH1u02G3/Ns/Rjb60kL2rh1tM3TNtNqHtp8OJ6UiVp8
	dFOePnh37GY2CQH48v8c4jZdN08J1YyZbi7m/VHUfCg==
X-Gm-Gg: AZuq6aKCTrQE7tLICdUlv8LtQtAKMSisrwQXW3t8D3I5ep+JWA/6H2/6hZMZHN7SvEF
	F20E8FSeWPEc+ctmjEjPvIsizuOJC0a4inCDFoK0T/gF3M/e3frc88qX/R10s8BkMC/QsONOHMk
	JdVbvcTDMfwChUZrXnii6zkafJ6V2jjcuNU9p2Q8TjJp+/TZrGLbsSM4bgYHr4iYJlcf8/CE1oD
	zoognpy+OjgcACRmdNfCWRxcGVgu+t9FrC1lfUUhkeFl78PsVwlyr5+mpbGHYeSZYPCcqn6ouFM
	ELWYKdEY
X-Received: by 2002:a05:6512:22d5:b0:59e:5d0c:e2 with SMTP id
 2adb3069b0e04-59e6414e8bemr537633e87.30.1770896083713; Thu, 12 Feb 2026
 03:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20260210053708.17239-1-aford173@gmail.com>
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 12 Feb 2026 12:34:07 +0100
X-Gm-Features: AZwV_QgO3Ow5QyeJg9yfF4esWqYhwcZC_L0GtKjw3_i47HZRQkNGD5zGxr2FDM4
Message-ID: <CAPDyKFrsMY8q+rvrbOdppYnefX6TA1-EhF+e+pGG6k49KpeTRA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
To: Adam Ford <aford173@gmail.com>, angelogioacchino.delregno@collabora.com
Cc: linux-mediatek@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_033446_082937_0D5A182C 
X-CRM114-Status: GOOD (  19.43  )
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

On Tue, 10 Feb 2026 at 06:40, Adam Ford <aford173@gmail.com> wrote:
>
> The wrong value of the number of domains is wrong which leads to
> failures when trying to enumerate nested power domains.
>
>  PM: genpd_xlate_onecell: invalid domain index 0
>  PM: genpd_xlate_onecell: invalid domain index 1
>  PM: genpd_xlate_onecell: invalid domain index 3
>  PM: genpd_xlate_onecell: invalid domain index 4
>  PM: genpd_xlate_onecell: invalid domain index 5
>  PM: genpd_xlate_onecell: invalid domain index 13
>  PM: genpd_xlate_onecell: invalid domain index 14
>
> Attempts to use these power domains fail, so fix this by
> using the correct value of calculated power domains.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

We should have a fixes tag for this too I think:

Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware
Voter power domains")


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index 58648f4f689b..d2b8d0332951 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
>         scpsys->soc_data = soc;
>
>         scpsys->pd_data.domains = scpsys->domains;
> -       scpsys->pd_data.num_domains = soc->num_domains;
> +       scpsys->pd_data.num_domains = num_domains;

Not sure this is the complete fix, as scpsys_add_one_domain() seems to
be using the wrong value of "num_domains" too, no?

>
>         parent = dev->parent;
>         if (!parent) {
> --
> 2.51.0
>

Kind regards
Uffe

