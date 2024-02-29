Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1031CC48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 08:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYUv5rJPh/SorAl688L2n26PkFz9iTzQY4+VfEzgzpM=; b=3Qy0BIrIdD8vwR
	83zxfk+X+Nqf6t8SubZ+xziB5AsmHyEt50qyXjxkVBsA0J71IkYQGAcYGKAuxpnxha8tUeSehgYkc
	6FdQrfRVXmhN0jTo0thCPPVABS4LzaNkFKrzszg3pkkNt9Nho2zp6VjMU47/cm8TXKfP29PplDxJn
	ubtMxuDC4gKfc0wyHpRqAOKrdz4TNrbzAJoWz+5+WknoZ0+QyJBCc/5+3y1k5+YsHflH+F8K+jL5w
	4KOOUxcc0h5fvXZe2QCJ53DdzoX9bhz7Q1QzWFHxMDvH+O3gPfq+ti/dfeWh/f4URjJO7XKpoaSnT
	1IDGsQ1rNWpRWku7muTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfc55-0000000CjxV-1v0i;
	Thu, 29 Feb 2024 08:47:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfc4t-0000000Cjuf-4432;
	Thu, 29 Feb 2024 08:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709196461;
	bh=5A1bXwY5sWGlMJX7d22/wAa19nNdvkcM+C+b89+RYZo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gacFkhRm+t8GFM5Unr3otzDdtzlpIOZ1t00Cot/CZXsDAWh1L+cghJgTdPv7Gty9y
	 GQnKfr8Ebcor7ZeMCz2CWw1oSLF0VFvf+UQ1PBI99HMdupej3erNB4ZFu811sfW7xN
	 cFvzr8OlrlRxgjqDC/Og1qvmtL7DFW9m8fB8HVPQndLTD/oktFTnPy568Y80pE/gH9
	 tyiuDmipXR/oAEBq8XvVFgHhcehH0gJBo08kNzksCYO7bZv0HTKQemKdrE0uMJinPD
	 n+B4UqY8eymDs9QKksCK3G8qFH6YIzxRPl46/OajmkKGT8PCEZ4SyN1uAbnzMYFrlt
	 CwUujzEqRPJ7Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8B54237810EF;
	Thu, 29 Feb 2024 08:47:39 +0000 (UTC)
Message-ID: <a717b209-ec31-4a43-a93c-47d65a464c80@collabora.com>
Date: Thu, 29 Feb 2024 09:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: gamma: Change MT8195
 to single enum group
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240229023522.15870-1-jason-jh.lin@mediatek.com>
 <20240229023522.15870-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240229023522.15870-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_004745_214133_77F949F2 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/02/24 03:35, Jason-JH.Lin ha scritto:
> Since MT8195 gamma has multiple bank for 12 bits LUT and it is
> different from any other SoC LUT setting.
> 
> So we move MT8195 compatible from the one of items to the
> single enum group.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index c6641acd75d6..3e6cb8f48bcc 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -24,6 +24,7 @@ properties:
>         - enum:
>             - mediatek,mt8173-disp-gamma
>             - mediatek,mt8183-disp-gamma
> +          - mediatek,mt8195-disp-gamma
>         - items:
>             - enum:
>                 - mediatek,mt6795-disp-gamma
> @@ -33,7 +34,6 @@ properties:
>                 - mediatek,mt8186-disp-gamma
>                 - mediatek,mt8188-disp-gamma
>                 - mediatek,mt8192-disp-gamma
> -              - mediatek,mt8195-disp-gamma

While I agree on allowing mt8195-disp-gamma to have its own separated compatible
as the IP is actually different from the one in MT8183, you can't do it like that,
or dtbs_check will fail validation for the mt8195 devicetree.

That one declares...

gamma0: gamma@1c006000 {
	compatible = "mediatek,mt8195-disp-gamma", "mediatek,mt8183-disp-gamma";

...Please always run dtbs_check when performing bindings modifications.

Cheers,
Angelo

>             - const: mediatek,mt8183-disp-gamma
>   
>     reg:



