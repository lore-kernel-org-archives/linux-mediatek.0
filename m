Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCBCC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oa1vRYC9VRqaLRx6SixQPINQERm9FMlTWFHg3dca5Uw=; b=Ed9YFSBMK25aIv
	8b3G7UKUpUVBEyrRTGrYRyHOLjlTWTMPFeSBM117GS1JIV42LOHildM7LEMO3qpB10L2m0gWRGVi0
	B+upkEeslYoqkg9TPIASZP82h6uTjOoXa7BEwyuZCZyoiSI2ZKN4v6DVFMofXXv3LN0FSShGH4sNB
	SIbfK+CcqEgfhf0NCShVD+7/M/doWzPw1N3LFBi9oYdwDhY7oleTnt9STPj6loQwQIwwdFGHEj1dF
	6FaDG8MxHQBHp7RCX5KxF0WvpFpwhaja/ZBy1c6XJ4v4r9GsF1x++5zUShcciABI4fE1Xt4gGOrN7
	+lFaEnfAk8hxZQeeiIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3F1-00EXpv-OV; Fri, 18 Feb 2022 13:24:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2nT-00ELOD-Jh; Fri, 18 Feb 2022 12:55:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9BA331F4241F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188938;
 bh=KGliYYvs3+aIadrV22Be8f4ODgtZewrfuctj/IReXTM=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=ZSofEMtH9ldFOoNbAsGvcilLM8DLw1RNzoDsV7AwB7XbnFQyRDLPz7X2uVvV/pVOC
 yxeKYKQ1BUf/hsRTwtWq//OHLNGPhYB531bFWqw1grWLPBs/VuHWVQN3q3dGzVq02J
 l6L1gxDOj3Zg3AR2DfYok/pozTy/tGsBhgU42Dt1BgY2cxtFvFLMW7R6ntUTLqc1Vs
 YhuYc0d9gQpkdGmp31N7N58zuWsEyWVAOpzzTrdVCAvVuy4uLOl51fLZ626sdBD9FT
 AiudwB/IDw5pIGbrYGUqjE+NN2FJD7aptu95DmxBlKOvP/udL+sbc2EWJvyvm1a3ZA
 HrDgDXPX2158w==
Message-ID: <822cac91-9272-2780-70e2-d4c683da6018@collabora.com>
Date: Fri, 18 Feb 2022 13:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 07/23] arm64: dts: mt8192: Add xhci node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-8-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-8-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045539_839159_3F18CBA6 
X-CRM114-Status: GOOD (  13.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> Add xhci node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index ce18d692175f..08c7c1c772f5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -10,6 +10,7 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +#include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mt8192-power.h>
>   
>   / {
> @@ -718,6 +719,30 @@
>   			status = "disabled";
>   		};
>   
> +		xhci: xhci@11200000 {
> +			compatible = "mediatek,mt8192-xhci",
> +				     "mediatek,mtk-xhci";
> +			reg = <0 0x11200000 0 0x1000>,
> +			      <0 0x11203e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts-extended = <&gic GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "host";
> +			phys = <&u2port0 PHY_TYPE_USB2>,
> +			       <&u3port0 PHY_TYPE_USB3>;
> +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_SEL>,
> +					  <&topckgen CLK_TOP_SSUSB_XHCI_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&infracfg CLK_INFRA_SSUSB>,
> +				 <&infracfg CLK_INFRA_SSUSB_XHCI>,
> +				 <&apmixedsys CLK_APMIXED_USBPLL>;
> +			clock-names = "sys_ck", "xhci_ck", "ref_ck";
> +			wakeup-source;
> +			mediatek,syscon-wakeup = <&pericfg 0x420 102>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +		};
> +
>   		nor_flash: spi@11234000 {
>   			compatible = "mediatek,mt8192-nor";
>   			reg = <0 0x11234000 0 0xe0>;



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
