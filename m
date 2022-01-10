Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64202C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B086Q4MXDmaH1VEehjxMdoSv1H3vpqPk2vlwhwF8dGk=; b=g5iop7vIJ7S5/ywo6Szn6AzoIT
	qnyBwrPZPuVJkLX5Qj4+Yf44qik5vOb0XPa2T3GgfWsxgJIIIkCgFaZaaJe5KrurdbyO+H7SvGPkl
	IDmMFhAnGPK/vaPg+oDIiTjeOSePbLT8UqOFS0KtFbIku7rlNiDwwIFZb5u+wBClM6jbtOIjcCoeH
	ukuOEttpxo6qcypp1JOQ3mm3fxe8sARJwOcchedqweAjcvue1i03XvmgFtCe50l+6+iXCcYpJgy7x
	7aAP7Z90aGnwqoPLpusfhgQoaCAxwOw4sWvr0+7HOzBCIdC58QjsOwpqp9lOAWquNw/Mh6S1dl9Pi
	B7RzLd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rUY-00AegG-Gn; Mon, 10 Jan 2022 10:01:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rUM-00AecJ-BN; Mon, 10 Jan 2022 10:01:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 457071F43727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641808876;
 bh=sCbXhyaML9yHLR6eOlxKHATu7/M/ieT6rftGRXxPcvs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VcTCvAr6h2ngNSpA4KSiENz4jlKUdD8W5M6Da9YQ0wZTS9frVuM8S9mn9ua6wyzf4
 L6AQnSXUTcHCeRE1vbBTL9STlrdHgtRbf5ZlH5h+BaXhsH1Kie4VabwWx10fDANhJ+
 Ohe9z5OdAvg0MC21100rjvRlm/fhYJXCdBMp8+Tzj+Phs5nRYcqfVHrYI5bqTrtCpP
 tTxLswO3cmMXMY1APQXv6L04iEj0iNuGCBo/TlyoxITGbH9YVrPq1Js3LIvty9Omjd
 1NNmiqNwE6+sxccRP7A+8qJmb4QKnZ8bUsvNJ102y+VK1uX27d7ZIEA+J9NlXfK3Sw
 Qfk3MJsYFpEcg==
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add compatible for Mediatek
 MT8186
To: Guodong Liu <guodong.liu@mediatek.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110084841.575-1-guodong.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <02a18741-2015-73d2-9a5c-a28c1b15894f@collabora.com>
Date: Mon, 10 Jan 2022 11:01:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084841.575-1-guodong.liu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_020118_561822_4A55061C 
X-CRM114-Status: GOOD (  14.75  )
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

Il 10/01/22 09:48, Guodong Liu ha scritto:
> This commit adds dt-binding documentation of auxadc for Mediatek MT8186 SoC
> Platform.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> index b939f9652e3a..65581ad4b816 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> @@ -34,6 +34,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8183-auxadc
> +              - mediatek,mt8186-auxadc
>                 - mediatek,mt8195-auxadc
>                 - mediatek,mt8516-auxadc
>             - const: mediatek,mt8173-auxadc
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
