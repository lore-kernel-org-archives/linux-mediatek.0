Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374D3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 10:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXaIN6GpvSDI23yHRDjW3hcc9dSCa52MEa3EtpPYgxU=; b=LKfzSxeP/+o/g1
	AlsimOy8Wxh2jfIpr8jV+mlxYRt2g8jeZd5crrCsFdZXPgzvGLmeQji1vNmYKRbECF4cLP+hmWSN4
	/mWSbvyKxeaRy06ykpVYrQj4ZTylqTO52zC2eaJliBTc3Jd8IK5rrfkfPvdyyHY7wHu5vSESACAEF
	GskmwJHXd7t+gEgTBide+doXzJ0Tj+nsXjy0HCWPH169WrV71bVMd8OneJ4Plu6aqRPW1iXAeyQg8
	QcyCX0xvh9WCs+Qpe3Rco3V1fd+d0LA5a/Pme3fFicyVhKKqEvyJptRq6RbmKBaWmokLIo4QArkHF
	1KSKtwY6HJRz0UifeuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ959-00BoyI-Na; Tue, 29 Mar 2022 10:28:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ94x-00Box9-DH; Tue, 29 Mar 2022 10:28:02 +0000
X-UUID: 6a6e854b51014f2091c03648844f3f68-20220329
X-UUID: 6a6e854b51014f2091c03648844f3f68-20220329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1434869402; Tue, 29 Mar 2022 03:27:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 03:17:49 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 29 Mar 2022 18:17:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 18:17:47 +0800
Message-ID: <7283dd6732ae8c188c6f12183a977fb980cc8617.camel@mediatek.com>
Subject: Re: [PATCH v11 3/3] arm64: dts: Add mediatek SoC mt8195 and
 evaluation board
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Linus Walleij
 <linus.walleij@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, "Chaotian
 Jing" <chaotian.jing@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>, Seiya Wang
 <seiya.wang@mediatek.com>
Date: Tue, 29 Mar 2022 18:17:47 +0800
In-Reply-To: <cf16ed58-6e75-cd9f-38ab-540d62ff03b5@gmail.com>
References: <20220216113131.13145-1-tinghan.shen@mediatek.com>
 <20220216113131.13145-4-tinghan.shen@mediatek.com>
 <cf16ed58-6e75-cd9f-38ab-540d62ff03b5@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_032759_486527_B144D2BA 
X-CRM114-Status: GOOD (  32.24  )
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

Hi Matthias,

Thanks for your comment.

On Mon, 2022-03-28 at 14:26 +0200, Matthias Brugger wrote:
> 
> On 16/02/2022 12:31, Tinghan Shen wrote:
> > Add basic chip support for mediatek mt8195.
> > 
> > Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile       |    1 +
> >   arch/arm64/boot/dts/mediatek/mt8195-evb.dts |  161 +++
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 1049 +++++++++++++++++++
> >   3 files changed, 1211 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index 8c1e18032f9f..5da29e7223e4 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -38,4 +38,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-
> > evb.dts
> > new file mode 100644
> > index 000000000000..51633d91d984
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > @@ -0,0 +1,161 @@
> 
> [...]
> > +
> > +&u2port0 {
> > +	status = "okay";
> > +};
> > +
> > +&u2port1 {
> > +	status = "okay";
> > +};
> > +
> > +&u3phy0 {
> > +	status="okay";
> > +};
> > +
> > +&u3phy1 {
> > +	status="okay";
> > +};
> > +
> 
> So we enable phys for xhci but not the device. Are we missing anything to enable 
> them on the EVB?

after discussed with usb expert, we think that we're missing the xhci nodes.
I'll add xhci nodes at next version.

> 
> > +&uart0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart0_pin>;
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > new file mode 100644
> > index 000000000000..a363e82f6988
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -0,0 +1,1049 @@
> 
> [...]
> > +
> > +	clk32k: oscillator-32k {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <32768>;
> > +		clock-output-names = "clk32k";
> 
> I suppose the 32KHz oscillator is really present on the board also not used by 
> any device (up to now?).

Yes. 32KHz clock is still available on MT8195.
Some modules can choose 32K as clock source depending on requirements.

> 
> [...]
> > +
> > +	soc {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		compatible = "simple-bus";
> > +		ranges;
> > +
> 
> [...]
> > +
> > +		pwrap: pwrap@10024000 {
> > +			compatible = "mediatek,mt8195-pwrap", "syscon";
> > +			reg = <0 0x10024000 0 0x1000>;
> > +			reg-names = "pwrap";
> > +			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
> > +				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>;
> > +			clock-names = "spi", "wrap";
> 
> Binding mandates resets but not present here. It also mandates two register 
> regions, but only one is given here.

After discussed with pwrap experts, the pwrap binding is out-of-date for mt8195.
They will send a patch to fix pwrap binding.

> 
> > +			assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC>;
> > +			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
> > +		};
> > +
> > +		scp_adsp: clock-controller@10720000 {
> > +			compatible = "mediatek,mt8195-scp_adsp";
> > +			reg = <0 0x10720000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> 
> [...]
> 
> > +
> > +		mmc0: mmc@11230000 {
> > +			compatible = "mediatek,mt8195-mmc",
> > +				     "mediatek,mt8183-mmc";
> > +			reg = <0 0x11230000 0 0x10000>,
> > +			      <0 0x11f50000 0 0x1000>;
> 
> Seems to be an oversight when adding support for mt8183-mmc support to the 
> driver. The binding description is missing the optional host top register base. 
> Chaotian can you please help to fix this in the binding description.

Ok. I'll fix it at next version.

> 
> > +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			clocks = <&topckgen CLK_TOP_MSDC50_0>,
> > +				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
> > +				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>;
> > +			clock-names = "source", "hclk", "source_cg";
> > +			status = "disabled";
> > +		};
> > +
> 
> [...]
> > +
> > +		xhci3: usb@112b0000 {
> > +			compatible = "mediatek,mt8195-xhci",
> > +				     "mediatek,mtk-xhci";
> > +			reg = <0 0x112b0000 0 0x1000>,
> > +			      <0 0x112b3e00 0 0x0100>;
> > +			reg-names = "mac", "ippc";
> > +			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			phys = <&u2port3 PHY_TYPE_USB2>;
> > +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>,
> > +					  <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
> > +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> > +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> > +			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
> > +				 <&topckgen CLK_TOP_SSUSB_P3_REF>,
> > +				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
> > +			clock-names = "sys_ck", "ref_ck", "xhci_ck";
> > +			/* This controller is connected with a BT device.
> > +			 * Disable usb2 lpm to prevent konwn issues.
> > +			 */
> > +			usb2-lpm-disable;
> 
> My understanding is, that this depends on the board and not the SoC. Which means 
> usb2-lpm-disable should go into any board that has a BT device connected to the 
> xhci device (I don't see any active xhci node in mt8195-evb so far).

Ok. I'll move this property to evb board in a xhci node.

Best regards,
TingHan

> 
> Regards,
> Matthias


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
