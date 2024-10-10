Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A261CCFC5E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 17:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2IsTmjsXWmWmHIU/lIoHQUg3jwxA6qxJW27BSVJ9Vg=; b=UEf+xhLsdXJK+ex4G049x/FY3E
	lJJgsFbetCrAImojaQ5QdVi8msVJvj7dQ9TH1cMUUHLqQ671DcD9MJxeI/imwBV2Z/1gW1SmxFqhO
	WNAfLLaJI8qezQb7BqNA7bz9nvH4bgQXCBNVHh5TxZN9lV6LP32HeDkge+OBF6bLWm5yzxlZwZD41
	jBoryZep25Ew0mjpCWkCGCMdw0+Nj9A8ztO2PlV3JI6lQPCVPnKzaT5AZnxPIdlzXICMvmvB0YNV/
	wRMzDEDlDfaf23pueQ3NVWI/4XPxt3r4zrbsnjzMqGcdDIh7fEiUNQVNtzq7gdJtWGmn1zjTmiurI
	lb1jgK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syxEv-0000000Dj2g-1a9c;
	Thu, 10 Oct 2024 17:46:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvyk-0000000DVxY-2edx;
	Thu, 10 Oct 2024 16:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C46A65C0669;
	Thu, 10 Oct 2024 16:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876C5C4CEC5;
	Thu, 10 Oct 2024 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728577529;
	bh=kuhtG6pu0KbKdRV5X1pxoX5/EESlie9bsRHdD9lFH1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iyB8D+9McXR1e2Ot6L4IemN+/dCjby7IWufPoXC70W3pkTBmzqV+oBZtaNmAuDwQU
	 xF9HnEdIjVax2v7KO+0fUwnd4rfddGmAirDLLK3FPCmVJ3PfOEjkAChyBbaJ5zccob
	 vlXD6dzANj5y0SEzJfqbPEqT6aoAoRsllkEGMVBB1Sa+yAzBwvE6RwPJ2Su9tm+nVj
	 lYTtwfsivqXX7zpO3UggovNrFY9vdUZdKInPqFUh6CXFMNwyaSi94CI/u9OkyZLwzF
	 0zq7sFhM7DIjuqk5onC9zPUad7rYwcD3U0eM59De//vA9YBlLsWBXjZkhpOsrWbyBr
	 3dnulVLzQv70A==
Date: Thu, 10 Oct 2024 17:25:23 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v5 3/5] mfd: airoha: Add support for Airoha EN7581 MFD
Message-ID: <20241010162523.GJ661995@google.com>
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
 <20241001-en7581-pinctrl-v5-3-dc1ce542b6c6@kernel.org>
 <20241002132518.GD7504@google.com>
 <ZwWscWk5axQI9H1t@lore-desk>
 <20241009104821.GF276481@google.com>
 <20241009105550.GG276481@google.com>
 <6707a8ec.df0a0220.376450.293e@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6707a8ec.df0a0220.376450.293e@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_092530_789265_7174FDAD 
X-CRM114-Status: GOOD (  32.59  )
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

On Thu, 10 Oct 2024, Christian Marangi wrote:

