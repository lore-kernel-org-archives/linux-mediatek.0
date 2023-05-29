Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86297C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkVD5uNKLXho+93j6yXeIdGEkFo+SItch2wdaTfZzF4=; b=P3Mzbv1qbMlFpcWVlh3PCBcxmZ
	fNFE06n1livxsksPWA/RNqYBVF+8GTvfU665Wu7wIrEtaW/2K/gVdteqrGKZ69nq2Eu8JM7ilAmTy
	NmrZ+Kb42SjbDxQeB653KXAqkuk7KN5t/Ew36ECtMb0L04+M9VZRTKSaY+iOniI5Upt35bmlTecgM
	4DND5juwBE93Kn+TjmSPPUI9b8X9EqDOKRkBIqJpN6RLy7QJGAX8toeHH4KcFWP/Z8/eCV+oXez1m
	XKut2SZosDyMjfmvXQhgJAvxG8crUzxjd/5ia3SkKdbwwnmAFFXHT0w3Jkuax5KPDhYpBOHEm4l86
	MNgBGeKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dRC-00AhSS-0S;
	Mon, 29 May 2023 14:01:30 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dR8-00AhQd-35;
	Mon, 29 May 2023 14:01:28 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30ae69ef78aso980627f8f.1;
        Mon, 29 May 2023 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685368884; x=1687960884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rkVD5uNKLXho+93j6yXeIdGEkFo+SItch2wdaTfZzF4=;
        b=C8jexQLFK7fIrq5hMh29fnNYYCZQHc49p8HRIM5JHUgM4KuH+lyrtzwU8rn9/yeadB
         9JYXQjgZaX99pzBa2fVTzAVeIpk/wElSxYrTMu0+oeNaJfSGwg7nQMDKnLQniSb8VPF0
         6t/CiNN2IWiqXzQCJa+3H68BSoEJouPRp1dhpEKNspKTwlplGQo1X/klW76s4LqmacVb
         ncWvJ75VEhzilUyIYh8n8ZqMbIwZspLoKhKA6qyqhEOi46eYZOISn/3/JSkzs25PaiAV
         gADmrHGgPmE5JnbpiGvfddF7CVbs9fw+d/cON2F3bR3gb7wgYa1sr3ulwtht+Va+VjOs
         A9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685368884; x=1687960884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkVD5uNKLXho+93j6yXeIdGEkFo+SItch2wdaTfZzF4=;
        b=XuHWyBBgwX206EHUR0tZ2s2i3oFEzx4WhlL2Q15qvbmQfc42+GC+QUw94xxRz6ohuU
         jetIgB5fFXovYgrlhJ/bSe9FNALCYBOL3OHHCqktYdGw8v0NaFMidL/hcrh7G4RKsaPp
         ubfcp4V8jJtYBjSkHqF36KyTh45V14ZZMrsoD+jhwDKTQDP6xYSZyVO6OuzwLpdTUpfe
         XRRykMnvs3ysJM6iQCK9z++BXlqTQcA/gbaEzHHxlaK+MSUsWSN3eJtBj75lpoUAUQAs
         ZQ9hpgaU4omWMV5Txb2eDn4teZ3qzDS5rAo5h9XpbJ4qJaryB1BcVtfH6kH0GoCSnJ3x
         HFqg==
X-Gm-Message-State: AC+VfDxXxm0Gq5f1/r1a1816dCNpm24+gW5MbqYYY4607Ne2r/qXchYQ
	wQ/PavfSjzNjvaIGYfeoI7Y=
X-Google-Smtp-Source: ACHHUZ61i21IzzVJYxeHp9DzEw7W00OUTsqZ1efYzky4ahkIIyaYvbeNiPCUyPUefgpCOGfRZCmSBw==
X-Received: by 2002:a5d:4592:0:b0:2ef:d0de:e8a4 with SMTP id p18-20020a5d4592000000b002efd0dee8a4mr6317453wrq.25.1685368884120;
        Mon, 29 May 2023 07:01:24 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k5-20020adff5c5000000b0030af1d87342sm92246wrp.6.2023.05.29.07.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 07:01:23 -0700 (PDT)
