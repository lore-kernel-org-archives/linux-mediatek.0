Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF71AC27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 10:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMDDFlnnLa8SfHTh9uhQxrQSpi+SmBhf1UoDcoVn3Uk=; b=JHnnf9s3apZFHj1gCIBz36TopQ
	9e+H13aWTzqdwLWSg4R0JCgscYP9pL9/9i2Jsyh/qo9ElCQ3ZAx1wyYEWQeUoSt2Hvy/K7t14fjo3
	9uJdBWfHGa+Nsw7d6CLPb1uDEMb8ZXpeHSmwkD7lPhuq5ynKC8utLzTfCCXt9aBlKR+1+jxWoRR5x
	pAbbbZGzyaC1OAdMzRr3KUXHAm0pJNJjyHfwpN71wOtG+8RNgRJnJqcSpyTD9fayxVC3DilxdUYcO
	tiN9FSkesjZFX0PLXtTIHfXwz8ut77T/tUZ1jNGKZCA0KInZ5XOEGgMdByOvl6Ef3Fpncjw8NgVs2
	QTR5fkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWT1-0000000ET1h-1vei;
	Tue, 18 Jun 2024 10:53:35 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWSx-0000000ET0L-1LqE;
	Tue, 18 Jun 2024 10:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718708009;
	bh=TKqnk7jdCrlyYi8lHm4Cy6BpCu+PEPISCKnloXabxsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T3sDvnowOuc5j5SAyXkZYuRQqtjLCzeuWXDNu7JM6UfW/5aAEUGEmcGCnl/+1Dzu2
	 e1NcDsb5dMNpo7tCs1zonM0kgbCKK4EnshAYLhBUeitHge+f0tRWbyvgY8lPhNsIgW
	 eUqe69fgQOrCQghppGrnFYBrq94GUIa62Hhvz2oi+ihsNPD71DLErz1xNYodqdAtk2
	 68RbHixeRono48IWOIuho6U1ECDo2zkPXTY65E8vBeIyhtCm4it8idgS7WKM5skXUl
	 nRq7etEn7hdrTlwoL17snOv7f7nSkZJiCFtUDXNCgqxUg3sV3Rvp4c+TLOvr634fSR
	 beUrZULdrfjtQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BC8443781183;
	Tue, 18 Jun 2024 10:53:28 +0000 (UTC)
Message-ID: <51b7bb8d-801b-4c2f-8650-40162bf08e13@collabora.com>
Date: Tue, 18 Jun 2024 12:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: mt6358: Convert to dtschema
To: Kartik Agarwala <agarwala.kartik@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240617-mt6358-v2-0-5d9f0e99941e@gmail.com>
 <20240617-mt6358-v2-1-5d9f0e99941e@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240617-mt6358-v2-1-5d9f0e99941e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_035331_559553_70E87A26 
X-CRM114-Status: GOOD (  18.25  )
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

Il 17/06/24 14:28, Kartik Agarwala ha scritto:
> Convert from txt to dtschema
> ---
>   .../devicetree/bindings/sound/mediatek,mt6358.yaml | 51 ++++++++++++++++++++++
>   Documentation/devicetree/bindings/sound/mt6358.txt | 26 -----------
>   2 files changed, 51 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
> new file mode 100644
> index 000000000..336d2d969
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt6358.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6358 Audio Codec

title: MediaTek MT6358/MT6366 Audio Codec

> +
> +maintainers:
> +  - Kartik Agarwala <agarwala.kartik@gmail.com>

   - Jiaxin Yu <jiaxin.yu@mediatek.com>


> +
> +description:
> +  The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
> +  For more detail, please visit Mediatek PMIC wrapper documentation.
> +  Must be a child node of PMIC wrapper.
> +

   The communication between MT6358 or MT6366 and SoC happens through
   the MediaTek PMIC Wrapper.
   For more detail, please visit MediaTek PMIC wrapper documentation:
   Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
   Must be a child node of a PMIC.

> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt6358-sound
> +      - const: mediatek,mt6366-sound

This should be an enum.

> +      - items:
> +          - const: mediatek,mt6366-sound
> +          - const: mediatek,mt6358-sound
> +
> +  Avdd-supply:
> +    description: power source of AVDD
> +
> +  mediatek,dmic-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Indicates how many data pins are used to transmit two channels of PDM
> +      signal. 0 means two wires, 1 means one wire. Default value is 0.
> +    default: 0
> +    enum:

enum: [ 0, 1 ]

> +      - 0
> +      - 1
> +

Regards,
Angelo

> +required:
> +  - compatible
> +  - Avdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    audio-codec {
> +        compatible = "mediatek,mt6366-sound";
> +        Avdd-supply = <&mt6358_vaud28_reg>;
> +        mediatek,dmic-mode = <0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/sound/mt6358.txt b/Documentation/devicetree/bindings/sound/mt6358.txt
> deleted file mode 100644
> index fbe9e55c6..000000000
> --- a/Documentation/devicetree/bindings/sound/mt6358.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Mediatek MT6358 Audio Codec
> -
> -The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
> -For more detail, please visit Mediatek PMIC wrapper documentation.
> -
> -Must be a child node of PMIC wrapper.
> -
> -Required properties:
> -
> -- compatible - "string" - One of:
> -    "mediatek,mt6358-sound"
> -    "mediatek,mt6366-sound"
> -- Avdd-supply : power source of AVDD
> -
> -Optional properties:
> -- mediatek,dmic-mode : Indicates how many data pins are used to transmit two
> -	channels of PDM signal. 0 means two wires, 1 means one wire. Default
> -	value is 0.
> -
> -Example:
> -
> -mt6358_snd {
> -	compatible = "mediatek,mt6358-sound";
> -	Avdd-supply = <&mt6358_vaud28_reg>;
> -	mediatek,dmic-mode = <0>;
> -};
> 




