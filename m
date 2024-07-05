Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7259C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 11:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgGdrMJAOOlmaDA5n6UZ/NcHyTcSq/fRMMLBh3RpPPA=; b=BaIL+3kBGNQuuQfmH8QoO5mqkc
	enFzAZwzwSy2GpcRd5rUK9lqJDyqx7p73ALKoH8SSoxB8Su5wqx5hF8ihk7Iw1KtpvgkEUqGz6nS1
	h96Lf01jnV/yh2RcMc6HNgoJxNGAWzo8yRCAtfiqNEiyBRlbzRjCAeUIHL6tW7FA77c1TvcECfPmW
	2wXHAwmuM8JMF7y7/NraI4UFMNd/o0oX1rOsnx8OSbovYhDtKPvCpa0p4GAj53BR8mQFFhdSmRh9j
	xcJbcZxFJxKoaSyXWUIvWRwntiHWW2wr8iDLQxqYLeFEe/eGQsT412wqKcfuawsIdn8fviCPhWJ8y
	txNZ17vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPgxX-0000000FlXC-0Qpj;
	Fri, 05 Jul 2024 11:18:35 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPgxT-0000000FlTi-0AYS
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 11:18:33 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ee910d6aaeso15095611fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 04:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720178309; x=1720783109; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OgGdrMJAOOlmaDA5n6UZ/NcHyTcSq/fRMMLBh3RpPPA=;
        b=WE4RZ5iog5RJavJG7+crNEyXkR4wGWblrcdJS2pFf1eR7CsYZN/uUhCFPteiCdTK8P
         W6XLgG+8j+5zuPUOt+mh3QhDxxc3H+2/yIPBEwSsDjLUUos7n/T09zna8o5z5gXA57EC
         iUyK/qqudAfDcLxewYL/YcyG6dfU/Vng+M4XqoAlxapYQjf89s2ytZkptinVC1fv65ef
         sVUOGeqiJFg49kS6nmMzuC8TPpIWjUCvZ83ouWV5t/HHCMdJnt3y6qx+fhsvGVIkW6Nw
         zf/gXWJrzFWrvTPJ/pmViLo41lJ069dBFTYyNC4prY1rGDpuhnQ/WsxhvOQ1NwTWScyR
         I2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720178309; x=1720783109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OgGdrMJAOOlmaDA5n6UZ/NcHyTcSq/fRMMLBh3RpPPA=;
        b=F0/EuYTW+BtsM5Xlmynm6bSAq5tm+0oE+MvbtOjaaW7WQeusGZkS3n5C/Z43kQKRcL
         iZTMXdFgRGiHsNRDnYSbbhlTfRkWHAD2YSk4fVCdhiCbW+ah0h93kcaJtnE6zLe/dPa2
         OqR0azdG3Upt0w3yZSCKUA3RH+XaV+1G+06qmzFY8h0jq8cwtUrtDjRKLLs7LbXq21bo
         Y12lyWub6Y5RuPU50WXNvFLOu9GkVzu8iZIHfrKsbM8AeTUmQ0wA5rAB0/9AeWCqlL9S
         1SyG4U0rKyID8wMuIqhqyDXmzkC73i8BeqTe49UMDyf896NYGmJboBwoRltHdxHns7fk
         zF9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0Fz0EXTJo+zJxIaRY9T9blVFhYmhEk181zpOApeluVu5TcfH/RlsJX85DnUvdZXIc7zm4fisa0/Uhk5hcnD5UJGTAqBNxqX3GUi5GEtNGC9FN
X-Gm-Message-State: AOJu0YyzP/TwToUjwCwImfSVpsGjskkpvBqef12njsJtozzoDmzgeJCI
	G3MmqU8TicJseoYhitQoB0JVGWhRAdCUrh9f0H0U2F/iqJVfyQmlfBJcKWeBxzg=
X-Google-Smtp-Source: AGHT+IHyMkgn3/gFNE4gv4OJO59bQCoHWgHlPXJAezaplNmRkJ1y1keb/pz2mmb4jwElkz5448BGKA==
X-Received: by 2002:a2e:2e06:0:b0:2ee:8815:8b28 with SMTP id 38308e7fff4ca-2ee8edd3ec5mr24871001fa.33.1720178308668;
        Fri, 05 Jul 2024 04:18:28 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3678fe13ef4sm7369352f8f.117.2024.07.05.04.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 04:18:28 -0700 (PDT)
Message-ID: <2aa71d0f-6e4a-4056-9deb-a46526b423a9@linaro.org>
Date: Fri, 5 Jul 2024 13:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 00/22] dt-bindings: thermal: few cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_041831_112969_730D935D 
X-CRM114-Status: GOOD (  10.73  )
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

