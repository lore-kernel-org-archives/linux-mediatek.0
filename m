Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C3FCD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IL1ze+S6w/ZRMm8m6Ec95xYrYWQqpR2DgeHUuufb5iU=; b=Re7Qk3NZhEdZc7gOu2qtqUT7nL
	P1MQVb5qjgSkTcKqbxP3V/2scbcjSaQhxnEQuWzYaY/YG2vvWNambyjn0KmHO6lZXHysbKlMowWwa
	ntwmhmOn/f3INZ0779pz+7zzqJHlALyfMk2qpbgxAJmNFx2NeWr2QBejfL8O/IhngPbLatuoiGWuR
	RnRLYAeq6GnlfquM5Q3Y+MdNSJS9buoiuVckZqy+zqjv4FuvWb53o6dsoYUUZf240Vf3hH8CZ6vbb
	fBrCtrsOipqyiUdGtajzkRKIpCxLGQe/qLxrkR6lP/0ebmJbhC9MhgEZeuBkoUMGCxFoxUD4FuoS0
	E8d7xR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruowi-0000000ArHY-3lko;
	Thu, 11 Apr 2024 07:34:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruowe-0000000ArGY-3V09;
	Thu, 11 Apr 2024 07:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712820842;
	bh=tt7/MyGPZ0CA5pVeuDeyftgQL+6ly8sZZrwn39jMglk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VHttC232BqZgFZ0+jXr4HdgW5VlZoJvf0lClSpWMspk5QJXcWMknVOPTUv8fJkVBq
	 67KLm2FZIVrGTny5FOu+QVxNNZqGd4I8FulfplU22U7uWF6jaSbb9z9ZH7ON+Kbdfr
	 AIQacg9RcGXjYY10eEREzCxtDeLVAOpX2uBJY1nunWMQuGCTzwjOQ56cU+C7BVeLt/
	 qnRu1Ap8HIJPsJc3b0Rxp6nwYGWGnv9WNyboDCCq8ViWzgh5x+jR3tHb41bB4vdYyk
	 2uq/AzPSujtvV9Un+IXjQcIh/olMxCUP1x2p3eDRmcVddiU39gZ6pFevth1JADk5aO
	 svdwINhZcuBIA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 96EC93781107;
	Thu, 11 Apr 2024 07:34:01 +0000 (UTC)
Message-ID: <5cf005b9-d737-4509-a9fb-f0e59465482c@collabora.com>
Date: Thu, 11 Apr 2024 09:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Support MT8188
 dual-core SCP
To: "olivia.wen" <olivia.wen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-ch.chen@mediatek.com, yaya.chang@mediatek.com, teddy.chen@mediatek.com
References: <20240411033750.6476-1-olivia.wen@mediatek.com>
 <20240411033750.6476-2-olivia.wen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240411033750.6476-2-olivia.wen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_003405_105735_CF310F91 
X-CRM114-Status: GOOD (  12.44  )
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

Il 11/04/24 05:37, olivia.wen ha scritto:
> Under different applications, the MT8188 SCP can be used as single-core
> or dual-core.
> 
> Signed-off-by: olivia.wen <olivia.wen@mediatek.com>
> ---
>   Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 507f98f..7e7b567 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -22,7 +22,7 @@ properties:
>         - mediatek,mt8192-scp
>         - mediatek,mt8195-scp
>         - mediatek,mt8195-scp-dual
> -

Don't remove the blank line, it's there for readability.

> +      - mediatek,mt8188-scp-dual

After addressing that comment,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>     reg:
>       description:
>         Should contain the address ranges for memory regions SRAM, CFG, and,
> @@ -195,6 +195,7 @@ allOf:
>           compatible:
>             enum:
>               - mediatek,mt8195-scp-dual
> +            - mediatek,mt8188-scp-dual
>       then:
>         properties:
>           reg:



