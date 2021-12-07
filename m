Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA63C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 01:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDNtfbW6xdYYVQifua8xdZ1gVwQrUtKf5+tb8R+W02w=; b=stqRrOm0+t2yHG
	wH13f8/nOcvAi2gRWnaqKZcP/zp54bIb/OexIsJeOzZ8rD7/zvsYUq6cmJ1RJ4hZlAiTfNPrGrWj+
	QU2nyJdndSQmUu2WntPv2aIVzPYBnW8Gge8SpXQY4FoKC2cWll94qxzQCdemeyz04pj3HIhIX8R6T
	DtERHGYU3qKUBN2aZmgW0XuS71gjrP8ubdzNygi9FPsRW2fVXG5ayXN2per8tNN0/Yweaw7Kg1dJN
	B1VTkEqDFYYCAqA8Y5ErM/KtGzVJBaPklwAann2j/JVFX93jzOx0eFwfskeVQaKdViKHPTgzhQ7B8
	gZDVlx01URPuDDNvUY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muPbM-006cgK-Al; Tue, 07 Dec 2021 01:49:04 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muPb8-006caE-42
 for linux-mediatek@lists.infradead.org; Tue, 07 Dec 2021 01:48:51 +0000
Received: by mail-oo1-xc34.google.com with SMTP id
 d1-20020a4a3c01000000b002c2612c8e1eso4932004ooa.6
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Dec 2021 17:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AFz5tb1s5E2o6IruMPa/3kRd+Fiv5iY0Fzye5oLOFqE=;
 b=UBvo3aqLBUEJrPryLbjhYFOvdDYupBjLMjp6i2aymVQphxY3WXk4NvVFcKfKV+YgJ9
 EzgzBeDDKpk9L1y7ZpPHWhTNfVxOIZlpi2m3Oqz5/FJAIost4evonA/cFftreHqXKT1G
 4tkU1YqV5gOwaqbA12So24Qc5tAg8ENbB6adRVAGW9ZW88MmCvFRlr6LyKDUWerpAtlD
 d1OmYPSOOXSDg1+ua/pRA01pSAC4Phvjy6W73WGogFcMu9OnQhGC9TQCVk6RZxepUPhh
 j//83QH9DXTrf5mAclC8bnzFbH4VwngBAfiDhEaCN6FHSJtUg3rVYAHIAkj5eU2quKlv
 Rzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AFz5tb1s5E2o6IruMPa/3kRd+Fiv5iY0Fzye5oLOFqE=;
 b=BXRf7EPj8bxa5TKFyhD0T79BDjHrgj5L54AhONUhvUakNHs9XIco8YtFbW1S96R0iV
 2Vhfq+zNfHTfEbs8tPv0oa3p/vY1fra5TGrW09CzDfM2M7MlwLvaLYlEbG1vrTUSOnR7
 DlFhczhinD9tk4wi9gqCUxb6hp5WpQmQRbhlbknIHOnW9M2eFR0rCC9qt4PFz6EtGGie
 eGAao4mIRUa+TLgug+geUTWlUW4pbBahst7nsv0pRDpROdGGwiP09A0FtOakkOWESNTL
 pjJVgwsChL0+yInfJo4/wAVn7ewfSBQyjqjyCMQIg9u87XsUVEbi2yOEVuFQjNMrajTV
 ekzQ==
X-Gm-Message-State: AOAM532GsxqIwf41ztSC+GYlGy5VuwXYE8tMfvi0ZQKFR0zjF3lEtvXa
 hxkuIy8F97TkO72HqISvyM69ujeeVxBola9gXe4OKQ==
X-Google-Smtp-Source: ABdhPJx3H3C1ePdMTdRJPqjHs5w5ltUUprwA6vQYg3EGk7a5/lyPTgGkRhm/2WQ8BNLTM4aHT+6Rqn6InkenUQG9j2I=
X-Received: by 2002:a4a:8515:: with SMTP id k21mr24612108ooh.71.1638841726738; 
 Mon, 06 Dec 2021 17:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20211206174201.2297265-1-robh@kernel.org>
In-Reply-To: <20211206174201.2297265-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Dec 2021 02:48:35 +0100
Message-ID: <CACRpkdYXdUmYHt=1uCtoZTWfy5ZV6VV3obfSa0Aw9SwvoSB-CA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: Add missing properties used in examples
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, 
 Thierry Reding <thierry.reding@gmail.com>, linux-mmc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_174850_203938_83989408 
X-CRM114-Status: GOOD (  12.44  )
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

On Mon, Dec 6, 2021 at 6:42 PM Rob Herring <robh@kernel.org> wrote:

> When 'unevaluatedProperties' support is enabled, the following warnings
> are generated in the mmc bindings:
>
> Documentation/devicetree/bindings/mmc/mtk-sd.example.dt.yaml: mmc@11230000: Unevaluated properties are not allowed ('reg', 'interrupts' were unexpected)
> Documentation/devicetree/bindings/mmc/sdhci-am654.example.dt.yaml: mmc@4f80000: Unevaluated properties are not allowed ('sdhci-caps-mask' was unexpected)
> Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.example.dt.yaml: mmc@5a400000: Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
> Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@80126000: Unevaluated properties are not allowed ('dmas', 'dma-names' were unexpected)
> Documentation/devicetree/bindings/mmc/arasan,sdhci.example.dt.yaml: mmc@80420000: Unevaluated properties are not allowed ('resets' was unexpected)
> Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
> Documentation/devicetree/bindings/clock/imx8qxp-lpcg.example.dt.yaml: mmc@5b010000: Unevaluated properties are not allowed ('power-domains' was unexpected)
>
> Add the missing properties as necessary. For pl18x, drop interrupt-names
> as there isn't any use of it when there are 2 interrupts.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Chaotian Jing <chaotian.jing@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Wenbin Mei <wenbin.mei@mediatek.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
