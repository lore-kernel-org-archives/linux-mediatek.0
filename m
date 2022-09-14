Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8A7ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWCLT4mrR4KGKKP0iQyb4YEULuHXBqGlF7qky6E+CY8=; b=hDSpByEZ4KB7GAeYWEfyTKNjkL
	E6Vh/gu2EzSa13Jr6vYlJ3RMvXnA6UFTuP/pE1q93uQPIasWzOJ00fVIIzFjUBRcqecQH0lI7mQdG
	VnhfwesQ079EZ+eGDrWeiCilG1tGDVzjCAXmaHf1ROIsJiffk0PjU3PLL2/8yIPRkUn2NJmbO7wNf
	TrCu61M0WuzJmWfpbXusBkdIJsSZeVw+HoYgKMfdTHafTplupw1O1zj+zUj03p5a2CgGMlx5ehtKb
	HpmmZF0ijIXkCHLovR6/+sp3qTw8OxQmjmLHxXNOlzlGVmvYCSid3Cql2ij/0qDjrLHDlvq/9yKQx
	jTP8zaHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRMd-00H8BS-0L; Wed, 14 Sep 2022 12:19:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRMO-00H7Xd-Sl; Wed, 14 Sep 2022 12:19:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA1F56602024;
	Wed, 14 Sep 2022 13:19:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663157953;
	bh=DCleAYfEI4FJICAKJmFAzxyRVAsE5kyhf9NIXG8/TQg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iLNpgK4Z8geWBsieZdhoFb89uWkA+E0sHPCj139QVypsVXlxeCsTgUOj/UNUgt7Ih
	 Prb1DDFgDgnfvWFu15+3ZWQJ681MbW/Wz44S5Z63Jr9NQePTvxKaphp2dUWUxiooTC
	 5ayh0D2LyUEKhfCULmEsUC/5wP80dzkhDG8RZlmoygwlWjTOy3uapatuQ75hSV8sd0
	 49Sopl5KuwI2m7dxKaXbYgpyG/s6Y8LZliDZJj3a1NqFcXsN19/ttr32ZRrZov5Y7r
	 JVjGbP0eCFFNi1bzZTlQOqD+jwbUvI8K/jDtAW9GIaHLSoVK/wApxUBxRjcrN9mc3C
	 htufRQwrpSmXA==
Message-ID: <716d6471-f0e2-489e-5f9e-9e38e9e7953a@collabora.com>
Date: Wed, 14 Sep 2022 14:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9,2/7] dt-bindings: thermal: Add dt-binding document for
 LVTS thermal controllers
Content-Language: en-US
To: bchihi@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
 daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220817080757.352021-1-bchihi@baylibre.com>
 <20220817080757.352021-3-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220817080757.352021-3-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_051921_256811_7EFC8EF6 
X-CRM114-Status: GOOD (  17.94  )
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

Il 17/08/22 10:07, bchihi@baylibre.com ha scritto:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> Add dt-binding document for mt8192 and mt8195 LVTS thermal controllers.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Co-developed-by: Balsam CHIHI <bchihi@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>   .../thermal/mediatek,lvts-thermal.yaml        | 152 ++++++++++++++++++
>   1 file changed, 152 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> new file mode 100644
> index 000000000000..31d9e220513a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoC LVTS thermal controller

title: MediaTek SoC Low Voltage Thermal Sensor (LVTS)

> +
> +maintainers:
> +  - Yu-Chia Chang <ethan.chang@mediatek.com>
> +  - Ben Tseng <ben.tseng@mediatek.com>
> +
> +description: |

description:
   LVTS is a thermal management architecture composed of three subsystems,
   a Sensing device - Thermal Sensing Micro Circuit Unit (TSMCU),
   a Convertor - Low Voltage Thermal Sensor convertor (LVTS), and
   a Digital controller (LVTS_CTRL).

> +  LVTS (Low Voltage Thermal Sensor).
> +  The architecture will be first used on mt8192 and mt8195.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8192-lvts-ap
> +      - mediatek,mt8192-lvts-mcu
> +      - mediatek,mt8195-lvts-ap
> +      - mediatek,mt8195-lvts-mcu
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +    description: LVTS instance registers.

This description looks obvious, as it doesn't really say anything "new"...
I would rather drop it.

> +
> +  interrupts:
> +    maxItems: 1
> +    description: LVTS instance interrupts.

Same here

> +
> +  clocks:
> +    maxItems: 1
> +    description: LVTS instance clock.

and here.

> +
> +  resets:
> +    maxItems: 1
> +    description: |
> +      LVTS instance SW reset for HW AP/MCU domain to clean temporary data
> +      on HW initialization/resume.

What about something like...

   resets:
     items:
       - description: LVTS reset for clearing temporary data on AP/MCU

> +
> +  nvmem-cells:
> +    minItems: 1
> +    maxItems: 2
> +    description: Calibration efuse data for LVTS

   nvmem-cells:
     minItems: 1
     items:
       - description: Calibration eFuse data for LVTS
       - description: Additional eFuse data (?)


> +
> +  nvmem-cell-names:
> +    minItems: 1
> +    maxItems: 2
> +    description: Calibration efuse cell names for LVTS

Actually, maxItems is not really two, but it depends on how many
eFuse arrays / nvmem cells we have for each SoC, so I was thinking...

...what about doing something like

   nvmem-cell-names:
     minItems: 1
     items:
       pattern: 'lvts-calib-data[0-9]+$'

and then,
   if:
     properties:
       compatible:
         contains:
           enum:
             - mediatek,blahblah-something
   then:
     properties:
       nvmem-cell-names:
         maxItems: 2 (or 3, 4, 5...)

P.S.: I haven't tried any binding check on the proposed lines.

Krzysztof, any opinions on that?

Regards,
Angelo




