Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C3CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wgDgYd1bcD2X3cXZ1z07yxsiiTFNqx0DuA084H8Mro=; b=GRbLudR24PMUzYbp0h+XhfNL0N
	ttlsmBQXxCRYMHQzdYs2PIxyFNaHI6uCqjayMlSI6KlgUoPKtk4WhKINrROj6gkMODWcL12uJl28p
	ml84fcQvEFJxCHtpg178hO+rMc30rcfvjTzEwNU9jRQ0O4NMXe2CRGdI8uefAgyEUd+Vj5UA65bxL
	+HrSrgmtoXFdLaWxsKaZNbSAy9dCj1ig6WD6BdP4VbpqL8let/yDqNRqVIODm624U9oHQ9ii29L1o
	YK6iz1Et6TS0oNkQMlwk+PTi03um0NMqph4jKMYSSNitIudcLhzNyWXAY0Z80WunyNW/nP+Sp68O9
	WKlDKJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMC1-004fwF-Fk; Tue, 08 Nov 2022 10:50:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMBq-004fts-FE; Tue, 08 Nov 2022 10:50:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id a14so20332777wru.5;
        Tue, 08 Nov 2022 02:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wgDgYd1bcD2X3cXZ1z07yxsiiTFNqx0DuA084H8Mro=;
        b=eNqLMraTJqOnuy1E2um08aqIiu4kDjD/wkQK8Hbwd75LqGM7kDyh/7lGkWaiVnSP+6
         GxD4FbleKLkQJ5uCk7Rqyyxs28WZHoXtPdhW8ZxFNXPo3Cbf+419dC3QD4aO/IcxYVbZ
         cnmQKTB4bgBW4VvU9J1ZQrTjzdohmAJjxnsBtwHmb2fWoub8YdO45fYI6EK9xWlK840X
         w3HSC2gDQThGrjOY9fYHtDZkK/tCEhSoEvO0gHhYUfP25dBVF6vPyQOPiMXfDoY4zvNE
         BPRlQjmy5OQWtrrS+/vJgssK3kjmp2rZ3ofKPZZ7SqnwyLEu5SLDZ+bqWT7o3t8STSMN
         CZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wgDgYd1bcD2X3cXZ1z07yxsiiTFNqx0DuA084H8Mro=;
        b=bOM086DDxmkSS/EEWtD3ZzmQ94r96QsPcUp6OyKb5ZrLxJTkZC8vDd6punmMALbOcO
         00kDEZFFSNMhGAjw+I89at8z3r+pCePS/e7usta8UAyyeOUICSEGRrpgUpSD6lK9GAqO
         BfPE00GjazFU9qzXbgNj76NN1OvbA7e5rELYCzDIilKJd8ir8uzikWg0K4utF+o/XwCU
         xpi4UjE9M1QHxQ4M2DHe1JOasC3gXtcY8f9Ky3l6iOVxVwvEsErq2v1EIPqVQOdEJa8W
         iCl6cwgSg2FwAdyfvBR0BEvojrhZLkCwrmHRTR3GWEKVIlKn6zjal/L33qxJSwp9C3ko
         Mygw==
X-Gm-Message-State: ACrzQf2va/Zot5aAyIdIeYXHxC60Q3Zk18JKvoMTWTF9W7cXyTJ3oCBj
	BsBIAsbotiGi9Dmo9Q9tnqw=
X-Google-Smtp-Source: AMsMyM5+TSi+bPpo6N0WWycEZ1prZ1VLdMLb2TwlKjyi9JBm+vMlGU0+IZ4gEmj4SduIcKn5wUI19Q==
X-Received: by 2002:adf:e3c1:0:b0:236:6d5d:ffa2 with SMTP id k1-20020adfe3c1000000b002366d5dffa2mr34600529wrm.557.1667904644591;
        Tue, 08 Nov 2022 02:50:44 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k4-20020a5d6e84000000b00236722ebe66sm9982506wrz.75.2022.11.08.02.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 02:50:42 -0800 (PST)
