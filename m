Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6EFC0032E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 05:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0jgQzh15tbFUAVOhe9LIEhZLsMkajruBrfzpNc5b9w=; b=U6prskBpwmrYai4OjrRDkh+O6s
	e5DZJvwqgocMzn5eYJHL9j31hEFAlj2sRmgGKf9CHMBs0ig22I7kUhwK7kYbNRMeYI+W1D31C0HYP
	Q6W4u/Rh5McmNJNTxuEh+uxfGHHXh0yV82ChnErOlm2//Ln4o3y7CajYmXXJAOvcJg/iIInt7tafR
	8kqdB+pRtcxWgW7opLuVOia4keYdMjOEeHTFP3OzbDutXuye9x5F77fMG1A9X7cFS/6DS0Pibnv++
	ASz064niFyE9ZQ5EbZIbcYqs3U3HLNwVFpLaOfhWsMehylTaLWnW+ExsLx/99FsXOcS++wAhlkKwc
	PPyM4wdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qthin-001EKJ-2E;
	Fri, 20 Oct 2023 05:06:53 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qthij-001EIy-2s
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Oct 2023 05:06:51 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507c50b7c36so474469e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Oct 2023 22:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697778407; x=1698383207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0jgQzh15tbFUAVOhe9LIEhZLsMkajruBrfzpNc5b9w=;
        b=fhZTkpzwHmTUAgvHQNMD1SRaO0/EYRQfDdHC3zJMUIa/0a+MjnyXi70BmYOf6pvbXD
         vcZM+TisV558BqsiGh9wuY+KWGNZxjF4pKhQWUJxlpTPTjQDXZvpq5Ve7FtYcx1+1k0t
         ReEex0VOotKJ4XqZEdW5Bht43qEU04zyWhxNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697778407; x=1698383207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0jgQzh15tbFUAVOhe9LIEhZLsMkajruBrfzpNc5b9w=;
        b=qKfpv/L2Uj+3vCHyJkoGXDJWRrHRC3JyrHBoxf/8okIhIWgfm2veMI8k5jm/qQaQ6v
         bwZsE3aDxsS+tTRPpZ4krHd+GupHVzfIap5orq1nBcVSV8yCv6pBNXqG/iD/1F7RiTFS
         IdK0oP6jeZI3ChZuQnF6PnJaht1IJoDlbV0d03g7zHHBmRPZJjOVS3pSVm6EvR9RMdLF
         HhtMWLD4PzHJHr+dC7aZgrv269gYMVEPsFRsZ9zTmmjQhRYn7cAhI0lLqAi7sw6YkiOa
         WbSb9emDNNjZCa5BraiSYEHGA0FRiULsotOJdfAzCiGBZ/O57qj7IXB9kfM49tdYzJnc
         fMxg==
X-Gm-Message-State: AOJu0YwfMgBN2gUJFZgEXaii0v58YqjoPkaLdGEk1cImlQ3/eRlS+mib
	ekZd4gEwluAHcRl7/2mA7OGYSFPeIX4bgLyE7WUqaA==
X-Google-Smtp-Source: AGHT+IFmCdlNIlds8uaCs9bu6h6l6p+rnQ0UHqe7D43uyuGzPJgRp6m8F0GVh5IYUPL/Omk3FKAR5Km/rjyluUqBl80=
X-Received: by 2002:a05:6512:20d2:b0:500:bf33:3add with SMTP id
 u18-20020a05651220d200b00500bf333addmr380886lfr.47.1697778406807; Thu, 19 Oct
 2023 22:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231019124914.13545-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231019124914.13545-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 20 Oct 2023 13:06:35 +0800
Message-ID: <CAGXv+5H0rUajeU-i8nYyV2xWFQTnzqxioZCCyyP_RZXKqmcugQ@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: mt8186: Change I2C 4/5/6 ap clocks parent
 to infra
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	u.kleine-koenig@pengutronix.de, chun-jie.chen@mediatek.com, 
	miles.chen@mediatek.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_220649_960011_18B3F292 
X-CRM114-Status: GOOD (  16.15  )
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