Message-ID: <674cecd6-931a-9949-8a81-aa5dd1960b84@gmail.com>
Date: Mon, 29 May 2023 16:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 25/27] arm64: dts: mediatek: mt6795-xperia-m5: Add eMMC,
 MicroSD slot, SDIO
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-26-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-26-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_070126_997298_B56ED75C 
X-CRM114-Status: GOOD (  14.15  )
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Configure and enable the MMC0/1/2 controllers, used for the eMMC chip,
> MicroSD card slot and SDIO (WiFi) respectively.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 91 +++++++++++++++++++
>   1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> index debe0f2553d9..155a573eac4c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> @@ -17,6 +17,7 @@ / {
>   	aliases {
>   		mmc0 = &mmc0;
>   		mmc1 = &mmc1;
> +		mmc2 = &mmc2;
>   		serial0 = &uart0;
>   		serial1 = &uart1;
>   	};
> @@ -121,7 +122,97 @@ proximity@48 {
>   	};
>   };
>   
> +&mmc0 {
> +	/* eMMC controller */
> +	mediatek,latch-ck = <0x14>; /* hs400 */
> +	mediatek,hs200-cmd-int-delay = <1>;
> +	mediatek,hs400-cmd-int-delay = <1>;
> +	mediatek,hs400-ds-dly3 = <0x1a>;
> +	non-removable;
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_pins_default>;
> +	pinctrl-1 = <&mmc0_pins_uhs>;
> +	vmmc-supply = <&mt6331_vemc33_reg>;
> +	vqmmc-supply = <&mt6331_vio18_reg>;
> +	status = "okay";
> +};
> +
> +&mmc1 {
> +	/* MicroSD card slot */
> +	vmmc-supply = <&mt6331_vmc_reg>;
> +	vqmmc-supply = <&mt6331_vmch_reg>;
> +	status = "okay";
> +};
> +
> +&mmc2 {
> +	/* SDIO WiFi on MMC2 */
> +	vmmc-supply = <&mt6331_vmc_reg>;
> +	vqmmc-supply = <&mt6331_vmch_reg>;
> +	status = "okay";
> +};
> +
>   &pio {
> +	mmc0_pins_default: emmc-sdr-pins {
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO154__FUNC_MSDC0_DAT0>,
> +				 <PINMUX_GPIO155__FUNC_MSDC0_DAT1>,
> +				 <PINMUX_GPIO156__FUNC_MSDC0_DAT2>,
> +				 <PINMUX_GPIO157__FUNC_MSDC0_DAT3>,
> +				 <PINMUX_GPIO158__FUNC_MSDC0_DAT4>,
> +				 <PINMUX_GPIO159__FUNC_MSDC0_DAT5>,
> +				 <PINMUX_GPIO160__FUNC_MSDC0_DAT6>,
> +				 <PINMUX_GPIO161__FUNC_MSDC0_DAT7>,
> +				 <PINMUX_GPIO162__FUNC_MSDC0_CMD>;
> +			input-enable;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		pins-clk {
> +			pinmux = <PINMUX_GPIO163__FUNC_MSDC0_CLK>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins-rst {
> +			pinmux = <PINMUX_GPIO165__FUNC_MSDC0_RSTB>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +	};
> +
> +	mmc0_pins_uhs: emmc-uhs-pins {
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO154__FUNC_MSDC0_DAT0>,
> +				 <PINMUX_GPIO155__FUNC_MSDC0_DAT1>,
> +				 <PINMUX_GPIO156__FUNC_MSDC0_DAT2>,
> +				 <PINMUX_GPIO157__FUNC_MSDC0_DAT3>,
> +				 <PINMUX_GPIO158__FUNC_MSDC0_DAT4>,
> +				 <PINMUX_GPIO159__FUNC_MSDC0_DAT5>,
> +				 <PINMUX_GPIO160__FUNC_MSDC0_DAT6>,
> +				 <PINMUX_GPIO161__FUNC_MSDC0_DAT7>,
> +				 <PINMUX_GPIO162__FUNC_MSDC0_CMD>;
> +			input-enable;
> +			drive-strength = <MTK_DRIVE_6mA>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		pins-clk {
> +			pinmux = <PINMUX_GPIO163__FUNC_MSDC0_CLK>;
> +			drive-strength = <MTK_DRIVE_6mA>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins-rst {
> +			pinmux = <PINMUX_GPIO165__FUNC_MSDC0_RSTB>;
> +			drive-strength = <MTK_DRIVE_6mA>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins-ds {
> +			pinmux = <PINMUX_GPIO164__FUNC_MSDC0_DSL>;
> +			drive-strength = <MTK_DRIVE_6mA>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +	};
> +
>   	nfc_pins: nfc-pins {
>   		pins-irq {
>   			pinmux = <PINMUX_GPIO3__FUNC_GPIO3>;

