Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE5BC27C75
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLpfdpwl/XpjJCDP4jmvd1f/v2WhJs+NihgWVkKAhoI=; b=eAi9Qiavvc18Zhi5AG4GmJC++A
	azNjgMzm/8erk/11FWpxfhe1+2rt5Lp+oqXy8kqcBb1q3cTf6qjLFgO9xmSsL0hVdyTpLdbQeHh0j
	vYIyyeejtiJjT0Amqj3VmZimtZEPS1ExCEcm9PD+KB1Mcp5BrN+pCuMuwL6+UFD9nUoz53ZevQo1+
	T4i7/uBh3LZSWEr8uxS0cozbnDS+zJ8fXo2VeD7iH1SIPuKvux+t1DdUVU1x1mmyn4oRx/yliAD5Y
	jaWNNgS5gSJipCjggmNgB14NsquWJ8IWKQEQaPkQAgtTAvNwKm/9alTRDjQJPSc17LSZI3a0s1j2m
	qEeWSt9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHI5s-0000000BMuW-35WZ;
	Wed, 12 Jun 2024 07:08:29 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHI5o-0000000BMsN-3Tjj;
	Wed, 12 Jun 2024 07:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718176103;
	bh=//Og3yNNct5s+qvAY63P4nOlV4F+BI4Wqr+wdE+gKRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W+CSOz6RWOhjmtt7FonzKe31KmI+0DaHUCNMbXYudiD+rAs6TkevF7et0NPNYaU0X
	 SxyExyd2eYRO7ieAQd+VWfmvW6Cz3cjYAbtU5RoIDcgc7+QsX7vsYAf4YuE0W43/Mn
	 MNBz0LNtCNQZWq9Jd3ZgYI7SLbhaLF+upoFeLzh/8TlH6RjR/W0XRr0HHwmBKj93XH
	 bQexNVFcMf+t39+lrMvIMY/HzqKRgzTgSrstY6BU1yi35TE4r874cZ61McR9xQlMkq
	 DlUK58AkWirolwOfkHDKlcjEN3jN+AsZUaljcMcik0Wokw60M+wpF58APSAHUjq6XS
	 SqU1oUksPYYbQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6FC1D3780016;
	Wed, 12 Jun 2024 07:08:21 +0000 (UTC)
Message-ID: <8621af0e-a7fc-4df3-a887-add23aed9c10@collabora.com>
Date: Wed, 12 Jun 2024 09:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: dt-bindings: i2c: add Giantec GT97xx VCM
To: Zhi Mao <zhi.mao@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hans de Goede <hdegoede@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 shengnan.wang@mediatek.com, yaya.chang@mediatek.com, yunkec@chromium.org,
 10572168@qq.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240612012019.19078-1-zhi.mao@mediatek.com>
 <20240612012019.19078-2-zhi.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240612012019.19078-2-zhi.mao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_000825_030883_530C6984 
X-CRM114-Status: GOOD (  13.63  )
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

Il 12/06/24 03:20, Zhi Mao ha scritto:
> Add YAML device tree binding for GT9768 & GT9769 VCM,
> and the relevant MAINTAINERS entries.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> ---
>   .../bindings/media/i2c/giantec,gt9769.yaml    | 55 +++++++++++++++++++
>   1 file changed, 55 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml b/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
> new file mode 100644
> index 000000000000..92d603acc53c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/giantec,gt9769.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Giantec Semiconductor, Crop. GT9768 & GT9769 Voice Coil Motor (VCM)
> +
> +maintainers:
> +  - Zhi Mao <zhi.mao@mediatek.com>
> +
> +description:
> +  The Giantec GT9768 & GT9769 is a 10-bit DAC with current sink capability.
> +  The DAC is controlled via I2C bus that operates at clock rates up to 1MHz.
> +  This chip integrates Advanced Actuator Control (AAC) technology
> +  and is intended for driving voice coil lens in camera modules.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - giantec,gt9768

Can't you simply add the "giantec,gt9768" compatible to dongwoon,dw9768.yaml?

Regards,
Angelo



