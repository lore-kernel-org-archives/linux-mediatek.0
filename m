Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219EDC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 03:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObkEnuuH6gOnqCgYYHi3bc1hx2szK3N1+NcE/YyxwBo=; b=HjiYBmwpVEHgrH
	tdqyP7SZyM9GSEA1YbjtlbldT7YkuHmIXfbpQeoLEGoHXuVz+lxxLSRHSCDmzxrStWYZCRmaOQkBP
	MsM5uOVGIjsjMtA1W2UFBdJw6Sto1SiL1aGbdYnLETaobQ0rmDZsE03Vt5bYB8ffqK7+TmaXPqfQa
	DjV+YZiLn/ouKjtfK/2c4xY6VbtCulUJe/PcBA657Pz6Ng46tb6R2Rl8bmuSIYHu5l5VdVUrxLOk8
	vSNBCUR8+vCSKv6hyJn054Bg/T+p4dJkJN6t5M/xgeZLzsllT2YA+ZQUc08t8bxog20muklTCE8LS
	VDpZVPieI/gQ6+6D8U3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS9VT-00BB8m-U3; Thu, 10 Mar 2022 03:30:27 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS9VR-00BB7S-5Z
 for linux-mediatek@lists.infradead.org; Thu, 10 Mar 2022 03:30:26 +0000
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2dc28791ecbso44582237b3.4
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Mar 2022 19:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WgRCsCLWYCcRTmUTMqwnDRYue1IsKXpGcRsc3GS7hcU=;
 b=bTmH5bmcH/U/4uCsCmXzu+Ix6JFxxrKutkNq+STjXVK63oKlZUPzuNjfK3ADEaQxV6
 JOOXFEOr+zjOHCrbYY/H33UEZk2p4cb1Famj9f87Uy8+SH31gNUlQpdF5YfxwZprAfVO
 qA4wQh+0eK0n3aqJBtjY59fXp9MZGpaYELU0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WgRCsCLWYCcRTmUTMqwnDRYue1IsKXpGcRsc3GS7hcU=;
 b=4NVi5JAqlpt5MaLpCi3YxT/OPT20xTWuwbTKAwHhIwgPSCylMr3EBv+69EbqJVHFR9
 ax2JLfYjDtRjCBFxBTebUhIP2eMLEL+MwDqX9cRfoOiAoyLoaC6lcJb9E2hXPNT0DZiF
 k5YfZUNRt5sLcegQw/tj6J5jyuAvIxirnS+VcCj68IfmyO37vO8dViX9HyyNmpcUkfn0
 LF5nOfeOoMTSSwxN/fqK4m1S5RySnWR/swY3S72ndulMhcsyUCI/9NUqRcrbOF/Nt61Q
 jmGOXlpdd8y5tk8Aib9w7Gsmz70ItG43q9MlWJG/NTtVFDMkavPnfZE2KwV/4y7z9PNR
 pT7Q==
X-Gm-Message-State: AOAM533WvaDF2LmpYateEvkPEhQEr+5AbxjVu2XtR+MZYit83m9vPu+8
 U8DtMEWnZDLtKjdHE2BEKiZorkBDOBSXCIPza6Nikw==
X-Google-Smtp-Source: ABdhPJzXi4nwrmcagVkrjtM225SxnGi8cQ0ildeViV9+Ph+DRtdhBYcRycwlj8wpEmf6UJ4qvADYZ6TExd3tXQlrEE4=
X-Received: by 2002:a81:b044:0:b0:2d6:bd1f:5d8b with SMTP id
 x4-20020a81b044000000b002d6bd1f5d8bmr2386642ywk.27.1646883023764; Wed, 09 Mar
 2022 19:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20220310011548.2487-1-chun-jie.chen@mediatek.com>
In-Reply-To: <20220310011548.2487-1-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 10 Mar 2022 11:30:12 +0800
Message-ID: <CAGXv+5HecgmXVMnAqUJVvjy2S1P5qvPWSVkcu5BwkhfAqDPEYQ@mail.gmail.com>
Subject: Re: [PATCH v1] soc: mediatek: pm-domains: Fix the power glitch issue
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_193025_249029_247731AA 
X-CRM114-Status: GOOD (  17.88  )
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

On Thu, Mar 10, 2022 at 9:20 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Power reset maybe generate unexpected signal. In order to avoid
> the glitch issue, we need to enable isolation first to guarantee the
> stable signal when power reset is triggered.
>
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
> This patch is based on 5.17-rc1.
> ---
>  drivers/soc/mediatek/mtk-pm-domains.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index b762bc40f56b..0195f6c3396b 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -272,9 +272,9 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>         clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>
>         /* subsys power off */
> -       regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>         regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
>         regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
> +       regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>         regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
>         regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
>
> --
> 2.18.0
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
