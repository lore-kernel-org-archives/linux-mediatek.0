Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7672C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUAnBlFRSGBlwXwSQXAqm7P10EiEl+48o/NRTbPOIwI=; b=XBQi8PP5mAQ0cp159vs44WlfEM
	NKMuvms96TLMnG1oUAZ+uIHHiSzu7WvSYz3uC+989fO4fRLdD8HYFIAynBpoHTcOCnsNrTZkt1qHp
	F+LSeBt8ZXcKezZXxz9nWVGvShpPMA0Pp2kXWEYpwVT5y5QbrLdcW6Af4Xhw/lPH/WjUYhRjmi5HG
	qMZRdvgQ+be0kW3dMiyw6hIK8GEk7ks3G/InvvPjb8TQnx2QiC9o1beWQ63cbZ8wmditfYaPUu6nS
	93ZWAfLFFv70RNLOeKuVYCAAAPc6M4I2hm+pcpE7XVMfy6f+yqFNAkOfivxgz6KBncQy5WvyUuuup
	2f9sepzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn0RL-006m4F-1o;
	Thu, 13 Apr 2023 17:08:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn0RH-006m1N-1t;
	Thu, 13 Apr 2023 17:08:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id g5so18295257wrb.5;
        Thu, 13 Apr 2023 10:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681405727; x=1683997727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vUAnBlFRSGBlwXwSQXAqm7P10EiEl+48o/NRTbPOIwI=;
        b=HWYW8/RVFPxSHRWBcro0ZM0vclYoDzFo9NEifLGdrjORDSE6iDq9AwFwfenSd8GxEt
         rfRXewl/Bk7aKC89XahV+cxJJK05ZfxJY1Dp8BnrMhAPCHXF7I83wXYNTPf2jfmZmVT1
         GkUe8G3rSbx0xGKbSHUu3PI5f7NRRPzrcgUIA30sxCAzFKjb+37KblE4FEkktfMna2ja
         nSI5tXZ/8XawREqOXVtRL81+F26lOMjqD1toA7oWuaBseU9a4dPlQTCmVx9ETv2rL7ub
         EGOqzjQXE46D1peydsH0koKhuHs41ofPDUSD1Z7SIUAqvdyYrS5UTWfMYAfDE7RlNSCW
         632w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681405727; x=1683997727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUAnBlFRSGBlwXwSQXAqm7P10EiEl+48o/NRTbPOIwI=;
        b=gwcB0CujlPr8SdP1X4zJ8sZzqTq0hYr2M6IRurF9gwTCTsv+Y+ad7DLDnARFTfUIwh
         0kuZDkwm6qE3PWg7r5ox+gyL3mIL0mPMyMTIt9smqPQloJqWjV+ruaMf8DN7Av9BzL9J
         /kMwIJlVHOZs+3SHuZRVSBOK7JcdJgjE5jujXjx2zX4t07mrB5zd90Cw3rJdvWCaERsK
         ZSayliBuYG+ictJ5zZEM3GOUP+PtyBWsC0PaR3ycnWTFGbDJU+Mh6vceu+pHpAsStfZ9
         3N+lIKlv/KyLykB6dN1AHiqK0jXaujtOLyLMffL94aLs8iSOewokiq930T7URtf1kYhk
         tJhQ==
X-Gm-Message-State: AAQBX9c4ZZwnnOe1eKg9v5rPH/CgNwX/R/bJL8s8943APDiN2m7nmMuz
	YlgBfNAvs+V6wz2NYd+yx7I=
X-Google-Smtp-Source: AKy350arxfCCpaVx1w4hHZM1E1HpJLjfl+cRZdLDdeSnQNukXu4TUaQgzkTfOoR3xnpv2XCmUfu/vg==
X-Received: by 2002:a5d:63c4:0:b0:2ef:f9d:6adf with SMTP id c4-20020a5d63c4000000b002ef0f9d6adfmr2154403wrw.35.1681405726957;
        Thu, 13 Apr 2023 10:08:46 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
        by smtp.gmail.com with ESMTPSA id u8-20020a5d6ac8000000b002eaac3a9beesm1700208wrw.8.2023.04.13.10.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 10:08:45 -0700 (PDT)
Message-ID: <5c1d69c8-d973-fa7b-1f14-c72729ff5594@gmail.com>
Date: Thu, 13 Apr 2023 19:08:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 3/6] soc: mediatek: virt: geniezone: Introduce
 GenieZone hypervisor support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jades Shih <jades.shih@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>,
 My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
 PeiLun Suei <peilun.suei@mediatek.com>, Ze-Yu Wang
 <ze-yu.wang@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>
References: <20230413090735.4182-1-yi-de.wu@mediatek.com>
 <20230413090735.4182-4-yi-de.wu@mediatek.com>
 <1aa701cc-92ca-71be-0663-df4bfae66c2f@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1aa701cc-92ca-71be-0663-df4bfae66c2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_100851_628238_8751ACF7 
X-CRM114-Status: GOOD (  14.50  )
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



On 13/04/2023 14:55, Krzysztof Kozlowski wrote:
> On 13/04/2023 11:07, Yi-De Wu wrote:
>> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
>>
>> GenieZone is MediaTek proprietary hypervisor solution, and it is running
>> in EL2 stand alone as a type-I hypervisor. This patch exports a set of
>> ioctl interfaces for userspace VMM (e.g., crosvm) to operate guest VMs
>> lifecycle (creation, running, and destroy) on GenieZone.
>>
>> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
>> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
>> ---
>>   arch/arm64/include/uapi/asm/gzvm_arch.h       |  79 ++++
>>   drivers/soc/mediatek/Kconfig                  |   2 +
>>   drivers/soc/mediatek/Makefile                 |   1 +
>>   drivers/soc/mediatek/virt/geniezone/Kconfig   |  17 +
> 
> Hypervisor drivers do not go to soc. Stop shoving there everything from
> your downstream. Find appropriate directory, e.g. maybe drivers/virt.

Acked, what is the reason you want to add this to drivers/soc instead of 
drivers/virt?

Regards,
Matthias

> See:
> https://lore.kernel.org/all/20230304010632.2127470-1-quic_eberman@quicinc.com/
> 
> You should follow that discussion as well and be sure that all concerns
> raised for Gunyah are solved also here.
> 
> Best regards,
> Krzysztof
> 

