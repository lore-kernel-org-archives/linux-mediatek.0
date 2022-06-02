Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F05C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 06:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRiykJj2PiibOGmN1Gz3l4jjFysQxcpjjKEX3bHo5n4=; b=G3xCQ2UECQsJY8
	h8UAJE8Ym3pDW0TID/9JFg3M2yQeJZbXhiLYwTI0LD6K7BV9YkkvjcxDScf79xy2njvki0lxiUugp
	4GxrXDlHybetVDwsbrTaFMVaAaW94hxj4WJfN1+fI+nRDAjGU+aY0piLaHC2iuBv2N1brKmWVDh7L
	fJzfI/z0nre1JjgaZauGxTxE2T45ltDM4hNg4nQgwLWq0kqV7KlJa3REDQ3gmswWNLkh3gB7Mv3AV
	N30KmRA2EXfFMnKLsrQkMuSXjzRnXIpc79fWS+fzh8lgtAB3bbNOlzhW6es13pqWbmWT4TT81tyDe
	NaEB3LxOdc04yKKBLzmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwelR-001vCn-IU; Thu, 02 Jun 2022 06:57:01 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwelE-001v6t-Dv
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 06:56:50 +0000
Received: by mail-ed1-x534.google.com with SMTP id v19so5042583edd.4
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 23:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LLNT8sk8dg3VHgneMHOABUvZlztHfMnZmFwZtkukw1U=;
        b=eLk3Bz/WOkMAC5yq5sJ5oMDUivEuokRtM1ySrtMWvKp4Y4BziELJT2taA3PP2bm8qP
         UeMVFSoOT2Lt0CYHMve/e6VXkxGETxONlpWqtrhx3Wa5lK+5FjyM02d9aCc86zRkiebT
         JrxjbIy2gXE2FG3QsMt+FcOYCB4ZcTH8cqgu0cEFlQ2NWz0DXQEp6JdGDrlnB0ryNfrS
         A3dma775dm5cMh8pzel72tFzw8NfIFcnvhMRqv1YYnGmEZ2ZZyrjxOytVeNmG/5I3jyp
         6v5M28Cp2+zZKNspCKqrvZ94YSSKgt8grtqEusmCea4sBx0n7ZcRzMBDbnXAV8cmR3tC
         y4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LLNT8sk8dg3VHgneMHOABUvZlztHfMnZmFwZtkukw1U=;
        b=inh8VNAHTddBBf4mKumX+3VRde9rDjuOHXHCjrVGinaNZOXPcIxAc1Eoj5ygx9fhKN
         6Cgt+LttpJKRwZcHWAi9eeg2TQ4uqWhj+LFb+D8xXau4zSUllYhClSLQk3OMMeSwoT6W
         JsGUA7zaqi+slhpUPmjMmZhZ12jNM0ItcnvkTtLauJFWqtX04D94UAymNnlZ5twW4vXa
         s73XwxFEeDARnlhYr24uWI3JlEem9YHYpd5O0W3rNyfsxf6VMnvltq+FuOKdhPmFncZo
         s/L2kg8OAfkKXQSz+xsvRr3J7waFpNhoiXEg6T98U0dQ0jEQz2SBw5OGNFdtVP4/inmz
         RqSA==
X-Gm-Message-State: AOAM530hhjRbrqrXeOPsvgSBVv8lAQ3Pda8/5JCUiYWrRIoVuz/EGkPi
	xWrxpGmUaXd72VMMCXPmLPIFmg==
X-Google-Smtp-Source: ABdhPJz1+2mpXym1k+JMKKxXiiS02WGQewk31DYid61d9z9HfjfO/qToqCsEwoJ0N1oEfO62KTycQg==
X-Received: by 2002:aa7:d1ce:0:b0:42d:cf0e:3389 with SMTP id g14-20020aa7d1ce000000b0042dcf0e3389mr3731445edp.4.1654153007050;
        Wed, 01 Jun 2022 23:56:47 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d10-20020a1709063cea00b006f3ef214e5bsm1428551ejh.193.2022.06.01.23.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 23:56:46 -0700 (PDT)
Message-ID: <be7c0ff9-e931-5a34-dfa3-f44071de71b1@linaro.org>
Date: Thu, 2 Jun 2022 08:56:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 00/15] Add support for MT8195 SCP 2nd core
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Daisuke Nojiri <dnojiri@chromium.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 "Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Prashant Malani <pmalani@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Brian Norris <briannorris@chromium.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 Project_Global_Chrome_Upstream_Group@mediatek.com, weishunc@google.com
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
 <919ca8ee-4b01-e601-714c-26098647d5c7@linaro.org>
 <016eb93f0bee329c061725cb5096d49ab4240152.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <016eb93f0bee329c061725cb5096d49ab4240152.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_235648_531424_A88F78CB 
X-CRM114-Status: GOOD (  15.01  )
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

On 02/06/2022 05:52, Tinghan Shen wrote:
> Hi Krzysztof,
>  
> On Wed, 2022-06-01 at 13:46 +0200, Krzysztof Kozlowski wrote:
>> On 01/06/2022 13:21, Tinghan Shen wrote:
>>> The MT8195 System Companion Processor(SCP) is a dual-core RISC-V MCU.
>>> Current mediatek remoteproc driver only supports bring-up single core 
>>> SCP or the 1st core of a dual-core SCP. This series support to bring-up 
>>
>>       ^^ this or is confusing a bit.
>>
>> Does this mean that MT8195 has three RISC-V MCUs?
> 
> My intention is to express that current SCP driver supports bring-up,
> 1. the single core SCP, e.g. MT8183
> 2. the 1st core of dual-core SCP, e.g. MT8195
> 
> 
> Perhaps rewriting as follows is preferable?
> 
> "The mediatek remoteproc driver currently only allows bringing up a single 
> core SCP. It only supports bringing up the 1st core in SoCs with a dual-core SCP."
>>

Yes, that sounds better. Or mention that single core case is for MT8183,
because that part got me confused.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
