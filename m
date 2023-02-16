Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F833C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIpPv3ORBmQ+I23STxtwszciSU7MS9xgwCRMjkg6bnk=; b=u5YBbmRpcwh+5xgJiFw4XD/SYa
	PRpJrWfKriuci7EgJYhJIeEFtdTx6jGAoz7A4jFbNxY0TALASFPFbz7DDNfn9GtSgs39aB9DWt0/R
	+H0KSr9KCvHwEiwx4yB04+pXf/DgionhdKS7n6lYFw0EFqtwU/JPKla+dsQF5qORt9yuQlLNR1nzu
	Ietatq/jZ0OjR29zx9a9YrXcRxD74gT6GqldQ6xhBgue48ESUTAgNz7kj0SC9j6hRVFOtstMt/mvM
	pwXZIsZ2kjr4KxFiZUTkF9lqx2Gyz3BKnb6ycCTpTYbOmrzBCOFDklPrXcuobavRjQXueW6uUH3yV
	k+wpo0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaQS-009D9x-IR; Thu, 16 Feb 2023 09:19:36 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaQP-009D7H-Ag; Thu, 16 Feb 2023 09:19:35 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pSaPz-0007OX-0D;
	Thu, 16 Feb 2023 10:19:07 +0100
Date: Thu, 16 Feb 2023 09:19:01 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mingming Su <Mingming.Su@mediatek.com>,
	linux-crypto@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: rng: Add MediaTek MT7981 TRNG
Message-ID: <Y+31BSUGVbiOSFxs@makrotopia.org>
References: <89865515728cb937b6591160ad9c30b4bcc8dd41.1676467500.git.daniel@makrotopia.org>
 <c750e786ad0f529d2ae63c8f766d3c294808ff53.1676467500.git.daniel@makrotopia.org>
 <5341d0fa-1415-b711-30f0-f0a867af0bc4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5341d0fa-1415-b711-30f0-f0a867af0bc4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_011933_405749_8AD30180 
X-CRM114-Status: GOOD (  23.05  )
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

On Thu, Feb 16, 2023 at 10:14:33AM +0100, Krzysztof Kozlowski wrote:
> On 15/02/2023 14:27, Daniel Golle wrote:
> > Add documentation to describe the MediaTek true random number generator
> > which is provided by ARM TrustedFirmware-A of the MT7981.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  .../bindings/rng/mediatek,mt7981-rng.yaml     | 39 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 40 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml b/Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml
> > new file mode 100644
> > index 000000000000..d577d60538d8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rng/mediatek,mt7981-rng.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek Random number generator (v2/SMC)
> > +
> > +maintainers:
> > +  - Daniel Golle <daniel@makrotopia.org>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^rng$"
> 
> 1. We don't enforce it in device bindings, so drop it.

Ack.

> 2. It's not even correct. You have reg.

No, there isn't any reg, as this driver does not access a MMIO mapped
resource but rather uses Secure Monitor Call interface to access the
TRNG via ARM TrustedFirmware-A.

> 
> 
> > +
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt7981-rng
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: rng
> 
> Drop clock-names and rely on index.

Will drop, reg, clocks and clock-names, that slipped in from the
document I used as template for this one. The driver uses neither of
those.

> 
> > +
> > +required:
> > +  - compatible
> 
> and reg?
> 
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    rng {
> > +      compatible = "mediatek,mt7981-rng";
> > +    };
> 
> Best regards,
> Krzysztof
> 
> 

