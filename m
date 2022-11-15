Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED52C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUwrnHBXFfPXV3HqM0uSLgjBuLQrs42kFBoLnffmkPs=; b=DzABBd8BKfCSGShgxmm+Y9Ly5G
	amO3ZMwyZInfhHnWBAetJ4m9Yd/F9GPcqdaHqGb3PcJrnqw2jyG2TvOS1QhOXewHXQcb1Sp1sv9a1
	4YEm7QR0UaxoKtgFdafUoQS1kLBRbJemJEjCjMs0IbCHiOFTlsPweJAEx0RfOgfKYqxs3A9erIEb7
	umWAHnvLXeK29Hd2YnYlz8T+N6PzGhKLrxfn4YcTtvm2u584aQUpjFiglKimdI4ZOqLQ+6nszkzmW
	FUgXq9vJkkrb6Va/LB8sTv8DOQXASZcovke3IuxumqaoSHYsyI22odONqmZDPTMcbtazdvXpyPB17
	w3NMKh9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oustf-009jwk-C4; Tue, 15 Nov 2022 10:10:27 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousXu-009YqG-4F
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:47:59 +0000
Received: by mail-lj1-x22f.google.com with SMTP id d3so16811729ljl.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 01:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUwrnHBXFfPXV3HqM0uSLgjBuLQrs42kFBoLnffmkPs=;
        b=P3NDqMAdFm/ODTPPACk2XXmDdfzl2y260/cRWUSMQjUuxxouuR8nlQFVMfsSXnOLG/
         i5lw2ObDCRnar1nt0O2QrfmEq0zHRdpK5WZDq3BC8PK4DFDeUpXEnPLxq2Rnu09Sy2Mn
         8wbxzL2pnLdwRt2yyk+jyamULm4ZP/fsSl2gyp76yMe6znxy9ude95We0cxpsPlI3i//
         CcmOASLJf1pethdYNtpnpZTDYZ00SmrIrZO471wGiR89y1v1zmJpvern4KV3LmnSVJiE
         Snbc3D3Kd8vbH0s4TTu4pQdr2SOiGf5i85FRviHxmuKDB+JSAk5Yee8Wjr6SHliqHL/C
         UNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUwrnHBXFfPXV3HqM0uSLgjBuLQrs42kFBoLnffmkPs=;
        b=KS7bi8H0AHUjELY7ZqX2uTxv6lqeNhW+rhGwsR+pweXFmFMM1LJ3xv5Pu+5w/O7nKA
         7FAbf7aQycihmo73Q9zk0M2gRmX4nXZILVkXdJNvvM+SYHwRBKVozf3et+hylMYDIt1o
         7bKHRJO87l6H7k9uh68coAaOK+FhTAPi6o/YIXB2JIaEem8Nmc/fBEuwJNTjwcJ5CRPY
         lczLZgGTNhLdorC61G4jJoZY+5JgcL8CouQ1bOlXD4Usg5DhKui0l3Gr+1DavE00o309
         e72JqtGOPBeqgDz1jThdhQOhK+DTmGNRjVYFUcIKaqKKiTGYB5HJbDJloc06LLu04J3/
         4Knw==
X-Gm-Message-State: ANoB5plLbnMkd39zv1AFRyxcNLTn8W25W4PksNd0PxsqViTn25jVa1Sh
	C9VFfpUFry52YnWcIeR878qtbQ==
X-Google-Smtp-Source: AA0mqf4rC091Nwov6Kwm9iDiTEHbcLI4s2hQscMtz8VZdIaK9BzMaSpjan3b7sqN2N2RKLparq8/tA==
X-Received: by 2002:a05:651c:491:b0:277:21c8:a94f with SMTP id s17-20020a05651c049100b0027721c8a94fmr5072964ljc.28.1668505669598;
        Tue, 15 Nov 2022 01:47:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t7-20020a192d47000000b0049c29292250sm2144019lft.149.2022.11.15.01.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:47:49 -0800 (PST)
Message-ID: <2762e722-5561-4aa2-75c0-db9fd03ff4ff@linaro.org>
Date: Tue, 15 Nov 2022 10:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 15/15] dt-bindings: arm64: dts: mediatek: Add
 mt8365-evk board
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-16-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115025421.59847-16-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_014758_200221_D4B9A562 
X-CRM114-Status: GOOD (  12.75  )
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

On 15/11/2022 03:54, Bernhard Rosenkränzer wrote:
> Add bindings for the Mediatek mt8365-evk board.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

You document a patch after using a compatible - that's broken order.

> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index d76ce4c3819db..6781fcdb9fe69 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -246,6 +246,10 @@ properties:
>            - enum:
>                - mediatek,mt8516-pumpkin
>            - const: mediatek,mt8516
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-evk
> +          - const: mediatek, mt8365

No spaces in compatibles.

Best regards,
Krzysztof


