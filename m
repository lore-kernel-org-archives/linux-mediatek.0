Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B035C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTce+hzPpk8a3sClU91jWUromCr+sCsfAtb+2Btv5TM=; b=pg8agbCeYUAqMe
	iMGFtSNU7UAr8FAUiNyKxAFDzV4i8oMFgveGEKHSZykcGSa+ek/E16cpYqj6hxwkNKYRuqqhwkGiR
	iNObC3oywjjgf58sZUmvUyselT6GUgePj6rO9cXoO5i8MtYMAiTqt1LukSkxjq/sfilHPuKSrC+zB
	oMP33YqTQkFVS/4lkbhSHAnjHxxdGWWT6MueOpt2LRrXEuvZj18hiKtOfpi3MFyyId+shoE//Pf7G
	p3Z++5e+1Umaddh37Jh2LaNWe3u8VvVHufeOnLrtPgJYQEcXExGyZHVtbVfmnnqPV8x5lIXeSPMUt
	HpSIeddgiy4x9NpIK6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThg4-004ryL-Qr; Mon, 14 Mar 2022 10:11:48 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThfO-004reb-Fc; Mon, 14 Mar 2022 10:11:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8D0BC1F43E0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647252665;
 bh=xaKt11+Jh3lRBkYJKVviC3jVdM9j4DlhR4zdg8VlwXA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CfjiweefgYw0riOaABekr61feqDVxSYi+oqEIYBB/+WUtoLjla4juYb8vBNbz4xh1
 rwHifyROH2LELgaGXoq5xBuYjplngDPJpTQgAmHVJJ+jDPQlwHmyXAy1+Kn1qyWsIJ
 3fKo4c4oSTmeSJD/OfK8EZ8zcV/cf+/cM4/nESEBGdtvD4ECcCWvmelUfGvZU8l8SB
 Q8b7/1AQ6e+XzJCRjLGmX8In51/MDtTSIaCwCKQkRdB0Q2opLP2WjAflsaVO0IMqZP
 vHa8yNLECCkNtGdJ9gHYVfOBPEFzfMprhgPUC/75spgLGgivyBxPA1MdTQZAS2GRUn
 hw0/hq4q6MSeg==
Message-ID: <2ff86f11-a85f-b089-7338-558dcc0c8c6d@collabora.com>
Date: Mon, 14 Mar 2022 11:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V7 3/5] dt-bindings: display: mediatek: change to use enum
 for mutex
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 jassisinghbrar@gmail.com, fparent@baylibre.com, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
 <20220314090033.25773-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220314090033.25773-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_031106_702553_1F111AD3 
X-CRM114-Status: GOOD (  11.58  )
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

Il 14/03/22 10:00, Rex-BC Chen ha scritto:
> All single entry cases in mutex can be merged as a single enum.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../display/mediatek/mediatek,mutex.yaml      | 24 +++++++------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> index 00e6a1041a9b..b470fbb1b40a 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> @@ -23,21 +23,15 @@ description: |
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-mutex
> -      - items:
> -          - const: mediatek,mt2712-disp-mutex
> -      - items:
> -          - const: mediatek,mt8167-disp-mutex
> -      - items:
> -          - const: mediatek,mt8173-disp-mutex
> -      - items:
> -          - const: mediatek,mt8183-disp-mutex
> -      - items:
> -          - const: mediatek,mt8192-disp-mutex
> -      - items:
> -          - const: mediatek,mt8195-disp-mutex
> +    enum:
> +      - mediatek,mt2701-disp-mutex
> +      - mediatek,mt2712-disp-mutex
> +      - mediatek,mt8167-disp-mutex
> +      - mediatek,mt8173-disp-mutex
> +      - mediatek,mt8183-disp-mutex
> +      - mediatek,mt8192-disp-mutex
> +      - mediatek,mt8195-disp-mutex
> +
>     reg:
>       maxItems: 1
>   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
