Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A509EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 20:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulhnA2hpzjATatd05NxsvEdr+rpdpgUX63ymgfUPkRA=; b=q9y97hzcEMASaX
	laFTC5DmzqqZy/FJkfVmYKWZs/l3QnZWkwFR0bES+NYIFuMSCqtm+HzXtEY8vfKXuGGCqRix16Vw3
	vI0gI8xiLe2uycto10tQYShnhSjdNTBuTcdiph/kOb2bL5c9kFR2bvwXD2wEknMtESFLa+Xw86XUB
	ch/TGwuE4p9C7b0IsBBMjTxCPPQoTflIArsM93oZG3w8jQZlV026TwanHz6hetor0mSngSj6Och8c
	MKtbPNqCFKNaU2VLVRSi1JA0M8DLCdh2h5esY7gKyCnNErGP9AQ2bn0C1AMZhpENmg1QzS7zuDf2u
	iVAq2thFjB2uAUdCPWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMblm-00BWbs-R2; Tue, 22 Feb 2022 20:28:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMbla-00BWZR-Ii; Tue, 22 Feb 2022 20:28:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id A5FE61F4305C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645561689;
 bh=XYnec0KXZAvsEu9FVDIA+DCNqtz7GcNyNM0dZi5nGKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AQiUjtKxRYO1xX9vVoOOFXkPFSCC67v1ZQxPvDobu4gWR7S//0ksNk3esKGbhVuXp
 kkybtmOoMYucr4ZC4eBN8+PeME0ZM5h+wNE5jlPY5T3Ek0ktTMD57SSphD/bUYi83h
 oSvqbbit0Wx3GY23pOda1i/ImLhxByL6Mjc3J9W5tOCTsWn/U3lK0lq579nvZhsEBr
 7vtTRzcVV8L5wBeZI8Nvp0xbrG1sjiWotqPbE2KehW+LSuoOVy0FNzqIy+PBtpLmja
 z5+JJx0Ai8AM+CipiokKTlJvCmNjdeaEPE8YrNTDWyAQnZ3eLjQFJlAdlrBVDVkofZ
 sFEWANLIa6NOw==
Date: Tue, 22 Feb 2022 15:28:03 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 07/23] arm64: dts: mt8192: Add xhci node
Message-ID: <20220222202803.7mkskda3nsjrunpx@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-8-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-8-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_122810_816093_C9CFA365 
X-CRM114-Status: GOOD (  15.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 18, 2022 at 05:16:17PM +0800, Allen-KH Cheng wrote:
> Add xhci node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index ce18d692175f..08c7c1c772f5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/power/mt8192-power.h>
>  
>  / {
> @@ -718,6 +719,30 @@
>  			status = "disabled";
>  		};
>  
> +		xhci: xhci@11200000 {

According to Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml, this
node should be called usb (but the label can be kept as xhci).

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

This node doesn't have any children, so no need for #address-cells and
#size-cells, just drop them.

Also, let's keep this node disabled by default:

			status = "disabled";

> +		};
> +
>  		nor_flash: spi@11234000 {
>  			compatible = "mediatek,mt8192-nor";
>  			reg = <0 0x11234000 0 0xe0>;
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
