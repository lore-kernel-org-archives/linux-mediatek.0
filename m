Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55600C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jp2AsKz9Mc2ss/Pdfp/W7zz2lsRwpYDJ40Lr+Y7maos=; b=uIg5tm5m0jWG8Axy8NU18QzO6l
	YM7pZNjtqTpNgeRmbrVyH73CzNJlecL+SCWhGB0e+ZXPn/+3C8veA8HxPd3sOZ2BcqFJ9ZENHPsio
	xEbYSZHymAcn9XjVCFpCfwM+Z2WPnMgBeW8s2vEyGERoHUrvq9czUX8RBXGde7r7OmU/AMZGfgNG4
	cjtaeZjjhDIJntJM0gDOdAX/5NqADRTu7ZzdeLPT3Vziw5Y+2sN3n7p+QN4PxlF4E0M5q3M23vRoH
	hpBjDyyU7oe0PaVvh6jJFcJ743yyheOrUQ0PLkKWlt2RII/Tlw/7K/XZblUjd8G7Ki/o3jIEf7+aQ
	SEj7NTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDR4P-00DtI7-N9; Mon, 18 Jul 2022 13:45:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDR48-00Dt1O-3h; Mon, 18 Jul 2022 13:45:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4FAC46601A60;
	Mon, 18 Jul 2022 14:45:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658151936;
	bh=EXKnw2OAVh4UgVY6zw8D6FiE6rIcc5hXLWhj8edCwEQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b7IVnsGHPMh5g88WN/m/HeqRFgQ7jYT5LBJjdDNG5gehWg8aValkTW6urTd3VMSVD
	 RNsQuIWp7FLWTitkrc9L6toHnrb0Y3MXddAwe1GPuqxN80ybV9uKrZyck+6jG83cj4
	 sMjRoukjzfpVhrMF6glrxJrBe00cyb7wPdYxLnpc//4lsFosF5T8bCTDbnJEiG+Bcr
	 J1SQMhz1ZwbABKqvIlAhlZDMbZo1cx18XuWsJVrxBwvPLODfj3yWLLQ0Ta3NvKGMRy
	 VClcdoIA3/H/wNzZu1gCe2blZCzc8sP7DldFzpOIrO4TSM9mx1Fm8ZFIbI70cCPGLX
	 ZGiNNM1nI8f/A==
Message-ID: <512118d1-c571-94fd-4fdf-16fe3995f592@collabora.com>
Date: Mon, 18 Jul 2022 15:45:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] dt-bindings: iio: adc: add compatible for mt8188
Content-Language: en-US
To: Hui Liu <hui.liu@mediatek.com>, jic23@kernel.org, lars@metafoo.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: srv_heupstream@mediatek.com, zhiyong.tao@mediatek.com,
 guodong.liu@mediatek.com, johnson.wang@mediatek.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220718123930.24373-1-hui.liu@mediatek.com>
 <20220718123930.24373-2-hui.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220718123930.24373-2-hui.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_064540_418678_86C4CE7C 
X-CRM114-Status: GOOD (  12.48  )
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

Il 18/07/22 14:39, Hui Liu ha scritto:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> This commit adds MediaTek mt8188 auxadc in dt-binding documentation.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> index 65581ad4b816..7f79a06e76f5 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> @@ -35,6 +35,7 @@ properties:
>             - enum:
>                 - mediatek,mt8183-auxadc
>                 - mediatek,mt8186-auxadc
> +              - mediatek,mt8188-auxadc
>                 - mediatek,mt8195-auxadc
>                 - mediatek,mt8516-auxadc
>             - const: mediatek,mt8173-auxadc


