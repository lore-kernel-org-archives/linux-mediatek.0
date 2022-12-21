Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592E1C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrfTz+FA7l1WvGEQ5NrQ5qvwcG5iNKwh/VCJrkNyDxs=; b=ET/fVtRjEqgsPF5bqzhb2WiHkk
	GMAeYKcKzwf3OQ9qPu2QjQtYxTKHdnfiEnkoCMTXABw7KknYMAP4tUsP5rNKLq+KE8I/DQ+/HHSY5
	oXOyLfYp1tGCyHLSpEJucJ+2ta5xrCzU1tL6IyNA8XsIEDWUgZon3ZUhjPNIFAZ8JvkKJECl4chn/
	q6HiU20bdrCHjN3HUtJNV4178Qy/UTeVtbbdIjYMPhvizswAQhFAuWfSF+iV8FdugtmmkQJhHZMNQ
	Lp16PktUB/ChFuZYqxFC2UiPj+1IVBk+I+3Ij4+k4mZo8gTzlyLx1aEbZHrIu7jpwA1Fttu/dRrIA
	BnR8Pv8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wLC-00DRJy-L2; Wed, 21 Dec 2022 10:28:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wFF-00DN34-Vq; Wed, 21 Dec 2022 10:22:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 22B776602CBE;
	Wed, 21 Dec 2022 10:22:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671618160;
	bh=pRdy65QphCqN2vQ5O/mz0ULv4FBeeC/+/+Y1zUgP2Qk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DIsMcIWJh0i7ulRcZNm7/6RuQmqouzvkGcY8SPpTphWjZW87CS/2SE5Rn4/92rasv
	 yu2bIoSr0lloczZezb8nTyZdFze4DTFovjZHcVUeYwnCHMCJAwuljADq6R97DFm2Mq
	 qOaD6pGf8am4YbqYOEn96FMhnu+7WD39anX2uL+PtERCbtpOxdk9eIRiTVy3Ts76t3
	 nsvBHYc3i2cLfyATz5NYr3PXTG7QgpU8ahC7A8bBnh2ccErLbrYBeSaAP2Tap8akBm
	 DqA2hO4vVXCVUcwiNc/g+xE2PFPOCSHsvmQKRH1XS/A/uxP8m0JhKUlHa5pTfRRLpS
	 YvydVeb/Qs85w==
Message-ID: <ec927229-cf03-136c-5629-22719110313a@collabora.com>
Date: Wed, 21 Dec 2022 11:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/6] dt-bindings: arm: mediatek: Add missing
 power-domains property
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
 <20221221034407.19605-6-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221221034407.19605-6-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_022242_215430_AB32DE94 
X-CRM114-Status: GOOD (  13.87  )
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

Il 21/12/22 04:44, Allen-KH Cheng ha scritto:
> The "mediatek,mt8192-scp_adsp" binding requires a power domain to be
> specified.
> 
> Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   .../arm/mediatek/mediatek,mt8192-clock.yaml     | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> index b57cc2e69efb..ce8dd2bfb533 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> @@ -40,6 +40,9 @@ properties:
>     reg:
>       maxItems: 1
>   
> +  power-domains:
> +    maxItems: 1
> +
>     '#clock-cells':
>       const: 1
>   
> @@ -47,13 +50,27 @@ required:
>     - compatible
>     - reg
>   
> +allOf:

allOf is unnecessary here.

Regards,
Angelo


