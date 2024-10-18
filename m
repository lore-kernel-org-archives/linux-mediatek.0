Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE7AD3C549
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 05:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fb5KpeBreuXFeJ6C2dlxdkF/AtWXYD7eWJb+jZNVASw=; b=Za48ErFAXv4dVI0qV/31HFTrQq
	Xmeh/DPMRoqo/V/bRnufjf8+1xn3PBWzcyLVC9HS9lWP+qvCg8E91pZMzK8MnF3o+yT4cz648Llj4
	1G0krbz5H0ceAaojpUPcH+BVuXtbTWyPmcxdhdpDat5c4Xcqb8pKEtHgl7OmtA6dAFT2v02gB59VQ
	o/LmaMQwiWQFEBd8NdQY16G+Pm+kpY5NU7g1m5r4l6nTscH2eJOCdrFaMPAaPyOjuucdXZkFXIigk
	LeFmSY+05rCeZlMW1Pf48Kh+5hHp7my7BQbXUfUb2iajsqaB8O5bgHNHRPIqD3QzfhWmZdbGoHSBM
	tNZ/0dKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1fOX-0000000Gx41-0wzz;
	Fri, 18 Oct 2024 05:19:25 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1fN3-0000000GwqL-3mhh
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 05:17:55 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539f58c68c5so2752540e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Oct 2024 22:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729228672; x=1729833472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fb5KpeBreuXFeJ6C2dlxdkF/AtWXYD7eWJb+jZNVASw=;
        b=RCIvnfjolovsUD7J0t5P0UJYt22OIvRnMAOM7Q3SW9IxfwzlKU0IdEw9A2IubqY7R4
         Lb7JlfW1gfRykxn3szeqfhjhmO34gKFUetJ76cLFDwxEkyJWpDuoczszct1K8a4Dh74k
         ub6Ea2dlIuQvb432F7daJj/XwoF0cUEV6puYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729228672; x=1729833472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fb5KpeBreuXFeJ6C2dlxdkF/AtWXYD7eWJb+jZNVASw=;
        b=MdSEsWfBeYtCoAv/AUCxAad9WejXDz1GjTurCQdcoRlSS74rYyWbx8512j+/NwQT8E
         C/1l7LclXYTA8juchk3VllbB5WMgBHh3kfJcpjup+Me//CE8G+NC4gSxuJZD4FQ1DTzl
         aY3KdNVHS5oEk0IkYVcwzuQR1515q/RyXs+SxU7xS+9bV5J5mLnUOdfrU6H7OohnFUkB
         6n/wJxCn5QHJzL3c0hPKc4ixn9t2+BQM3AOs7bkU9IaMx5ko8JHlAbNRK9algfxqurOG
         Gk5rra8SxJliKETqXuynjDH8Ynedt50+d9hflQHIXE8T6Su8xgGf+5U7OzrO8UuS9cTX
         S8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXshcAqQGWO+ATW5diPj9vjL1GPfdIFs07TwVO2Rh7CPX52ClD8iN1cg8NeXDub42Y6w70nHojEfQQMYApG2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAc2nePbbSfW0aegQNGizc828IwMkVw8tg0Pg1gDcSIzDqojSO
	eJLE7LkowJK7golHBiaS6UB0URn9B8xa4VkOpQndW5jE86Ck/EkByXObJ2spnV++XOvuuiFbA/c
	rA0caHypMF0H86xAMcNuTMiX6lBLn2U2Nsn9e
X-Google-Smtp-Source: AGHT+IEMrNDmylr1CfjI1xQ5P74wl/iIOo4f+1YA243FTpzmnuRjnMreynnJtzQcXTFfSx2gj46cObeu9tjEebZJfM4=
X-Received: by 2002:a05:6512:104f:b0:533:4497:9f29 with SMTP id
 2adb3069b0e04-53a154704d2mr806562e87.31.1729228671134; Thu, 17 Oct 2024
 22:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241017091238.180920-1-bo.ye@mediatek.com> <20241017091410.181093-1-bo.ye@mediatek.com>
In-Reply-To: <20241017091410.181093-1-bo.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Oct 2024 13:17:40 +0800
Message-ID: <CAGXv+5ESMm3t_kJckubDf4jMLYehz66o8B42sTTM=vEF1WMpCA@mail.gmail.com>
Subject: Re: [RESEND. PATCH v1] pinctrl: mediatek: paris: Revert "Rework
 support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE"
