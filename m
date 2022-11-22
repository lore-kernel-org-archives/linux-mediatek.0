Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF26C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 17:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nhEEaoh/VcXJH4n5hY98SxMNK4kG9V8xGcvOhwOUOA=; b=ZqiMkk9T2lcEILv6jOm0ysX90M
	KsLFIL7cUlCeObjACUOKqrNU9C8MM6+qijG0Z60JWIYR0CqJeSxNaY9WyRp0u+iN8pdtNdapsZCC+
	QhHSH2T0VziFMVrSF7h4GjxsmcWDCc8+pzTtWsua+854NbK94Nap9Z4aRqP2/wzfJKI5kxNW35sTj
	cLKxWZ9+QRh+oFCN8P1Cq01Fm8UBj9eB4fyQTiIbyzcoOGvnZNE29rKqR5lERQAjiXwThyLDMf9dY
	CD05ER+toVO1jWiK3dVzhSK/TyWwB6fIJAmMzPfhe+SewsedXmlrYsa7gwL5bE6XQsguor4nBLnBB
	zwxE1bBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWgO-00AvM0-7M; Tue, 22 Nov 2022 17:03:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWgL-00AvFy-P6; Tue, 22 Nov 2022 17:03:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5so11179835wmo.1;
        Tue, 22 Nov 2022 09:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nhEEaoh/VcXJH4n5hY98SxMNK4kG9V8xGcvOhwOUOA=;
        b=ey4I+T4vbFBZcvd6BvzRMjTIz59KfQQfa6B849ysx9rZqbkcIR0s8BJyLfeTNOLRU3
         BtUfba4qm1vJvxtixgSLo+oATBWNkSFax+j6HO1vUpzovNblxSuZt/tkPnFSbr3t1Poz
         rl9xRtU6HA1nWn7Y54XMDxlund8gOrmAVmndv4BjnZswrzDavoAt/rIEPcOGwRWTIKCm
         s5OrgAmWjOFVyNYgI+RhdxN1x808VrVMX/1AfZ/M71khiA7og+TzRUz2r0M4oCe2maFY
         7OPuCVn9IeVAToljsMqDxgXvE8PypYjPcoLtysfpQhPS0Q+gr0hql5O96lGoVP0EXAap
         IgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nhEEaoh/VcXJH4n5hY98SxMNK4kG9V8xGcvOhwOUOA=;
        b=dg9Xm1I+aFTTR9rsaw5D5hUZjWa+h61ga1hBecj1rzrmJ3uVic88us9AsdO5OQdOPm
         zgKVVaIS8V3um/88Bxra2oHRg29tAFh7t6tobK+WgagIjTFU9GRhnHvB/t3w44SJfQ/+
         bAKEEK1V6lPPz6Z5vRbNlDh688C2cXrO8v7mYhV7aFSqKD4xZsrU/++No13kwyRXNsIK
         NGROGeP6bf2P6nXENkKEbYho+IBn4cpWzZI5LvXlT21RTaM8lSv/O+PNqBmlt/NM8Ejt
         99/FkMl7nQfYLX0XNYJ/pMf1kayRreSSerdgnwUFqO96DkPMdv7XA27Oi4waGQ0nXgxI
         JG6A==
X-Gm-Message-State: ANoB5pnnh/u9jcyBtwXP7KdTcIdRr8R7jEjuGV+ZdyhP3FeYQhHM0+Be
	dUriZRVzrFkS6587LvNiAA8=
X-Google-Smtp-Source: AA0mqf5aTg8+S6uKEPj96utoXf8duBP36uWZVEQIF3e+FSkl7cFIK1CtvtjgkYxB8bZEzb9G39gmIA==
X-Received: by 2002:a1c:7513:0:b0:3cf:8896:e1c9 with SMTP id o19-20020a1c7513000000b003cf8896e1c9mr20286552wmc.119.1669136612325;
        Tue, 22 Nov 2022 09:03:32 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id q3-20020adfcd83000000b0022eafed36ebsm14609696wrj.73.2022.11.22.09.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 09:03:31 -0800 (PST)
