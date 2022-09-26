Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C27C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONMXc2NYSKLU2aN6oTiPbh08PngY0fLPwitzKB3HkaM=; b=V/90VwZw4fLntiOzsMmXixNhkQ
	qet/EuT6pU6mlBonLRHbsRXT4QgKZzXX+2yjyywP66ND+NhMgOjqNlLUsKwQRkdY+a6OxvwjKz6XN
	G4XpTmYK/dpr3ukCRMYnzSfSwb9SMMTcA13jBrzk5Yo8KtTAVwQfx9yDzn7PtyjNgecZ9JIDK6ba1
	sXBHbCvMWE2ybuRl8rcUgXNdC8C0dqQVW3Lo62sLHv5kV8mSIBf4mjM7aMctB0w6/y0xfwE0qzup0
	ugcyumbqgHhDjQSGxx41kpinfM4rp2n6Pw01gTTf+jEfWsDkt302MTcPj4TH8ZxbunAVAjb5YbanA
	05QbUFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocndl-004zfx-Sm; Mon, 26 Sep 2022 12:55:17 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocndc-004zbp-1k
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 12:55:09 +0000
Received: by mail-lf1-x134.google.com with SMTP id k10so10694086lfm.4
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ONMXc2NYSKLU2aN6oTiPbh08PngY0fLPwitzKB3HkaM=;
        b=RfL1gwFExuPHbjESlShA9UaN59Ajr+yNw/ArqU0Q3w7COwsv8TYAFlb9gocMXrHLxV
         6Vr0mkcYl1s5UFFggXoqPfLFKnkdTjieyBcUJ5u3LiZoTx7YMTZL49ijRiYWLdp6Jm90
         fB9Ok7+wqvW3ksYbhKwtKhBiACyS+aJ/lvIQTaOoF4xZjtC4p0rOwcHP/s9BxR8u38Zq
         WQ35DR2GslSqk9E3Yv6/ytNKQSZ2kuvZSo/gL6RcWO6yxaPM1WvKdxtPHVAKrTZh4n2c
         lGyPi9uMCul+LJt/7eenFVDgOCwFKLghNOBx+ZDoRG19njUOAAtw4nfjz3l7Avi0qkGU
         Rglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ONMXc2NYSKLU2aN6oTiPbh08PngY0fLPwitzKB3HkaM=;
        b=QeeZZ/t6tbjz76TV8CDuoXEWEdXhGyoobWr7Ft8ZJTMilUA/hUzy5s64h6dPG6Le7O
         S57U5t+lUAosFA8pTwY0nyionLt+D0zftTcvb8IQB1jydzvjsum2Pak5rye5GdmvIumc
         ZbXxHXJSbh/Uo5nn62tHTDZFdFK22l1AnF6pJvIm5Gu2XA9/WNjZQQw463Aaldfrypdb
         0n8dTpSR7VsLDhAX0Dml5dOzcE52dK0KtIZts34s+sTkemY9d5bKoSeCbIeDvj6bic91
         yA3uSpl9T3a7PFlfIh5dGydobTFV81EV4VZ2SMeSwhCbTjUVymtZ5wuKl8LvATUywCjW
         YsXA==
X-Gm-Message-State: ACrzQf0I5bBBAQ9+v1xxVr2sex/Q03gJClf9/euTbn++fw3mnc0kq0kD
	Qs0aXrnEwOeuGL3ssB0BvdpogA==
X-Google-Smtp-Source: AMsMyM4YG0BwIDup3w8JQwlB0GXuUGwi3A9Ea2k/zd4CptpmUQB4VHq9/eJF7KAF8SVPfN/yl9PJiQ==
X-Received: by 2002:a05:6512:3f8b:b0:492:d1ed:5587 with SMTP id x11-20020a0565123f8b00b00492d1ed5587mr9337981lfa.355.1664196903928;
        Mon, 26 Sep 2022 05:55:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 9-20020ac25f09000000b00499f9ba6af0sm2523856lfq.207.2022.09.26.05.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 05:55:02 -0700 (PDT)
Message-ID: <0a6d3d14-33f0-92d2-b42f-e4d336c8cd91@linaro.org>
Date: Mon, 26 Sep 2022 14:55:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] dt-bindings: phy: Add compatible for Mediatek MT8188
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: xinlei.lee@mediatek.com, chunfeng.yun@mediatek.com, kishon@ti.com,
 vkoul@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1664183509-29473-1-git-send-email-xinlei.lee@mediatek.com>
 <c5ee2888-dabf-e3a6-acca-517ede984002@linaro.org>
In-Reply-To: <c5ee2888-dabf-e3a6-acca-517ede984002@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_055508_115082_D36D8D67 
X-CRM114-Status: GOOD (  11.56  )
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

On 26/09/2022 11:23, Krzysztof Kozlowski wrote:
> On 26/09/2022 11:11, xinlei.lee@mediatek.com wrote:
>> From: xinlei lee <xinlei.lee@mediatek.com>
>>
>> Add dt-binding documentation of dsi-phy for MediaTek MT8188 SoC.
>>
>> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540
> 
> If a tag was not added on purpose, please state why and what changed.
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


As pointed out in other discussion - these bindings might not be
correct. Please post DTS, so we can validate them.

Best regards,
Krzysztof


