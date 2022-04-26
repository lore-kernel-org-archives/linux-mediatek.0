Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8334FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 10:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xO0eARGz320CS8mfQR/vWDKMgZJ8CGvTlLRmXl7mGbw=; b=cIxV7I3ecGJsd5
	Q9sOwWHvjiIGEUHWlINfEzqIirv+24TTVZ45XEk3ay7wmvIhLmSLWo9yOVLpUTFZrZ3AixUrJYoCI
	KnNy+5cnTJSssHjUWTPPI+xe/b+Z2AlFZ4D1InhkarViGKAPd4xlXDO8xDIxmCsH4H4kEds+GBM/v
	2HBJxXZJzZb8OjpkdlFZ1IhbZrwiDe8e62qacS7MeFV6ih5RHMTZupw50b0/HWEBvYCXHhxHX0P6m
	XAYiGeqy6swYGdz3SA1oenxuf59pzIZJSXM5LzQheVsIXKlgieKHC2l2oTEISg4ZDiiFmK6atDdd6
	f0YgCMD8XwLUH+5Y5krA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njI2d-00DkQQ-FB; Tue, 26 Apr 2022 10:03:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njI2S-00DkLn-8H; Tue, 26 Apr 2022 10:03:21 +0000
X-UUID: 4fb772a3e67242a385ea351d665ac8a9-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:fa89cd9c-2381-4fac-9ba7-a70c0eb7e44a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:714287c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4fb772a3e67242a385ea351d665ac8a9-20220426
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 935647325; Tue, 26 Apr 2022 03:03:14 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 03:03:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 26 Apr 2022 18:03:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 18:03:11 +0800
Message-ID: <23e170f94a541eca5a1a601cbb130c619d3fa3a9.camel@mediatek.com>
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
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Tue, 26 Apr 2022 18:03:11 +0800
In-Reply-To: <0169c4ac-fdce-29b7-553a-14dc7df532d1@linaro.org>
References: <20220425084800.2021-1-allen-kh.cheng@mediatek.com>
 <20220425084800.2021-2-allen-kh.cheng@mediatek.com>
 <e64bdca8-7b18-b450-830c-ca07946a73fb@linaro.org>
 <9d65b713e3ffdd34dcca532c4c97fa98b124bde4.camel@mediatek.com>
 <0169c4ac-fdce-29b7-553a-14dc7df532d1@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_030320_345175_C6C25BC6 
X-CRM114-Status: GOOD (  17.83  )
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

On Tue, 2022-04-26 at 08:31 +0200, Krzysztof Kozlowski wrote:
> On 26/04/2022 08:23, allen-kh.cheng wrote:
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - enum:
> > > > +          - mediatek,mt8173-efuse
> > > > +          - mediatek,efuse
> > > 
> > > Still no changes...
> > > 
> > 
> > I just want to confirm again.
> > 
> > "Generic compatibles should not be used standalone"
> > 
> > It seems we should remove mediatek,efuse and keep "mediatek,mt8173-
> > efuse"in binding. have I got that right?
> 
> You should comment for which chipsets this compatible is and add a
> deprecated:true. In such case it cannot be part of enum but separate
> item in this oneOf.
> 
> 
> Best regards,
> Krzysztof

Thanks for your suggestions, I would plan to send PATCHs as below,

We have a PATCH 01 for current accepted dts

properties:
  compatible:
    oneOf:
      - enum:
        - mediatek,efuse

        - mediatek,mt8173-efuse
        description: Only mt8173-efuse
with generic fallback should be used
      - items:
          - enum:
    
- mediatek,mt7622-efuse
			  ...
          - const: mediatek,efuse

Then add PATCH 02 to deprecate it

properties:
  compatible:
    oneOf:
      - enum:
        - mediatek,efuse
        - mediatek,mt8173-efuse
        deprecated: true
        description: The mediatek,efuse is a generic fallback for other
Chipset. Do not use the single compatible such as mediatek,efuse
or mediatek,mt8173-efuse. It is deprecated.
      - items:
          - enum:
              - mediatek,mt7622-efuse
              ...
          - const: mediatek,efuse


PATCH 03 for 8173

update mt8173.dtsi 

change compatible from "mediatek,mt8173-efuse" to "mediatek,mt8173-
efuse", "mediatek,efuse";


Do you think it'd be okay ?

Best regards,
Allen


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
