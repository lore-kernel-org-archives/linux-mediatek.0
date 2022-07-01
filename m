Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A951CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/72w2SrT3AAPQODH5pTveM/KL05TgRE3vG2jsRrTSs=; b=u4UQ3L9u/SlXG3zWeuAucBceBh
	Si6ZIwmkdePsV8t2/JZ3vB9mUruG9GDK/w2elAHuXUnMRZzP3i+N7rVZNPlpyCIYyTAdNCSkC9emj
	zvtkmvBMk87U/A6p/2w0XvmzFT28ktSC9nW71GPdbY0efKM+SAI5vh+vg2sHa8VM40Rn+lzdTLORS
	XgrNLV9TtKJquziK1KCBLDdfamrqyNhBa+eoVP0Q/flDAafpC/JMlDq67DmU0fp6+sxg3Zp+6CMNL
	AcLbC7YXNc9ndOqw79MOdn9glF1jrLCWcNPzT8beEZ0tIMsS3wKc4lMHS0VEdQ4b84qWTL2ah0DkU
	KfmiRPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PSb-007J6E-9a; Fri, 01 Jul 2022 22:50:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PSP-007J0P-Br; Fri, 01 Jul 2022 22:49:51 +0000
Received: from notapiano (unknown [194.36.25.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 145636601802;
	Fri,  1 Jul 2022 23:49:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656715787;
	bh=VsNToxdwUkS2/Cs/CJ+X6wuHSm+1n5iJSEkB4ZkPoeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivjmvzSuSC4caddmtzGD6Bps0Ju7D5WAVW8QPnf7LbqFKKqpLY14nCtEL2Fii8UVK
	 gDK6NyRbXG5w5kjBzb4ZZj/0NovvsDsCQv5Mrx0Hlll9sTJl9zLYFAdLp2X7bkmrNE
	 Ev8Feyfk4OMom8499gb6zELOrNwew7I7k/OAGtNBi7SCrTfHyvjKKDJ7018br3GPYM
	 cPsh9O5upuvTCP8+ULJ85Usg0MpfJAhvAvsxdiOGlMR7IG07B6L4y3+eCwSOSxIYTU
	 IBjRaW7JhIlHzJO6j7+qgcv2kcmLfIdJ0F17Rp/T8LdFgG4BiBGlq845MIUSEoegS5
	 WUlUHopzwNjwg==
Date: Fri, 1 Jul 2022 18:49:39 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	allen-kh.cheng@mediatek.com, gtk3@inbox.ru, luca@z3ntu.xyz,
	sam.shih@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH 11/11] arm64: dts: mediatek: cherry: Add I2C-HID
 touchscreen on I2C4
Message-ID: <20220701224939.brdcdnh47jbcbiif@notapiano>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-12-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630153316.308767-12-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_154949_712913_A5C80AED 
X-CRM114-Status: GOOD (  17.39  )
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

On Thu, Jun 30, 2022 at 05:33:16PM +0200, AngeloGioacchino Del Regno wrote:
> This platform carries a HID compatible I2C touchscreen on the i2c4 bus,
> but it may either be at 0x10, or at 0x15, depending on the board model:
> declare both as disabled in the common Cherry device-tree and enable
> the required touchscreen node on a per-board basis.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  4 ++
>  .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |  4 ++
>  .../dts/mediatek/mt8195-cherry-tomato-r3.dts  |  4 ++
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 41 +++++++++++++++++++
>  4 files changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> index 17e9e4d6f6ab..2837fb24c84c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> @@ -9,3 +9,7 @@ / {
>  	model = "MediaTek Tomato (rev1) board";
>  	compatible = "google,tomato-rev1", "google,tomato", "mediatek,mt8195";
>  };
> +
> +&ts_10 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> index ee5fd07ad573..4e1d1a1887c7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> @@ -29,3 +29,7 @@ pins-low-power-pcie0-disable {
>  		bias-pull-down;
>  	};
>  };
> +
> +&ts_10 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> index 792f6c83e88b..4a45884203ea 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> @@ -30,3 +30,7 @@ pins-low-power-pcie0-disable {
>  		bias-pull-down;
>  	};
>  };
> +
> +&ts_10 {
> +	status = "okay";
> +};

But no board currently uses the one on 0x15?

Thanks,
Nícolas

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 2687c6d40ac1..7a32c7006a5a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -143,6 +143,31 @@ &i2c4 {
>  	clock-frequency = <400000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c4_pin>;
> +
> +	/* Depending on the machine, the TS may be at 0x10 or at 0x15 */
> +	ts_10: touchscreen@10 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x10>;
> +		hid-descr-addr = <0x0001>;
> +		interrupts-extended = <&pio 92 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touchscreen_pins>;
> +		post-power-on-delay-ms = <10>;
> +		vdd-supply = <&pp3300_s3>;
> +		status = "disabled";
> +	};
> +
> +	ts_15: touchscreen@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x15>;
> +		hid-descr-addr = <0x0001>;
> +		interrupts-extended = <&pio 92 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touchscreen_pins>;
> +		post-power-on-delay-ms = <10>;
> +		vdd-supply = <&pp3300_s3>;
> +		status = "disabled";
> +	};
>  };
>  
>  &i2c5 {
> @@ -609,6 +634,22 @@ subpmic_pin_irq: pins-subpmic-int-n {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	touchscreen_pins: touchscreen-default-pins {
> +		pins-int-n {
> +			pinmux = <PINMUX_GPIO92__FUNC_GPIO92>;
> +			input-enable;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +		pins-rst {
> +			pinmux = <PINMUX_GPIO56__FUNC_GPIO56>;
> +			output-high;
> +		};
> +		pins-report-sw {
> +			pinmux = <PINMUX_GPIO57__FUNC_GPIO57>;
> +			output-low;
> +		};
> +	};
>  };
>  
>  &pmic {
> -- 
> 2.35.1
> 

