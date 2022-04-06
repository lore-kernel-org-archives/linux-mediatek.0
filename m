Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A933C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3fNquaBS9yteqH79iAu0bJI9/F0uYMgQ+/7OxtjsXY=; b=XL9nvV81MzoUvU
	rzuFre3WVqa2We3X0DHT3JwCCdiRmeR/UIqqCajnwsIqRRUVCNRM5R5eMLiFD/f4NDKLnsk9EtaPK
	goUpWgRAfCRJ3DLUBk9nJ0JZG0vejC/k5tTqZLai3sMqxi6M9AedQz4ZM6MrmgQGE10ZfFxz+AkK+
	9jif5YZe3YFLQskbVYZpO+dMJgdbH15Q3eiZLiPATWqmdXBhv3V23TQXIiSPDtzw0Z8hfmM0pH0zb
	8+hMmkLDxRBYUARSXaluiE18+fs7rn7uD/aXAchj9+50AkRlKyfq9wbHFkQ65zVLVgfSIShsXG3U5
	hP5PY5ikIB0MI8hYMK6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc1UK-004s4C-10; Wed, 06 Apr 2022 08:58:04 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc1Th-004rdb-G3
 for linux-mediatek@lists.infradead.org; Wed, 06 Apr 2022 08:57:27 +0000
Received: by mail-ej1-x62b.google.com with SMTP id k23so2857933ejd.3
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Apr 2022 01:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7oGdqe4edvqr+iYfJInFHVmb7+U6NUbqblozp3XrpQg=;
 b=i+U889ubHp/vqD39N9mGHzSBxDkleyQwz/NKD0dqRtQCXOhQn3Be6msm33/4hP8WDQ
 z//23cjvUb+fkkceiSyT7T08AqIo5FDX3UurpydepsVA13l5Tghgh949AbE1vo/0vpMS
 MunVwbnQlqlray9rykp3K4cZu09MwZYvYgxR7ZLSaXY0RdRxmlrb94cBBclWn8AZLD+I
 GklRqWwbXTQebvLfyShnONpxJdDb4dEZplwAwS55peWNy77EAcMiCpeHmX5qK+U30fnQ
 MkpxHFM8PcP5yg0wFjXJWB4ONKi+TXcIZ6EE3CVbb9yyWs+LFbKmQMKadXfJWkgtGIiH
 2QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7oGdqe4edvqr+iYfJInFHVmb7+U6NUbqblozp3XrpQg=;
 b=xxOin2pgCr3S9ls0YRVPgb+ZB3QrH7BsS2EPwn/7iSf+zUXLOVK9TP3jclpbTixtL2
 6gvyBI9qeohXOaT6ZDhiCGxKDh6IW4UMS8xBFqa5+aMwgD1G3oiXn9mHEW5TijzbQ/g9
 QBdOI9jMX9umOntoHm85xWDorgzz19Pa8VCW3+Wj6GPQxGKZzQcfNTS0/NTjKxuo4CxT
 Xf9RxOHkNSmxp3Th9jlI6RmtJLxArxWTplk36/jYqKQhkm0f4gHr26xOCDnlXgm70U0m
 HLMJCijf3JGI30xzuHgunmeCui46NHGEtYYFlfJqKiReSXEBHvtF+Sv60VV9SiQXtkH3
 UNHQ==
X-Gm-Message-State: AOAM532qjvlb+Qhyil1DT12ncbJC2+Kw1nRypVwsvoreM6KSh7cIFK5Y
 N5eNVMmBeTRnXpb4ALgkGLWLWg==
X-Google-Smtp-Source: ABdhPJw2YtGOMiUak58GFk63SIktW16kDe4il6YrYPXGz8jzb5j689+r7WfODo7WQ8xkLk7+CqqeKg==
X-Received: by 2002:a17:906:698a:b0:6ce:b983:babf with SMTP id
 i10-20020a170906698a00b006ceb983babfmr7573228ejr.553.1649235442532; 
 Wed, 06 Apr 2022 01:57:22 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 c4-20020a170906340400b006d077e850b5sm6331152ejb.23.2022.04.06.01.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 01:57:22 -0700 (PDT)
