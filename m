Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3708FC27C77
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 02:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3S2YurUrl5MC+fkMuKFY0ClzSCLEfz1Oc40ER8vtAUk=; b=qfzp953UUeOMjgGbpJDbKiIEUb
	g/Ec5Ytv5Zk1sHqlmKBhFcJuTH/XxYQMQi0sWxOYPzOhc8yrNLutmyqeC7bi6n+8lCZAx78WS6OPE
	t7Xm652jDHMxiJSWi9ugN5xHZ2Wo124adOJE05dCi+D3wY7ihzmmHWv8JhCaGO5r5gE9Wzi6BI7/P
	nyqz4ylOe2de2y+HWTt23AufMQLz1ww4RRM9FuVneT5DEGADXyqxVvZmAztFMFIx4uwvub9elW/OE
	BCKDOg3wVQuCZS3upmDHvJ2Qk1CbMz/wA2DeNqjSBbW1QC/jREtIquBBEpYDvHCF7jd6LpIQhsNTm
	0Tq5hCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ2Ee-00000008sQR-36g9;
	Mon, 17 Jun 2024 02:36:44 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ2EY-00000008sMu-3y8K;
	Mon, 17 Jun 2024 02:36:40 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-25075f3f472so544978fac.2;
        Sun, 16 Jun 2024 19:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718591794; x=1719196594; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3S2YurUrl5MC+fkMuKFY0ClzSCLEfz1Oc40ER8vtAUk=;
        b=FgNBqMeY5EbDHhsTnWmHDnzACdfagYkzAhQiDYkDt/AxnxsPGLd2tp5TgPI4/WBfOh
         8prk0eOmTqJyuSc5UZHJ3nB6Y1oQU0B3hknzMfWJURy0Gd8tU5ExtyCfwPRtDjIlDjk7
         ecSapJ0zJRRtoJNtfy5KMZ2SXlqJFYmQ+/uvzPIdJN73+zW+mJutc4s07v3bVRJmfIg3
         DZW305TYSZy5Wm0n/hha0nO9AqoOGcIejU7Z+5ZicwrMch6iueYCvJPveDnrRbE/Ur+x
         OaPqPE41TWe098XBsvjunOSc+pfCAXHbHdNJGWwq31lhMSEmNyInrvIhcn0OVScrvTHz
         SC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718591794; x=1719196594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S2YurUrl5MC+fkMuKFY0ClzSCLEfz1Oc40ER8vtAUk=;
        b=bN2Fj/2O9lki3NWa++iR9CzOSUqB0rLQ5nTOfM4DEUKY4BSRmF4hKAf3rL3069AlfP
         Abc1MUCKfWRB/KlODHtyDhFwZCciWBntoOjhmCaj2W61o1cklRVxGcUCSr1Or1frGJN4
         UrsNZyMs9qO4Em9OwViIwPQTSksuPjA5pPiZm3PMz3Uwyx5THxgDV8CsGunhLwkw1uhJ
         LfRh2Pckzwbpe6wE+2v5IoctRunrwLvYKUAZup2lsQUSW3wM2mJ1WLUm0ZVuYinGqZgN
         Mf7yIxnFU6bg0Zvm9ZSSs3Y4r3zaGRvCl9tyBg4pcMvk47WXGKmqARcjgsEr+hM0xfIz
         0vHg==
X-Forwarded-Encrypted: i=1; AJvYcCXbg5dv5iiyLpoQxbRcOPO86UwfuK11QnUrku/E0khjBRM+kbjbEd19WV2WOvMak525N0/KRwCEi8In5OfwgE2L+2Rzftyij9fJwgL05fcUDVBTTaqdBWmtwKjYnaG49Coi3lGD3/LCCUZGYMVUkX753L+wqxhN1jsdE+0+VOBNv0AUgA9GIMnwi0P+04FR5GuNbt0qaokrx7GusLqXw5q80fX1FSvuDbBmlxTWWzbBX5/dA4LcrbE7c8cmVxdA6rBQBXZPe/+QFfBlWptSa4pkGmZYXpA4p8suJ9HopaYQKHb+k/5H
X-Gm-Message-State: AOJu0YyWYHPynoapw09nVosEEiy7hadkOO3lGF3Z0GsnSTllAZPBmWa/
	th3CtaDrMLcjbr5bzofnBVC6bChITV811u5Dn5Q7x8qjkcj87zKAsgY5FEvoNBok3tcgAu20rsp
	1G48uehICmFWprCBapBDsI4HN9GJbpRlu
X-Google-Smtp-Source: AGHT+IGltFa0bQ5GCz9R8Qfp8q4AWMyO+O31iG05ayKCR1g5p5BB0jiP/wIlvjmzI8GEc+sBuDPZkWfe/0K++X8dom4=
X-Received: by 2002:a05:6870:469f:b0:254:d417:351f with SMTP id
 586e51a60fabf-258429511admr9266807fac.1.1718591794255; Sun, 16 Jun 2024
 19:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org> <20240614-dt-bindings-thermal-allof-v1-3-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-3-30b25a6ae24e@linaro.org>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sun, 16 Jun 2024 19:36:08 -0700
Message-ID: <CA+E=qVdpw5dMSdZiBkX5i6y18vHzfG2JnBSmd2Rq=y4kkgZLQw@mail.gmail.com>
Subject: Re: [PATCH 03/22] dt-bindings: thermal: allwinner,sun8i-a83t-ths:
 reference thermal-sensor schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
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
X-CRM114-CacheID: sfid-20240616_193639_087492_F16938DC 
X-CRM114-Status: GOOD (  15.11  )
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

On Fri, Jun 14, 2024 at 2:46=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

> ---
>  .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml       | 6 =
+++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a8=
3t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83=
t-ths.yaml
> index 6b3aea6d73b0..dad8de900495 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml
> @@ -10,6 +10,8 @@ maintainers:
>    - Vasily Khoruzhick <anarsoul@gmail.com>
>    - Yangtao Li <tiny.windzz@gmail.com>
>
> +$ref: thermal-sensor.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -55,7 +57,6 @@ properties:
>      maxItems: 1
>      description: phandle to device controlling temperate offset SYS_CFG =
register
>
> -  # See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml fo=
r details
>    "#thermal-sensor-cells":
>      enum:
>        - 0
> @@ -135,9 +136,8 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - '#thermal-sensor-cells'
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

