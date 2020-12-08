Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF5EC4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 02:10:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36BF423A1E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 02:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36BF423A1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cdvPNmSh9e7qq0QsBvB4DXae30uOyZAnQvXpxCbafWc=; b=jVEee4JCPhUDuUG5ZspCH6fIY
	kvwQN4sId5PjFj8SE+wBCN2+DeunvDOlREB52IL/f7NrImfv8mDNZkca+iqcrnDx5cvtZ0E8fHvTG
	NsiH+g+fH0IB415j4o17bRpRwfk55e5KO+1m9xXao1pqnvhqZrJCjcCY7mQQhEaZjDY9WbLIF6AS8
	/IvwfUCd0vrN6UAdmgYOx4IZNFIvgd+2/STNjXz9+KkZFnHdrbsocromTUrbLe7HT4ZUPAO1BbbW1
	3D77w8QtE7wGJs+2IEAp9+7aoa46HZHgc1LGVLhobTN55DnW4pycIb6zPXqYLV+K+VnSfaPxL47mW
	0oGWuSHJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmSSj-0000MB-Ld; Tue, 08 Dec 2020 02:10:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmSSg-0000Lg-EE; Tue, 08 Dec 2020 02:10:43 +0000
X-UUID: a0fd30be59064ca0ba85c96f28a01f2e-20201207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AnfMsxCsqIaWPXAofU2Qh3nt/yEpA1Nncyh3grmr2Hs=; 
 b=a2h/GOb3tMmj4tVWWW0Z8TUR3FBZ3HuPCXErjJgQio5LqJUJMEZR1tVd2u1BuMDPlmDLv2O+NDJZ8PcqVt24FAPKEqv1uNg6UFJa56TTUYvo2315Fqbm9h8UgU9F6hHw+HODvloC9Xj/ab+g8IgGqFF1/2dzNy25Nb0tHM+TMbc=;
X-UUID: a0fd30be59064ca0ba85c96f28a01f2e-20201207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1902848928; Mon, 07 Dec 2020 18:10:40 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 18:00:35 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Dec 2020 10:00:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Dec 2020 10:00:26 +0800
Message-ID: <1607392825.23328.5.camel@mhfsdcap03>
Subject: Re: [PATCH v3 07/11] dt-bindings: phy: convert MIP DSI PHY binding
 to YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 8 Dec 2020 10:00:25 +0800
In-Reply-To: <20201207211920.GA841059@robh.at.kernel.org>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-7-chunfeng.yun@mediatek.com>
 <20201207211920.GA841059@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BA25879DABC571C822341F4AC2ABA120CA9AACE0D97F7DEA60AC1AC6A1D432792000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_211042_698688_A4D8E517 
X-CRM114-Status: GOOD (  24.11  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min
 Guo <min.guo@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, David
 Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-12-07 at 15:19 -0600, Rob Herring wrote:
> On Wed, Nov 18, 2020 at 04:21:22PM +0800, Chunfeng Yun wrote:
> > Convert MIPI DSI PHY binding to YAML schema mediatek,dsi-phy.yaml
> > 
> > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v3: new patch
> > ---
> >  .../display/mediatek/mediatek,dsi.txt         | 18 +---
> >  .../bindings/phy/mediatek,dsi-phy.yaml        | 83 +++++++++++++++++++
> >  2 files changed, 84 insertions(+), 17 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > index f06f24d405a5..8238a86686be 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > @@ -22,23 +22,7 @@ Required properties:
> >  MIPI TX Configuration Module
> >  ============================
> >  
> > -The MIPI TX configuration module controls the MIPI D-PHY.
> > -
> > -Required properties:
> > -- compatible: "mediatek,<chip>-mipi-tx"
> > -- the supported chips are mt2701, 7623, mt8173 and mt8183.
> > -- reg: Physical base address and length of the controller's registers
> > -- clocks: PLL reference clock
> > -- clock-output-names: name of the output clock line to the DSI encoder
> > -- #clock-cells: must be <0>;
> > -- #phy-cells: must be <0>.
> > -
> > -Optional properties:
> > -- drive-strength-microamp: adjust driving current, should be 3000 ~ 6000. And
> > -						   the step is 200.
> > -- nvmem-cells: A phandle to the calibration data provided by a nvmem device. If
> > -               unspecified default values shall be used.
> > -- nvmem-cell-names: Should be "calibration-data"
> > +See phy/mediatek,dsi-phy.yaml
> >  
> >  Example:
> >  
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> > new file mode 100644
> > index 000000000000..87f8df251ab0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MIPI Display Serial Interface (DSI) PHY binding
> > +
> > +maintainers:
> > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> > +
> > +description: The MIPI DSI PHY supports up to 4-lane output.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^dsi-phy@[0-9a-f]+$"
> > +
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt2701-mipi-tx
> > +      - mediatek,mt7623-mipi-tx
> > +      - mediatek,mt8173-mipi-tx
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: PLL reference clock
> > +
> > +  clock-output-names:
> > +    maxItems: 1
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +  "#clock-cells":
> > +    const: 0
> > +
> > +  nvmem-cells:
> > +    maxItems: 1
> > +    description: A phandle to the calibration data provided by a nvmem device,
> > +      if unspecified, default values shall be used.
> > +
> > +  nvmem-cell-names:
> > +    items:
> > +      - const: calibration-data
> > +
> > +  drive-strength-microamp:
> > +    description: adjust driving current, the step is 200.
> 
> multipleOf: 200
Got it.
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Can drop. Standard unit suffixes have a type already.
Ok, thanks a lot

> 
> > +    minimum: 2000
> > +    maximum: 6000
> > +    default: 4600
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-output-names
> > +  - "#phy-cells"
> > +  - "#clock-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    dsi-phy@10215000 {
> > +        compatible = "mediatek,mt8173-mipi-tx";
> > +        reg = <0x10215000 0x1000>;
> > +        clocks = <&clk26m>;
> > +        clock-output-names = "mipi_tx0_pll";
> > +        drive-strength-microamp = <4000>;
> > +        nvmem-cells= <&mipi_tx_calibration>;
> > +        nvmem-cell-names = "calibration-data";
> > +        #clock-cells = <0>;
> > +        #phy-cells = <0>;
> > +    };
> > +
> > +...
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
