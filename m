Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8881C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 09:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlAs9J9OtnasN9NYQ8J7AnmjI2pVJyjMAeiv8uBp2Kw=; b=jaZUhSAvGTspZzTr6/ANqWQPmQ
	y7C3z6Nz4UUXY1flrliAbY6gEXl5LhReR4lJU7vUwNUEjkfXU3FZccpj90dRf9nD+Fkiqh4X9iCTn
	oClGKpEqhBketj+7xn0vlqxzg9xFJqOz19DWK30RrF0ta/kWVHC5oLNOBNkjwppN7VEho5jW756Bd
	bJZtWBXmYv6jarzubHySrat9NjugMHpDo37JJxfWUrd/KOlI4BlfWWW9PbDstMHXMGv1yi9yp1upk
	cM7uwkNl4tFKuKJW+8ueoeGIdmb/lhqJC30484WkKd/bbdaRsHvKOT/2TR30KyEcAlaX/IeUnXurq
	3Dgi23xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OAp-00FT5c-06; Thu, 07 Jul 2022 09:51:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OAe-00FT2u-Be; Thu, 07 Jul 2022 09:51:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9BC2666019AA;
	Thu,  7 Jul 2022 10:51:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657187498;
	bh=9cJkFbeGAUaiuZQ1tk/q71MLcCqv08gXnUsskyh+OSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iklc8JelOW6VhhEVCPvFwprlF/PtO1UiLbHjv1p8qAO+07GEsSfkqhh82UATV+2yR
	 vZ6W6oQ+tUvgQY5mdEh0FvE/gIPW94z2dcz9ukkiOyPbO7UmNnW3RgZgXkc6BCCo7r
	 s5tIDcPkIzF4nyW5SM19RQtEzF52PpcOe3U3gGmTLnmmF/hAxn3Lnt1FKMpfUWw3xq
	 tVS1FvQlWqcUFeyONlRidVYyQwfP524W2AFBQSBsbqimnIimNlTt4R0FVMdozDK3gL
	 SYDJjrJqH7NtrCgD/3Dru5zEKWXq67riOPJ1+ySr0EKY9dQQVnRtuFUb6PxCfMqIZy
	 Wil+TudE8xb+A==
Message-ID: <e0452b8a-0544-5647-5d3c-ce6a208f2b69@collabora.com>
Date: Thu, 7 Jul 2022 11:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: mmc: Add compatible for MediaTek MT8188
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, ulf.hansson@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220707054710.1396-1-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220707054710.1396-1-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_025140_659580_BD3E0985 
X-CRM114-Status: GOOD (  13.33  )
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

Il 07/07/22 07:47, Johnson Wang ha scritto:
> This commit adds dt-binding documentation of mmc for MediaTek MT8188 SoC
> platform.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 2a2e9fa8c188..3fbf33ad4f7c 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -32,6 +32,9 @@ properties:
>         - items:
>             - const: mediatek,mt8186-mmc
>             - const: mediatek,mt8183-mmc
> +      - items:
> +          - const: mediatek,mt8188-mmc
> +          - const: mediatek,mt8183-mmc
>         - items:
>             - const: mediatek,mt8192-mmc
>             - const: mediatek,mt8183-mmc
> 

Hello Johnson,

if I'm not wrong, this should be...
(check with dt_binding_check!)

properties:
   compatible:
     oneOf:
       - enum:
         - mediatek,mt2701-mmc
         - .... everything else ....
       - items:
         - enum:
             - mediatek,mt8186-mmc
             - ... the others ...
         - const: mediatek.mt8183-mmc

Cheers,
Angelo

