Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FB5C30658
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 21:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCiqvH0nHSNG8qdgU9rhpWGnnBxhVlL8oWUmKfH6NSM=; b=ZIsSkcMBlxVN85tlt1PFbLRi1k
	lN4pwVnY5JL2V2XHM6C2Wuxtl3BZEADZk6thNAerYFCt0it5CniZNEGcrgkmdSHVmkS9ONFCQ+7Am
	khxbGZhT46OFu1iMtsLFCYFAKyGyOa76zFfhf5NFm0YBvPTrclcjsqgXVT0h9ztdY/vbt6h/jf5Z+
	MJy8hidozdNmu4IibcQCXNE9FdR2O7g1u6tEaRZeX8zLBrB+KgFZSQZ2V07ShzsX+mCXYoJAovM49
	2B3OlI+u6LAXC8FywuJrmajXWgQmmDJkqVWR8EOhKb9WRtTqBjkVHMFPg/KzNwfoFdNNu4Xrs5SuZ
	cFA44elw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOkhl-00000007yS1-1Iyk;
	Tue, 02 Jul 2024 21:06:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOkhi-00000007yQN-1oJJ
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jul 2024 21:06:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C53A0CE21B4
	for <linux-mediatek@lists.infradead.org>; Tue,  2 Jul 2024 21:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C96C4AF11
	for <linux-mediatek@lists.infradead.org>; Tue,  2 Jul 2024 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719954379;
	bh=NyzwM0fsXKf4dXOAJKkuMhvtpscp3UAXzQ88ePFkdHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T0jF5n0XmYOBWCFsIhEiFwCW709AF2iNAJBXPHQDhZ3ouUIflhHJtwIPSeAQkemwl
	 uvh5nDRj8MsScENuyxikrGs7trBmvGpceQ90A9jThyM6OwHTK1hSB47GteIED0mkfp
	 yIXfQgx1XVTTfS14P6B441+5oNJT53fpMKqRINxMzkGSKAywbiMtggfLmF/5MhXRyE
	 MR2OEIi2KWdc0w+AofhLDxqqtYNvgWMUcCMzmTV90XllmcI+M2rs3uGRjmGpiIo+bY
	 S7E4wTeW1JLVmvZdlftDTuGLXlMEsznlapdBUQq2P/lZic0fAeIbHo/yvEPyuqkLW8
	 0fIXzDl9OJV+g==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so53162431fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jul 2024 14:06:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkM+sQSWe966BvHe3b6B9MdeE0pdFXuGWflgEiEQPDWDvi1eTSMPSyTPIlBqyXqVcQWuNd9O9LgQZbrvR9YzznjPj8h9npsZngBeExAVOe1+oh
X-Gm-Message-State: AOJu0Yx+oHhq/GVU61vshGcPcND9PKTlsi/MAMotonPwSQyDWTm1oCkn
	Qk6wjG8lbrUniJtjm6hcJP75miteHRnEBY0ehC8uKbAvz95+rZMeEAZByRzdOFnGmfUgYEpKy6M
	AXTbHqyLvqeLUjvRZxjBgx6FDEjEdPuBbHZ3KHQ==
X-Google-Smtp-Source: AGHT+IGUxDpnfmOI+j4i7sET5B6iGTwPCxoZxCFPXJYFFkWMGwCKQTKuc3id2P0lUND+5DiDyxhNNJ4MNomLGxiA7Lo=
X-Received: by 2002:a17:906:f185:b0:a72:b1b1:eb3a with SMTP id
 a640c23a62f3a-a751447b093mr634755766b.19.1719954357446; Tue, 02 Jul 2024
 14:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org> <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
From: Amit Kucheria <amitk@kernel.org>
Date: Wed, 3 Jul 2024 02:35:45 +0530
X-Gmail-Original-Message-ID: <CAHLCerMuG92Sf8+BdqPLqh+x3YxBjD6YdYF2k+AxQcwCqerxzw@mail.gmail.com>
Message-ID: <CAHLCerMuG92Sf8+BdqPLqh+x3YxBjD6YdYF2k+AxQcwCqerxzw@mail.gmail.com>
Subject: Re: [PATCH 11/22] dt-bindings: thermal: qcom-tsens: reference
 thermal-sensor schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	zhanghongchen <zhanghongchen@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_140622_851873_87566B0F 
X-CRM114-Status: GOOD (  17.49  )
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

On Fri, Jun 14, 2024 at 3:17=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Amit Kucheria <amitk@kernel.org>

> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/=
Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 99d9c526c0b6..cce6624228c7 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -217,18 +217,16 @@ properties:
>
>    "#thermal-sensor-cells":
>      const: 1
> -    description:
> -      Number of cells required to uniquely identify the thermal sensors.=
 Since
> -      we have multiple sensors this is set to 1
>
>  required:
>    - compatible
>    - interrupts
>    - interrupt-names
> -  - "#thermal-sensor-cells"
>    - "#qcom,sensors"
>
>  allOf:
> +  - $ref: thermal-sensor.yaml#
> +
>    - if:
>        properties:
>          compatible:
> @@ -292,7 +290,7 @@ allOf:
>        required:
>          - reg
>
> -additionalProperties: false
> +unevaluatedProperties: false
>
>  examples:
>    - |
>
> --
> 2.43.0
>

