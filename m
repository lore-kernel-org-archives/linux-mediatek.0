Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5DFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 10:49:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43218610FB
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 10:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43218610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRl9orfYFYEtPle4XCrTIXnmPxzg7wH8wAUDjAZT8hY=; b=LItLIxvF7n2H6B
	tqudMFHCKr33AUNN3E6xQpmo/o50CkkyEhFz7PxAuslXvHb2Wcl0RbF77U01rVMvmgw7hTsjfXA+X
	4kcnkGMGWPkj2ZbK3ziNXS6sN2YaUgTSaSMpVxl4P2IPVKeqwKXB/VXzzRCsqPvF3Ch8XjKOQG0k8
	M0ZTeD4G2pYrGOWUmU2s44jnWGgcX8kqEkOb/1/oKqu6W7QeXabmVkBCWxq9dX5nj/k5KVVl1D5NT
	pP3I6fWk977owiwPJI6eF//FMgGVOcBpiIRskfH7UXb2NFA6NTCZ5G9a1OOVtcLq69DuJPS0pqXKf
	1KjwuW32F4Nkm7LZ58UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSGrG-001JDk-Mk; Mon, 20 Sep 2021 10:49:10 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSGr3-001J8y-0e; Mon, 20 Sep 2021 10:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632134924;
 bh=UE6JPDxLxhHS8QF+kGYS6SUXXeB3wiXl2OFGWk3OyGs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CPR7SYqbDnEIHf2IgQzx7mMO9xt0ZVNCmAoqCT8yTPy7AB+j/NgIWGZrS42PMIjlO
 NGen88DHV1tnkKIXA2p98IcIz9vujw8ItkZlGPanHfn3y/kBIEH9bVDaMo0jYQjd4s
 pUDfBtpkTeizRdrVCjo21Mpmn5+tJZ/uj58z5M+I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.76.103] ([80.245.76.103]) by web-mail.gmx.net
 (3c-app-gmx-bap08.server.lan [172.19.172.78]) (via HTTP); Mon, 20 Sep 2021
 12:48:44 +0200
MIME-Version: 1.0
Message-ID: <trinity-1d1646a2-6fb9-4a81-9edc-45c4d216a279-1632134924710@3c-app-gmx-bap08>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sungbo Eo <mans0n@gorani.run>, Matthias Brugger <matthias.bgg@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bin Liu <b-liu@ti.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sungbo Eo <mans0n@gorani.run>
Subject: Aw: [PATCH v4 1/2] arm: dts: mt7623: add musb device nodes
Date: Mon, 20 Sep 2021 12:48:44 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210830155903.13907-2-mans0n@gorani.run>
References: <20210822041333.5264-1-mans0n@gorani.run>
 <20210830155903.13907-1-mans0n@gorani.run>
 <20210830155903.13907-2-mans0n@gorani.run>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:h+4u+2DNNQq/zFxGtQ+E9hroBIiOkc2j+6J/9LOROcecrSGZrwD7KyAje9UTcYe3Adrpf
 wxLLX03FCB+UBYr2y+/6W9mCCXarLsqxkmuTjF27xwVAIzdc4mNtUqnJg3tLkcACjsvPtDueNAAU
 uppDuW4tedE2jjUFJqZtgmf50QAZwbYVlJfS1dnwHK+5h6o4N/zn9Du38NIWLsQp1S84dq4UpgDF
 jOXj5yhXjD0ZCrYfZbDR1QYLn1TjALN1nn0BeIS5Y1a14P4w2iDWXrOmZuRuTcOBX3Dt8jSU/4gN
 pg=
X-UI-Out-Filterresults: notjunk:1;V03:K0:WPDNJBBn+AY=:MmMNvz3wrtvo0tCZoZfq1U
 GzC4SCvrcWmYzVzP1xpiVVC/DvSfVyzXGrbWeqRx3WbjKyJYO6W/jwJFger6BR1S2drdXTGGq
 C+yHRL4dVfI2tguqvSB7pkI5LbkgCRg8l97GJ5vmghM7Twc7PN/tYYQyojiBOHzY91/uihR3/
 +YzZAg6v+y2aew8+7hmKNnu2qiDRwhEqfHc+eqWjyVQhgGv4dn9JtU10zLot1FhWG/MfVQQoq
 DJNsu/pOrvH6P7asE05CjcDlGIm1ZtlgjcWjeyJQBNSFDgkx4kUSDiSIL5BE2BMWZbYPSOH+o
 MTilrrmAflvhvUsdjZ6BGbsyiALTGxF1abplK3QD58LUkUxzaevUkieZMaXE0OPGnVoLjRZtT
 xULn6UP81Yiyawhtvr5Zugv9iWXtvl/ygWxtSHS97iuObUkqhrQ2KqItNHkD8f9fQoWcehkRk
 SL+7ssffFTOj3QaLf5TchQLWZOVvMYFwScZsG67JNXtF3hqFI0lJhQftXmFiLy9RldYiZDG7i
 /KzV+iwp5cifrEwDl7BZXi3uLlo6SCZQadYi5WpyXaoD4i7NhhEf6pCjgWhZmGOUR716dMOZx
 DaJKo3vMo1rshShJPkLpQSeX117rq5w55BJN33FUGAw347TOtk9l2bY6VOgcZwQQkrq+DYLxY
 NrX3/6jD+2KAXXOAmD7yU6G3XQ9ztzkt6K/7DOweOonb0PfDnwXwb0gqS8NszQMu6BMSXOsnb
 Xam5BBwfOBIpZvcrbMwm1DI84YTCTkK4IYS1XBZSCq+pn7A38qq7otG4+FkwEEgdsfFY99Uyw
 +FVdSbM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_034857_381782_F955B9DF 
