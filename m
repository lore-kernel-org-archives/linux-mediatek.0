Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39413CF044A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Xmb2mPCDgSRpJL3Um+H6foOo5ZMTdM1eiAg7MSG6Fs=; b=JGCTW8fWrXz3ak/kBvLHlvTem4
	6fxnEHarIMxzeC8fsZSWQ4uLHak1QPCWcfXsDm4tlEfXN+hQQwoMN74Shr/TkzsaI9OGJ4NENuORr
	h0vPAXgM6tJByF8xGeJfcF3hsclp1iiL4PNSggtd8qe12g7I/zysqrOafc2Drh03cVNogodgmUd6u
	/o6qga9VrZHQep0C1gHyHeliqPolrTdF5GM+YyKFbbzYvG12KTPVOOp64aoDvB9RAxrobX8YoFBJd
	H24TzZIMRiYnlIpay1VdC+C7R7UYpF/rKRlDZOFba2h2uC68MB72G9QP8TmVDuyDv6GunfeVbb5X5
	tnLeUjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUGf-00000008wOg-10ph;
	Wed, 09 Oct 2024 10:50:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUFK-00000008wIK-18mf;
	Wed, 09 Oct 2024 10:48:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2428A43D51;
	Wed,  9 Oct 2024 10:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A7FC4CEC5;
	Wed,  9 Oct 2024 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728470924;
	bh=o8zwS+U6LeYKFN9VysiAqAg2lYDixQmK+0AmbcHIRZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWnObNS1pDWpwmOs4rrWPCJo2d+QC7bN0jhLKY7QkXaCs8yC5idrRtLZF7zvDA8Qd
	 vtvFDXTsq2XfwJhKhljAToW0ghqwNMKVBO55i5f8mIHXQqP0r1FcxgZ6I1IFs/yzWs
	 KwkDvo+8uapUzylUrfRLh2Kd0Py0DKpLa2twe+4nXvxldbGP+Jl5IMURki+MBwV3dV
	 LDYcEsjJMRy0lpzyt5wjshC43/JlH7kZ/1qtso56Mlg66cEUgdA3NOKh5fz4147cl9
	 RBQhCZ4oD+dy1TPLxNkaReMiFaC5HXnYIgpC5k6brno2XLMx23YYyxStDifipkbPAd
	 9pPI/DHnJRifg==
Date: Wed, 9 Oct 2024 11:48:21 +0100
From: Lee Jones <lee@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v5 3/5] mfd: airoha: Add support for Airoha EN7581 MFD
Message-ID: <20241009104821.GF276481@google.com>
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
 <20241001-en7581-pinctrl-v5-3-dc1ce542b6c6@kernel.org>
 <20241002132518.GD7504@google.com>
 <ZwWscWk5axQI9H1t@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZwWscWk5axQI9H1t@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_034846_491325_FE9F5972 
X-CRM114-Status: GOOD (  21.97  )
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

On Wed, 09 Oct 2024, Lorenzo Bianconi wrote:

> On Oct 02, Lee Jones wrote:
> > On Tue, 01 Oct 2024, Lorenzo Bianconi wrote:
> > 
> > > From: Christian Marangi <ansuelsmth@gmail.com>
> > > 
> > > Support for Airoha EN7581 Multi Function Device that
> > > expose PINCTRL functionality and PWM functionality.
> > 
> > The device is a jumble of pinctrl registers, some of which can oscillate.
> > 
> > This is *still* not an MFD.
> > 
> > If you wish to spread this functionality over 2 drivers, use syscon to
> > obtain the registers and simple-mfd to automatically probe the drivers.
> 
> Hi Lee,
> 
> IIUC you are suggesting two possible approaches here:
> 
> 1- have a single driver implementing both pinctrl and pwm functionalities.
>    This approach will not let us reuse the code for future devices that
>    have just one of them in common, like pwm (but we can live with that).

If you can have one without the other, then they are separate devices.

> 2- use a device node like the one below (something similar to [0])
> 
> system-controller@1fbf0200 {
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
> 	pio: pinctrl {
> 		compatible = "airoha,en7581-pinctrl";
> 
> 		[ some pinctrl properties here ]
> 	};
> 
> 	#pwm-cells = <3>;
> 
> 	pwm {
> 		compatible = "airoha,en7581-pwm";
> 	};
> };
> 
> Please correct me if I am wrong, but using syscon/simple-mfd as compatible
> string for the 'parent' device, will require to introduce the compatible strings
> even for the child devices in order to probe them, correct? 
> If so, as pointed out by Christian, this is something nacked by Rob/Krzysztof/Conor
> (this is the main reason why we introduced a full mfd driver here).
> 
> @Rob, Krzysztof, Conor: am I right?

I don't see why separate functionality shouldn't have separate
compatible strings, even if the registers are together.  Register layout
and functionality separation are not related.

-- 
Lee Jones [李琼斯]

