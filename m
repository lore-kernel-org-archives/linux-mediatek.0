Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F67CC77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmbKTWrR5Ist8xbfhfIsTWnGuuP3Tj0QFkiF3QCNa5I=; b=aphOjEV4/xriJC
	z8+KQOaBjq1p9mQyDnzXEBJsxLL3v9Vut6DR9HnVt7MePYknXU1N+NAaUy6NyvOuKxCtmIi+3RuLe
	A4rnXDfv6ktjhGM4k2toE03VHZYpeLklrklbkre2mH1j8yWgMe3495tMqXryhcDHF6Xy1VXQK+SIj
	Qqumoxg1Y4/J6cDBDnekE7g+QuXSohzwrp+hC6fOORQegvMz9USf9Np+/2ZysO+DwnkzA7zzr/gmZ
	o+46dNVNZ/RNfhQS1g7iHS3NboTJerNyoRGBIJsQldx0F1iLt2yJRz6gENLJPvhwXrDNKzgbXFBUe
	2WU+KWYIAyrIvRJqp3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fGi-00B1St-0l;
	Mon, 29 May 2023 15:58:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fGg-00B1RN-0B;
	Mon, 29 May 2023 15:58:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30aeee7c8a0so575891f8f.1;
        Mon, 29 May 2023 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685375924; x=1687967924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmbKTWrR5Ist8xbfhfIsTWnGuuP3Tj0QFkiF3QCNa5I=;
        b=eFu0CeBY8gp/40z60b34rH6O04y5Yh8sEMC3WKnYs6lLYSlq5jFOdzdK9a2txRIdlN
         BHa3YeZFukW1UHyj7/6s2dUUos9lezr8zWrHCyeSnvW3MJh4sgfKk2sx2VxOCPI3JSHf
         5H1E1ZNs0g5ZII9ycUlvLr7gkTxe4I4ljkWR1qUJByOI/hntrHAqq/opy8a+Of84Gmgy
         frpEWi04wu7fz8LDKG7aJ7dLxDVaud3g1PogjNHe4VFsPBfxq/kpIOvicfzRP2vv/SRX
         5ZFyIZN7HVJX/A9oaP1lNlIFZ35D0ALu8EaRTPTk2kSxDh2r9xgJj7M/sk3+fd39yGOA
         +//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685375924; x=1687967924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmbKTWrR5Ist8xbfhfIsTWnGuuP3Tj0QFkiF3QCNa5I=;
        b=b/GMBzY16YRkcdmMN1PrgB+qZZ5SW0F52zEoymBSZUOe/wZhU6quzX2qJhErohhRza
         sjZcur1ko8WLO29o2UwnklSxFVCI2seUEyjfQdZHyN0BmrmBXuGQU6EcolSwy0R/OrE9
         QtlwKeTyZzIk2GzPlctu2XzjQ6QWwqumi+8FdmXPi+5kep/h9BVOw4KPjVSLtEmkC7nX
         QRGCoRBIDK0M8rAT5j50737rP7BZu1JSwBcMZr9moDPKnAmsEcxc5UVWl2FBto77hR4M
         qgFwYTRZ9YDUMLMtD9PL3hv1h1C09Gq3RWSSRKWijxHh2HyiRgNy0O25tG0547MpWEGm
         pB/Q==
X-Gm-Message-State: AC+VfDwtRv76nq/cmyhNE3lzy09XKV2nAi34LXBfFHRgYjqSKRqCeTM7
	iP4K0hOPKDhcoyER5blccyI=
X-Google-Smtp-Source: ACHHUZ6k7FdIrg5GktNfDGImRYatKh5VSOf6eWINqdYV4QBqmmd72yfSLLQ9HTcoaAYIzzukk93u9Q==
X-Received: by 2002:a5d:6584:0:b0:307:f75:f581 with SMTP id q4-20020a5d6584000000b003070f75f581mr7270131wru.18.1685375924532;
        Mon, 29 May 2023 08:58:44 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o1-20020a5d4741000000b002f9e04459desm324601wrs.109.2023.05.29.08.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 08:58:43 -0700 (PDT)
Message-ID: <3c635ce1-71b0-9079-836c-1a628a19414d@gmail.com>
Date: Mon, 29 May 2023 17:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 5/7] arm64: dts: mt7986: add PWM to BPI-R3
Content-Language: en-US, ca-ES, es-ES
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230421132047.42166-1-linux@fw-web.de>
 <20230421132047.42166-6-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230421132047.42166-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_085846_091128_6FD3EDA7 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/04/2023 15:20, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add pwm node and pinctrl to BananaPi R3 devicetree.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied, thanks

> ---
>   .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts   | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index 2b028141f1f7..782519429497 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -274,6 +274,13 @@ mux {
>   		};
>   	};
>   
> +	pwm_pins: pwm-pins {
> +		mux {
> +			function = "pwm";
> +			groups = "pwm0", "pwm1_0";
> +		};
> +	};
> +
>   	spi_flash_pins: spi-flash-pins {
>   		mux {
>   			function = "spi";
> @@ -344,6 +351,12 @@ mux {
>   	};
>   };
>   
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm_pins>;
> +	status = "okay";
> +};
> +
>   &spi0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&spi_flash_pins>;

