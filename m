Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D55C77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YALT7Js4KtxSk5x/izulh6BNtKTawyF4l7eDmYfrvlI=; b=ngg9ZpXdQfk516eglmuIGNnK61
	6s7ia3zDxmcVC9Sd+VHUzJtblyY20AR8DCAODhcJ6CYbZZbG8AJ9SMXqzmeDOps8Oh0AHFAV+ivIZ
	e3/GmYRhY45rXGgX45Js1aPT9tUxHeUt6qYFSOza0HdCiUb0Z4BwLvakEysiLBZzARPNlhVijgFDc
	ZT1sN2Vh+qEuSVxF3xyfz7MAikixokCro3rDTIFzfsF7tuOQfG5qVNjSow9Vn01sSkoeQUkNHPnpx
	lxgfKpojE7YcoT85PrSkGvUhwZfEbUBsjM9OFw667uiCVrX+0qEc8VPxOhZ7ig/b7mYw2qpekV49S
	3qewgLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprKS-00B2x5-0Y;
	Fri, 21 Apr 2023 14:01:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprKO-00B2ur-06;
	Fri, 21 Apr 2023 14:01:33 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 54ED26603276;
	Fri, 21 Apr 2023 15:01:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682085687;
	bh=1vgwclP5B6vfVz7wXujyKjNoyVDTIACdOwUdXtZG1fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMON1N7KEo0dGRHeB/EiSYBZlhMPw0PYScmX0/QFGDPPFm+oWqrpAvR76ZxglqN+o
	 NwyR7DrKTqyh2Wi++ziTgeKQX9wIcPovn7nnYxELH5D03DoKmCwinXpQmF5WmROY46
	 wmw3xa7D4gf/HrbOiRWLyWOeobTzGJh0HrxLgNlVdDSB9zujcekTqpnP6VEjhSrYrW
	 InfVmI/WgAuTgxPK4CnBkfecqVfYte4BGNHUL3w2Is9yenf0BlvKqPtloyYfYEibza
	 uDZFA4GYDnAZjXmytM9CTjKWdwjXV62zGhbcQPDwRGWff6RtgzZUEj1kmlR9uvgT7Z
	 OxKbvf+8rfYVg==
Date: Fri, 21 Apr 2023 10:01:22 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada-hayato: Enable
 Bluetooth
Message-ID: <872e8b77-c1ea-410a-b978-dd8f49f9904b@notapiano>
References: <20230421110327.2395804-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230421110327.2395804-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_070132_297964_7FADD18E 
X-CRM114-Status: GOOD (  19.54  )
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

On Fri, Apr 21, 2023 at 07:03:27PM +0800, Chen-Yu Tsai wrote:
> Hayato's Realtek WiFi/BT module has it's Bluetooth function wired to
> UART1.
> 
> Add and enable the relevant device nodes for it.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../dts/mediatek/mt8192-asurada-hayato-r1.dts | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
> index 43a823990a92..6a7d7870525b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
> @@ -40,9 +40,89 @@ CROS_STD_MAIN_KEYMAP
>  	>;
>  };
>  
> +&pio {
> +	bt_pins: bt-pins {
> +		bt_kill: pins-bt-kill {

Drop this label and for the other pinconfigs below as they'll never be
referenced.

> +			pinmux = <PINMUX_GPIO144__FUNC_GPIO144>; /* BT_KILL_L */

I'd also drop this and the other comments, as they're already documented in the
gpio-line-names property.

> +			output-low;
> +		};
> +
> +		bt_wake: pins-bt-wake {
> +			pinmux = <PINMUX_GPIO22__FUNC_GPIO22>;  /* bt to wake ap */
> +			bias-pull-up;
> +		};
> +
> +		ap_wake_bt: pins-ap-wake-bt {
> +			pinmux = <PINMUX_GPIO168__FUNC_GPIO168>; /* AP_WAKE_BT_H */
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
> +			output-enable;

Looks like the dt-binding doesn't currently support output-enable, but the
driver does, so please just add a patch with

          output-enable: true
	
on mediatek,mt8192-pinctrl.yaml

> +		};
> +	};
> +
> +	uart1_pins_sleep: uart1-pins-sleep {

"-pins" needs to come last in the name otherwise the dt-binding will complain.

> +		pins-rx {
> +			pinmux = <PINMUX_GPIO94__FUNC_GPIO94>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +		pins-tx {
> +			pinmux = <PINMUX_GPIO95__FUNC_UTXD1>;
> +		};
> +		pins-cts {
> +			pinmux = <PINMUX_GPIO166__FUNC_UCTS1>;
> +			input-enable;
> +		};
> +		pins-rts {
> +			pinmux = <PINMUX_GPIO167__FUNC_URTS1>;
> +			output-enable;
> +		};
> +	};
> +};
> +
>  &touchscreen {
>  	compatible = "hid-over-i2c";
>  	post-power-on-delay-ms = <10>;
>  	hid-descr-addr = <0x0001>;
>  	vdd-supply = <&pp3300_u>;
>  };
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
> +	bluetooth: bluetooth {

I'd also drop this label and only introduce it if/when needed.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

> +		compatible = "realtek,rtl8822cs-bt";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_pins>;
> +
> +		enable-gpios = <&pio 144 GPIO_ACTIVE_HIGH>;
> +		device-wake-gpios = <&pio 168 GPIO_ACTIVE_HIGH>;
> +		host-wake-gpios = <&pio 22 GPIO_ACTIVE_LOW>;
> +	};
> +};
> -- 
> 2.40.0.634.g4ca3ef3211-goog
> 

