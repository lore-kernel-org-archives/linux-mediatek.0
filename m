Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C189C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 23:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnRUkjtqK/JfhbQINe1EFJ3ifpTprgtNZVZqAUtFMh4=; b=WwNNVde5vYmqme
	2acI9C4TMYMWIXNOVUC11h38qICryOXKkwXUm0aON8SeVSecyWK/6I1v/du46eAzQE1GQtVWejIlB
	nReWdm1d5266Q8gf6ecSlQBpMcN9NYHyCXEQF6iHyFFzyypDwWQsuS+/Ur/pFR0fkQaZpnH/Ms0EK
	9DJB2HvR4El4enVm1JMdHn21xKXMjnLsjcKIIi4ujSG2pL5mETkIJxj757jzncIHK+7JoKz8Z7p8M
	C3bNbjvR6w13YRMvuHkZzolsA50XFDmpuckkAxzS4Hsb0SAmd4rpfJxG1O823UHlPsRyAVbkIh7fk
	p2VAjf6ubnqSg2qfCQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSSTL-00ELNw-Ma; Thu, 10 Mar 2022 23:45:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSST8-00ELMT-81; Thu, 10 Mar 2022 23:45:21 +0000
X-UUID: a12bb70cbe8c409d99ac17f3eff57867-20220310
X-UUID: a12bb70cbe8c409d99ac17f3eff57867-20220310
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 641705972; Thu, 10 Mar 2022 16:45:12 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 15:45:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 11 Mar 2022 07:45:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Mar 2022 07:45:09 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <chun-jie.chen@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <drinkcat@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <sboyd@kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: ARM: Mediatek: Add new document
 bindings of MT8186 clock
Date: Fri, 11 Mar 2022 07:45:09 +0800
Message-ID: <20220310234509.32636-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220221015258.913-2-chun-jie.chen@mediatek.com>
References: <20220221015258.913-2-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_154518_319691_20549D6C 
X-CRM114-Status: GOOD (  15.20  )
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

Hi Chun-Jie,

> [PATCH v2 01/15] dt-bindings: ARM: Mediatek: Add new document bindings of MT8186 clock

s/Mediatek/MediaTek/

> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8186.

s/Mediatek/MediaTek/
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8186-clock.yaml   |  56 +++
>  .../mediatek/mediatek,mt8186-sys-clock.yaml   |  54 +++
>  include/dt-bindings/clock/mt8186-clk.h        | 445 ++++++++++++++++++
>  3 files changed, 555 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
>  create mode 100644 include/dt-bindings/clock/mt8186-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
> new file mode 100644
> index 000000000000..373e8a100da3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek Functional Clock Controller for MT8186

s/Mediatek/MediaTek/

> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The clock architecture in Mediatek like below

s/Mediatek/MediaTek/

> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The devices provide clock gate control in different IP blocks.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8186-imp_iic_wrap
> +          - mediatek,mt8186-mfgsys
> +          - mediatek,mt8186-wpesys
> +          - mediatek,mt8186-imgsys1
> +          - mediatek,mt8186-imgsys2
> +          - mediatek,mt8186-vdecsys
> +          - mediatek,mt8186-vencsys
> +          - mediatek,mt8186-camsys
> +          - mediatek,mt8186-camsys_rawa
> +          - mediatek,mt8186-camsys_rawb
> +          - mediatek,mt8186-mdpsys
> +          - mediatek,mt8186-ipesys
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    imp_iic_wrap: clock-controller@11017000 {
> +        compatible = "mediatek,mt8186-imp_iic_wrap";
> +        reg = <0x11017000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
> new file mode 100644
> index 000000000000..4c071dd66b76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-sys-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek System Clock Controller for MT8186
>
s/Mediatek/MediaTek/

> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The clock architecture in Mediatek like below

s/Mediatek/MediaTek/

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
