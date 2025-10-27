Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F604CCF9E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 10:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ta9WxA2Udc+JEMvkUreWUjqMknnE8f3RwqhLdwrZlKU=; b=LaJNE0h8/abLgH
	MWn2ETZLjH4wnqYlhndYdor6TIzRvaFU1StpB4LG+dQiDPYMRmm8eBiE6DBz+b1KJ8GJ7gsWCF42j
	kgwvFFBB4qimJnnGmsEEIdmo+8Ycq+Mv0i129jjTxSX3Qr+rO3E0HUyj1r+EabzN8tdJZG/H5DATB
	07KPp7/voFoJtBNYnZ+8fPe9LiKAMJ97peh9nU+O9AKtYYd8l3TUxgzIpAGSXsu1vq56B4z++YpNl
	gcfewF5BltkD73GhDV/lIZ11iQiYGPZrz9KaKMYcfHMn+PkVQqqN9QrjhHpmdkoGdMci4cs0iPCRS
	mJOwmIRe0iviLpYQ6k8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKhd-0000000Dg86-06iV;
	Mon, 27 Oct 2025 10:43:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKha-0000000Dg7B-2O5u;
	Mon, 27 Oct 2025 10:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761561826;
	bh=dnFWroSYpgKTr53sV/u987Z7MyBid44fWzMJtS7rNbQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l7tF6X2h3MPJ5hdPR+ZmZ/oW8il+SALAIJhV77rZLNlwk3+9fORla1icaFg8wdT/e
	 RZzCuaQgV0d3W/2+PkFa1aV2KBgHmU9oPn5CXmUhr9VXhx2SGM1aHbKUXC7fd1HWH8
	 7a4KoJr9pyV04xRCqu4UhBzU8+8PwIe4NElWEnTZhF/M71+/DyqwbCbZDxDZkSXOXm
	 /viuN8U3RFjOj7kmMqKr1u+iwiCCG3v0vxYNNaTflRD7I2hBrU3YTffPW5+nlNVUNO
	 Z9bi7t6/8L9Ecxz0GmTNh8oMAGtNrADhYjye6qzRHnKP4pyTE291LHR/g8cefNsHTs
	 Uu4+LeKBXO+ew==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E02C17E12AE;
	Mon, 27 Oct 2025 11:43:46 +0100 (CET)
Message-ID: <7a8bf2e9-5033-4588-923c-53ad23c12924@collabora.com>
Date: Mon, 27 Oct 2025 11:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: thermal: mediatek: make interrupt
 only required for current SoCs
To: Frank Wunderlich <linux@fw-web.de>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mason Chang <mason-cw.chang@mediatek.com>
References: <20251026122143.71100-1-linux@fw-web.de>
 <20251026122143.71100-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251026122143.71100-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_034350_824457_E87AC391 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Balsam CHIHI <bchihi@baylibre.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 26/10/25 13:21, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Upcoming MT7987 does not have a IRQ we have to make interrupt-property only
> required for current supported SoCs.

Hmm. Thermal sensor IP with no interrupt? Looks really strange.

This is odd, because LVTS always has multiple interrupts, and if this doesn't
actually feature any, it really feels like the hardware is broken somehow.

MediaTek, can you please confirm whether the LVTS IP in MT7987 is really
like that, or can you please give the right interrupt number to Frank?

Thanks,
Angelo

> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   .../bindings/thermal/mediatek,lvts-thermal.yaml | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> index 0259cd3ce9c5..7ec9c46eef22 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -58,6 +58,16 @@ properties:
>   allOf:
>     - $ref: thermal-sensor.yaml#
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt7988-lvts-ap
> +    then:
> +      required:
> +        - interrupts
> +
>     - if:
>         properties:
>           compatible:
> @@ -75,6 +85,9 @@ allOf:
>           nvmem-cell-names:
>             maxItems: 1
>   
> +      required:
> +        - interrupts
> +
>     - if:
>         properties:
>           compatible:
> @@ -91,10 +104,12 @@ allOf:
>           nvmem-cell-names:
>             minItems: 2
>   
> +      required:
> +        - interrupts
> +
>   required:
>     - compatible
>     - reg
> -  - interrupts
>     - clocks
>     - resets
>     - nvmem-cells


