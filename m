Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF45D2125F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zRM9EoMz8GkgMmNdxpc70pbXD7mbvlXQ9Z0MoNkt/Q=; b=4LfZ9HyoR0JgV4YbvvmifNqjaD
	vpQyuircCdxQ8NXClA+DLLPIM0yAjYo2yplGLlpyYe2F4eT5Gi15VrS+yZUu4Ev5semypacDniQom
	U5czsAaAeR4nrUWebFZkJuuYR0DrLVdZZ8Q8cELP+A8Of2syVO+o9XDvJ12QH0NjBW+baC7DTmsBy
	EguIOcLpRltPR84bGjogmjTKwkqhE9fmSPloYN+YWaSPL3MAbl6B1ThZfmwNHS6Y/paPFREpID83+
	G9uZ5yaZe/8ZkxLuHCzew51rs13r9FiUSnxjpVRB5rZb04Y7S6AlxVurlvHWWpiIaUcuj6x2WCRaO
	xd68MnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1MMs-0000000EGGY-44AQ;
	Thu, 17 Oct 2024 09:00:26 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1MLN-0000000EFu6-3u9U
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Oct 2024 08:58:58 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso717773e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Oct 2024 01:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729155531; x=1729760331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zRM9EoMz8GkgMmNdxpc70pbXD7mbvlXQ9Z0MoNkt/Q=;
        b=YV2T0WLLzvteDmpEqyrKaZtarxbdR3NQQTXyz/FVrkSI5GKBDyJTOT0ImsZBji9lrW
         /cZvEcD3Sgwc7yiK2sRL8YRipJhlL1FDyz8LgA4S8wmPlUmDqH2HdfJ71Yz/bWoyDH/m
         X8/dn6V60BQvpWE/yg3NYCTxez3cW8wfxVOnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729155531; x=1729760331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zRM9EoMz8GkgMmNdxpc70pbXD7mbvlXQ9Z0MoNkt/Q=;
        b=dllHemd4KCXQNWERfHmeNaiecZ4tBM9iSxA6EpVtcMSn+9o5OCqrK4MVHuOnbyl/0N
         3EFThu98i+jhX2KmL2XoJhPMDQqUoXIBZ19xosq9yUNvSO03x+yDAhOlfn85cLmxXXXb
         ztQb5ct5aR44LKDj4yluaZC7+qWpmXIU2ej+VJkrKxRY+wV9Zu1Z20oWgmfeq8MwkYCq
         A/bM5ZfZqEWrXoZ+PqbY6DG3xRE4obz9cyDTwPqZFXN7D+xn1VDdksquUd0sWbReb3K0
         g4reZnFXC9RxVIp1/1VdTKf10zX8kelztxmu0Ce756fpwNgsQfWeApJUIQDv7OfvQNoO
         J+0A==
X-Forwarded-Encrypted: i=1; AJvYcCVc2ZMMrzMXkYphhztAnC4gsUIizBod25NkKXYdray9+5xB7B0J+f58G5R8rGLIbOpAau0Fc4fXsldyt36Y9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPUn5pZ6Rqj+op8z3pTNr8elfyHnQDX+DS6E+JD9bF/e/Adr2H
	s5CPVwupKGfmu9vNz8tdb03b0UhRwQdJB/cYPHCXe4jQo4pBiTV64ZlnhjgzGOnX25NsVfL6tse
	5vhSrDjw6rMlCr0xAjUYMnqHLUpjE/ZrTOp9c
X-Google-Smtp-Source: AGHT+IEBDemRIM9FCfeg0ySLERoVJekwSTOsN+i71w3vQ46v+1urNQBGt6t68MLpvYzLAlc+A68seIBeOTQwNt9A6Ss=
X-Received: by 2002:a05:6512:10d1:b0:532:c197:393e with SMTP id
 2adb3069b0e04-539e54d7ba7mr9397189e87.11.1729155531218; Thu, 17 Oct 2024
 01:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241017075522.178337-1-bo.ye@mediatek.com>
