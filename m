Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BD4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgShRJivO4UMKzZNwUBBdbMf56nKuY7ZTw4GVEPqWWo=; b=uSBLWfyM0VFcJbAdB1LI5AUtPs
	Ga1vAlpWu/gH/q7ELnL0QJzH4kMyy2028SywYmQWXGUpyOV62vTpT0/VlUFMKVwjWHQ+fTRovM3xL
	7/6tX5/Rt0obuq4RGZCJoNrby8va1yJGs5dpO0QvXpVkzuhkf1kKYlJWP+QO0xqRJlS6sDMu4kHN4
	ujZwHRrGoDMFjISToeJ09e+XpzjPU7Qftl0wb98oeDjUbqPHOVW7pVHqDb0rKlbF3pkelnMWLgIL3
	o04lsoYaThfpRqJQI5Q4zgoH5QcKLQ25TZtyreWbQJuG1BzX6jX959nisCmtJ8OWWhgoapnIZCbX0
	ZAFVfAQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40tj-00Akzu-AG; Wed, 22 Jun 2022 13:59:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40tO-00Akqh-VD; Wed, 22 Jun 2022 13:59:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id z17so9303318wmi.1;
        Wed, 22 Jun 2022 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rgShRJivO4UMKzZNwUBBdbMf56nKuY7ZTw4GVEPqWWo=;
        b=KqJrq9ypSh1dbT9Oa+IFZtMXfv1SYDVLnzYpkbAgL1WVV3PU33kqwxijF88vwLR+f/
         t5bkIxJk7mWabTROKt8Mj6KA4ZY2RcdiF85fufzCJhrgRwG4i6c4fC1WAU1vmK4uTi/a
         tg1hzi+L4uoCP7MPRSsQAOLGAEnB6kZCwS5p9C5vOxjUZwdO/yAyTX23DcTwe6OUkuA2
         bTIQ/87wvkwzH4pl06crXqBJekxRDV6gpVJw3TlHwCz1TZOZWLWbxFlJQCgb6he1r43C
         RODywhH9i6/9ToaTZ7G99+b6RDt/4b4YFeNI9oTgCZWbSmjsEoh9lSdQXDb08CrJYqQs
         Nvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rgShRJivO4UMKzZNwUBBdbMf56nKuY7ZTw4GVEPqWWo=;
        b=ibpxUP1zfnKErv+RTd/zUvMG8cdozVwMCBgZ18iLjakzLXAr7drHu+rJlXAKavTcYX
         TinVWtcRoDTe08cW5Y8Wy5di+NkEfw7gLeDyTXSFpPkaXL1wxetyoR99djs/CMJwVsCS
         w0TmtO9chnSqmnDnRyfNk49zWJcyF+9hiGNe5ok8/TOrU7n8TUBbAfJ2J9xFmNuEEun3
         iBke3WuD4n9clLUzeVSIfcrPjxSSYouAWeBidnWioJ/aRe3Esl9ClW5oSmlzUwxey8vL
         pEuEszjLHDn040uob5//YIbq6qNXuCKavZDgXsi6i1+PjJptgpDEBhZ0upScMX/qAetl
         fmuQ==
X-Gm-Message-State: AJIora+4wdGhpRYXVzTJlCF26DmDNJwWX0TXtJ6tcPzPPAWv2x3Is/tm
	GOsPR7YhVovyJe0UVrbAKHQ=
X-Google-Smtp-Source: AGRyM1thHabiQMSEyMIUIXQr2qmcNEztyWkzcPRGBPdm082077d95CXBAPkAm+WXhdCkggmGKkSIYQ==
X-Received: by 2002:a05:600c:4f95:b0:39c:7bd0:d47d with SMTP id n21-20020a05600c4f9500b0039c7bd0d47dmr4014480wmq.17.1655906377172;
        Wed, 22 Jun 2022 06:59:37 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.148.38])
        by smtp.gmail.com with ESMTPSA id l8-20020a1ced08000000b0039744bd664esm25322274wmh.13.2022.06.22.06.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 06:59:36 -0700 (PDT)
Message-ID: <b31c1d67-6295-eaa7-f161-8d439ea1a2b9@gmail.com>
Date: Wed, 22 Jun 2022 15:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] arm64: dts: mediatek: Replace 'enable-sdio-wakeup'
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>
References: <20220621124435.121740-1-festevam@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220621124435.121740-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_065939_102776_61504302 
X-CRM114-Status: GOOD (  14.60  )
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



On 21/06/2022 14:44, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> As explained in Documentation/devicetree/bindings/mmc/mmc-controller.yaml,
> the 'enable-sdio-wakeup' property is considered deprecated.
> 
> Replace it with the 'wakeup-source' property instead.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi    | 2 +-
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts     | 2 +-
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi  | 2 +-
>   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index 923c1c3477e5..e21feb85d822 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -410,7 +410,7 @@ &mmc3 {
>   	sd-uhs-sdr50;
>   	sd-uhs-sdr104;
>   	keep-power-in-suspend;
> -	enable-sdio-wakeup;
> +	wakeup-source;
>   	cap-sdio-irq;
>   	vmmc-supply = <&sdio_fixed_3v3>;
>   	vqmmc-supply = <&mt6397_vgp3_reg>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index 7ac9864db9de..52dc4a50e34d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -134,7 +134,7 @@ &mmc1 {
>   	vmmc-supply = <&mt6358_vmch_reg>;
>   	vqmmc-supply = <&mt6358_vmc_reg>;
>   	keep-power-in-suspend;
> -	enable-sdio-wakeup;
> +	wakeup-source;
>   	non-removable;
>   };
>   
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index b50261e8b9ed..89e4358f140a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -382,7 +382,7 @@ &mmc1 {
>   	sd-uhs-sdr50;
>   	sd-uhs-sdr104;
>   	keep-power-in-suspend;
> -	enable-sdio-wakeup;
> +	wakeup-source;
>   	cap-sdio-irq;
>   	non-removable;
>   	no-mmc;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> index afeb5cd37826..530e0c9ce0c9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> @@ -159,7 +159,7 @@ &mmc1 {
>   	vmmc-supply = <&mt6358_vmch_reg>;
>   	vqmmc-supply = <&mt6358_vmc_reg>;
>   	keep-power-in-suspend;
> -	enable-sdio-wakeup;
> +	wakeup-source;
>   	non-removable;
>   };
>   

