Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59E4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nW4fQDf+rHPmvtv4vZRhrbVA6nuOI0V8GKX7likhZNo=; b=ahtFIsIeTzYqAJ
	Gw7+69o4xS1YTik+brnDuF4BZOBlt8h9Cxhm9tXhVOmlGiU3saQoayWXnFfX1szKgOOofnWUJ7Npe
	WJhPgpEISWpPCnMgGj2Us3a6fBW0+mnXqQvps4HEyh+Nt4crrwJaskgJRaGDB2bj7EkxMesCINTWs
	38Zb5cbELU4DrCFaGKI2rc68S54KvVs78ud3P5WG+Fz0LE2TusBPmI2CB+pGYpHMQpEU7KgM1syPI
	0wQgrUwv7s+Sg5bKf/l82F6oBr8v+9wiAqJOmPeXbgdIX/RIF3wi13B8K39vXyJt8T4STd489Z/Lj
	Dejc341aTfyjK28cgKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTj0-00Eq5y-Hf; Wed, 30 Mar 2022 08:30:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTim-00Eq2N-7j; Wed, 30 Mar 2022 08:30:30 +0000
X-UUID: 252d2be866da44a6855a875d6389b9a9-20220330
X-UUID: 252d2be866da44a6855a875d6389b9a9-20220330
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1658959823; Wed, 30 Mar 2022 01:30:24 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 01:30:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 16:30:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 16:30:21 +0800
Message-ID: <cd681c6d07b2b751213d1d0789b3e6f361add5cd.camel@mediatek.com>
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
Date: Wed, 30 Mar 2022 16:30:21 +0800
In-Reply-To: <3a93babf-7217-da88-11b4-9e3b9e9730f2@gmail.com>
References: <20220216113131.13145-1-tinghan.shen@mediatek.com>
 <20220216113131.13145-4-tinghan.shen@mediatek.com>
 <cf16ed58-6e75-cd9f-38ab-540d62ff03b5@gmail.com>
 <7283dd6732ae8c188c6f12183a977fb980cc8617.camel@mediatek.com>
 <3a93babf-7217-da88-11b4-9e3b9e9730f2@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_013028_327227_0A59936E 
X-CRM114-Status: GOOD (  45.66  )
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

