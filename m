Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4479AC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 22:52:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C334E20756
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 22:52:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qxhr37CX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6DzT0ks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C334E20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=BK+ZcLJ9EIMv2SuwWHpIom5bR8dqiJhP8dyel9IPWE4=; b=qxhr37CX5Z3kID8/BFiQjoVhz
	fe1GA9Ku3md1zHYqAeVRlU2IAP0uSfiE0tfhYDly7erawtFPf7StsbDCzV2NEXu6yZ16kORVa4Buf
	PzVW1A41cGRv09fP2GL+Xo+6iabtPU2+RHXumO4LXay5SSvoUKtv6dDMlOtnUuu3rBQB+s8VO6AXG
	rcpYk2GW0nFYClhJ8OT5RrSoaIYSwt6jMEOMEabDw3r6Bp4zwiviMb+XxiZ6PvH2KO5KVU0Z1DcoE
	KAgfUFUCQV8QqEz16+k3sAqsK4Iy+vpbdrUxEuT2TcoHyyTLcz0AZhGGB9UbOCimgmeSYtYCFKG1Y
	YLQH6fljQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka59f-0006xf-G9; Tue, 03 Nov 2020 22:51:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka59Z-0006wI-OX; Tue, 03 Nov 2020 22:51:51 +0000
Received: from localhost (230.sub-72-107-127.myvzw.com [72.107.127.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 532222074F;
 Tue,  3 Nov 2020 22:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604443908;
 bh=ZTc1hgZLMSAMqmuiHXxbYJqFXykktHOtVDml/cKUNQI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=K6DzT0ksd3lJgCr+h18+p8FlRdsdY5B8CYGfhGx6IshX9G71zdkA9OJEr5+v+WnDG
 W3iKWYFFhiCFyIbrWhP2aLH+7d5F0y6cuF5faq3ECbKRZHQPrufds4Y6x+gApQdyqF
 tJnQfARtjZ6R8PTljKHYcG1GsqgzSnRWzcTbsJOU=
Date: Tue, 3 Nov 2020 16:51:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Subject: Re: [PATCH v7 4/4] ARM: dts: mediatek: Modified MT7629 PCIe node
Message-ID: <20201103225147.GA272037@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029081513.10562-5-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_175150_347119_289FCCEE 
X-CRM114-Status: GOOD (  17.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This subject line is pointless.

Every patch modifies something.  Give us a hint about what you
modified and why.

And use the present tense verb, i.e., "Modify ...", not "Modified".
Probably "Add" would be better than "Modify".  Or "Update" with some
meaningful description of the update.

On Thu, Oct 29, 2020 at 04:15:13PM +0800, Chuanjia Liu wrote:
> Remove unused property and add pciecfg node.

Apparently this also removes "subsys" from the "reg" property.
And removes an interrupt.  And adds "pcie_irq".

> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  arch/arm/boot/dts/mt7629-rfb.dts |  3 ++-
>  arch/arm/boot/dts/mt7629.dtsi    | 22 ++++++++++++----------
>  2 files changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mt7629-rfb.dts b/arch/arm/boot/dts/mt7629-rfb.dts
> index 9980c10c6e29..eb536cbebd9b 100644
> --- a/arch/arm/boot/dts/mt7629-rfb.dts
> +++ b/arch/arm/boot/dts/mt7629-rfb.dts
> @@ -140,9 +140,10 @@
>  	};
>  };
>  
> -&pcie {
> +&pcie1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie_pins>;
> +	status = "okay";
>  };
>  
>  &pciephy1 {
> diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
> index 5cbb3d244c75..6d6397f0c2fc 100644
> --- a/arch/arm/boot/dts/mt7629.dtsi
> +++ b/arch/arm/boot/dts/mt7629.dtsi
> @@ -360,16 +360,20 @@
>  			#reset-cells = <1>;
>  		};
>  
> -		pcie: pcie@1a140000 {
> +		pciecfg: pciecfg@1a140000 {
> +			compatible = "mediatek,generic-pciecfg", "syscon";
> +			reg = <0x1a140000 0x1000>;
> +		};
> +
> +		pcie1: pcie@1a145000 {
>  			compatible = "mediatek,mt7629-pcie";
>  			device_type = "pci";
> -			reg = <0x1a140000 0x1000>,
> -			      <0x1a145000 0x1000>;
> -			reg-names = "subsys","port1";
> +			reg = <0x1a145000 0x1000>;
> +			reg-names = "port1";
>  			#address-cells = <3>;
>  			#size-cells = <2>;
> -			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_LOW>,
> -				     <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +			interrupt-names = "pcie_irq";
>  			clocks = <&pciesys CLK_PCIE_P1_MAC_EN>,
>  				 <&pciesys CLK_PCIE_P0_AHB_EN>,
>  				 <&pciesys CLK_PCIE_P1_AUX_EN>,
> @@ -390,21 +394,19 @@
>  			power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
>  			bus-range = <0x00 0xff>;
>  			ranges = <0x82000000 0 0x20000000 0x20000000 0 0x10000000>;
> +			status = "disabled";
>  
> -			pcie1: pcie@1,0 {
> -				device_type = "pci";
> +			slot1: pcie@1,0 {
>  				reg = <0x0800 0 0 0 0>;
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				#interrupt-cells = <1>;
>  				ranges;
> -				num-lanes = <1>;
>  				interrupt-map-mask = <0 0 0 7>;
>  				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
>  						<0 0 0 2 &pcie_intc1 1>,
>  						<0 0 0 3 &pcie_intc1 2>,
>  						<0 0 0 4 &pcie_intc1 3>;
> -
>  				pcie_intc1: interrupt-controller {
>  					interrupt-controller;
>  					#address-cells = <0>;
> -- 
> 2.18.0
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
