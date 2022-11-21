Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA79EC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 05:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oM4t9dSTJRNYdl1z0tkjCktIi2YLG2NdBqaOTxJOnfw=; b=f7MPWINQa827lnAoeWgSaPT8F0
	BYxEkyrWazIRpgPeB3OviQGUgCgWzxEB8t2JMg70JoPLgZQT/hVGeq1h3ZQATYPJZ7YyOB2t0nC7k
	sdUQfxg1dNUOgUdLZTq3YeFOPkQeeU6vWIixIamsRSHIjaTUVZbGRN5kNf1x0VN9OyobCIakWgS4P
	HpioduwfNTkX1Lup065yqbAwc7vHYIy9tUlrSTpv743GndeKqSsByh8COryjBf5XPy2Ld9AO+66lf
	OZL0u0yj2ZUPKVoRwAfhekmoUcX3Wy2qZ/Iqlyk9i2vK9OPYTwcz5IWIN7mXxwd4VVM3wPZWhI4WS
	+YX+kvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owz38-009TqA-VM; Mon, 21 Nov 2022 05:08:54 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owz35-009Tp1-VX
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 05:08:53 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 71-20020a17090a09cd00b00218adeb3549so1832300pjo.1
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 21:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oM4t9dSTJRNYdl1z0tkjCktIi2YLG2NdBqaOTxJOnfw=;
        b=LWtOZYu4jsTpQIJaiOHNEV7J1U5Hekz/2o745TGAHoP4cneloLCtSQcf2+7QCorM2v
         /xUrXy8tc3AyizxEql9WLY1OdpX3pQbIVxJtcFYql5RA3M4NDSaLMbPVj5dbObnT+KSU
         mczGTwZmAOwUux/wZ8ifvi0F01VtKfJ2/n71J43DQXUfTPipabpUdKiLGhjOMu1er+fR
         qpGgEsviAEicpqjzPwJSF+kZar5OCuUon7HJXQSuacsEE6kvxwtPpgVtTm/A/sLEJVHN
         qxeu2eQb8ByOQLwRwijUs3sPFsoh7Q/NUQWZepaz/G6oM8gj5IAM41nqgSYfzxRnFHnj
         8Fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM4t9dSTJRNYdl1z0tkjCktIi2YLG2NdBqaOTxJOnfw=;
        b=DOFK3TPRlxNHd8e/s50AVVyvpnsz7qf+1neXgfVbvRyphJbDeOV/HEF13kEkuX1Nrk
         OYPUj95TDYtKb7/PmMVOwVjMAELPqYVjWDAR8izj95LuoODCn/qb7/qjQGrJ75tdI3nj
         VTlIxrmsQlX8iJC6gtqWqt0iYZh3YCQruOaXQb6VRxoXc3tX1UN+9vy5gVg8an5w+djb
         YvpnC2AbVtDV9iAfDoFAta6E9Q+/nCid7TRloq+ZlN1381kTj+WuKxYGqkc0hE0uyUtj
         tobCd+6Z50fZ/gM8Jeh1IEQfvJEpe3bEfjmQuASYV9KL1CCopL5s3u9a2OVBlaDvl8UO
         F3+Q==
X-Gm-Message-State: ANoB5pnKmbahxLknqVUqvXIJg1OrZZd1decXhnwvvZ341JNy6dASbJ68
	Nst7KCfwHg4i9Y8H0zE+QCHD/Q==
X-Google-Smtp-Source: AA0mqf7JM7TMYC6I8OTgp5yVOi9dOvfTXAD2akuhU7ByBbq+4L3OQY/x8/g9Bql+etELz/ggxI+lHw==
X-Received: by 2002:a17:90a:b706:b0:212:e75b:1602 with SMTP id l6-20020a17090ab70600b00212e75b1602mr18701960pjr.139.1669007329319;
        Sun, 20 Nov 2022 21:08:49 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id z7-20020aa79f87000000b005625d5ae760sm7895356pfr.11.2022.11.20.21.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 21:08:48 -0800 (PST)
Date: Mon, 21 Nov 2022 10:38:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Maxime Ripard <mripard@kernel.org>, Daniel Mack <zonque@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
Message-ID: <20221121050846.m7w52iygltb5xivt@vireshk-i7>
References: <20221118223728.1721589-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_210852_110112_7A6D6B39 
X-CRM114-Status: GOOD (  15.23  )
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

On 18-11-22, 16:37, Rob Herring wrote:
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml       | 2 +-
>  Documentation/devicetree/bindings/hwmon/adt7475.yaml          | 4 ++--
>  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml    | 4 ++--
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 2 +-
>  .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
>  Documentation/devicetree/bindings/regulator/max8660.yaml      | 2 +-
>  .../devicetree/bindings/regulator/maxim,max77802.yaml         | 2 +-
>  Documentation/devicetree/bindings/regulator/regulator.yaml    | 2 +-
>  .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml  | 2 +-
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml     | 2 +-
>  .../devicetree/bindings/spi/nvidia,tegra210-quad.yaml         | 2 +-
>  11 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> index a11e1b867379..3c00ad09eeaa 100644
> --- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> @@ -38,7 +38,7 @@ properties:
>      type: object
>  
>      patternProperties:
> -      'cpu@[0-9a-f]+':
> +      '^cpu@[0-9a-f]+$':
>          type: object
>  
>          properties:

> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> index 385b0692261c..51f62c3ae194 100644
> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> @@ -41,7 +41,7 @@ required:
>    - nvmem-cells
>  
>  patternProperties:
> -  "opp-[0-9]+":
> +  "^opp-[0-9]+$":
>      type: object
>  
>      properties:
> @@ -49,7 +49,7 @@ patternProperties:
>        clock-latency-ns: true
>  
>      patternProperties:
> -      "opp-microvolt-.*": true
> +      "^opp-microvolt-speed[0-9]$": true
>  
>      required:
>        - opp-hz

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

