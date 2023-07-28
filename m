Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5CEC41513
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 10:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymf83+H1cy9o0BVImR0Lm+ybdeCtm2oehII2tJRBinQ=; b=Zfsu6+9hZ+2zLLyd++mHccPKW0
	aIafhhX+sz7g7WkFAfdr+C5XSv0fQPGQwH8jooDmlTjoEUtWmS9Y9FjOcoCiVkHUGeP1naxgBf/3+
	TXYXGDKvpvkaDJ0w08fDkg1CSVnuBAJmYNCi9OMrRONE9SwkICi+z0GbHAmky+yXsR2vG22Tb5wLm
	YEvfIVwX3he7Re7uduVttygtgzHB1njwMeRVlC+jmY0UsdVr1jIr/iSjnH6KILyBDvgHk5wEVr5AG
	EAE5r+QURo6reU0LMo10cvwKNHxHnH64GR9jaLeWSWFhh7j1Bq+ioldRmSJgEt7Uwvonl/C84ae/B
	AjdKrD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKGq-002jsp-1v;
	Fri, 28 Jul 2023 10:00:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKGl-002jqb-1n;
	Fri, 28 Jul 2023 10:00:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CF73660716B;
	Fri, 28 Jul 2023 11:00:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690538422;
	bh=GfgvmH2WHbgBZoOFc/snpKhv9Aw7Q3s20trVQrjO9O0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=SbDPJ5xi+Dx76BbLhKke2U/N/r+zPI49kYVVFhkfX1Am0Lr2Fakh487y1wuZyzZG9
	 a5gqJxb9PqQR4xIk3d6YQI0qkVgBQzYkIyHDK+0jGtl80/fVLGbyGw3CIurDxZPqUB
	 wV52ePLPdYWVNOS+QWlJsNN+sOEdOerYRWxu888KWLE7V3kQ/Gt4BkTrJGEi9z6Z0l
	 rumZuZ36SkztWDOdzll+F1yeH8A9/dFixejh6AeXNhH8+f7HgYLzemrakU/hd6CLpI
	 ejDaX9C4ziofdPtjA8QyPVJQOHIBrrXhZ256ikrQjF/wnT1GaftD8aHGK0HnaU2v65
	 wtYU4i2A30QsQ==
Message-ID: <b2869bdd-04e8-262d-5d1a-4d835397360e@collabora.com>
Date: Fri, 28 Jul 2023 12:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 6/6] ASoC: dt-bindings: mediatek,mt7986-afe: add audio
 afe document
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-7-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230728090819.18038-7-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_030023_844455_06B57DC1 
X-CRM114-Status: GOOD (  17.26  )
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

Il 28/07/23 11:08, Maso Huang ha scritto:
> Add mt7986 audio afe document.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>   .../bindings/sound/mediatek,mt7986-afe.yaml   | 89 +++++++++++++++++++
>   1 file changed, 89 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
> new file mode 100644
> index 000000000000..ebb151c6400f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt7986-afe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek AFE PCM controller for MT7986
> +
> +maintainers:
> +  - Maso Huang <maso.huang@mediatek.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt7986-afe
> +      - items:
> +          - enum:
> +              - mediatek,mt7981-afe
> +              - mediatek,mt7988-afe
> +          - const: mediatek,mt7986-afe
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 5
> +    items:
> +      - description: audio bus clock
> +      - description: audio 26M clock
> +      - description: audio intbus clock
> +      - description: audio hopping clock
> +      - description: audio pll clock
> +      - description: mux for pcm_mck
> +      - description: audio i2s/pcm mck
> +
> +  clock-names:
> +    minItems: 5
> +    items:
> +      - const: bus_ck
> +      - const: 26m_ck
> +      - const: l_ck
> +      - const: aud_ck
> +      - const: eg2_ck
> +      - const: sel
> +      - const: i2s_m
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents

assigned-clocks and assigned-clock-parents are not a *required* property,
as that depends on a number of things and someone *may* want to omit it.

Besides, that's related to how the drivers interact with / setup the hardware
and not with the hardware itself... you can keep the assigned-clocks and
assigned-clock-parents in your examples, but again they're definitely not
required properties.

After fixing,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mt7986-clk.h>
> +
> +    afe@11210000 {
> +        compatible = "mediatek,mt7986-afe";
> +        reg = <0x11210000 0x9000>;
> +        interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&infracfg_ao CLK_INFRA_AUD_BUS_CK>,
> +                 <&infracfg_ao CLK_INFRA_AUD_26M_CK>,
> +                 <&infracfg_ao CLK_INFRA_AUD_L_CK>,
> +                 <&infracfg_ao CLK_INFRA_AUD_AUD_CK>,
> +                 <&infracfg_ao CLK_INFRA_AUD_EG2_CK>;
> +        clock-names = "bus_ck",
> +                      "26m_ck",
> +                      "l_ck",
> +                      "aud_ck",
> +                      "eg2_ck";
> +        assigned-clocks = <&topckgen CLK_TOP_A1SYS_SEL>,
> +                          <&topckgen CLK_TOP_AUD_L_SEL>,
> +                          <&topckgen CLK_TOP_A_TUNER_SEL>;
> +        assigned-clock-parents = <&topckgen CLK_TOP_APLL2_D4>,
> +                                 <&apmixedsys CLK_APMIXED_APLL2>,
> +                                 <&topckgen CLK_TOP_APLL2_D4>;
> +    };
> +
> +...



