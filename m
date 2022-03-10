Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7877C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWqbx3vcw8yU1NN8RQlxgXPe6vzggnR71qvFB7mzuSY=; b=Ps1tEnGXQgjLLa
	q3jnM68NcaTfXm7QqdVKgaUlCuv1q0m46rqiswEkQyTPAIIB6somS3W+oe/cJcgFRejO5HK6Ar2qG
	05x8FfoZ4B8L2EZMIMMDw7vajzwNxbDNgIvEFwG0zhkOaVRzfk5kEJXmj+1othRYIof5P2B3kZCP9
	EbmelfkD5J3qg70rUIkZNLyBTuBCX5hz1n9hCrjqIn20o2BSzCBFJXaL5i+K49/6KlRLbadw4rlZm
	0msoS96/1BBDCGvDsxsoD76o60BdpoUB6jhL1FHrXdu8bq/pySK2YvmkP7FNDFMPuUdjMFhf5e+yy
	9wk2nA3vydF0psmwtKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSIyF-00CxFy-L4; Thu, 10 Mar 2022 13:36:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSIy3-00CxDj-N0; Thu, 10 Mar 2022 13:36:37 +0000
X-UUID: 1fa1a6c5286f4b8f9cb0ef7ecb7133cc-20220310
X-UUID: 1fa1a6c5286f4b8f9cb0ef7ecb7133cc-20220310
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 648867539; Thu, 10 Mar 2022 06:36:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 05:36:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 10 Mar 2022 21:36:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Mar 2022 21:36:27 +0800
Message-ID: <d80c89fd5fb704ed03244a7e333d59d0ee972e8f.camel@mediatek.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: ARM: Mediatek: Add new document
 bindings of MT8186 clock
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 10 Mar 2022 21:36:27 +0800
In-Reply-To: <YhkmnnIApvU7gRlZ@robh.at.kernel.org>
References: <20220221015258.913-1-chun-jie.chen@mediatek.com>
 <20220221015258.913-2-chun-jie.chen@mediatek.com>
 <YhkmnnIApvU7gRlZ@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_053635_839935_84D04CF6 
X-CRM114-Status: GOOD (  22.65  )
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

On Fri, 2022-02-25 at 12:57 -0600, Rob Herring wrote:
> On Mon, Feb 21, 2022 at 09:52:44AM +0800, Chun-Jie Chen wrote:
> > This patch adds the new binding documentation for system clock
> > and functional clock on Mediatek MT8186.
> > 
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > ---
> >  .../arm/mediatek/mediatek,mt8186-clock.yaml   |  56 +++
> >  .../mediatek/mediatek,mt8186-sys-clock.yaml   |  54 +++
> >  include/dt-bindings/clock/mt8186-clk.h        | 445
> > ++++++++++++++++++
> >  3 files changed, 555 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > clock.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-
> > clock.yaml
> >  create mode 100644 include/dt-bindings/clock/mt8186-clk.h
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > clock.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > clock.yaml
> > new file mode 100644
> > index 000000000000..373e8a100da3
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > clock.yaml
> > @@ -0,0 +1,56 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "
> > https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml*__;Iw!!CTRNKA9wMg0ARbw!xKDeg6ddrFWd8p__fZiG7r5F5Py9NVWCmi7zVue5fUzuxKtvqHCSu_pslcpXRWfJmMCT$
> >  "
> > +$schema: "
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!xKDeg6ddrFWd8p__fZiG7r5F5Py9NVWCmi7zVue5fUzuxKtvqHCSu_pslcpXRfM3OA21$
> >  "
> > +
> > +title: Mediatek Functional Clock Controller for MT8186
> > +
> > +maintainers:
> > +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > +
> > +description:
> 
> You need a '|' to preserve the formatting.
> 
> > +  The clock architecture in Mediatek like below
> > +  PLLs -->
> > +          dividers -->
> > +                      muxes
> > +                           -->
> > +                              clock gate
> > +
> > +  The devices provide clock gate control in different IP blocks.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8186-imp_iic_wrap
> > +          - mediatek,mt8186-mfgsys
> > +          - mediatek,mt8186-wpesys
> > +          - mediatek,mt8186-imgsys1
> > +          - mediatek,mt8186-imgsys2
> > +          - mediatek,mt8186-vdecsys
> > +          - mediatek,mt8186-vencsys
> > +          - mediatek,mt8186-camsys
> > +          - mediatek,mt8186-camsys_rawa
> > +          - mediatek,mt8186-camsys_rawb
> > +          - mediatek,mt8186-mdpsys
> > +          - mediatek,mt8186-ipesys
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    imp_iic_wrap: clock-controller@11017000 {
> > +        compatible = "mediatek,mt8186-imp_iic_wrap";
> > +        reg = <0x11017000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > sys-clock.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > sys-clock.yaml
> > new file mode 100644
> > index 000000000000..4c071dd66b76
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-
> > sys-clock.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "
> > https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-sys-clock.yaml*__;Iw!!CTRNKA9wMg0ARbw!xKDeg6ddrFWd8p__fZiG7r5F5Py9NVWCmi7zVue5fUzuxKtvqHCSu_pslcpXRRtmGvUx$
> >  "
> > +$schema: "
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!xKDeg6ddrFWd8p__fZiG7r5F5Py9NVWCmi7zVue5fUzuxKtvqHCSu_pslcpXRfM3OA21$
> >  "
> > +
> > +title: Mediatek System Clock Controller for MT8186
> > +
> > +maintainers:
> > +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > +
> > +description:
> 
> And here.
> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Ok, I will fix it in next version.

Thanks!

> > +  The clock architecture in Mediatek like below
> > +  PLLs -->
> > +          dividers -->
> > +                      muxes
> > +                           -->
> > +                              clock gate
> > +
> > +  The apmixedsys provides most of PLLs which generated from SoC
> > 26m.
> > +  The topckgen provides dividers and muxes which provide the clock
> > source to other IP blocks.
> > +  The infracfg_ao provides clock gate in peripheral and
> > infrastructure IP blocks.
> > +  The mcusys provides mux control to select the clock source in AP
> > MCU.
> > +  The device nodes also provide the system control capacity for
> > configuration.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
