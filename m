Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361F4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzXHfRs1zIHFmVGXHn4g+mckuTYihxIIeRxXlBZxdNY=; b=HHbGMuBAenyO0N
	Iso7YEIFBjWrvD+yZvaO4dE/Hzs4/V8SLAjDsAPP3pSxNFKVUVY0NWWYb/YItELlccAXBYIsBuk3o
	KY8WX8EgnhSMLG7o8WqmFcWe5NV1gB3RCuVkjE3NQuA2OLAY/0kKjsEF+kJn8GvDpdSL7GqAu4crO
	+jfu2ev8d9+HRkxElAV6J9oxNUeDcAQuHPfvrx9CsI0dcVTYbXxzu2ePua6f2WYQ3BQ1TMvnLi123
	Jrm8w4hYqIrrigtXgSt+nt4bxJ+thCxb8OsWOcvCC+PXex7gAYHGRWOWu1X0zt7p6bqLvB72KHKL2
	Wf8gesu4ffYMzV29lDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqy8h-00EMCR-0e; Tue, 17 May 2022 14:25:31 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqy6j-00EKfy-Bb
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 14:23:31 +0000
Received: by mail-lf1-x132.google.com with SMTP id y32so31626334lfa.6
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ipGn43ArCVYSMn5yPdPhdKUiz8DsEnHuPTV/NAb5S1U=;
 b=apRAf5LRhyQBx+UcWihze57kJNIiM2xFRvMG9OphdJu8PIqOaJK/oGO5Yoiexkj0GK
 mXX4PiedRkI/DQON9cqi0NH4B4y1TkLgJs3xDSmiYxVOuUDH1jANMbz4k1FMTUt89iF5
 2TR5pB/3Up6jog61gTNWOZ59/Vgl7w2voFxBAB5ib87jIbmo51FoOva9xDoL/1IlK9fS
 /3+zwcTrdPsN9uS4Rybmrcisfb61xC5ZGxfvdehlSiEFFS7UilsWTqpLYy76CK+1ztkW
 4rHpx4H9I7May0ExD8A3wK+rxCD2qcrTO8bj9GHsKH40+nZP6EMNOwmffDpT5ztMn4ei
 aDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ipGn43ArCVYSMn5yPdPhdKUiz8DsEnHuPTV/NAb5S1U=;
 b=azok/TMqJNS6Y9opH2OgeUWOniZnvqHc0Wcqg3Kw1kUTwGE09BrJgUmy2k0QwHQmN+
 1Y6+Fgtgy1tleNO0YBU45i5cZWoEKMOG29NLH88izgvigRTPMHv65DNfYtccfXWmgHJJ
 VdVNsxDAUGXWOqyMyXIjZCCXnid2N+PAx5U6KmrTzVSbEWTizSGHnEyvgmERnT6kS7EO
 qcFXZKOoyC6M+dNVhZZ7Jd6M91U+3b0F20lNi2hCHTSOkLldB1MCr0XNiTte/y24bH9a
 sxQjYHihEh3+I8DNJWPg6y9EEO+vLT5ghkLIxBL4CAsO+0gSOQMxMJvNnn1Veb7q+B9w
 kTsw==
X-Gm-Message-State: AOAM5322af0/8zurm+QwfDFMwwx9Kvpaa3LQnbmCXku1rbM2seVHdOqO
 99Tb267dSCpxQZmSf6hrQfgnvw==
X-Google-Smtp-Source: ABdhPJyxTGAe+zxXWx5gqjGdmE0EbYNh4eGxOG6VrvKZTtMhpkUzJEQKkmWSE3yYd7HYfEC3PnQizQ==
X-Received: by 2002:a05:6512:1086:b0:473:e8ad:c923 with SMTP id
 j6-20020a056512108600b00473e8adc923mr17233277lfg.463.1652797406927; 
 Tue, 17 May 2022 07:23:26 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 r27-20020a2eb61b000000b0024f3d1dae80sm1902231ljn.8.2022.05.17.07.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:23:26 -0700 (PDT)
Message-ID: <1f259346-0ab1-fff0-7f7c-05f0838a1d59@linaro.org>
Date: Tue, 17 May 2022 16:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/8] dt-bindings: iommu: mediatek: Add mediatek,infracfg
 phandle
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
 <20220517132107.195932-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517132107.195932-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_072329_414426_1570B544 
X-CRM114-Status: GOOD (  13.96  )
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

On 17/05/2022 15:21, AngeloGioacchino Del Regno wrote:
> Add property "mediatek,infracfg" to let the mtk_iommu driver retrieve
> a phandle to the infracfg syscon instead of performing a per-soc
> compatible lookup.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 2ae3bbad7f1a..78c72c22740b 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -101,6 +101,10 @@ properties:
>      items:
>        - const: bclk
>  
> +  mediatek,infracfg:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

No need for quotes. They are not present in other places.


> +    description: The phandle to the mediatek infracfg syscon
> +
>    mediatek,larbs:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      minItems: 1


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
