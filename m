Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70BEC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soNpQ58Fz2hm7V5JZ9ZEYAVAikWNhIPt2irm4De+WfA=; b=uk6aEYTPAqnk4YojVW+563d73+
	3wab3NmuscTg3EGLy1mSiI9R2fwA6lcNS7JZYwsZl+O/qUUFoIUklLrPeY4/NJnTPBQqx294BDmLv
	jQh9JWDIABuQcKQ5Ve+7kTNT+1KIBvafngtkVP+ufCt5o91o0/QS2eFMM5g59DKIFixTuNZMceuAG
	y1ySh5W3ah0R2WwR2PZ8yk4SCoTHuhRJWJ2r3voH9mVCnmYDMSLnW7HEtvyHEdOxykRmoPgRSSpZI
	tUuUwz1aTl7JNgFId4dgfrLr3xPIXaLxhzlhuMaWVttsxWatwM+s7kbtacw1JVQ1dpbBMXRkLMFz0
	Tm9W9YkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6eD-0000000BOCf-1zW8;
	Wed, 03 Jul 2024 20:32:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6e6-0000000BOAE-3oJ9
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 20:32:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4255fa23f7bso41319185e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 13:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720038725; x=1720643525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=soNpQ58Fz2hm7V5JZ9ZEYAVAikWNhIPt2irm4De+WfA=;
        b=VUPLfXfLi2x9TdZcv+xc2xmRr32lMecykgWzJaKW+HS9jCTj1PYGMeVCaE/dSvLrje
         uBMknvNMltqRmydCHWjaSWVakE5GSB1V1zWsldS+LnoydMfT80s5SRwDbA+RefxiILsR
         C00MXAxG14ouGJB9UGh9Ux/DVnTvc165RjAISpCDFZ7FquCg9aBE3Qo3PiAkOJ+AYIEG
         xCmiKFK7/RmQc5t71dzMaRsSslbvEh0gDHCt65lMVX6MGuTipafSsGLVe0Jq1pedwD1/
         EQU1wXJ4QrVTnRzam/ADUosrOl3e1wyF/M3IV9HEoEnCiEYJF4MbCm2qv9xNf5xaL2IF
         RvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720038725; x=1720643525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=soNpQ58Fz2hm7V5JZ9ZEYAVAikWNhIPt2irm4De+WfA=;
        b=KU9JYTMbFc2V1xaN9AbvrrjpIpZQ3rb8mFUP36sPobJED1ZR0Z1nQ3kWcNGDWnStvr
         /nC7qx5o2PRvWtmb+lG8rXDNDxjP6ZcRfGxHaL+6ok7w0vbCh5smVFG422ojX7uNSJsw
         77cDWJVEYmEIt8Cd3QvFqvV+CdNldPA8rEyJ8eZdd4et8wmJHrhioAZzG1KWy/f2SlyX
         Lw1xFWg6Py+8wb8D3vgcffCthVbDtLAcHpIm14qblHwevIzQF7cG0tFeRHVehxBnJI3v
         gW5+nbc4eGrP8wqLI2VrY3tDyMw+1CR2UwY46dbaSLK/qgPmkhaa7XfwmNLjMT3hDvi4
         quRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwgYNPSfQQ8zhNmWYUcZ1mDE/lMmAaDDYLZgLqbuSfaA4ES+k/zr3IxGDU2qkrQPLXZMtYxjL3UYUB6fg1osWa9Wd9a4ASIsZ0VAPXI6YsyP7a
X-Gm-Message-State: AOJu0YzUCZE2DCtdHEHXGgy6cEPZF1mHNbki4bhoAQP1o9jaenVV83lc
	gtB8abLPVwVNg1VKIstRULcnRzr6GDQa6e1o5eOqoVGP1MJfVAj0xnXb+y7YB0w=
X-Google-Smtp-Source: AGHT+IEQBwm7OCqJ0C1+sLPedSZoAnvYatAaOS5AYpVWYgjgIYzIeidjLFDv/zxc1QKpmoxHnzRP3w==
X-Received: by 2002:a05:600c:4f52:b0:424:aa64:e9b3 with SMTP id 5b1f17b1804b1-4257a02b701mr80619975e9.29.1720038724401;
        Wed, 03 Jul 2024 13:32:04 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:10a5:e010:6751:db24:f67e:fa2e? ([2a05:6e02:10a5:e010:6751:db24:f67e:fa2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426487c1c66sm1528905e9.0.2024.07.03.13.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 13:32:03 -0700 (PDT)
Message-ID: <922ef023-4375-4a89-af1e-bd9bcf90f750@baylibre.com>
Date: Wed, 3 Jul 2024 22:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] dt-bindings: thermal: amlogic: reference
 thermal-sensor schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-2-30b25a6ae24e@linaro.org>
Content-Language: en-US
From: Guillaume LA ROQUE <glaroque@baylibre.com>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-2-30b25a6ae24e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_133207_120298_787109B3 
X-CRM114-Status: GOOD (  14.48  )
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

Le 14/06/2024 à 11:46, Krzysztof Kozlowski a écrit :
> Device is a thermal sensor and all in-tree DTS provide
> '#thermal-sensor-cells', so reference the thermal-sensor.yaml to
> simplify it, bring the common definition of '#thermal-sensor-cells'
> property and require it.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> index 01fccdfc4178..e52fc40e215d 100644
> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -11,6 +11,8 @@ maintainers:
>   
>   description: Binding for Amlogic Thermal
>   
> +$ref: thermal-sensor.yaml#
> +
>   properties:
>     compatible:
>       oneOf:
> @@ -44,7 +46,7 @@ required:
>     - clocks
>     - amlogic,ao-secure
>   
> -additionalProperties: false
> +unevaluatedProperties: false
>   
>   examples:
>     - |
>
Reviewed-by: Guillaume LA ROQUE <glaroque@baylibre.com>


