Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBCBECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hq/wXphQ4CQCWqFQUckeg7mpeUY2opCgFidU5GlYS/M=; b=3WKTqf0THCPGj+0LcqWwS1GuAx
	CwnfNmyY5vQ0DEV1HMy1x+/V4RVhrwDoKVqvQK13jnZeEazPFcjGV8Xd3uR16Q3k0+O6k5Z1jlIH6
	nvF0jf5C6a7L4u2rhVOCUvg4MCes7Gzl8e7Ka5mQgQoUV93ZWK4o+u3uKA6Q5l1vCUqHDhHGBXYux
	8apHUVdVmoyWXNdS/8LIPtvZ4L32dRUytN4KxmHQ8EBhoyZeGZ137C8Q0o2Ox5yMr7A94MdAPrkWO
	sIajWl2YIKbGrJrAmTFxKdTwr7vRWlLXSlIZOF5JjfmkP7YUDlvzqk/uqIMd/JZM5K066C59Y2mrm
	DCm/57VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThTB-00B2dp-3t; Thu, 01 Sep 2022 10:30:45 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThT1-00B2a7-Np
	for linux-mediatek@lists.infradead.org; Thu, 01 Sep 2022 10:30:37 +0000
Received: by mail-lj1-x22c.google.com with SMTP id s15so12265356ljp.5
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Sep 2022 03:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Hq/wXphQ4CQCWqFQUckeg7mpeUY2opCgFidU5GlYS/M=;
        b=wMrHD5kd1sjRAGwDOMxCLd5TmCSprc0l8Nf3sWx1dXuMRw6mfEP63hWBtvHNhJ801W
         QEkV7vymXEa/aXbYqGX4R5yiFQnl8uzfQEIiMjxXJxpx8itKZweitlkO/FPuZmia0adE
         M6WddBo1NBOeeg5/1y/DaNd3wmc3E/n8vDRwKSngkHvNCgF5wx2WcPhrlyIoBIJtnDOC
         DWPdhzxfLoAUMhVxP5tYYJk6X9aNydarTKdgb5IBaD2c6MQAxCPQWDlMkv2YMw6j0jj3
         N/UvpNU9lhbiLUy9Hr6JHYnM5DzYIpAwh8rG0p8VNvFxLcn+dEak3SolRfU50q23CH6t
         W37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Hq/wXphQ4CQCWqFQUckeg7mpeUY2opCgFidU5GlYS/M=;
        b=b6M5V6TpZUMopf0ryuf6JewGsKu49vHGik/XnvG2Qkv0kmxez1W37GWcE9Yi6tCkIq
         IGCa6qaw74cP66B1G1yq5W5KQh2I1+a7xqOMCPjyoq9gBO2bn/2LsaARpudsq0a54Mey
         x6XN3cF+yEQqF2vmQi8wRxYyiwAoRWYg95yQgx09AK058Co3fBFfKNbZcUSKoHUcWtcg
         MG2pUtBf6qnIY4KuH+/WYFXdz4xYrwL6AEml9bt0g/Z0o1GFLe/ZDnEURyiJoWw3OYNB
         QjI1rvA0rUY5Lh8um6XWXhDxYkSxN4zOigxl6cOmS4Ta5Hpa6QyV22SbgHaDVQLEyL8i
         YeJQ==
X-Gm-Message-State: ACgBeo2UgmHqIp7+tAHT39uzGB4tzq2SF6KQHaxjU7DDyhN2jwRhUppf
	lrIhXA1gW1rKD1/kCbPr69WHQQ==
X-Google-Smtp-Source: AA6agR6rVg//wgHti5p5gLXR9YIZj3y2n/9kU9errMO9J/QeGYwVMsfd2wxCYlqzONqcnaXPvhV2VA==
X-Received: by 2002:a2e:9018:0:b0:266:6871:cdc1 with SMTP id h24-20020a2e9018000000b002666871cdc1mr4524850ljg.244.1662028232455;
        Thu, 01 Sep 2022 03:30:32 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id 8-20020ac25f48000000b00492f84befffsm1567689lfz.192.2022.09.01.03.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 03:30:31 -0700 (PDT)
Message-ID: <93d5de8e-31b2-4412-3348-7ba1903cde84@linaro.org>
Date: Thu, 1 Sep 2022 13:30:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
 <20220831124850.7748-3-johnson.wang@mediatek.com>
 <b1296c37-5283-81f7-1939-7ea20e1f4d0d@linaro.org>
 <1fae0c47-fff9-89e9-c849-536d167d741d@collabora.com>
 <38910de5-89ad-e7a1-261f-18b51c8e7877@linaro.org>
 <955f7200-9d08-0d21-2d1a-5ccbd0f3a8af@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <955f7200-9d08-0d21-2d1a-5ccbd0f3a8af@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_033035_788585_1DE1FA05 
X-CRM114-Status: GOOD (  10.85  )
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

On 01/09/2022 13:22, AngeloGioacchino Del Regno wrote:
>> That's simply not a proper
>> hardware description, so again:
>>
>> 1. If this is separate device (as you indicated), then it needs
>> expressing the dependencies and uses of other device resources.
> 
> Agreed. In this case, what about...
> 
> mediatek,hopping-ssc-percents = <&provider CLK_SOMEPLL 3>;
> 
> or would it be better to specify the clocks in a separated property?
> 
> clocks = <&provider CLK_SOMEPLL>, <&provider CLK_SOME_OTHER_PLL>;
> mediatek,hopping-ssc-percents = <3>, <5>;
> 

I propose the last one - using standard clocks property and a matching
table.

Best regards,
Krzysztof

