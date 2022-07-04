Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3099BC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNFm2851XBVegxfCzHkFtbM9oUp8viI7LD7apJuf8zs=; b=epLA2hjH0E39JXGnVCJ7kg8UbW
	be8yByi3Rjqm6O2td6/wGWQEPtQycr6J76ZrASE9jk7ay9nhgdqFja8rF9QiYRHKzfl5WmkdFhciU
	oGhAwN5xTkk64cziPSjy39WMQhPw+Q0uoX/jPNyGzOOYQv40BClyl6WRrICOZJ1Y9s7g2MqNCDXep
	YkGnTAdBdoIodRJQl3w+dDG6qCMk4R3k0rBhPQXol8WY/mnwmvkqDif4OeJ+7Ixl7kL9uTT/HpwW4
	ADVHR8i5rzuhbDfY/SoqYebBO0PhleZFNID16N7zLMxFXOyvWPllgBA7jxHu8hFUW1vd33ediDvWa
	LQgfxflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Jna-007MBL-Rk; Mon, 04 Jul 2022 10:59:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JH7-006z1d-EO; Mon, 04 Jul 2022 10:25:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3A57B6601638;
	Mon,  4 Jul 2022 11:25:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656930351;
	bh=Wx8uEDF1bProsm5cSCfro4wBLSi7HbQPJbpg+8HNAJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d7/YGXQUpzeLCBjzJEd++c3yKJJusG7XpqrSsyP1cydEw53cmzb/alYIBHozWE92z
	 n0xh+tfKBjvPaJGRGp4SdksyaKV+/nusg//K71k4wsmExcHaTKA64lP91jf57qkJjU
	 beXodcg28++Vk6lGybLoeGHIKfSsVYf/7jRZOQPg6JCpUhZE/Rn/xpFFisEvp5rCql
	 ZtUN6wxxt5gacUsmYzREI4n+Oz3Y8WrIBWeAFHuU4S3G9qQLPf24EkHq/iPxbP3jBl
	 j0ZHUdpvbMYQIHTOzOisvblwj/qFN6SSHs/tcpg9FG4N0UBsbLZ1/KznRsIODrYrN5
	 ThyL3ne2mewzg==
Message-ID: <6aafec78-2699-0cc9-bd2a-5ccd39262e38@collabora.com>
Date: Mon, 4 Jul 2022 12:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 02/16] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-3-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220704100028.19932-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_032553_719886_08BE1859 
X-CRM114-Status: GOOD (  17.67  )
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

Il 04/07/22 12:00, Tinghan Shen ha scritto:
> The max clock items for the dts node with compatible
> 'mediatek,mt8195-smi-sub-common' should be 3.
> 
> However, the dtbs_check of such node will get following message,
> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0'] is too long
>           From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> 
> Remove the last 'else' checking to fix this error.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   .../memory-controllers/mediatek,smi-common.yaml        | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index a98b359bf909..e5f553e2e12a 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -143,7 +143,15 @@ allOf:
>               - const: gals0
>               - const: gals1
>   
> -    else:  # for gen2 HW that don't have gals
> +  - if:  # for gen2 HW that don't have gals
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt2712-smi-common

MT6795 also doesn't have any GALS, please add it in here.

Regards,
Angelo

> +            - mediatek,mt8167-smi-common
> +            - mediatek,mt8173-smi-common
> +
> +    then:
>         properties:
>           clocks:
>             minItems: 2


