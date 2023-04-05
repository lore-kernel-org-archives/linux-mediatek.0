Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F96C76188
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHh6zzAce+jaaDv5uLWbvrxiFe4RlqISTI0cdrv8gGw=; b=KPNJtpq+JlTBEEtBB7KL3SrncT
	/HQfU014lne9pVgplSRCBMscAjsQZepltYKVVuvLWWTUZQBBks9vaNEmhGtREer482rzkoPEpxlSt
	si05Bkub9LzuB21RNR8g47h594RZUXsRPVj974Msqvj3kHhJJisDW5z5Fa+Z6sLRYbSZjagI+5sMh
	gIvtReLnjodrPGVbkjxpOWrqX2kFywXlLMin+K9d1FHQGsI79Wd0ZZ4ytz+aFuXqbsKzpjkcXZGkA
	U/NERNXK6/W28moILYYftaZ20mgp83Y6VPEieP0DSq1K5HmDByGfWvZZxlYU0ExkhxdFfH86O+Kdq
	GNN4fUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2xY-004VAW-2x;
	Wed, 05 Apr 2023 13:13:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2xU-004V8v-0A
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 13:13:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so4028999wmb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680700428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHh6zzAce+jaaDv5uLWbvrxiFe4RlqISTI0cdrv8gGw=;
        b=oC6b60CGc0i+X2eamIm7a4q3wmo0Le1bJgkKz75LJtPkxtGgsS3kIBCEbh+WkZDs0t
         5HC6ywocBdzZf2mTPaHIRmhcr1rpVxDbrhF0jX+C31QfjhiIJk09071Ft5H49Lb3BROz
         wExQ7VGxXyddgnTyjJI9jx0slUkJDeB8fELrOc2QlpWn0EbRZDl/ES4e4p8aIEM+2LhD
         TIaF3IeOPi3QOXrYNeFefemGQZQwdxioJloOIbUu3s1WkaeFfSoOLXrwB+lwRI5mBOsu
         Zdt760+0KlAUBPxnEreikCGZ8CD5+z4XIiacbtCyZZ7jFZ6k96o/jVecjZg44c8iHrtX
         BP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680700428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHh6zzAce+jaaDv5uLWbvrxiFe4RlqISTI0cdrv8gGw=;
        b=oxWZUU7hsCRob9xEAOBA86x8X5UUUik0UjYvxkq9h0tRy5KRRbl/eqTUxKAdkgg41+
         kTiAOLE0deg4qDL8QRrLWAmljA1CCcoeNOIZSFHlp+ldR7WNHnTwWJf/lArq5E4olP9t
         lw8bCWnnf0mf/I6fKmGoBRPAjfmaSTPKtYpgDjsS4EdIgdWWa17Ka22W0D5o9PixpWkO
         VHdkSjeoAEIZVeOHWBcrpHBgvZ03e63dPiBFcAAi1AMyqQuQbj2p6/bbajTUdredaGp3
         S/Ck3hHva+bZWjbjCniHljgPyNR1lKJZKo6Z2rlcvCiJOW0SdylauPY+uWKOS6NJTzCe
         cOcQ==
X-Gm-Message-State: AAQBX9f9QPhz8Tbbt6hsy4KLyR5JiNhMCZfiEhcmR0KvsG84rfdsYs1v
	xttfL4amqTzJrrVb4Ljp19ta7gYSJzupSjXLAfU=
X-Google-Smtp-Source: AKy350ZyPGUFGjG9cy0rn/aVbR5i527mmHWJxdldoaXSN0tARqQJmd6qhS1NVW6cU3hiqFGcYnWKMQ==
X-Received: by 2002:a1c:7309:0:b0:3ed:ec34:f1 with SMTP id d9-20020a1c7309000000b003edec3400f1mr4566693wmb.35.1680700428151;
        Wed, 05 Apr 2023 06:13:48 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c210d00b003f0373d077csm2144586wml.47.2023.04.05.06.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 06:13:47 -0700 (PDT)
Message-ID: <3c51a5d3-8d76-9d8e-7cbe-6a2a1776b360@baylibre.com>
Date: Wed, 5 Apr 2023 15:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 00/10] Add IOMMU support to MT8365 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
 <00a0d832-9a0b-6160-31eb-30d2e9c32c79@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <00a0d832-9a0b-6160-31eb-30d2e9c32c79@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_061352_094448_A499846E 
X-CRM114-Status: GOOD (  13.34  )
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


On 05/04/2023 13:43, Krzysztof Kozlowski wrote:
> On 05/04/2023 10:06, Alexandre Mergnat wrote:
>> This commits are based on the Fabien Parent <fparent@baylibre.com> work.
>>
>> The purpose of this series is to add the following HWs / IPs support for
>> the MT8365 SoC:
>> - System Power Manager
>> - MultiMedia Memory Management Unit "M4U" (IOMMU)
>>    - Smart Multimedia Interface "SMI"
>>      - Local arbiter "LARB"
>>
>> This series depends to two others which add power support for MT8365 SoC
>> [1] [2].
> So does it mean they cannot be merged? On first glance I do not see the
> dependency, so I wonder if we understand the dependencies the same. And
> subsystems.
Exactly, we shouldn't merge it before the dependent series to don't 
break the build due to
"#include <dt-bindings/power/mediatek,mt8365-power.h>" in the DTSI file.
Additionally, LARB will not work properly (or at all) without the power 
support.

Regards,
Alexandre


