Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95143C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 15:44:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4758360F01
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 15:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4758360F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UxdWXhrGxvo3/vwVIRnFgHV8cYg/Dx4e76aLlQKOJTU=; b=Jof7gspaCxLagjCwRGYvcrm1kB
	hzk0Yc0Uf3gqiD1mzHH9J6BQ9hTgSDLHPbFL8C6WYGi0nMeDxJ8TW4viLl5UdmLeKeMTs1F8BntYI
	hIxOgtRnv+8lh/On2Hrtqd0pH3UpFNwgTRVUGjy8Pz/v04gxihYvn7iNAMc3NnDGK+mIoVrkvgXHK
	EllKX0S9K8H6k+nFigCBhPqbe8/SgjdxG6sXT5Ah2dzbyugpTCGnQi/PDy4RSRoJA++Fj/0QXsNVi
	3zazk+ZGN/FPyqP+M55u9BbLOfZlnLgvOpqKRLBRLLPZeR0FN1MiB2f6z5dS32l2/zT/aLwhizleP
	8vHEQADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC21E-00Ct8V-3X; Fri, 06 Aug 2021 15:44:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC210-00Ct6h-QU; Fri, 06 Aug 2021 15:44:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id b11so11658794wrx.6;
 Fri, 06 Aug 2021 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lkzuyoF6aGI8g1BoWufFJUHe7Pqn5XucH2j121GW1Yg=;
 b=Bj9YVQtN35HUg6TZ+1yrDwAgRyR0bn6f9bgwu/c4EVWuQqf54iTZV9WvUx+4cbbbzz
 7vq90gXXqhbQUPEJGROfHymNKJDxjaXC/rRem6FuE9R1MtWZ2DT1huf4h47BjQprlcEm
 2n2yaVvt70bcc8QSY5VKQDEYFdd7YtP4Iin2/xQrQschAXerSZ+iBUY/pYLf8o5gwuwY
 WFm/zzqIbcUr96VCneFwru8v+5gs2EOSg6cI8uD9znyYU04JDB9112HfZN0/PU5LBXwW
 xuO15kq7FS3NuEZkKCPaEn6Dzr4uRdN2jPtJZLSdgZAV5+ZuVXcwn2xwyJlcNcpb9e92
 jJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lkzuyoF6aGI8g1BoWufFJUHe7Pqn5XucH2j121GW1Yg=;
 b=beV1VglKvzrPfwho7Nx5KUPvrcPmR1xeTlL1E51s5wxIca7wa6+6s95EJtjnA/ki7j
 pQUMDTVjszMT1qMBugrsqQ0zyF9zGTsiFvdD1fBo3YL0xgFnFSq4dsSbtPAddv9nx6gs
 cAGk/VS3NiMtEFAJ0o8WrVbc+TcgOYug1/zRZsiyDRwe+CDZsA97qK+V0mICtWCOeK3u
 E8tQBxLw7CmPRlvw1gdfh5t4fc6X5X/8rceJnwo+7xfvb3Vo0n4ymShV9R4vxqAbXRe7
 6rbU6FAlJ/TG7GW4XcWxBPiT+5EF5OBvfRFrT8a6eJ0oU/1VlK72VkmHrY9LQPNHZC/q
 fv7w==
X-Gm-Message-State: AOAM533p9NEjxzXHACIt8S1a5iiqJ6hZ4TwmMdjkV6VUvyMfwAe/edfH
 TV6x6WdTpKM+8pmXZoKAkBg=
X-Google-Smtp-Source: ABdhPJwRsfyU547wFy5xYaSGn+gLcZuco/fmozMzfLLFtstM87IX9OcGkO1bFKMQdn1V15THbr2FGQ==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr11468990wry.241.1628264638788; 
 Fri, 06 Aug 2021 08:43:58 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id i5sm9887467wrs.85.2021.08.06.08.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 08:43:58 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] arm64: dts: mediatek: Move reset controller
 constants into common location
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com,
 drinkcat@chromium.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com,
 Crystal Guo <crystal.guo@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1127dad2-4ee9-4e22-fb15-8412ac59a394@gmail.com>
Date: Fri, 6 Aug 2021 17:43:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_084406_917340_4A349C5D 
X-CRM114-Status: GOOD (  17.04  )
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



On 14/07/2021 12:11, Enric Balletbo i Serra wrote:
> The DT binding includes for reset controllers are located in
> include/dt-bindings/reset/. Move the Mediatek reset constants in there.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
> Changes in v2:
> - Fix build test ERROR Reported-by: kernel test robot <lkp@intel.com>
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi                    | 2 +-
>  drivers/watchdog/mtk_wdt.c                                  | 6 +++---
>  .../dt-bindings/{reset-controller => reset}/mt2712-resets.h | 0
>  .../dt-bindings/{reset-controller => reset}/mt8183-resets.h | 0
>  .../dt-bindings/{reset-controller => reset}/mt8192-resets.h | 0
>  5 files changed, 4 insertions(+), 4 deletions(-)
>  rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
>  rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (100%)
>  rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 96473d88f391..4ef0b5b23047 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -11,7 +11,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/memory/mt8183-larb-port.h>
>  #include <dt-bindings/power/mt8183-power.h>
> -#include <dt-bindings/reset-controller/mt8183-resets.h>
> +#include <dt-bindings/reset/mt8183-resets.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/thermal/thermal.h>
>  #include "mt8183-pinfunc.h"
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 16b6aff324a7..6986bc740465 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,9 +9,9 @@
>   * Based on sunxi_wdt.c
>   */
>  
> -#include <dt-bindings/reset-controller/mt2712-resets.h>
> -#include <dt-bindings/reset-controller/mt8183-resets.h>
> -#include <dt-bindings/reset-controller/mt8192-resets.h>
> +#include <dt-bindings/reset/mt2712-resets.h>
> +#include <dt-bindings/reset/mt8183-resets.h>
> +#include <dt-bindings/reset/mt8192-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset/mt2712-resets.h
> similarity index 100%
> rename from include/dt-bindings/reset-controller/mt2712-resets.h
> rename to include/dt-bindings/reset/mt2712-resets.h
> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset/mt8183-resets.h
> similarity index 100%
> rename from include/dt-bindings/reset-controller/mt8183-resets.h
> rename to include/dt-bindings/reset/mt8183-resets.h
> diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
> similarity index 100%
> rename from include/dt-bindings/reset-controller/mt8192-resets.h
> rename to include/dt-bindings/reset/mt8192-resets.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
