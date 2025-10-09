Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6209BCCD183
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Oct 2025 07:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NATA04lG9cqYNuKN4V/mGz7RayXhel8O3qk+QILIDN0=; b=tWQePTYLRiPFhBSbNOsUhV4TcJ
	Tgv84f/Li1hAmcPOAI1FS+0A6QxSyiK1Z5oGeHpIT/mApDBKJoZj5ceUcT6dJCgfwCEymuKIHP1sF
	DUz1+1X1FPrq3CTnwPCWjOV2QJHthlpLZ6ltwSrx1QRJDT6bwyRwBbL2xJFWCXToOboI/18ep5x7r
	ejWAiO+I7BDBjOJSf/AP42JQqEFDLd4LnYCQ6V3a67Xow0KNH5Aq9wJthV6JQUP8Zsq+rKwaUFyJL
	VSp2BG+aTIpLHC1IFzPlIH7z4VyiXwHrYHXNJ/ZHUosj0nt/ndCpu7JFaRPEpS3GZxEARgWttCD/Q
	+8v6BsSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l9f-00000005Nu5-3sqq;
	Thu, 09 Oct 2025 07:33:39 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l9b-00000005Ns9-0vqu
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Oct 2025 07:33:37 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-36453927ffaso4820271fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Oct 2025 00:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759995213; x=1760600013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NATA04lG9cqYNuKN4V/mGz7RayXhel8O3qk+QILIDN0=;
        b=Rwpv8qQ0b82PYO/SDc8w2uowKbVjKZQt4uhCVcN5oj9/coilsEuBKEY2qlol+ub+2E
         QIxwA6Gc5E6Xy5vHTL1bzx5TP+zIgMopu7cdJhhnpicL1Vhkkry2NuJUvWH5k/UvlDWM
         yVfuSVekBjd7nj2K4NkLPyr5KBAehXQVfHvKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759995213; x=1760600013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NATA04lG9cqYNuKN4V/mGz7RayXhel8O3qk+QILIDN0=;
        b=XhTxIllrICpG2SCCIrbIwUr01YuTNAxHEGWt8LUxu89h9qudXTPMKhU5HSB7xCXAip
         rt7QyiS1/I1XEo1nc5Zql9W/C8KWP2Z3g1NlaJsJ3m3UhnNt8OQUZBHAUIAKYG5p+dMN
         0yymMk8JsLO9DWeFMtA24h6YJ6o5zOENlxn5LKSDIfpOLV9f7MtDcQ3al83wCLSL9A9i
         syK8PxSMwW0Iy3TvXMmKD59PqjL5vLrhDfsL6dx9zcMraLGfMTipJt3fn+flp/1fQSb0
         sptbJ9SATeThJk8D+WwDR9L3my8rDc60liD+h1xFumSuJHDNdBbq3H8XIRYfP4MTiUmF
         4gCA==
X-Forwarded-Encrypted: i=1; AJvYcCWQGZy88CCkXWWclBruuZzrVGh5WuRw5xT2/krIBO0O93tzaJI4lWOoory39DXkP7Atq5sjQ/ZFuJ3dO0yByg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYAo+8C1Ta6ET+Y9xAi6VqKR2MMIThTepCcjKTIxOirmWZ6Rcy
	w6IEAHc7qI3DGCvr5APocWLO1CrPWKu8G1s54/AaYoiVF7SbDMq4REABc7BuCN1W1GZKOyziQxm
	VdyjlG/HbFBauCSgue6r7t6M4w7mMui6rnIMBGWD0
X-Gm-Gg: ASbGncsuLQu2pR7+jb4CM/cSOHLgjIZeFz7hfoBsXonceLO/IKR6j1FGqNzZXIkNzYu
	uHYVkddX5kqV5aM1TxGLofwfSsRnlWBkmaCNCTkgt3+kzw9aictWMeYSrmioVdEcFcCL8HiFLlE
	mn2nqXwLtxR7/jcj3TX2YMXsfqFbiNky+4lNu42FmCwrhMmc59Xx89uVEZJgWB9T10d+k9fjF3u
	fxMW5qPzjeu1o7UUaYC1W8WHcj0U2MwMylLC9S6qg99N17LwPT6HENAF/+9vQ==
X-Google-Smtp-Source: AGHT+IF6m8ACDaU9hzMk8xdqL2Q2Hbks2uUt6Iy3PDX+KKlJyzdC/zfk13eIYMHbsDIcLqn07l/Zwc+Zn356g2up4Tk=
X-Received: by 2002:a2e:be9a:0:b0:337:f1d7:d500 with SMTP id
 38308e7fff4ca-37609d953b8mr16127351fa.18.1759995213025; Thu, 09 Oct 2025
 00:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-4-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-4-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 15:33:22 +0800
X-Gm-Features: AS18NWDCKGPR4MxJLy6Y5o4fyCGycMwSUzGQZN0AhucPrjjtAqoX3WiLmZowTiU
Message-ID: <CAGXv+5Hpndq09cbudofSvkNE6w+tHb85VCqDb3P920S8vwonHQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: mediatek: Refactor pllfh registration to pass device
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_003335_324552_790073F4 
X-CRM114-Status: GOOD (  18.63  )
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

