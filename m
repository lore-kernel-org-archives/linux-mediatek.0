Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F3AC7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTTEEvnfaaPFDLZtelR+S5p0shdfiorMDHxF6386O5A=; b=49k/FKWYWgAH5ZBz7Jh9MuC6Bm
	ZKRds90i2oPNLeXzrRuTvlu6gAHGIYG9js3ICxJ2/ozHvdgjy65Z+yvWXHJWy1cBK4lJTG+8FI5J4
	+YAB0B4WpKYskeBpkMhEgR5Yz8pqkRti4F3PtfX1NgIxE6kz35yGNPjiq1GfgQF5v6IyxciIH5hO1
	YnM7ixtF0rPuk5Vp4ZO0k+gApt2KhkpEkM3z/tC8u54AZSSMixVu3feyO0WVAQKXtlq3msDIatEwe
	3IYU/Wf8CeHrCMFG1QnBqFn1L8AzQyZAscI7CsEygWXxQ0IWj9zqbqlzhvwXICqvXL/Y3vJ8KhoPM
	avW0HE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ds1-00AmAZ-2M;
	Mon, 29 May 2023 14:29:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3drz-00Am8O-1M;
	Mon, 29 May 2023 14:29:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30ad8f33f1aso1966432f8f.0;
        Mon, 29 May 2023 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685370544; x=1687962544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fTTEEvnfaaPFDLZtelR+S5p0shdfiorMDHxF6386O5A=;
        b=bM6ehbQSDwSwxlR9EoZFk1dUdftpBXWcd7WNMJZNrCoh0YijQyz9JywwmLuYzlDYg2
         Tu9hqXUyqkQ3vZjjen8xAJLtMmwOT41YE5M9uPIWu7G3HLqVtu3Z0S75m9G37YBowiSX
         7uVcoJYvkh/YFyOPTtz6R5i6ywywObtF9kUg1fi7JdXWW/2kHce/vq4ibtLyiLLYBBbS
         10H25x/5qeZa18CUecinpUrBvfWgWE+SNd1GkXTpkBcwzDosTTmhfb8tWx8ky+6lYyKY
         pVvjOPmlMdvFZyiiaoqVJVCyf3Oo05ZhlR5ehF2iF0J/wGaS/WA9Quop/LVq3pSW6zv0
         ihvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685370544; x=1687962544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fTTEEvnfaaPFDLZtelR+S5p0shdfiorMDHxF6386O5A=;
        b=PkN8iha+VNMoi0SoyEYAi8nRGzvpQKPAF5hRQYO5uV8+nneiuwzODJm54qEoAk07V+
         JZHftXibZccHnGg97o+cERfTRXPVZJ0f41TXbpJ6ruIICXte1Vm7PAFvkbQJG2rYuDIS
         hr8iIJUVmJtiAHwemtRlTiy759FGct1vI3kkUrIYN7dCedN9TcnicjGG383oKB1x04e9
         tAD3aiYfNMP5Q0hC1BvxjBkvhlrVliyTJFzQFuQiK5E1SfVzprrIvZPfXh7Jm+GsFlOJ
         vtRL9cIn98ksDLFqSHu6etr7V2M1XMTxbbZgB2x1CmVQF5NQjR1ZlBQVSBIadwPpiRpR
         yQ9A==
X-Gm-Message-State: AC+VfDxq2PLyE1sMnmDtERY6YeAkBq6ei7AlrLTd7/gkfoR+xEeP7qzA
	TYix9hVYMD4QF5M0rWoPNkg=
X-Google-Smtp-Source: ACHHUZ6EsftGeGHUcet6VG2Mv98sUSBFG3Qk0gYDcKo3tTcpdr+/G0DaclFN6AwdSdqFJmkpU95GIw==
X-Received: by 2002:adf:f412:0:b0:306:2d3d:a108 with SMTP id g18-20020adff412000000b003062d3da108mr7632655wro.11.1685370544323;
        Mon, 29 May 2023 07:29:04 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id bf3-20020a0560001cc300b00307b5376b2csm100309wrb.90.2023.05.29.07.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 07:29:03 -0700 (PDT)
