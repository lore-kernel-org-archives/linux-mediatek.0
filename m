Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F1CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 04:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7PwTWi67MSCjtQjTsbPcDT1zFJDJiHt4x2DDUjppT8=; b=uHqaFEgRrqIj7e
	pIa7k90ssA5NhjvJ6bWg/IjygXLyF11du4Sdc8IoIzKnAKQCAFOXQpx12gVluNOQ+BfO50Tac+Ejx
	qAUHN68XlDZ7HhxkuHdrRsNUqQowQs49HN8rpBU56dX0ej4mJq+oEnS6Accaronng+IITAPHdpqfB
	7TBuj22WIwhSazjHIDp/eTIqogd6+ChYvj40KY+4dstRI+Nnb0ggN6f/Ka7Ne0BIfxxXZC+XvNz+9
	fEthsLxh4fFLTGvoUKCf9zj/CwsHdP6gEXq6E8jaTRw8JzzEGS4EYSOqpH5enPSmtfC6c1HQSYtwA
	Jubno1+TR1MWyMd5U3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSX2a-00EyyS-HY; Fri, 11 Mar 2022 04:38:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSX2M-00Eywv-Sg; Fri, 11 Mar 2022 04:38:02 +0000
X-UUID: da58abcb50bc4f5dabb97f5b5b6e1fec-20220310
X-UUID: da58abcb50bc4f5dabb97f5b5b6e1fec-20220310
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1014690261; Thu, 10 Mar 2022 21:37:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 20:37:51 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 11 Mar 2022 12:37:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Mar 2022 12:37:49 +0800
Message-ID: <f2b9e3ab13351af601253d8e8a7160a06b609760.camel@mediatek.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: ARM: Mediatek: Add new document
 bindings of MT8186 clock
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <drinkcat@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <sboyd@kernel.org>,
 <srv_heupstream@mediatek.com>
Date: Fri, 11 Mar 2022 12:37:49 +0800
In-Reply-To: <20220310234509.32636-1-miles.chen@mediatek.com>
References: <20220221015258.913-2-chun-jie.chen@mediatek.com>
 <20220310234509.32636-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_203758_992850_4985395F 
X-CRM114-Status: GOOD (  19.05  )
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

On Fri, 2022-03-11 at 07:45 +0800, Miles Chen wrote:
> Hi Chun-Jie,
> 
> > [PATCH v2 01/15] dt-bindings: ARM: Mediatek: Add new document
> > bindings of MT8186 clock
> 
> s/Mediatek/MediaTek/
> 
> > This patch adds the new binding documentation for system clock
> > and functional clock on Mediatek MT8186.
> 
> s/Mediatek/MediaTek/
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
> > http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#
> > "
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Mediatek Functional Clock Controller for MT8186
> 
> s/Mediatek/MediaTek/
> 
> > +
> > +maintainers:
> > +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > +
> > +description:
> > +  The clock architecture in Mediatek like below
> 
> s/Mediatek/MediaTek/
> 
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
> > http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-sys-clock.yaml#
> > "
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Mediatek System Clock Controller for MT8186
> > 
> 
> s/Mediatek/MediaTek/
> 
> > +
> > +maintainers:
> > +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > +
> > +description:
> > +  The clock architecture in Mediatek like below
> 
> s/Mediatek/MediaTek/
> 
> Thanks,
> Miles

Ok, I will check binding document and all patch messages in this
series.

Thanks!


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
