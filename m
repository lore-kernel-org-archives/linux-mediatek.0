Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA01CA0EED
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjOPsCL9pif2Dzo+gO6BrA45xF7z6Xufo/tepOKlI00=; b=CAQEK8SLnuiPAZX8WuYDTFIGaS
	pfKRaGA/IhP4Wn5i+NXgEdHviLFswZkXJjMhBr8wzfRCgKetQlwNFGKajHiOFvFeaSty0W4GU38zN
	gNep3BVXaqX348cXwJHMBQK6JlFiuyM4wpuEASc//OmjON+iiiR52o1N17GCKi1gy9AQXh+z0urOv
	tNTfAjxBmWEd2Mc2fblO3rSyfKNXynP2ZPfM357iGVDvCLH4AlXFJgI9hluhEhBXAyS2YnKpdcwCh
	EqSu+GRnTUFdcCkYPb+9Eq+T2xeIwBWRUXdS5QpN8EKwRtV/q2AGL7bVzVPe4HX7qh8orJ0j6wwVp
	alKTcPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4Rx-003aqK-2j;
	Tue, 12 Sep 2023 14:33:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4Ru-003aon-3A
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 14:33:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so66686225e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694529183; x=1695133983; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pjOPsCL9pif2Dzo+gO6BrA45xF7z6Xufo/tepOKlI00=;
        b=aebuK9VQS+q8qAMoSk6ED6yJuvWGvaXSVX/b09Z3FQcF0x0LW/PLOk+neSt8Me0HVn
         nMssh2H/m6fXX+fL3sgCFrEJp7oXR/fRmxdSybiHTyktynLS3Od6bwl63kpIEdrUzZky
         /Uu5D4PPeI2RaaYBKpuaj8DS0LHqchEWJ5uy5y0y3WkD75bZU9UrqSvpw8qM2ku0jB2q
         9DcNB/sacwbJlm3YCHAJBco6LW9bQ7Q5cClni20LIa9y1GlHlR46hLfvdMXX6GjVbIwH
         9U1XRGCPc19PuAkG26FMB+IPk4lCKk93De9hK5HqdTD/WKR4JlB3W5KCi4CjKXAfc7LB
         w65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694529183; x=1695133983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pjOPsCL9pif2Dzo+gO6BrA45xF7z6Xufo/tepOKlI00=;
        b=mzji8lMRrhxjbCXBQNVM31AkjPVusIXuWTznmREoMElQJxHwWXc6fPYW4K2RZ6J9Pi
         8updM1YQWCNss/Tt2RD+dddev2SM6ATQ1gEr00mk/e6iXFooCI2BECa15GGfkybPvFpL
         LExcMTjbne7N3NfdY5ildEdMJab5pf07uBLkhQA9+T+w5tCfjayNuu7hhzh9HUQuZG8/
         kK9OGCwva5wUuGL0Iq3QjBArfKNJg3LXSzvWTdGyhc0hPSA3oZbppRcf8Zip620w1W3q
         hGub2JLGTsOvmag++pz7X5HZsPKTTDRd6tYeVMoBzxq5XNtPSPXWVH/aMXLNVeK3u+gt
         i6aQ==
X-Gm-Message-State: AOJu0YyWvl2Mn3FwmZ9zD7SHmzWVcG7ioT04SYF0emxQUyFPOQARavDA
	X2OCWGe5k98gnwLvpufzy6APc6VUtRgcnizgTHs=
X-Google-Smtp-Source: AGHT+IEzH8cxVUEBDoSgEVfX08++Dl8hGSYbGfvofpNJ/6AyLKoIAQHYmSI3l91W4CgRXHSmijLpYw==
X-Received: by 2002:a05:6000:18b:b0:313:e456:e64a with SMTP id p11-20020a056000018b00b00313e456e64amr9419528wrx.21.1694529183231;
        Tue, 12 Sep 2023 07:33:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id c16-20020a5d4150000000b00317a29af4b2sm13016744wrq.68.2023.09.12.07.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 07:33:02 -0700 (PDT)
Message-ID: <7a036d2b-ed59-f581-d018-479cc634617e@linaro.org>
Date: Tue, 12 Sep 2023 16:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: add device-tree for Genio 700
 EVK board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chris-QJ Chen <chris-qj.chen@mediatek.com>
References: <20230912140613.6528-1-macpaul.lin@mediatek.com>
 <20230912140613.6528-2-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912140613.6528-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_073307_017640_4AA0BE43 
X-CRM114-Status: GOOD (  11.08  )
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

On 12/09/2023 16:06, Macpaul Lin wrote:
> Add basic device-tree for the Genio 700 EVK board. The
> Genio 700 EVK is based on MediaTek MT8390 SoC.
> MT8390 hardware register maps are identical to MT8188.
> 
> The Genio 700 EVK has following features:
> 


...

> +
> +	sdio_fixed_1v8: regulator-3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "sdio_io";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	sdio_fixed_3v3: regulator-4 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "sdio_card";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pio 74 0>;

Use proper defines.

> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	touch0_fixed_3v3: regulator-5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "touch_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pio 119 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	usb_hub_fixed_3v3: regulator-6 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_hub_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pio 112 0>; /* HUB_3V3_EN */
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +	};
> +
> +	usb_hub_reset_1v8: regulator-7 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_hub_reset";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&pio 7 0>; /* HUB_RESET */
> +		vin-supply = <&usb_hub_fixed_3v3>;
> +	};
> +
> +	usb_p0_vbus: regulator-8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_p0_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pio 84 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	usb_p1_vbus: regulator-9 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_p1_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pio 87 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	usb_p2_vbus: regulator-10 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_p2_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	touchscreen@5d {
> +		compatible = "goodix,gt9271";
> +		reg = <0x5d>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <6 IRQ_TYPE_EDGE_RISING>;
> +		irq-gpios = <&pio 6 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pio 5 GPIO_ACTIVE_HIGH>;
> +		AVDD28-supply = <&touch0_fixed_3v3>;
> +		VDDIO-supply = <&mt6359_vio18_ldo_reg>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touch_pins>;
> +	};
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3_pins>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default", "default";

Why do you need two default entries? This should be just one, shouldn't it?



Best regards,
Krzysztof


