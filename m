Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE0FC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 09:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uhXWC5aUog2B3MifbzjgvTuIZZSneoOYENLVLF/lKo=; b=GVwqnbzyqrCexjtjN38qTjg0wx
	ZLQgM9BsW+2LbVrf0ps0pq96aCey+HG8/pefkkSrBUJd1hWTr6cMgORavsnAAYSU/eRTzCmEPh5Rl
	vpNL1jAzwVv3Ni5liS1Nv4rjL6f7uwPjBAce5HT3Q2E5socw6RpWvLhbwcX5r7xg4n3bSmb47Qm+f
	lAZlWhxCJsLu/A0E5AgBDpIfIoJzb1ZO9QJHgI5bfZAiEKYl40/JHQqLW8i5U+DkOXw5frpRhOo1J
	gSh8LHdLLqnup9oBB4vH5EXmG+vIvIAnp4VAjwQBYxSsK3pvU2nsDi+NV8bxPxH3TqtW5gh3IefEJ
	JwqIEVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSwxz-00DTT1-BI; Fri, 17 Feb 2023 09:23:43 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSwxx-00DTRd-1E
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 09:23:42 +0000
Received: by mail-ed1-x52a.google.com with SMTP id i28so1392707eda.8
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Feb 2023 01:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1uhXWC5aUog2B3MifbzjgvTuIZZSneoOYENLVLF/lKo=;
        b=chKsPtB2hT8iQd0O3UAtAE7NwizW0neSxB7B7EZwVa3mYLn0K1FcBNjdDKkUNi/rY7
         6Ib1WaGIu+wGXltyhaFqmjH0cXGQsq0ZzT2buGbSUgs2IG0Dd8sUWjQT1uIIT3V2CXf4
         Pz+eYhFnz/IU927IhztkWlsp0ucMgWhusahIc5sEyW6IbDd5i8RjUxHXElXJgdeMS5xv
         kl6xIMSb4dILHSFFuLnMcehWArNGYohQoc6UsdNKUF03qFZaDfwpMfJXjv5A0SuVIhVu
         ecNo5OI2lELoSVgwN870+3hoDnbZpDvLC0fBYFqGlQJ2le7qPg0lqwK83mpPu1SRCUvR
         aZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1uhXWC5aUog2B3MifbzjgvTuIZZSneoOYENLVLF/lKo=;
        b=6/OkbQ95W9PGUUkBG4S+SIFPjFzwt80fsLyV7vcQK2o9b5wiVAvrUInM0wFa2/LS5d
         G7/Qi4rmOOFWP/f8FUXNb/8hXCUkw0C8DmJRnYzyTSvwVDF8sg+GS4VoiZOv4ZO9aRdn
         qLIOa6G7URoMnqfa8WV5RurhuJsJPK+Nzn6q/EGs3fVu2vCULGc2cftKOlW1DHws3kpz
         ohNyPRlfo2DHatvJEFV/9Iydnu5DbPjHsHKfgUT40F3QZhupED6DvyrnkCGwBJW11gnc
         UVmiOb0fWoiDYp8Rq3aj4uXgj2mYlY6fDP4hNs6tQTF/2KnktP2GxzcSH/QiDgw6LrDn
         D3/w==
X-Gm-Message-State: AO0yUKUK0EHHatu7oPMrjOvRIr5WI/fMIFd78q1I8b8ns+7m3/IzImLX
	T4CQvPg+tByfpXkMAJV2uA1Ikw==
X-Google-Smtp-Source: AK7set917pjRrPajgtaJkUtWkGOkMBJyKzJs5QyJgmH71D2U+yOlZOHZsD2RSv78b/Ft7In+yuB16w==
X-Received: by 2002:aa7:cd51:0:b0:4ac:b32e:b6f with SMTP id v17-20020aa7cd51000000b004acb32e0b6fmr104366edw.23.1676625817729;
        Fri, 17 Feb 2023 01:23:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x29-20020a50d61d000000b0049e1f167956sm2000726edi.9.2023.02.17.01.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 01:23:37 -0800 (PST)
Message-ID: <08b993f9-f998-14c8-221a-a0b80ac5d342@linaro.org>
Date: Fri, 17 Feb 2023 10:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 1/6] dt-bindings: mediatek: mt8188: Add binding for MM
 & INFRA IOMMU
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com,
 youlin.pei@mediatek.com
References: <20230216053322.11596-1-yong.wu@mediatek.com>
 <20230216053322.11596-2-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230216053322.11596-2-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_012341_128144_8A255151 
X-CRM114-Status: GOOD (  19.60  )
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

On 16/02/2023 06:33, Yong Wu wrote:
> From: "Chengci.Xu" <chengci.xu@mediatek.com>
> 
> Add descriptions for mt8188 IOMMU which also use ARM Short-Descriptor
> translation table format.
> 
> In mt8188, there are two smi-common HW and IOMMU, one is for vdo(video
> output), the other is for vpp(video processing pipe). They connects
> with different smi-larbs, then some setting(larbid_remap) is different.
> Differentiate them with the compatible string.
> 
> Something like this:
> 
>   IOMMU(VDO)          IOMMU(VPP)
>       |                   |
> SMI_COMMON_VDO      SMI_COMMON_VPP
> 
> ---------------     ----------------
>   |     |    ...      |     |    ...
> larb0 larb2  ...    larb1 larb3  ...
> 
> We also have an IOMMU that is for infra master like PCIe.
> And infra master don't have the larb and ports.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> ---
> Hi Krzysztof,
> I added some comment about larbid index, this is for readable when
> adding iova_region_larb_msk in the code.
> I'm not sure if it is ok for you, thus don't keep your A-b currently.
> Thanks.
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |  12 +-
>  .../memory/mediatek,mt8188-memory-port.h      | 489 ++++++++++++++++++
>  2 files changed, 500 insertions(+), 1 deletion(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


