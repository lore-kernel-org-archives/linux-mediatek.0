Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DE0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 10:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtnsSsgZ9BoUeNNZ/Y7JIqYXA7ebg2CXD0/LcOkCH6I=; b=nM/YsKziYTgSO2Pri3lFJqYc6t
	nQtjaS4g9VcgtEiYvpZrCSr/ryofFVRt9odFUeDlzhfXKIEB1Wwf8WD7KEmS1pO0bljEvzfamyQ8T
	Qb97XZP1FNkLR0wwofoKUU/RPfMAMeZ8JcoggFd7YBa8GOE+1EOgx83vDKDF4DyCYSkAsHbSIgzoU
	CJT+KaUBWNr92X/3uN8T2+orIg50OHUQKVZD90G32amuQCaS+yyoZqLEjxY2VcElthsto2TeuTNYj
	W5R1Bp6Tm+qcdseoR0vxnsBV80hf/ms/gKksXTxg4eaVKifTq98eleSaPyK9ovGaHRA+UbTZQCr5v
	zjmTG0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRAEU-00GweD-4V; Mon, 07 Mar 2022 10:04:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRAE6-00GwVR-0l; Mon, 07 Mar 2022 10:04:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0F2221F438C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646647464;
 bh=akkWSIz129iQdVE9EdcCfmhbLkwDOC2Ls9BA6Lqns8o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JHetwUEXVVtlHNdaWkTB6iB5i+xvG7UClAYqgaw9WdExhIDZIL/E7/GZBs6uYKzb8
 O69agPkVKq/6eYLCL/eVhcAYxVT5Ol9LWHCP5AvHgP8LEFnRWkC/MXFYqt+cEBzM93
 D5zNh5ScTN6moPOIBfv9DS05SiyAFwlHXFbbHc0a7ofBxr/tKjxK+HfJtYqlrisfee
 irpfEhr43HUsMsbdcrnidtxcF5VDUDZEzL8vbucRIvJT5tu4cWOJ8ybloHnXOpSUvw
 YityDllj4q2LS8vtuZpcb0kPWd9z4Bmo3zr2+qLuRS11zFunvn5OyoDYaUM/gDtxQc
 /gHtBgCu+agwA==
Message-ID: <1abbd1bc-58b7-ee30-76e4-e60a842de433@collabora.com>
Date: Mon, 7 Mar 2022 11:04:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v16 1/8] dt-bindings: soc: mediatek: move out common
 module from display folder
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220307032859.3275-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_020426_408712_A8126F81 
X-CRM114-Status: GOOD (  21.89  )
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
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com,
 jason-jh lin <jason-jh.lin@mediatek.corp-partner.google.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, CK Hu <ck.hu@mediatek.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/03/22 04:28, jason-jh.lin ha scritto:
> From: jason-jh lin <jason-jh.lin@mediatek.corp-partner.google.com>
> 
> AAL, COLOR, CCORR, MUTEX, WDMA could be used by other modules,
> such as MDP, so move their binding document into the common folder.
> 
> Signed-off-by: jason-jh lin <jason-jh.lin@mediatek.corp-partner.google.com>

Hello jason-jh,

I understand that these dt-bindings can eventually be reused by MDP3, and
this change is welcome, as duplication wouldn't be sane, however, this is
not the right series for that to happen.

If you want to move these bindings around, you should do that in the patch
series that actually also adds the compatibles for MDP3 in these modules.

If there's no MDP3-specific compatible for these modules, then you should
not move them from display, as this is documentation for mediatek-drm and
it's (currently) the only provider of these.

Please remove this patch from the vdosys0 series for MT8195 because it is
not adding any compatible that justifies moving these YAML around.

Regards,
Angelo

