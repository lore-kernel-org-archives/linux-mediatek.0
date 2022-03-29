Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B65CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ml9pSnWwfWGrJpsk1G4u5sxB3PA4cU6x4HwEYodarlI=; b=JDRev+AazjBpxu
	NRyW0/6ACcCKVxnkiSu9uSmg8Wjho6Aq2DCcxBJMDwOivgRuhRuJ6R7gpFxPGbY3k/LrwOQYwvqQa
	t6GIhFkTzxQ6j7K32dYUViVlrN/tOYzGeXvaZf4AtSv8Rgix1zxVOyPjTyuTAo10kHe4WJIevwI9i
	SNlWq5DM4GLRxrepHnr1Kk+KvUrG8CxhDoNJDEp5ZPtiajYjaH0CEGxwoIfM8dF57wqi0iVX0dFxg
	G1RUwNpatgFL14vp/7INedRv7rtih+7izxvuSCRBItRn205vMPZ6wJLi2CseBn2ckYPP01vR/MO2w
	TH5UFxDtOdrfNKWG6Igg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZBC2-00CF8T-CA; Tue, 29 Mar 2022 12:43:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZBBp-00CF60-Pd; Tue, 29 Mar 2022 12:43:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1FAC21F43DAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648557791;
 bh=1dMTzWJp1uIWHr4U4R2cLRHX4y9FdQ6mbt6NFWKc5z4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mRe65i24mVzokT7MmNoI9yfi9PIvL4L2m7CveTbo/csEP50NiHEVtgHc/frCoWVK1
 ixqrb1W5uhMjJrZnZEbHsVoIc/cSVvJtHwKx48jO6/YCyEZCCwdwkgk1dIXcLwNnqS
 G9q7iFAe9Io+l4P1ZyZaLoLRZRQCAoKjD+hb1tVIMMW975sBNTmxnVzkjklS/M5ohg
 THyGxelpACJ+nT1n+3GmoFe8FIh6mukc3kzjGxspWZ90MHzlYbJHYu0Lq09FxcCFEg
 SxN+XyJUSrZmjJ4r/a7xaZWIisFhaLAmSniSo++D3XfLkTszB0gxdiYjgvvlMH9G4e
 0zk+YbBQTfsOQ==
Message-ID: <d720a5e9-d078-6c60-f55b-0506c4b4e1fa@collabora.com>
Date: Tue, 29 Mar 2022 14:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v12 2/3] dt-bindings: mmc: mtk-sd: increase reg maxItems
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
References: <20220329114540.17140-1-tinghan.shen@mediatek.com>
 <20220329114540.17140-3-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220329114540.17140-3-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_054314_029510_A4D98A05 
X-CRM114-Status: GOOD (  13.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/03/22 13:45, Tinghan Shen ha scritto:
> Add optional host top register base for the reg binding description.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 7032f7adf3ca..6d41bcec900f 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -40,7 +40,8 @@ properties:
>             - const: mediatek,mt8183-mmc
>   
>     reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

it's just maxItems... adding minItems: 1 is not required.

>   
>     clocks:
>       description:


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
