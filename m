Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0464FC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 10:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRF15OmuH5G7KUYNTQF7RNwOGE0VlK7B7vWHEwP4MO4=; b=TG/xE5PuQ0bnTwO29OlKA+Yck9
	8wNpSJ2Qa1a3Sp5c3OaoPzU4kgFV2Tj14dJbdfRjes+z+D2uZtwpHPGEigkBgtZqJNXsdytdfbhcZ
	SPH1X9ofYNjVSG7AZoI6ZAyqiLL0npy7sWswh+G9hRZhbeYeJmdYARZPYwQTd4O16DDo8nK4mhkbp
	Qco751S0t8+9owD+9EMfwpJ9GzlgsZSXHsXLDFbSXkuZl6TmEZHbp9QdDxxSVRpaixO0fxmp3TThC
	DUJM+wbrlo+Q/U84oFACdML9wNpit3gtsSlLcGBWcANwTTch7z5wcTOlv86MHxC8S/Shn/4FnYXmq
	q65Mkltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH13D-008TnN-PV; Thu, 28 Jul 2022 10:47:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH12z-008TgM-Uz; Thu, 28 Jul 2022 10:47:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4141D6601B41;
	Thu, 28 Jul 2022 11:47:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659005232;
	bh=52n7PHwmDL6kd/nck7jvKAORL1LBHXn0wmr3omuwlBY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AFvQ9LOuwaw0rEK8BdCFvFrI6MdC7fwdOpvPQQ9YZTCAUefSKlOMaEnCMKmsOMA/h
	 mvIavrISnspLyNInaQ2/X3/bLjCdaGCVV1f6/7iVcBwTaaaTNgk3eCFeFzyPRyVzHs
	 tzKupXQkpH93I7E6mSVwpD1lKfEdnbmwozdWJEbaFfggd04L0dUJ3HTsmD9T0SBuoI
	 MpGOV515alobiIHhwlS9TYyEBHcNMaIZwwpYYR4I4RYrNq68FKKW/rOtvDTYGeO8T8
	 6RCE5ZBJZZwrDmenZz6Vq375eMkKcEAdwhRE1YJrczdWD1EcnxnreKMYz2XDfqDNFu
	 hwAHD1WZXEjHA==
Message-ID: <caa39600-d56f-9748-9a93-aa9be2f88924@collabora.com>
Date: Thu, 28 Jul 2022 12:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: Add support for
 mt8188
Content-Language: en-US
To: Hui Liu <hui.liu@mediatek.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 jianguo.zhang@mediatek.com, zhiyong.tao@mediatek.com,
 sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220728084951.22102-1-hui.liu@mediatek.com>
 <20220728084951.22102-2-hui.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220728084951.22102-2-hui.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_034718_243731_16C60D44 
X-CRM114-Status: GOOD (  16.76  )
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

Il 28/07/22 10:49, Hui Liu ha scritto:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> Add the pinctrl header file on MediaTek mt8188.
> Add the new binding document for pinctrl on MediaTek mt8188.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>
> ---
>   .../pinctrl/mediatek,mt8188-pinctrl.yaml      |  224 +++
>   .../pinctrl/mediatek,mt8188-pinfunc.h         | 1280 +++++++++++++++++
>   2 files changed, 1504 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
>   create mode 100644 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
> new file mode 100644
> index 000000000000..87c72b621188
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
> @@ -0,0 +1,224 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8188 Pin Controller
> +
> +maintainers:
> +  - Hui Liu <hui.liu@mediatek.com>
> +
> +description: |
> +  The MediaTek's MT8188 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8188-pinctrl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: |
> +      Number of cells in GPIO specifier, should be two. The first cell
> +      is the pin number, the second cell is used to specify optional
> +      parameters which are defined in <dt-bindings/gpio/gpio.h>.
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +

Please allow to specify gpio names

   gpio-line-names: true

after which:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +  reg:
> +    items:
> +      - description: gpio registers base address
> +      - description: rm group io configuration registers base address
> +      - description: lt group io configuration registers base address
> +      - description: lm group io configuration registers base address
> +      - description: rt group io configuration registers base address
> +      - description: enit registers base address
> +

