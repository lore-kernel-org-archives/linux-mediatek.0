Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2309FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 23:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cf+ljJRlEQZQ9c7P45iA740s6chs3Gr1XJVj7uTEBI4=; b=d8K4djs0BL5jgA
	CaLXoAmBUUzr9Xr7CdDOu+8Pi4owaHhjZU+xuR+Av5d+vCPckYjmf5RMsmIOri+7/w/zC37Vz0A4T
	y/t+rFFYr2hOf2SlLiArxV/1QwhayI9HrsY13+PnZJzkyETjqWX1mCcainrtxSYbtmEPDbm9n39Wa
	cKI457OOdbsPxzbxPOqpWI1Ewsz42pL7+FDku2xANSAxQCsWjV6gZ52qnqmFdm9suhi7AmYanIb/H
	5kgrXwLWeJAOPBhfaNlJI+doDnW1Bt05r1jSrl1e42baWiOGJmVoVMtGORBeL7/LQ5PNWkeOclvtY
	vGNt6wRF6K3ML2K2r4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncF0e-008DgL-7l; Wed, 06 Apr 2022 23:24:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncF0T-008De6-HX; Wed, 06 Apr 2022 23:24:11 +0000
X-UUID: 0cb8c940ec9a46158ae938c5654ac20a-20220406
X-UUID: 0cb8c940ec9a46158ae938c5654ac20a-20220406
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1170621737; Wed, 06 Apr 2022 16:24:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 16:24:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 7 Apr 2022 07:24:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 7 Apr 2022 07:24:00 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <hsinyi@chromium.org>,
 <kewei.xu@mediatek.com>, <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <qii.wang@mediatek.com>, <robh+dt@kernel.org>,
 <wsa@kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: convert i2c-mt65xx to json-schema
Date: Thu, 7 Apr 2022 07:24:00 +0800
Message-ID: <20220406232400.2788-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220406152940.140224-1-angelogioacchino.delregno@collabora.com>
References: <20220406152940.140224-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_162409_623776_B119293A 
X-CRM114-Status: GOOD (  16.93  )
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

Hi AngeloGioacchino,

> Convert I2C binding for MediaTek SoCs to Devicetree schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  53 --------
>  .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 118 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 119 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> deleted file mode 100644
> index 026985b8f61a..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -* MediaTek's I2C controller
> -
> -The MediaTek's I2C controller is used to interface with I2C devices.
> -
> -Required properties:
> -  - compatible: value should be either of the following.
> -      "mediatek,mt2701-i2c", "mediatek,mt6577-i2c": for MediaTek MT2701
> -      "mediatek,mt2712-i2c": for MediaTek MT2712
> -      "mediatek,mt6577-i2c": for MediaTek MT6577
> -      "mediatek,mt6589-i2c": for MediaTek MT6589
> -      "mediatek,mt6797-i2c", "mediatek,mt6577-i2c": for MediaTek MT6797
> -      "mediatek,mt7622-i2c": for MediaTek MT7622
> -      "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek MT7623
> -      "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
> -      "mediatek,mt8168-i2c": for MediaTek MT8168
> -      "mediatek,mt8173-i2c": for MediaTek MT8173
> -      "mediatek,mt8183-i2c": for MediaTek MT8183
> -      "mediatek,mt8186-i2c": for MediaTek MT8186
> -      "mediatek,mt8192-i2c": for MediaTek MT8192
> -      "mediatek,mt8195-i2c", "mediatek,mt8192-i2c": for MediaTek MT8195
> -      "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
> -  - reg: physical base address of the controller and dma base, length of memory
> -    mapped region.
> -  - interrupts: interrupt number to the cpu.
> -  - clock-div: the fixed value for frequency divider of clock source in i2c
> -    module. Each IC may be different.
> -  - clocks: clock name from clock manager
>-  - clock-names: Must include "main" and "dma", "arb" is for multi-master that
>-    one bus has more than two i2c controllers, if enable have-pmic need include
>-    "pmic" extra.

