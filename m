Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C58C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 07:18:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FA9461260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 07:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FA9461260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qadvMars30VjXR+NfrH6WgoOx5AkM8IFmSjegKXY1Kc=; b=dVOh2VB1uBtyaL
	9Yvik0xtKP3k+VsBV5Yy8Jx+3Gh50owHMKCroDtfXE8fUupqA2O8eB/jR9YGAFjrKMxl74RZCLgxe
	o187LVpvKp24d+U/RdGiGMHREK6b+U+eoV8K8WqubhcSJdG1DMSvUjQYEdvlh6EBADVqLhptauPsF
	lPvW40/C0iS5piwgJ2ApRaxDKhtctdaKL9Sk2w9E9qF079v4dHA2TH5nKWwSjr5SLWSswbE9zDYWZ
	z/ZuhIAllm+ogs3wDHc5Nw1k4W/TG3BCRull2cl7NXytaSln9Q73fKpd8jhKHoqxbsW0b9yyLotcw
	ujxVBK9S01dhatRI5G6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Cg8-009LpG-Oy; Tue, 13 Jul 2021 07:18:04 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3Cg6-009Lnz-8e
 for linux-mediatek@lists.infradead.org; Tue, 13 Jul 2021 07:18:03 +0000
Received: by mail-lj1-x234.google.com with SMTP id r20so28446453ljd.10
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Jul 2021 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v/rXhAg8/mS9EW+OBkg4YZ134yjPtz+YcrIsxDtxXHw=;
 b=gdFmIqRJGerDFfRedrGfJCYZTiEOVZPen6UFik8USN7wSEnDhX8+z7XGhUv1Xe1UET
 E60fQrM+rX8DuBoVnFZ+G3Kjv2Ny2c1X0zx9mmRF4HZnwKIPPcavSze3deQaq8cs/zzi
 E1JxLrPpNqdXrdD9/4sn9ONH67XXUg9JnnlSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v/rXhAg8/mS9EW+OBkg4YZ134yjPtz+YcrIsxDtxXHw=;
 b=lMU/3GsXBx/KXUJssmgDDxXramoe2sl06VXq1hNqjPrTDPVE/VtD8LkFyA9dFQPor/
 v6mq73hsYeofVHj8uVQ/+Wu2RFz00bM1pXuAN94CDUhxITPgic4Bqp1zaMCxrVqTAda4
 edEOCfuCcz7FdQqUI5/LeQCZmzyDe+8/v3rZRcMh7Zq8ISqdGHmCzOK9Ohizo+KffGxz
 ykKF3TAF/NuwILDDRFZbdEKPtpefLzF3IIUpaFn0rQYGnRxf5QSG5BrrJ9EtUofdgAE2
 fVhGU2Tmo+gY+Qmu+Es6gvs8H6kN9xAaEXGyQaPtTmp4/hOA70ttdighfiOkNbxXQV7n
 SQkQ==
X-Gm-Message-State: AOAM532z5UoT2tSwU04PEJtZOw0cZLgU2U0LWGI4ST2lc5LxP36CIZBv
 3d1IlC7r6JYFXMxLeDRa6KmX0DzcIwoWeuBUSwoxIA==
X-Google-Smtp-Source: ABdhPJwvNEV51r8aYwOBO8oRSgDCsy56hMQEygkoe/TYR9OaSobFtYzNx+irktn74bxJOc20Xg0McmWpytNswEZxIRA=
X-Received: by 2002:a2e:5c42:: with SMTP id q63mr2849499ljb.23.1626160680315; 
 Tue, 13 Jul 2021 00:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210710081722.1828-2-zhiyong.tao@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 13 Jul 2021 15:17:49 +0800
Message-ID: <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 mark.rutland@arm.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, light.hsieh@mediatek.com, 
 biao.huang@mediatek.com, hongzhou.yang@mediatek.com, sean.wang@mediatek.com, 
 seiya.wang@mediatek.com, devicetree@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_001802_377764_852438CE 
X-CRM114-Status: GOOD (  18.36  )
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

Hi,

On Sat, Jul 10, 2021 at 4:17 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch adds rsel define for mt8195.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-bindings/pinctrl/mt65xx.h
> index 7e16e58fe1f7..f5934abcd1bd 100644
> --- a/include/dt-bindings/pinctrl/mt65xx.h
> +++ b/include/dt-bindings/pinctrl/mt65xx.h
> @@ -16,6 +16,15 @@
>  #define MTK_PUPD_SET_R1R0_10 102
>  #define MTK_PUPD_SET_R1R0_11 103
>
> +#define MTK_PULL_SET_RSEL_000  200
> +#define MTK_PULL_SET_RSEL_001  201
> +#define MTK_PULL_SET_RSEL_010  202
> +#define MTK_PULL_SET_RSEL_011  203
> +#define MTK_PULL_SET_RSEL_100  204
> +#define MTK_PULL_SET_RSEL_101  205
> +#define MTK_PULL_SET_RSEL_110  206
> +#define MTK_PULL_SET_RSEL_111  207
> +

Instead of all the obscure macros and the new custom "rsel" property,
which BTW is not in the bindings, can't we just list the actual bias
resistance of each setting? We could also migrate away from R1R0.

Then we can specify the setting with the standard bias-pull-up/down
properties [1].

Also, please ask internally if Mediatek could relicense all the header
files that Mediatek has contributed under include/dt-bindings/pinctrl/ [2]
to GPL-2.0 and BSD dual license. These files are part of the DT bindings
and we really want them to be dual licensed as well, and not just the
YAML files.


Regards
ChenYu


[1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml#L37
[2] Note that a few files were contributed by other people

>  #define MTK_DRIVE_2mA  2
>  #define MTK_DRIVE_4mA  4
>  #define MTK_DRIVE_6mA  6
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