X-CRM114-Status: GOOD (  18.44  )
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

Hi,

just a gentle ping for this patch (second part is already merged to usb-tree) and my followup for bpi-r2

https://patchwork.kernel.org/project/linux-mediatek/patch/20210830145958.108605-1-linux@fw-web.de/

regards Frank


> Gesendet: Montag, 30. August 2021 um 17:59 Uhr
> Von: "Sungbo Eo" <mans0n@gorani.run>
> An: linux-mediatek@lists.infradead.org
> Cc: "Rob Herring" <robh+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Bin Liu" <b-liu@ti.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Frank Wunderlich" <frank-w@public-files.de>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Sungbo Eo" <mans0n@gorani.run>
> Betreff: [PATCH v4 1/2] arm: dts: mt7623: add musb device nodes
>
> MT7623 has an musb controller that is compatible with the one from MT2701.
>
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v4:
> * add tested by Frank
>
> v3:
> * remove unnecessary status=okay from u2port2
>
> v2:
> * rename usb3 label to usb0
> * move usb0 & u2phy1 nodes to the right sorted place
> * disable u2phy1 by default
> * correct u2port2 node name to match its reg address
> ---
>  arch/arm/boot/dts/mt7623.dtsi  | 33 +++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/mt7623a.dtsi |  4 ++++
>  2 files changed, 37 insertions(+)
>
> diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
> index 3c11f7cfcc40..21c8a291b74e 100644
> --- a/arch/arm/boot/dts/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mt7623.dtsi
> @@ -585,6 +585,39 @@ spi2: spi@11017000 {
>  		status = "disabled";
>  	};
>
> +	usb0: usb@11200000 {
> +		compatible = "mediatek,mt7623-musb",
> +			     "mediatek,mtk-musb";
> +		reg = <0 0x11200000 0 0x1000>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "mc";
> +		phys = <&u2port2 PHY_TYPE_USB2>;
> +		dr_mode = "otg";
> +		clocks = <&pericfg CLK_PERI_USB0>,
> +			 <&pericfg CLK_PERI_USB0_MCU>,
> +			 <&pericfg CLK_PERI_USB_SLV>;
> +		clock-names = "main","mcu","univpll";
> +		power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
> +		status = "disabled";
> +	};
> +
> +	u2phy1: t-phy@11210000 {
> +		compatible = "mediatek,mt7623-tphy",
> +			     "mediatek,generic-tphy-v1";
> +		reg = <0 0x11210000 0 0x0800>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		status = "disabled";
> +
> +		u2port2: usb-phy@11210800 {
> +			reg = <0 0x11210800 0 0x0100>;
> +			clocks = <&topckgen CLK_TOP_USB_PHY48M>;
> +			clock-names = "ref";
> +			#phy-cells = <1>;
> +		};
> +	};
> +
>  	audsys: clock-controller@11220000 {
>  		compatible = "mediatek,mt7623-audsys",
>  			     "mediatek,mt2701-audsys",
> diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
> index 0735a1fb8ad9..d304b62d24b5 100644
> --- a/arch/arm/boot/dts/mt7623a.dtsi
> +++ b/arch/arm/boot/dts/mt7623a.dtsi
> @@ -35,6 +35,10 @@ &scpsys {
>  	clock-names = "ethif";
>  };
>
> +&usb0 {
> +	power-domains = <&scpsys MT7623A_POWER_DOMAIN_IFR_MSC>;
> +};
> +
>  &usb1 {
>  	power-domains = <&scpsys MT7623A_POWER_DOMAIN_HIF>;
>  };
> --
> 2.33.0
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
