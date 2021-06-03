Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F54C47096
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 12:27:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D6A6121D
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 12:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0D6A6121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJeaIx1qAIssNg7fum9tyCYeRNo/SUA4s0Xjg8KHtdU=; b=vXGgG7yvTpRVHF
	i80GM78ExhozBymd7q9LjgaXuT6L9NyzT5YwPjJORKnI/Ig9sk0no1zEvyWq13IGfVOU1xrwt4OdE
	ZIOn8TybcgA6WrKC0WXnZHH3/2g5yMUqxqug2brzupXlXm7mjVAidwQagEQil4WyRQm/IxOB+oE2W
	c9Po1KodM8gt8V/xZiA4Ti0sAGZ1ao5vfpY6VqutqyF32Uk5fhfB14N1uQjP9l3thhNyRUXmy+lAL
	1jOrUphUvDWOut4Ouc3OGj9IuOyKggkRSV5wQszJsnoaK5o5OFyEE1H3wuc8XgXJxGuaXuNyM6S2t
	1drSI5bQ7xjYUSFrrTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lomQw-008bwu-BC; Thu, 03 Jun 2021 12:26:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lomQq-008bnq-W9; Thu, 03 Jun 2021 12:26:44 +0000
X-UUID: b2b63e82b8374c9197e398daa1120f48-20210603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sMgMA2RpF06sYcGbBaNy1UgBN/IhJ6FavN5wIRQ3uSI=; 
 b=N9lkVBcDoU7r2MJYzEMOd3azfIsoTtTXIveTXAMu7fBwrs9pu/j9kfAZo0+GO7hGQrkPibLpxpIRU7BDEN0JDWkSynhLqQkjwneLR4zfzEbCO415L/brCKsHlWtDslsUWGFXDJkq4+5Mct6ftiypHmMRiB4tJqXFVI4D1/x6Awc=;
X-UUID: b2b63e82b8374c9197e398daa1120f48-20210603
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 711561099; Thu, 03 Jun 2021 05:26:38 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 05:26:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 20:26:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Jun 2021 20:26:29 +0800
Message-ID: <24fea4b3538f79f2ebbdff1fbb57855d24838824.camel@mediatek.com>
Subject: Re: [PATCH v9 05/22] dt-bindings: ARM: Mediatek: Document bindings
 of MT8192 clock controllers
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>
Date: Thu, 3 Jun 2021 20:26:29 +0800
In-Reply-To: <20210602172036.GA3601208@robh.at.kernel.org>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-6-chun-jie.chen@mediatek.com>
 <20210602172036.GA3601208@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_052641_078150_2A4E8B51 
X-CRM114-Status: GOOD (  22.59  )
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

On Wed, 2021-06-02 at 12:20 -0500, Rob Herring wrote:
> On Mon, May 24, 2021 at 08:20:36PM +0800, Chun-Jie Chen wrote:
> > This patch adds the binding documentation of topckgen, apmixedsys,
> > infracfg, pericfg and subsystem clocks for Mediatek MT8192.
> 
> I suspect all these could just be merged into 1 schema like the
> others 
> if the only differences are compatible strings.
> 

Did you mean to create 2 schema for mt8192?
1. medaitek,mt8192-clock.yaml: it contains all compatible string that
only provide clocks control.
2. mediatek,mt8192-sys.yaml: it contains all compatible string that
provide clocks and other control.

Best Regards,
Chun-Jie 

> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> > ---
> >  .../arm/mediatek/mediatek,apmixedsys.txt      |  1 +
> >  .../bindings/arm/mediatek/mediatek,audsys.txt |  1 +
> >  .../bindings/arm/mediatek/mediatek,camsys.txt | 22
> > +++++++++++++++++++
> >  .../bindings/arm/mediatek/mediatek,imgsys.txt |  2 ++
> >  .../arm/mediatek/mediatek,infracfg.txt        |  1 +
> >  .../bindings/arm/mediatek/mediatek,ipesys.txt |  1 +
> >  .../bindings/arm/mediatek/mediatek,mfgcfg.txt |  1 +
> >  .../bindings/arm/mediatek/mediatek,mmsys.txt  |  1 +
> >  .../arm/mediatek/mediatek,pericfg.yaml        |  1 +
> >  .../arm/mediatek/mediatek,topckgen.txt        |  1 +
> >  .../arm/mediatek/mediatek,vdecsys.txt         |  8 +++++++
> >  .../arm/mediatek/mediatek,vencsys.txt         |  1 +
> >  12 files changed, 41 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsy
> > s.txt
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsy
> > s.txt
> > index ea827e8763de..551c30735cd7 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsy
> > s.txt
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsy
> > s.txt
> > @@ -18,6 +18,7 @@ Required Properties:
> >  	- "mediatek,mt8167-apmixedsys", "syscon"
> >  	- "mediatek,mt8173-apmixedsys"
> >  	- "mediatek,mt8183-apmixedsys", "syscon"
> > +	- "mediatek,mt8192-apmixedsys", "syscon"
> >  	- "mediatek,mt8516-apmixedsys"
> >  - #clock-cells: Must be 1
> >  
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.tx
> > t
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.tx
> > t
> > index b32d374193c7..699776be1dd3 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.tx
> > t
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.tx
> > t
> > @@ -13,6 +13,7 @@ Required Properties:
> >  	- "mediatek,mt7623-audsys", "mediatek,mt2701-audsys", "syscon"
> >  	- "mediatek,mt8167-audiosys", "syscon"
> >  	- "mediatek,mt8183-audiosys", "syscon"
> > +	- "mediatek,mt8192-audsys", "syscon"
> >  	- "mediatek,mt8516-audsys", "syscon"
> >  - #clock-cells: Must be 1
> >  
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.tx
> > t
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.tx
> > t
> > index a0ce82085ad0..7d0b14e5c8ba 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.tx
> > t
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.tx
> > t
> > @@ -9,6 +9,10 @@ Required Properties:
> >  	- "mediatek,mt6765-camsys", "syscon"
> >  	- "mediatek,mt6779-camsys", "syscon"
> >  	- "mediatek,mt8183-camsys", "syscon"
> > +	- "mediatek,mt8192-camsys", "syscon"
> > +	- "mediatek,mt8192-camsys_rawa", "syscon"
> > +	- "mediatek,mt8192-camsys_rawb", "syscon"
> > +	- "mediatek,mt8192-camsys_rawc", "syscon"
> >  - #clock-cells: Must be 1
> >  
> >  The camsys controller uses the common clk binding from
> > @@ -22,3 +26,21 @@ camsys: camsys@1a000000  {
> >  	reg = <0 0x1a000000  0 0x1000>;
> >  	#clock-cells = <1>;
> >  };
> > +
> > +camsys_rawa: syscon@1a04f000 {
> > +	compatible = "mediatek,mt8192-camsys_rawa", "syscon";
> > +	reg = <0 0x1a04f000 0 0x1000>;
> > +	#clock-cells = <1>;
> > +};
> > +
> > +camsys_rawb: syscon@1a06f000 {
> > +	compatible = "mediatek,mt8192-camsys_rawb", "syscon";
> > +	reg = <0 0x1a06f000 0 0x1000>;
> > +	#clock-cells = <1>;
> > +};
> > +
> > +camsys_rawc: syscon@1a08f000 {
> > +	compatible = "mediatek,mt8192-camsys_rawc", "syscon";
> > +	reg = <0 0x1a08f000 0 0x1000>;
> > +	#clock-cells = <1>;
> > +};
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.tx
> > t
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.tx
> > t
> > index dce4c9241932..b9e599e116dc 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.tx
> > t
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.tx
> > t
> > @@ -15,6 +15,8 @@ Required Properties:
> >  	- "mediatek,mt8167-imgsys", "syscon"
> >  	- "mediatek,mt8173-imgsys", "syscon"
> >  	- "mediatek,mt8183-imgsys", "syscon"
> > +	- "mediatek,mt8192-imgsys", "syscon"
> > +	- "mediatek,mt8192-imgsys2", "syscon"
> >  - #clock-cells: Must be 1
> >  
> >  The imgsys controller uses the common clk binding from
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.
> > txt
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.
> > txt
> > index eb3523c7a7be..6e05a0014cf7 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.
> > txt
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.
> > txt
> > @@ -19,6 +19,7 @@ Required Properties:
> >  	- "mediatek,mt8167-infracfg", "syscon"
> >  	- "mediatek,mt8173-infracfg", "syscon"
> >  	- "mediatek,mt8183-infracfg", "syscon"
> > +	- "mediatek,mt8192-infracfg", "syscon"
> >  	- "mediatek,mt8516-infracfg", "syscon"
> >  - #clock-cells: Must be 1
> >  - #reset-cells: Must be 1
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.tx
> > t
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.tx
> > t
> > index 2ce889b023d9..9cd10350ab9b 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.tx
> > t
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.tx
> > t
> > @@ -7,6 +7,7 @@ Required Properties:
> >  
> >  - compatible: Should be one of:
> >  	- "mediatek,mt6779-ipesys", "syscon"
> > +	- "mediatek,mt8192-ipesys", "syscon"
> >  - #clock-cells: Must be 1
> >  
> >  The ipesys controller uses the common clk binding from
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.tx
> > t
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.tx
> > t
> > index 054424fb64b4..6bfb49a43ef9 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.tx
> > t
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.tx
> > t
> > @@ -10,6 +10,7 @@ Required Properties:
> >  	- "mediatek,mt6779-mfgcfg", "syscon"
> >  	- "mediatek,mt8167-mfgcfg", "syscon"
> >  	- "mediatek,mt8183-mfgcfg", "syscon"
> > +	- "mediatek,mt8192-mfgcfg", "syscon"
> >  - #clock-cells: Must be 1
> >  
> >  The mfgcfg controller uses the common clk binding from
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> > index 78c50733985c..9712a6831fab 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> > @@ -16,6 +16,7 @@ Required Properties:
> >  	- "mediatek,mt8167-mmsys", "syscon"
> >  	- "mediatek,mt8173-mmsys", "syscon"
> >  	- "mediatek,mt8183-mmsys", "syscon"
> > +	- "mediatek,mt8192-mmsys", "syscon"
> >  - #clock-cells: Must be 1
> >  
> >  For the clock control, the mmsys controller uses the common clk
> > binding from
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.y
> > aml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.y
> > aml
> > index 8723dfe34bab..b405cbcafb90 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.y
> > aml
> > @@ -26,6 +26,7 @@ properties:
> >                - mediatek,mt8135-pericfg
> >                - mediatek,mt8173-pericfg
> >                - mediatek,mt8183-pericfg
> > +              - mediatek,mt8192-pericfg
> >                - mediatek,mt8516-pericfg
> >            - const: syscon
> >        - items:
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.
> > txt
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.
> > txt
> > index 5ce7578cf274..1627e384b2ba 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.
> > txt
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.
> > txt
> > @@ -18,6 +18,7 @@ Required Properties:
> >  	- "mediatek,mt8167-topckgen", "syscon"
> >  	- "mediatek,mt8173-topckgen"
> >  	- "mediatek,mt8183-topckgen", "syscon"
> > +	- "mediatek,mt8192-topckgen", "syscon"
> >  	- "mediatek,mt8516-topckgen"
> >  - #clock-cells: Must be 1
> >  
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.t
> > xt
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.t
> > xt
> > index 98195169176a..376c82ed09ab 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.t
> > xt
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.t
> > xt
> > @@ -14,6 +14,8 @@ Required Properties:
> >  	- "mediatek,mt8167-vdecsys", "syscon"
> >  	- "mediatek,mt8173-vdecsys", "syscon"
> >  	- "mediatek,mt8183-vdecsys", "syscon"
> > +	- "mediatek,mt8192-vdecsys", "syscon"
> > +	- "mediatek,mt8192-vdecsys_soc", "syscon"
> >  - #clock-cells: Must be 1
> >  
> >  The vdecsys controller uses the common clk binding from
> > @@ -27,3 +29,9 @@ vdecsys: clock-controller@16000000 {
> >  	reg = <0 0x16000000 0 0x1000>;
> >  	#clock-cells = <1>;
> >  };
> > +
> > +vdecsys_soc: syscon@1600f000 {
> > +	compatible = "mediatek,mt8192-vdecsys_soc", "syscon";
> > +	reg = <0 0x1600f000 0 0x1000>;
> > +	#clock-cells = <1>;
> > +};
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.t
> > xt
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.t
> > xt
> > index 6a6a14e15cd7..d22de01c24ec 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.t
> > xt
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.t
> > xt
> > @@ -11,6 +11,7 @@ Required Properties:
> >  	- "mediatek,mt6797-vencsys", "syscon"
> >  	- "mediatek,mt8173-vencsys", "syscon"
> >  	- "mediatek,mt8183-vencsys", "syscon"
> > +	- "mediatek,mt8192-vencsys", "syscon"
> >  - #clock-cells: Must be 1
> >  
> >  The vencsys controller uses the common clk binding from
> > -- 
> > 2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
