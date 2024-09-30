Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97F4CF6497
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 08:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4glALw4Q/S1uh/iBYaa16wCGln241PgIz34aD88DyPk=; b=V3+m5hceCOmocJt1y5Yt71kU+4
	gEVJcoF4Cyn5sKH/IhkP4LGe+Dv6XkqM/ED92pAffN3/XCqq6jzD/b6vaqHlsPWu91FZgaYoU8Lgx
	6KN27qkMxpkaadMnKDarNrlRDwtMy4O3Lq02eYG00XjcKO0VXoopujjqZJ/2nS/VHb6pskSV25p85
	Mevlwq83g0PqWkbb9VE7vtmndb6GSNBjF/2cYxv8YbXMedWdoRNBZz2SLa3P06MFzZv6rLbw/cCMP
	IsjGVIKnabQD3U44FJyYyuCJPoz5fDbZDU0CHCev1pGoTQE/8PlIm7JFbqTIYT5a75RqW4Gj5Uxaf
	SaJ75uow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svC78-0000000GOoi-3LxH;
	Mon, 30 Sep 2024 08:50:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svC5d-0000000GOXy-363b;
	Mon, 30 Sep 2024 08:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727686147;
	bh=VJzCGMMRci/BiZjulnBSG77pRU6y2deSbKtvy/pU2pY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PEZEQAo4oB0HrZ6hyP//YB/w7n6xJyG5PinuwSHzdOx8AOmj5Ixfq89MPhXWSxLjH
	 KEi+/4bQzhnDIybedEyuX/RZBdi7K8UmoiaXn2zHwV4nJFYdlPrA1AQlUVIEjBMKOm
	 UHx623s1TF8BknFyk1paXHosCBPSeYgwLrIC5b+D9DMlPRCWVXDH24ixypfyzzCLyy
	 EQcIcVE0GLjGByWkc7qohQpkONmrKnrc9nPPDH1iJi/2XuSWVxbgYUl9ANpMGPvYe7
	 1skqXCgezJWh+s/+N3XhNKLqRLmKJhmHh7OtBnB7BywKpUWNuxu7j4Q6lMPCXeOAz4
	 kdQ8HOqp53crQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 98BEC17E10AB;
	Mon, 30 Sep 2024 10:49:06 +0200 (CEST)
Message-ID: <8883c84d-8333-4b04-83b5-022be5b6153c@collabora.com>
Date: Mon, 30 Sep 2024 10:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: iommu: mediatek: Fix interrupt count
 constraint for new SoCs
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Ben Lok <ben.lok@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240926111449.9245-1-macpaul.lin@mediatek.com>
 <20240926111449.9245-2-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240926111449.9245-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_014909_967868_FA56F407 
X-CRM114-Status: GOOD (  20.53  )
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

Il 26/09/24 13:14, Macpaul Lin ha scritto:
> The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'interrupts' property. The error message was:
> 
>    infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0],
>                       [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]]
>                       is too long
> 
> To address this issue, add "minItems: 1" and "maxItems: 5" constraints to
> the 'interrupts' property in the DT binding schema. This change allows for
> flexibility in the number of interrupts for new SoCs.
> The purpose of these 5 interrupts is also added.
> 
> Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   .../bindings/iommu/mediatek,iommu.yaml        | 25 ++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> Changes for v2:
>   - commit message: re-formatting and add a description of adding 5 interrupts.
>   - add 'description' and 'maxItems: 5' for 'interrupt' property of
>     'mt8195-iommu-infra'
>   - others keeps 'maxItems: 1'
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index ea6b0f5f24de..fdd2996d2a31 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -96,7 +96,8 @@ properties:
>       maxItems: 1
>   
>     interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 5
>   
>     clocks:
>       items:
> @@ -210,6 +211,28 @@ allOf:
>         required:
>           - mediatek,larbs
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-iommu-infra
> +
> +    then:
> +      properties:
> +        interrupts:
> +          description: |

Do you really need to keep the formatting?

If you rephrase that as:

The infra IOMMU in MT8195 has five banks: each features one set
of APB registers for the normal world (set 0), one for the protected
world (sets 1-3) and one for the secure world (set 4), and each set
has its own interrupt. Therefore, five interrupts are needed.

...you won't need the bar :-)

> +            The IOMMU of MT8195 has 5 banks: 0/1/2/3/4.
> +            Each bank has a set of APB registers corresponding to the
> +            normal world, protected world 1/2/3, and secure world, respectively.
> +            Therefore, 5 interrupt numbers are needed.
> +          maxItems: 5

minItems: 5

Cheers,
Angelo



