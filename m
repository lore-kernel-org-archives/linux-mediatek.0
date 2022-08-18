Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6947DC00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 07:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MShj7bLv/0nXMa1+Mpubq1Kb89/01zNVMLHcgTT9z2k=; b=1QYWw/P7jerehY1f2nQdX1O2/q
	EnSNHN9rWOIPSEwXLNaW+QhEWdz9//CmvK03ITiI7Tb8borGxj6b7ecItMsX82pJYE/ASd2AxZm5t
	ZYxOn+AIVuVTXfJXBwDzepDGORM6vucstcU0D3QFoSM6Sy8fg9oUL5yy4GWYPPq8YSkQDQlMASjR5
	fRoGOsPoteSWfkmPkkrIUkHDkALbvMDsLribOv8vg2xIPwR0RvdGQAF2o+SB5p1AGvh7R+V7WHrIW
	BPZgWJMBjK3i+8gw6Qf3RVFzXJAlfLXakdUD5zMu87LmsV0I3ZvI434xpCMdEMtB5cnSVMt8RbIXu
	ytCaFB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaAu-000Ggw-U3; Thu, 18 Aug 2022 07:42:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaAr-000GZT-Gw
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 07:42:42 +0000
Received: by mail-lf1-x135.google.com with SMTP id i19so1065386lfr.10
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 00:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=MShj7bLv/0nXMa1+Mpubq1Kb89/01zNVMLHcgTT9z2k=;
        b=YHqqkucWXRjBvTIxJw0qxFunWWDJ3R2dX3GNCnIzdCv4OlisfZbhurbjMi9j1Soj+W
         47ltrVwrnQpn7+p9sFPfXVH3aIbJMWSKa66QQvxao/SVEM68GsP0P26yQ4B+n6o4OpvV
         f0PkBk6GImk/jSuhRcNp4b4p7WqXQcqwqjOMcFVf/vE5ttwif1GAwWHtHzM1RZc3sOyt
         SwEaDTWRR8bQqw2qd3n47Rfe8JZqCQDjf1/f/IEjWhHC5xWtBFKhm7221NfK17rZ+ciA
         YKbCGMQUMzgWdPAExP5QC8S0RIIW6I8/mNGXAe6rbyjMkzyCm6pSOxx0iID28wmeWS+5
         A+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=MShj7bLv/0nXMa1+Mpubq1Kb89/01zNVMLHcgTT9z2k=;
        b=IUDHe4fOiD3PJ1LZ9YU1HekxMR4P4vN3BtTEeH/e7d0msX3geJn8+y2B14LwKiymnK
         oUjhpxiOSnyP3j1tH3FJzVKGaESIUxJZysyTB1kyfQor4dH0uQVQR080zYf6tSu7G2F0
         kZRlXd+mtRYsjR6W15EZrUS3RuSe4vp8Y7hcT3xCFs2wKUCVbq6mS4pC8iQp8ysPCbDH
         qxJZC5cKSgzzRcURSJCOkK5DIHkuNyNXDZmcPcuZQfLfbODV2AVFTPWow3otOHnKDKtC
         apfDt3a9Hk3X6MshvDrdBz6dUNVB8dGzl/969KO1XxFnfitf34px5ZRnPv+QXJBYA+Um
         iXNQ==
X-Gm-Message-State: ACgBeo2oQfnJ75qYQ3fHtWExlWu0GJIvPer+YkexVX9Tzpvdiq5MlgfL
	xMyslqBbAmUJtJ3UDhhV1fxMYA==
X-Google-Smtp-Source: AA6agR7PpZvNHmLb+qevA7oB617jiMAhR6HzQHvikURalXdanu3cXl5ZOPY+cac1GOxiwZ4UbXAsxA==
X-Received: by 2002:a05:6512:ea0:b0:48b:2d45:f254 with SMTP id bi32-20020a0565120ea000b0048b2d45f254mr545086lfb.365.1660808557206;
        Thu, 18 Aug 2022 00:42:37 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id y8-20020a05651c106800b0025e42f8e771sm118132ljm.34.2022.08.18.00.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 00:42:36 -0700 (PDT)
Message-ID: <61c0d3bf-cf1f-77f0-bb47-dec7cde5b488@linaro.org>
Date: Thu, 18 Aug 2022 10:42:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: mt8188: Add binding for MM &
 INFRA IOMMU
Content-Language: en-US
To: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220804105834.626-1-chengci.xu@mediatek.com>
 <20220804105834.626-2-chengci.xu@mediatek.com>
 <ae06f644-b988-8fc3-fde8-258299f8f2ae@linaro.org>
 <f34db3a295b8c83e03bf79950cc25d39b6f81240.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f34db3a295b8c83e03bf79950cc25d39b6f81240.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_004241_616672_6690D67C 
X-CRM114-Status: GOOD (  12.59  )
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

On 18/08/2022 10:26, Chengci.Xu wrote:
>>>      then:
>>>        required:
>>> diff --git a/include/dt-bindings/memory/mt8188-memory-port.h
>>>  b/include/dt-bindings/memory/mt8188-memory-port.h
>>> new file mode 100644
>>> index 000000000000..612fd366c3a7
>>> --- /dev/null
>>> +++ b/include/dt-bindings/memory/mt8188-memory-port.h
>>
>> Use vendor prefix in filename, so mediatek,mt8188-memory-port.h
> 
> Is this a new mandatory rules to add a vendor prefix in dt-bindings
> file name? we have never add a vendor prefix before.
> 
> If possible, we'd like not to use vendor prefix for the consistency of
> fliename's format(mtxxxx-memory-port.h).
> Such as "mt8195-memory-port.h" and "mt8186-memory-port.h".

That's a generic rule, although loosely applied. The consistency is
rather to have a vendor prefix everywhere. Why Mediatek should have an
exception?

Best regards,
Krzysztof

