Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF3EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBjgcKdcADf42rm3vMBJDE1r0zQEDQwKwtHC37p9XrU=; b=SSdb644KZAzxCI
	y1dEbcnRH6i9F7A7SaUeDEfoqzYG39AZEEB504AgTNjYWwyDZHiBNO4nOSaiJ/iS4rMGWnc+3QyvU
	tUnDwdBNx+WAE3fawc5eQ3JvtIEkyva6IbfyRJF1LcoAgOSCs8gQ6r4sW8q7pt8bCEFeWZGPyftDh
	RxHe0NvA1xYXaf5oBp0rzSX/MnIl458hNCIyO16EON+aKioqET8p8hBBk+M2C/IjtXNGW5WzKRtGh
	auPFAgDTUhul6cLK+TgzSpTpM18vy5c2f2m6KJ5pl/SFCm/KNqJchiNfD/kW02vDFBfx/IxTvlYwS
	XV3Z/NlY4caFBMmBPWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ajh-0023Y8-Ta; Wed, 12 Jan 2022 10:20:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ahn-0022i0-Ko
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 10:18:14 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6378540749
 for <linux-mediatek@lists.infradead.org>; Wed, 12 Jan 2022 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1641982686;
 bh=aPXjXruDq54PeYQ9iMhjoDG9FDgbk3AB64hbIMorCCc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ZTrjUzUcNPQHYTA0VnqAFc5Mp+WdID8hg3+ypr68JZbAcNIgRfxNgS+5jamS1ZWFD
 pqBy5Ht5E6DycXbt007XSgovfUrRPNfUGEwZcUdd6/Q3tSLeRYDulWU/vryibetTHe
 AQwaX4jg1V7Br7UEwkyDhdAFipfwdC7UBDOgE73NeiCDJcohNstOmB524c1ouhBPZN
 yCHuRzZfKxw3sGV9ecImvCyF9btp6RGsQwYBEEy1ECsbf6sUtEs1nyBw/CLxVDk0WT
 F4EeFA4OvRfaBH8qH2sxTJaJ3MHcMvTxLGiA1AywtZBdiHWuzyXuNxzQqDEpIeuo0C
 AVyQZOHNnFeJA==
Received: by mail-ed1-f69.google.com with SMTP id
 g2-20020a056402424200b003f8ee03207eso1866127edb.7
 for <linux-mediatek@lists.infradead.org>; Wed, 12 Jan 2022 02:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aPXjXruDq54PeYQ9iMhjoDG9FDgbk3AB64hbIMorCCc=;
 b=VvksFlycIwEHUKcEityGh/G38Uf4oGqkr+GP12RbcMlOqc55LjTGD8pyCjFCQNN/Da
 Tr5RcDceWpFun1IVteBfDFBfcmv8RphbQ4yxboWImY91UoZl0j96dGbydl4ObPXQlZbU
 rJiRWpcOYpPjz3R3vT7AVRp2/9IiD2ackiOXvzV5UJw7/0uU1iNAzxu0MtoJ2TVh8mFf
 F2wEkbnSBwooQrf91GX7u7hiTTz4C7RY67rdxSwT2VyNmUbyYjfngYSdChCGiUPSHj9r
 xfJT4nIgj/zxEW2QMbMt/tc0wYOnWiO7/AH778sTB4yPviwbZfrl3ToXOa7c/6EPYxcB
 9M7g==
X-Gm-Message-State: AOAM531XsaAWsx6hgRrBzpmseRh3uyfZJlZgJtcutV1PrQkmdrjcQuEq
 m+dIFPlKs9wGyz0VdqLYEjrdPpiBQmoEHchUumzcJd0H+acGsDE561fgfL82Jrn+1GNqM/jluBD
 OMtqsEnt4OYuYW33HWMjikm5A3i0CZO9zdTWwQX0p/g1owBu1UQ==
X-Received: by 2002:a17:906:ecee:: with SMTP id
 qt14mr471012ejb.133.1641982685614; 
 Wed, 12 Jan 2022 02:18:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkDLUnDXncfLM2SjyZMmYMSSgiKcr4RLjw+16eEj0TVwkNqMlPbJfgszDEo6F90TMvDr8RGQ==
X-Received: by 2002:a17:906:ecee:: with SMTP id
 qt14mr470995ejb.133.1641982685404; 
 Wed, 12 Jan 2022 02:18:05 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id eb14sm6047322edb.16.2022.01.12.02.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 02:18:05 -0800 (PST)
Message-ID: <b8b8fe77-2ea8-d05c-5fa2-d4cae01baba5@canonical.com>
Date: Wed, 12 Jan 2022 11:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 2/6] dt-bindings: memory: mtk-smi: Fix the larb
 clock/clock-names dtbs warning
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, lc.kan@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220111063904.7583-1-yong.wu@mediatek.com>
 <20220111063904.7583-3-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111063904.7583-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_021812_098318_B837DC8E 
X-CRM114-Status: GOOD (  22.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/01/2022 07:39, Yong Wu wrote:
> Mute the warning from "make dtbs_check":
> 
> larb@14017000: clock-names: ['apb', 'smi'] is too short
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dt.yaml
> 	...
> 
> larb@16010000: clock-names: ['apb', 'smi'] is too short
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dt.yaml
> 
> larb@17010000: clock-names: ['apb', 'smi'] is too short
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dt.yaml
> 
> If a platform's larb supports gals, there will be some larbs have one
> more "gals" clock while the others still only need "apb"/"smi" clocks,
> then the minItems for clock and clock-names are 2.
> 
> Fixes: 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> index 80907e357892..884c0c74e5e4 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> @@ -80,10 +80,10 @@ allOf:
>      then:
>        properties:
>          clock:

Separate patch:
This should be clocks. The same in second if. Now it is simply not
working...

> -          items:

Putting min/maxItems under items is wrong. The second if also needs the
fixing. Please make it a separate patch before this one.

The schema was clearly not tested before...


> -            minItems: 3
> -            maxItems: 3
> +          minItems: 2
> +          maxItems: 3
>          clock-names:
> +          minItems: 2
>            items:
>              - const: apb
>              - const: smi
> 


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
