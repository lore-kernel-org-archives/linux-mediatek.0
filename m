Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313B3C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 06:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5BjqNOhcPfgOajJ1AXO9wjKI4yzOKUOb7hpsGDVcOc=; b=w0HkZpInxEggQ4
	XJnTWF4Y3B0FQDrXO+m3iuNNNtjjs4cKExGcvwDETEWZrPf794QSETHDpuuz2fxhg73Lti3ROkZqi
	kWg6UF6S6eyy+DR0GuuD84mVMVvaxkRRhmZ/FcaFbpP78XATbYxnaqq1TQRu9CoqiBNXL9XEpqIAx
	AhAEjdX7R1kZ+Itp473a08jfI7ry4bScv2plRb7aKLx3ACFA4bOPz39qWNYE+Qn1gs+vbGMwwaqZN
	s8HbYaP0azQPfW94P0BPL8M/gRAqSB/K80f5ABlnGRHto787lDuFdIfYi3CQpblEZY+IeUC8Ul9Sy
	pletVaEES7MuFRmuHzqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njElO-00Ck4O-PX; Tue, 26 Apr 2022 06:33:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njElC-00Ck0q-B4; Tue, 26 Apr 2022 06:33:20 +0000
X-UUID: 0e1e3f528e1d462a91b36f72a1caf6db-20220425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c7990e6a-6738-4ff5-bd53-47f2133c099f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:e6e67ec6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 0e1e3f528e1d462a91b36f72a1caf6db-20220425
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1535564152; Mon, 25 Apr 2022 23:33:12 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 23:23:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Apr 2022 14:23:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 14:23:01 +0800
Message-ID: <9d65b713e3ffdd34dcca532c4c97fa98b124bde4.camel@mediatek.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: nvmem: mediatek: Convert mtk-efuse
 binding to YAML
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Lala Lin <lala.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Tue, 26 Apr 2022 14:23:01 +0800
In-Reply-To: <e64bdca8-7b18-b450-830c-ca07946a73fb@linaro.org>
References: <20220425084800.2021-1-allen-kh.cheng@mediatek.com>
 <20220425084800.2021-2-allen-kh.cheng@mediatek.com>
 <e64bdca8-7b18-b450-830c-ca07946a73fb@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_233318_434486_83817F01 
X-CRM114-Status: GOOD (  26.26  )
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

Hi Krzysztof,

On Mon, 2022-04-25 at 18:38 +0200, Krzysztof Kozlowski wrote:
> On 25/04/2022 10:48, Allen-KH Cheng wrote:
> > Convert MediaTek eFuse devicetree binding to YAML.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  .../devicetree/bindings/nvmem/mtk,efuse.yaml  | 70
> > +++++++++++++++++++
> 
> The vendor prefix is mediatek. Quoting my previous reply:
> 
>   Same comments as usual, so "vendor,device-name", e.g.
> "mediatek,efuse"
>   if this is going to match all possible future MediaTek chips or
>   "mediatek,mt7622-efuse"
> 
> so keep it mediatek,efuse.yaml.
> 

Yes, this can match can match current MTK chips.

I will keep the file name.

> >  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ------------
> >  2 files changed, 70 insertions(+), 43 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-
> > efuse.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
> > b/Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
> > new file mode 100644
> > index 000000000000..d056bc61dd5b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/nvmem/mtk,efuse.yaml*__;Iw!!CTRNKA9wMg0ARbw!2opCfMBuhT3qG85-CIdLu3yviYqRI08FFlpx4vGOKsJLRgOilZDcv1zCy75fOabzogXR6t7cqOrvYULjSab_7sq-qA$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2opCfMBuhT3qG85-CIdLu3yviYqRI08FFlpx4vGOKsJLRgOilZDcv1zCy75fOabzogXR6t7cqOrvYULjSaY9-kvJ9A$
> >  
> > +
> > +title: MediaTek eFuse device tree bindings
> 
> No changes here. Please read my comments from your v1, don't ignore
> them.
> 

My apologies for the mistake, I see the reply of v1 after I send v2. 

I will remove "device tree bindings".

> > +
> > +maintainers:
> > +  - Lala Lin <lala.lin@mediatek.com>
> > +  - Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > +
> > +allOf:
> > +  - $ref: "nvmem.yaml#"
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - mediatek,mt8173-efuse
> > +          - mediatek,efuse
> 
> Still no changes...
> 

I just want to confirm again.

"Generic compatibles should not be used standalone"

It seems we should remove mediatek,efuse and keep "mediatek,mt8173-
efuse"in binding. have I got that right?


> > +      - items:
> > +          - enum:
> > +              - mediatek,mt7622-efuse
> > +              - mediatek,mt7623-efuse
> > +              - mediatek,mt8183-efuse
> > +              - mediatek,mt8192-efuse
> > +              - mediatek,mt8195-efuse
> > +              - mediatek,mt8516-efuse
> > +          - const: mediatek,efuse
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^.*@[0-9a-f]+$":
> > +    type: object
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +        description:
> > +          Offset and size in bytes within the storage device.
> > +
> > +    required:
> > +      - reg
> > +
> > +    additionalProperties: false
> 
> Still no changes.
> 

Will remove this.

Thanks,
Allen

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +
> 
> Still no changes.
> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