On Tue, 2022-03-29 at 16:23 +0200, Matthias Brugger wrote:
> 
> On 29/03/2022 12:17, Tinghan Shen wrote:
> > Hi Matthias,
> > 
> > Thanks for your comment.
> > 
> > On Mon, 2022-03-28 at 14:26 +0200, Matthias Brugger wrote:
> > > 
> > > On 16/02/2022 12:31, Tinghan Shen wrote:
> > > > Add basic chip support for mediatek mt8195.
> > > > 
> > > > Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> > > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > > ---
> > > >    arch/arm64/boot/dts/mediatek/Makefile       |    1 +
> > > >    arch/arm64/boot/dts/mediatek/mt8195-evb.dts |  161 +++
> > > >    arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 1049 +++++++++++++++++++
> > > >    3 files changed, 1211 insertions(+)
> > > >    create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > > >    create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > > > index 8c1e18032f9f..5da29e7223e4 100644
> > > > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > > > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > > > @@ -38,4 +38,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
> > > >    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
> > > >    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
> > > >    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> > > > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
> > > >    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > > > b/arch/arm64/boot/dts/mediatek/mt8195-
> > > > evb.dts
> > > > new file mode 100644
> > > > index 000000000000..51633d91d984
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > > > @@ -0,0 +1,161 @@
> > > 
> > > [...]
> > > > +
> > > > +&u2port0 {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&u2port1 {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&u3phy0 {
> > > > +	status="okay";
> > > > +};
> > > > +
> > > > +&u3phy1 {
> > > > +	status="okay";
> > > > +};
> > > > +
> > > 
> > > So we enable phys for xhci but not the device. Are we missing anything to enable
> > > them on the EVB?
> > 
> > after discussed with usb expert, we think that we're missing the xhci nodes.
> > I'll add xhci nodes at next version.
> > 
> > > 
> > > > +&uart0 {
> > > > +	pinctrl-names = "default";
> > > > +	pinctrl-0 = <&uart0_pin>;
> > > > +	status = "okay";
> > > > +};
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > > new file mode 100644
> > > > index 000000000000..a363e82f6988
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > > @@ -0,0 +1,1049 @@
> > > 
> > > [...]
> > > > +
> > > > +	clk32k: oscillator-32k {
> > > > +		compatible = "fixed-clock";
> > > > +		#clock-cells = <0>;
> > > > +		clock-frequency = <32768>;
> > > > +		clock-output-names = "clk32k";
> > > 
> > > I suppose the 32KHz oscillator is really present on the board also not used by
> > > any device (up to now?).
> > 
> > Yes. 32KHz clock is still available on MT8195.
> > Some modules can choose 32K as clock source depending on requirements.
> > 
> 
> Thanks for the confirmation.
> 
> > > 
> > > [...]
> > > > +
> > > > +	soc {
> > > > +		#address-cells = <2>;
> > > > +		#size-cells = <2>;
> > > > +		compatible = "simple-bus";
> > > > +		ranges;
> > > > +
> > > 
> > > [...]
> > > > +
> > > > +		pwrap: pwrap@10024000 {
> > > > +			compatible = "mediatek,mt8195-pwrap", "syscon";
> > > > +			reg = <0 0x10024000 0 0x1000>;
> > > > +			reg-names = "pwrap";
> > > > +			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > +			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
> > > > +				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>;
> > > > +			clock-names = "spi", "wrap";
> > > 
> > > Binding mandates resets but not present here. It also mandates two register
> > > regions, but only one is given here.
> > 
> > After discussed with pwrap experts, the pwrap binding is out-of-date for mt8195.
> > They will send a patch to fix pwrap binding.
> > 
> 
> If possible can you add the patch fixing the pwrap binding in this series, then 
> I don't have to search for the dependencies in my inbox. That would be of great 
> help.

No problem. I'll add it to this series when the patch is ready.

Best regards,
Tinghan

> 
> > > 
> > > > +			assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC>;
> > > > +			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
> > > > +		};
> > > > +
> > > > +		scp_adsp: clock-controller@10720000 {
> > > > +			compatible = "mediatek,mt8195-scp_adsp";
> > > > +			reg = <0 0x10720000 0 0x1000>;
> > > > +			#clock-cells = <1>;
> > > > +		};
> > > > +
> > > 
> > > [...]
> > > 
> > > > +
> > > > +		mmc0: mmc@11230000 {
> > > > +			compatible = "mediatek,mt8195-mmc",
> > > > +				     "mediatek,mt8183-mmc";
> > > > +			reg = <0 0x11230000 0 0x10000>,
> > > > +			      <0 0x11f50000 0 0x1000>;
> > > 
> > > Seems to be an oversight when adding support for mt8183-mmc support to the
> > > driver. The binding description is missing the optional host top register base.
> > > Chaotian can you please help to fix this in the binding description.
> > 
> > Ok. I'll fix it at next version.
> > 
> 
> I'm not sure what you mean. I suppose the way forward is to fix the binding 
> description, correct?
> 
> Thanks,
> Matthias
> 
> > > 
> > > > +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > +			clocks = <&topckgen CLK_TOP_MSDC50_0>,
> > > > +				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
> > > > +				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>;
> > > > +			clock-names = "source", "hclk", "source_cg";
> > > > +			status = "disabled";
> > > > +		};
> > > > +
> > > 
> > > [...]
> > > > +
> > > > +		xhci3: usb@112b0000 {
> > > > +			compatible = "mediatek,mt8195-xhci",
> > > > +				     "mediatek,mtk-xhci";
> > > > +			reg = <0 0x112b0000 0 0x1000>,
> > > > +			      <0 0x112b3e00 0 0x0100>;
> > > > +			reg-names = "mac", "ippc";
> > > > +			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > +			phys = <&u2port3 PHY_TYPE_USB2>;
> > > > +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>,
> > > > +					  <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
> > > > +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> > > > +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> > > > +			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
> > > > +				 <&topckgen CLK_TOP_SSUSB_P3_REF>,
> > > > +				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
> > > > +			clock-names = "sys_ck", "ref_ck", "xhci_ck";
> > > > +			/* This controller is connected with a BT device.
> > > > +			 * Disable usb2 lpm to prevent konwn issues.
> > > > +			 */
> > > > +			usb2-lpm-disable;
> > > 
> > > My understanding is, that this depends on the board and not the SoC. Which means
> > > usb2-lpm-disable should go into any board that has a BT device connected to the
> > > xhci device (I don't see any active xhci node in mt8195-evb so far).
> > 
> > Ok. I'll move this property to evb board in a xhci node.
> > 
> > Best regards,
> > TingHan
> > 
> > > 
> > > Regards,
> > > Matthias


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
