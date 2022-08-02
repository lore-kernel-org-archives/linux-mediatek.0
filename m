Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E62C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82y5nhsYxMOizI7qhgmD+3Ck/ixXuIaOjxkz5tVSqmA=; b=zrS6Yz4iOE8HKGP1D+CTKzoIf3
	MZ/HkErKX6UGBv0OJLegoC1cCyTceDf4/CSqTS1QwNhzxsHXdoGsb0nSSGOXjVFkEFVVzv0NpTE6j
	RmjXX2RZXOTtJYtJD1j3vatItDRgDI3F4zi3b9VnFfDGvTNKZnHtEBnwljuzOYsQvU/ncdrzKpBM1
	zoDYzyXbZWm/exncXuDJJS33QxDq/rWw9Dhb8hD6MulMRnZOKfCjRIsCds75sRlZRwOKGpjjeEI9l
	nYLFS78t6CYzisHU+MU6ioxsy4DUX2Bjlcei48/iKGD/oq7mECrgcso3KQZS357C8+TTncCccEiy+
	DEbCibLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIobb-00Cbg7-Lf; Tue, 02 Aug 2022 09:54:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIob5-00Cb81-Tc; Tue, 02 Aug 2022 09:53:57 +0000
X-UUID: d4f09179576e498ea4c8dfe13c42aa84-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:8560e5a9-6ec2-48ba-8768-6bb4ebfe86d2,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:a0a611d0-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d4f09179576e498ea4c8dfe13c42aa84-20220802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1792703235; Tue, 02 Aug 2022 02:53:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 17:43:11 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 2 Aug 2022 17:43:10 +0800
Message-ID: <1688f1aad1f7239e5b0eb3d45a854ca6b0e61e1a.camel@mediatek.com>
Subject: Re: [PATCH v3] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8188 and MT8195
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>,
	<Rex-BC.Chen@mediatek.com>, <TingHan.Shen@mediatek.com>,
	<Liju-clr.Chen@mediatek.com>, <Jian.Yang@mediatek.com>
Date: Tue, 2 Aug 2022 17:43:10 +0800
In-Reply-To: <cd9518e3-9cb4-5165-af03-00e5300ab927@linaro.org>
References: <20220801113709.12101-1-jianjun.wang@mediatek.com>
	 <cd9518e3-9cb4-5165-af03-00e5300ab927@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_025356_085027_2E9ADA29 
X-CRM114-Status: GOOD (  23.10  )
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

Hi Krzysztof,

Thanks for your comment.

On Tue, 2022-08-02 at 10:59 +0200, Krzysztof Kozlowski wrote:
> On 01/08/2022 13:37, Jianjun Wang wrote:
> > MT8188 and MT8195 are ARM platform SoCs with the same PCIe IP as
> > MT8192.
> > 
> > Also add new clock name "peri_mem" since the MT8188 and MT8195 use
> > clock
> > "peri_mem" instead of "top_133m".
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > ---
> > Changes in v3:
> > Use enum property to add the new clock name.
> > 
> > Changes in v2:
> > Merge two patches into one.
> > ---
> >  .../bindings/pci/mediatek-pcie-gen3.yaml           | 14
> > ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-
> > gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-
> > gen3.yaml
> > index 0499b94627ae..a0ca9c7f5dfa 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -48,7 +48,14 @@ allOf:
> >  
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
> 
> You have one item, so this is just const. Or enum if  you expect it
> to
> grow soon.

It makes sense, I'll remove this "items" and just keep the const item
in the next version.

Thanks.
> 
> > +          - const: mediatek,mt8192-pcie
> >  
> >    reg:
> >      maxItems: 1
> > @@ -84,7 +91,9 @@ properties:
> >        - const: tl_96m
> >        - const: tl_32k
> >        - const: peri_26m
> > -      - const: top_133m
> > +      - enum:
> > +          - top_133m        # for MT8192
> > +          - peri_mem        # for MT8188/MT8195
> 
> This requires allOf:if:then restricting it further per variant.
> 
> 
> 
> Best regards,
> Krzysztof


