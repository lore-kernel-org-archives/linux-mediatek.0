Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3323CA0EEC
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vv/75kEeRc6C4365WMEK2alu3JAPt7L7OwFhBAHlLpE=; b=NKFNBaJg3X6W/kvjTYFslWaoER
	PPhvSPVYLmu7vBvhhY2muGxELbScskohzJ7+RzQDtzT+4vyJuoal45yHhDnzbr6ouMbcvuuAKan+I
	Qkr7o0HjM0bgFhdENhqi969eAMV5bJzVDmqbF+E1oSa6DCRvkTUSwgt1bK72WIxgV39AQmCWJ662U
	DekgIBdZctt1L/AfYzRhgsw1ij3miO9XNdqgD+UjAIE55Ruyor12R0mG8NAX6ek1n+ahJ6QKAvfk8
	8kE48x1rZdL+GfI6OJMHeS2CCE4waUOxtG9KLWkyXSnSNBgLyR//IHMk1wWtHvzjEWLsoVU5RBaxs
	8MDw1zEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4Q0-003aYV-1t;
	Tue, 12 Sep 2023 14:31:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4Px-003aX5-3B
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 14:31:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31ae6bf91a9so5769919f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694529063; x=1695133863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vv/75kEeRc6C4365WMEK2alu3JAPt7L7OwFhBAHlLpE=;
        b=pLyU8q4z5JufnT9TK8X7sRHFk1QOmuR4MOou6eTBsqIRDoQZkhCQG4huT3dZ6XVETf
         zUlT4QR4Mf2Chq36VqpGENKDc0W+Jshp2DswC/qovrXGqlFSgbQHJT9GnDAKKAR9CG8n
         qiDmx6aGBQmRTPNB/ylL2YZm29+eGNnKioQdDWnvXHNH8QHgYLgacEp3BK4P4rUM6PvL
         h3DLYZWfobnpiQT50J2CcwsN1V80Uj7XIc88oUh0i0zewr1MdR61N89NnzSiFdPWc9pw
         hrzFgU6D8bB3UlCf8LxI47OjJj2cs9dm5IeKMGATyqqbtzQSFNRkY0Uc0Uw5Ra/p35gY
         BOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694529063; x=1695133863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vv/75kEeRc6C4365WMEK2alu3JAPt7L7OwFhBAHlLpE=;
        b=QI6b3EOBUW2rjysXzot8Eh74We9AtBgCxOGdmDFPRUh6ZgYbp1o18lDH2edTqzo5nh
         IP5MBS539Tsmip7zJ5KwnPff6TknjIeKgEfIQCBlojzolCnPMd4Xe2Zcba2DhJjHtyG8
         St+UOo+507IFLRa7vGrhL7A0N3pdqMiflYBIRyomUlNQ9EhBSKTTNRVegY7bsrzb+Gq0
         6qIk9bilxvp/M2dRqgWw8krIjmnMS6kHOIwjhpdG9cvp7xuMF1ghiZgbBiML5uB5DXU9
         ItmgobcLLa0ikzAxOml1P9f8W1k0XbSqIPftNBpuOS4zVH8m3FxlXSSfisUxYwMpwvNs
         PPUA==
X-Gm-Message-State: AOJu0YzADPV5PlTuq789xbCJmKZ8I1A1OXtbzCXGb1gPXpTKz9r70fn4
	qiokZCPlw1RoxBN8Hrkdeg8vhg==
X-Google-Smtp-Source: AGHT+IGE7Z3u/8T793GKchkW1xN+y/cWqm86V7IOqnn7C832w8YiIwv3OoyWdiXIu0ouE9rBXGP+kg==
X-Received: by 2002:adf:f48e:0:b0:31a:e73f:3fe7 with SMTP id l14-20020adff48e000000b0031ae73f3fe7mr11464586wro.3.1694529062899;
        Tue, 12 Sep 2023 07:31:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id o14-20020adfeace000000b003197869bcd7sm12954388wrn.13.2023.09.12.07.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 07:31:02 -0700 (PDT)
Message-ID: <d147a163-3696-8fdf-4c76-ec8375243d2c@linaro.org>
Date: Tue, 12 Sep 2023 16:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: add mt8390-evk
 board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230912140613.6528-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912140613.6528-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_073106_022716_2285E613 
X-CRM114-Status: GOOD (  18.45  )
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

On 12/09/2023 16:06, Macpaul Lin wrote:
> 1. Add compatible for MT8390.
> 2. Add bindings for the MediaTek mt8390-evk board, also known
> as the "Genio 700-EVK".
> 
> The MT8390 and MT8188 belong to the same SoC family,
> with only minor differences in their physical characteristics.
> They utilize unique efuse values for differentiation.
> 
> The booting process and configurations are managed by boot
> loaders, firmware, and TF-A. Consequently, the part numbers
> and procurement channels vary.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> dependencies for v1:
>  - This patch should be applied after the following patch set
>   - mt8365's bindings
>    - https://lore.kernel.org/linux-arm-kernel/20230912092444.31635-1-macpaul.lin@mediatek.com/T/
>   - mt8395's bindings
>    - https://lore.kernel.org/lkml/20230911115717.26184-1-macpaul.lin@mediatek.com/T/
>   - mt8188's bindings
>    - https://lore.kernel.org/lkml/a4e1a80ebd19896410f50b0297e05dce06fb47cc.camel@mediatek.com/T/
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index d8e449c6a7d7..047204a4aff5 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -251,6 +251,12 @@ properties:
>        - items:
>            - const: mediatek,mt8365-evk
>            - const: mediatek,mt8365
> +      - description: MediaTek Genio 700 Boards (Genio 700 EVK)

We had a long discussion, so again: drop description.



Best regards,
Krzysztof


