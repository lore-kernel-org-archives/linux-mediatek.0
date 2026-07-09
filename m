Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161F3C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ma6hRKfHVcSKvMZ+W9JmQfxRE3jzj/ex/cWYq7xYV30=; b=kjfGD+8mZUrkjzwceCwGU8lIFd
	NluXTK/t3H2slJIIGv81OrcdG9UEfK2G+rV/BqR7iVqZV2ElHobYQ5Xzr+hLpvC2F/q0ZMc15ESGh
	e67l2rs9Fsy7OT2OYbihiXxOq2lAyrSPczRCGQ+TisWoz6FTH5GqXVVK9wu9Q0qR+9lLRK22fevEz
	2Yy5AB5JRaLZGT5yjNasI5q1afx8/enZCH74FsiBI5TVvgNm1EN7UISnien5p3Ah3h0cQ/CagD4TO
	rGO9TdFNAZ4w24BWMBC2Ok+DJuphkACpnb/GgVRrptjPrgbdFyZqmbfayua9eBAVnXxnJG+ujvjeH
	4X1Siy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk5q-00000001PeZ-4242;
	Thu, 09 Jul 2026 08:26:50 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk5p-00000001Pdb-0jax
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 08:26:50 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-664d4478a64so2056984d50.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 01:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783585608; cv=none;
        d=google.com; s=arc-20260327;
        b=rgX/gNDt2tfHYdGXGXdQcXMXLe5mieZmbIUjlq/9+Uh8o6DscXEO/gKQeMRrpPo/zj
         24UqwP+xqz3I8zjCCPDre/pYuSIiI6LJQVSlPQ9U688JPLOif6mqzQasoGjgp1D7F5LL
         GfxuDWXWNA8gGFx63Rzo1cDDAFNkT//uof4sNzCFsfxmtpySTn14SDQOrPpBkaa6ZQ82
         cnuU5MqvrQ2vOTgC6L9N/tH6kv0OBgfwS2L4/jYTZq5JpTo5rs6wMrB2PeFu+yC1DaCA
         4iiQGXAAXBIa62h5lu/7rQvgiDPjw9nk2OeLil1WSq75izeZyR0Lgl/UkG3CUnD6y/y0
         NETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ma6hRKfHVcSKvMZ+W9JmQfxRE3jzj/ex/cWYq7xYV30=;
        fh=Sqji2zpAL6gXwpYayHmL1k51BpgiEiJ2oyCs1RsGbco=;
        b=CnWttOHMMmzealhFmiQJmvUgFUfq9az1sCieJUC4oOBLnT9AowPP7mJpSeOiZvAeq8
         3aTKgG3ztzSIwrm3QRv83qw/2WfJ1YYBTcIm8F6gRwhxrNhRt3rMquQt4CkxAOeBHxd7
         fa6AaO8zJpFR8p4PPa2agLeabrVTvlzsY/Mv0PBvlExKNillxztMnpZ8vSnn9hzKn4Nm
         Zgtg2IILkNq8T79jxlTYzbjJvDQrinhaLNnk7SOSFigZ17Sb2YtoPw5R9R0mvQQw5Bgt
         6y2XpPE92b6dbAGAXEbbCKs0sCbZVss3BzrvXGlgwP0bpFVRxdwnrAi1SMiT6vC1aKln
         PaDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783585608; x=1784190408; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ma6hRKfHVcSKvMZ+W9JmQfxRE3jzj/ex/cWYq7xYV30=;
        b=QbhGtt4FZzXgmXIoN4REyHSnskNaZFFblPeb8adsVft/BUIX+6c+qKkFMcztPfLlvH
         3sjkbXoj4v1hFXAktrf7uYXrHaiWtUTAJ5iFEgQPeWbVjsN0HRuwF9gzZ7PaOHmGFmc/
         1VcJgqunSdeecLOtMA6PkptLFLXy2DYQMjsVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585608; x=1784190408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ma6hRKfHVcSKvMZ+W9JmQfxRE3jzj/ex/cWYq7xYV30=;
        b=ilwnNO7irW5gI1CcaxP33Ov0gv7RsIyRIUM2GB2nSVLZ5T7tpuZia4VlufEM5mA8jW
         Nay5fC1E2643PVLV9AXgVJcfEbqZQrz7/WZlPT0aVplTAF5/7eyUiBbhOu8NtzxYBpMt
         CZ/zFboXpC9LTMBoPX6T9ypX3+XrGBHtpSKn1HznWR0MyPifgdCYJUu+gmdP0XQuzYUB
         TCmoIE1W2s9FQ5YwviMEsKHsIkWkLqnStI2hObN0Na9y20AU9EhIFx5eefeYzGM+EEWg
         jdsgfBcMYW6iuDS6TOzU4eEwXnSRxqRYlw1kfkvOaXSY9lW5ewY+r26tbq52Jlf5nRZp
         5DNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqf4i7mV+0/Kr4Y4BHbx6QbmAhcACE5L7nRIu66aC1IpzcPQ7ADU4Ax5bRe6f+9kHexFWypy5nXG9n0Chn24g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx685trsT+QEUaZzAA22LU2BiDGGhQtqMsBGtkU34v9SbHxEBf8
	RYl84OyJx1KB4cEUkZ1IbcRhO0ZnqZps6aljO36Ox59EaOdU3hCOOCpGZYc1mOB0Upmg2GYY3Og
	bUQpdIFzKRhv2/4kl1zm5lcg6ACL2qkMnNWZ2e0nT
