Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C653C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 23:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMDyOkZEGrzQz8nQSjdEbLakeNZJMepO27YCh6hRZtA=; b=srFavENn8qUxXs
	c/S7u0jVLjDdtpktoxVFcQY2bT1C/euW9UKPnePvbjXWjlDWavoJsSuI0t7825tsimrUIXtnpm53x
	tT5lCVmmySTNzpIaZXAenercOXOI4CXUiZ4X5O+ii9XXRmajs+A0ts2hF6QHV+ufoqDTFGiMesk1o
	6S7M/eETDUmVbQ2bx0QrzG2J2lzdeDmhvb+a7Jj2wIvg1QVtLljP01ti6h7BR3Lf2B9gJwnib59Im
	nKe+u6oFOXqHeuUqko7/XBqH1mesHO+XMWYD+GNuDrqmhQqa8oHok0+il4jbRVTq0m9dK385mxPO6
	iofH+pswkvPrCHKKzieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWRT4-009PW6-M2; Mon, 21 Mar 2022 23:29:42 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWRSn-009PSG-O2; Mon, 21 Mar 2022 23:29:31 +0000
Received: by mail-oi1-f179.google.com with SMTP id e4so14865950oif.2;
 Mon, 21 Mar 2022 16:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1eYyatCQZd3YZhjNaHOmfvqTN+inYRTrGVc7sx+pnE0=;
 b=hKCtI1s2w31GMPl1ZVuzAXj4mZYEzyXvlebK/w5SqIdXaoul4sLyeSUGillv/LlsOG
 9A5SXWMCrUd2jGU3k7eIJ6dQbKGwGzGdLPtRXknT5dSQvFlDRtb/plUQK0+dzzhsy40a
 GkEVNNzIfGQQwkIGvLVF7vXOtmRUJZ6ouiOUz+gboKrJ5y3ddOVLUDvw3VfrIi2K4jY6
 cg0p7xxcmUGsNBG+O5jXg/xYG77mPZ9Mg+qj0SoJ4d+DlC+jOtMuCjvRIUmYI2YU1qTi
 QrrMRD3C0+Gs+wppRL+mf3QIGvVal8DBNOaZ/1OI9744D157+GQRhcKs1MFNRcRmn8U1
 Z4qQ==
X-Gm-Message-State: AOAM530I1WdDxP8pPWwADhjfQmRGbnHo+8+FQDuOKbnIMviP85DQhNhP
 VEYzIwST57vUSL8goNnEow==
X-Google-Smtp-Source: ABdhPJyL1wG4H9T4Ik1hQtcDoVEUgVmKOxTNyJ47cLWpAoUJUz0YuC27Z4XHCxLH9HKrwTpQSKukJQ==
X-Received: by 2002:aca:59d5:0:b0:2ef:2125:ec15 with SMTP id
 n204-20020aca59d5000000b002ef2125ec15mr841064oib.4.1647905364052; 
 Mon, 21 Mar 2022 16:29:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 4-20020a056870004400b000dabe0c435bsm6809638oaz.7.2022.03.21.16.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 16:29:23 -0700 (PDT)
Received: (nullmailer pid 744835 invoked by uid 1000);
 Mon, 21 Mar 2022 23:29:21 -0000
Date: Mon, 21 Mar 2022 18:29:21 -0500
From: Rob Herring <robh@kernel.org>
To: Axe Yang <axe.yang@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>,
 Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 angelogioacchino.delregno@collabora.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Message-ID: <YjkKURNzg8JPbXcg@robh.at.kernel.org>
References: <20220321115133.32121-1-axe.yang@mediatek.com>
 <20220321115133.32121-2-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321115133.32121-2-axe.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_162925_803463_5AD57951 
X-CRM114-Status: GOOD (  18.81  )
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

On Mon, Mar 21, 2022 at 07:51:32PM +0800, Axe Yang wrote:
> Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> This feature allow SDIO devices alarm asynchronous interrupt to host
> even when host stop providing clock to SDIO card. An extra wakeup
> interrupt and pinctrl states for SDIO DAT1 pin state switching are
> required in this scenario.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 297ada03e3de..f57774535a1d 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -69,12 +69,23 @@ properties:
>        - const: ahb_cg
>  
>    interrupts:
> -    maxItems: 1
> +    description:
> +      Should at least contain MSDC GIC interrupt. To support SDIO in-band wakeup, an extended
> +      interrupt is required and be configured as wakeup source irq.
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
> +      - const: state_dat1
>  
>    pinctrl-0:
>      description:
> @@ -86,6 +97,16 @@ properties:
>        should contain uhs mode pin ctrl.
>      maxItems: 1
>  
> +  pinctrl-2:
> +    description:
> +      should switch dat1 pin to GPIO mode.
> +    maxItems: 1
> +
> +  pinctrl-3:
> +    description:
> +      should switch SDIO dat1 pin from GPIO mode back to SDIO mode.

How is this different than pinctrl-0?

> +    maxItems: 1
> +
>    assigned-clocks:
>      description:
>        PLL of the source clock.
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
