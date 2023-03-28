Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8659BC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpBZTdqMjlU/vGciZb/3ZMJnMul+z4QLb56fLb/HDrE=; b=Z3L1ou+eOgBrkBxrdYzAXREc9U
	AX7fTbSjuhfVkKHceEu5PX/HUCIcafNdrxyOxTOd+00Aj8yG+0J9wifKasNBISNFOQvbvkhYQhDxc
	XwmPgtmVjfVOkXrX0YqKDIIPMthVYZ0xIEOOjqImuTcbWI9QA3XRONAIhpPEGKUnTvzEsjrWy0sNo
	uR5abWy7eL1lBaI6oi/1LgYxkrZf0OFZ1ULqntOU+k8Ues/wzqMoKwCr9qDgg2G0/9/uzgHvJj+ZC
	X3vUuJFK+qeSpbhxxn+Ydw9CbAFhDAk+cVIfmhqG2IEiQmBMPkMmn3kGC8Udo32V50ZX28L1NX1Um
	hfO1en5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6CR-00DpwC-0d;
	Tue, 28 Mar 2023 10:05:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6CN-00Dput-2J;
	Tue, 28 Mar 2023 10:05:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A867660313B;
	Tue, 28 Mar 2023 11:04:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679997899;
	bh=4iSxXbSBTVuKdjHaZLko5Y/yilWjU8OEvKfVGbRMxrg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kEksG60bjxqc7rREEJhdtoK7A+pgoEmjvU3lbUpuxhY9yFD0shUKBCam68l4fbp2/
	 yT76hFXBY1lkn3Rq1Jz8X5OfNI68bIUfiwSOHNQxPpibaRjQ+OLJZ3bSylUB5kbnbq
	 OYia2iAqDZ+EYbGEvwK3wP4go1v9i0+jR0btTI0Bx5ibEIs6672a+lKFDmnPAn3lVp
	 Ov9HZ+jTOCiRR6f0rIfhKUoVmKMZaj5msoTKCDxpQYpr5gKc8honcBhIKCfTM8aZHd
	 wHbK87uAHWtPf5SMUZl45w5NLDAteoV2oRd0ll57G1f5Q0QZOrTLgecqM6hbhCmmHK
	 C/OqwQpJ+fgtg==
Message-ID: <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com>
Date: Tue, 28 Mar 2023 12:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk
 board
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh@kernel.org>
References: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
 <20221122-mt8365-i2c-support-v6-2-e1009c8afd53@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v6-2-e1009c8afd53@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_030503_908738_4D5CB597 
X-CRM114-Status: GOOD (  13.81  )
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

Il 28/03/23 11:04, Alexandre Mergnat ha scritto:
> Enable the I2C0 bus provides communication with:
> - The integrated RT9466 Switching Battery Charger.
> - The integrated MT6691 LP4X buck for VDDQ.
> - The integrated MT6691 LP4X buck for VDD2.
> - The pin header, to plug external I2C devices.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 4683704ea235..adc79ba14b33 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
>   	};
>   };
>   
> +&i2c0 {
> +	clock-frequency = <100000>;
> +	pinctrl-0 = <&i2c0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>   &pio {
>   	gpio_keys: gpio-keys-pins {
>   		pins {
> @@ -96,6 +103,14 @@ pins {
>   		};
>   	};
>   
> +	i2c0_pins: i2c0-pins {
> +		pins {
> +			bias-pull-up;

I prefer seeing pinmux first, any other properties last....
If Matthias can please fix that while applying...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



