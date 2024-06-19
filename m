Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556DFC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16lhZi8VM4irYMIaYGt3idJs/zlp4m10GthVYElWugo=; b=WL18YpNomAQRiLnLXJvn9zBH6w
	b+3LRUDFXvQWDRyUh2/xSmutMk7RpBTM9rH6wfFMQGK3Hy6O6WWxR2PSBDLuK8XfoLW3WnztREngS
	OVoH7i2uVvyyVQ/lPUpOjwZEB34104Zw3XSk/pNfWUYP8kl7Vr6WH/rr3ZPcQQ4B0mjrauJIpkxmX
	36zrUnTZcIndUZPDTSpu00zBnh0lqBDeP6odWIrcncFb7FuJ/hCwN9B2bEN3JBQTK7WEatR2IiGXC
	ZQ7nRCn9vy6afdB2oYsO6E4e05Egypfd1zCrGDJP4fAghJ1j3nEQvwJ57aiKN69r6vlk6F00k2NjL
	eXN0fGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsAj-00000000hxo-0Zt3;
	Wed, 19 Jun 2024 10:04:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsAf-00000000hws-0DQl;
	Wed, 19 Jun 2024 10:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718791443;
	bh=1jy39YZMTY/xo2Xcx2D3ihcV+xB/O1q/kuNvRc7QFu8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xqFCQkCsIpMrEzpcF0IxEbzd6OHXGJq3FH9PM/lyvWAa2BStAnwwHgQmXIb641aDk
	 zU3es9+UcmQOVru0Sf7mM5JNtcr94qWID1O6UKMzlU4ijhqUJWzwuE5IbuNhxH1tF7
	 8reazt1X/m+XtFs2r1lRuDRhjDtlvdq7dTY0w2Pj6iWe1COkKqsyk1tephTMv+gdyW
	 OpPLfR4oEiDeUOQQHDVxukgwpZyMTqS37b72UZZq0OodI/FSfazpuE1+JNIeTYIQS1
	 5+CeO5IL0kChUJoNPf5yfGmyzab3CBwBKA5O5lrc40UTg8G0U66jjDLUbqxP+pugx/
	 RzkEwjiazlkow==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E95213782163;
	Wed, 19 Jun 2024 10:04:01 +0000 (UTC)
Message-ID: <d09deba3-1687-4062-b8ad-7610a18a270e@collabora.com>
Date: Wed, 19 Jun 2024 12:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 16/16] arm64: dts: mediatek: add audio support
 for mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-16-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-16-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_030405_289366_915E15B8 
X-CRM114-Status: GOOD (  16.08  )
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

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add the sound node which is linked to the MT8365 SoC AFE and
> the MT6357 audio codec.
> 
> Update the file header.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 89 +++++++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 50cbaefa1a99..1d5457f9a4c2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -4,6 +4,7 @@
>    * Authors:
>    * Fabien Parent <fparent@baylibre.com>
>    * Bernhard Rosenkränzer <bero@baylibre.com>
> + * Alexandre Mergnat <amergnat@baylibre.com>
>    */
>   
>   /dts-v1/;
> @@ -86,6 +87,28 @@ optee_reserved: optee@43200000 {
>   			reg = <0 0x43200000 0 0x00c00000>;
>   		};
>   	};
> +
> +	sound: sound {
> +		compatible = "mediatek,mt8365-mt6357";
> +		pinctrl-names = "default",
> +				"dmic",
> +				"miso_off",
> +				"miso_on",
> +				"mosi_off",
> +				"mosi_on";
> +		pinctrl-0 = <&aud_default_pins>;
> +		pinctrl-1 = <&aud_dmic_pins>;
> +		pinctrl-2 = <&aud_miso_off_pins>;
> +		pinctrl-3 = <&aud_miso_on_pins>;
> +		pinctrl-4 = <&aud_mosi_off_pins>;
> +		pinctrl-5 = <&aud_mosi_on_pins>;
> +		mediatek,platform = <&afe>;
> +	};
> +};
> +
> +&afe {
> +	mediatek,dmic-mode = <1>;
> +	status = "okay";
>   };
>   
>   &cpu0 {
> @@ -178,9 +201,75 @@ &mt6357_pmic {
>   	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
>   	interrupt-controller;
>   	#interrupt-cells = <2>;
> +	vaud28-supply = <&mt6357_vaud28_reg>;
> +	audio-codec {
> +		mediatek,micbias0-microvolt = <1900000>;
> +		mediatek,micbias1-microvolt = <1700000>;
> +	};
>   };
>   
>   &pio {
> +	aud_default_pins: audiodefault-pins {
> +		pins {

clk-dat-pins

> +			pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
> +				 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
> +				 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
> +				 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
> +		};
> +	};
> +
> +	aud_dmic_pins: audiodmic-pins {
> +		pins {

clk-dat-pins

> +			pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
> +				 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
> +				 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
> +		};
> +	};
> +
> +	aud_miso_off_pins: misooff-pins {
> +		pins {

clk-dat-pins

and same for all the others.

> +			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
> +				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
> +				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
> +				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
> +			input-enable;
> +			bias-pull-down;
> +			drive-strength = <MTK_DRIVE_2mA>;
drive-strength = <2>;

> +		};
> +	};
> +
> +	aud_miso_on_pins: misoon-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
> +				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
> +				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
> +				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
> +			drive-strength = <MTK_DRIVE_6mA>;

= <6>;

> +		};
> +	};
> +
> +	aud_mosi_off_pins: mosioff-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
> +				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
> +				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
> +				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
> +			input-enable;
> +			bias-pull-down;
> +			drive-strength = <MTK_DRIVE_2mA>;

= <2>;

> +		};
> +	};
> +
> +	aud_mosi_on_pins: mosion-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
> +				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
> +				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
> +				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
> +			drive-strength = <MTK_DRIVE_6mA>;

= <6>;

Cheers,
Angelo