On Thu, Oct 19, 2023 at 8:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Fix the parenting of clocks imp_iic_wrap_ap_clock_i2c{4-6}, as those
> are effectively parented to infra_ao_i2c{4-6} and not to the I2C_AP.
> This permits the correct (and full) enablement and disablement of the
> I2C4, I2C5 and I2C6 bus clocks, satisfying the whole clock tree of
> those.
>
> As an example, when requesting to enable imp_iic_wrap_ap_clock_i2c4:
>
> Before: infra_ao_i2c_ap -> imp_iic_wrap_ap_clock_i2c4
> After:  infra_ao_i2c_ap -> infra_ao_i2c4 -> imp_iic_wrap_ap_clock_i2c4
>
> Fixes: 66cd0b4b0ce5 ("clk: mediatek: Add MT8186 imp i2c wrapper clock sup=
port")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

I'm curious about what led to discovering this error?

ChenYu

> ---
>  drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c | 6 +++---
>  drivers/clk/mediatek/clk-mt8186-infra_ao.c     | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c b/drivers/clk=
/mediatek/clk-mt8186-imp_iic_wrap.c
> index 640ccb553274..871b8ff4c287 100644
> --- a/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
> +++ b/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
> @@ -29,11 +29,11 @@ static const struct mtk_gate imp_iic_wrap_clks[] =3D =
{
>         GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C3,
>                 "imp_iic_wrap_ap_clock_i2c3", "infra_ao_i2c_ap", 3),
>         GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C4,
> -               "imp_iic_wrap_ap_clock_i2c4", "infra_ao_i2c_ap", 4),
> +               "imp_iic_wrap_ap_clock_i2c4", "infra_ao_i2c4", 4),
>         GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C5,
> -               "imp_iic_wrap_ap_clock_i2c5", "infra_ao_i2c_ap", 5),
> +               "imp_iic_wrap_ap_clock_i2c5", "infra_ao_i2c5", 5),
>         GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C6,
> -               "imp_iic_wrap_ap_clock_i2c6", "infra_ao_i2c_ap", 6),
> +               "imp_iic_wrap_ap_clock_i2c6", "infra_ao_i2c6", 6),
>         GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C7,
>                 "imp_iic_wrap_ap_clock_i2c7", "infra_ao_i2c_ap", 7),
>         GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C8,
> diff --git a/drivers/clk/mediatek/clk-mt8186-infra_ao.c b/drivers/clk/med=
iatek/clk-mt8186-infra_ao.c
> index 837304cd0ed7..c490f1a310f8 100644
> --- a/drivers/clk/mediatek/clk-mt8186-infra_ao.c
> +++ b/drivers/clk/mediatek/clk-mt8186-infra_ao.c
> @@ -132,7 +132,7 @@ static const struct mtk_gate infra_ao_clks[] =3D {
>         GATE_INFRA_AO2(CLK_INFRA_AO_AUDIO_26M_BCLK, "infra_ao_audio26m", =
"clk26m", 4),
>         GATE_INFRA_AO2(CLK_INFRA_AO_SSUSB_TOP_P1_HCLK, "infra_ao_ssusb_p1=
_hclk", "top_axi", 5),
>         GATE_INFRA_AO2(CLK_INFRA_AO_SPI1, "infra_ao_spi1", "top_spi", 6),
> -       GATE_INFRA_AO2(CLK_INFRA_AO_I2C4, "infra_ao_i2c4", "top_i2c", 7),
> +       GATE_INFRA_AO2(CLK_INFRA_AO_I2C4, "infra_ao_i2c4", "infra_ao_i2c_=
ap", 7),
>         GATE_INFRA_AO2(CLK_INFRA_AO_MODEM_TEMP_SHARE, "infra_ao_mdtemp", =
"clk26m", 8),
>         GATE_INFRA_AO2(CLK_INFRA_AO_SPI2, "infra_ao_spi2", "top_spi", 9),
>         GATE_INFRA_AO2(CLK_INFRA_AO_SPI3, "infra_ao_spi3", "top_spi", 10)=
,
> @@ -145,7 +145,7 @@ static const struct mtk_gate infra_ao_clks[] =3D {
>         GATE_INFRA_AO2_FLAGS(CLK_INFRA_AO_SSPM, "infra_ao_sspm", "top_ssp=
m", 15, CLK_IS_CRITICAL),
>         GATE_INFRA_AO2(CLK_INFRA_AO_SSUSB_TOP_P1_SYS,
>                        "infra_ao_ssusb_p1_sys", "top_ssusb_1p", 16),
> -       GATE_INFRA_AO2(CLK_INFRA_AO_I2C5, "infra_ao_i2c5", "top_i2c", 18)=
,
> +       GATE_INFRA_AO2(CLK_INFRA_AO_I2C5, "infra_ao_i2c5", "infra_ao_i2c_=
ap", 18),
>         GATE_INFRA_AO2(CLK_INFRA_AO_I2C5_ARBITER, "infra_ao_i2c5a", "top_=
i2c", 19),
>         GATE_INFRA_AO2(CLK_INFRA_AO_I2C5_IMM, "infra_ao_i2c5_imm", "top_i=
2c", 20),
>         GATE_INFRA_AO2(CLK_INFRA_AO_I2C1_ARBITER, "infra_ao_i2c1a", "top_=
i2c", 21),
> @@ -167,7 +167,7 @@ static const struct mtk_gate infra_ao_clks[] =3D {
>                              CLK_IS_CRITICAL),
>         GATE_INFRA_AO3_FLAGS(CLK_INFRA_AO_SSPM_32K_SELF, "infra_ao_sspm_3=
2k", "clk32k", 4,
>                              CLK_IS_CRITICAL),
> -       GATE_INFRA_AO3(CLK_INFRA_AO_I2C6, "infra_ao_i2c6", "top_i2c", 6),
> +       GATE_INFRA_AO3(CLK_INFRA_AO_I2C6, "infra_ao_i2c6", "infra_ao_i2c_=
ap", 6),
>         GATE_INFRA_AO3(CLK_INFRA_AO_AP_MSDC0, "infra_ao_ap_msdc0", "top_a=
xi", 7),
>         GATE_INFRA_AO3(CLK_INFRA_AO_MD_MSDC0, "infra_ao_md_msdc0", "top_a=
xi", 8),
>         GATE_INFRA_AO3(CLK_INFRA_AO_MSDC0_SRC, "infra_ao_msdc0_clk", "top=
_msdc50_0", 9),
> --
> 2.42.0
>