X-Gm-Gg: AfdE7ckQYYTxRKzKAJT6+J21mt5ctgqM4aTQt1C1I0CnC8zRm9PAQZWTi3prgFj+qkB
	1qsKnVHek/qcX+IkXuAmrK1z9ivcTYnq+F/YtcpsJ6T+02PFKSeh4pW74GZTM6T+uGAwW4PfqkB
	ozCMtD3otgrS85+pa5U0hVYiHAsjdCs8EYnh0ARljQPfClILgoKtbPtL4flPoXc5dmjjuzrJeUt
	e3+usMsERf6rvmiRsy0tvfzT56rMBHKKtM3CMZ/qPy4QVJ1jvyEzF4UCMtqlhQcNFhUTXVSXVn5
	bDew51LZLhOEM5lOupWM/PgvdzE=
X-Received: by 2002:a05:690e:4382:b0:667:8b91:240f with SMTP id
 956f58d0204a3-6679f1f6a3cmr3478844d50.86.1783585607965; Thu, 09 Jul 2026
 01:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260709063450.1615041-1-justin.yeh@mediatek.com> <20260709063450.1615041-2-justin.yeh@mediatek.com>
In-Reply-To: <20260709063450.1615041-2-justin.yeh@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Jul 2026 16:26:36 +0800
X-Gm-Features: AUfX_mz-SC1jbPIc5jRR2EosAZtRTmwf_K_gSweOzyKAAmx00VXSsHTmWBxIzq0
Message-ID: <CAGXv+5HQLzZeoHue=uziuijpu6OiLHXnW8NiwY8j7aggGKt2Yw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] pinctrl: mediatek: use devm_gpiochip_add_data()
 for GPIO chip
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_012649_222210_95967254 
X-CRM114-Status: GOOD (  23.52  )
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

On Thu, Jul 9, 2026 at 2:35=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> The gpio_chip is allocated with device-managed memory but registered with
> the non-managed gpiochip_add_data(). This was harmless while the drivers
> were built-in, but once they can be built as modules and unbound/rmmod'd,
> devm frees the gpio_chip's memory while it is still registered, causing a
> use-after-free.
>
> Register it with devm_gpiochip_add_data() so it shares the same
> device-managed lifecycle, which also lets the manual gpiochip_remove()
> error paths go away.
>
> Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt81=
35.")
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implement=
s the vendor dt-bindings")
> Fixes: e78d57b2f87c ("pinctrl: mediatek: add pinctrl-moore that implement=
s the generic pinctrl dt-bindings")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

But see below.

> ---
>  drivers/pinctrl/mediatek/pinctrl-moore.c      |  6 ++----
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 14 ++++----------
>  drivers/pinctrl/mediatek/pinctrl-paris.c      |  2 +-
>  3 files changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/m=
ediatek/pinctrl-moore.c
> index 17e30f83dc19..38f15dbe9a28 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -594,7 +594,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>         chip->base              =3D -1;
>         chip->ngpio             =3D hw->soc->npins;
>
> -       ret =3D gpiochip_add_data(chip, hw);
> +       ret =3D devm_gpiochip_add_data(hw->dev, chip, hw);
>         if (ret < 0)
>                 return ret;
>
> @@ -608,10 +608,8 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw=
)
>         if (!of_property_present(hw->dev->of_node, "gpio-ranges")) {
>                 ret =3D gpiochip_add_pin_range(chip, dev_name(hw->dev), 0=
, 0,
>                                              chip->ngpio);
> -               if (ret < 0) {
> -                       gpiochip_remove(chip);
> +               if (ret < 0)
>                         return ret;
> -               }
>         }
>
>         return 0;
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinc=
trl/mediatek/pinctrl-mtk-common.c
> index dd2c8aa03938..791eddd7a2c6 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1130,30 +1130,24 @@ int mtk_pctrl_init(struct platform_device *pdev,
>         pctl->chip->parent =3D &pdev->dev;
>         pctl->chip->base =3D -1;
>
> -       ret =3D gpiochip_add_data(pctl->chip, pctl);
> +       ret =3D devm_gpiochip_add_data(&pdev->dev, pctl->chip, pctl);
>         if (ret)
>                 return -EINVAL;
>
>         /* Register the GPIO to pin mappings. */
>         ret =3D gpiochip_add_pin_range(pctl->chip, dev_name(&pdev->dev),
>                         0, 0, pctl->devdata->npins);
> -       if (ret) {
> -               ret =3D -EINVAL;
> -               goto chip_error;
> -       }
> +       if (ret)
> +               return -EINVAL;
>
>         /* Only initialize EINT if we have EINT pins */
>         if (data->eint_hw.ap_num > 0) {
>                 ret =3D mtk_eint_init(pctl, pdev);

I think you would also need some matching cleanup function for mtk_eint_ini=
t()
or you end up with a dangling IRQ domain and mappings that are active but
have invalid chain handlers.

This would probably be a separate patch.

>                 if (ret)
> -                       goto chip_error;
> +                       return ret;
>         }
>
>         return 0;
> -
> -chip_error:
> -       gpiochip_remove(pctl->chip);
> -       return ret;
>  }
>
>  int mtk_pctrl_common_probe(struct platform_device *pdev)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/m=
ediatek/pinctrl-paris.c
> index 23f04b24fd65..09098b68f725 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -957,7 +957,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>         chip->base              =3D -1;
>         chip->ngpio             =3D hw->soc->npins;
>
> -       ret =3D gpiochip_add_data(chip, hw);
> +       ret =3D devm_gpiochip_add_data(hw->dev, chip, hw);
>         if (ret < 0)
>                 return ret;
>
> --
> 2.45.2
>
>

