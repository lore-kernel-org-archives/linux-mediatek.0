Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 09:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=meWMSVy+RsADAiTlhkhk+EmdiGeDuoEnauN0EhMXqF0=; b=ET7Of7ODsmZlQG
	OZ0ryORbkVpemV5FEDBfQ9qBeUdtdU/wCKRyGnhbFuWNHhT0K5JJpPaLKbIpAUYcYlnBhNVIxiibq
	ln8kt1d/ZHfdXXYUWLwpwzxZ9/b4BooLHLSYqTp2Mt9N7FPw2caT+bOuvMuX9GlxjzgryjnqYw1++
	YZzUNpL0hBewwW3/TS2XvSjhjFwHUtqFPiOgJLWUhNjrXWVh17QUsAVwnhnOVa/6BhSUwbNydymQs
	Ihtgr4bw3L+tz1Oj6DcSJMK4AtJtle85quFs2puWgQEBUY/Z1VARPUlMOXtLVxk9AsMZ+gXDSfQl3
	n6LR0YuuMuhln8h/Al4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmu0B-002H1G-F8; Fri, 06 May 2022 09:11:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmtzy-002Gz1-Fv; Fri, 06 May 2022 09:11:46 +0000
X-UUID: 8b2cb0a53bfb42c989fdda1a69696f2c-20220506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2f03518b-01f2-4b1b-81b8-2b39dceee9e8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:7c937316-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 8b2cb0a53bfb42c989fdda1a69696f2c-20220506
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1899957104; Fri, 06 May 2022 02:11:28 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 02:11:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 17:11:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 17:11:24 +0800
Message-ID: <6f4aba72d8224223685bca4c03599281878ae1ab.camel@mediatek.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: mt8195-demo: enable ethernet
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Fri, 6 May 2022 17:11:25 +0800
In-Reply-To: <20220429152203.ppuimwcka5d6rvq4@radium>
References: <20220426134106.242353-1-fparent@baylibre.com>
 <20220426134106.242353-6-fparent@baylibre.com>
 <c0cf89c05ee708ec3648b267c1c0a0baa1331836.camel@mediatek.com>
 <f4256b5e-e6b8-f9de-fe97-3e9c6cdcb00c@gmail.com>
 <20220429152203.ppuimwcka5d6rvq4@radium>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_021142_591646_9529E3E6 
X-CRM114-Status: GOOD (  30.05  )
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

