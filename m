Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE2FC531DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 11:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzLZnXPoqDrTo1OyWvxxv+efcSiWNKyKA+wTnD5Gpk0=; b=IDY7v95otAxtIZJtm5WdGBikVN
	AImsJHuapETEaFH2woyr7mjTpbEsMZrMFThb1/k7xwleia6ZvEI+2G6ChF1SX6UTUeO7CdCMsbsG/
	uwtHcLOPCzLB9oUaWTs6BgJ74p3mKFXjJlNWSREXt25LxrdVy8fM71j4+SCotZuTVl6TfQCOPzBeD
	yDc8Nfu1DxUWAgKd8smh2meBaUnujZzFBMETNUJka6KdtBtG4GsN7xK6K8GxXZwWKC5DdVUHg9mdy
	rgE5DDrJXFCAtthO2WxMNrizFqO7QYUqnB7VldlkM2XSQ04w4zr4xoFcukJgmt2jAZeJ+PnDKrw0I
	7Alp8Jow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgNNj-0000000548H-3tKh;
	Tue, 20 Aug 2024 11:50:36 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgNNh-0000000546V-1eyn
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Aug 2024 11:50:34 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e116b591e15so5588803276.3
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Aug 2024 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724154632; x=1724759432; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VzLZnXPoqDrTo1OyWvxxv+efcSiWNKyKA+wTnD5Gpk0=;
        b=HDMBDIa4Hsic8cgJGZSNN6pdzMt4efGMGV7uIx38QGv3I0+7Ho8ZfYfFU/FBUEeIvP
         0R7/SSbaBJCtJSI9A3pvv0V1s+xrlgEqHYLlLYbAHlJx5C0ZG6y6DQ10Ihw23pDfUodj
         B9f61MyGz6frKJYae2589eK7YFG0Qu9GHBBIfShYEoC3HzMnWwrBUOsJ93MV0xCMh84U
         3taabv0r5ffGzGVKr5QrqTyTroMYkjuQAVQCl7Wg92EmP8I1cSivCY4t+zBMwKEfUk+N
         ojL6x4FxHZ3v2Z31UWXMJZ1XHjzzbJJr0HHlq5NTjcBmOGsTh8Tedcw1EdvhIqOEEHK5
         wfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724154632; x=1724759432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzLZnXPoqDrTo1OyWvxxv+efcSiWNKyKA+wTnD5Gpk0=;
        b=k1JcaKCwUenI4HcUF8oLs+VVyFbOs38yM2KXbSywSwc4HkwMH6zoNmsucnB9+awzTd
         Bl3Bf5+BlUHQScxFo7MBNfbjrS1/8O/msdb+8cNFTOvnM73ilYgYpZz2hOhSZ9iPI3HV
         D/u6asLsaleVUcU9ogmVsxu32jMKuLrkYukySYAmWT1Qj7XeAu+feHLkvad3M2mwl78K
         GHVIzdWgG7scUI1v9fnyBPi/Q2uewuoIMX339/ra9Brs7KsaGDJ0a09sc2CcPh0F5O9v
         1NIH9Z4TqfSXZKlDKST1ddIUQAP4g8I09R7NoEwFsuQ3tuYNHEFDSFMK8uqnf5N3+bVo
         RWYA==
X-Forwarded-Encrypted: i=1; AJvYcCUz+dm7G0qp3iKnVcuW9RpMB6kcNB0k0FVGTPTdpwkhtz5wuQ85QHY0Bc80z0VrqVlcJ43Gk/cla/UA7yx2gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSzyM3Yvkrkx0Q1Pd6rT0We3H0iJ2ZMrlPmp3HdCJeFWPdArd6
	02HV41qtOa2NNJoEu6+TqqL6RZg/4JfotaIzIv8IOD66wk8AUYWjtulZsjFSMC+t4gCC8cVqAcX
	s/79G5GezapMID7fIYlXysapV7CKsWrTLEfsSzQ==
X-Google-Smtp-Source: AGHT+IHan5yI+BqVJCjNqFm/+Bd8yfej131gbJS5FJ0EOd0g5zSRJN7v+VFbAUTODUKmBQ76DXhsJZ07OlxiL6/2ZX8=
X-Received: by 2002:a05:6902:144b:b0:e08:5f0c:97c8 with SMTP id
 3f1490d57ef6-e1180fc610amr14678149276.57.1724154632329; Tue, 20 Aug 2024
 04:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240818142300.64156-2-thorsten.blum@toblux.com>
In-Reply-To: <20240818142300.64156-2-thorsten.blum@toblux.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 Aug 2024 13:49:56 +0200
Message-ID: <CAPDyKFpx6naJ2BD9xMyKbHdOAcT3v3_+fjmy+mCdU0=TNQ0swA@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: mtk-sd: Improve data type in msdc_timeout_cal()
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_045033_462140_C9381AD2 
X-CRM114-Status: GOOD (  21.52  )
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

On Sun, 18 Aug 2024 at 16:23, Thorsten Blum <thorsten.blum@toblux.com> wrote:
>
> The local variable clk_ns uses at most 32 bits and can be a u32.
>
> Replace the 64-by-32 do_div() division with a standard divison.
>
> Since do_div() casts the divisor to u32 anyway, changing the data type
> of clk_ns to u32 also removes the following Coccinelle/coccicheck
> warning reported by do_div.cocci:
>
>   WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead
>
> Use min_t(u32,,) to simplify the code and improve its readability.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
> - Address kernel test robot feedback and replace do_div() with a
>  standard division
> - Link to v1: https://lore.kernel.org/linux-kernel/20240815234602.59684-1-thorsten.blum@toblux.com/
>
> Changes in v3:
> - Use min_t() instead of max_t()
> - Link to v2: https://lore.kernel.org/linux-kernel/20240817170726.350339-2-thorsten.blum@toblux.com/
> ---
>  drivers/mmc/host/mtk-sd.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index a94835b8ab93..edeab9a4a83b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -795,14 +795,13 @@ static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
>  static u64 msdc_timeout_cal(struct msdc_host *host, u64 ns, u64 clks)
>  {
>         struct mmc_host *mmc = mmc_from_priv(host);
> -       u64 timeout, clk_ns;
> -       u32 mode = 0;
> +       u64 timeout;
> +       u32 clk_ns, mode = 0;
>
>         if (mmc->actual_clock == 0) {
>                 timeout = 0;
>         } else {
> -               clk_ns  = 1000000000ULL;
> -               do_div(clk_ns, mmc->actual_clock);
> +               clk_ns = 1000000000U / mmc->actual_clock;
>                 timeout = ns + clk_ns - 1;
>                 do_div(timeout, clk_ns);
>                 timeout += clks;
> @@ -831,7 +830,7 @@ static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
>
>         timeout = msdc_timeout_cal(host, ns, clks);
>         sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC,
> -                     (u32)(timeout > 255 ? 255 : timeout));
> +                     min_t(u32, timeout, 255));
>  }
>
>  static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
> @@ -840,7 +839,7 @@ static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
>
>         timeout = msdc_timeout_cal(host, ns, clks);
>         sdr_set_field(host->base + SDC_CFG, SDC_CFG_WRDTOC,
> -                     (u32)(timeout > 8191 ? 8191 : timeout));
> +                     min_t(u32, timeout, 8191));
>  }
>
>  static void msdc_gate_clock(struct msdc_host *host)
> --
> 2.46.0
>

