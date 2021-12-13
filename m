Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEFDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 01:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrWSO+eKfBmZpb9ZEFpZRYEHC1jcxhqX5ZJVzBjrAh4=; b=yYGfMtNkN/VNhe
	9uRgULb9wCB6wa6rqFDKY+SDQk77dN8pQfDN6lESjcDM4UD5qEtm6crwUZEWroWeORUYlVPSzu9Bl
	8XMlh5/+oAPBauoYtXl9w8atdwnrw6tyfO6x/EdA/PNay/vck3ypx5tLTbl6G0PN8dLE5UWq8EyLL
	pqLcHTmv/LyfYx6ogkcO/gHMKxWQkDxi4EeeFve0xvleJz5STFRAvdAskjb9QBbaxd8+qD0G8SAml
	5ULMfDiAmqOvITjuuxsR/7JIdBpqRDiEScDYq/+R/1FNl55Y+iHv9S/ukt1oeK+D4Zsxs3hl2NrZE
	oAxRykwnepYzHbZPPsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwaHy-007aHl-JT; Mon, 13 Dec 2021 01:38:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwaHs-007aHG-EL; Mon, 13 Dec 2021 01:37:59 +0000
X-UUID: f99be62d67974a93b056a1e2461ac8ef-20211212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+BSlGe5nShYWaOrfcwxn1EcTMN8sIOIVC8J0cDgjA+Q=; 
 b=og15oVrA1++7iFNNaUc6yzzFJVka+gHTg6Aup5jq3z463LnSYiC7EWU7hqQWEh4NVQJ/+6lhi1rP8gBwWXEfJNmOVMj25XuzlDMA6rCLQnqPxIwd0Inkf5eV1R+ibunFl0WhSOj/evsbZjdMPQpy5zyP2rWSE4bO7lfAaalKmK4=;
X-UUID: f99be62d67974a93b056a1e2461ac8ef-20211212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1154403795; Sun, 12 Dec 2021 18:37:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Dec 2021 17:27:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 13 Dec 2021 09:27:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Dec 2021 09:27:46 +0800
Message-ID: <5cf063709dad8ff57bdfb3fa742f5f784217f353.camel@mediatek.com>
Subject: Re: [PATCH net-next v8 6/6] net: dt-bindings: dwmac: add support
 for mt8195
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Date: Mon, 13 Dec 2021 09:27:47 +0800
In-Reply-To: <YbOh4hZfc+QKA/hO@robh.at.kernel.org>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-7-biao.huang@mediatek.com>
 <YbOh4hZfc+QKA/hO@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_173756_520307_E24B8C78 
X-CRM114-Status: GOOD (  25.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Rob,
	Thanks for your comment~
On Fri, 2021-12-10 at 12:52 -0600, Rob Herring wrote:
> On Fri, Dec 10, 2021 at 09:31:29AM +0800, Biao Huang wrote:
> > Add binding document for the ethernet on mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.yaml          | 86
> > +++++++++++++++----
> >  1 file changed, 70 insertions(+), 16 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > index 9207266a6e69..fb04166404d8 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > @@ -19,11 +19,67 @@ select:
> >        contains:
> >          enum:
> >            - mediatek,mt2712-gmac
> > +          - mediatek,mt8195-gmac
> >    required:
> >      - compatible
> >  
> >  allOf:
> >    - $ref: "snps,dwmac.yaml#"
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt2712-gmac
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 5
> > +          items:
> > +            - description: AXI clock
> > +            - description: APB clock
> > +            - description: MAC Main clock
> > +            - description: PTP clock
> > +            - description: RMII reference clock provided by MAC
> > +
> > +        clock-names:
> > +          minItems: 5
> > +          items:
> > +            - const: axi
> > +            - const: apb
> > +            - const: mac_main
> > +            - const: ptp_ref
> > +            - const: rmii_internal
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8195-gmac
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 6
> > +          items:
> > +            - description: AXI clock
> > +            - description: APB clock
> > +            - description: MAC clock gate
> 
> Add new clocks on to the end of existing clocks. That will simplify
> the 
> binding as here you will just need 'minItems: 6'.
The "rmii_internal" clock is a special one we put it to the end on
purpose, and will turn it on/off in driver according to whether
phy_mode is rmii or not.

So the "mac_cg" clock, which is new for mt8195, and not used in mt2712,
can't put it to the end for simplicity.

Can we just keep it this way? or other suggestions?

[v3 reply]

http://lists.infradead.org/pipermail/linux-mediatek/2021-November/031951.html
> > +            - description: MAC Main clock
> > +            - description: PTP clock
> > +            - description: RMII reference clock provided by MAC
> > +
> > +        clock-names:
> > +          minItems: 6
> > +          items:
> > +            - const: axi
> > +            - const: apb
> > +            - const: mac_cg
> > +            - const: mac_main
> > +            - const: ptp_ref
> > +            - const: rmii_internal
> >  
> >  properties:
> >    compatible:
> > @@ -32,22 +88,10 @@ properties:
> >            - enum:
> >                - mediatek,mt2712-gmac
> >            - const: snps,dwmac-4.20a
> > -
> > -  clocks:
> > -    items:
> > -      - description: AXI clock
> > -      - description: APB clock
> > -      - description: MAC Main clock
> > -      - description: PTP clock
> > -      - description: RMII reference clock provided by MAC
> > -
> > -  clock-names:
> > -    items:
> > -      - const: axi
> > -      - const: apb
> > -      - const: mac_main
> > -      - const: ptp_ref
> > -      - const: rmii_internal
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8195-gmac
> > +          - const: snps,dwmac-5.10a
> >  
> >    mediatek,pericfg:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> > @@ -62,6 +106,8 @@ properties:
> >        or will round down. Range 0~31*170.
> >        For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> >        or will round down. Range 0~31*550.
> > +      For MT8195 RGMII/RMII/MII interface, Allowed value need to
> > be a multiple of 290,
> > +      or will round down. Range 0~31*290.
> >  
> >    mediatek,rx-delay-ps:
> >      description:
> > @@ -70,6 +116,8 @@ properties:
> >        or will round down. Range 0~31*170.
> >        For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> >        or will round down. Range 0~31*550.
> > +      For MT8195 RGMII/RMII/MII interface, Allowed value need to
> > be a multiple
> > +      of 290, or will round down. Range 0~31*290.
> >  
> >    mediatek,rmii-rxc:
> >      type: boolean
> > @@ -103,6 +151,12 @@ properties:
> >        3. the inside clock, which be sent to MAC, will be inversed
> > in RMII case when
> >           the reference clock is from MAC.
> >  
> > +  mediatek,mac-wol:
> > +    type: boolean
> > +    description:
> > +      If present, indicates that MAC supports WOL(Wake-On-LAN),
> > and MAC WOL will be enabled.
> > +      Otherwise, PHY WOL is perferred.
> > +
> >  required:
> >    - compatible
> >    - reg
> > -- 
> > 2.25.1
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
