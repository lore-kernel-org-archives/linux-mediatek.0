Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF971CFC500
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 07:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QU12UzpgqRbbbtAMZe9QorlWm8OXzhMHZ1TfI8T6l4g=; b=YB/G/UlZHjLO+nYyHmVcxbQKB4
	nEEvK9HYrsU67z9Eeqc41dywfDBVu5hvWYIvozdiPAMxMDBHVFFxZyjC9BXvV2daSPQddg0elIQ6a
	2IXPs4PbiD48MkU4ixIBqPun186hT8Jl6aTV8y5iJoMOeAwSoH263dV96sdNuTws6s6/wMB7/sEK8
	2aX7m2GAWj5RMIXNWDL1Yd2DqxQvR7CCG8Wr0Y1ucFIz5QhLoWmFLgAWUhXPMOhjr3ygvgNqRAUgJ
	cy83lZDT/RJnj2KLfQWRZty1bn8itpdlpBBe+NCeTy9MRRSu6tPaFmdAs2Azv0qukUfzYhvFCixKT
	Yr+MIcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Fz9-00000004B6t-1nHd;
	Mon, 14 Oct 2024 07:59:23 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Fv4-000000049na-3IZE
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 07:55:12 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-84fd50f2117so1002198241.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 00:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728892508; x=1729497308; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QU12UzpgqRbbbtAMZe9QorlWm8OXzhMHZ1TfI8T6l4g=;
        b=fVceCJDr16cFSXO4qDN09DHlHyLyZJut61zOI38ZLcydw7fjMFybWWuAHbPyMyP3xV
         cErQiub/HhDT1bvHH78Dr+/zdcDMzOkJYJpk+OTyDMVkiRxO3I9IdtYYO9AhRqZxEviT
         SBr7o4qRCtyIqg2z6gUz3+kH19A4TcUp/EoUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728892508; x=1729497308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QU12UzpgqRbbbtAMZe9QorlWm8OXzhMHZ1TfI8T6l4g=;
        b=YIW/13vk8J60EPA92Yv8AZ8ChQ+Vac6kFOjvZmDPucby4Cv2sDfetKd3j11z0T9FNX
         Up17BR15etUg8V8ZiCa/W6Zh1ippoqLFVEDIfDT2wuoqHd8bQBNni7zitwZs7cKa8rtv
         XanZ18ak9AMY3NM3mZjQR/Nkqg3yWBr7NbfG9MCL6q38kACqUuc2JJotzfAkuRekQUHU
         Vit5P8893Jg+WDgPLUibPkT9asIjwyaRGa/KASOFHM+Dvg47MsDrLPEH3TFdLkrsfwvo
         j7EHL5RqdqkLMIRrPYXIDEw3AEgbCbkn6UrBqwpanycW5kj1SJFKSrOukWr+I6ZTY6A0
         3N5g==
X-Forwarded-Encrypted: i=1; AJvYcCXYL0tc4Vwt/cYtT7/2krvGOwQFgpdgTHu35WrT2B8Bev/9zT0zIAR+FvsirILs8xeudLLlN5brTL3IKzlgPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg8v/1JAjb3XXG9WoC/lj91mK3S+U3jA8nwQouUJ9MseoKzSs2
	SoFxnZEOBET+u2y9kHNdXR60v20McscKKN4CYwVSgJg68WVeIy8dVbRrg5MNSbsMy/yPjjzKXbA
	=
X-Google-Smtp-Source: AGHT+IHin1i94IcA7SthwCJJR4eCq9Nh0P2INSVMF3OWSQCFyz/hVHm7Ni/ZUwu8J3/wvZzp1h2lUA==
X-Received: by 2002:a05:6102:510f:b0:4a4:8bcc:cf6c with SMTP id ada2fe7eead31-4a48bccd62bmr1195204137.19.1728892507697;
        Mon, 14 Oct 2024 00:55:07 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84fd338ea65sm1512622241.21.2024.10.14.00.55.06
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 00:55:06 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4a46d662fccso683162137.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 00:55:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6Cg0WMRXJ3fPJaVxbFYyTPpRhYudjx3UBpDq/qgjsDdW21z69QiNiPyIDjEOk7AEjFyeZSGaw7brgzkVA1A==@lists.infradead.org
X-Received: by 2002:a05:6102:6c3:b0:4a3:ddc5:37a4 with SMTP id
 ada2fe7eead31-4a465992f5fmr6744394137.11.1728892506439; Mon, 14 Oct 2024
 00:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240923132521.22785-1-liankun.yang@mediatek.com>
