Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1727C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 02:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43fToWysoaJ8MzuLW9ao2zhTK7fLbvnUnmd7ql7gHAM=; b=l+GR3RF2M3U4X4
	CKsSqST8POQTC0IMZ8ZEOe6crQ/HkW1BVJ2mrnFWuU6elYSSuBXFA95b8/g8Rcjy2XXpSkHfzPBtc
	jAmJBYno1Rb+RCC8+GTrP2rEfUBh6BqtgMIYnC9pR1/rcYf7Ho5AwkyU++HpW0fhaiDnGNGN/iUmT
	OzpmjuB556J1HncNRDSMgtvZPws2xi7AnG0768osjAwo82Sii4vsS2RXvTSxDQOZ2V38HwCDWXpxo
	hikNP+0JfGPW6+32Pk09Z8dfB4A8CtQfarbuQ4GzyUqCLx3FHgCBB3lgB4RWDrkepPfBfD1i8GkYV
	eddSatrYg8yhQzHRHYZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxgkj-003Ki3-8K; Thu, 16 Dec 2021 02:44:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxgkf-003KhH-VP; Thu, 16 Dec 2021 02:44:15 +0000
X-UUID: 0979dacb18ad4ad4bd2b3fc738787400-20211215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Llo3GNG3LefL9fq8uRh9hI0WF+b/t4xEI+BOfK4DeHc=; 
 b=HMgEGaV9Han0/KxGAR7ODIaZNrIu14oy5fs0Fui+RN0059hw6ekKTN5X+UxCAkTodbosAJZb6lPyTzOA5tpdhCBOUKdXAqi9DNyk4KjkE/Z6883SxcuQdLm5bRT6sN7C6036BJzlgMbVxSvBqaHH6rxT+EKWmwmics4D31ok7CU=;
X-UUID: 0979dacb18ad4ad4bd2b3fc738787400-20211215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 128234456; Wed, 15 Dec 2021 19:44:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Dec 2021 18:34:05 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Dec 2021 10:34:04 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Dec 2021 10:34:03 +0800
Message-ID: <151fc4556ba03703dffa30aeb8f24aee489c855c.camel@mediatek.com>
Subject: Re: [PATCH net-next v9 6/6] net: dt-bindings: dwmac: add support
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
Date: Thu, 16 Dec 2021 10:34:04 +0800
In-Reply-To: <YbpobIscSDPKuxxY@robh.at.kernel.org>
References: <20211215021652.7270-1-biao.huang@mediatek.com>
 <20211215021652.7270-7-biao.huang@mediatek.com>
 <YbpobIscSDPKuxxY@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_184414_048553_F8E56325 
X-CRM114-Status: GOOD (  24.85  )
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
On Wed, 2021-12-15 at 16:13 -0600, Rob Herring wrote:
> On Wed, Dec 15, 2021 at 10:16:52AM +0800, Biao Huang wrote:
> > Add binding document for the ethernet on mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.yaml          | 42 ++++++++++++++-
> > ----
> >  1 file changed, 32 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > index 8ad6e19661b8..44d55146def4 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > @@ -19,6 +19,7 @@ select:
> >        contains:
> >          enum:
> >            - mediatek,mt2712-gmac
> > +          - mediatek,mt8195-gmac
> >    required:
> >      - compatible
> >  
> > @@ -27,26 +28,37 @@ allOf:
> >  
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - mediatek,mt2712-gmac
> > -      - const: snps,dwmac-4.20a
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2712-gmac
> > +          - const: snps,dwmac-4.20a
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8195-gmac
> > +          - const: snps,dwmac-5.10a
> >  
> >    clocks:
> > +    minItems: 5
> 
> As before, you need 'minItems: 4' in the previous patch.
> 
> If you aren't clear what's needed, run 'make dtbs_checks' yourself 
> before submitting again.

But as modified in "[PATCH net-next v9 3/6] arm64: dts: mt2712: update
ethernet device node", we expect "minItems: 5".

run 'make dtbs_checks' with "[PATCH net-next v9 3/6] arm64: dts:
mt2712: update ethernet device node" applied, will not report logs such
as "ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main',
'ptp_ref'] is too short".

Should it be fine if I keep "minItems:5"?
> 
> >      items:
> >        - description: AXI clock
> >        - description: APB clock
> >        - description: MAC Main clock
> >        - description: PTP clock
> >        - description: RMII reference clock provided by MAC
> > +      - description: MAC clock gate
> >  
> >    clock-names:
> > -    items:
> > -      - const: axi
> > -      - const: apb
> > -      - const: mac_main
> > -      - const: ptp_ref
> > -      - const: rmii_internal
> > +    minItems: 5
> > +    maxItems: 6
> > +    contains:
> 
> No, you just threw out the order requirements. And this schema will
> be 
> true with just 1 of the strings below plus any other strings. For 
> example, this will pass:
> 
> clock-names = "foo", "bar", "axi", "baz", "rob";
I misunderstood this schema, 
and how about the following description:

clock-names:
  minItems: 5
  maxItems: 6
  items:
    - const: axi
    - const: apb
    - const: mac_main
    - const: ptp_ref
    - const: rmii_internal
    - const: mac_cg

Regards!
> 
> > +      enum:
> > +        - axi
> > +        - apb
> > +        - mac_main
> > +        - ptp_ref
> > +        - rmii_internal
> > +        - mac_cg
> >  
> >    mediatek,pericfg:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> > @@ -61,6 +73,8 @@ properties:
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
> > @@ -69,6 +83,8 @@ properties:
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
> > @@ -102,6 +118,12 @@ properties:
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
