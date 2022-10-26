Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EEEC38A2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rETPEk1QmQkLedue9Aq10b8Dr7LRzg0Ndi5czbR2hBM=; b=UaBXI7RM51ezkXMeBa7dsl6JiS
	wuO6u+OXtTDk9ghSwayNMCrdM4hxSooslRGzIQQXxQOQUx9eFx+xiE/oE7YkPmuaI+jNBxXkKekFY
	OWMKLsbEVLELucjoKS9adzqUflzCBJZohddR+nssDn0anzv0bv+n7a1Fa9ZA4ipQYsNUOEYRLQWb2
	4L67xUajHJvMjwNFlEUxJWkKbrIeJJijZmrbFIXBDaXrmCODU9i6QRRE0pEzvhmre80dLDTaWUclJ
	pDNSwZ7e8NQ/EdDV9JHoaU/1Rucnk20GcuGHJWhSjVjduzQs8/6GyPOdrw9AAnkd4qRi1UjS8YoX0
	YR1Zfo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oniJM-009sqa-Ts; Wed, 26 Oct 2022 15:27:20 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oniJA-009so4-D0; Wed, 26 Oct 2022 15:27:10 +0000
Received: by mail-ot1-x332.google.com with SMTP id z11-20020a05683020cb00b00661a95cf920so10109521otq.5;
        Wed, 26 Oct 2022 08:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rETPEk1QmQkLedue9Aq10b8Dr7LRzg0Ndi5czbR2hBM=;
        b=B54fnVfPIbpKgzqs0UjFdW9Dwxh0Wp9I9IRyxLfsKmP0Mp73HqbzpGVooDNWoZgeoT
         6cIfWt2pIJfaj0DDk5q306TAGKrPs9Fxa+L/PJNvzuFZq9NAXocoYQ7GgX2lxwFV1xxo
         8n/J+XcXsQUuwuYp0vpQWNvjN2396K0QfnRIkW5Zf7n8HQ3jOhGThDRCt8BXFvIMwbtX
         gn9I6hft/vhUM5XaUwAFKLs76MNsXFntXHzM/w2ZprifyvGHMqp9MW5KmoyulztQ/0pX
         4OVxLlOilLlj7Kgy1S9rTWhLppX5qxiKxoBQvcA4bg4xqxsTmfSglXMAEgYGUbuEJWhI
         j6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rETPEk1QmQkLedue9Aq10b8Dr7LRzg0Ndi5czbR2hBM=;
        b=hiz7yQE5xl1FbiWVHGZZ/0RmxzI2PE82pI5QD78hqC9AllO6zdKHdmWhBK62jY3f7O
         GEo43S2YxCTV2R4vabjYKjvfkIUNsuEsr1lZF5zKKlU+djMo5dk9OSala8c00NtWFdep
         /XiZTpb2Bu/S4R/MwSJmtDtIVzinbnoVcBFZtAVvATsYevU3jvbMA66I1Ke8saiD61Cg
         0mB2IBAVjWy+7VldXlNIB/Z48gW/81r11OjALigAYerVgugtXda5rCK9sd7uOtW1Bryb
         lif2eptydGmAjzMGjvZCJMwb4uAceAQkW0gNJmL7jKiSfotwGcx2lwDg9LwGFwT0Q3MG
         GuvQ==
X-Gm-Message-State: ACrzQf0aL0r9g3UB46/H3pv5FdkTLP8tTXXdqWNnQvCaKf2USp+mx+Ti
	SSACWwdh3oPJMTy/xdODm/s=
X-Google-Smtp-Source: AMsMyM48086VLKArZW0qg/GJXwajJeYDYn0Mw0euDn179MpRlshE5OrXRRv/dWeDXWc6cWBR3Sbhyg==
X-Received: by 2002:a05:6830:603:b0:661:b07c:bf24 with SMTP id w3-20020a056830060300b00661b07cbf24mr22137103oti.208.1666798007507;
        Wed, 26 Oct 2022 08:26:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id fo27-20020a0568709a1b00b0013b0b19100fsm3218662oab.32.2022.10.26.08.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 08:26:46 -0700 (PDT)
Date: Wed, 26 Oct 2022 08:26:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Runyang Chen <Runyang.Chen@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RESEND v3 1/3] dt-bindings: watchdog: Add compatible for
 MediaTek MT8188
Message-ID: <20221026152645.GA2946818@roeck-us.net>
References: <20221026063327.20037-1-Runyang.Chen@mediatek.com>
 <20221026063327.20037-2-Runyang.Chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026063327.20037-2-Runyang.Chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_082708_480942_DDE10E38 
X-CRM114-Status: GOOD (  15.09  )
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

On Wed, Oct 26, 2022 at 02:33:25PM +0800, Runyang Chen wrote:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Add dt-binding documentation of watchdog for MediaTek MT8188 Soc
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This conflicts with the ongoing yaml conversion of this file
which is still not accepted.

https://patchwork.kernel.org/project/linux-watchdog/patch/20221005113517.70628-4-angelogioacchino.delregno@collabora.com/

Nevertheless, I'll apply this series to my watchdog-next branch
and assume that it will be included in the next version of the
yaml conversion patch.

For my and Wim's reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 762c62e428ef..b900c85d4560 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -17,6 +17,7 @@ Required properties:
>  	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
>  	"mediatek,mt8183-wdt": for MT8183
>  	"mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
> +	"mediatek,mt8188-wdt", "mediatek,mt6589-wdt": for MT8188
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>  	"mediatek,mt8192-wdt": for MT8192
>  	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195

