Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CBCC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ren2+uJhEOKFuly4Y7r0RVT/r2/Z143SWwTToasxhOA=; b=mySho3h1cSJYiKeDrfD3VRaSbB
	i/OPSHMJmqoOA4cTN5ISUzcxN+eu5Qu75hjddbRh6TNHLZ1ogA99xyAE3kOLqW94kGPpoyDSNyKdy
	tEsBJskC+mZ7KIQSJ3vSxZ0aAVfOxnZYLDq273RGSBMV1jrRlLi0KjSA2hwS/SF4h27nEzLCq/Rmq
	6wHf/kPfQ2yF6SxIBSf+NnDRxHjM/mAMoVkLpwihbxv7UBKfg64OZ2PL35QOkb4WVvZwQayU7fQaw
	OB0PtqWuvlVMd1kwxoqLl/92lNTclgXoqeu8RPoC6RdPBHkZea10aXZQGr/hAGoY7NQOhB1WJCw2S
	jAcAFSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o416t-00Aq1c-D2; Wed, 22 Jun 2022 14:13:35 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o416F-00AplH-9Q; Wed, 22 Jun 2022 14:12:56 +0000
Received: by mail-ej1-x633.google.com with SMTP id g26so13154078ejb.5;
        Wed, 22 Jun 2022 07:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ren2+uJhEOKFuly4Y7r0RVT/r2/Z143SWwTToasxhOA=;
        b=CQTnUj+3r1Tmk+T0IjuiHB1Hr4poYEqyzqY7e1KiKmdVMECfrXc4U5GEg0+HGYFtGK
         /63ZwSp/BIYc8pDjJQdAhJjVDxcvfs6MUrDxMOe3vyLpx3UjbS6NpkQTLniUIVmX4u9k
         la5+rQMbRD/KXjJML7sUQ573tQDMVpUt7frQWfL6v426debfnOw1gfnGXdzDh0wyC8QP
         bfGGXiL6G5Udv3dYc36Rgf7BiPgTaTD4g1UvxWwtPv+9vzPLSUSF4T8vIVvVTogpBJd6
         wOhbWPDWKTxaYUcyRxH8AXk1DGtjFpgk5+fcwKfl89uNIaiCFB7sR0oPLENO7/FMMx5C
         m3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ren2+uJhEOKFuly4Y7r0RVT/r2/Z143SWwTToasxhOA=;
        b=XrwQJfU8ls3C9325eiun9xBd5Wy6MowsJMSVp/BZ3jhyu5+ORojsFWjSsd5rGCceJS
         /1sY1XNjejS5THS/V5scezHVZJT6eN7sk09S7Gj9CHMVsSI708prJL7U0ahxRjg4w5NV
         Em6icHkreVhqn4Y78rKnGD3uHuC4ijNS9EGTd2d2k0qgfvL6Iu7e2ijw5xvQg05tEYfa
         Gr0GpUrkaLD2mjIbO0pY2e+7U0lSGTp1WHLDtM05mHdkxyAeQ/0uoUHVaz4rUSYehEeZ
         qvyTvivEAk6EqweKXYOyyxCVfrI84zJeYGV6weLBeRuFEt3ltljPoZZz5Cd6W6X8SOAR
         356w==
X-Gm-Message-State: AJIora9nnc4J7uwX9pwsOVcmW3jgeXBdebkSncNDRDWqYe0OyD2sXwIE
	AFxot8oq73MiezrhK474QZI=
X-Google-Smtp-Source: AGRyM1tjj8BA36t5S7r9EYwBFt3Kn2rjeOb1UXCuXZaNTZE7evzeCkF4MwXZS/VBuSfPIwoVJ7nfIg==
X-Received: by 2002:a17:907:86aa:b0:722:d5b2:fca2 with SMTP id qa42-20020a17090786aa00b00722d5b2fca2mr3277139ejc.264.1655907171611;
        Wed, 22 Jun 2022 07:12:51 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.148.38])
        by smtp.gmail.com with ESMTPSA id k10-20020a17090632ca00b00722e7919835sm2332703ejk.111.2022.06.22.07.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:12:49 -0700 (PDT)
Message-ID: <45a6ab4b-bc43-2c98-4f94-be6e4e9fc445@gmail.com>
Date: Wed, 22 Jun 2022 16:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 0/5] mtk_iommu: Specify phandles to infracfg and
 pericfg
Content-Language: en-US
To: Joerg Roedel <joro@8bytes.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yong.wu@mediatek.com, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski@linaro.org, miles.chen@mediatek.com
References: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
 <YrMc2EUBDIxnoWiB@8bytes.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <YrMc2EUBDIxnoWiB@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_071255_392026_6E0DF592 
X-CRM114-Status: GOOD (  10.30  )
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

Hi Joerg,

On 22/06/2022 15:44, Joerg Roedel wrote:
> On Thu, Jun 16, 2022 at 01:08:25PM +0200, AngeloGioacchino Del Regno wrote:
>> AngeloGioacchino Del Regno (5):
>>    dt-bindings: iommu: mediatek: Add mediatek,infracfg phandle
>>    iommu/mediatek: Lookup phandle to retrieve syscon to infracfg
>>    arm64: dts: mediatek: mt8173: Add mediatek,infracfg phandle for IOMMU
>>    arm64: dts: mediatek: mt2712e: Add mediatek,infracfg phandle for IOMMU
>>    iommu/mediatek: Cleanup pericfg lookup flow
>>
>>   .../bindings/iommu/mediatek,iommu.yaml        | 17 +++++++
>>   arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  2 +
>>   arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  1 +
>>   drivers/iommu/mtk_iommu.c                     | 50 +++++++++++--------
>>   4 files changed, 49 insertions(+), 21 deletions(-)
> 
> Applied, thanks.

I wanted to check if you took also 3 and 4, as these should go through my tree. 
Unfortunately you haven't pushed your tree (yet). In case you took the whole 
series, can you please drop the dts patches. I'll apply them now on my 
v5.19-next/dts64 branch.

Regards.
Matthias

