Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 02:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGYBSK929lFGPgSatvWWpYL6CKFEfz3xiCeoN+OEzyo=; b=tUSK4DwsJHFnfdW8oIXv6/zXsr
	02v6s428etnbC9oh46Sdd7nxFSYKg/IfkUwIcaI4z+Ycvx7JYCJso2FqggWhEjuhMSR/4l0SnKlET
	3Lq4Hqg61VeMFciyp8Y86e4bYcNMYY2RYBSgI5vsqCDc2sG9JY2wOkHTs3uIVO90O+RmtxSybQVMi
	kchWsRpBjul3MUKuLHpL0VMD2mLQ7/pI6yelhi7GzDqzgBYDXPBQXgmf2fDWCnf7kUwWY/JA+nybl
	0NmXy2gQGf9SyydEMp2Z6eZMhWfzelvfpVFKUaans1u/TlkD1K3YRW5OQwj2k/GEYXtn6+c0ElT+h
	REOMhYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDdBP-0045Aq-St; Tue, 19 Jul 2022 02:41:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDdBM-0045AO-Mt; Tue, 19 Jul 2022 02:41:58 +0000
X-UUID: 39d76c2e8d6343d883ca85cadd44c498-20220718
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:6988f377-b499-4804-a026-c074cf210b68,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:191bd7d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 39d76c2e8d6343d883ca85cadd44c498-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1545940127; Mon, 18 Jul 2022 19:41:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 19 Jul 2022 10:01:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Jul 2022 10:01:14 +0800
Message-ID: <5aaaa8e4186a89c1fb14b3404dd395d4f7b0cb91.camel@mediatek.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: watchdog: mediatek: Convert binding
 to YAML
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Chen-Yu Tsai" <wenst@chromium.org>
Date: Tue, 19 Jul 2022 10:01:14 +0800
In-Reply-To: <4fcc64d9-060e-6568-6eb7-d74c520593b0@gmail.com>
References: <20220714125044.20403-1-allen-kh.cheng@mediatek.com>
	 <20220714125044.20403-2-allen-kh.cheng@mediatek.com>
	 <4fcc64d9-060e-6568-6eb7-d74c520593b0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_194156_785552_A18BF2AD 
X-CRM114-Status: GOOD (  24.74  )
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

Hi Matthias,

On Mon, 2022-07-18 at 18:04 +0200, Matthias Brugger wrote:
> 
> On 14/07/2022 14:50, Allen-KH Cheng wrote:
> > Convert Mediatek watchdog devicetree binding to YAML.
> > 
> 
> You are also fixing the fallback compatible here.
> 

Oh, I will add those into commit message.

> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   .../bindings/watchdog/mediatek,wdt.yaml       | 64
> > +++++++++++++++++++
> >   .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ------------
> >   2 files changed, 64 insertions(+), 42 deletions(-)
> >   create mode 100644
> > Documentation/devicetree/bindings/watchdog/mediatek,wdt.yaml
> >   delete mode 100644
> > Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/watchdog/mediatek,wdt.yaml
> > b/Documentation/devicetree/bindings/watchdog/mediatek,wdt.yaml
> > new file mode 100644
> > index 000000000000..cb90d89b9f5d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/mediatek,wdt.yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/watchdog/mediatek,wdt.yaml*__;Iw!!CTRNKA9wMg0ARbw!xzpsTCQSKgCvQ7nE87H8t8uuf4nXwQouO370rg8gVf0cGfdoH1ZunLCrJI9ZM1wKzgFH_A$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!xzpsTCQSKgCvQ7nE87H8t8uuf4nXwQouO370rg8gVf0cGfdoH1ZunLCrJI9ZM1y_onVgvA$
> >  
> > +
> > +title: MediatTek SoCs Watchdog timer
> > +
> > +maintainers:
> > +  - Runyang Chen <runyang.chen@mediatek.com>
> > +
> > +allOf:
> > +  - $ref: "watchdog.yaml#"
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - mediatek,mt2712-wdt
> > +          - mediatek,mt6589-wdt
> > +          - mediatek,mt7986-wdt
> > +          - mediatek,mt8183-wdt
> > +          - mediatek,mt8186-wdt
> > +          - mediatek,mt8192-wdt
> > +          - mediatek,mt8195-wdt
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2701-wdt
> 
> missing mt6582-wdt, mediatek,mt7623-wdt and more.
> I'd advise split this up in two patches. One fixing the fallback
> compatible and 
> the second one converting to yaml (or the other way round). In any
> case make 
> sure you have all compatibles in the end.
> 
> Regards,
> Matthias
> 

My carelessness, I ran dtbs_check but didn't see those compatible
warnings. I will check all compatible again from bindings and split
differnet PATCHs.

Thanks for the reminder

Best Regards,
Allen

> > +              - mediatek,mt6797-wdt
> > +              - mediatek,mt7622-wdt
> > +              - mediatek,mt8516-wdt
> > +              - mediatek,mt8173-wdt
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
> > +  mediatek,disable-extrst:
> > +    type: boolean
> > +    description: disable send output reset signal
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
> > +    watchdog@10007000 {
> > +        compatible = "mediatek,mt8186-wdt";
> > +        reg = <0x10007000 0x100>;
> > +        mediatek,disable-extrst;
> > +        #reset-cells = <1>;
> > +    };
> > +
> > +...
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


