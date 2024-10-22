Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3C1CDD0EA
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 21:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BERaqXyz/f8EvN837PhBrPhXpxOUjtB6jF4AGRunssI=; b=u446BUrdcBHMAf+OL8X/RfmVt6
	GIzgm92RNFyjcQnZIeSs3+Ibmy2/3TLHsK+LLrcyTNJU20sBYq2tVLqUuyiHqNyHQNRLFj8IyxRP/
	ClcrWvbkUMFoijPukfmQ2DHsS+6Eszo3YwscHS5A+oK8w3hg/BR3/k2W3ixw37875VwrS4KgKIj1L
	xoPNPsBqb62KIn+2K8X7AJe7biR384GfOoFQHCWjmjojuoa+USoWrMcnv7wzfMtOdCzVbSsZJKec0
	657/kwlECipeSRlEDzBqSxDvtP9EUOnHqKstjxiu8P6whJRJlrZqpxx0lLIdPepvJRuioBDhXwmsg
	F9T6yebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3MHc-0000000CCPJ-0AXA;
	Tue, 22 Oct 2024 21:19:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3MG4-0000000CCEN-1ZX0;
	Tue, 22 Oct 2024 21:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72142A4455E;
	Tue, 22 Oct 2024 21:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20785C4CEC3;
	Tue, 22 Oct 2024 21:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729631859;
	bh=YnGn/Bpg5SZBaBj2fGX+/WIoDB1fneYz8lbEhpsEVHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGjRGhq6EQ2s5Yi32SnJjGsK7dTuEaxCNvtJ34zEjvDxgMDwcoajD+0AcEC/6EgAC
	 LU0j69Ch+cW56yzsRssvKPVX3sesQKUO5B1WsMIGuy1iCDPgLU0Yk4BVv1l77pes2P
	 5l9vOdCfrS7P0TqHYhe1Ca/WIi8yaN0ZlyaUtu7OTDqj/S9F9KvPkpwhClTQ8Rz4Ce
	 FymcQJWno77MmQRbJjhYIyt4HaafJPfLU/S/fxAFzKbGPKEW1n5C/+oSW6xk0UfwnP
	 sJeVwgCNAsCbH8ZsYB/+MYq9garb5VxntrIwFAxw1VCYN9R1SC9CTcGj0wleqLufLn
	 eywjPhYizq/nw==
Date: Tue, 22 Oct 2024 16:17:38 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
Message-ID: <20241022211738.GB1565063-robh@kernel.org>
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
 <20241021190053.GA948525-robh@kernel.org>
 <6717cd70.df0a0220.850c6.7b5d@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6717cd70.df0a0220.850c6.7b5d@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_141740_569938_6F8A54AE 
X-CRM114-Status: GOOD (  35.09  )
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

On Tue, Oct 22, 2024 at 06:06:06PM +0200, Christian Marangi wrote:
> On Mon, Oct 21, 2024 at 02:00:53PM -0500, Rob Herring wrote:
> > On Fri, Oct 18, 2024 at 03:19:04PM +0200, Lorenzo Bianconi wrote:
> > > Introduce device-tree binding documentation for Airoha EN7581 pwm
> > > controller.
> > > 
> > > Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  .../devicetree/bindings/pwm/airoha,en7581-pwm.yaml | 61 ++++++++++++++++++++++
> > >  1 file changed, 61 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..fb68c10b037b840a571a2ceee57f13cbae78da66
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
> > > @@ -0,0 +1,61 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pwm/airoha,en7581-pwm.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Airoha EN7581 PWM Controller
> > > +
> > > +maintainers:
> > > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > > +
> > > +allOf:
> > > +  - $ref: pwm.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: airoha,en7581-pwm
> > > +
> > > +  "#pwm-cells":
> > > +    const: 3
> > > +
> > > +  airoha,74hc595-mode:
> > > +    description: Set the PWM to handle attached shift register chip 74HC595.
> > > +
> > > +      With this disabled, PWM assume a 74HC164 chip attached.
> > > +
> > > +      The main difference between the 2 chip is the presence of a latch pin
> > > +      that needs to triggered to apply the configuration and PWM needs to
> > > +      account for that.
> > > +    type: boolean
> > > +
> > > +  airoha,sipo-clock-divisor:
> > > +    description: Declare Shift Register chip clock divisor (clock source is
> > > +      from SoC APB Clock)
> > 
> > Where is the clock source defined?
> > 
> > You can specify the PWM frequency in PWM cells and should be able to get 
> > the APB Clock frequency. Then you can calculate the divider.
> >
> 
> Hi Rob,
> 
> this property is related to the Shift Register chip and is not related
> to the clock of the PWM.
> 
> It's really to configure the clock that will be feed to Shift Register
> chip if for whatever reason one OEM mount a different kind (but still
> register compatible) and requires to run at higher clock rate.
> 
> We can consider hardcoding it if really needed but considering the case
> with 2 different kind of shift register supported, I assume configuring
> this might be needed on some corner case Devices.
> 
> For the clock we are not 100% but we might have an idea of what is the
> source, but still it will be just referenced and enabled in the driver
> (it's always enabled).
> 
> Hope I can get some hint by you on how to proceed.
> 
> Is it ok with:
> 
> - Defining the attached clock
> - Keep the property
> 
> ?

So how is the PWM involved? I'm going to need a picture.

If this external shift register chip can be attached to any PWM and 
clock providers, then perhaps it needs to be its own node with a 'pwms' 
property and clock source.

I would suggest you go back to the version without these properties 
and that I already reviewed, then discuss adding them separately.

Rob

