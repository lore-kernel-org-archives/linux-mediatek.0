Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0208C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyCSLZnbWSU5r4nrnDQAmIw5SS/SAGUR40LGt3JM6DY=; b=OkxMHzqUx40hKP
	QTlWvC+7t2K5YpQdMZG1Psl4ObMxEWPugdm/7DqltfEe/X6GWTplpiSsVcN0HJqMYiA3uC2viYDTP
	NknsXfhh+dukx3K+bFXTS/SQCoBLiVmCYwWmitlXTCv6BEndAM7gRa7lMHjuwlzN/KNY65vHE8gci
	wX78i/sGlbkH8u0mIsLgB9ADuajeh11iH6ril2/3VvpfO4ymYfel15XC9K1xAuEV2wbZePN3CQgus
	a0+lGhqZT0SZlRN1r3eZPkbUicfVFsoSFakg/XkKLgtSsk4J5OlDRTkS94kIr/oyV3C51bgHVFKNw
	Gkyiajwgxlw5ouKlI+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naDUd-0050vb-S4; Fri, 01 Apr 2022 09:22:55 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naDUb-0050uJ-LC
 for linux-mediatek@lists.infradead.org; Fri, 01 Apr 2022 09:22:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id d5so3730422lfj.9
 for <linux-mediatek@lists.infradead.org>; Fri, 01 Apr 2022 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kqDhQ6uz5tP7E/u76ETFJKOp+CrWLSoKcxKKyX0RqW4=;
 b=VvgYSKL81nZLAs4hoT9cuIsMhmP8h+p1g8wsI7YmSZnBeQWKpXBsjn0tFPK6mWo+U2
 38yZO++R3yRrPbTkM8dEjkga/lPr9tEW/5pUICD57kN2HDO3BhHC5axSG09Ik5EDogUC
 odEYy8MIWeo6kBwh2h5eip/pRRkKQhCifIcNTOZB3KSe2PCRUY+eZnDarzCNA6n2gYST
 SOkZAmrZ5l3VSV9pwY4R233uVdLQNubqwwsEHybGBF3sXnxmo5DLZK7DHk/Hj+e+73GQ
 p8Fz+9RGcb5+Sjw4wE9P5FkohTTgEP7sHGYookmt7H+nWkL+ROTUng18DaKcREcp96yR
 6G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kqDhQ6uz5tP7E/u76ETFJKOp+CrWLSoKcxKKyX0RqW4=;
 b=yTFx4s3XgGUEJhPk6DRed5ewjrvujJcpgTdRHkHEEXlwp50t4i+/KUO4uL48oqOYnY
 j6i9UZbyjusCNrTjpHFlj8zQhCacZeV1eu1byH5wr286k7VO1fRs7ZoppFitWxo87aai
 nkaQYIubklCh7p/4Ah69GBrMpsM8IgvHsX+Kej9s0XamI3Iw1uNMyfCbYv/Robkhon3J
 TfP7Hh24NR+/DI+KKWyynkPP+YDHFoB0thEd83peB1F3TLLXtsA+o034eB1NM3RAi993
 c6d2Lj4IarfPIDBZk9zQC0qLRxne1jofzv1tx7MXC5n1cNVirdoWT4Pb4oWdtaf8sIOD
 eJ/g==
X-Gm-Message-State: AOAM530OU3UET1/XLRVGzprIWJx+s3oC2sWsyYRxjYttlTW+3jVOVYA9
 VW5RFmhddiqT8cm+wbZR4adCh7nGdkf3l7L3QymhIIn9KGh3Rg==
X-Google-Smtp-Source: ABdhPJwJrDnSzRPA1QW45MFiPs0C/KCemCmZtTlay3kzIbYxlsxllBZdkUFbUM0hK5gl/cOTN43YhXEhrJYg4D4w6LI=
X-Received: by 2002:a05:6512:3b0e:b0:44a:547d:c8b8 with SMTP id
 f14-20020a0565123b0e00b0044a547dc8b8mr13429451lfv.373.1648804969656; Fri, 01
 Apr 2022 02:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220329032913.8750-1-axe.yang@mediatek.com>
 <20220329032913.8750-2-axe.yang@mediatek.com>
In-Reply-To: <20220329032913.8750-2-axe.yang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Apr 2022 11:22:13 +0200
Message-ID: <CAPDyKFqoTN1pF-L6qCHxpdMCmPtHP0aHHaDURN2QJsN3v+wZBw@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
To: Axe Yang <axe.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, 
 Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, 
 Tian Tao <tiantao6@hisilicon.com>, angelogioacchino.delregno@collabora.com, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_022253_780012_6549B26F 
X-CRM114-Status: GOOD (  18.96  )
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

On Tue, 29 Mar 2022 at 05:29, Axe Yang <axe.yang@mediatek.com> wrote:
>
> Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> This feature allow SDIO devices alarm asynchronous interrupt to host
> even when host stop providing clock to SDIO card. An extra wakeup
> interrupt and pinctrl states for SDIO DAT1 pin state switching are
> required in this scenario.
>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml         | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 297ada03e3de..3872a6ce2867 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -69,12 +69,22 @@ properties:
>        - const: ahb_cg
>
>    interrupts:
> -    maxItems: 1
> +    description:
> +      Should at least contain MSDC GIC interrupt. To support SDIO in-band wakeup, an extended
> +      interrupt is required and be configured as wakeup source irq.

If I understand correctly, the extended interrupt (a GPIO irq) may not
necessarily share the same interrupt parent as the primary device
interrupt.

Perhaps it's then better to extend this with "interrupts-extended"
instead. See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.

> +    minItems: 1
> +    maxItems: 2
>
>    pinctrl-names:
> +    description:
> +      Should at least contain default and state_uhs. To support SDIO in-band wakeup, dat1 pin
> +      will be switched between GPIO mode and SDIO DAT1 mode, state_eint and state_dat1 are
> +      mandatory in this scenarios.
> +    minItems: 2
>      items:
>        - const: default
>        - const: state_uhs
> +      - const: state_eint
>
>    pinctrl-0:
>      description:
> @@ -86,6 +96,11 @@ properties:
>        should contain uhs mode pin ctrl.
>      maxItems: 1
>
> +  pinctrl-2:
> +    description:
> +      should switch dat1 pin to GPIO mode.
> +    maxItems: 1
> +
>    assigned-clocks:
>      description:
>        PLL of the source clock.
> --
> 2.25.1
>

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
