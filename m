Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4870AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Dec 2021 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBeK3+Lzh8JeQGnM+xJOfM1dIa7sGeIG6G+Buc2sLM4=; b=IGS5pSfBquS9oI
	hM4lWlEo+PQqYsJf69oqWWRjuIeVkpciOJ+qZpIwDruNhB4jKd4OXmQU8Hif/B0VfShkK626rEze4
	Q+brU9BgcQw97Ba6Fjxcoqgon3oECCgkc8IKIaD91OSf1x+Vej/Lso4p7S0pnb0IXlQCWdHCzWhnS
	RyEKfW+YHbbcB5Onw1smFIF2OyI/ZdeyypBjF4OC6212M8GnlKORVv+wtZgZFYAxDjSisaNr4G/tL
	Btrux7JPg7e+DiXkReGOmE5GeBq1Akh0Tk2eU2g8jUQa7nN41ech5SVz47GmAifdVAwCpKsQh9NgS
	voISHMr3y8apHXe3lxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3KBs-006FM3-0q; Fri, 31 Dec 2021 15:51:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3KBg-006FKT-Hy; Fri, 31 Dec 2021 15:51:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id s1so56686836wrg.1;
 Fri, 31 Dec 2021 07:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z2JRwnSemlAssF0xWWxbNdKfXjlM4nM04lo4L/++jM0=;
 b=OY0frir6nXi+ax6kx21OwPIqlAzk9f67w1xJtpBV2Ai9jSVYWKmGFSvoCbfRQVNHWO
 ZXwHgGjN3EVPl0ZaLlnbxxs4pwvmM8InukWDEPzknSl/X5C/hTReyIMLIPiAyysgrLfi
 avdrXFg6DPAi50PmzkHbSC/obIdI4vdO30UXYoGD8HqGbiTIZB2HdcEKhFhOdColNkho
 WLTuBV3YQlHEY/RzAkBluMawMcdKhkJhAfgv3Z9P+2h7nKegUg8mJ1KvpW4O71OaGWLt
 fXDRHrS3sRfnlg2RRBIzAzW/XjwUttImPnKTCR5XYlCZTCjupp3BxalsEitYs2+YW5VY
 +CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z2JRwnSemlAssF0xWWxbNdKfXjlM4nM04lo4L/++jM0=;
 b=MlycfFPGAZMWPIPdEdMix+TLrKjK2Qd+14WXQFm1jGs+BP+WQwm7wIlGZih9Z4rqPC
 aeG5XHdgdnNMSWsEVG5YHBv1owPHgUQXWbef62coyluyV9brkVEDnBC6UP9cbW3/uy5/
 DlH3fCfSmQtmjmL8TdgjpvvH6XTY/gyynUdiD1RcmqHz5WuzO25MuFX3upgt3Hsrxric
 9ny3E8/aXhoqO+qxGk2eiCjxJcUdIHxt54r566r0CdFzArRUino/9oTqc0zkfuxK+ys5
 jG/cXgB2giABzmNT9Sunj1JMD61crAL/fvHhe/L+7QEAbe2uTdCz7OIr87YHgCI5XdbS
 MBVw==
X-Gm-Message-State: AOAM5307iTRYVuSKyqO8p63BVLmBjY9lhaXPPjWoefqQu6pibpH0OQg/
 6MhC2Fw16w/Zan6hGvIVhPc=
X-Google-Smtp-Source: ABdhPJz53Lv49gxLZAUyTXJrUNygCj34P14GobP1ntR8Jm6a0JIRrHzKfnrpio6OsX1bMlXcLpVh0Q==
X-Received: by 2002:a5d:6d50:: with SMTP id k16mr6612671wri.693.1640965881976; 
 Fri, 31 Dec 2021 07:51:21 -0800 (PST)
Received: from [10.0.2.15] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id n15sm26592506wru.66.2021.12.31.07.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 07:51:21 -0800 (PST)
Message-ID: <dda186e0-38e0-4061-f60e-e297441d9fed@gmail.com>
Date: Fri, 31 Dec 2021 16:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 2/2] ARM: mediatek: dts: activate SMP for mt6582
Content-Language: en-US
To: Maxim Kutnij <gtk3@inbox.ru>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211230155152.48715-1-gtk3@inbox.ru>
 <20211230155152.48715-2-gtk3@inbox.ru>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211230155152.48715-2-gtk3@inbox.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_075124_666785_55FD4EEA 
X-CRM114-Status: GOOD (  15.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/30/21 16:51, Maxim Kutnij wrote:
> This patch adds nodes mt6589-smp, pmu and arm,armv7-timer.
> 
> Signed-off-by: Maxim Kutnij <gtk3@inbox.ru>
> ---
>   arch/arm/boot/dts/mt6582.dtsi | 35 ++++++++++++++++++++++++++++++-----
>   1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mt6582.dtsi b/arch/arm/boot/dts/mt6582.dtsi
> index 4263371784c..5efcbf43325 100644
> --- a/arch/arm/boot/dts/mt6582.dtsi
> +++ b/arch/arm/boot/dts/mt6582.dtsi
> @@ -15,29 +15,43 @@ / {
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> +		enable-method = "mediatek,mt6589-smp";
>   
> -		cpu@0 {
> +		cpu0: cpu@0 {
>   			device_type = "cpu";
>   			compatible = "arm,cortex-a7";
>   			reg = <0x0>;
> +			clock-frequency = <1300000000>;

What do we need the clock-frequency for? I wasn't able to figure that 
out right now.

Other then that patches look good.

Regards,
Matthias

>   		};
> -		cpu@1 {
> +		cpu1: cpu@1 {
>   			device_type = "cpu";
>   			compatible = "arm,cortex-a7";
>   			reg = <0x1>;
> +			clock-frequency = <1300000000>;
>   		};
> -		cpu@2 {
> +		cpu2: cpu@2 {
>   			device_type = "cpu";
>   			compatible = "arm,cortex-a7";
>   			reg = <0x2>;
> +			clock-frequency = <1300000000>;
>   		};
> -		cpu@3 {
> +		cpu3: cpu@3 {
>   			device_type = "cpu";
>   			compatible = "arm,cortex-a7";
>   			reg = <0x3>;
> +			clock-frequency = <1300000000>;
>   		};
>   	};
>   
> +	pmu {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_SPI 5 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_SPI 6 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_SPI 7 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> +	};
> +
>   	system_clk: dummy13m {
>   		compatible = "fixed-clock";
>   		clock-frequency = <13000000>;
> @@ -56,7 +70,18 @@ uart_clk: dummy26m {
>   		#clock-cells = <0>;
>   	};
>   
> -	timer: timer@11008000 {
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +		clock-frequency = <13000000>;
> +		arm,cpu-registers-not-fw-configured;
> +	};
> +
> +	timer: timer@10008000 {
>   		compatible = "mediatek,mt6577-timer";
>   		reg = <0x10008000 0x80>;
>   		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_LOW>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
