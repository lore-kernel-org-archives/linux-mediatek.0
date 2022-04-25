Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 07:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7U9GZJIV0oxCLGmG4yvHiboJwFTEtJJh7s0KYM768s=; b=KjtKAn+bQ0PVZc
	v2DfnNabfWhGe5nvgJRjG6OW8UCpjBVJRwZ6k2utJV7auQjhFaJxPsfvL3sIBpzmBUw2eI7k1vKM/
	Rsu4CnKTDgvqcMHoOxo7kfjixcsapftP7IBCPo1mSYV7XFClgiGyFmWObB6kQja164V5f3GW400vF
	j0PfxG+a9KGU0Lpu5slk5Z3l/vsUXthlAhb8zGES7lg/PqoOepcc70jZqmz8evwOfsCU3uc6mSarS
	eWVqbofZzX7ewM5cb8pTV8+MgP6oLkFw7drkSPfOHm5OOnMwCnuwzc0/aM2p6Eg7QitndOIYuY6sr
	5G2mr+DsIvR8S++uAOmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nitMe-008e1a-1S; Mon, 25 Apr 2022 07:42:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nitMR-008dyg-LL; Mon, 25 Apr 2022 07:42:21 +0000
X-UUID: 44b9e49b364d4b1d97a3d0bbde0d5df5-20220425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:07cf1864-4104-4f9d-8c7f-ed55a21a0ca8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:f76e00f0-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 44b9e49b364d4b1d97a3d0bbde0d5df5-20220425
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1208767691; Mon, 25 Apr 2022 00:42:11 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 00:37:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Apr 2022 15:37:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Apr 2022 15:37:29 +0800
Message-ID: <b850f88f5044eb6cd57bec4fb864e5670618c9e7.camel@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: mediatek: Convert binding to
 YAML
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee
 <ryder.lee@kernel.org>
Date: Mon, 25 Apr 2022 15:37:29 +0800
In-Reply-To: <e2e4ead0-d8eb-1302-93e9-f330807d811e@linaro.org>
References: <20220422121017.23920-1-allen-kh.cheng@mediatek.com>
 <20220422121017.23920-3-allen-kh.cheng@mediatek.com>
 <e2e4ead0-d8eb-1302-93e9-f330807d811e@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_004219_755672_7EA88870 
X-CRM114-Status: GOOD (  27.43  )
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

Thanks for your suggestion

On Fri, 2022-04-22 at 17:44 +0200, Krzysztof Kozlowski wrote:
> On 22/04/2022 14:10, Allen-KH Cheng wrote:
> > Convert Mediatek watchdog devicetree binding to YAML.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
> >  .../devicetree/bindings/watchdog/mtk-wdt.yaml | 76
> > +++++++++++++++++++
> >  2 files changed, 76 insertions(+), 42 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-
> > wdt.txt
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/mtk-
> > wdt.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt 
> > b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > deleted file mode 100644
> > index 762c62e428ef..000000000000
> > --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > +++ /dev/null
> > @@ -1,42 +0,0 @@
> > -Mediatek SoCs Watchdog timer
> > -
> > -The watchdog supports a pre-timeout interrupt that fires timeout-
> > sec/2
> > -before the expiry.
> > -
> > -Required properties:
> > -
> > -- compatible should contain:
> > -	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> > -	"mediatek,mt2712-wdt": for MT2712
> > -	"mediatek,mt6582-wdt", "mediatek,mt6589-wdt": for MT6582
> > -	"mediatek,mt6589-wdt": for MT6589
> > -	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
> > -	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> > -	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
> > -	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> > -	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
> > -	"mediatek,mt8183-wdt": for MT8183
> > -	"mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
> > -	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> > -	"mediatek,mt8192-wdt": for MT8192
> > -	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
> > -
> > -- reg : Specifies base physical address and size of the registers.
> > -
> > -Optional properties:
> > -- mediatek,disable-extrst: disable send output reset signal
> > -- interrupts: Watchdog pre-timeout (bark) interrupt.
> > -- timeout-sec: contains the watchdog timeout in seconds.
> > -- #reset-cells: Should be 1.
> > -
> > -Example:
> > -
> > -watchdog: watchdog@10007000 {
> > -	compatible = "mediatek,mt8183-wdt",
> > -		     "mediatek,mt6589-wdt";
> > -	mediatek,disable-extrst;
> > -	reg = <0 0x10007000 0 0x100>;
> > -	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
> > -	timeout-sec = <10>;
> > -	#reset-cells = <1>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-
> > wdt.yaml b/Documentation/devicetree/bindings/watchdog/mtk-wdt.yaml
> > new file mode 100644
> > index 000000000000..5788617027c8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/watchdog/mtk-wdt.yaml*__;Iw!!CTRNKA9wMg0ARbw!xERWr2MUvqHyyGH9pqm2mwLVX2kDQAF0wr8QJrl5tQnRanjP0cFLXaLZ4-lCdeJ2erdbFvS3b8m5CyqauSNxK-PDlQ$
> >  
> 
> File name: mtk,wdt.yaml
> 
> I assume all future MediaTek watchdogs (even these unpublished and
> developed in some years) will fit into this schema. :) If not, then
> maybe better to name the file by the compatible... but it's not a
> must.
> 

Will correct file name.

> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!xERWr2MUvqHyyGH9pqm2mwLVX2kDQAF0wr8QJrl5tQnRanjP0cFLXaLZ4-lCdeJ2erdbFvS3b8m5CyqauSOMMN0Duw$
> >  
> > +
> > +title: Mediatek SoCs Watchdog timer
> > +
> > +maintainers:
> > +  - Runyang Chen <runyang.chen@mediatek.com>
> > +  - Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > +
> > +description: |+
> > +  The watchdog supports a pre-timeout interrupt that fires
> > timeout-sec/2
> > +  before the expiry.
> > +
> > +allOf:
> > +  - $ref: "watchdog.yaml#"
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: mediatek,mt2712-wdt
> > +      - const: mediatek,mt6589-wdt
> > +      - const: mediatek,mt8183-wdt
> > +      - const: mediatek,mt8192-wdt
> 
> All these four entries should be an enum.
> 

ok.

> > +
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2701-wdt
> > +              - mediatek,mt6582-wdt
> > +              - mediatek,mt6797-wdt
> > +              - mediatek,mt7622-wdt
> > +              - mediatek,mt7623-wdt
> > +              - mediatek,mt7629-wdt
> > +              - mediatek,mt7986-wdt
> > +              - mediatek,mt8173-wdt
> > +              - mediatek,mt8183-wdt
> > +              - mediatek,mt8186-wdt
> > +              - mediatek,mt8192-wdt
> > +              - mediatek,mt8195-wdt
> > +              - mediatek,mt8516-wdt
> > +          - const: mediatek,mt6589-wdt
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  '#reset-cells':
> > +    const: 1
> > +
> > +  timeout-sec: true
> 
> You do not need this, it's coming from watchdog schema.
> 

ok.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    watchdog@10007000 {
> > +        compatible = "mediatek,mt8183-wdt",
> > +                     "mediatek,mt6589-wdt";
> > +        mediatek,disable-extrst;
> 
> Did you test your bindings? Does not look like. Please run
> dt_binding_check (see writing-schema for instructions).
> 

Yes, I have run dt_binding_check.

But example is from original binding txt file.

Is it ok I can write a new expample?


> > +        reg = <0x10007000 0x100>;
> > +        interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
> 
> Wrong interrupt flag.

I wil check this.


Thanks,
Allen

> 
> > +        timeout-sec = <10>;
> > +        #reset-cells = <1>;
> > +    };
> > +
> > +...
> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
