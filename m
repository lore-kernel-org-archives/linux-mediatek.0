Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02589CF8542
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 21:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sq7R6CXq5XKk2P2Oh8nd0rw0SLCIGJuhV/FbH40tYv8=; b=4O4nMNyNmu7p3IW6AL1fLGnXZt
	1DYojBXISGmQvA88OtVytdDD3OhIDoh2iyBAWP5Cgcx4HDy6ncm7x0lJRc5eh74DeWhEOSAxpghgt
	WeK49JEY7khIvSRrr6uWDr/T1Vj79vqoqNi5OrWp682g5MF2FtcTtNXACct/RvQah8TAjhesevFgF
	WS6lrVKzKG5eXUchSrdG+/vgL4LYeu5SeJ+7SfLO+GlBr0j5JBe8DHUquvRmFMsJCEMuMans1Yw34
	tjKJB5g+kai5T78/8Urnecv7USOq5Fs41IB9fIehHhJx2iP4zIK+MXDEPa/esYaeEhjEdBfr8SSBS
	5jkMnizQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw6eQ-00000007Tlg-0AM9;
	Wed, 02 Oct 2024 21:12:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw6dA-00000007Tbc-2f7X;
	Wed, 02 Oct 2024 21:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 681945C075A;
	Wed,  2 Oct 2024 21:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E375C4CEC2;
	Wed,  2 Oct 2024 21:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727903491;
	bh=9IhvjBCGhybrdL+0lMh6vB5lwKL1Q0u0iBdV/bSLfXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NzDVLEy4xyfdfWBIKV/04deLmhQH7hFjnc0QcuZb+uGrZgaGvXLQbUG1QyWv9HRBT
	 i8Ou6R+DsIjO5LLY7QVERCnU9H0bX3rPTfX0MkSoeuADRrVh9yLl2jNHwX41oxypjK
	 fEPns5S1E5y9Q+BA3TdvSmu81V9dfh55MPNd+tg7DuB0XrkbHTEKINryAMe8ZhLcnq
	 w2GxgwptJW3lEj4vwwdwzHxgfC83TWpL2Gdo/mYmPyhl3PlG+rfaIyM1s/OQr0xCNv
	 Hc5r+Fvcmh9l5+kKISesh29htAXYBeaVA9yDhrIfr2x9/5cEQmfSEClMCy/OD7Mlkw
	 0d9OK2g3aRkvw==
Date: Wed, 2 Oct 2024 16:11:30 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: nvmem: mediatek: efuse: Reuse
 mt8186-efuse in mt8188
Message-ID: <20241002211130.GA1316112-robh@kernel.org>
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
 <20241002022138.29241-4-pablo.sun@mediatek.com>
 <mh7upw2y2dclyosved3chw7chpqgdg4a3j5ftwftfhm6v5uqpt@cotoeuopfbqg>
 <559fc2a5-631c-440a-812f-2907f84b16b4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <559fc2a5-631c-440a-812f-2907f84b16b4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_141132_739595_396B2C34 
X-CRM114-Status: GOOD (  23.43  )
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

On Wed, Oct 02, 2024 at 09:42:32AM +0200, AngeloGioacchino Del Regno wrote:
> Il 02/10/24 08:11, Krzysztof Kozlowski ha scritto:
> > On Wed, Oct 02, 2024 at 10:21:35AM +0800, Pablo Sun wrote:
> > > mt8188 has the same GPU speed binning efuse field just
> > > like mt8186, which requires post-processing to convert to the
> > > bit field format specified by OPP table.

What about all the other efuses? The fallback needs to be a subset of 
the 1st compatible.

> > > 
> > > Add the binding for the compatible list:
> > >    "mediatek,mt8188-efuse", "mediatek,mt8186-efuse"
> > > so mt8188 uses the same conversion.
> > > 
> > > Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> > > ---
> > >   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > > index 32b8c1eb4e80..70815a3329bf 100644
> > > --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > > +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > > @@ -39,6 +39,10 @@ properties:
> > >                 - mediatek,mt8195-efuse
> > >                 - mediatek,mt8516-efuse
> > >             - const: mediatek,efuse
> > > +      - items:
> > > +          - enum:
> > > +              - mediatek,mt8188-efuse
> > > +          - const: mediatek,mt8186-efuse
> > 
> > And this is not compatible with generic one? This is confusing. Why are
> > you adding generic fallbacks if they are not valid?
> > 
> 
> It was my suggestion to start dropping the usage of the generic "mediatek,efuse"
> fallback, as I've seen multiple times feedback saying to not use generic fallbacks.
> 
> Was that wrong?

No, but any fallback seems seems a bit odd here. It's one of those 
things that's going to change with every chip.

Rob

