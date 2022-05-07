Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61198C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpQE6kUcWiM4uDBi79PkzZ5u2VsSrOZxPF4mykoUoP0=; b=CFXul1hqOQXKo+
	48UxWnNAKoMnHoKFHuVphswQ3fBPxNoHoxB+UuPVWeIhZJz+J/cG5YXDxHURpV4yv/DBwZg1kbzFI
	fqpwjl1Ilt1UuneKmtyBsnjpGmGFc5+DVTpnfBpWIsAHmXuAxcGIpOkDDTNuzHi0zLbm2lCmqXURW
	0u0/Lu7DNNXdGDjwIeAS6YDi3M4zOXgKudhqzODTxTaR8joaGWsZZbZHTQNLCMYBKCX3NYi6EHn89
	v1kVmeobnjwvfolr+23qPLX04SAGSZxikvJgwyhuOVsQ7bG8gUpFKUd5ALWcDPoGevuUCFmSo32lD
	hDaBg9Gghqtfnu5iXoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnQav-008CYl-Es; Sat, 07 May 2022 20:00:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnQak-008CWD-BF
 for linux-mediatek@lists.infradead.org; Sat, 07 May 2022 19:59:52 +0000
Received: by mail-ej1-x62d.google.com with SMTP id z2so18480248ejj.3
 for <linux-mediatek@lists.infradead.org>; Sat, 07 May 2022 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CdoG5uiVasejnemLfedUgLlvjuPyIUBH7WuMB7uxqPM=;
 b=G8Vjn90QHh4oxbaJwezEh8X4SVtSXeFZn8VXZRUxQIu0HU1b7VGHwI7AG+kOTaDjFS
 yi8t3CePCvXmRG135Rn5jZUd0Pf6LyYi0WuHbYD2PpZga7fl7oyGrmn6MFrDhvuqEYOu
 5xZxpHJKHa77j+O5RX4Xv8H9jZgjvgFLM2zWTncqdFngFlMcF66c5aWQqI/PS9zVm1A2
 RpiMCR/KX6xO+X5w7WkaKovW1gAWSrV3pNNV2iGvAGptglr99z9bDWlhnK62MH+cD2Pc
 bYHBlSkRMm6iTkShZl3yjUGaslFLd8tceWpLTUZA6BM8nVBcF6H1ZrZlwqoWHi5ECnDt
 BJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CdoG5uiVasejnemLfedUgLlvjuPyIUBH7WuMB7uxqPM=;
 b=t7Ek+ceWwczF/fV6Qa1d1kbAbP03Rjrd8WJDiI3wuILjCGTW+66+XPnsVs+YeBJNu5
 dfZhU4vAd4SgeUjMXzTUznXZs+qVy57AhOEQjbmN4pfcfVJd9Qyvwcyj7pe4dmq8Dlxv
 HFrc5/HjdzABemu+WE2XdihjygEem7nAwGLzPokxcGNOxFGfafgL+DBcLMiMZUgIOF0W
 f7oXrEEA5jarq1NynWd+nxx3cgfmzAMXfPIhEV3vGj9mYtpT+uw3vf1inaIA6hanWRE2
 kYaB0epo3/jQdE2k+BRe+zOykJwBhMmD2/V3LfwCcm2kGaocykRLy2WBh9hBSe2UiEsg
 5ewg==
X-Gm-Message-State: AOAM532GkdnTZzxMvKNTil0/JHSzCL4RwbENqyPtLQ6FOCP+elD+/uYj
 yBT35LmOxTG4yiMkOg+pH8QrEw==
X-Google-Smtp-Source: ABdhPJxDyRdhI3lmezTH/4XlyD6pWqtW8AtiH011+LGHZ7x81uRCA7+9hB4bLPR29SliclbWIzW34w==
X-Received: by 2002:a17:906:32d5:b0:6f3:be75:8485 with SMTP id
 k21-20020a17090632d500b006f3be758485mr8393835ejk.685.1651953588123; 
 Sat, 07 May 2022 12:59:48 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 wi7-20020a170906fd4700b006f3ef214dd4sm3265880ejb.58.2022.05.07.12.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 12:59:47 -0700 (PDT)
Message-ID: <e7fe1268-8604-4d50-08be-d83bcf2e9537@linaro.org>
Date: Sat, 7 May 2022 21:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/6] dt-bindings: net: dsa: convert binding for
 mediatek switches
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220507170440.64005-1-linux@fw-web.de>
 <20220507170440.64005-2-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220507170440.64005-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_125950_412283_076A22AB 
X-CRM114-Status: GOOD (  19.61  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Greg Ungerer <gerg@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07/05/2022 19:04, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Convert txt binding to yaml binding for Mediatek switches.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3:
> - include standalone patch in mt7530 series
> - drop some descriptions (gpio-cells,reset-gpios,reset-names)
> - drop | from descriptions
> - move patternProperties above allOf
> 
> v2:
> - rename mediatek.yaml => mediatek,mt7530.yaml
> - drop "boolean" in description
> - drop description for interrupt-properties
> - drop #interrupt-cells as requirement
> - example: eth=>ethernet,mdio0=>mdio,comment indention
> - replace 0 by GPIO_ACTIVE_HIGH in first example
> - use port(s)-pattern from dsa.yaml
> - adress/size-cells not added to required because this
>   is defined at mdio-level inc current dts , not switch level
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 423 ++++++++++++++++++
>  .../devicetree/bindings/net/dsa/mt7530.txt    | 327 --------------
>  2 files changed, 423 insertions(+), 327 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/dsa/mt7530.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> new file mode 100644
> index 000000000000..a7696d1b4a8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -0,0 +1,423 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

I don't see any acks here so that part is unresolved.

Rest looks good:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
