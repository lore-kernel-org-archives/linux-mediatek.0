Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4285C64990
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YhFpbHOP2L3HxhjwTH61U3L7iFs9TCv/PZtz7Logkg=; b=zugEeJxftxHekR1iOeaUsOijhn
	F7aDFLx+UrAXEaU/NhXy1sH+2MSl7cZW+lazz4ZwYsvmOwRqlnsxek4yCPYIJfQBRSGlKxrB3Lufv
	rfSuPkXKBOIW+ksIooIVzka6W52NgI7xGClZqlpVtVVIGDFTIdru89G/s7XrbjT8qy4UHB2zsi2Ke
	ABaCiFQzyfHUA5qIIcdW1uuP9O3cubuKEHLBewuwQDctlVE/TlYRcRZIBO8XPrQoaHRWdcreF8FL+
	IuqMWtaNzTb9eLIC7XmcYiPs+I+feCEC1/zlf4LEGCJyEMZ3TMWyfS+4UBxPXqIYYSe9yQeO178O/
	iovINOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRD1C-00ErvE-TC; Thu, 25 Aug 2022 13:35:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRD18-00Erm0-9Y; Thu, 25 Aug 2022 13:35:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id n17so45313wrm.4;
        Thu, 25 Aug 2022 06:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1YhFpbHOP2L3HxhjwTH61U3L7iFs9TCv/PZtz7Logkg=;
        b=N0JYE3iWPQ1xCxuDZNIk2bxNlQS4LgJcKSjCHSp25/b53nk1PfwMM9IfyDud+/2Uhv
         FCjjCUHfHpemnH2fLYu91Cq8ARwzcjQr0C54NF2J9Y0oTiJtqmTavOWiCTUsmibNvTLr
         qWmtMZuGtXJErZJ0BLlCp+p/fN5OF0eWR4m0ojXaCIqapBJlm2Cw1f9XZX2Ik+SZVRO9
         dHQglMsuAe/vrn4b6nI+R3FReQfvKD72ROlNdFLFOLDvm2VRhCQRREIDm0wjMc9iFntv
         OIpAnSIro5NzxkiU0Kn9/orvjhrrAS8qhV6jkqt29OpYYsXDvrqBTXaCvEYnuJcX0lys
         /7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1YhFpbHOP2L3HxhjwTH61U3L7iFs9TCv/PZtz7Logkg=;
        b=xPD3To4BrALFtBYuu4gGJIpAlxbJ9a8Mw0j1H6vyX9ZGYORfjiBtFYZnKVZZ/p+Gmf
         6+Myjq5iKMxqk3gXYR4RZcdX0wvRtZoRpt5EuUekYyK7hbfKRaNg7hW5QgjCM6ol1Dj9
         s2Ml1KPPr23nkQV+5aS4Ad8uNo8mBgB3LQmAgQqQZpwdeePWOWPv3I6Z9+AVxBy04kcM
         GRe/mm8neIlaPywDTEUy7csynW8HcWYyA7HABZ7xLeq1hcTc6D8bbhg7LRbdwGVvn23p
         sfNPoWMfJAvhY0pboAhfJF6/N9IxGBMU7sGXqrjND5LmMt/0yuCfn4sQARnvMRg2oP0Z
         LGwA==
X-Gm-Message-State: ACgBeo37SZFW7/+OXyaN25vv9VxNz5cTRaLyhM5y3D2o2n7e7Y9G7LJM
	sFNvTdJRz3OwVkshaZTyeIw=
X-Google-Smtp-Source: AA6agR4PfR5XtModeZKlkxxKgqBGnJWBWtSf2rL7FYJx+m3m7L9lbMM1ne2k9EGyVvCJl7SZvK2x4w==
X-Received: by 2002:a5d:64ed:0:b0:225:11d4:76d1 with SMTP id g13-20020a5d64ed000000b0022511d476d1mr2312391wri.579.1661434527464;
        Thu, 25 Aug 2022 06:35:27 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c3-20020a7bc843000000b003a32297598csm5145454wml.43.2022.08.25.06.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:35:26 -0700 (PDT)
Message-ID: <ac7afbb6-9c8f-4927-be0c-9f6089d1dc67@gmail.com>
Date: Thu, 25 Aug 2022 15:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v4 04/20] dt-bindings: power: mediatek: Support naming
 power controller node with unit address
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
 <20220729063208.16799-5-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220729063208.16799-5-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_063530_389962_EC4456B1 
X-CRM114-Status: GOOD (  14.25  )
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



On 29/07/2022 08:31, Tinghan Shen wrote:
> Support naming power controller node with unit address, also compatible
> with node names without unit address.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks

> ---
>   .../devicetree/bindings/power/mediatek,power-controller.yaml    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 321802c95308f..2d6afc0909473 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -19,7 +19,7 @@ description: |
>   
>   properties:
>     $nodename:
> -    const: power-controller
> +    pattern: '^power-controller(@[0-9a-f]+)?$'
>   
>     compatible:
>       enum:

