Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2627EC5320E
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Aug 2024 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTJVVOGTm6h1jnQtTofjdTqgZNa2JyjM9oNmggGyDAY=; b=omZ1nq11oPQHwq8tUSa4SiYyqZ
	acSHcUvyP1BqLGBJWP3pvkQY/NooeTVPxYmoZCxbneziNYsNZOruorGQVlJop2RiCXL2zT1Ay515S
	IAlkLyWyZP5xB6ykWaevlMtenNP3ALfrSunJ1BeFOnk+HaYLB5+QGMjVUpUytZy8A8Q1kQxEhYvFA
	gmcruFeSNpq2D1ZmM+ltzRawwRPXjIcvVWBaWD2rGudYXWZIIpvPiSJIHATzm7Z96NMGljou4d6V4
	bqU0IkcyDieiu9UpOrS7SERY16LLKHOhbd0MlIr67VQXC3Aw9nfPr0FlZOWQMAKY/0+mKevSw16iU
	PVJ52Wfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfiMY-0000000Gn1L-3yI0;
	Sun, 18 Aug 2024 16:02:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfiMW-0000000Gn0r-2XkQ;
	Sun, 18 Aug 2024 16:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qTJVVOGTm6h1jnQtTofjdTqgZNa2JyjM9oNmggGyDAY=; b=Ua/E+l/19X7kY0O5oAFNmpSFkf
	wEOmVRI5klbreimydDcnk2aW5mBVDTnnoJfsS26KCZYwSnx2Tz3dRg1mA7TVvYF0ibuSOXEVtFeP7
	haReWATUhwrbfE7qWhHHFVG5/iKjwY/LKchZqVUergoJvtWm2nhfJTmjTkEF36A5LCT8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sfiMO-0052ea-Ta; Sun, 18 Aug 2024 18:02:28 +0200
Date: Sun, 18 Aug 2024 18:02:28 +0200
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
Message-ID: <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
 <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
 <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_090236_670984_65F419F4 
X-CRM114-Status: GOOD (  17.87  )
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

On Sun, Aug 18, 2024 at 02:48:05PM +0200, Benjamin Larsson wrote:
> On 17/08/2024 23:39, Andrew Lunn wrote:
> > How messy are the GPIO and PWM registers? Are there N blocks of
> > independent GPIO registers? and M blocks of independent PWM registers?
> > By that, does one block of GPIO registers contain all you need for one
> > GPIO controller? One block of PWM registers give you all you need for
> > one PWM controller? Or are the registers for one GPIO controller
> > scattered all over the place?
> > 
> > Could you point at a public datasheet?
> > 
> >        Andrew
> > 
> Hi, per my understanding there is no public datasheet/register reference
> manual.
> 
> But here is the division of regions of the registers in the gpio block and
> how it is currently divided between the drivers (according to my current
> understanding).
> 
> 1FBF0200, gpio/pinctrl
> 1FBF0204, gpio/pinctrl
> 1FBF0208, gpio/pinctrl
> 1FBF020C, gpio/pinctrl
> 1FBF0210, gpio/pinctrl
> 1FBF0214, gpio/pinctrl

A typical SoC has multiple instances of a GPIO controller. Each GPIO
controller typically has 4 or 5 registers: In, Out, Direction,
Interrupt Enable, Interrupt Status. If these 4 or 5 registers are
contiguous, you could have one DT node per controller, rather than one
node for all GPIO controllers.

If the hardware designer has really messed up and fully interleaved
GPIO and PWM, it might be better to have an MFD. The MFD node has a
single reg covering the entire range. The MFD would then map the whole
range, and provide accessors to the child devices. Hard code the
knowledge of what registers are where. Given how badly the hardware is
designed, it is unlikely it will get reused in the future, so there is
no point putting lots of stuff into DT. Hard code it.

	Andrew