On Fri, 2022-04-29 at 17:22 +0200, Fabien Parent wrote:
> On Fri, Apr 29, 2022 at 04:00:32PM +0200, Matthias Brugger wrote:
> > 
> > 
> > On 27/04/2022 08:25, Macpaul Lin wrote:
> > > On Tue, 2022-04-26 at 15:41 +0200, Fabien Parent wrote:
> > > > Enable ethernet on the MT8195 demo board.
> > > > 
> > > > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > > > ---
> > > >   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 108
> > > > +++++++++++++++++++
> > > >   1 file changed, 108 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > > > b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > > > index 08cab3b3943b..0b7985486e2a 100644
> > > > --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> > > > @@ -80,6 +80,30 @@ optee_reserved: optee@43200000 {
> > > >   	};
> > > >   };
> > > > +&eth {
> > > > +	phy-mode = "rgmii-rxid";
> > > > +	phy-handle = <&eth_phy>;
> > > > +	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
> > > > +	snps,reset-delays-us = <0 10000 10000>;
> > > > +	mediatek,tx-delay-ps = <2030>;
> > > > +	pinctrl-names = "default", "sleep";
> > > > +	pinctrl-0 = <&eth_default_pins>;
> > > > +	pinctrl-1 = <&eth_sleep_pins>;
> > > > +	status = "okay";
> > > > +
> > > > +	mdio {
> > > > +		compatible = "snps,dwmac-mdio";
> > > > +		#address-cells = <1>;
> > > > +		#size-cells = <0>;
> > > > +
> > > > +		eth_phy: phy@1 {
> > > > +			compatible = "ethernet-phy-
> > > > id001c.c916";
> > > > +			#phy-cells = <0>;
> > > > +			reg = <0x1>;
> > > > +		};
> > > > +	};
> > > > +};
> > > > +
> > > >   &i2c6 {
> > > >   	clock-frequency = <400000>;
> > > >   	pinctrl-0 = <&i2c6_pins>;
> > > > @@ -260,6 +284,90 @@ &mt6359_vsram_others_ldo_reg {
> > > >   };
> > > >   &pio {
> > > > +	eth_default_pins: eth-default-pins {
> > > > +		pins-cc {
> > > > +			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
> > > > +				 <PINMUX_GPIO88__FUNC_GBE_TXEN>
> > > > ,
> > > > +				 <PINMUX_GPIO87__FUNC_GBE_RXDV>
> > > > ,
> > > > +				 <PINMUX_GPIO86__FUNC_GBE_RXC>;
> > > > +			drive-strength = <MTK_DRIVE_8mA>;
> > > > +		};
> > > > +
> > > > +		pins-mdio {
> > > > +			pinmux = <PINMUX_GPIO89__FUNC_GBE_MDC>,
> > > > +				 <PINMUX_GPIO90__FUNC_GBE_MDIO>
> > > > ;
> > > > +			input-enable;
> > > > +		};
> > > > +
> > > > +		pins-phy-reset {
> > > > +			pinmux = <PINMUX_GPIO93__FUNC_GPIO93>;
> > > > +		};
> > > > +
> > > > +		pins-power {
> > > > +			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
> > > > +				 <PINMUX_GPIO92__FUNC_GPIO92>;
> > > > +			output-high;
> > > > +		};
> > > > +
> > > > +		pins-rxd {
> > > > +			pinmux =
> > > > <PINMUX_GPIO81__FUNC_GBE_RXD3>,
> > > > +				 <PINMUX_GPIO82__FUNC_GBE_RXD2>
> > > > ,
> > > > +				 <PINMUX_GPIO83__FUNC_GBE_RXD1>
> > > > ,
> > > > +				 <PINMUX_GPIO84__FUNC_GBE_RXD0>
> > > > ;
> > > > +		};
> > > > +
> > > > +		pins-txd {
> > > > +			pinmux =
> > > > <PINMUX_GPIO77__FUNC_GBE_TXD3>,
> > > > +				 <PINMUX_GPIO78__FUNC_GBE_TXD2>
> > > > ,
> > > > +				 <PINMUX_GPIO79__FUNC_GBE_TXD1>
> > > > ,
> > > > +				 <PINMUX_GPIO80__FUNC_GBE_TXD0>
> > > > ;
> > > > +			drive-strength = <MTK_DRIVE_8mA>;
> > > > +		};
> > > > +	};
> > > > +
> > > > +	eth_sleep_pins: eth-sleep-pins {
> > > > +		pins-cc {
> > > > +			pinmux = <PINMUX_GPIO85__FUNC_GPIO85>,
> > > > +				 <PINMUX_GPIO88__FUNC_GPIO88>,
> > > > +				 <PINMUX_GPIO87__FUNC_GPIO87>,
> > > > +				 <PINMUX_GPIO86__FUNC_GPIO86>;
> > > > +		};
> > > > +
> > > > +		pins-mdio {
> > > > +			pinmux = <PINMUX_GPIO89__FUNC_GPIO89>,
> > > > +				 <PINMUX_GPIO90__FUNC_GPIO90>;
> > > > +			input-disable;
> > > > +			bias-disable;
> > > > +		};
> > > > +
> > > > +		pins-phy-reset {
> > > > +			pinmux = <PINMUX_GPIO93__FUNC_GPIO93>;
> > > > +			input-disable;
> > > > +			bias-disable;
> > > > +		};
> > > > +
> > > > +		pins-power {
> > > > +			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
> > > > +				 <PINMUX_GPIO92__FUNC_GPIO92>;
> > > > +			input-disable;
> > > > +			bias-disable;
> > > > +		};
> > > > +
> > > > +		pins-rxd {
> > > > +			pinmux = <PINMUX_GPIO81__FUNC_GPIO81>,
> > > > +				 <PINMUX_GPIO82__FUNC_GPIO82>,
> > > > +				 <PINMUX_GPIO83__FUNC_GPIO83>,
> > > > +				 <PINMUX_GPIO84__FUNC_GPIO84>;
> > > > +		};
> > > > +
> > > > +		pins-txd {
> > > > +			pinmux = <PINMUX_GPIO77__FUNC_GPIO77>,
> > > > +				 <PINMUX_GPIO78__FUNC_GPIO78>,
> > > > +				 <PINMUX_GPIO79__FUNC_GPIO79>,
> > > > +				 <PINMUX_GPIO80__FUNC_GPIO80>;
> > > > +		};
> > > > +	};
> > > > +
> > > >   	gpio_keys_pins: gpio-keys-pins {
> > > >   		pins {
> > > >   			pinmux =
> > > > <PINMUX_GPIO106__FUNC_GPIO106>;
> > > 
> > > Tested-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > > 
> > 
> > I get the following error:
> > Error: arch/arm64/boot/dts/mediatek/mt8195.dtsi:582.26-27 syntax
> > error
> 
> I think he used my upstreaming branch where I store the patches I
> sent
> and will send to the mailing list: [0].
> 
> I forgot there is a dependency between this patch and [1], and I
> forgot
> to test this patch serie independenly from the other commits from my
> branch. I will make sure to not forget next time.
> 
> So from this patch serie, only patch 1-2, 6-7 can be applied since
> they
> don't have any hidden dependency:
>   dt-bindings: usb: mediatek,mtu3: add binding for MT8195 SoC
>   arm64: dts: mediatek: mt8195: add ssusb support
>   arm64: dts: mediatek: mt8195-demo: Remove input-name property
>   arm64: dts: mediatek: mt8195-demo: enable uart1
> 
> [0] https://github.com/Fabo/linux/tree/mt8195-demo
> [1] 
> https://lore.kernel.org/all/20210615173233.26682-7-tinghan.shen@mediatek.com/
> 
> > 
> > 
> > 
> > How did you test?
> > 
> > Regards,
> > Matthias

Sorry for replying the mail late.

Actually, I've maintained a working tree based on 5.18-rc1 with minimum
changeset support booting to UART. Then pickup required patches for
testing individaul drivers. I should add the patch dependencies in
previous mail if there were a dependency list. However, attach a
dependency list might still be confusing since there is lots of patches
keep updating everyday for mediatek tree. I guess the best practice for
avoiding this kind of mess is using for-next tree to verify new patches
instead of using 5.18-rc1 tree since some of the dependencies were
already merged. Sorry for wasting your time.

I'll replace my local
working tree to Matthias's working tree for verifing these kind of
patches.

Thanks!
Macpaul Lin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
