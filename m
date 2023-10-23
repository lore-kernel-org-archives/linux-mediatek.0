Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55299C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 07:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJ+L8z2++KdugvZa/TRNkYv4iFz/Yo8vEvV3D34lpNE=; b=vjaACR4afjX3zpyJb+EaUpVoq5
	zfyJ4y2Dl47y7i1arKRmCNg7+fPXw44L/A2e6Zcjgsm5Z1O/UtGXUwBPwP/Vb6kqK7ujcqptbiASU
	sDNHgneVw3QoE5F8lfz/i9FE/6eqbEsRqSiY7shc9I7J9mFHIWjTJT7Va4zMg9QkH8p5qYxRwn2Gx
	EDEaNrpe/lTZeAHE01ZA6uWv2V7VziA0tb0SLESHNRB9cHbZlhEpayuHs96A8VcLo0/3kHU7XOApn
	K/imDz2CQjKx8L0vrZOpab3p91C0f9Xc/FMfyR1malBXLdGsPqaALTDdqxi2W/mg/Jycn+tcTF6Ul
	KUs9rkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quovM-006b7z-0M;
	Mon, 23 Oct 2023 07:00:28 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quovJ-006b6l-2p
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 07:00:27 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507c8316abcso3864373e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 00:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698044420; x=1698649220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJ+L8z2++KdugvZa/TRNkYv4iFz/Yo8vEvV3D34lpNE=;
        b=iqMwR1NitH82m4HH/RhPm6DzJGn0JGzUmC2hWYzqPuo5e+6j1tC3XEKZpI+l/8eXQh
         mFq1SQ9C/i65ZLWHlI8xMLTx/1UhV3h4FLL8CVFfg7jlNsGUWH9QK8FsySsH21RbNCFr
         2D/3MT6BOmtWpxzwuKl/pS6AV5xJLoyR7vAho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698044420; x=1698649220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJ+L8z2++KdugvZa/TRNkYv4iFz/Yo8vEvV3D34lpNE=;
        b=Kx26tN11qsjUUG+3SOnFRICfFw4ZU/FG0vJ//6oJXNAIHRXS0bqhAQLtl3Ab5E4PT3
         G9qAqsgnx+VS3+KSRF2OeW3xdr9oMeYnt9vWSFfYSEm4i7EGKbfE3FMTxec3R08Zz7c7
         v7HEcxWNnsqXGgGhn7ZVxylD8Pu38tbNrEaqTb1npIKdQXWxqNtRaV/NP1ZfKNNN5M/8
         Q7PCUbuYmwxNWYpUTi6j/+GV7kgNhYhsgE6G6vep2c53ednabY3fLXoncSCFWYDHFbj/
         rFEndJc9VFXJNIpfFmW6dclfoAeIURumus7MAPOH4GJx0dGao/L4T122vIIV1jq3vq2D
         5XeA==
X-Gm-Message-State: AOJu0YwP5HXdCPby6iiLdNZTw0rejnr55u+uQIDkrcSxHXQUlUwsH+e4
	e/54syoHAjmmgMWGoW6EIzlgDynuoVOe+GA6ggu/uQ==
X-Google-Smtp-Source: AGHT+IHwxDq3JgGLwq8PRk/AjyW+M05CrhYWE435S1X1mmyZlKTfIy/kiPzAMT03iJC6FZQbnSByYGmjwr2oBHJYVA8=
X-Received: by 2002:a05:6512:4002:b0:507:b911:f869 with SMTP id
 br2-20020a056512400200b00507b911f869mr6888686lfb.43.1698044420324; Mon, 23
 Oct 2023 00:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231018103546.48174-1-angelogioacchino.delregno@collabora.com> <20231018103546.48174-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231018103546.48174-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Oct 2023 15:00:09 +0800