> On Wed, Oct 09, 2024 at 11:55:50AM +0100, Lee Jones wrote:
> > On Wed, 09 Oct 2024, Lee Jones wrote:
> > 
> > > On Wed, 09 Oct 2024, Lorenzo Bianconi wrote:
> > > 
> > > > On Oct 02, Lee Jones wrote:
> > > > > On Tue, 01 Oct 2024, Lorenzo Bianconi wrote:
> > > > > 
> > > > > > From: Christian Marangi <ansuelsmth@gmail.com>
> > > > > > 
> > > > > > Support for Airoha EN7581 Multi Function Device that
> > > > > > expose PINCTRL functionality and PWM functionality.
> > > > > 
> > > > > The device is a jumble of pinctrl registers, some of which can oscillate.
> > > > > 
> > > > > This is *still* not an MFD.
> > > > > 
> > > > > If you wish to spread this functionality over 2 drivers, use syscon to
> > > > > obtain the registers and simple-mfd to automatically probe the drivers.
> > > > 
> > > > Hi Lee,
> > > > 
> > > > IIUC you are suggesting two possible approaches here:
> > > > 
> > > > 1- have a single driver implementing both pinctrl and pwm functionalities.
> > > >    This approach will not let us reuse the code for future devices that
> > > >    have just one of them in common, like pwm (but we can live with that).
> > > 
> > > If you can have one without the other, then they are separate devices.
> > > 
> > > > 2- use a device node like the one below (something similar to [0])
> > > > 
> > > > system-controller@1fbf0200 {
> > > > 	compatible = "syscon", "simple-mfd";
> > > > 	reg = <0x0 0x1fbf0200 0x0 0xc0>;
> > > > 
> > > > 	interrupt-parent = <&gic>;
> > > > 	interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > > > 
> > > > 	gpio-controller;
> > > > 	#gpio-cells = <2>;
> > > > 
> > > > 	interrupt-controller;
> > > > 	#interrupt-cells = <2>;
> > > > 
> > > > 	pio: pinctrl {
> > > > 		compatible = "airoha,en7581-pinctrl";
> > > > 
> > > > 		[ some pinctrl properties here ]
> > > > 	};
> > > > 
> > > > 	#pwm-cells = <3>;
> > > > 
> > > > 	pwm {
> > > > 		compatible = "airoha,en7581-pwm";
> > > > 	};
> > > > };
> > > > 
> > > > Please correct me if I am wrong, but using syscon/simple-mfd as compatible
> > > > string for the 'parent' device, will require to introduce the compatible strings
> > > > even for the child devices in order to probe them, correct? 
> > > > If so, as pointed out by Christian, this is something nacked by Rob/Krzysztof/Conor
> > > > (this is the main reason why we introduced a full mfd driver here).
> > > > 
> > > > @Rob, Krzysztof, Conor: am I right?
> > > 
> > > I don't see why separate functionality shouldn't have separate
> > > compatible strings, even if the registers are together.  Register layout
> > > and functionality separation are not related.
> > 
> > We've been happy to support both pinctrl and pwm devices before:
> > 
> >   git grep "\-pinctrl\|\-pwm" -- drivers/mfd
> >   git grep "\-pinctrl\|\-pwm" -- arch/*/boot/dts
> > 
> >   git grep "\-pinctrl" -- arch/*/boot/dts | wc -l
> >   602
> >   git grep "\-pwm" -- arch/*/boot/dts | wc -l
> >   856
> > 
> > What makes this particular device different to all of the others?
> >
> 
> Hi Lee,
> 
> this would be the final DTS following the "simple-mfd" pattern.
> 
> Can you confirm it's correct?

I can't confirm that it's 100% correct, but it looks okay to me.

> mfd: system-controller@1fbf0200 {

Not sure about the mfd: label though.

What is the device?

> 	compatible = "syscon", "simple-mfd";
> 	reg = <0x0 0x1fbf0200 0x0 0xc0>;
>  
> 	interrupt-parent = <&gic>;
> 	interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>  
> 	gpio-controller;
> 	#gpio-cells = <2>;
>  
> 	interrupt-controller;
> 	#interrupt-cells = <2>;
> 
> 	gpio-ranges = <&mfd 0 13 47>;
> 
> 	#pwm-cells = <3>;
>  
> 	pio: pinctrl {
> 		compatible = "airoha,en7581-pinctrl";
>  
> 		mdio_pins: mdio-pins {
> 			mux {
> 				function = "mdio";
> 				groups = "mdio";
> 			};
>  
> 			conf {
> 				pins = "gpio2";
> 				output-high;
> 			};
> 		};
>  
> 		pcie0_rst_pins: pcie0-rst-pins {
> 			conf {
> 				pins = "pcie_reset0";
> 				drive-open-drain = <1>;
> 			};
> 		};
>  
> 		pcie1_rst_pins: pcie1-rst-pins {
> 			conf {
> 				pins = "pcie_reset1";
> 				drive-open-drain = <1>;
> 			};
> 		};
> 	};
>  
> 	pwm {
> 		compatible = "airoha,en7581-pwm";
> 	};
> };
> 
> -- 
> 	Ansuel

-- 
Lee Jones [李琼斯]

