Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75ECC531DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Aug 2024 21:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKeP2yA49BgFrH6Vnp4a8g09dJac9cDvswQkanBMPIY=; b=1Sk92EkOnMLeDTLMQ4ooLLW9qo
	JWGVxnihtnrgA7Ww2c+1mZ2Ezh7bTgJUHBw7R8Z9WaMQIiKU05WpP5xTlwkc+jiQUkkI4M3jeOycS
	77J+meXU1W4wKu41Zu1ha31VicNTELB6aKZ6LApR+sT2rouJRtCtOAf6FlSYYxdiLRbnm0C11wpGP
	Rd1TXrY6Z358Xg5sCBXnRmR//zbSstk3S+Sf/0SUZfRqmK+2YZE8oTYjIZ/oWTvNfFVkMrEXEJiO/
	hJvapmTZUv4z4V5LGK0NE3q67Mms9Mrkr1S4WQzPZi/ZCWgawR2UAVneEgwV8mZEOlJ9KrrkptpZ4
	EcvD164Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfR91-0000000Flyg-3ke9;
	Sat, 17 Aug 2024 21:39:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfR8y-0000000FlyB-3pwU;
	Sat, 17 Aug 2024 21:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=LKeP2yA49BgFrH6Vnp4a8g09dJac9cDvswQkanBMPIY=; b=jp
	43IEaLfN4cvmNWDt1v8OYqrOs8qLE04L5Fyv++RwlpCyyftXnGl00uVis14K23utTI7vW50dMZV99
	n9w5lYg6q2ynLjLwn80jl/dcqGvKWinKvJLp0pvOjWpA41UV8LOyGSDYdg7xnuayIi6ozmzYRIrRK
	B0UNSTjD9CSS6kY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sfR8q-0050ys-Jh; Sat, 17 Aug 2024 23:39:20 +0200
Date: Sat, 17 Aug 2024 23:39:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_143928_981269_86573992 
X-CRM114-Status: GOOD (  20.06  )
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

On Sat, Aug 17, 2024 at 10:46:10PM +0200, Benjamin Larsson wrote:
> On 17/08/2024 00:52, Rob Herring wrote:
> > > Hi, this is by design because of the register placement in the gpio block
> > > and the fact that the pwm functionality is intermixed in there also. As
> > > example the following registers are all GPIOCTRL:
> > > 
> > > <0x0 0x1fbf0200 0x0 0x4>,
> > > <0x0 0x1fbf0220 0x0 0x4>,
> > > <0x0 0x1fbf0260 0x0 0x4>,
> > > <0x0 0x1fbf0264 0x0 0x4>,
> > > 
> > > To simplify the driver code logic the complexity is moved to the dts because
> > > of that.
> > DT to OS is an ABI. Don't put the complexity there. The driver is easy
> > to change.
> > 
> > Lot's of h/w blocks are just bit soup. This is not special. If a few
> > regions is helpful, then that would be fine.
> > 
> > Rob
> 
> Hi, the pwm functionality is to blame.
> 
> The following is the logic that populates the direction registers
> (GPIOCTRL).
> 
>     for (i = 0; i < ARRAY_SIZE(pinctrl->gpiochip.dir); i++) {
>         ptr = devm_platform_ioremap_resource(pdev, index++);
>         if (IS_ERR(ptr))
>             return dev_err_probe(dev, PTR_ERR(ptr),
>                          "failed to map gpio dir regs\n");
> 
>         pinctrl->gpiochip.dir[i] = ptr;
>     }
> 
> 
> As example in between 0x1fbf0200, 0x1fbf0220 and 0x1fbf0260 we have pwm
> related registers.
> 
> The gpio block could if I count it correctly be split into 8+ regions. The
> dts list contain 18 rows related to the gpio block. So the savings would be
> ca 10 rows but a register mapping list in the driver would be needed
> instead.

How messy are the GPIO and PWM registers? Are there N blocks of
independent GPIO registers? and M blocks of independent PWM registers?
By that, does one block of GPIO registers contain all you need for one
GPIO controller? One block of PWM registers give you all you need for
one PWM controller? Or are the registers for one GPIO controller
scattered all over the place?

Could you point at a public datasheet?

      Andrew


