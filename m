Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C61CF044D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 10:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RQnJdz3phaWPE9ESoTcuzIJdrEKdf8UIl+R5/I//2M=; b=sVyX3Dukmeo2sy/5UunIMUu1OY
	7KfKj29s9QVB6pnZAML5Hvhpim9Q8nRJhmM5QdN8SDH7GhXmlkfz2pwWCTUIxwSULz04JI6iZ/HSy
	QyfP9x5ZW4Lb3TFWe9MXOtHKSjZPyUJJe6RW4WjDiMLQL0i0y3eVDxE2hZARvLI6TK6haMz8MIzQG
	vA+PcAy4WrtSnAsey6SOgahTnE9YwxDKR0TzUjFezjqdN2IS26PFJKMIRfZ6Em5Jqq0junzS+eqUU
	E+2C9F3x36+ltKy2RhT02+iVdTZixe4Gri1Ty4HcL8DnLLBVlP8qPQQrkLgc7xz28+1zBsQQazz1u
	Dh2VEUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUNk-00000008xh6-2nlm;
	Wed, 09 Oct 2024 10:57:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUMN-00000008xRQ-1bzr;
	Wed, 09 Oct 2024 10:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 850415C57DC;
	Wed,  9 Oct 2024 10:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48AEC4CECC;
	Wed,  9 Oct 2024 10:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728471362;
	bh=iTfwPek46U0n5ya6D6iZcyM9CFuS7Bf6w/iiLN1DXJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eE3Tiall50C2INIwqukLY+x5A5aZ/znduHmY737eecjqO6cncLv5VmqkafjZD+T9t
	 BbPL5x9tpgujQBaTx1ra5XRWU/6W9iiqleguDncwQIoRrZi2Vo4Pk+JFErOtGA2A/u
	 5ulpLLbiBYa2O1XH/meRlDvuCMz53qAQItX1zGx9MX97wI2JZ4FgqjUwPpwbTD4J9y
	 65SmjcHRa2V+dFnDeXSB6kHcPRnXO5BzvmOZqHH2zWUA4iIbqzsd61a3Qoq/WaX2qB
	 iaSP86dvVMnTmuh21Hi+CrKZvnHdkladZoCWQV2anUy9RFmHxg+ZEGZjh/vsaLItko
	 juH2VjnPnzrZg==
Date: Wed, 9 Oct 2024 11:55:50 +0100
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
Message-ID: <20241009105550.GG276481@google.com>
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
 <20241001-en7581-pinctrl-v5-3-dc1ce542b6c6@kernel.org>
 <20241002132518.GD7504@google.com>
 <ZwWscWk5axQI9H1t@lore-desk>
 <20241009104821.GF276481@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009104821.GF276481@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_035603_544577_8ADDF4A5 
X-CRM114-Status: GOOD (  25.90  )
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

On Wed, 09 Oct 2024, Lee Jones wrote:

> On Wed, 09 Oct 2024, Lorenzo Bianconi wrote:
> 
> > On Oct 02, Lee Jones wrote:
> > > On Tue, 01 Oct 2024, Lorenzo Bianconi wrote:
> > > 
> > > > From: Christian Marangi <ansuelsmth@gmail.com>
> > > > 
> > > > Support for Airoha EN7581 Multi Function Device that
> > > > expose PINCTRL functionality and PWM functionality.
> > > 
> > > The device is a jumble of pinctrl registers, some of which can oscillate.
> > > 
> > > This is *still* not an MFD.
> > > 
> > > If you wish to spread this functionality over 2 drivers, use syscon to
> > > obtain the registers and simple-mfd to automatically probe the drivers.
> > 
> > Hi Lee,
> > 
> > IIUC you are suggesting two possible approaches here:
> > 
> > 1- have a single driver implementing both pinctrl and pwm functionalities.
> >    This approach will not let us reuse the code for future devices that
> >    have just one of them in common, like pwm (but we can live with that).
> 
> If you can have one without the other, then they are separate devices.
> 
> > 2- use a device node like the one below (something similar to [0])
> > 
> > system-controller@1fbf0200 {
> > 	compatible = "syscon", "simple-mfd";
> > 	reg = <0x0 0x1fbf0200 0x0 0xc0>;
> > 
> > 	interrupt-parent = <&gic>;
> > 	interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > 
> > 	gpio-controller;
> > 	#gpio-cells = <2>;
> > 
> > 	interrupt-controller;
> > 	#interrupt-cells = <2>;
> > 
> > 	pio: pinctrl {
> > 		compatible = "airoha,en7581-pinctrl";
> > 
> > 		[ some pinctrl properties here ]
> > 	};
> > 
> > 	#pwm-cells = <3>;
> > 
> > 	pwm {
> > 		compatible = "airoha,en7581-pwm";
> > 	};
> > };
> > 
> > Please correct me if I am wrong, but using syscon/simple-mfd as compatible
> > string for the 'parent' device, will require to introduce the compatible strings
> > even for the child devices in order to probe them, correct? 
> > If so, as pointed out by Christian, this is something nacked by Rob/Krzysztof/Conor
> > (this is the main reason why we introduced a full mfd driver here).
> > 
> > @Rob, Krzysztof, Conor: am I right?
> 
> I don't see why separate functionality shouldn't have separate
> compatible strings, even if the registers are together.  Register layout
> and functionality separation are not related.

We've been happy to support both pinctrl and pwm devices before:

  git grep "\-pinctrl\|\-pwm" -- drivers/mfd
  git grep "\-pinctrl\|\-pwm" -- arch/*/boot/dts

  git grep "\-pinctrl" -- arch/*/boot/dts | wc -l
  602
  git grep "\-pwm" -- arch/*/boot/dts | wc -l
  856

What makes this particular device different to all of the others?

-- 
Lee Jones [李琼斯]

