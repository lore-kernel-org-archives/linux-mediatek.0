Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A4AC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 21:16:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C967964F91
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 21:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C967964F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lv68F9NwKnnd9jiydWxunddl/SUeyMVBCe+E2FCPRYk=; b=e9Wtf+xhwRdoq4cN/sk/dTMxa
	00CF62BmmkjLBRuqBG5smB1u4Px0yVnAHMmVdG9s4jPCqFlKaWn4JRe+Go5SN4FBPhGX2Y08cr9Zj
	n1n52bvfRL/dklTXaZF7/kLSKkvecTTRZzWrvrld1zCxeSDOiCsL9+/7QzO6DT7nfYLdfIX0bH1mr
	MLbMCabKZBxxftMKUqPzaKwAOGhDZKrktGdkBLC/yJX7xOXXetk9x/SWHHDFcp7tyi5JLnkyDgZGU
	kTb1IpgUnGJGh6ezhXvRP0pqiA0Z+tk/0lpkGv0dmQH/tDaBxXJbGaQd8KUgpv2A9Sy8vH8QQFFO7
	6dzESca4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMH2o-001sVP-1B; Tue, 16 Mar 2021 21:16:02 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMH2Z-001sTT-3O; Tue, 16 Mar 2021 21:15:50 +0000
Received: by mail-ot1-x331.google.com with SMTP id f8so9279904otp.8;
 Tue, 16 Mar 2021 14:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yor1EiHWBTylh9kpWP/wCw+xZkPtpXh/+Ths3TbYe0w=;
 b=FHM728QhNdZyvNZnbLRwhMr7POs7HeQb93i3aK0NTjbEX0TCRXWXK+IqWNF5miwyj1
 bcjH00mGyQ+dmGW7HrZOByZv0XDKLsK9gF2fV+6Ds2ef1uQ015/RVugX8UyqARMpNkuT
 481x4m8K8+wGUjDl/aZcOU67x2qh3biB4O3MwxvxySiQrTYE0Cjvnb9arnosXi1rWfvl
 HJZritG/sbhEsBCdbFb2lSWOljRPCkLq1tXYwzfgRO3rPglkBjwfSMDmLAtXxIXrrOuD
 HZ8kBN2rJr/i2EMRZ5WU/TSik1ttHnZF4Cvzl6qLtq1pqY2GHNLGiZHtt9IrL8U9s6Cy
 hXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=yor1EiHWBTylh9kpWP/wCw+xZkPtpXh/+Ths3TbYe0w=;
 b=kWJiJjpsIKyyumBceMAuaHDRroXGDjzA4Gz8JH1jthH+4T1a3BoXrTBsZiqXBqEWzj
 CGC8lKkq1YqlKGqwL1wQZg4qvo5YTit6HvUUP/Y8tFdXdfxBhFxFVa1Inmr6/L9jhNWj
 +I7PMWUj5hGUtzM4zPww3RyTYHAvliiwj45aNN5DrnuC8RKkbTm3kUNF67mhIy+nYRtr
 /tAiJBpvuQvojy5KI3lTSMJBDA69QLJ23CbczsGaYmKCsKX+1U0wTkn8EMl6UX7/zX1D
 WDv6KRO+2oUnTTn9qin2mIdsPXyLs4Oe4sG2C8FMck+exLlCFtZrxJK9Agbjr9KFXbvA
 Oj2A==
X-Gm-Message-State: AOAM533L+js63w5ZlA5xu2mi1duUH6eD/VpKZ7Yj+iR0bQahggVQsBOy
 hqM+kmv1IW+KU9jOnjXM7KM=
X-Google-Smtp-Source: ABdhPJz+tI/5qUoyqoIXj+lrmspTrR6p+9F7dSCgDDDieF1KKvij53ZFQt/vbOIgPzPDzCZKyrjFFg==
X-Received: by 2002:a9d:7545:: with SMTP id b5mr579421otl.223.1615929345829;
 Tue, 16 Mar 2021 14:15:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id o197sm8075424ooo.44.2021.03.16.14.15.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Mar 2021 14:15:45 -0700 (PDT)
Date: Tue, 16 Mar 2021 14:15:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Bayi Cheng <bayi.cheng@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 srv_heupstream@mediatek.com
Subject: Re: [PATCH 03/10] dt-bindings: watchdog: Add compatible for Mediatek
 MT8195
Message-ID: <20210316211544.GE60156@roeck-us.net>
References: <20210316111443.3332-1-seiya.wang@mediatek.com>
 <20210316111443.3332-4-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316111443.3332-4-seiya.wang@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_211548_193690_071F2F0A 
X-CRM114-Status: GOOD (  16.77  )
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

On Tue, Mar 16, 2021 at 07:14:36PM +0800, Seiya Wang wrote:
> This commit adds dt-binding documentation of watchdog for Mediatek MT8195 SoC
> Platform.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index e36ba60de829..a658a0b92b9a 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -13,6 +13,7 @@ Required properties:
>  	"mediatek,mt8183-wdt": for MT8183
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>  	"mediatek,mt8192-wdt": for MT8192
> +	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
>  
>  - reg : Specifies base physical address and size of the registers.
>  
> -- 
> 2.14.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