On Thu, Oct 9, 2025 at 12:06=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> After refactoring all of PLL to pass the device, it's now fairly easy to
> refactor pllfh and its users, as pllfh registration wraps PLL
> registration.
>
> Do this refactor and move all of the pllfh users to pass the device as
> well.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt6795-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 14 +++++++-------
>  drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-pllfh.c             | 13 ++++++++-----
>  drivers/clk/mediatek/clk-pllfh.h             |  2 +-
>  7 files changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt6795-apmixedsys.c
> index 91665d7f125efde4941cc4de881c5b503a935529..123d5d7fea8554676364dc56f=
5c023e43325d516 100644
> --- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> @@ -152,7 +152,7 @@ static int clk_mt6795_apmixed_probe(struct platform_d=
evice *pdev)
>                 return -ENOMEM;
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
> -       ret =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       ret =3D mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls),
>                                       pllfhs, ARRAY_SIZE(pllfhs), clk_dat=
a);
>         if (ret)
>                 goto free_clk_data;
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8173-apmixedsys.c
> index 95385bb67d5511eda3a851f81986e67eaf81e5fb..d7d416172ab35bc027ae67c16=
3c1dc20dee857b6 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -140,13 +140,13 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_apmixed=
);
>  static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>  {
>         const u8 *fhctl_node =3D "mediatek,mt8173-fhctl";
> -       struct device_node *node =3D pdev->dev.of_node;
>         struct clk_hw_onecell_data *clk_data;
> +       struct device *dev =3D &pdev->dev;
>         void __iomem *base;
>         struct clk_hw *hw;
>         int r;
>
> -       base =3D of_iomap(node, 0);
> +       base =3D of_iomap(dev->of_node, 0);
>         if (!base)
>                 return -ENOMEM;
>
> @@ -157,25 +157,25 @@ static int clk_mt8173_apmixed_probe(struct platform=
_device *pdev)
>         }
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> -                                   pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
> +       r =3D mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls), pllfhs=
,
> +                                   ARRAY_SIZE(pllfhs), clk_data);
>         if (r)
>                 goto free_clk_data;
>
>         hw =3D mtk_clk_register_ref2usb_tx("ref2usb_tx", "clk26m", base +=
 REGOFF_REF2USB);
>         if (IS_ERR(hw)) {
>                 r =3D PTR_ERR(hw);
> -               dev_err(&pdev->dev, "Failed to register ref2usb_tx: %d\n"=
, r);
> +               dev_err(dev, "Failed to register ref2usb_tx: %d\n", r);
>                 goto unregister_plls;
>         }
>         clk_data->hws[CLK_APMIXED_REF2USB_TX] =3D hw;
>
> -       hw =3D devm_clk_hw_register_divider(&pdev->dev, "hdmi_ref", "tvdp=
ll_594m", 0,
> +       hw =3D devm_clk_hw_register_divider(dev, "hdmi_ref", "tvdpll_594m=
", 0,
>                                           base + REGOFF_HDMI_REF, 16, 3,
>                                           CLK_DIVIDER_POWER_OF_TWO, NULL)=
;
>         clk_data->hws[CLK_APMIXED_HDMI_REF] =3D hw;
>
> -       r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_dat=
a);
> +       r =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,=
 clk_data);
>         if (r)
>                 goto unregister_ref2usb;
>
> diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8186-apmixedsys.c
> index 4b2b16578232d986f78deed4778c5fab7f460184..d35dd2632e43ab535b32b8b99=
f8d75de02d56fe2 100644
> --- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
> @@ -151,7 +151,7 @@ static int clk_mt8186_apmixed_probe(struct platform_d=
evice *pdev)
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
>
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       r =3D mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
>                                     pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
>         if (r)
>                 goto free_apmixed_data;
> diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8192-apmixedsys.c
> index 0b66a27e4d5ac68f09dc6a4197fd84ef82342df9..b0563a285bd666d492a7fa940=
733aad1ab1a0bae 100644
> --- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> @@ -162,7 +162,7 @@ static int clk_mt8192_apmixed_probe(struct platform_d=
evice *pdev)
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
>
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       r =3D mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
>                                     pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
>         if (r)
>                 goto free_clk_data;
> diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8195-apmixedsys.c
> index 282a3137dc89419a6d0b574fd549cee941687900..44917ab034c56f01ef02d1957=
f17eb0655438d75 100644
> --- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> @@ -181,7 +181,7 @@ static int clk_mt8195_apmixed_probe(struct platform_d=
evice *pdev)
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
>
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       r =3D mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
>                                     pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
>         if (r)
>                 goto free_apmixed_data;
> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-=
pllfh.c
> index 62bfe4a480f14a0a742fb094aff0e6d1a79fe0c3..8ad11023d91127e88900bc6bc=
abbaeafb1e00664 100644
> --- a/drivers/clk/mediatek/clk-pllfh.c
> +++ b/drivers/clk/mediatek/clk-pllfh.c
> @@ -10,6 +10,7 @@
>  #include <linux/slab.h>
>  #include <linux/clkdev.h>
>  #include <linux/delay.h>
> +#include <linux/device.h>

This shouldn't be needed, as you aren't using any of the APIs.

A forward declaration of |struct device| in the header should suffice.
It should be added anyway, since the header defines data structures that
have a |struct device *| field.


ChenYu

