Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEA5C87FCF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Aug 2025 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpOqTr/H8i5iWZL4dLpviHUqjl+PiTBlvfyP9LcDKi4=; b=BVM5h6HEgq3QJlYyrhzCbM3ofn
	xfloZ+Ni9giHJlRzqrd70WVMSPtO6RGiffyBgeWBCDv+g0v2ek1iW0hZCz0vqBHZ6xjxz9GFB12cu
	ulwNcMDnbeNGgqwA9YpQeD9JxWS/IC+H8KyTghA7CH+HSGOJ1kLBsdbzgOWI2mxvQzPY1+zF8wRmF
	m+tyhEB1lp7j/D8VVnFdVRj5JSV96Q1H7jd7U3GKH1m8WgqR3TwS3tKO0fNwN5Nnz1JagIteXy9lx
	5JpO3pi2/gws3lo2TwfSM85T0TfGegoEF8PIwEgubOGso94y6ltoHqAEG0bT1F/Rlasw2mAkw5l3O
	7THt33Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8iz-0000000DNhF-2g83;
	Wed, 13 Aug 2025 10:28:53 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8KT-0000000DJZr-0Mqr
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Aug 2025 10:03:34 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-88d89eaf08dso4955086241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Aug 2025 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755079411; x=1755684211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpOqTr/H8i5iWZL4dLpviHUqjl+PiTBlvfyP9LcDKi4=;
        b=ikdXGVRp6PwYJhmPjCqktI8TQC0mOBMGVlYJHTGM9++erUCyQK99HDiLxT/a/fyJ8a
         kEVk/B2zfhHyj0yrHX+iKu0+BQaIC6d4pWW0GXL3AGDlBp4bXy3bzodFnNra6oMsJ5bX
         fp8BfMasI3q6SbgYKmyDYH7+e7xGQvepzU6Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079411; x=1755684211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpOqTr/H8i5iWZL4dLpviHUqjl+PiTBlvfyP9LcDKi4=;
        b=c2FqeDep1d6pUCfxbxm/o0abwcwhcvRTwjQneMjfC+8wuEtmJ1J/ukOo/TqSmngufa
         VTxBzs3VQksRko8K0Jea+qztlxSNscewOIiNopIX14XBnlsbjtdNHxX6yQvjBpsBZhc5
         vIktVkVjxlCwgbKFcqlYhJacprbXsr5SKAJX+QphqM3lEmZQs9P+Ke/kehh+Yk7lAw6z
         lIm87u+9nDzvjnoh0a3Xm1YqSq20l9MqRn2RpxWfj1vmXMvPqNf7FbHG1UAN4wdx7dER
         7BxvcgzJLC5G2JFyRMZjQP0258zyLh+uombkVt9waJxddJsNwgzuFxnjaJTiEuW0UFlD
         7SEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRpMTwgB0N1eE9q5ZCKhnsKN0NgA4HY6SWiTdhQ3pQDwMdxT1Vc/MKs5mzpg90aHPhaz47w6lHUVnQqOKsbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsIMShkWeDBQac9qN0/dA1kJ7HlfF8MNgBSy1K/hzgV2rWm+uO
	/5CP+HOcy9fMK2ocn8NvxngSj+5n69EilQ5PyOTPsfN2rqdeTr4moj6RlRdJ+ERZEf5yud0Ih6J
	+O4c=
X-Gm-Gg: ASbGncvVIW8yglMZIGPa3Q8qonY8EVKnwzB1l+BbmB8J6I0S8khK6ShqI+ImZqYzVmE
	a7MHA9MaShyiyWfz7RLut+50TWaI1uc8BjjQzwYG0gIQOlV03sVgB5CXV5HCERLxX/xnbtgXr2j
	vci8U9RQnJDmbQAe+YxefYFOjKpybh8R0nCX5oJnUNY1L8Y9D4SZPJsXQF/+A9WRKZil5asH5l9
	h3bCwnz5+CbTj0hKZTQHiJvuFSU7+6e75pkw4AMrUI4oBTyqo4FxEpMCZzQDxaU3pBE3B2cbOC9
	2/vqYyIQlkYlcAcN3fzz3HKOowhAyxAespzba2k3YAhLyA7A2lI2XpUtmyvX/qPmW4av6KX26Nc
	pd9Hdr0nJnh1lw9rtMTdSIJeZGrzftnJ409KR3YSlFOWGDVTlwGJnpW8Fnw==
