Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD552C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 03:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnrJtMvN00qVkQJICmhAio2m1hZ2SZytBwAr0mS38Ts=; b=jY9YoqT8EuZEkX
	pXvKZkeITHsG8a5+POkqhEQpveoz7foc2ryQ9kWEgW2CvAV6rY+1/Wpv7sOT1HM0tRTZPG3fmT/yj
	t3sjVVGD/UxzUkSTjyFzJlQQHsxEuQ7EOvVb5tLqJa7xZKp7YvsXLr8+rowe3eEtl8ropOnqSFI3I
	Hju1rjfshPVZUE7zY8PhO0lLYL6dDT/HPA29nc29v7pSgIHWuk4ANLKrXGwG9smpcVh8q0JlFWhvi
	4rHmFguvbUo6weQ5DF411xWvAiM+cWLH8y6VG060jmX/EZL2BvwpJukNfxLvImP4rDfr+C/VAtpju
	twszq0uw9EeqZbP+SDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntLLD-006gjk-4Q; Tue, 24 May 2022 03:36:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntLL1-006ggz-Jm; Tue, 24 May 2022 03:36:05 +0000
X-UUID: f8a3b8b27c944ca881deb86ad5ca460f-20220523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BL3V6J5ELia3NsOC0SmWFijj//cotaym5VCOFo4stVk=; 
 b=bS2V2zXa1mYaOXlI0/vkFifnZ5z6d0EssJvswz8gShf3WtrbO/JYc1QQpvg9vh8947LNHPOrLA2CCyg0eNobhUZNv2ypL7ND4a29s280FrgUE71nmEHY+4IKyep592VDTO9jxdrG/1Q73HLSwBppmoj0HS2S9jy8lH7KMmYD9r0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:6caa1ffa-ea18-4108-b819-bef744fd707e, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:2a19b09, CLOUDID:3c1852e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: f8a3b8b27c944ca881deb86ad5ca460f-20220523
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 690259051; Mon, 23 May 2022 20:35:58 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 20:35:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 11:35:55 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 24 May 2022 11:35:48 +0800
Message-ID: <1998a59df3b27fbeb0ca7945925e47336977bcd5.camel@mediatek.com>
Subject: Re: [PATCH v10 02/21] dt-bindings: mediatek,dp: Add Display Port
 binding
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, "Vinod
 Koul" <vkoul@kernel.org>, Helge Deller <deller@gmx.de>, CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>
Date: Tue, 24 May 2022 11:35:46 +0800
In-Reply-To: <20220523104758.29531-3-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-3-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_203603_747161_C8837669 
X-CRM114-Status: GOOD (  20.34  )
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

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional
> difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 99
> +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> new file mode 100644
> index 000000000000..36ae0a6df299
> --- /dev/null
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: 
> http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Port Controller
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  Device tree bindings for the MediaTek (embedded) Display Port
> controller
> +  present on some MediaTek SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-dp-tx
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: faxi clock
> +
> +  clock-names:
> +    items:
> +      - const: faxi
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input endpoint of the controller, usually
> dp_intf
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the controller
> +
> +  max-lanes:
> +    maxItems: 1
> +    description: maximum number of lanes supported by the hardware
> +
> +  max-linkrate:
> +    maxItems: 1
> +    description: maximum link rate supported by the hardware
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ports
> +  - max-lanes
> +  - max-linkrate
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +    edp_tx: edp_tx@1c500000 {
'edp_tx: ' can be removed

> +        compatible = "mediatek,mt8195-dp-tx";
> +        reg = <0 0x1c500000 0 0x8000>;
reg = <0x1c500000 0x8000>;
#address-cells, #size-cells are both 1 by default

> +        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
> +        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&edp_pin>;
> +        max-lanes = /bits/ 8 <4>;
> +        max-linkrate = /bits/ 8 <0x1e>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                edp_in: endpoint {
> +                    remote-endpoint = <&dp_intf0_out>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                edp_out: endpoint {
> +                	remote-endpoint = <&panel_in>;
> +                };
> +            };
> +        };
> +    };
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