Message-ID: <CAGXv+5EoVnfCLfJ+6t8FiwuJq-eyZQZNh9H+7TD+yGkEWFO3pw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: mediatek: mt8195-topckgen: Refactor parents
 for top_dp/edp muxes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	msp@baylibre.com, amergnat@baylibre.com, yangyingliang@huawei.com, 
	u.kleine-koenig@pengutronix.de, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_000025_950189_3FA61399 
X-CRM114-Status: GOOD (  22.50  )
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

On Wed, Oct 18, 2023 at 6:35=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The top_dp and top_edp muxes can be both parented to either TVDPLL1
> or TVDPLL2, two identically specced PLLs for the specific purpose of
> giving out pixel clock: this becomes a problem when the MediaTek
> DisplayPort Interface (DPI) driver tries to set the pixel clock rate.
>
> In the usecase of two simultaneous outputs (using two controllers),
> it was seen that one of the displays would sometimes display garbled
> output (if any at all) and this was because:
>  - top_edp was set to TVDPLL1, outputting X GHz
>  - top_dp was set to TVDPLL2, outputting Y GHz
>    - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
>      - top_dp is switched to TVDPLL1
>      - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>      - eDP display is garbled
>
> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> able to use the right bit index for the new parents list.
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/clk/mediatek/clk-mt8195-topckgen.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/med=
iatek/clk-mt8195-topckgen.c
> index 5c426a1c94c7..4529255376e9 100644
> --- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
> +++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> @@ -417,15 +417,21 @@ static const char * const pwrmcu_parents[] =3D {


Nit: I'd add a comment saying this list isn't the full list for reasons.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

>  static const char * const dp_parents[] =3D {
>         "clk26m",
> -       "tvdpll1_d2",
>         "tvdpll2_d2",
> -       "tvdpll1_d4",
>         "tvdpll2_d4",
> -       "tvdpll1_d8",
>         "tvdpll2_d8",
> -       "tvdpll1_d16",
>         "tvdpll2_d16"
>  };
> +static const u8 dp_parents_idx[] =3D { 0, 2, 4, 6, 8 };
> +
> +static const char * const edp_parents[] =3D {
> +       "clk26m",
> +       "tvdpll1_d2",
> +       "tvdpll1_d4",
> +       "tvdpll1_d8",
> +       "tvdpll1_d16"
> +};
> +static const u8 edp_parents_idx[] =3D { 0, 1, 3, 5, 7 };
>
>  static const char * const disp_pwm_parents[] =3D {
>         "clk26m",
> @@ -957,11 +963,11 @@ static const struct mtk_mux top_mtk_muxes[] =3D {
>         MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_PWRMCU, "top_pwrmcu",
>                 pwrmcu_parents, 0x08C, 0x090, 0x094, 16, 3, 23, 0x08, 6,
>                 CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
> -       MUX_GATE_CLR_SET_UPD(CLK_TOP_DP, "top_dp",
> -               dp_parents, 0x08C, 0x090, 0x094, 24, 4, 31, 0x08, 7),
> +       MUX_GATE_CLR_SET_UPD_INDEXED(CLK_TOP_DP, "top_dp",
> +               dp_parents, dp_parents_idx, 0x08C, 0x090, 0x094, 24, 4, 3=
1, 0x08, 7),
>         /* CLK_CFG_10 */
> -       MUX_GATE_CLR_SET_UPD(CLK_TOP_EDP, "top_edp",
> -               dp_parents, 0x098, 0x09C, 0x0A0, 0, 4, 7, 0x08, 8),
> +       MUX_GATE_CLR_SET_UPD_INDEXED(CLK_TOP_EDP, "top_edp",
> +               edp_parents, edp_parents_idx, 0x098, 0x09C, 0x0A0, 0, 4, =
7, 0x08, 8),
>         MUX_GATE_CLR_SET_UPD(CLK_TOP_DPI, "top_dpi",
>                 dp_parents, 0x098, 0x09C, 0x0A0, 8, 4, 15, 0x08, 9),
>         MUX_GATE_CLR_SET_UPD(CLK_TOP_DISP_PWM0, "top_disp_pwm0",
> --
> 2.42.0
>