In-Reply-To: <20240923132521.22785-1-liankun.yang@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 14 Oct 2024 15:54:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhp4DUSCTs84Rukao6=ptawaDNWokbaKXs6uZnW1bX1yQ@mail.gmail.com>
Message-ID: <CAC=S1nhp4DUSCTs84Rukao6=ptawaDNWokbaKXs6uZnW1bX1yQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/mediatek: Fix get efuse issue for MT8188 DPTX
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, 
	shuijing.li@mediatek.com, jitao.shi@mediatek.com, mac.shen@mediatek.com, 
	peng.liu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_005510_855702_EDA21A2F 
X-CRM114-Status: GOOD (  19.70  )
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

On Mon, Sep 23, 2024 at 9:26=E2=80=AFPM Liankun Yang <liankun.yang@mediatek=
.com> wrote:
>
> Update efuse data for MT8188 displayport.
>
> The DP monitor can not display when DUT connected to USB-c to DP dongle.
> Analysis view is invalid DP efuse data.
>
> Fixes: 350c3fe907fb ("drm/mediatek: dp: Add support MT8188 dp/edp functio=
n")
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>

Tested on MT8188-based Lenovo Chromebook Duet 11.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>


> ---
> Changes in V5:
> - No change.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240905124041.=
3658-1-liankun.yang@mediatek.com/
>
> Changes in V4:
> - Remove excess newlines.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240903121028.=
20689-1-liankun.yang@mediatek.com/
>
> Changes in V3
> - Update change log position in commit message.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240902133736.=
16461-1-liankun.yang@mediatek.com/
>
> Changes in V2
> - Add Fixes tag.
> - Update the commit title.
> - Update the commit description.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240510061716.=
31103-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 85 ++++++++++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index d8796a904eca..f2bee617f063 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -145,6 +145,89 @@ struct mtk_dp_data {
>         u16 audio_m_div2_bit;
>  };
>
> +static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX]=
 =3D {
> +       [MTK_DP_CAL_GLB_BIAS_TRIM] =3D {
> +               .idx =3D 0,
> +               .shift =3D 10,
> +               .mask =3D 0x1f,
> +               .min_val =3D 1,
> +               .max_val =3D 0x1e,
> +               .default_val =3D 0xf,
> +       },
> +       [MTK_DP_CAL_CLKTX_IMPSE] =3D {
> +               .idx =3D 0,
> +               .shift =3D 15,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0] =3D {
> +               .idx =3D 1,
> +               .shift =3D 0,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1] =3D {
> +               .idx =3D 1,
> +               .shift =3D 8,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2] =3D {
> +               .idx =3D 1,
> +               .shift =3D 16,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3] =3D {
> +               .idx =3D 1,
> +               .shift =3D 24,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0] =3D {
> +               .idx =3D 1,
> +               .shift =3D 4,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1] =3D {
> +               .idx =3D 1,
> +               .shift =3D 12,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2] =3D {
> +               .idx =3D 1,
> +               .shift =3D 20,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3] =3D {
> +               .idx =3D 1,
> +               .shift =3D 28,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +};
> +
>  static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX=
] =3D {
>         [MTK_DP_CAL_GLB_BIAS_TRIM] =3D {
>                 .idx =3D 3,
> @@ -2771,7 +2854,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_susp=
end, mtk_dp_resume);
>  static const struct mtk_dp_data mt8188_dp_data =3D {
>         .bridge_type =3D DRM_MODE_CONNECTOR_DisplayPort,
>         .smc_cmd =3D MTK_DP_SIP_ATF_VIDEO_UNMUTE,
> -       .efuse_fmt =3D mt8195_dp_efuse_fmt,
> +       .efuse_fmt =3D mt8188_dp_efuse_fmt,
>         .audio_supported =3D true,
>         .audio_pkt_in_hblank_area =3D true,
>         .audio_m_div2_bit =3D MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0=
_DIV_2,
> --
> 2.45.2
>
>