snip

>+properties:
>+  compatible:
>+    oneOf:
>+      - const: mediatek,mt2712-i2c
>+      - const: mediatek,mt6577-i2c
>+      - const: mediatek,mt6589-i2c
>+      - const: mediatek,mt7622-i2c
>+      - const: mediatek,mt8168-i2c
>+      - const: mediatek,mt8173-i2c
>+      - const: mediatek,mt8183-i2c
>+      - const: mediatek,mt8186-i2c
>+      - const: mediatek,mt8192-i2c
>+      - items:
>+          - enum:
>+              - mediatek,mt7629-i2c
>+              - mediatek,mt8516-i2c
>+          - const: mediatek,mt2712-i2c
>+      - items:
>+          - enum:
>+              - mediatek,mt2701-i2c
>+              - mediatek,mt6797-i2c
>+              - mediatek,mt7623-i2c
>+          - const: mediatek,mt6577-i2c
>+      - items:
>+          - enum:
>+              - mediatek,mt8195-i2c
>+          - const: mediatek,mt8192-i2c
>+
>+  reg:
>+    items:
>+      - description: Physical base address
>+      - description: DMA base address
>+
>+  interrupts:
>+    maxItems: 1
>+
>+  clocks:
>+    minItems: 1
>+    items:
>+      - description: Main clock for I2C bus
>+      - description: Clock for I2C via DMA
>+      - description: Bus arbitrator clock
>+      - description: Clock for I2C from PMIC
>+
>+  clock-names:
>+    minItems: 1
>+    items:
>+      - const: main
>+      - const: dma
>+      - const: arb
>+      - const: pmic

I read "clock-names: Must include "main" and "dma"" from i2c-mt65xx.txt.
Does it means that we should have at least 2 clock-names (minItems: 2)?

Thanks,
Miles

>+
>+  clock-div:
>+    $ref: /schemas/types.yaml#/definitions/uint32
>+    description: Frequency divider of clock source in I2C module
>+
>+  clock-frequency:
>+    default: 100000
>+    description:
>+      SCL frequency to use (in Hz). If omitted, 100kHz is used.
>+
>+  mediatek,have-pmic:
>+    description: Platform controls I2C from PMIC side
>+    type: boolean
>+
>+  mediatek,use-push-pull:
>+    description: Use push-pull mode I/O config
>+    type: boolean
>+
>+  vbus-supply:
>+    description: Phandle to the regulator providing power to SCL/SDA
>+
>+required:
>+  - compatible
>+  - reg
>+  - clocks
>+  - clock-names
>+  - clock-div
>+  - interrupts
>+
>+unevaluatedProperties: false
>+
>+examples:
>+  - |
>+    #include <dt-bindings/interrupt-controller/arm-gic.h>
>+    #include <dt-bindings/interrupt-controller/irq.h>
>+
>+    i2c0: i2c@1100d000 {
>+      compatible = "mediatek,mt6577-i2c";
>+      reg = <0x1100d000 0x70>, <0x11000300 0x80>;
>+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
>+      clocks = <&i2c0_ck>, <&ap_dma_ck>;
>+      clock-names = "main", "dma";
>+      clock-div = <16>;
>+      clock-frequency = <400000>;
>+      mediatek,have-pmic;
>+
>+      #address-cells = <1>;
>+      #size-cells = <0>;
>+    };
>diff --git a/MAINTAINERS b/MAINTAINERS
>index ee0b5a70aff1..28a17d4c8d12 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -12361,7 +12361,7 @@ MEDIATEK I2C CONTROLLER DRIVER
> M:	Qii Wang <qii.wang@mediatek.com>
> L:	linux-i2c@vger.kernel.org
> S:	Maintained
>-F:	Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>+F:	Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> F:	drivers/i2c/busses/i2c-mt65xx.c
> 
> MEDIATEK IOMMU DRIVER
>-- 
>2.35.1
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