Message-ID: <992ba484-b1d3-4ea6-1904-78b0dd913380@gmail.com>
Date: Tue, 22 Nov 2022 18:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 7/7] ARM: dts: stm32: Remove the pins-are-numbered
 property
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 krzysztof.kozlowski@linaro.org, angelogioacchino.delregno@collabora.com,
 khilman@baylibre.com
References: <20221122010753.3126828-1-bero@baylibre.com>
 <20221122010753.3126828-8-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221122010753.3126828-8-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_090337_852845_51958A1D 
X-CRM114-Status: GOOD (  12.83  )
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



On 22/11/2022 02:07, Bernhard Rosenkränzer wrote:
> Remove the pins-are-numbered property from STM32 DeviceTrees
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 1 -
>   arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 1 -
>   arch/arm/boot/dts/stm32h743.dtsi       | 1 -
>   arch/arm/boot/dts/stm32mp131.dtsi      | 1 -
>   arch/arm/boot/dts/stm32mp151.dtsi      | 2 --
>   5 files changed, 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> index 500bcc302d422..4523c63475e4c 100644
> --- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> @@ -51,7 +51,6 @@ pinctrl: pinctrl@40020000 {
>   			ranges = <0 0x40020000 0x3000>;
>   			interrupt-parent = <&exti>;
>   			st,syscfg = <&syscfg 0x8>;
> -			pins-are-numbered;
>   
>   			gpioa: gpio@40020000 {
>   				gpio-controller;
> diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> index 8f37aefa73150..c8e6c52fb248e 100644
> --- a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> @@ -15,7 +15,6 @@ pinctrl: pinctrl@40020000 {
>   			ranges = <0 0x40020000 0x3000>;
>   			interrupt-parent = <&exti>;
>   			st,syscfg = <&syscfg 0x8>;
> -			pins-are-numbered;
>   
>   			gpioa: gpio@40020000 {
>   				gpio-controller;
> diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> index 28e3deb20e1e1..f30796f7adf36 100644
> --- a/arch/arm/boot/dts/stm32h743.dtsi
> +++ b/arch/arm/boot/dts/stm32h743.dtsi
> @@ -588,7 +588,6 @@ pinctrl: pinctrl@58020000 {
>   			ranges = <0 0x58020000 0x3000>;
>   			interrupt-parent = <&exti>;
>   			st,syscfg = <&syscfg 0x8>;
> -			pins-are-numbered;
>   
>   			gpioa: gpio@58020000 {
>   				gpio-controller;
> diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
> index 2a9b3a5bba830..adaee0f9e1263 100644
> --- a/arch/arm/boot/dts/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/stm32mp131.dtsi
> @@ -549,7 +549,6 @@ pinctrl: pinctrl@50002000 {
>   			ranges = <0 0x50002000 0x8400>;
>   			interrupt-parent = <&exti>;
>   			st,syscfg = <&exti 0x60 0xff>;
> -			pins-are-numbered;
>   
>   			gpioa: gpio@50002000 {
>   				gpio-controller;
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 5491b6c4dec20..4e437d3f2ed66 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1660,7 +1660,6 @@ pinctrl: pinctrl@50002000 {
>   			ranges = <0 0x50002000 0xa400>;
>   			interrupt-parent = <&exti>;
>   			st,syscfg = <&exti 0x60 0xff>;
> -			pins-are-numbered;
>   
>   			gpioa: gpio@50002000 {
>   				gpio-controller;
> @@ -1789,7 +1788,6 @@ pinctrl_z: pinctrl@54004000 {
>   			#size-cells = <1>;
>   			compatible = "st,stm32mp157-z-pinctrl";
>   			ranges = <0 0x54004000 0x400>;
> -			pins-are-numbered;
>   			interrupt-parent = <&exti>;
>   			st,syscfg = <&exti 0x60 0xff>;
>   

