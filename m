Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A281C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 20:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY1WwrBnhO4SXwMuRC8eeRNOw32NbKPO5pvrjtHgOOE=; b=e2DBv8jy5GVGaASE/8K4tKvK2F
	yztwHgC9iMeohCfol38ynirsN4yXbkL/tJ2LYcfRy3UabqA1uIjDRGNMLerz99KzqHYccfHUHAQaj
	J0rlg0VBl0KhXzaNt2DR2An8S8tGiFiquRVt5RDjZjwV+ha9U+CCXWl8A6sWFcHfiOyThmUz/0pD3
	hMW36PgRAFMlG8fo+G0bBMib2LX13g9P552zoDVh+5LRjYIwev6OyS1UQDJZGT81TCRz1EUIfo/26
	9cBnrEDEIc/N+9bv76MTcqykzsqon5fbwfmwGBkoF2tYUbDxnF2+FVJdwdinoPawEOV3P5Q2y9/MN
	aP5J14Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUuoJ-00000000UBP-0UXf;
	Tue, 30 Jan 2024 20:34:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUuoF-00000000U9v-3yJ8;
	Tue, 30 Jan 2024 20:34:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E5E5CE1C9D;
	Tue, 30 Jan 2024 20:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEB0C433F1;
	Tue, 30 Jan 2024 20:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706646856;
	bh=/t3GFmRm5hVeR5xzoWsZKKi65PGNECWaoN8DFhDtjuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KR4vSkzhXVYDoJgMgUekpqQCkB0fnG56TeJoVnaeQrHDhNs0viEsSZp1NgkHvj6hy
	 K+/DGxoG65pCGKy7cnZIha/D50KPC8xbtVQ6sIokl/3dE28rYz2dK+aWQd37rppXqq
	 SzgWt77k7MdIHZ7h7aDp7XpwOf2bJT9oPn2IPkX5bH5XJNcfotHgGVmpofnhDmODiX
	 xaxrL3RDXJEZHTc3bLIVQQgMqUOnxrHgzh7Aq17lpk4Q+VlaUmDEFj0H2jpJDOO84G
	 a499XEVFN6mwFjKRSIepGcMTFMMZZcuJ34w89OqoWwhIDRlA3vX5ph1YreFdnVsiJp
	 wFvB0O34NMVTw==
Date: Tue, 30 Jan 2024 14:34:13 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/3] dt-bindings: arm: mediatek: convert PCIESYS to the
 json-schema
Message-ID: <20240130203413.GA2290196-robh@kernel.org>
References: <20240123082100.7334-1-zajec5@gmail.com>
 <20240123082100.7334-3-zajec5@gmail.com>
 <e17b85b1-7f1f-4b60-89b7-43f560466cc2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e17b85b1-7f1f-4b60-89b7-43f560466cc2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_123420_370161_54723213 
X-CRM114-Status: GOOD (  26.79  )
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

On Tue, Jan 23, 2024 at 12:20:29PM +0100, AngeloGioacchino Del Regno wrote:
> Il 23/01/24 09:20, Rafał Miłecki ha scritto:
> > From: Rafał Miłecki <rafal@milecki.pl>
> > 
> > This helps validating DTS files. Introduced changes:
> > 1. Documented "reg" property
> > 2. Adjusted "reg" in example
> > 
> > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> > ---
> >   .../arm/mediatek/mediatek,mt7622-pciesys.yaml | 47 +++++++++++++++++++
> >   .../arm/mediatek/mediatek,pciesys.txt         | 25 ----------
> >   2 files changed, 47 insertions(+), 25 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
> >   delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
> > new file mode 100644
> > index 000000000000..7340a2512402
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
> 
> I think that we should really move all those clock controller yaml files to their
> proper directory, which would be
> 
> Documentation/devicetree/bindings/clock/
> 
> ...because those are clock controllers anyway and the fact that they do also
> provide a reset controller doesn't really justify having them in arm/mediatek.
> 
> Besides, I would appreciate if you could also move mt8186/92/95 and eventual
> others that are there to clock/.

Yes, please move it.

> 
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pciesys.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek PCIESYS controller
> > +
> > +description:
> > +  The MediaTek PCIESYS controller provides various clocks to the system.
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt7622-pciesys
> > +          - mediatek,mt7629-pciesys
> > +      - const: syscon
> 
> I know that there's syscon all over the place and, even if I admit I didn't check,
> I am fairly sure that there's absolutely no reason to have syscon there, and that
> the syscon compatible never did anything for (most of, or all of) those clock
> controllers, at all.
> 
> I'm not sure - though - if removing syscon during the txt->yaml conversion is
> acceptable (yeah we'd be cheating a bit), but something makes me say it is, because
> the bindings couldn't validate before that one as well.

As long as you state why you are removing it in the commit msg.

> 
> Of course you'd have to remove the syscon compatible from the affected device trees
> as well as omitting it here.

You could also do 'minItems: 1' and 'deprecated' in the 2nd item.

> However, to be sure that we're doing the right thing here, I have to summon someone
> that can actually give a definitive answer to what I just said.....
> 
> Krzysztof, please? :-)

