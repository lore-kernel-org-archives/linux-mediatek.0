Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52DDCCA481
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ren2+uJhEOKFuly4Y7r0RVT/r2/Z143SWwTToasxhOA=; b=XPPG0feUQ+SZxm7B74BYAHGo/U
	lCF6FtOoTjBSNKlsVHglx8vSugGQ5WSoIvBsqogngnWLQSZYbR6F7qYvbGnlrAQ//fYQcLcc4kRLQ
	mmIaY5UfkudJkt/3n+Ba8iEw5B55IQ+E7aHU/eu+j8JuMGhV+xXR77mBOQ/U3fVjW4eVLDbnp+Ccw
	FPvtIAaEqt7Ay+X7E1m/vYeKGOwt79q5deejl3TJ7eDo1EHKSUtgVoE83Vz05POfFvqBe/8fO6cjY
	z76SQLowSMyB2+3RTQ3+KpPxusrLdw086wO+sNa6vBRyVrFud/sOBynyrQYRPZ0qlY3umnolLQ+9s
	mHqm4VMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o416G-00Apmw-4g; Wed, 22 Jun 2022 14:12:56 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o416C-00Apkk-UM; Wed, 22 Jun 2022 14:12:54 +0000
Received: by mail-ej1-x632.google.com with SMTP id u15so6885272ejc.10;
        Wed, 22 Jun 2022 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ren2+uJhEOKFuly4Y7r0RVT/r2/Z143SWwTToasxhOA=;
        b=DeOw2wN9IdijMC2unWkJBkn+F0tt1mYIyrxsmxR8zGIsx8/cjJnRnFkZjEYZR5v9Jn
         xz5LX66Z3YY5K4Zz3g8/bTlx4BWJohVZrld5+reQtujgrYk74t0a8x+Q11wcVAt+C3tx
         cPZO1WbrXhdHJI/4y6hmqzkZZDkM9BftULJwtglLO5v3H2TNVmFKjzegwg4PT/m03Dmi
         QXifV5FRRtVHRu5BFg6Ex0yCvBeViPdV3ntO12SIXDgEDa7+MghdN4/m9+20iyyIubTq
         +2YVHcgzLL0A3ljn87Q3x3JTVG8xnYWswRkIg6KCbStGL2xY4cS4jYioPHz8LNfR1EVN
         DKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ren2+uJhEOKFuly4Y7r0RVT/r2/Z143SWwTToasxhOA=;
        b=j0OLKmTANR6RyJh6EEgBaWoFKQLKgJ7N3B2iseS6/SgZ+0sOMhb9Sn2JavWaiOGrxS
         8FLmc86mVRWfo6BHdRCdvrxSyxek82F0g/czJa3yXFBm5/ikqMY612XmQ4MDlGXs4Bat
         AHAn2qFJZvPVuX52/xik7jEyY1Gy3d3R3/BTSD0/UnoBs0KLudYuRY3HeNCY204HkXnE
         wzy1xKFzMCBszfphBTx2X6VHHGPg9UXkhTy81r20AWm4KG+t+VYWrYVkozhxg1XKnP1B
         L4e5Nm15THqGVGOq1ZJQiZ8cQCU1OVEu2iAIB40JKl/RbTDXn73QCZdMSefeZJPJr7Zw
         zc1g==
X-Gm-Message-State: AJIora9RTmbQ82rMPgqz64dcM5rawOsuAObFkKNibJCu+UO8EUuwn9yw
	K/1heJR1Dwqibc5vXwJ1N6U=
X-Google-Smtp-Source: AGRyM1t0OvYHeXsCleYG7c+Bdl+xwzqiXlEMNOW8mbHHHkBOXkEEbMYHepKrU1rP9EliZy/8YVZE+Q==
X-Received: by 2002:a17:907:7b8a:b0:707:59d4:14a3 with SMTP id ne10-20020a1709077b8a00b0070759d414a3mr3351002ejc.51.1655907170343;
        Wed, 22 Jun 2022 07:12:50 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.148.38])
        by smtp.gmail.com with ESMTPSA id h5-20020a17090634c500b007041e969a8asm9257889ejb.97.2022.06.22.07.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:12:49 -0700 (PDT)
Message-ID: <4023cf19-601c-a2ba-85b0-450fb2df9401@gmail.com>
Date: Wed, 22 Jun 2022 16:12:47 +0200
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
X-CRM114-CacheID: sfid-20220622_071253_056783_1810BD4B 
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