Message-ID: <750c1f9e-6a53-16d5-390e-f9f81fa23afd@linaro.org>
Date: Wed, 6 Apr 2022 10:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 04/14] dt-bindings: arm: mediatek: document WED binding
 for MT7622
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, Arnd Bergmann <arnd@arndb.de>
Cc: Networking <netdev@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-5-nbd@nbd.name>
 <d0bffa9a-0ea6-0f59-06b2-7eef3c746de1@linaro.org>
 <e3ea7381-87e3-99e1-2277-80835ec42f15@nbd.name>
 <CAK8P3a1A6QYajv_HTw79HjiJ8CN6YPeKXc_X3ZFD83pdOqVTkQ@mail.gmail.com>
 <08883cf4-27b9-30bf-bd27-9391b763417c@nbd.name>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <08883cf4-27b9-30bf-bd27-9391b763417c@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_015725_588575_DDE1ECC5 
X-CRM114-Status: GOOD (  19.42  )
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

On 06/04/2022 10:32, Felix Fietkau wrote:
> On 06.04.22 10:29, Arnd Bergmann wrote:
>> On Wed, Apr 6, 2022 at 10:18 AM Felix Fietkau <nbd@nbd.name>
>> wrote:
>>> On 06.04.22 10:09, Krzysztof Kozlowski wrote:
>>>> On 05/04/2022 21:57, Felix Fietkau wrote:
>>>>> From: Lorenzo Bianconi <lorenzo@kernel.org>
>>>>> 
>>>>> Document the binding for the Wireless Ethernet Dispatch core
>>>>> on the MT7622 SoC, which is used for Ethernet->WLAN
>>>>> offloading Add related info in mediatek-net bindings.
>>>>> 
>>>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org> 
>>>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>>> 
>>>> Thank you for your patch. There is something to
>>>> discuss/improve.
>>>> 
>>>>> --- .../arm/mediatek/mediatek,mt7622-wed.yaml     | 50
>>>>> +++++++++++++++++++ 
>>>>> .../devicetree/bindings/net/mediatek-net.txt  |  2 + 2 files
>>>>> changed, 52 insertions(+) create mode 100644
>>>>> Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
>>>>
>>>>
>>>>> 
Don't store drivers in arm directory. See:
>>>> https://lore.kernel.org/linux-devicetree/YkJa1oLSEP8R4U6y@robh.at.kernel.org/
>>>>
>>>>
>>>> 
Isn't this a network offload engine? If yes, then probably it should be
>>>> in "net/".
>>> It's not a network offload engine by itself. It's a SoC component
>>> that connects to the offload engine and controls a MTK PCIe WLAN
>>> device, intercepting interrupts and DMA rings in order to be able
>>> to inject packets coming in from the offload engine. Do you think
>>> it still belongs in net, or maybe in soc instead?
>> 
>> I think it belongs into drivers/net/. Presumably this has some kind
>> of user interface to configure which packets are forwarded? I would
>> not want to maintain that in a SoC driver as this clearly needs to
>> communicate with both of the normal network devices in some form.
> The WLAN driver attaches to WED in order to deal with the intercepted
>  DMA rings, but other than that, WED itself has no user
> configuration. Offload is controlled by the PPE code in the ethernet
> driver (which is already upstream), and WED simply provides a
> destination port for PPE, which allows packets to flow to the
> wireless device.

Thanks for clarification. I still wonder about the missing drivers as I
responded to your second bindings:
https://lore.kernel.org/all/20220405195755.10817-1-nbd@nbd.name/T/#m6d108c644f0c05cd12c05e56abe2ef75760c6cef

Both of these compatibles - WED and PCIe - are not actually used. Now
everything is done inside your Ethernet driver which pokes WED and
PCIe-mirror address space via regmap/syscon.

Separate bindings might have sense if WED/PCIe mirror were ever
converted to real drivers.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
