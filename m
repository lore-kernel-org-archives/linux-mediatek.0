Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D9CC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 20:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rCUmyA4fbdkowhFodFPcCwEQbnz5Oq2pfEcTnsMp0I=; b=qOA6keVLDKo+0Oan/kmgw7CfZJ
	x05jInFeNKphePnT6I2HWWw0FdxqA62oz61slc7QiVuH/TwsBkxtK9Rp8DzenH7IAbHBoBdjyX7Xh
	4Ideo5OzsrfrfiDn3n2G1rimu68jfVwyxQGE7QwxZvNhQX57P8bm2j1FBrRqMOYSukEI1EcUnHyW9
	qbHtZI4xUlinwb8Ga+VdrZye867xaVlL1zTREJ1g5Mav7QMJhImpCpU2/o6q4mWeWQtFGA54Cn2s+
	Pknj6Fq3fAxc7oGjbZ46/Ko3PkpEqZzeyb28wxn0lK4cWl1LqfapipA1u74SOBvRVV/QXNGLSH0s2
	KyjVqebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYt4p-0000000GNlf-0aUG;
	Tue, 30 Jul 2024 20:04:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYt4M-0000000GNfL-1fEm;
	Tue, 30 Jul 2024 20:03:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8251962060;
	Tue, 30 Jul 2024 20:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07519C4AF0B;
	Tue, 30 Jul 2024 20:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722369817;
	bh=ioCjriq9osqMbAs8+EODo48zUlg3xS+R9XDTxWKShkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BuxualcNOych3A4yWU5cC100YYKH0ZeP2O6ecJ6E7SdoTqmSAR4goUieQ4axHS4Sm
	 25X41wCdbhg4c0vRdGG4MzgTwqQqXL/IA3FLE8DIFHXqoyUGu1cpgJMjIgJ8zMhmTV
	 XBykMsqVmjGMn+evEkltJbJkdCHBPnRO31XXRRlftLgVQ132Y/3XCqZ44Mah2L5ePX
	 AF7v/SRgM2uRQz1shDNW3BIazLQ28VJJvZSiCBpYI+ifgGdNFZrzI+d5pHw4OH6Iq4
	 /0+mNUxDsvMP9Fehd426LT/8NV8zshFdNu1LhT16CaNG2y1CSfyWdW2A6qa0s6/hqS
	 cl8ZWVHu7tWUw==
Date: Tue, 30 Jul 2024 14:03:35 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
	daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
	andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: dsa: mediatek,mt7530: Add
 airoha,en7581-switch
Message-ID: <20240730200335.GA2059838-robh@kernel.org>
References: <cover.1722325265.git.lorenzo@kernel.org>
 <63f5d56a0d8c81d70f720c9ad2ca3861c7ce85e8.1722325265.git.lorenzo@kernel.org>
 <3d0e39a3-02e9-42b4-ad49-7c1778bfa874@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d0e39a3-02e9-42b4-ad49-7c1778bfa874@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_130338_520984_0F9106BB 
X-CRM114-Status: GOOD (  15.57  )
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

On Tue, Jul 30, 2024 at 11:57:36AM +0300, Arınç ÜNAL wrote:
> On 30/07/2024 10:46, Lorenzo Bianconi wrote:
> > Add documentation for the built-in switch which can be found in the
> > Airoha EN7581 SoC.
> > 
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml     | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > index 7e405ad96eb2..aa89bc89eb45 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > @@ -92,6 +92,10 @@ properties:
> >             Built-in switch of the MT7988 SoC
> >           const: mediatek,mt7988-switch
> > +      - description:
> > +          Built-in switch of the Airoha EN7581 SoC
> > +        const: airoha,en7581-switch
> > +
> >     reg:
> >       maxItems: 1
> > @@ -284,7 +288,10 @@ allOf:
> >     - if:
> >         properties:
> >           compatible:
> > -          const: mediatek,mt7988-switch
> > +          contains:
> > +            enum:
> > +              - mediatek,mt7988-switch
> > +              - airoha,en7581-switch
> 
> The compatible string won't be more than one item. So this would be a
> better description:
> 
> compatible:
>   oneOf:
>     - const: mediatek,mt7988-switch
>     - const: airoha,en7581-switch

enum, not oneOf+const

