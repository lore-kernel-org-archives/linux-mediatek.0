Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93375C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 05:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdDlVsQyC7j4Aw3Lg2o4St6Eu9FS9lDwJI8dDkj7rGo=; b=XT8nvuKyNyx+9M
	+UQlv9HJxwBCPk5gpW7gzDskFqhtcwNqYq6ZonpJ023448KaFCRrbqsmUGoG/Kd6ynW79yiuPGzhM
	LfaMyYaajxsKPvkudv9DZF28AlREtuBsuQZQmIZHGAYotcQwN2dFVH+MPj1fOupu+pi6BTFM7XyEk
	jYyQuWQvZE2cTa11WHUuHCibci1FJertMco0Q1u3SB63JAp9EuHNNGzpvZyBpf5nPriafp0YtS1q0
	9fv9Ca6y9dwZjzvgK+mOh9AsuDr2dIcEO3yRq8g5zf3W341OGtiHzZk8pMSxMtC2QzZNGBcucyntv
	FbSsGdeVuycUq9Np1VpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBsJ4-002KX8-FX; Mon, 24 Jan 2022 05:54:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBsIt-002KWP-2A; Mon, 24 Jan 2022 05:54:12 +0000
X-UUID: 54158fe3fe264b498394fa6dbc8ab817-20220123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DQxmNeHELHWmUq7WmyJhnnRpZ924ZwikTtH4Y5Px9gg=; 
 b=kA1aKj/Gwh+6cE0Khaut01qf/XGu+Yffb0v/lYoK4dzeEjJ5qHb9v2L2ckbgKjXZ0Ebpi5vREHK8QYts2SS2udMU6S8bf3L0fP3n2Q2J7v3t4uSeatZEuIDyAAqgzScRe27hDzkh4C4d27CkWstDmwuErIM0MK1bTDP2RnNeH6Y=;
X-UUID: 54158fe3fe264b498394fa6dbc8ab817-20220123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 512942460; Sun, 23 Jan 2022 22:54:04 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 23 Jan 2022 21:54:02 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 13:54:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 Jan 2022 13:54:00 +0800
Message-ID: <284792c07f1adcd2ceeab287c6f38c35ee689c0a.camel@mediatek.com>
Subject: Re: [PATCH V2 1/3] dt-bindings: spi: Convert spi-slave-mt27xx to
 json-schema
From: Leilk Liu <leilk.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 24 Jan 2022 13:54:00 +0800
In-Reply-To: <YetVd7IR7FDt+nz3@robh.at.kernel.org>
References: <20220112103609.17421-1-leilk.liu@mediatek.com>
 <20220112103609.17421-2-leilk.liu@mediatek.com>
 <YetVd7IR7FDt+nz3@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_215411_141665_03EE9955 
X-CRM114-Status: GOOD (  20.31  )
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

On Fri, 2022-01-21 at 18:53 -0600, Rob Herring wrote:
> On Wed, Jan 12, 2022 at 06:36:07PM +0800, Leilk Liu wrote:
> > Convert Mediatek ARM SOC's SPI Slave controller binding
> > to json-schema format.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >  .../spi/mediatek,spi-slave-mt27xx.yaml        | 73
> > +++++++++++++++++++
> >  .../bindings/spi/spi-slave-mt27xx.txt         | 33 ---------
> >  2 files changed, 73 insertions(+), 33 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/spi/mediatek,spi-slave-
> > mt27xx.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/spi/spi-
> > slave-mt27xx.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > slave-mt27xx.yaml
> > b/Documentation/devicetree/bindings/spi/mediatek,spi-slave-
> > mt27xx.yaml
> > new file mode 100644
> > index 000000000000..3364fff08cca
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-slave-
> > mt27xx.yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > http://devicetree.org/schemas/spi/mediatek,spi-slave-mt27xx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SPI Slave controller for MediaTek ARM SoCs
> > +
> > +maintainers:
> > +  - Leilk Liu <leilk.liu@mediatek.com>
> > +
> > +allOf:
> > +  - $ref: /spi/spi-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2712-spi-slave
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8195-spi-slave
> 
> Just:
> 
>        enum:
>          - mediatek,mt2712-spi-slave
>          - mediatek,mt8195-spi-slave
> 
OK, I'll fix it.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: clock used for the clock gate
> 
> Just 'maxItems: 1'
> 
OK, I'll fix it.

> > +
> > +  clock-names:
> > +    items:
> > +      - const: spi
> > +
> > +  assigned-clocks:
> > +    maxItems: 1
> > +    description: |
> > +      The mux clock for the given platform.
> > +
> > +  assigned-clock-parents:
> > +    maxItems: 1
> > +    description: |
> > +      The parent of mux clock for the given platform.
> 
> You can drop assigned-clocks. They are always allowed on nodes with 
> 'clocks'.
> 
OK, I'll fix it.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt2712-clk.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    spi@10013000 {
> > +      compatible = "mediatek,mt2712-spi-slave";
> > +      reg = <0x10013000 0x100>;
> > +      interrupts = <GIC_SPI 283 IRQ_TYPE_LEVEL_LOW>;
> > +      clocks = <&infracfg CLK_INFRA_AO_SPI1>;
> > +      clock-names = "spi";
> > +      assigned-clocks = <&topckgen CLK_TOP_SPISLV_SEL>;
> > +      assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL1_D2>;
> > +    };
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
