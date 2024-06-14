Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D65AC27C75
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8iAIlbQi0tUJ3qu8xocmxzckhx265PFdpBlcy4mJCQ=; b=TERh4pWFttCzB/FVSUmIK6em+B
	X1SXghP7cmboiBjrdIzR1TrnYE4XZAtbvDJFBf14fWFfgGFHLmK9wTI9UIl0LUJ+K9vw+68cdbltG
	JB6SezApKmj1N+9lE2PJZn+5fnpylkc55HgvimjH7zBAkLLq+qOvqhza47OYzUZzfmQtlUDikSdEZ
	iWnd3a8LsHiLkYeqjcQjd3p1z3qCvz5ksy4lLNOnE/9ZgzitqaYmf940bwVZXPHOA4WKeW0thwB0s
	6J7+1dStVAhTUW/XGZqZA+CUwk5YxpemX+3E8w5qLJGgEn9vVkQKPfWHDvQYuYmo5SoBDJLl/HRQA
	XaIwgWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI53b-00000002aMx-2nPu;
	Fri, 14 Jun 2024 11:25:23 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI53W-00000002aL6-1kIy;
	Fri, 14 Jun 2024 11:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718364311; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=u8iAIlbQi0tUJ3qu8xocmxzckhx265PFdpBlcy4mJCQ=;
	b=VAVR5Daaya/C1wbtIOzU2uV9oyLwqBqFp9/xinExr1CWuiHpI7PhSzU1kD5v6ZT2OhTMR0cIfYfQOCioROqJ7wvTbUIYTpMmI8IcSBJ2zlFM96XmOUQVFaldQASkM5aLoIrfOsXhyid1+3xZ1qLFdCFrPu9vgxYxLv3si6X3L2g=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=54;SR=0;TI=SMTPD_---0W8R3gfJ_1718364305;
Received: from 192.168.0.106(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W8R3gfJ_1718364305)
          by smtp.aliyun-inc.com;
          Fri, 14 Jun 2024 19:25:07 +0800
Message-ID: <f764133b-1aaf-4f4b-9a2e-d04ab35d660f@linux.alibaba.com>
Date: Fri, 14 Jun 2024 19:25:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/22] dt-bindings: thermal: sprd: reference
 thermal-sensor schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
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
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
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
 <20240614-dt-bindings-thermal-allof-v1-17-30b25a6ae24e@linaro.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-17-30b25a6ae24e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_042519_065171_31074213 
X-CRM114-Status: GOOD (  11.31  )
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



On 2024/6/14 17:46, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   Documentation/devicetree/bindings/thermal/sprd-thermal.yaml | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> index 76aaa004c8ac..f65076fc68f9 100644
> --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> @@ -11,6 +11,8 @@ maintainers:
>     - Baolin Wang <baolin.wang7@gmail.com>
>     - Chunyan Zhang <zhang.lyra@gmail.com>
>   
> +$ref: thermal-sensor.yaml#
> +
>   properties:
>     compatible:
>       const: sprd,ums512-thermal
> @@ -77,11 +79,10 @@ required:
>     - clock-names
>     - nvmem-cells
>     - nvmem-cell-names
> -  - "#thermal-sensor-cells"
>     - "#address-cells"
>     - "#size-cells"
>   
> -additionalProperties: false
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> 

