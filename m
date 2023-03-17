Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595FCC74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpkLCLMxsQQ5zA0IK7LMtaOGnKaPKAwAcMkZQbS+ecQ=; b=Ckgtzd/wgbN3bqimUSCcPnmuw+
	qd1ub+ea7XK4j5mysButnr6jPDstVA3Pp/Ib4zl/qrKluesrZCCyHtRso+ZsveRxl5yu+Hsu4P1y0
	CzEjfZYo+fzG5VVSAK5qrPP4ghn9mf1GTZavbeWurB+HKKO4viXmjKsA7zP9oMLID9cChHO5jPvKa
	mh/grgP+k5A5+kAe4YCX02E0O7kQPrF82Dn9L8NpIkRaxaM7JXwieU/sLAsQiBNVUwRa+xYiEEWqP
	69wOoDdtXQB2b2aTK/bhIKmI2htP2CcXDpEX5xKtzG9LoiLeyqRYID8+A32cikykOtARoUdVcMtZ2
	/46Q5MIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5vr-001cL4-2b;
	Fri, 17 Mar 2023 08:59:27 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5vm-001cGL-1L
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Mar 2023 08:59:24 +0000
Received: by mail-ed1-x52f.google.com with SMTP id o12so17551709edb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Mar 2023 01:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679043561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BpkLCLMxsQQ5zA0IK7LMtaOGnKaPKAwAcMkZQbS+ecQ=;
        b=pHbbCuGA73Mk/5ARt0wjvlbfuD2U2p8YzBghmxGyOdaN1JNoHewvpvgFn1ZBgKiz0X
         9dLD2nTcp321vivUCuNFoOtFep8Y8qhtbfOWUfJ0QOgjI8jhg+ubkiTTkgvQHTXLyLdL
         txqylu8tsHvYkw9YRgn6S2zhcDAAc+Gmp3kkxwc6XsHw3xR9jQrevpjlD9zNBhycviCW
         DTqaQ7jwAUnLd9Ya7Q9AT2JOBqnOg3HFYC20kG8GV9Im5KhlLOBAa3GQLRrpuRdRcAYX
         qjbJG6UgCroi8P8LZtsXaQpKWgzP7W+hyKY4euRp7N2+28vHYw6j8IAHA5buT9Zgo9On
         J7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpkLCLMxsQQ5zA0IK7LMtaOGnKaPKAwAcMkZQbS+ecQ=;
        b=WGGvmaywMZoNe5+wj9yZnQOT3ZyWENZtKaRCtWRywBRZykvJI+wDh4QzWHTV3qyElY
         WxRsz1ch+Ny9ykyrB7bVFbpt4XWZnL1BTUQYodv0QRV0Y5uOC4gNx+NuM6fPCa03AQIs
         BcrhezZ3zRIMo5Y/R3bTrhTFe/fAo6dKGcsxDxigbjhNoW/OPKVeHbe8DUubz3uTaWR3
         x+ezCjhB6UgL43+cLDFGgo0OsqGGWaBNzJYjgKsZ0h22Y51UZufEC6jK5Io9mxKHZN7U
         ciB0/RvV5vi051wT8XmYwjhiFir85szjNWzdxzsO9seuyKK8Z8g164mTWhV5VBrf1eP6
         gh0g==
X-Gm-Message-State: AO0yUKXD09JAWHAv/xieQ5bAKpcnJqGFjyV2fOHR1NWyV/XYKlPST2JJ
	2E/Wo9r6bcBHWIY4fBFkjTNMag==
X-Google-Smtp-Source: AK7set9i+hpbTfIEJCzFJx6UJzlGdk6rfTOxfYznJbRKglHBbeQKiDgDqUCtziNFxDe/kvzbG7mqbA==
X-Received: by 2002:a17:906:e0a:b0:92b:846d:8928 with SMTP id l10-20020a1709060e0a00b0092b846d8928mr12685839eji.65.1679043560906;
        Fri, 17 Mar 2023 01:59:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id k15-20020a50ce4f000000b004bef1187754sm747872edj.95.2023.03.17.01.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:59:20 -0700 (PDT)
Message-ID: <265d30c5-93a7-7e60-32f2-ec15f91af5b9@linaro.org>
Date: Fri, 17 Mar 2023 09:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 1/7] dt-bindings: mediatek: mt8188: Add binding for MM
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
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com
References: <20230317085541.20447-1-yong.wu@mediatek.com>
 <20230317085541.20447-2-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317085541.20447-2-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_015922_455547_6D0260CF 
X-CRM114-Status: GOOD (  15.54  )
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

On 17/03/2023 09:55, Yong Wu wrote:
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
>    IOMMU(VDO)          IOMMU(VPP)
>       |                   |
>  SMI_COMMON_VDO      SMI_COMMON_VPP
>  ---------------     ----------------
>   |     |    ...      |     |    ...
> larb0 larb2  ...    larb1 larb3  ...
> 
> We also have an IOMMU that is for infra master like PCIe.
> And infra master don't have the larb and ports.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |  12 +-
>  .../memory/mediatek,mt8188-memory-port.h      | 489 ++++++++++++++++++
>  2 files changed, 500 insertions(+), 1 deletion(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