In-Reply-To: <20241017075522.178337-1-bo.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 17 Oct 2024 16:58:39 +0800
Message-ID: <CAGXv+5GnKX+kkYwuqJ2V_1GkgQOfWZgS=MSy5pfiBDo=X4d+mA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: paris: Revert "Rework support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE"
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
X-CRM114-CacheID: sfid-20241017_015854_020056_1B7D6BBC 
X-CRM114-Status: GOOD (  33.92  )
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

On Thu, Oct 17, 2024 at 3:57=E2=80=AFPM Bo Ye <bo.ye@mediatek.com> wrote:
>
> [This reverts commit c5d3b64c568a344e998830e0e94a7c04e372f89b.]
>
> For MTK HW,
> 1. to enable GPIO input direction: set DIR=3D0, IES=3D1
> 2. to enable GPIO output direction: set DIR=3D1, and set DO=3D1 to output=
 high, set DO=3D0 to out low
>
> The PIN_CONFIG_INPUT/PIN_CONFIG_OUTPUT/PIN_CONFIG_INPUT_ENABLE/PIN_CONFIG=
_OUTPUT_ENABLE shall

Of note, there is no "PIN_CONFIG_INPUT" option.

> be implemented according to view of its purpose - set GPIO direction and =
output value (for
> output only) according to specific HW design.

I disagree. The PIN_CONFIG_* options have proper meanings defined in

    include/linux/pinctrl/pinconf-generic.h

that every driver implementing the generic pin config API should follow.

For PIN_CONFIG_INPUT_ENABLE:  enable the pin's input.  Note that this
does not affect the pin's ability to drive output.

Note the latter sentence. When you say set the direction of the GPIO
function, it clearly affects the pin's ability to drive output.
Similar argument for PIN_CONFIG_OUTPUT_ENABLE.

My understanding is that PIN_CONFIG_INPUT_ENABLE and PIN_CONFIG_OUTPUT_ENAB=
LE
are _not_ for setting GPIO function directions. Another angle to think
about it from: if the pin _was not_ muxed to the GPIO function, this
kind of does nothing in terms of the function of the pin. It still
continues passing signals for whatever function it is currently muxed
to.

> However, the reverted patch implement according to author's own explanati=
on of IES without
> understanding of MTK's HW. Such patch does not correctly set DIR/IES bit =
to control GPIO
> direction on MTK's HW.

Can you provide a correct and detailed explanation then?

MediaTek's datasheet says _nothing_ about the hardware implementation
details or how it's supposed to be configured. There's just a diagram
showing the hardware, which seems to be a closer match to type A as
described in "GPIO mode pitfalls" from Documentation/driver-api/pinctl.rst

Neither does the upstream binding say anything about using the generic
pin config properties with MediaTek pinctrl devices. The original commit
adding this driver mentions "add pinctrl-paris that implements the vendor
dt-bindings", vendor bindings that don't seem to say anything, at least
not the upstream ones.

The generic pin config binding however *does* clearly describe what
each of these properties mean. See

    Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml

For example:

    input-enable:
      type: boolean
      description: enable input on pin (no effect on output, such as
        enabling an input buffer)

And

    output-low:
      type: boolean
      description: set the pin to output mode with low level


If the hardware has some quirks or limitations, such as the SMT bit
can't be set when the GPIO direction is set to output, then that
should absolutely be considered, fixed and *properly documented*.


So what exactly is the breakage you are seeing? What options were
used in what scenario? What is it intending to do?


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

Looking now, the device tree bindings don't even allow "output-enable"
or "output-disable" so the PIN_CONFIG_OUTPUT_ENABLE condition won't even
ever get exercised.

So I don't know why this section even exists. At least this part of my
patch was correct.

>         case PIN_CONFIG_INPUT_ENABLE:
>                 /* regard all non-zero value as enable */
>                 err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !=
!arg);
> +               if (err)
> +                       break;
> +
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
> +                                      MTK_INPUT);

FWIW the implementation is also slightly wrong in that it is ignoring
the argument. If the DT specifies "input-disable", then what happens
is you get PIN_CONFIG_INPUT_ENABLE with "arg =3D 0", but you still set
it to the input direction.


Thanks
ChenYu


>                 break;
>         case PIN_CONFIG_SLEW_RATE:
>                 /* regard all non-zero value as enable */
> --
> 2.17.0
>
>

