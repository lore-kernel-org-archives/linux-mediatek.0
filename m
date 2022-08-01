Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0743BC00140
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 02:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8wQpVzk03GeZVPL5JA0UvSC9V6Kw7fpPdc400EDaZs=; b=lJHS6NlD6SxNsj8Dj7w4fJmfPD
	mDrtpNuxwFRsHBUW3wy+KACAj3v3au1JD2rxp7ooihZN6vNXn6clms5vF+1z/0j3dkBcfPNhmHuMM
	culZFAOxv/jWlTX76c9sV1uW66Zn0P+KdAYh7N+O5IiJoWC006DxWVrR5J0zRpuwGwTx0o7qfk0n/
	/NssrUenz3hez/3qIDj9ubVUOjAExo2ZFEWN1ObAd4jnUTSBYrJK9KzVd557yKDw5M7gM6PYT+1Wk
	q7lx++5MsQL9GUthsTAI2wPLAtnJxFSfrhhmf4GKYQVtSkAy5fFHgssgIIlMdK+CuCoISi8tV9SIO
	W7NfG6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIKt5-000ap4-JN; Mon, 01 Aug 2022 02:10:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIKst-000afG-96; Mon, 01 Aug 2022 02:10:20 +0000
X-UUID: db62b15ce5d04240a14d63941e28ed72-20220731
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:8ab626a7-c7c3-425d-ae2d-8e0f072ec379,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:561ce6cf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: db62b15ce5d04240a14d63941e28ed72-20220731
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 683380403; Sun, 31 Jul 2022 19:10:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 1 Aug 2022 09:39:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 1 Aug 2022 09:39:22 +0800
Message-ID: <989faa34506ab4db8b8ce6eae5457ad07b1a2dee.camel@mediatek.com>
Subject: Re: [PATCH v2] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8188 and MT8195
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Ryder Lee" <ryder.lee@mediatek.com>, <Rex-BC.Chen@mediatek.com>,
	<TingHan.Shen@mediatek.com>, <Liju-clr.Chen@mediatek.com>,
	<Jian.Yang@mediatek.com>
Date: Mon, 1 Aug 2022 09:39:22 +0800
In-Reply-To: <20220729225320.GA82746-robh@kernel.org>
References: <20220729033331.3075-1-jianjun.wang@mediatek.com>
	 <20220729225320.GA82746-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_191019_357383_51824622 
X-CRM114-Status: GOOD (  21.01  )
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

Thanks for your comment.

On Fri, 2022-07-29 at 16:53 -0600, Rob Herring wrote:
> On Fri, Jul 29, 2022 at 11:33:31AM +0800, Jianjun Wang wrote:
> > MT8188 and MT8195 are ARM platform SoCs with the same PCIe IP as
> > MT8192.
> > 
> > Also add new clock name "peri_mem" since the MT8188 and MT8195 use
> > clock
> > "peri_mem" instead of "top_133m".
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > ---
> > Changes in v2:
> > Merge two patches into one.
> > ---
> >  .../bindings/pci/mediatek-pcie-gen3.yaml      | 51
> > +++++++++++++++----
> >  1 file changed, 40 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-
> > gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-
> > gen3.yaml
> > index 0499b94627ae..038e25ae0be7 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -43,12 +43,16 @@ description: |+
> >    each set has its own address for MSI message, and supports 32
> > MSI vectors
> >    to generate interrupt.
> >  
> > -allOf:
> > -  - $ref: /schemas/pci/pci-bus.yaml#
> > -
> >  properties:
> >    compatible:
> > -    const: mediatek,mt8192-pcie
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8188-pcie
> > +              - mediatek,mt8195-pcie
> > +          - const: mediatek,mt8192-pcie
> > +      - items:
> > +          - const: mediatek,mt8192-pcie
> >  
> >    reg:
> >      maxItems: 1
> > @@ -78,13 +82,7 @@ properties:
> >      maxItems: 6
> >  
> >    clock-names:
> > -    items:
> > -      - const: pl_250m
> > -      - const: tl_26m
> > -      - const: tl_96m
> > -      - const: tl_32k
> > -      - const: peri_26m
> > -      - const: top_133m
> > +    maxItems: 6
> >  
> >    assigned-clocks:
> >      maxItems: 1
> > @@ -126,9 +124,40 @@ required:
> >    - interrupts
> >    - ranges
> >    - clocks
> > +  - clock-names
> >    - '#interrupt-cells'
> >    - interrupt-controller
> >  
> > +allOf:
> > +  - $ref: /schemas/pci/pci-bus.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8188-pcie
> > +              - mediatek,mt8195-pcie
> > +    then:
> > +      properties:
> > +        clock-names:
> > +          items:
> > +            - const: pl_250m
> > +            - const: tl_26m
> > +            - const: tl_96m
> > +            - const: tl_32k
> > +            - const: peri_26m
> > +            - const: peri_mem
> > +    else:
> > +      properties:
> > +        clock-names:
> > +          items:
> > +            - const: pl_250m
> > +            - const: tl_26m
> > +            - const: tl_96m
> > +            - const: tl_32k
> > +            - const: peri_26m
> > +            - const: top_133m
> 
> I'm not sure it's worth enforcing just the last clock name. Just do:
> 
> enum: [ peri_mem, top_133m ]
> 
> And key in the top level.
OK, I'll use "enum" to add the new clock name in the next version.

Thanks.
> 
> Rob


