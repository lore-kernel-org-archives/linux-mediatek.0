Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDB4CCF9E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Oct 2025 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tU9QxlqVuGegESr+I2jUpPCIHQMHB3pTOdd+wNW4O98=; b=OKUit8eBgkqHIGQfFs1h1Uf8As
	miEX3bdJvHTVwftxel8l5L7pot74bciTJiA0g0Avv9iNtCQ8L/z+6nCsfBxz6j9KDDIMkIhB64eVG
	eAbvF/XY2Qcbw0EArzLTC8YC8sJhd77/Xs2ZnaK+zi5UVBGTUODiYyjqt/oC8RHFmt/DofrzydIk+
	69LOpgKJtyhLNkLZBZrlR74OUn5wW8MMS+4mtxEAH2fkwwubtl95afxUC6yXYOng17WJC1ojib7RT
	LkIGMacN/TzU2ucET7cPux2MUAJMOGffxq91u78Lr7rbw5KveoqBm73XMI4lYj1gTFdpshmk3w9to
	/eAL5tWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4cy-000000012ca-05uN;
	Wed, 29 Oct 2025 11:46:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4cr-000000012a7-3cql;
	Wed, 29 Oct 2025 11:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761738358;
	bh=u/aqBEyYqByF3ozze0YJu0YuHgdtvDeMsN7BUsRpv4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k5eTs6SB4dsbkVyUNcd9fYQehBXkTJfOxaoXGZvg2Z9A6HDT/zT2B+tOywLOi3HPv
	 crSXwSOgcszVNsAOGmdUjBtWpKhRFFtQWHTxU+zXG92on59XquPpceq2MRCYObAATQ
	 kXNxX9rXfa78NDNGgLNAZKlpNnPdJh3QpKSLgT2kXCZ/FENkPFHWeNvCSSo9Peo/lf
	 SHCbAdxQCF+mz9PbAZWIL0kbAzlQVT/8rMt9E4y/bYnajxn7vtbWQ1VPk/5wSQ+ox2
	 hHA8vcVleTiBPHJVwrbxxpasbf3tqim8SxZRL+VPqemrWJNPQGmE4MvJODRm2vujko
	 iaVO3l2E0yP1Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 76E9B17E013C;
	Wed, 29 Oct 2025 12:45:58 +0100 (CET)
Message-ID: <dcb66482-bd62-41d7-88d2-c1e271abe90c@collabora.com>
Date: Wed, 29 Oct 2025 12:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
To: Zhengnan Chen <zhengnan.chen@mediatek.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251027121443.16783-1-zhengnan.chen@mediatek.com>
 <20251027121443.16783-2-zhengnan.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251027121443.16783-2-zhengnan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_044602_097723_4040093B 
X-CRM114-Status: GOOD (  22.84  )
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

Il 27/10/25 13:14, Zhengnan Chen ha scritto:
> Add binding description for mt8189.
> 
> The clocks number of mt8189 smi-sub common has a bit difference.
> Its clock count is 2, while mt8195 has 3. Therefore, the minimum
> number of clocks is changed to 2, with the third one being optional.
> 
> About what smi-sub-common is, please check the below diagram,
> we add it in mediatek,smi-common.yaml file.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
> ---
> Hi Angelo,
> We add a diagram in the smi-common yaml, We are not sure if you agree
> with this. thus I remove your R-b.

I agree with that, and the diagram looks good.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Thanks.
> ---
> ---
>   .../mediatek,smi-common.yaml                  | 25 +++++++++++++++++--
>   .../memory-controllers/mediatek,smi-larb.yaml |  3 +++
>   2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index 0762e0ff66ef..454d11a83973 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -25,6 +25,21 @@ description: |
>     SMI generation 1 to transform the smi clock into emi clock domain, but that is
>     not needed for SMI generation 2.
>   
> +  The smi-common connects with smi-larb and IOMMU. The maximum inputs number of
> +  a smi-common is 8. In SMI generation 2, the engines number may be over 8.
> +  In this case, we use a smi-sub-common to merge some larbs.
> +  The block diagram something is like:
> +
> +                          IOMMU
> +                           | |
> +                       smi-common
> +              ---------------------------
> +               |          |           ...
> +              larb0   sub-common      ...  <-max number is 8
> +                   ----------------
> +                    |     |    ...
> +                  larb1 larbX  ...  <-max number is 8
> +
>   properties:
>     compatible:
>       oneOf:
> @@ -40,6 +55,8 @@ properties:
>             - mediatek,mt8186-smi-common
>             - mediatek,mt8188-smi-common-vdo
>             - mediatek,mt8188-smi-common-vpp
> +          - mediatek,mt8189-smi-common
> +          - mediatek,mt8189-smi-sub-common
>             - mediatek,mt8192-smi-common
>             - mediatek,mt8195-smi-common-vdo
>             - mediatek,mt8195-smi-common-vpp
> @@ -108,19 +125,23 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - mediatek,mt8189-smi-sub-common
>                 - mediatek,mt8195-smi-sub-common
>       then:
>         required:
>           - mediatek,smi
>         properties:
>           clocks:
> -          minItems: 3
> +          minItems: 2
>             maxItems: 3
>           clock-names:
> +          minItems: 2
> +          maxItems: 3
>             items:
>               - const: apb
>               - const: smi
> -            - const: gals0
> +          additionalItems:
> +            const: gals0
>       else:
>         properties:
>           mediatek,smi: false
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> index 2e7fac4b5094..9a5dafd7c07e 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> @@ -27,6 +27,7 @@ properties:
>             - mediatek,mt8183-smi-larb
>             - mediatek,mt8186-smi-larb
>             - mediatek,mt8188-smi-larb
> +          - mediatek,mt8189-smi-larb
>             - mediatek,mt8192-smi-larb
>             - mediatek,mt8195-smi-larb
>   
> @@ -85,6 +86,7 @@ allOf:
>               - mediatek,mt8183-smi-larb
>               - mediatek,mt8186-smi-larb
>               - mediatek,mt8188-smi-larb
> +            - mediatek,mt8189-smi-larb
>               - mediatek,mt8195-smi-larb
>   
>       then:
> @@ -119,6 +121,7 @@ allOf:
>                 - mediatek,mt6779-smi-larb
>                 - mediatek,mt8186-smi-larb
>                 - mediatek,mt8188-smi-larb
> +              - mediatek,mt8189-smi-larb
>                 - mediatek,mt8192-smi-larb
>                 - mediatek,mt8195-smi-larb
>   


