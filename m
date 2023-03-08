Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D635C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eqhJeejf+RQmERnpGqMGzgAI9CUz2kwB1CbIir0tP8=; b=JUl2eF9xwjINfWHCg8xoVDN8V/
	dFNO/dItGVR1yEfHV6fdQnMo3yd0/TAohlNeIAcitZrkicCsykswXvsaX4Ee18tym2B7Ko25KFpk+
	J6iPcvK9oajDAuj2GlagQx8MVRVuXwJ983orzZFKy4BUafbmdNrA28UD7hOClfx/VX/Sd0OkqM4oP
	8KW1px/ySoMELVuTgjx2R6RkUPKgcGl1tDkzhz8XNMsIQzoojOt5xm+luDgx/nwC9cJuffyMOIu18
	75MbAc0VR3JVV4zfacfjbYuLUr+2e5WBrmlN8v68aKncvtgCmo/uZs6ZtVJPrrTYoJFvRM4UkfJsA
	o7gBX8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZr8m-004RA7-3y; Wed, 08 Mar 2023 10:35:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZr8k-004R9L-2J
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 10:35:23 +0000
Received: by mail-ed1-x530.google.com with SMTP id ec29so32929834edb.6
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 02:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678271720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1eqhJeejf+RQmERnpGqMGzgAI9CUz2kwB1CbIir0tP8=;
        b=ykMZOphQFA1DVSYvYk/K0/T3ZpYXYSMOYsUgSrev8ZzdS3BDpmr6OP1+nrm/d9U+2D
         I5/FuOppgiSp2DjICE5b3FChw++7ies1Gq/GWCNV51wX+V+S0v6g2BXiARRFYDE+gsP0
         6UgUE+Lip0yiSKrmlbSVXOttgUEZT6sLjjomSOtbLNvG2bNW33V25PcdEAAshy3tifHu
         8TJbyP7cbB44nb7R5r7J+GouRiMHGaTeMR0OnAFaW+uf+gBlx4FN82TKlljm4f8VhB9N
         YJ+7gBv8ezagrTk0R/nVw56gIAjc1k78sWaghur2EITACXeGtXmft1RZpnuufSjaWzgA
         kGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eqhJeejf+RQmERnpGqMGzgAI9CUz2kwB1CbIir0tP8=;
        b=S6zUswQTgbyaLXtQ10b5IfqjAcYzM19HokLk74TGHBXS+zvpDiuwyUu2gRGCqBc9iZ
         IBuLzRPPCT0rxq+dMtFMsvtX3rMRdWo8jvIqd8zYcAY3uBsaAIHKMKZviEd0R6LBZ0+3
         VxyzHTgoyxLHs8ik4QkQgWz6rO0KpgKAfy8pj2ELgJokbD1Cubi/birhfETl03KeF7uW
         HS/4Y+ngQQ76XOmaIuuSo986/PugBVg5ECXsr2c2I3COPpNdDNSP0XIiLK2k6d/14Myc
         rR7L4nMmrjfkOSP4qxIlExFeXkK/VRaosc+AvRsoc8qrYWyHX30BkmMkSjnOmm/grhYT
         c4Ig==
X-Gm-Message-State: AO0yUKW/DxL5P9BA5BUl7JRxVyHNRYl+7UU1WBQtHt5OZgC3sAHhzd6W
	3wWc75CWFuviLWJUWet7bRNLmg==
X-Google-Smtp-Source: AK7set85h3HEkM1KFOIkaPrFIqwjm1PNUWaPYN8WE8M5LcYma/+vDI3oDsZBOeitBKuc8tC5KN/j0A==
X-Received: by 2002:a05:6402:383:b0:4ad:1e35:771f with SMTP id o3-20020a056402038300b004ad1e35771fmr15484678edv.35.1678271720773;
        Wed, 08 Mar 2023 02:35:20 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id k17-20020a170906a39100b008b17fe9ac6csm7397482ejz.178.2023.03.08.02.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:35:20 -0800 (PST)
Message-ID: <388e2274-d46a-68a4-3e85-5bd597085041@linaro.org>
Date: Wed, 8 Mar 2023 11:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/7] dt-bindings: mediatek: mt8188: Add binding for MM
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
References: <20230307080555.14399-1-yong.wu@mediatek.com>
 <20230307080555.14399-2-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307080555.14399-2-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_023522_162097_577BA5E8 
X-CRM114-Status: GOOD (  13.54  )
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

On 07/03/2023 09:05, Yong Wu wrote:
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
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Indeed, I missed broken checkpatch/DCO chain.

NAK. Please fix the chain.

Best regards,
Krzysztof