On 05/07/2024 11:51, Krzysztof Kozlowski wrote:
> Hi,
> 
> Resending (with added tags) because patchset was still not applied.
> Daniel, can you pick it up?

Yes

> Few cleanups witout practical impact, except maybe the Amlogic schema
> (bringing required cells).
> 
> Link to v1: https://lore.kernel.org/r/20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (22):
>        dt-bindings: thermal: samsung,exynos: specify cells
>        dt-bindings: thermal: amlogic: reference thermal-sensor schema
>        dt-bindings: thermal: allwinner,sun8i-a83t-ths: reference thermal-sensor schema
>        dt-bindings: thermal: brcm,avs-ro: reference thermal-sensor schema
>        dt-bindings: thermal: generic-adc: reference thermal-sensor schema
>        dt-bindings: thermal: imx8mm: reference thermal-sensor schema
>        dt-bindings: thermal: nvidia,tegra186-bpmp: reference thermal-sensor schema
>        dt-bindings: thermal: nvidia,tegra30-tsensor: reference thermal-sensor schema
>        dt-bindings: thermal: qcom-spmi-adc-tm-hc: reference thermal-sensor schema
>        dt-bindings: thermal: qcom-spmi-adc-tm5: reference thermal-sensor schema
>        dt-bindings: thermal: qcom-tsens: reference thermal-sensor schema
>        dt-bindings: thermal: qoriq: reference thermal-sensor schema
>        dt-bindings: thermal: rcar-gen3: reference thermal-sensor schema
>        dt-bindings: thermal: rockchip: reference thermal-sensor schema
>        dt-bindings: thermal: rzg2l: reference thermal-sensor schema
>        dt-bindings: thermal: socionext,uniphier: reference thermal-sensor schema
>        dt-bindings: thermal: sprd: reference thermal-sensor schema
>        dt-bindings: thermal: st,stm32: reference thermal-sensor schema
>        dt-bindings: thermal: ti,am654: reference thermal-sensor schema
>        dt-bindings: thermal: ti,j72xx: reference thermal-sensor schema
>        dt-bindings: thermal: simplify few bindings
>        dt-bindings: thermal: cleanup examples indentation
> 
>   .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml |  6 +-
>   .../bindings/thermal/amlogic,thermal.yaml          | 22 ++---
>   .../bindings/thermal/brcm,avs-ro-thermal.yaml      | 22 ++---
>   .../devicetree/bindings/thermal/brcm,avs-tmon.yaml | 17 ++--
>   .../bindings/thermal/brcm,bcm2835-thermal.yaml     |  1 -
>   .../bindings/thermal/fsl,scu-thermal.yaml          |  1 -
>   .../bindings/thermal/generic-adc-thermal.yaml      |  5 +-
>   .../bindings/thermal/imx8mm-thermal.yaml           |  5 +-
>   .../bindings/thermal/loongson,ls2k-thermal.yaml    |  1 -
>   .../bindings/thermal/mediatek,lvts-thermal.yaml    |  1 -
>   .../bindings/thermal/nvidia,tegra124-soctherm.yaml |  1 -
>   .../thermal/nvidia,tegra186-bpmp-thermal.yaml      | 12 +--
>   .../bindings/thermal/nvidia,tegra30-tsensor.yaml   |  9 +-
>   .../bindings/thermal/qcom,spmi-temp-alarm.yaml     |  1 -
>   .../bindings/thermal/qcom-spmi-adc-tm-hc.yaml      |  8 +-
>   .../bindings/thermal/qcom-spmi-adc-tm5.yaml        |  8 +-
>   .../devicetree/bindings/thermal/qcom-tsens.yaml    | 96 ++++++++++------------
>   .../devicetree/bindings/thermal/qoriq-thermal.yaml |  5 +-
>   .../bindings/thermal/rcar-gen3-thermal.yaml        | 69 ++++++++--------
>   .../devicetree/bindings/thermal/rcar-thermal.yaml  | 60 +++++++-------
>   .../bindings/thermal/rockchip-thermal.yaml         |  5 +-
>   .../devicetree/bindings/thermal/rzg2l-thermal.yaml | 41 ++++-----
>   .../bindings/thermal/samsung,exynos-thermal.yaml   |  3 +-
>   .../thermal/socionext,uniphier-thermal.yaml        |  5 +-
>   .../devicetree/bindings/thermal/sprd-thermal.yaml  | 47 +++++------
>   .../bindings/thermal/st,stm32-thermal.yaml         |  5 +-
>   .../bindings/thermal/ti,am654-thermal.yaml         | 15 ++--
>   .../bindings/thermal/ti,j72xx-thermal.yaml         |  5 +-
>   28 files changed, 230 insertions(+), 246 deletions(-)
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240614-dt-bindings-thermal-allof-401c50e61ef2
> 
> Best regards,

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


