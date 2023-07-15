Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66354C001B0
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jul 2023 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9XlpRMNdAAEFImKOS7TDT4umEsjSeY77+bJ4P1MRe8=; b=SCD/loHqbe+1TDhDKhIH0qmOLS
	rOh9XuK4sRmQn1Y8wYVfXRafMAzNUFju1qozhyLYaWQB2TsBNPBR2YAIE1jpiNRqezihrQWhPVGsE
	0XuzrUxJxhq1BG0D5SB3HW75vKQDkYlJwRWX2Zs7Bk8LHFoCkt2jz8hwaSyc+kINN8YNGlTFUmCZU
	4wVQTPsZDrxal9FB3OX3A597cr8V+XQGtxh3jMdEsZQbetKbNW2HyMnaCYm15EPMaSSqXGF/ydUd/
	tb7nBeKHHx/aK+GhImqt2fUoJg52C+osuXxuhSf9yZZamu+fXbzzRn9ytLY0Oq1hzBWGq8l4wx5kU
	7QQ2hTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgw7-0090vQ-2d;
	Sat, 15 Jul 2023 15:11:55 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgw3-0090tA-0y
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Jul 2023 15:11:53 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3461053677eso6531815ab.0
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Jul 2023 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1689433909; x=1692025909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9XlpRMNdAAEFImKOS7TDT4umEsjSeY77+bJ4P1MRe8=;
        b=KpbiwA9NRF8+W6tdUk7oAEajedYliLcT3fLwx1hKWNPafETFpJG9nnPmhVRp1UdI1a
         ec9mVwfBesk49WkdsrPfeQTQNowRCIhbKJuP16XD7dO7TZekJ8yDxNsj6kgUO5dmVinN
         O/xItmOPmt9BnCnKdfjfmpm5zf8eizKb7wHPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433909; x=1692025909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9XlpRMNdAAEFImKOS7TDT4umEsjSeY77+bJ4P1MRe8=;
        b=EgtwCWzWFb0TCOt66w69wcFejxE1gdLLP53il5TMXFBTkUsNkVlaKkaEjWvzhIyu0U
         24k8sgJ7dMwogVmaHWbPXFhvu/I4r9V4Gq40M3x+1tdH1vstCX4JEomUhz5fBjd1WBxC
         v6S4ETs6TCfAN+SmDF1NrukdewRYBOHiaILJCxPUN0dmextPFeoO5B1E4VEy4sq/7mPT
         1+M/20Y0IrAb7+FKHz4OD1FycF9fFD/drfJuPcjGp/EMXQ0tNn3OWExtSz6BQcbFQL1f
         JpZrmVrAewKH6OIn5nfoy2CIOs0sR92bshSIRqpdaSo3kRWWmFpNCbU+7AshYZovxpFI
         ojOA==
X-Gm-Message-State: ABy/qLaXp4RvFX8giCT3bGmAiSH4jl8fa2hIH12SY7cmApfk6YJAq+IH
	DjpFYONjugw8z88euK12KEu5OA==
X-Google-Smtp-Source: APBJJlGJVqbBu5lKEA54CgyQF24n/fOTJfhIYz9w3XH4VGOvH3KCmWksDsEmgsEiSCeG83sO26Hgmw==
X-Received: by 2002:a05:6e02:1148:b0:343:ef5e:8286 with SMTP id o8-20020a056e02114800b00343ef5e8286mr3847417ill.7.1689433909634;
        Sat, 15 Jul 2023 08:11:49 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id f8-20020a056638022800b0042b2959e6dcsm3321388jaq.87.2023.07.15.08.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 08:11:48 -0700 (PDT)
Message-ID: <1c6175fc-496a-843c-c8c5-2173e065eaa8@ieee.org>
Date: Sat, 15 Jul 2023 10:11:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] net: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-wpan@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 wcn36xx@lists.infradead.org
References: <20230714174809.4060885-1-robh@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230714174809.4060885-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_081151_445235_70FC4035 
X-CRM114-Status: GOOD (  14.95  )
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

On 7/14/23 12:48 PM, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

(I significantly reduced the addressee list to permit the message
to be sent.)

For "drivers/net/ipa/ipa_main.c":

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/net/can/bxcan.c                                 | 1 -
>   drivers/net/can/ifi_canfd/ifi_canfd.c                   | 1 -
. . .
>   drivers/net/ieee802154/ca8210.c                         | 1 -
>   drivers/net/ipa/ipa_main.c                              | 2 +-
>   drivers/net/pcs/pcs-rzn1-miic.c                         | 1 +
>   drivers/net/phy/marvell-88x2222.c                       | 1 -
>   drivers/net/phy/mediatek-ge-soc.c                       | 2 --
>   drivers/net/wireless/ath/ath10k/ahb.c                   | 2 +-
>   drivers/net/wireless/ath/ath11k/qmi.c                   | 1 -
>   drivers/net/wireless/ath/wcn36xx/main.c                 | 3 +--
>   drivers/net/wireless/intersil/orinoco/airport.c         | 2 +-
>   drivers/net/wireless/mediatek/mt76/mt7915/soc.c         | 1 -
>   drivers/net/wireless/silabs/wfx/bus_sdio.c              | 2 +-
>   net/core/of_net.c                                       | 1 +
>   124 files changed, 110 insertions(+), 120 deletions(-)

. . .

> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 6a2f2fc2f501..da853353a5c7 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -13,8 +13,8 @@
>   #include <linux/firmware.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> -#include <linux/of_device.h>
>   #include <linux/of_address.h>
> +#include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/firmware/qcom/qcom_scm.h>
>   #include <linux/soc/qcom/mdt_loader.h>

. . .

