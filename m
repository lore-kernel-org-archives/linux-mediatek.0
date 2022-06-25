Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F29C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jun 2022 01:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3M3fT17Da8PNloP1qIYqfaRAbZfs8bcaEupyjPOPXg=; b=c9kCZSUUNwTjhKCPAllRVkwQXm
	mI6pA6JCboeBjRQvC4I5Nw/h8tAaXoZI3WJKmfUZ5/jLBwTJZ2ci/4aV+poEOutmzfK9aO4KnAvUm
	WfbF/rSaQBwUyHrWOo0+0e2COLJOYvIBxBNUVRK0NaWHXL1wrRKPrQv4ITKwenaEw7EQDXrpIAyKu
	z0aqDWNKSmhREMsrQWsZJIHjG3eeG8ELPCtGlepwV0N7PyByDWZGH3AcMkQeyH3A8axb5hLwYhBgn
	sMpJqo2Rz/C5LWLNjbxN8FA7jlnOpL3KdlMzk+LTUftUQcVn1RU9isA3VVLG3Lnu34XbHQDqA9pRS
	FufFZTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4uDs-004IJX-3j; Sat, 25 Jun 2022 01:04:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4uDp-004IIr-Af; Sat, 25 Jun 2022 01:04:27 +0000
X-UUID: af40779b6353450d900cedec05c5db93-20220624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:d90863b9-bfeb-467b-8518-a5eb53ce25e0,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:b14ad71,CLOUDID:7d0d85d8-850a-491d-a127-60d9309b2b3e,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: af40779b6353450d900cedec05c5db93-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 22608659; Fri, 24 Jun 2022 18:04:21 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 17:54:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Jun 2022 08:54:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Sat, 25 Jun 2022 08:54:18 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <peterwu.pub@gmail.com>
CC: <alice_chen@richtek.com>, <broonie@kernel.org>, <chiaen_wu@richtek.com>,
	<chunfeng.yun@mediatek.com>, <cy_huang@richtek.com>,
	<daniel.thompson@linaro.org>, <deller@gmx.de>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <gregkh@linuxfoundation.org>,
	<heikki.krogerus@linux.intel.com>, <jic23@kernel.org>,
	<jingoohan1@gmail.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<lars@metafoo.de>, <lee.jones@linaro.org>, <lgirdwood@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux@roeck-us.net>, <matthias.bgg@gmail.com>, <pavel@ucw.cz>,
	<robh+dt@kernel.org>, <sre@kernel.org>, <szunichen@gmail.com>
Subject: Re: [PATCH v3 02/14] dt-bindings: power: supply: Add Mediatek MT6370 Charger
Date: Sat, 25 Jun 2022 08:54:18 +0800
Message-ID: <20220625005418.7565-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220623115631.22209-3-peterwu.pub@gmail.com>
References: <20220623115631.22209-3-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_180425_400663_B200E92F 
X-CRM114-Status: GOOD (  17.30  )
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

Hi ChiaEn,

> Add Mediatek MT6370 Charger binding documentation.

s/Mediatek/MediaTek/

Would you mind fix that for the series?

cheers,
Miles

> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> v3
> - Add items and remove maxItems of io-channels
> - Add io-channel-names and describe each item
> - Add "unevaluatedProperties: false" in "usb-otg-vbus-regulator"
> - Rename "enable-gpio" to "enable-gpios" in "usb-otg-vbus-regulator"
> ---
>  .../power/supply/mediatek,mt6370-charger.yaml      | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> new file mode 100644
> index 0000000..f138db6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6370 Battery Charger
> +
> +maintainers:
> +  - ChiaEn Wu <chiaen_wu@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-charger
> +
> +  interrupts:
> +    description: |
> +      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
> +      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
> +      are required.
> +    items:
> +      - description: BC1.2 done irq
> +      - description: usb plug in irq
> +      - description: mivr irq
> +
> +  interrupt-names:
> +    items:
> +      - const: attach_i
> +      - const: uvp_d_evt
> +      - const: mivr
> +
> +  io-channels:
> +    description: |
> +      Use ADC channel to read VBUS, IBUS, IBAT, etc., info.
> +    minItems: 1
> +    items:
> +      - description: |
> +          VBUS voltage with lower accuracy (+-75mV) but higher measure
> +          range (1~22V)
> +      - description: |
> +          VBUS voltage with higher accuracy (+-30mV) but lower measure
> +          range (1~9.76V)
> +      - description: the main system input voltage
> +      - description: battery voltage
> +      - description: battery temperature-sense input voltage
> +      - description: IBUS current (required)
> +      - description: battery current
> +      - description: |
> +          regulated output voltage to supply for the PWM low-side gate driver
> +          and the bootstrap capacitor
> +      - description: IC junction temperature
> +
> +  io-channel-names:
> +    items:
> +      - const: vbusdiv5
> +      - const: vbusdiv2
> +      - const: vsys
> +      - const: vbat
> +      - const: ts_bat
> +      - const: ibus
> +      - const: ibat
> +      - const: chg_vddp
> +      - const: temp_jc
> +
> +  usb-otg-vbus-regulator:
> +    type: object
> +    description: OTG boost regulator.
> +    unevaluatedProperties: false
> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +    properties:
> +      enable-gpios:
> +        maxItems: 1
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - io-channels
> +
> +additionalProperties: false
> +
> +...
> -- 
> 2.7.4
> 
> 