> ---
>   .../{display => soc}/mediatek/mediatek,aal.yaml     | 13 ++++---------
>   .../{display => soc}/mediatek/mediatek,ccorr.yaml   | 13 ++++---------
>   .../{display => soc}/mediatek/mediatek,color.yaml   | 13 ++++---------
>   .../{display => soc}/mediatek/mediatek,mutex.yaml   | 12 +++---------
>   .../{display => soc}/mediatek/mediatek,wdma.yaml    |  9 ++-------
>   5 files changed, 17 insertions(+), 43 deletions(-)
>   rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,aal.yaml (81%)
>   rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,ccorr.yaml (80%)
>   rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,color.yaml (83%)
>   rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,mutex.yaml (82%)
>   rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,wdma.yaml (85%)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
> similarity index 81%
> rename from Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
> index 4fdc9b3283b0..08934b10b54e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
> @@ -1,22 +1,17 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,aal.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: Mediatek display adaptive ambient light processor
> +title: Mediatek adaptive ambient light processor
>   
>   maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
>   
>   description: |
> -  Mediatek display adaptive ambient light processor, namely AAL,
> +  Mediatek adaptive ambient light processor, namely AAL,
>     is responsible for backlight power saving and sunlight visibility improving.
> -  AAL device node must be siblings to the central MMSYS_CONFIG node.
> -  For a description of the MMSYS_CONFIG binding, see
> -  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> -  for details.
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
> similarity index 80%
> rename from Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
> index 0ed53b6238f0..bf52b7b53475 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
> @@ -1,22 +1,17 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,ccorr.yaml#
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,ccorr.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: Mediatek display color correction
> +title: Mediatek color correction
>   
>   maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
>   
>   description: |
> -  Mediatek display color correction, namely CCORR, reproduces correct color
> +  Mediatek color correction, namely CCORR, reproduces correct color
>     on panels with different color gamut.
> -  CCORR device node must be siblings to the central MMSYS_CONFIG node.
> -  For a description of the MMSYS_CONFIG binding, see
> -  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> -  for details.
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
> similarity index 83%
> rename from Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
> index 3ad842eb5668..91ff2adcf390 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
> @@ -1,23 +1,18 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,color.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: Mediatek display color processor
> +title: Mediatek color processor
>   
>   maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
>   
>   description: |
> -  Mediatek display color processor, namely COLOR, provides hue, luma and
> +  Mediatek color processor, namely COLOR, provides hue, luma and
>     saturation adjustments to get better picture quality and to have one panel
>     resemble the other in their output characteristics.
> -  COLOR device node must be siblings to the central MMSYS_CONFIG node.
> -  For a description of the MMSYS_CONFIG binding, see
> -  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> -  for details.
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> similarity index 82%
> rename from Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index 00e6a1041a9b..d334050105db 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -1,25 +1,19 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Mediatek mutex
>   
>   maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
>   
>   description: |
>     Mediatek mutex, namely MUTEX, is used to send the triggers signals called
> -  Start Of Frame (SOF) / End Of Frame (EOF) to each sub-modules on the display
> -  data path or MDP data path.
> +  Start Of Frame(SOF) / End Of Frame(EOF) to each sub-modules on the data path.
>     In some SoC, such as mt2701, MUTEX could be a hardware mutex which protects
>     the shadow register.
> -  MUTEX device node must be siblings to the central MMSYS_CONFIG node.
> -  For a description of the MMSYS_CONFIG binding, see
> -  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> -  for details.
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> similarity index 85%
> rename from Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> index 7d7cc1ab526b..a6f9e1b3268d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> @@ -1,22 +1,17 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,wdma.yaml#
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,wdma.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Mediatek Write Direct Memory Access
>   
>   maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
>   
>   description: |
>     Mediatek Write Direct Memory Access(WDMA) component used to write
>     the data into DMA.
> -  WDMA device node must be siblings to the central MMSYS_CONFIG node.
> -  For a description of the MMSYS_CONFIG binding, see
> -  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> -  for details.
>   
>   properties:
>     compatible:


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
