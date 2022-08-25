Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75011C64990
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuJPtoYgjjN5/e0jyvbLMFRYdN9rtOzOfHKRxWyYoBU=; b=QG0+unaIZXlmgpoqvCoO3MkkZh
	nC5VA5J41vx5qevpnfnFZ7KFHqSk/j7qCDXxFKNBHlIT3cd/oNx2HJlwXuugjImxtCzjNWDAhk8q2
	3w1KeKveMmUk2j/NGOOiY28WCUbBzCKhOnY8AleqSxYGJYZy1I//3ihzYTT/1bMUkRoDu1Ww0wSXf
	FTr6w/JZITd+7L4b3rv+0dbRv6s0GAD8K3ydKBfUUn+oUUq1hpvScrr+mVpOMyrpslYLi+sgGousl
	TEqAcWUKBxZYvFu9OCYAKsr6Lxf8/g6/4T30oBefgXoLAMeXl4limd/UBNv2+CUK/ECuoKVb/A2ul
	Weqhh3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREE1-00FQrF-Jf; Thu, 25 Aug 2022 14:52:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREDy-00FQol-8U; Thu, 25 Aug 2022 14:52:51 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h24so24951939wrb.8;
        Thu, 25 Aug 2022 07:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=EuJPtoYgjjN5/e0jyvbLMFRYdN9rtOzOfHKRxWyYoBU=;
        b=eg7BC7KjISFyUh8Fm26l56dTvHw7nfA0x7+7uYfoLZ4Dyk6v88U+OAMc9JIripiW4H
         E8Rnc+Tq5whRFWEewjB8GSe+zjUlUbwJ49gkVu4T+6S35u+S2RoD+QFM4+XYL6b1ombc
         PYGGjlcqmZrIxw8GD3Jj5qN3+60Su5jPaLNjZmE9BXRM+TGBTVNrPtQWiKLOam6OwaqB
         bIiCXfHjH9O/kbBUrEYy0bwGcCBhz2UZ/IzCkG1RApHHhMhLUlX4cja/VgIyIMpdVE9Y
         51S7IwNis/iWsX/XLc/uRkXUn2FPVITfB6IL1MaHfxJyu4Z9CNppmAQGj7a1isZqh4Or
         vGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=EuJPtoYgjjN5/e0jyvbLMFRYdN9rtOzOfHKRxWyYoBU=;
        b=XSe4Tx+Jhnpm+zZbzJOgKjjF5bfMZreNT2FrhEaoYBgK9jp1SVQPIheY3bIRYV73NP
         lAU7T4DTrMrDKBZJEYXAfYFaIGAVk8hAMEU48uAEGMxOR988gDpcNkWJXG92Rx4M4nKz
         Es4fwOisteZqSEdx3XJ6v1djmKFwjdi//j7TicfcATcCU8n0pDsyaGnQf/WirfHuFBpW
         h2UJ+qT/Ct0Kv17sEhVYIpYfg5xbfTaWNWhnDP6v02ljdEjRRLdT8c0fJb/pV5OLPrLR
         B1yUVSTWwpplOYapjKP5Z2B7lAXEQFVIeVVtCAYDyoNlpDfUVfA407F4JnZ494UsLoA5
         RxgQ==
X-Gm-Message-State: ACgBeo0UobtWBuv6wp8xx/QSdniOrdxegC4swI8XbzJjJY6xpmXcKCyt
	FXfXma3ucs2v4y+pstnA0SQ=
X-Google-Smtp-Source: AA6agR5xjrDrbHwGtRMFWO2CBXbtGRrUyxMfRYWrcPVy4NZm6akviQOSxZVXcpH40iI9WsgKXmA9xQ==
X-Received: by 2002:a05:6000:1d82:b0:220:5f9b:9a77 with SMTP id bk2-20020a0560001d8200b002205f9b9a77mr2511169wrb.622.1661439166564;
        Thu, 25 Aug 2022 07:52:46 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d5907000000b00220592005edsm19918911wrd.85.2022.08.25.07.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 07:52:45 -0700 (PDT)
