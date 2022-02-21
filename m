Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E00CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 10:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dh5rImKT5Js4IufKQun5YE5i9YkRpS/U25gHv9GnUIc=; b=I8gKn8U9MzDM5w
	LCyorH8JRveDWnOivy2UoIRN1nb8mSlwaB/yWf8/vLbdPA/WkwacvsNAGJkiCqA5oZ2NH+uB90dxP
	FH04hFHfnTezB+j+dc1xM0g79W2/dFh/lSdI2Yq+GPKk4OZX4NObAAol1tRctsXVQbjRpXE5n8FGy
	sPhbQI6kpLQk9fEVZyJkylyd+UGHUzYzDyaNz4fLAIOipS1tFFm961hOGNRF2VnQvSZlpJe5sGXwi
	zAf0fme9byQrazg3dOyGcGoY4T3FwFdwjayCHvtwv4bnsnj/ih0rWCBiPJU9ExcVB5NqD5MfZwCYK
	b+v9pjeqiuLwWD1Ho+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM65k-0051RL-Ak; Mon, 21 Feb 2022 10:38:52 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5U0-004jL9-CK
 for linux-mediatek@lists.infradead.org; Mon, 21 Feb 2022 09:59:54 +0000
Received: by mail-yb1-xb36.google.com with SMTP id d21so10798183yba.11
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Feb 2022 01:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F8HuNySVihr78JUk0vBH8HXUJwDNKfDdsdrX5GTI+fw=;
 b=bAZXExZd+gxJtSTV7+Cl+juk/koeY8qUYRcHiHdx4OLHds0lP0j2k95Yoja1zspyPW
 PxkWRNElHihsuEQjoU6UkR3osF8rm0AKqO9FNzOQFrGVbPN1b99QgopYtsgD2iCIH5Bb
 6V8KhWB1Tai5uNY2MrdUqQXjIykD9euiykEhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F8HuNySVihr78JUk0vBH8HXUJwDNKfDdsdrX5GTI+fw=;
 b=O7OIWtK7Mo50D9dm19PHUA5l/37vMHPatZ8B4LugYwGi7YiHU4GDyo0sop7Lw2E6Q4
 GAyXxQEgDf6jy9LXuRQuJozsCKoqJEJ896qrj9ac3GP4wNsJXPqTLtv7D8uLwL/GuRMT
 nxKLpGnabAk6w3e3fTA+825ubfXAQHWlPQyQYlrKddDVLriMxPnm+SWfjffAWc6rez2P
 b4Gv9URn0isXTirWLRTfss4dNwje1rKPrjmc6GoaQQAKCfcAu9vYqIyg9wLr7vOeH6dz
 uPJ5OP9O676luUZwAC6BC+x1F77fIXqmKCEcv7NVHkxMZLd6+QVXNc+ViZxl1rBLVm0P
 /vaA==
X-Gm-Message-State: AOAM531H0CO5ynktIm449ZPSfULw1btjIPuqzK9jmgPVKDiUhUk3fEsM
 TVsKRMdd1nQ/cHk5QlYf5QyLo+nBG2WWhzhb80U7vg==
X-Google-Smtp-Source: ABdhPJzj2xGSWW3dtoB4HYY0TFlVeVNSRyLkGtxJKKdnpmA6oOgI0wkRR7ct9tHr9/2ktGXg79fQvWv0ugrsUMYjaFU=
X-Received: by 2002:a25:a486:0:b0:61d:a523:acd0 with SMTP id
 g6-20020a25a486000000b0061da523acd0mr17094521ybi.203.1645437590821; Mon, 21
 Feb 2022 01:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
 <20220210141931.291712-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Feb 2022 17:59:39 +0800
Message-ID: <CAGXv+5GLSnr1rQ_K3Y1Ou3ocoq7cSmv8GMkRCEi4adxewY1dHA@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: mediatek: common-v1: Commonize spec_pupd
 callback
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_015952_505721_79E2B494 
X-CRM114-Status: GOOD (  20.69  )
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

On Thu, Feb 10, 2022 at 10:20 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Reduce code size and duplication by using a common spec_pupd callback,
> which is possible to use on all of the pinctrl drivers that are
> using the v1 pinctrl-mtk-common code, with the exception of mt8135,
> which has a different handling compared to the others.
> Since the callback function signature was changed, this had to be
> propagated to pinctrl-mt8135's spec_pull_set().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

[...]

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 007da39b68c9..5e1d17512a0d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -222,9 +222,8 @@ static int mtk_pconf_set_driving(struct mtk_pinctrl *pctl,
>  }
>
>  int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
> -               const struct mtk_pin_spec_pupd_set_samereg *pupd_infos,
> -               unsigned int info_num, unsigned int pin,
> -               unsigned char align, bool isup, unsigned int r1r0)
> +               const struct mtk_pinctrl_devdata *devdata,
> +               unsigned int pin, bool isup, unsigned int r1r0)
>  {
>         unsigned int i;
>         unsigned int reg_pupd, reg_set, reg_rst;
> @@ -232,8 +231,11 @@ int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
>         const struct mtk_pin_spec_pupd_set_samereg *spec_pupd_pin;
>         bool find = false;
>
> -       for (i = 0; i < info_num; i++) {
> -               if (pin == pupd_infos[i].pin) {
> +       if (!devdata->spec_pupd)
> +               return -EINVAL;
> +
> +       for (i = 0; i < devdata->n_spec_pupd; i++) {
> +               if (pin == devdata->spec_pupd[i].pin) {
>                         find = true;
>                         break;
>                 }
> @@ -242,9 +244,9 @@ int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
>         if (!find)
>                 return -EINVAL;
>
> -       spec_pupd_pin = pupd_infos + i;
> -       reg_set = spec_pupd_pin->offset + align;
> -       reg_rst = spec_pupd_pin->offset + (align << 1);
> +       spec_pupd_pin = devdata->spec_pupd + i;
> +       reg_set = spec_pupd_pin->offset + devdata->port_align;
> +       reg_rst = spec_pupd_pin->offset + (devdata->port_align << 1);
>
>         if (isup)
>                 reg_pupd = reg_rst;
> @@ -293,12 +295,13 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
>          * resistor bit, so we need this special handle.
>          */
>         if (pctl->devdata->spec_pull_set) {
> -               /* For special pins, bias-disable is set by R1R0,
> +               /* For special pins, bias-disable is set by R1R0

Nit: This seems unrelated, and doesn't read correctly either way.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