Message-ID: <585a9cbb-4df4-1c06-ecfa-3b9442f1a5e2@gmail.com>
Date: Tue, 8 Nov 2022 11:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 5/7] dt-bindings: watchdog: mediatek: Convert mtk-wdt
 to json-schema
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: nfraprado@collabora.com, angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221108033209.22751-1-allen-kh.cheng@mediatek.com>
 <20221108033209.22751-6-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221108033209.22751-6-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_025046_535539_8E5D1365 
X-CRM114-Status: GOOD (  21.95  )
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



On 08/11/2022 04:32, Allen-KH Cheng wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Convert the MediaTek watchdog bindings to schema.
> 
> The original binding only had 4 without a fallback but there is a reset
> controller on the "mediatek,mt7986-wdt", "mediatek,mt8186-wdt",
> "mediatek,mt8188-wdt" and "mediatek,mt8195-wdt" Since there is no reset
> controller for the mt6589, we remove "mediatek,mt6589-wdt" as a
> fallback.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

As I'm put as the maintainer:
Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Shall I take that through my tree or shall it go through the watchdog tree?

Regards,
Matthias

> ---
>   .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 78 +++++++++++++++++++
>   .../devicetree/bindings/watchdog/mtk-wdt.txt  | 43 ----------
>   2 files changed, 78 insertions(+), 43 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>   delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> new file mode 100644
> index 000000000000..b3d2273f323b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoCs Watchdog timer
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description:
> +  The watchdog supports a pre-timeout interrupt that fires
> +  timeout-sec/2 before the expiry.
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2712-wdt
> +          - mediatek,mt6589-wdt
> +          - mediatek,mt7986-wdt
> +          - mediatek,mt8183-wdt
> +          - mediatek,mt8186-wdt
> +          - mediatek,mt8188-wdt
> +          - mediatek,mt8192-wdt
> +          - mediatek,mt8195-wdt
> +      - items:
> +          - enum:
> +              - mediatek,mt2701-wdt
> +              - mediatek,mt6582-wdt
> +              - mediatek,mt6797-wdt
> +              - mediatek,mt7622-wdt
> +              - mediatek,mt7623-wdt
> +              - mediatek,mt7629-wdt
> +              - mediatek,mt8516-wdt
> +          - const: mediatek,mt6589-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog pre-timeout (bark) interrupt
> +
> +  mediatek,disable-extrst:
> +    description: Disable sending output reset signal
> +    type: boolean
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        watchdog@10007000 {
> +            compatible = "mediatek,mt8183-wdt";
> +            reg = <0 0x10007000 0 0x100>;
> +            interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
> +            mediatek,disable-extrst;
> +            timeout-sec = <10>;
> +            #reset-cells = <1>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> deleted file mode 100644
> index b900c85d4560..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Mediatek SoCs Watchdog timer
> -
> -The watchdog supports a pre-timeout interrupt that fires timeout-sec/2
> -before the expiry.
> -
> -Required properties:
> -
> -- compatible should contain:
> -	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> -	"mediatek,mt2712-wdt": for MT2712
> -	"mediatek,mt6582-wdt", "mediatek,mt6589-wdt": for MT6582
> -	"mediatek,mt6589-wdt": for MT6589
> -	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
> -	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> -	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
> -	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> -	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
> -	"mediatek,mt8183-wdt": for MT8183
> -	"mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
> -	"mediatek,mt8188-wdt", "mediatek,mt6589-wdt": for MT8188
> -	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> -	"mediatek,mt8192-wdt": for MT8192
> -	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
> -
> -- reg : Specifies base physical address and size of the registers.
> -
> -Optional properties:
> -- mediatek,disable-extrst: disable send output reset signal
> -- interrupts: Watchdog pre-timeout (bark) interrupt.
> -- timeout-sec: contains the watchdog timeout in seconds.
> -- #reset-cells: Should be 1.
> -
> -Example:
> -
> -watchdog: watchdog@10007000 {
> -	compatible = "mediatek,mt8183-wdt",
> -		     "mediatek,mt6589-wdt";
> -	mediatek,disable-extrst;
> -	reg = <0 0x10007000 0 0x100>;
> -	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
> -	timeout-sec = <10>;
> -	#reset-cells = <1>;
> -};

