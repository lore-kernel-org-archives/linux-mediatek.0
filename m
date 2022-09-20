Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF82FC6FA8B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOJBlqHjlJkWuHQpqj3xrC4KkM/8IPrpk0Ms8JO4giQ=; b=eq3iKX4HEIOS3ZE4d3Kxu6eGPq
	fLiLGNSEjQEBtRnM7eFGoz7dWBj3c0vP2+Oww2WZ9BtQS9eZelEnuVtpznUiaFF5a38CJ2SujWoLb
	mRkYuvVUcxcOdjg6DKJpEVkmMliCyeC3IFJOebpDcoH9jvUbwsj6uc01kmxo2kR4LofMmFjp69UXU
	dKt8NhDsE6rbJAHnXyb8lrAFLZz8L3kUIF4JlIkmDtKy1kNwKUTzjXBd+vxt41FpWyjGbqQUoWD7y
	+/MRwaHHNgZ0HKrseINhAtsoVCCKDInsnpT8lACm1mo553gs6SwqMCeBd/kF9hrJ6o6nI/JP6NVGV
	P1pmNP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadDA-0042na-NV; Tue, 20 Sep 2022 13:22:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadCv-0042fs-H0; Tue, 20 Sep 2022 13:22:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 92FD46601F3B;
	Tue, 20 Sep 2022 14:22:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663680153;
	bh=Pk+W1ozfQ0SCVra3zDNF6XprepX+dt5BIPhJgQVPHCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ayMX/uXRw+VaEpEORAOiID4m6Ob3nBFdEr7OcT5IUKvutOwyjmbSgw5wqzarIS1Zk
	 uefqwVJj5VPpRw4LoMbOyJHVaXP0Xcvj3TV4gFa4p0xT8HY3CcNfA4QqH0hyGkaqBa
	 mKIM3cvd5LMdmud7IInQHvQWlMLygzt3k9neWpryFJvPVsxR7vi307VoSJqwFMR1my
	 kfeGepaL13w0b4MZ3Gx2z7UWenntrhL1tQ1ZwBnqbiRxu0OnUadkXtVMtFMuncQo/k
	 t75voKZHwb6/C6xlekPQcdisGpzyiCj8HsKsLWCU05eElOGKTTPoz+zI9DTSlaU6Ju
	 2FTDiFwlttdiw==
Message-ID: <3ed55b0d-6c14-79a1-b4c1-5764c667d195@collabora.com>
Date: Tue, 20 Sep 2022 15:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/2] dt-bindings: net: mediatek-dwmac: add support for
 mt8188
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220920083617.4177-1-jianguo.zhang@mediatek.com>
 <20220920083617.4177-2-jianguo.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920083617.4177-2-jianguo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_062237_808032_ED7EA89C 
X-CRM114-Status: GOOD (  15.60  )
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

Il 20/09/22 10:36, Jianguo Zhang ha scritto:
> Add binding document for the ethernet on mt8188
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>   .../devicetree/bindings/net/mediatek-dwmac.yaml        | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 61b2fb9e141b..eaf7e8d53432 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -20,6 +20,7 @@ select:
>           enum:
>             - mediatek,mt2712-gmac

Please keep the list ordered by name. MT8188 goes before 8195.

>             - mediatek,mt8195-gmac
> +          - mediatek,mt8188-gmac
>     required:
>       - compatible
>   
> @@ -37,6 +38,11 @@ properties:
>             - enum:
>                 - mediatek,mt8195-gmac
>             - const: snps,dwmac-5.10a
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-gmac
> +          - const: mediatek,mt8195-gmac
> +          - const: snps,dwmac-5.10a
>   
>     clocks:
>       minItems: 5
> @@ -74,7 +80,7 @@ properties:
>         or will round down. Range 0~31*170.
>         For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>         or will round down. Range 0~31*550.
> -      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
> +      For MT8195/MT8188 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,

For MT8188/MT8195

>         or will round down. Range 0~31*290.
>   
>     mediatek,rx-delay-ps:
> @@ -84,7 +90,7 @@ properties:
>         or will round down. Range 0~31*170.
>         For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>         or will round down. Range 0~31*550.
> -      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple
> +      For MT8195/MT8188 RGMII/RMII/MII interface, Allowed value need to be a multiple

For MT8188/MT8195

>         of 290, or will round down. Range 0~31*290.
>   
>     mediatek,rmii-rxc:



