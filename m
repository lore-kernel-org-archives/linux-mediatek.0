Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166B1C19F2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 06:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwaxxtmZ04egN1JXyx5JOzRQUW94lUiaaZz7L2gKjJQ=; b=3lsuOkxiJ0yE7+ySdeHlAojYJP
	ibUVeTsilzRaJIVRR2EMlyAfMh9o6+7LyY7/FSu0I07/4Iewp/g+G98pb8WYK5P5yOsEcrtUQLWbA
	cQCvfnEHULw4tLDHRtCbfaV08YNtUD+wRoaMmasMRyvyBwCQ17sChfIVzn/CHv63zJGqBHF32WwMU
	hVDOjGgbbnSSJQT3JCEb2Ka+OnhyqCtr8nwiet6pZyhPO9dibXAaQ1Ob5YddsWsR5Asc/f7m5Hi32
	BrPmz5+AdiE36SIevpJtz//3IEktPRvLTxlx25n2WETzKp4h7UfYTnQ09/ycky9L6AXYnhrFILCA1
	E6sU2hqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM1p7-007DNG-T3; Thu, 11 Aug 2022 06:37:41 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM1jh-0077oV-Tu
	for linux-mediatek@lists.infradead.org; Thu, 11 Aug 2022 06:32:07 +0000
Received: by mail-lf1-x12b.google.com with SMTP id d14so24232906lfl.13
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Aug 2022 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=pwaxxtmZ04egN1JXyx5JOzRQUW94lUiaaZz7L2gKjJQ=;
        b=cPzYEHALljaH9F8T4jjeyjWlcKZbOwD0URRq5zJ5FJHrQWpOXIqG/lrZ8wVNXJkden
         DEsvc7CG7XhY5l+kWtJBdBEMyBsn3YTtIpI9pCMdCuLAjXZuv2oM26irv64MFLRZRQNF
         7KKYeTSrbMfV/tYBScrmjdZIABN4q7ENBp3ElyCHqcraC3fRz2c4Q1j8eD6n3EDh8FWx
         +R/trrK0Oi72ZKPc9e+mmImo03+KU/Uv1GmNRijNvI0jl5WddB6n9HRPMuKYiJGgo3zc
         u+6AneFPp2o1l0wRVjfoIexcUqAJKltPBVYWilGRu+eLcdM5DnuXgtOPm9kVAMObh+8r
         myCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=pwaxxtmZ04egN1JXyx5JOzRQUW94lUiaaZz7L2gKjJQ=;
        b=TdJGXSMksCGahnh2E4K+SOQpyiOnBkiWBhe8mpwaIxLmTMyVKJE4Cf72SJu+HEy4Ro
         CFneYeSPonTVlXJ0m0pd9a36dVTrP9eU6Ff+yqiDrYJ6bjkTRMZKU0Dxydxgx7M2W3Gt
         4iREyxhLMCSt6ap63ZkHMP1DqXsS5BIoXgkmIW/kETCbC1znuBCGojozE7khFWf/47rQ
         MxiKgRCJNT/bEkpQaTZqRt+GtALMMtWD8n8f0+fxi7CbHWGr+/2jAvI3wWyOW1n837vH
         uu2um5jZpa1n4su59L+TZ6R5eRaAWpoEWDnwm3O5gz2cP7NRdtUZfVPlQ26PcFYviIwe
         vInA==
X-Gm-Message-State: ACgBeo2VuXKbwRcm89RyRW/2PLelR6nvTGfD5gVNPQgeB+mtaHRwezwj
	61kPa5UQzsO7dmq1H5whwte9oQ==
X-Google-Smtp-Source: AA6agR40tKSBae58qY+7RDCU5j0znPzMxsb7C2ha9lePvz2LVKF+1cqVJCSK8oZ/Qb/kmGsrWR3+1Q==
X-Received: by 2002:a05:6512:3e07:b0:48b:131:616 with SMTP id i7-20020a0565123e0700b0048b01310616mr12048174lfv.475.1660199521869;
        Wed, 10 Aug 2022 23:32:01 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id y6-20020ac24e66000000b0048a9a756763sm597726lfs.19.2022.08.10.23.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 23:32:01 -0700 (PDT)
Message-ID: <12a16d64-45e0-620e-34ad-1d671eff5c2e@linaro.org>
Date: Thu, 11 Aug 2022 09:31:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v6 02/20] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220811025813.21492-1-tinghan.shen@mediatek.com>
 <20220811025813.21492-3-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811025813.21492-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_233206_006420_9138E077 
X-CRM114-Status: GOOD (  11.86  )
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

On 11/08/2022 05:57, Tinghan Shen wrote:
> The max clock items for the dts node with compatible
> 'mediatek,mt8195-smi-sub-common' should be 3.
> 
> However, the dtbs_check of such node will get following message,
> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0'] is too long
>          From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> 
> It's because the 'mediatek,mt8195-smi-sub-common' compatible incorrectly
> matches the 'else' conditions for gen2 HW without gals.
> 
> Rewrite the 'else' condition to specifically identify the compatibles
> that utilizing gen2 HW without gals.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../memory-controllers/mediatek,smi-common.yaml       | 11 ++++++++++-

I see there are no dependencies, so I will take it via memory-controller
tree after the merge window.

Best regards,
Krzysztof