To: Bo Ye <bo.ye@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yongdong Zhang <yongdong.zhang@mediatek.com>, Xiujuan Tan <xiujuan.tan@mediatek.com>, 
	Browse Zhang <browse.zhang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>, 
	Evan Cao <ot_evan.cao@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_221753_947874_ADC31CA5 
X-CRM114-Status: GOOD (  23.51  )
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

On Thu, Oct 17, 2024 at 5:14=E2=80=AFPM Bo Ye <bo.ye@mediatek.com> wrote:

Please avoid sending more than one version per day. Most people in
the community are not in the Asian time zones. Give people time
to respond.

> [This reverts commit c5d3b64c568a344e998830e0e94a7c04e372f89b.]
>
> For MTK HW,
> 1. to enable GPIO input direction: set DIR=3D0, IES=3D1
> 2. to enable GPIO output direction: set DIR=3D1, and set DO=3D1 to output=
 high, set DO=3D0 to out low
>
> The PIN_CONFIG_INPUT/PIN_CONFIG_OUTPUT/PIN_CONFIG_INPUT_ENABLE/PIN_CONFIG=
_OUTPUT_ENABLE shall
> be implemented according to view of its purpose - set GPIO direction and =
output value (for
> output only) according to specific HW design.
>
> However, the reverted patch implement according to author's own explanati=
on of IES without
> understanding of MTK's HW. Such patch does not correctly set DIR/IES bit =
to control GPIO
> direction on MTK's HW.
>
> Fixes: c5d3b64c568 ("pinctrl: mediatek: paris: Rework support for PIN_CON=
FIG_{INPUT,OUTPUT}_ENABLE")

As Macpaul mentioned, you changed the commit message by adding a tag, and
thus this patch should be marked "v2". Please also provide a changelog
on what changed in this version in the footer, i.e. under the "---" line
but before the actual patch context.

ChenYu

> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> Signed-off-by: Evan Cao <ot_evan.cao@mediatek.com>
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 38 +++++++++++++++++-------
>  1 file changed, 27 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/m=
ediatek/pinctrl-paris.c
> index 87e958d827bf..a8af62e6f8ca 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -165,21 +165,20 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctl=
dev,
>                 err =3D mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &r=
et);
>                 break;
>         case PIN_CONFIG_INPUT_ENABLE:
> -               err =3D mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_IES, &=
ret);
> -               if (!ret)
> -                       err =3D -EINVAL;
> -               break;
> -       case PIN_CONFIG_OUTPUT:
> +       case PIN_CONFIG_OUTPUT_ENABLE:
>                 err =3D mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &=
ret);
>                 if (err)
>                         break;
> +               /*     CONFIG     Current direction return value
> +                * -------------  ----------------- ---------------------=
-
> +                * OUTPUT_ENABLE       output       1 (=3D HW value)
> +                *                     input        0 (=3D HW value)
> +                * INPUT_ENABLE        output       0 (=3D reverse HW val=
ue)
> +                *                     input        1 (=3D reverse HW val=
ue)
> +                */
> +               if (param =3D=3D PIN_CONFIG_INPUT_ENABLE)
> +                       ret =3D !ret;
>
> -               if (!ret) {
> -                       err =3D -EINVAL;
> -                       break;
> -               }
> -
> -               err =3D mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DO, &r=
et);
>                 break;
>         case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
>                 err =3D mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &=
ret);
> @@ -284,9 +283,26 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctld=
ev, unsigned int pin,
>                         break;
>                 err =3D hw->soc->bias_set_combo(hw, desc, 0, arg);
>                 break;
> +       case PIN_CONFIG_OUTPUT_ENABLE:
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
> +                                      MTK_DISABLE);
> +               /* Keep set direction to consider the case that a GPIO pi=
n
> +                *  does not have SMT control
> +                */
> +               if (err !=3D -ENOTSUPP)
> +                       break;
> +
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
> +                                      MTK_OUTPUT);
> +               break;
>         case PIN_CONFIG_INPUT_ENABLE:
>                 /* regard all non-zero value as enable */
>                 err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !=
!arg);
> +               if (err)
> +                       break;
> +
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
> +                                      MTK_INPUT);
>                 break;
>         case PIN_CONFIG_SLEW_RATE:
>                 /* regard all non-zero value as enable */
> --
> 2.17.0
>

