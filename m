Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2CDC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 01:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2EzNcBisqyMs2zDHSBxD7CVGQY7o+fjZVdQ7H8Ilh4=; b=G4BQQGz5vyBIR9
	RFARqo6BdJigCxDTK+oknkSVi5Ns2RuTn6HaHQaoYYe4RlToZY5wCdgsnOLXs4SvLPt5R63g9yNqM
	DlmSplfwZeIHOtUio6frdMr6ZctE7NqcfIkM3kfj4O2ztvboKnQwhfBieFQln49tfTkaB9QucmVY+
	SWvoOcduwp7GsrY8RazuLJ27MfmrTy4z+Mn+nZzOIbgXmjLxn0KOaP3BdT/ZEUgruI8pD+rTSXiQP
	y0D506UkuVwmQi0ChrSPdk3BMszImw9kS6+dadUywk4bn+Tnjy8Nj6BnOsBJq8dTf+MWo7Hd77opx
	qOaazWWMIYTvg6L0LKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrVZv-00H2wc-Tw; Mon, 29 Nov 2021 01:35:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrVZr-00H2vh-Kv; Mon, 29 Nov 2021 01:35:34 +0000
X-UUID: fa221642388c4c01abbc518772c8940d-20211128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yoJLhePLzBo3wM2e/RjTt9dvCDe07O0xX3v3BLWirxQ=; 
 b=g7DLTaIr1MBqoiAi1Y9CaATeLuSu+ACuXzzLa8ZbW9w1HkEz1ts5AASQYyVlg3N7z0oHyqy2ZX7DYilB+vUx7VGiB50RDwUQG27DDKyQ0Cgs3LYD/PAthGk8mmmFqvSmToHxzmYmVbVvgO2oXk2sQvUT2rxpgM+vqmTXt5SzZMQ=;
X-UUID: fa221642388c4c01abbc518772c8940d-20211128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 51488870; Sun, 28 Nov 2021 18:35:27 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 17:35:25 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Nov 2021 09:35:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Nov 2021 09:35:22 +0800
Message-ID: <a7e33e13b24ee98c37a822105ae9d78c44f437ab.camel@mediatek.com>
Subject: Re: [PATCH v3 7/7] net-next: dt-bindings: dwmac: add support for
 mt8195
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
Date: Mon, 29 Nov 2021 09:35:22 +0800
In-Reply-To: <YaQZOS54BawtWkGO@robh.at.kernel.org>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-8-biao.huang@mediatek.com>
 <YaQZOS54BawtWkGO@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_173533_122651_E9D38872 
X-CRM114-Status: GOOD (  25.77  )
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
	Thanks for your comments~

On Sun, 2021-11-28 at 18:05 -0600, Rob Herring wrote:
> On Fri, Nov 12, 2021 at 05:39:18PM +0800, Biao Huang wrote:
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
> > index 2eb4781536f7..b27566ed01c6 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > @@ -19,12 +19,68 @@ select:
> >        contains:
> >          enum:
> >            - mediatek,mt2712-gmac
> > +          - mediatek,mt8195-gmac
> >    required:
> >      - compatible
> >  
> >  allOf:
> >    - $ref: "snps,dwmac.yaml#"
> >    - $ref: "ethernet-controller.yaml#"
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
> > +            - description: MAC Main clock
> > +            - description: PTP clock
> > +            - description: RMII reference clock provided by MAC
> 
> Put mac_cg at the end and then the difference is just 5 or 6 clocks
> and 
> you don't have to duplicate everything.
> 
There is a special clock -- rmii_internal at the end now, and we'll
enable/disable it in our driver, according to whether phy interface is
RMII, which means invoking clk_bulk_xxx() with parament:
sizeof(clock_list) or (sizeof(clock_list) - 1).

And the Ethernet related clock list may be different due to some
limitation or rule in different IC, we think current arrangement will
make it clear.(If some ICs share the same clock list, put them in the
same if condition)

Thanks~
> 
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
> > @@ -33,22 +89,10 @@ properties:
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
> > @@ -63,6 +107,8 @@ properties:
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
> > @@ -71,6 +117,8 @@ properties:
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
> > @@ -104,6 +152,12 @@ properties:
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
