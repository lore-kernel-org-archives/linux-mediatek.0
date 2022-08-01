Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30357C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 22:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MG8Kmpa1SGHtRUSmuiJkkUC8XaLJ8+ZIHzV2PBWmgqQ=; b=tldAFc5P25xXbdB5CofvJ+2Gku
	SffxYdbAWpRXD489pgjzzYM7aPrR6o912QYNSUW5nJuWnqt6bGaHcKpnb8KxttXFHVJab1edISYRu
	QnYCny4T0UcgoqePLTRB6rPHlqbFi1jh38v1rVu4CvnZ0wcpMKF+uh0HKPgRCrUK7ITdBgxDwBeJl
	1JMx0yAayps65Vkminpt45aB0prpTqNWdShhM05h5xiJ9SPAFn1nb/oznfHNv0iUlm/lBgZZq3IjQ
	hLLztcNpbA5FVHELLbOnfvgOzPohfe16tqk39mrQ6q/9YxzoqfGILLsg+cB6dkIIR18DFkxpYgTSN
	aQOuUG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIdU4-00BBUN-Ko; Mon, 01 Aug 2022 22:01:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIdTt-00BBL6-KN; Mon, 01 Aug 2022 22:01:47 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 471546601BB3;
	Mon,  1 Aug 2022 23:01:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659391302;
	bh=T/RBuEUbnEnXmUp/1eTflZrVxy/Gs/nupFpbmEOWa9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOws5VedmDbHkFhWT29i0tdGLWLXgnKLQsNlmwrf2CibOJCyd98LRZJAfGhV7rnfL
	 Vcb60J/3oA+NKz3bm2V2ATrGv0/O8AuOCifcOCxRysAs+X6v+XHPvitrg/p30ZoTP7
	 ULTMtx+YGzzxtpa7yTgi1L+Tdm+zI3N7Mfb65Tvw8zLKpTu5+JeVp+k3bT5mOYngpS
	 jjJO44SYhlpB1gqLGEyuMgDVnafsaf1rfuYb4l+P0Rz91ixPmdI0eNYBaJt1nOP8Py
	 c4U7tdPjkvM3/xdZMJWbsU5lPOlcjniYtNVTUw15N4voCTifxYLDaFbufyurZGNiXD
	 3it+WslmnD6iQ==
Date: Mon, 1 Aug 2022 18:01:36 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>, hsinyi@chromium.org
Subject: Re: [PATCH v12 1/1] arm64: dts: Add MediaTek MT8186 dts and
 evaluation board and Makefile
Message-ID: <20220801220136.4lll2wifc7muocuc@notapiano>
References: <20220801123952.18932-1-allen-kh.cheng@mediatek.com>
 <20220801123952.18932-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220801123952.18932-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_150146_061741_C452C059 
X-CRM114-Status: GOOD (  18.11  )
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

Hi Allen,

On Mon, Aug 01, 2022 at 08:39:52PM +0800, Allen-KH Cheng wrote:
> Add basic chip support for MediaTek MT8186.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>  arch/arm64/boot/dts/mediatek/mt8186-evb.dts | 238 ++++++
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi    | 874 ++++++++++++++++++++
>  3 files changed, 1113 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi
> 
[..]
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-evb.dts b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> new file mode 100644
> index 000000000000..7d4a64ab95e4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
[..]
> +&pio {
> +	i2c0_pins: i2c0-default-pins {
> +		pins-bus {
> +			pinmux = <PINMUX_GPIO128__FUNC_SDA0>,
> +				 <PINMUX_GPIO127__FUNC_SCL0>;
> +			bias-disable;
> +			drive-strength-microamp = <1000>;
> +			drive-strength = <4>;

You can't use both drive-strength-microamp and drive-strength. You only want the
microamp one here (and for the others below), since these are i2c pins.

> +			input-enable;
> +		};
> +	};
[..]
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> new file mode 100644
> index 000000000000..38f9466eea42
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -0,0 +1,874 @@
[..]
> +		pio: pinctrl@10005000 {
> +			compatible = "mediatek,mt8186-pinctrl";
> +			reg = <0 0x10005000 0 0x1000>,
> +			      <0 0x10002000 0 0x0200>,
> +			      <0 0x10002200 0 0x0200>,
> +			      <0 0x10002400 0 0x0200>,
> +			      <0 0x10002600 0 0x0200>,
> +			      <0 0x10002A00 0 0x0200>,
> +			      <0 0x10002C00 0 0x0200>,
> +			      <0 0x1000B000 0 0x1000>;

Please use lowercase hex for addresses.

> +			reg-names = "iocfg0", "iocfg_bm", "iocfg_bl", "iocfg_br",
> +				    "iocfg_lm", "iocfg_rb", "iocfg_tl", "eint";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pio 0 0 185>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#interrupt-cells = <2>;
> +		};
[..]
> +		xhci0: usb@11200000 {
> +			compatible = "mediatek,mt8186-xhci",
> +				     "mediatek,mtk-xhci";
> +			reg = <0 0x11200000 0 0x1000>,
> +			      <0 0x11203e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port0 PHY_TYPE_USB2>;
> +			clocks = <&topckgen CLK_TOP_USB_TOP>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
> +				 <&infracfg_ao CLK_INFRA_AO_ICUSB>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";

The clocks and clock-names don't match, can you confirm whether they're right?
(But keep this clock order, see the comment on xhci1 below)

> +			mediatek,syscon-wakeup = <&pericfg 0x420 2>;
> +			wakeup-source;
> +			status = "disabled";
> +		};
[..]
> +		xhci1: usb@11280000 {
> +			compatible = "mediatek,mt8186-xhci",
> +				     "mediatek,mtk-xhci";
> +			reg = <0 0x11280000 0 0x1000>,
> +			      <0 0x11283e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port1 PHY_TYPE_USB2>,
> +			       <&u3port1 PHY_TYPE_USB3>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_XHCI>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck", "xhci_ck";

The xhci dt-binding enforces this clock order:

	sys_ck, ref_ck, mcu_ck, dma_ck, xhci_ck

You can't skip dma_ck, otherwise you'll see a dtbs_check warning. So if this
hardware block has a fixed clock connected to the dma_ck slot (ie it isn't
controllable), then just add a fixed clock entry for it (eg <&clk26m>).

The clock names also look switched here, please double-check.

Thanks,
Nícolas

> +			mediatek,syscon-wakeup = <&pericfg 0x424 2>;
> +			wakeup-source;
> +			status = "disabled";
> +		};