X-Google-Smtp-Source: AGHT+IGGND0H4YlBZkHNKZEFWuhdA3DWXZGn/PuoM9KFtyi8HH5RBoi1/GbLZeZMDpSNMDLZowvbkA==
X-Received: by 2002:a05:6102:4a8f:b0:4ec:c548:e57b with SMTP id ada2fe7eead31-50e4b4c50c1mr817742137.0.1755079411142;
        Wed, 13 Aug 2025 03:03:31 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88f6ba7bbe0sm334869241.9.2025.08.13.03.03.30
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:03:30 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-88d89eaf08dso4955072241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Aug 2025 03:03:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/BaXjC9dV4DkEezhPR6RwUMPdEacQGJMGY7m6TmnnMkdwurJU31CpfOU6Q4c0vJv9MasQ3uKiLGBor/D9Uw==@lists.infradead.org
X-Received: by 2002:a05:6102:580f:b0:4e5:c51b:ace4 with SMTP id
 ada2fe7eead31-50e5069ec3dmr831455137.20.1755079409916; Wed, 13 Aug 2025
 03:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250812085902.3309160-1-wenst@chromium.org>
In-Reply-To: <20250812085902.3309160-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 13 Aug 2025 18:02:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhG_ExACJRpJoqmO7nn+P24uiaha21SFEyR3aoKL-Pjgw@mail.gmail.com>
X-Gm-Features: Ac12FXxcH53--yUF4XiZyOJVA9MjGchb9U9zLHe6JnSsrI_-dNHmZMaj3Vdi_pE
Message-ID: <CAC=S1nhG_ExACJRpJoqmO7nn+P24uiaha21SFEyR3aoKL-Pjgw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_030333_157638_9BDD9DEB 
X-CRM114-Status: GOOD (  15.33  )
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

On Tue, Aug 12, 2025 at 8:39=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The first SCP core is used to drive the video decoder and encoders.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index c5254ae0bb99..10764786bc21 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -164,6 +164,12 @@ reserved_memory: reserved-memory {
>                 #size-cells =3D <2>;
>                 ranges;
>
> +               scp_mem_reserved: memory@50000000 {
> +                       compatible =3D "shared-dma-pool";
> +                       reg =3D <0 0x50000000 0 0x800000>;
> +                       no-map;
> +               };
> +
>                 apu_mem: memory@55000000 {
>                         compatible =3D "shared-dma-pool";
>                         reg =3D <0 0x55000000 0 0x1400000>;
> @@ -1146,6 +1152,16 @@ &postmask0_out {
>         remote-endpoint =3D <&dither0_in>;
>  };
>
> +&scp_cluster {
> +       status =3D "okay";
> +};
> +
> +&scp_c0 {
> +       firmware-name =3D "mediatek/mt8188/scp.img";
> +       memory-region =3D <&scp_mem_reserved>;

It looks like a pinctrl for SCP_VREQ_VAO (GPIO 98) is missing?
Datasheet says it's for "SCP to PMIC normal voltage request", and
MT8195 and MT8192 also have that configured.

Regards,
Fei

> +       status =3D "okay";
> +};
> +
>  &sound {
>         pinctrl-names =3D "aud_etdm_hp_on", "aud_etdm_hp_off",
>                         "aud_etdm_spk_on", "aud_etdm_spk_off",
> --
> 2.51.0.rc0.215.g125493bb4a-goog
>
>

