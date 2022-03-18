Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA46C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 13:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8KXyOGPXF86dUjLYbjh5ebQKA7XqeJtrJ7TW9dP9ss=; b=LZ2ZaCxbwyMvPa
	Z0ygC77hjkbv5/QNEYXksnSW+uK5LEEowDdpN3XzcxU8vrIG3tyhDIYfbPUKgQnx/tMw+gBKKphrv
	MHauJFwegEEcy40iPqGP/LVHrmiY6o1UJLBV5FpyAW+cCl7n9+SYw3XjJuoH8T4URw52f92spyQMo
	95OCW6eMqSmilGO5ViiqHWWW8ASORfOmrwhKn1RSPCAX8nzVAQwFOjAfQ+Gtrsj2++rBvJe1OHXHZ
	/i2yzX0OfJA3vraOKy8+R6w1kCeJyPWrPpE0e0WO1EpgYQPv4CQv2sG0I30yJICWwebYxDd5UK5/C
	w6RXF35WWSoWXuvxJ5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVD1D-001mIE-B1; Fri, 18 Mar 2022 13:51:51 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVD11-001mFM-In; Fri, 18 Mar 2022 13:51:41 +0000
Received: by mail-lf1-f41.google.com with SMTP id m3so2216243lfj.11;
 Fri, 18 Mar 2022 06:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b9OLIL3FU7iqHaTzdpvx9tQ2K5mp7MDYbZXYpsTAN0g=;
 b=erELTcthA3ja7ONUYZnVALKTOva93Y6UKDX69RXiWXIStx6V4OZstBtKpc/tRtuf0P
 Llxz74sB0Q3uqgWrpGM2+asKTKSIOKNeXk1JreHq6Adg8Rl6yoj/oVkN2aJ6TXArnGgZ
 WfSj8dO000jrelhr7If/ZZ8+ifmu2gAkc5bvytD/Pc7dhN+IItQyROaQWc2aMFIeDVJQ
 9m9+KMppg2cyEk5S64QqoAhoBNd7QShyMpQAZH4JKkJdDZkxJmrtb3tK/ENnMrYR9MW2
 RPLpa37GA657v2cUoz673lojpaOVSr1iyKuvHTgwQ3FdSV9PSNAgsBbvcvxcx3OzVD71
 ZZXw==
X-Gm-Message-State: AOAM531BzP+Vl6Q2Nx1bNcsAIsBuVHj9r41aBGPEQe4S1kSzUkwPr6ZD
 OSDcWTJML0ftZJhNFgdSZEA=
X-Google-Smtp-Source: ABdhPJx7X5h60uL0s5bvwhRfCRBZftSK7GqJvL9XYD9AW6eJxvInfetEBomo2GlVtSq5cQ5G2u2Xag==
X-Received: by 2002:a05:6512:1513:b0:448:39c0:def0 with SMTP id
 bq19-20020a056512151300b0044839c0def0mr5961595lfb.469.1647611497912; 
 Fri, 18 Mar 2022 06:51:37 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 l26-20020a2e701a000000b002463f024de9sm967013ljc.110.2022.03.18.06.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 06:51:37 -0700 (PDT)
Message-ID: <319cf016-55fb-dcd4-9157-ad795c8e68ff@kernel.org>
Date: Fri, 18 Mar 2022 14:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek: Add YAML schema for
 PCIe PHY
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com,
 randy.wu@mediatek.com, jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20220318095417.2016-1-jianjun.wang@mediatek.com>
 <20220318095417.2016-2-jianjun.wang@mediatek.com>
 <2e0989c3-7132-6091-5c9e-5dc8d9af22e8@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <2e0989c3-7132-6091-5c9e-5dc8d9af22e8@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_065139_652357_9DD91294 
X-CRM114-Status: GOOD (  16.31  )
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

On 18/03/2022 12:12, AngeloGioacchino Del Regno wrote:
> Il 18/03/22 10:54, Jianjun Wang ha scritto:
>> Add YAML schema documentation for PCIe PHY on MediaTek chipsets.
>>
>> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
>> ---
>>   .../bindings/phy/mediatek,pcie-phy.yaml       | 75 +++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
>> new file mode 100644
>> index 000000000000..868bf976568b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/mediatek,pcie-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek PCIe PHY
>> +
>> +maintainers:
>> +  - Jianjun Wang <jianjun.wang@mediatek.com>
>> +
>> +description: |
>> +  The PCIe PHY supports physical layer functionality for PCIe Gen3 port.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8195-pcie-phy
> 
> Since I don't expect this driver to be only for MT8195, but to be extended to
> support some more future MediaTek SoCs and, depending on the number of differences
> in the possible future Gen4 PHYs, even different gen's, I propose to add a generic
> compatible as const.
> 
> So you'll have something like:
> 
> - enum:
>      - mediatek,mt8195-pcie-phy
> - const: mediatek,pcie-gen3-phy

I am not sure if this is a good idea. How sure are you that there will
be no different PCIe Gen3 PHY not compatible with this one?


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
