Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD64C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+OvlGvA0YgoD25hE/RBeJOSl8R0fjbyJIDSe7KWLpc=; b=SJ3JDfoTAuduKI/9uCStefeTpS
	ax9T5AxGcRpm5kKv/jZY34Dfl/uvMN1RHU0g5CltgsBTa8rVmacQ4PQM7IQg0ImwhHLhzPG1wEqhe
	5ZNJWBB5EXbcimKYcLOIaP68bKBpSxZdx5EA9bjOn6ajnqBmtreKFBmO2x2BQJZfTCligM2oPcavf
	T8RqmxsZsCl1lDwR5Qny4vyZhrmUHSlIsGcUvQ4xEZFAFjhalb1qwJwhgFedKsYHLVj+0uCSggZvW
	LVixwvdjM3X+jvLP++2DfLXBXXUjO4rs+QyTiD/TA12sv9JfGrtQkOFbbLHbiRtMlV/4KEu8PSyCQ
	eF5UmW4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY834-00Ci9Z-QP; Tue, 13 Sep 2022 15:42:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY831-00Ci6T-Q2; Tue, 13 Sep 2022 15:42:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id n40-20020a05600c3ba800b003b49aefc35fso510924wms.5;
        Tue, 13 Sep 2022 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=x+OvlGvA0YgoD25hE/RBeJOSl8R0fjbyJIDSe7KWLpc=;
        b=KuuPU3qCJJaqBEXAewIGvSz2z+Fv5JjSS/XkzMRyESkunK9ehw5l+NIXXddxaJUvPZ
         zBr6M1iAJp2fdRDhGrE9g7YTV5AmdPNlKiXy0QACGRIbk9Oqh3vWNdeqtFZOHr5x3jGv
         TzuoBRRr/sh379Vl5VHQUcVvxJ3SDik8Npx6EC1axWwst5Gb877ZE0LmLu0shewlSnrZ
         OzJf73mev8wrKhp7cr4bhS8c7ehsquMt3QJ1qFq3O/6dsBPKRxbDxaEOyR5Lu5BMiRxS
         s4y/39vHyWLOdKWy+PqGmcgb8HZhz6vwPsQ2kMHo6rYRn9j/uYfiSZrW/yPD05WMFdIZ
         msWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=x+OvlGvA0YgoD25hE/RBeJOSl8R0fjbyJIDSe7KWLpc=;
        b=jU0+Cu4Lp7z4a+ayKHYBJIroYGrgfXFGQ6+7zpF3nwXThAbQKcKHBj16QtSXnTmcUS
         9MUXi5PyzInEtX8Ahg5cpqoyOmX/o4XR/ZwjKXg3xNaAQltPbmnTXbzUoA22bb0sHuyH
         ICHjN7awJCm+K4u0pyj4dJEg4CmzvzXp5g2E0FSuunXrRV6R9QYL2us/DYogOJ7lBUNB
         ie2hGBqTOt/r0r8rAV/k1TZQJ3xv9bbXd49Tum3HtfkMCFM9FoF8mSRHHVbMOSh6BREv
         JKg4M7ld44MH5IMXsr9Di0BAdkK4IRXOo0EW1J2qor936eypIupUfvcxodMv7gwE8KYJ
         nsQg==
X-Gm-Message-State: ACgBeo0GrBuHnuKVXVqRNgl4sHltgsGzkHsuFGGzNfpm/clDhwanX1hT
	xmsuyK0SpMOGhhK3f8tNO3g=
X-Google-Smtp-Source: AA6agR4Wau7001C6apUNfVYL7NfB2RY0GfBXdrtkoDtoiRpzgxAxENutqX4G8O9vqAmtXjLBB9xKMA==
X-Received: by 2002:a05:600c:19c6:b0:3a5:ffb3:d527 with SMTP id u6-20020a05600c19c600b003a5ffb3d527mr2963647wmq.106.1663083717615;
        Tue, 13 Sep 2022 08:41:57 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003b47a99d928sm10704548wms.18.2022.09.13.08.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 08:41:56 -0700 (PDT)
Message-ID: <8ca1574f-a8b8-9482-3129-922f6f85216c@gmail.com>
Date: Tue, 13 Sep 2022 17:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 0/3] MediaTek Helio X10 MT6795 - M4U/IOMMU Support
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 joro@8bytes.org
Cc: yong.wu@mediatek.com, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org
References: <20220913151148.412312-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220913151148.412312-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_084203_877503_B68AF08B 
X-CRM114-Status: GOOD (  15.61  )
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

For the whole series:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

On 13/09/2022 17:11, AngeloGioacchino Del Regno wrote:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This series introduces support for the IOMMUs found on this SoC.
> 
> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
> 
> Changes in v6:
>   - Fix rebase mistake in patch [2/3] (dropped unrelated change)
> 
> Changes in v5:
>   - Rebased on next-20220912
> 
> Changes in v4:
>   - Retitled mtk_iommu commits to iommu/mediatek as suggested by Yong Wu
>   - Removed unused M4U_LARB5_ID definition
>   - Rebased on next-20220624 and
>     https://patchwork.kernel.org/project/linux-mediatek/list/?series=650969
> 
> Changes in v3:
>   - Added new flag as suggested by Yong Wu
>   - Rebased on top of https://patchwork.kernel.org/project/linux-mediatek/list/?series=648784
> 
> Changes in v2:
>   - Rebased on top of https://patchwork.kernel.org/project/linux-mediatek/list/?series=642681
> 
> AngeloGioacchino Del Regno (3):
>    dt-bindings: mediatek: Add bindings for MT6795 M4U
>    iommu/mediatek: Introduce new flag TF_PORT_TO_ADDR_MT8173
>    iommu/mediatek: Add support for MT6795 Helio X10 M4Us
> 
>   .../bindings/iommu/mediatek,iommu.yaml        |  4 +
>   drivers/iommu/mtk_iommu.c                     | 21 +++-
>   include/dt-bindings/memory/mt6795-larb-port.h | 95 +++++++++++++++++++
>   3 files changed, 118 insertions(+), 2 deletions(-)
>   create mode 100644 include/dt-bindings/memory/mt6795-larb-port.h
> 

