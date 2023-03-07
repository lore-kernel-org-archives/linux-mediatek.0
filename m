Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3885AC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPn9hdmpl2UVFacYLl02xYuVQeRnjxP3BaQdcHsrd/A=; b=RKM8g3bJoYcMsgVoB5qzd0QJdZ
	H9Qs4gY4RZEQ+W6RwDGJ7ed6FgKm4BR7cv31DW+YzNjrXujtzXPsFYkqB01UJyVxomTtwUM6dea16
	Otv/jYzemGIPBRX8G+zOowKMJG2Qeygwumck/vbr4LLN/P0DI3CSrOqG4OUSYNEsjwS3hA72uejKj
	09BZHeZAQmB5DgHOuPc8OTcOX/O/Jg0GsJQWlw6TjGytW6lXp5gUdif6aOrmgP2hNTJRtIweiXpqo
	go1fD4NqOO0q0tsn3JiDYMGT8FRyzfuwTSA64vKfkKtyi+H9geocTIz4kAJPrut5w0q4GmW93CNIh
	pKd3iLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTue-00H0m4-M8; Tue, 07 Mar 2023 09:47:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTuP-00H0ec-M8; Tue, 07 Mar 2023 09:47:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 82CFC6602FE5;
	Tue,  7 Mar 2023 09:46:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678182416;
	bh=U1npgEe+e+W9htgrcGixuBdy62bSCDwzAojm85LZO/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JiTyZTo30a1wISkfV+5Gp2qvd0719QLSwoGav/k2Ora6GtaUmjyzIFb4nvIMXTdru
	 J1biaUd+gU+Z2vpZvDGyKNsoz+JskgsEAz2J/LhWFAHbXmjjf/decE2qH6/ozPggSq
	 6RA/bSdvMFSS8D6uqzagWXL+G5V0vJV6XlaMPquFWwhJNsghIVBd5Pwnb5Ibegt5H6
	 Mhg39327OAs7vuDEAb/NBfYHgH+7zF0X8ZMqyDBLoV8G2Z5BJIESMyERdUY4XvUaI/
	 FndEubmquYpVEaBFA1W7b6B7DkTtYObFWEDA2Y3BI44/swq5SNWKrbPYwQn7YK8fhO
	 5dZranH5Uvi+A==
Message-ID: <26a93f91-7ffb-ef90-5c15-bfb1f979f819@collabora.com>
Date: Tue, 7 Mar 2023 10:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk
 board
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-mediatek@lists.infradead.org
References: <20221122-mt8365-i2c-support-v3-0-ad9bb1076d7f@baylibre.com>
 <20221122-mt8365-i2c-support-v3-2-ad9bb1076d7f@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v3-2-ad9bb1076d7f@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_014701_890791_7A7F3E7A 
X-CRM114-Status: GOOD (  14.96  )
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

Il 06/03/23 14:47, Alexandre Mergnat ha scritto:
> Enable the I2C0 bus provides communication with:
> - The integrated RT9466 Switching Battery Charger.
> - The integrated MT6691 LP4X buck for VDDQ.
> - The integrated MT6691 LP4X buck for VDD2.
> - The pin header, to plug external I2C devices.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 4683704ea235..b68aee8f229f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -87,6 +87,15 @@ optee_reserved: optee@43200000 {
>   	};
>   };
>   
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;

Address and size cells are useless if there's no subnode of i2c0...
besides that, please keep the properties ordered by name.

clock-frequency
pinctrl-0
pinctrl-names
status

> +};
> +
>   &pio {
>   	gpio_keys: gpio-keys-pins {
>   		pins {
> @@ -96,6 +105,16 @@ pins {
>   		};
>   	};
>   
> +	i2c0_pins: i2c0-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_57_SDA0__FUNC_SDA0_0>,
> +				 <MT8365_PIN_58_SCL0__FUNC_SCL0_0>;
> +			mediatek,pull-up-adv = <3>;
> +			mediatek,drive-strength-adv = <00>;

bias-pull-up;
mediatek,d...
mediatek,p....

Also, "00" is the same as "0", being this not a string... so write it as 0.

Thanks,
Angelo


