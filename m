Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E335CC982FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43gQIrRHk9kmLjJ0gFBrQJUF2SnO5b7qTZu9u1qXA+k=; b=q4xmaYzb076bKvyM0izogk67QC
	c5Ai/yMAH87dG0Rwt69uhBi+jfN/MBKzB4PUpEpsilsKs6XMiah5bdzQAfXweTpXI0o9MsLCNOlmr
	uWinMfohRt5Bgyig1UHDa2WCTd/IVPwiewXJtLZAiHBs+6n+nLAtSzC57G0/DKNA9DEwUwC1t/uU1
	zyFhxpwAkND1ZzVWRPpTGhe0vD/flxJvw8yHnjYlP+l60tXsJLodxp1yaW5bVnw0zREFAvazAWvIZ
	1JmZ/QmBO48fvy+GDWbasvEMqSezSEFG6m6X+NYtKWXBY6A5ut0J9lroL5lQkMdwYIFXJ5F0rG3+e
	H/NXi8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lyc-00000008EQD-2GtC;
	Wed, 23 Sep 2026 12:21:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LyU-00000008ENq-3eJe;
	Wed, 23 Sep 2026 12:21:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 131C16020F;
	Wed, 23 Sep 2026 12:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7141F00893;
	Wed, 23 Sep 2026 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790166081;
	bh=43gQIrRHk9kmLjJ0gFBrQJUF2SnO5b7qTZu9u1qXA+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F2ZI8vsi5jnLLvoqpEc7p9HU73lolhQb+s3uGQ0XEvMWyCBYz59NOp5Vyf4tw3iB/
	 VTkhopSidPH7ViArqx6PVO5LRwdYNFJKajBYs/7dYwqBlcBJSV30Q9s/4gI+x8o7hE
	 kunsVoytLrYKryvKRpTR4OLcW3OkrTz13k37MvSRAAZ02ISk8EBMLWllor5zdq7/CA
	 EZYkMRBbXvqiBIPhpCm8WWvvj+3A5UlcMl6w8gouQUsswYYyHzUyxmQtJ6iFUSh5y5
	 4KB+BbdyDqpWaICAcRxcSdVLHGUGN2bmMg5P8oc1WhomNrVxlaxWfH7aojhusd9dwq
	 78wQWcX17CX8A==
Date: Wed, 23 Sep 2026 07:21:19 -0500
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] regulator: dt-bindings: Convert
 mediatek,mt6380-regulator to DT schema
Message-ID: <20260923122119.GA27237-robh@kernel.org>
References: <20260922195502.818012-1-robh@kernel.org>
 <arOtTntGW-ocXRxK@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOtTntGW-ocXRxK@sirena.co.uk>
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

On Wed, Sep 23, 2026 at 12:43:26PM +0200, Mark Brown wrote:
> On Tue, Sep 22, 2026 at 02:55:01PM -0500, Rob Herring (Arm) wrote:
> > Convert the MediaTek mediatek,mt6380-regulator binding to DT schema
> > format. It's a straight forward conversion.
> 
> > +  '^buck-(vcore1?|vrf)$':
> > +    description: BUCK regulators
> > +    $ref: regulator.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    required:
> > +      - regulator-min-microvolt
> > +      - regulator-max-microvolt
> > +      - regulator-ramp-delay
> > +
> > +  '^ldo-v([mat]|phy|ddr)$':
> > +    type: object
> > +    description: LDO regulators
> > +    $ref: regulator.yaml#
> > +    unevaluatedProperties: false
> 
> The LDO is an object but the buck is not?  I'll apply, but the above
> looks weird.

I missed dropping 'type: object' here in my review/rewrite of the LLM 
generated conversion. It is not needed because regulator.yaml has it 
(after processing, every schema doc does).

Rob

