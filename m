Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC0FEB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhcKZLjWrDNttxGmNBxY3JBPC1dw1l/gq6LRekbNzq8=; b=pPRkZobSI6NCrE+kKPpOiC2NlA
	uQ7U7nr+gOKlCA78TllyhnEEWYtev9XpILCkx/BZLdnQVug3aZ+/Vtn6FET4fysmSjT9LCNi3BjMf
	lIA0ZOwpEtSvdnxYnAdT5csW1C8yhvRF6ovwmgzWbl7EJnO/OYAiyEY1ZxzNwsq/UOok17gzwlqYd
	1i76YlhDJN9cB7V0ntAiAM9pOTkoRoLMtS3TuIWR4qQhhhhhfMwvRznP7u+9XwcFuudNK0WGvYE4K
	hcrcwF4bbKNGOauvVBsS3Vwufo9i6iBFfFSsAkhIlrEO4Fl8zbQwiQbyopTgblqSw09QQitr2GpOt
	fR2zTBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEtDI-001Ncz-39;
	Thu, 29 Jun 2023 15:05:40 +0000
Received: from mail-il1-f170.google.com ([209.85.166.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEtDF-001Nc0-2i;
	Thu, 29 Jun 2023 15:05:39 +0000
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-34271602c32so3317305ab.0;
        Thu, 29 Jun 2023 08:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688051135; x=1690643135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhcKZLjWrDNttxGmNBxY3JBPC1dw1l/gq6LRekbNzq8=;
        b=f28dud5sd0+Z9TdGYXRuIDFnQg5Ioc49BgDCppNaS11ypB1vxxYrgmaGNhZ2PbB5dm
         yrlkj+/8SKdoVl8G0VM9gQWCVmTY9tXkDlsH/SLOOpi4YsJ029MGWytj68GYkrSCyXse
         tRwasZGR97Peb4A4Ja/druBsJJvRrz4NbDsSPisbWYC8j+XC6uXDoejbCU/VcypgaCDx
         SYscSDWkT2e9FbpyKOnH1MVjkokrc5vVBPmPhkPFq2NT3kpyClg9dfLeRzBhMBl77wYZ
         0dOq1R191A89288AiMp5SzdG6aacA3tl1baDmebp2ibJCn3dsWuPyGn4I+OM3o29zdOX
         0elg==
X-Gm-Message-State: AC+VfDzX4ZNiANJoVhStlOpPDso7S/KRZOmFujU4Z7htPWpEGsRmk6JG
	DAFYPGZTzddbKq3Jv6lWwA==
X-Google-Smtp-Source: ACHHUZ5/ubSHnOOsJs8hFdVdPR5AB9dDU59w9AQGzatEGCNhG/K02sYj6XVgHiA3uc2Ij1YRTnGiCw==
X-Received: by 2002:a92:d08a:0:b0:345:8373:4ca8 with SMTP id h10-20020a92d08a000000b0034583734ca8mr15786460ilh.27.1688051135318;
        Thu, 29 Jun 2023 08:05:35 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id g6-20020a056638060600b0042b144abf71sm53204jar.179.2023.06.29.08.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 08:05:31 -0700 (PDT)
Received: (nullmailer pid 2973007 invoked by uid 1000);
	Thu, 29 Jun 2023 15:05:28 -0000
Date: Thu, 29 Jun 2023 09:05:28 -0600
From: Rob Herring <robh@kernel.org>
To: Maso Huang <maso.huang@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Ren Zhijie <renzhijie2@huawei.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: mediatek,mt7986-afe: add audio
 afe document
Message-ID: <20230629150528.GA2961718-robh@kernel.org>
References: <20230626023501.11120-1-maso.huang@mediatek.com>
 <20230626023501.11120-8-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626023501.11120-8-maso.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_080537_873460_B823C060 
X-CRM114-Status: GOOD (  16.35  )
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

On Mon, Jun 26, 2023 at 10:35:01AM +0800, Maso Huang wrote:
> Add mt7986 audio afe document.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt7986-afe.yaml   | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
> new file mode 100644
> index 000000000000..257327a33ea1
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
> +      - const: aud_bus_ck
> +      - const: aud_26m_ck
> +      - const: aud_l_ck
> +      - const: aud_aud_ck
> +      - const: aud_eg2_ck
> +      - const: aud_sel
> +      - const: aud_i2s_m

'aud_' is redundant.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents
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
> +        clock-names = "aud_bus_ck",
> +                      "aud_26m_ck",
> +                      "aud_l_ck",
> +                      "aud_aud_ck",
> +                      "aud_eg2_ck";
> +        assigned-clocks = <&topckgen CLK_TOP_A1SYS_SEL>,
> +                          <&topckgen CLK_TOP_AUD_L_SEL>,
> +                          <&topckgen CLK_TOP_A_TUNER_SEL>;
> +        assigned-clock-parents = <&topckgen CLK_TOP_APLL2_D4>,
> +                                 <&apmixedsys CLK_APMIXED_APLL2>,
> +                                 <&topckgen CLK_TOP_APLL2_D4>;
> +    };
> +
> +...
> -- 
> 2.18.0
> 

