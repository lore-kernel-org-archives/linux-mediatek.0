Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24609C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 14:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jlSg0SZR8GxgazHPS4WG9RzhMPcVsldy8L+YHWFNgU=; b=J6DTcbq1247I2G
	vjYQaCL7mjp7DY+sV6jgrDkC0xr/AodzKt+jpp2b3Wo1sH75v5nkMPgwqWIIO9u9YRPTXuzm0rvNg
	RF5ggZoE8iKGnSGKoTHb2ZW7yKYE5B4nZwNtocBE1oIgSBO7Uv60AjAjKAA04x0DUdJR7nsKuwPQn
	wTc7d1/EmSCs6mOQk3jPsWMf/yF5KSJshvd4XlDjwEHS4OQoeWpw+i4Pnnan+ZtqlhbjN16qSjiuE
	xGRmzDWZdVYypMsergWayKC+b3Qnn63xlECkKez/tO0bgnrUchRGYWh23gubCxB1ujjrceGD3hSO5
	bDnCdaaZ+S0r5s10UcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVDrS-0022Y1-KQ; Fri, 18 Mar 2022 14:45:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVDrC-0022Ts-6J; Fri, 18 Mar 2022 14:45:39 +0000
X-UUID: a9dc31bc9fe04fffada5584b06e748b5-20220318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=y13DznyUBzvvaC2IBma6I1tgAx0sZ7RVv3vdchtq1Ek=; 
 b=O99fmHrloMZvbcXz889dG8yHCUWxCIEdiMmFqISYkcy2Nh8meIN5ru4v1TWL3ApSH1m3dkMyZLjqrsYnN0KndfnKpT2VjJZaSvOw/wYLV0JoWSTETicF0pWJ0OblqvnWpsk3Cg7fGSKrEv8+9xVzX9CvLyjjG+FveGY/gwSH0kY=;
X-UUID: a9dc31bc9fe04fffada5584b06e748b5-20220318
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2068538118; Fri, 18 Mar 2022 07:45:27 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 07:45:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 18 Mar 2022 22:45:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 22:45:23 +0800
Message-ID: <da5eec2a0f96c882f79d124ecefcd357fe0d6b63.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek: Add YAML schema for
 PCIe PHY
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, "Vinod
 Koul" <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>, <randy.wu@mediatek.com>,
 <jieyy.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>, <jian.yang@mediatek.com>
Date: Fri, 18 Mar 2022 22:45:23 +0800
In-Reply-To: <d48c0023-231c-4011-5548-4b260b3fe172@kernel.org>
References: <20220318095417.2016-1-jianjun.wang@mediatek.com>
 <20220318095417.2016-2-jianjun.wang@mediatek.com>
 <d48c0023-231c-4011-5548-4b260b3fe172@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_074534_292793_4606A5BD 
X-CRM114-Status: GOOD (  19.00  )
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

On Fri, 2022-03-18 at 14:55 +0100, Krzysztof Kozlowski wrote:
> On 18/03/2022 10:54, Jianjun Wang wrote:
> > Add YAML schema documentation for PCIe PHY on MediaTek chipsets.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > ---
> >  .../bindings/phy/mediatek,pcie-phy.yaml       | 75
> > +++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,pcie-
> > phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,pcie-
> > phy.yaml
> > new file mode 100644
> > index 000000000000..868bf976568b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/mediatek,pcie-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek PCIe PHY
> > +
> > +maintainers:
> > +  - Jianjun Wang <jianjun.wang@mediatek.com>
> > +
> > +description: |
> > +  The PCIe PHY supports physical layer functionality for PCIe Gen3
> > port.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8195-pcie-phy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  reg-names:
> > +    items:
> > +      - const: sif
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +  nvmem-cells:
> > +    description:
> > +      Phandles to nvmem cell that contains the efuse data, if
> > unspecified,
> > +      default value is used.
> 
> maxItems: 7

Thanks for your review, I'll fix it in the next version.

> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