Message-ID: <e48c22e9-3fa6-2d26-4829-77b7fb737da5@gmail.com>
Date: Thu, 25 Aug 2022 16:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v6 00/20] Add driver nodes for MT8195 SoC
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
References: <20220811025813.21492-1-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220811025813.21492-1-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_075250_341503_4E58094A 
X-CRM114-Status: GOOD (  17.86  )
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



On 11/08/2022 04:57, Tinghan Shen wrote:
> Add driver nodes for MT8195 SoC.
> 

Applied 7-20 of this series.
Patches 3-5 were taken from v4 by accident but AFAICS didn't change.

Thanks,
Matthias

> ---
> v5 -> v6:
>    - rebased on linux-next/next-20220809
>    - update the if/else condition comment in iommu.yaml
>    - some v5 patches are corrupted caused by extra line wrapping
> 
> v4 -> v5:
>    - rebased on linux-next/next-20220802
>    - fix indentation in scpsys.yaml
>    - rewrite if/else condition for infra iommu in iommu.yaml
>    - remove unused clock from infra iommu node
> 
> v3 -> v4:
>    - remove unit address of power-controller node name from v3 scpsys bindings
>    - v3 patchset 7 and v3 patchset 6 are combined as v4 patchset 6
>    - add more commit descriptions for updating mt81xx scpsys node
> 
> v2 -> v3:
>    - fix dsp node name
>    - add descriptions for iommu interrupts
>    - limit the levels of power domain nodes
>    - update maintainer list of power controller yaml
>    - support naming power controller node with unit address
>    - add SoC specific compatible string to scpsys yaml
> 
> v1 -> v2:
>    - add new dt-bindings: mfd/mediatek,scpsys.yaml
>      - update compatible string for mt81xx scpsys nodes
>    - apply comments for yaml files: iommu, smi-common, and power-controller
>    - apply comments for dts nodes: power domain, vdosys0.
>    - apply comments for commit message of watchdog, i2c, and smi-common.
>    - add review-by tags
> 
> ---
> Jason-JH.Lin (2):
>    arm64: dts: mt8195: Add gce node
>    arm64: dts: mt8195: Add display node for vdosys0
> 
> Tinghan Shen (14):
>    dt-bindings: iommu: mediatek: Increase max interrupt number
>    dt-bindings: memory: mediatek: Update condition for mt8195 smi node
>    dt-bindings: power: mediatek: Refine multiple level power domain nodes
>    dt-bindings: power: mediatek: Support naming power controller node
>      with unit address
>    dt-bindings: power: mediatek: Update maintainer list
>    dt-bindings: power: mediatek: Add bindings for MediaTek SCPSYS
>    arm64: dts: mediatek: Update mt81xx scpsys node to align with
>      dt-bindings
>    arm64: dts: mt8195: Disable watchdog external reset signal
>    arm64: dts: mt8195: Add vdosys and vppsys clock nodes
>    arm64: dts: mt8195: Add power domains controller
>    arm64: dts: mt8195: Add spmi node
>    arm64: dts: mt8195: Add scp node
>    arm64: dts: mt8195: Add audio related nodes
>    arm64: dts: mt8195: Add iommu and smi nodes
> 
> Trevor Wu (1):
>    arm64: dts: mt8195: Specify audio reset controller
> 
> Tzung-Bi Shih (1):
>    arm64: dts: mt8195: Disable I2C0 node
> 
> YC Hung (1):
>    arm64: dts: mt8195: Add adsp node and adsp mailbox nodes
> 
> YT Lee (1):
>    arm64: dts: mt8195: Add cpufreq node
> 
>   .../bindings/iommu/mediatek,iommu.yaml        |   29 +-
>   .../mediatek,smi-common.yaml                  |   11 +-
>   .../bindings/mfd/mediatek,mt8195-scpsys.yaml  |   67 ++
>   .../power/mediatek,power-controller.yaml      |  137 +--
>   arch/arm64/boot/dts/mediatek/mt8167.dtsi      |    3 +-
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi      |    3 +-
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |    3 +-
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi      |    3 +-
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 1054 ++++++++++++++++-
>   9 files changed, 1176 insertions(+), 134 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> 

