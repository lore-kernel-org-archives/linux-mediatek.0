Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5448BCE79A8
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 20:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbupnqNePPSApusEEeMOwHawfGbZVx+B7J1El+BwtS0=; b=0fDd69L0LRllVMXk4GxN6vef7p
	uSwcumkCYFX3D39uHk/rwly3kVN9SySV7bIr/E/BCtGg8ivAkgCAQZsENVpBen8dBy6WGZcSLV2u0
	mwZQQTLyi8LMN5/fz+c39t6j/djDX+O0L6fBPyywvbLG1EE2l5gk2YCqj2JuEI2g6eU/PBJ/6kBED
	VyT1WXQABqJEc/nnkB0BO25yw4eOsxil6cKwxvCULPjXHn9lTSrZyMIpDfr9fgBeHcZdH3aKlw0O7
	+h5mqQOU8a7/KTfubLc1w4zy+XStOVcZeKQP/fL72IaprK7O//GeogqCe5lWlvdz0QUN1JhKBzAZo
	bDmSQmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qihgq-001FnN-2K;
	Tue, 19 Sep 2023 20:51:24 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qihgm-001FlX-2g;
	Tue, 19 Sep 2023 20:51:23 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qihgL-00082Y-13;
	Tue, 19 Sep 2023 20:50:53 +0000
Date: Tue, 19 Sep 2023 21:50:44 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: mediatek,net: add
 phandles for SerDes on MT7988
Message-ID: <ZQoJpGLhNZ0M2JhI@makrotopia.org>
References: <cover.1695058909.git.daniel@makrotopia.org>
 <35c12a115893d324db16ec6983afb5f1951fd4c9.1695058909.git.daniel@makrotopia.org>
 <20230919180909.GA4151534-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919180909.GA4151534-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_135120_868505_E99B7E39 
X-CRM114-Status: GOOD (  30.64  )
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

Hi Rob,

thank you for the review!

On Tue, Sep 19, 2023 at 01:09:09PM -0500, Rob Herring wrote:
> On Mon, Sep 18, 2023 at 11:26:34PM +0100, Daniel Golle wrote:
> > Add several phandles needed for Ethernet SerDes interfaces on the
> > MediaTek MT7988 SoC.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  .../devicetree/bindings/net/mediatek,net.yaml | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> > index e74502a0afe86..78219158b96af 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> > @@ -385,6 +385,34 @@ allOf:
> >            minItems: 2
> >            maxItems: 2
> >  
> > +        mediatek,toprgu:
> > +          $ref: /schemas/types.yaml#/definitions/phandle
> > +          description:
> > +            Phandle to the syscon representing the reset controller.
> 
> Use the reset binding

I got an alternative implementation ready which implements an actual
reset controller (by extending drivers/watchdog/mtk_wdt.c to cover
also MT7988 and its addition sw-reset-enable bits) and uses single
phandles for each reset bit assigned to the corresponding units
instead of listing them all for the ethernet controller (maybe that's
one step too far though...)

However, as mentioned in the cover letter, using the Linux reset
controller API (which having to use is a consequence of having to use
the reset bindings) doesn't allow to simultanously deassert the
resets of pextp, usxgmii pcs and/or sgmii pcs which is how the vendor
implementation is doing it as all reset bits are on the same 32-bit
register and the Ethernet driver is the only driver needing to access
that register.

Asserting the resets in sequence and subsequently deasserting in
sequence works for me, but it will have to be confirmed to not create
any problems because it's clearly a deviation from the behavior of the
reference implementation.


> 
> > +
> > +        mediatek,usxgmiisys:
> > +          $ref: /schemas/types.yaml#/definitions/phandle-array
> > +          minItems: 2
> > +          maxItems: 2
> > +          items:
> > +            maxItems: 1
> > +          description:
> > +            A list of phandle to the syscon node referencing the USXGMII PCS.
> 
> Use the PCS binding

Ack, I will ie. implement standalone PCS driver similar to eg.
pcs-rzn1-miic.c.

> 
> > +
> > +        mediatek,xfi-pextp:
> > +          $ref: /schemas/types.yaml#/definitions/phandle-array
> > +          minItems: 2
> > +          maxItems: 2
> > +          items:
> > +            maxItems: 1
> > +          description:
> > +            A list of phandle to the syscon node that handles the 10GE SerDes PHY.
> 
> Use the phy binding (phys, not phy-handle for ethernet PHY).

Ack, this can be implemented as a standalone PHY driver using PHY
bindings. I will do that instead.

> 
> > +
> > +        mediatek,xfi-pll:
> > +          $ref: /schemas/types.yaml#/definitions/phandle
> > +          description:
> > +            Phandle to the syscon node handling the 10GE SerDes clock setup.
> 
> Use the clock binding

Does that imply that I should implement a clock driver whith only a
single clock offering only a single operation ('enable') which would
then do the magic register writes?

While one part is actually identifyable as taking care of enabling a
clock, I would not know how to meaningfully abstract the other (first)
part, see vendor driver:

/* Register to control USXGMII XFI PLL digital */
#define XFI_PLL_DIG_GLB8        0x08
#define RG_XFI_PLL_EN           BIT(31)

/* Register to control USXGMII XFI PLL analog */
#define XFI_PLL_ANA_GLB8        0x108
#define RG_XFI_PLL_ANA_SWWA     0x02283248

[...]

/* Add software workaround for USXGMII PLL TCL issue */
regmap_write(ss->pll, XFI_PLL_ANA_GLB8, RG_XFI_PLL_ANA_SWWA);
// How would you represent the line above using the abstractions of the
// common clk framework?

regmap_read(ss->pll, XFI_PLL_DIG_GLB8, &val); //    that looks like it
val |= RG_XFI_PLL_EN;                         // <- could be a abstracted
regmap_write(ss->pll, XFI_PLL_DIG_GLB8, val); //    in a meaningful way in
                                                    clock driver.

... which is all we ever do on that regmap. Ever.


Thanks in advance to everybody sharing their ideas and advises.