Message-ID: <9125e52a-614c-5ca2-ca29-654b79ab52c7@gmail.com>
Date: Mon, 29 May 2023 16:29:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8192-asurada-hayato: Enable
 Bluetooth
Content-Language: en-US, ca-ES, es-ES
To: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230424100409.2992418-1-wenst@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230424100409.2992418-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_072911_464199_C445CBD4 
X-CRM114-Status: GOOD (  15.55  )
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



On 24/04/2023 12:04, Chen-Yu Tsai wrote:
> Hayato's Realtek WiFi/BT module has it's Bluetooth function wired to
> UART1.
> 
> Add and enable the relevant device nodes for it.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Applied, thanks

> ---
> Changes since v1:
> - Dropped unreferenced labels
> - Dropped GPIO line name comments
> - Fixed pinctrl node names
> - Dropped "output-enable" property
> - Added spacing between device nodes for consistency
> 
>   .../dts/mediatek/mt8192-asurada-hayato-r1.dts | 81 +++++++++++++++++++
>   1 file changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
> index 43a823990a92..6e23428a3ed2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
> @@ -40,9 +40,90 @@ CROS_STD_MAIN_KEYMAP
>   	>;
>   };
>   
> +&pio {
> +	bt_pins: bt-pins {
> +		pins-bt-kill {
> +			pinmux = <PINMUX_GPIO144__FUNC_GPIO144>;
> +			output-low;
> +		};
> +
> +		pins-bt-wake {
> +			pinmux = <PINMUX_GPIO22__FUNC_GPIO22>;
> +			bias-pull-up;
> +		};
> +
> +		pins-ap-wake-bt {
> +			pinmux = <PINMUX_GPIO168__FUNC_GPIO168>;
> +			output-low;
> +		};
> +	};
> +
> +	uart1_pins: uart1-pins {
> +		pins-rx {
> +			pinmux = <PINMUX_GPIO94__FUNC_URXD1>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		pins-tx {
> +			pinmux = <PINMUX_GPIO95__FUNC_UTXD1>;
> +		};
> +
> +		pins-cts {
> +			pinmux = <PINMUX_GPIO166__FUNC_UCTS1>;
> +			input-enable;
> +		};
> +
> +		pins-rts {
> +			pinmux = <PINMUX_GPIO167__FUNC_URTS1>;
> +		};
> +	};
> +
> +	uart1_pins_sleep: uart1-sleep-pins {
> +		pins-rx {
> +			pinmux = <PINMUX_GPIO94__FUNC_GPIO94>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		pins-tx {
> +			pinmux = <PINMUX_GPIO95__FUNC_UTXD1>;
> +		};
> +
> +		pins-cts {
> +			pinmux = <PINMUX_GPIO166__FUNC_UCTS1>;
> +			input-enable;
> +		};
> +
> +		pins-rts {
> +			pinmux = <PINMUX_GPIO167__FUNC_URTS1>;
> +		};
> +	};
> +};
> +
>   &touchscreen {
>   	compatible = "hid-over-i2c";
>   	post-power-on-delay-ms = <10>;
>   	hid-descr-addr = <0x0001>;
>   	vdd-supply = <&pp3300_u>;
>   };
> +
> +&uart1 {
> +	status = "okay";
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&uart1_pins>;
> +	pinctrl-1 = <&uart1_pins_sleep>;
> +	/delete-property/ interrupts;
> +	interrupts-extended = <&gic GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
> +			      <&pio 94 IRQ_TYPE_EDGE_FALLING>;
> +
> +	bluetooth {
> +		compatible = "realtek,rtl8822cs-bt";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_pins>;
> +
> +		enable-gpios = <&pio 144 GPIO_ACTIVE_HIGH>;
> +		device-wake-gpios = <&pio 168 GPIO_ACTIVE_HIGH>;
> +		host-wake-gpios = <&pio 22 GPIO_ACTIVE_LOW>;
> +	};
> +};

