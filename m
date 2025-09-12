Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B86CAC58F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lthXnEjSvsHbapckxRc04Ei+riXtEdUUKc9+Bt6m9I4=; b=CAwIoaTMM2iqVp
	BEzTipBYfbOWi3NBQw4IgcPyMLzxzr0exobvvOgrosG1nByfCp2c+mAQJr78HJK2QWxRvC7Z0TjOi
	AlTXHx8JYJJjOnF8b4gXT7rlWuuN4P7C3AS6cSODYdwKdwv6IRWZzPCCxK972RkhY1SFKla0Ixc5h
	UIOtg4pwgHWaqv40uVQCtLXJdknHQ3Tdnki7t5wGwQ7zr50MuqjAJKfaugaSx7YS/ghxTjyNB9qSs
	dxG1W368SVqXkh7qkzsghLdjJjvXTB+B/h6MAAl02HG+Dw3bpe62eVNU3Oz/o3aPZ6w0zU8a03sjx
	ZG4kIe3NL6EHVRhLFpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4dt-00000009pZK-0Gls;
	Fri, 12 Sep 2025 14:20:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4dp-00000009pWO-28j7
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 14:20:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso15166275e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 07:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686844; x=1758291644; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lthXnEjSvsHbapckxRc04Ei+riXtEdUUKc9+Bt6m9I4=;
        b=k0AhWqyaFOwvJ96+ChNVUACWkfZfkCt+pWvAaXyYMFPQJan0cg/9CY/a/rH8q19H7h
         mBXmqX/iMSpepMYqDPNM0+0DmgDp0O6STv9afQ31F+lou7N+vfBY/xlZp15rqL9G0bSB
         q/6K1GBq+A9XSeu53QlDj8oZdVQjChn+l6juw/QynfsB/i+BWH2T73esa2dC3QawPlSi
         i69x9yPHxWkWMbkGaOsnuzs4p1stkxFA1E3x6ziJepyHK/14N+LvImQTYffvYNfjU5oW
         lHvpcukrm8nMdtM9wdPUEl6vRPRlBbyN4hkRNB7xTlQD8ogbLiSCSWgV+lt2Zb6plP/C
         jHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686844; x=1758291644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lthXnEjSvsHbapckxRc04Ei+riXtEdUUKc9+Bt6m9I4=;
        b=o0d8yCIUW6iSdUXyKtghVWZfh7/AWnzXLXgNIP9LB2cS1zedOyRa9P/CIMYNFbF5vs
         ifzJBel/Zy42EXljSaxc8PTAun7pKad0Gazs70LrbXHVb/H5MD2Ex9GPCKk6B2aMYv5V
         15TIyRDB8qaa3qe5gCHU7CVr+sDJmqiFBxqMAjC8YVuFPwKD3a0j8hnr1WIVrL1V1rDp
         OqzDEfpk5oZm5zdVNcYgZCoUXSoDfOwFejz0TzrR6CFYY8Ne1zMj0Mxd1H0JFIJNb3/S
         8S99GKsEhahwdKuerRxYCid+BFVcN3wIMyGbrBLOIxw7L+YQldp1ZPAXjC84NF3ry2gg
         9lOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjuzbIVy4DOHdagb6pMSr2CjQMsW+cQ2+7e8YyFSwwEwNnWaEknx1JoE/mqydBhDvzLdUcrrf/6RxR6snkkg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/iP+gUnIf9+SXT2WTCXBQZcNFmCsyHXvgPFt3gTp2Lt9L4xNw
	heYmLFZ6YHq/5mA5AItYxXvFt79EX/xpMvdCVCxhz1vm4U3wUYvXmFeF
X-Gm-Gg: ASbGncv5PMdoZbftLB0OxuLd2ERCAUhZ3TWrcJPkyu5TTSktgK4GpfgBJdFfGuuPLWd
	hq0xVPQBcLCO6lckI8fCk8lLRy/qaOZhuGaYVnWiLPR0DvyjJaTWnKUEgzWIi7qJ9UKE/pZLFXE
	WRcw5eqIZesx3JcW+0pEIgDS9Mt3l0Xg/I1JCFrTlG/sunKcOYZsw6gJVYFmaYLe0ZQHfP60gFQ
	8lcw5UuW7ijdbUJ8F0NiFnx3bALCP2jQaCB58uVcggMOrwG9O/696t0jWCshrOEEvupJMS+74aF
	1c6J/uAPCRg4dRjEVj2zCMUxbzhToUigKJ1hUykeZQx8rSiwZlxEDDPM85lM3v+wO5ibhaVGEjD
	WavAEZcXLj4Jpsh0ssk4Sb2L42wW9qxfvO/M8mBwTkRl2zqxwqqld
X-Google-Smtp-Source: AGHT+IFqrxlW5v3Vy46wYJ2sE/wtXVC2vb0Byrr7NgxSOjj9QTmCoTJsKTMUA+e1n+AH0Kve613Tyw==
X-Received: by 2002:a05:600c:6b06:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-45f211d0795mr28833695e9.10.1757686842371;
        Fri, 12 Sep 2025 07:20:42 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d7595sm63116405e9.24.2025.09.12.07.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:20:41 -0700 (PDT)
Message-ID: <3b3197b7-3e60-4a1a-b6bb-3a0a0ef1fdd4@gmail.com>
Date: Fri, 12 Sep 2025 16:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/38] arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C
 node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072045_592033_907736F7 
X-CRM114-Status: GOOD (  13.56  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> The binding wants the node to be named "i2c-number", alternatively
> "i2c@address", but those are named "i2c-gpio-number" instead.
> 
> Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
> dtbs_check warnings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index ed79ad1ae871..6d2762866a1a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -64,23 +64,19 @@ wps-key {
>   	};
>   
>   	/* i2c of the left SFP cage (wan) */
> -	i2c_sfp1: i2c-gpio-0 {
> +	i2c_sfp1: i2c-0 {
>   		compatible = "i2c-gpio";
>   		sda-gpios = <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>   		scl-gpios = <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>   		i2c-gpio,delay-us = <2>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
>   	};
>   
>   	/* i2c of the right SFP cage (lan) */
> -	i2c_sfp2: i2c-gpio-1 {
> +	i2c_sfp2: i2c-1 {
>   		compatible = "i2c-gpio";
>   		sda-gpios = <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>   		scl-gpios = <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>   		i2c-gpio,delay-us = <2>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
>   	};
>   
>   	leds {


