Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2951C001DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 22:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwjBvXMGseehaRGsxuJcqLaPE2b7II480nX5jCDtc44=; b=2G9dC7xMv2BvaSPISibs7uTAS5
	Zx1ID8GXOiHW+WeoSguJc9qNePSPUpKqO1zY0sNlJcL60n4whjV7bObc8opnRjKe/AE0sddat656n
	y59zM+6r1/1z7rkwDGxZwN1YkRbm76LBpIWj004ZF7ENnNA0YUBnLwNNP2x1eq+EXppJl2naPRsGL
	IIDzKn7B7vGr8G9kqJMSzltTxIpR2oAArQH7q6FgSDT4MHEqMAR5f4zJL3eycppCDLQTDpEqUvRsO
	APiOzM7aea4zMgaLcJEZ0C4nMd+T1N8JthdLW8GbM4hB7i40amDV1xna5Y0HK19HyXlJVNuYU+aP0
	8K8KpgpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFTL-0095CR-2N;
	Wed, 19 Jul 2023 22:16:39 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFTI-0095B2-1N;
	Wed, 19 Jul 2023 22:16:37 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qMFSz-0008T6-1P;
	Wed, 19 Jul 2023 22:16:17 +0000
Date: Wed, 19 Jul 2023 23:16:09 +0100
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
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Ungerer <gerg@kernel.org>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/9] dt-bindings: net: mediatek,net: add
 mt7988-eth binding
Message-ID: <ZLhgqSaAfTwYGlxn@makrotopia.org>
References: <cover.1689714290.git.daniel@makrotopia.org>
 <584b459ebb0a74a2ce6ca661f1148f59b9014667.1689714291.git.daniel@makrotopia.org>
 <20230719221320.GA865753-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719221320.GA865753-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_151636_477998_9394F704 
X-CRM114-Status: GOOD (  25.26  )
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

On Wed, Jul 19, 2023 at 04:13:20PM -0600, Rob Herring wrote:
> On Tue, Jul 18, 2023 at 10:30:33PM +0100, Daniel Golle wrote:
> > Introduce DT bindings for the MT7988 SoC to mediatek,net.yaml.
> > The MT7988 SoC got 3 Ethernet MACs operating at a maximum of
> > 10 Gigabit/sec supported by 2 packet processor engines for
> > offloading tasks.
> > The first MAC is hard-wired to a built-in switch which exposes
> > four 1000Base-T PHYs as user ports.
> > It also comes with built-in 2500Base-T PHY which can be used
> > with the 2nd GMAC.
> > The 2nd and 3rd GMAC can be connected to external PHYs or provide
> > SFP(+) cages attached via SGMII, 1000Base-X, 2500Base-X, USXGMII,
> > 5GBase-KR or 10GBase-KR.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  .../devicetree/bindings/net/mediatek,net.yaml | 74 +++++++++++++++++--
> >  1 file changed, 69 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> > index 38aa3d97ee234..ae2062f3c1833 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> > @@ -24,6 +24,7 @@ properties:
> >        - mediatek,mt7629-eth
> >        - mediatek,mt7981-eth
> >        - mediatek,mt7986-eth
> > +      - mediatek,mt7988-eth
> >        - ralink,rt5350-eth
> >  
> >    reg:
> > @@ -61,6 +62,12 @@ properties:
> >        Phandle to the mediatek hifsys controller used to provide various clocks
> >        and reset to the system.
> >  
> > +  mediatek,infracfg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the syscon node that handles the path from GMAC to
> > +      PHY variants.
> > +
> >    mediatek,sgmiisys:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      minItems: 1
> > @@ -229,11 +236,7 @@ allOf:
> >              - const: sgmii_ck
> >              - const: eth2pll
> >  
> > -        mediatek,infracfg:
> > -          $ref: /schemas/types.yaml#/definitions/phandle
> > -          description:
> > -            Phandle to the syscon node that handles the path from GMAC to
> > -            PHY variants.
> > +        mediatek,infracfg: true
> 
> You don't need this. What you need is 'mediatek,infracfg: false' in the 
> if/then schemas for the cases it should not be present.
> 

Ack, will do in the next round. Thanks!

