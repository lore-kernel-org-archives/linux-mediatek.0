Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C21C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 07:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UONqjAEuJjhC3sbsmW+7wznA4wvlrTgDjlureYEjts=; b=JHXP9Jwgfle94N
	zyzrJ8bnwQ+WQvO8FexDIXNcp8vfboLovvU3N71VsgeZ/G5ZONeyAKweHP6ws5zQSc1RfYMDnHDZW
	9mJpBsFzMNX3mJZJQXe6Zu+ef72hhuzSeO0eiQW6dE6OWj/ZWKxmhsxApiuefDxXMpRy74qqc5igi
	7RnS5juOpH8B201Heg0/usEDeJdmttDMhMDA+540Rd3TO6ZJEXoEDj88Kk0AI5pKduI6oW+YSrJZf
	sYn/FwiI2D9ghtHGowPpEbzTWbzq0oPrhOvdAKCf2Ut9gnJRZhab5aBlHp/MisoL+HQ2agtUkbnoi
	iKdmCoaa5bSB7aytl1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nitOS-008eUy-6J; Mon, 25 Apr 2022 07:44:24 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nitOO-008eTR-Ny
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 07:44:22 +0000
Received: by mail-ej1-x62f.google.com with SMTP id g6so5107196ejw.1
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JrB/10he0HIKz2yInIofsfwUiiztggNtOXcFd7ZGrD0=;
 b=OBrFTxv635LOhGPjF3X6CPjip+yymQeU5gF8ljhVhywlkvsqwhW8zpJCHCp50x3M3q
 3fcHDrCJGFAelmEg3FkmZ6Kpj9nDlzNL/JctxHzUIG9y4zw6n/QwpfB4yInFvh89Gt09
 9WdbxFmC2UO5spstHKk1KhULhkZ4qbSlnwEH2G0k9GaQzLXGH+wRMKr+G0cUk4ZzdScQ
 xn4XnDkd+vElRgO3K64rlgpLI1651EPzrr9Xi5CCUalhTRmagO0p4z+klh1/5F/teacN
 fIzMrr/I0ds5T2pHalka9BL0k0valG+CvxKICjKZPcoz3vYTtmEipeHeAx7yvz6LFkoB
 CWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JrB/10he0HIKz2yInIofsfwUiiztggNtOXcFd7ZGrD0=;
 b=aESNvhJ+FCCrx4W3Ecf6UcvatW+Y/3siRVKxZA80b9vpz9jbO5cGqVWtsn+jZB/7kE
 PxhCquBWzxiXrjmWmfTqjkREGmYZqrPoOsOJ4yP+ZNEscwbE5O342SzDPCOAOjxntuIM
 GbjJ91Eg8g0cjFMb5s2BXdDRm+wmgH1AfZFfvfbUAmDF+NOyvFbyi6l3KXEvBhZ3wswb
 fQw9IN6TFm7aC4sUEjNCu/jzdjrUtX5nhzjF0BuPV+uwipg22bAyOTmgPs1bQ6gbMj+L
 yZr28KVWv8d42v5V9ztC7OViXHdOqRIKcQkqeojEOL6baypyDpCnj6d2TZAZ7Yj3FP16
 DgWA==
X-Gm-Message-State: AOAM531qIAmE2fasvIJjzKAoP7SJN2uzSYttLiOvfxphynB4Hu+sx0Ib
 kCzCfXsXjyOoUOrKU89qK+wWBA==
X-Google-Smtp-Source: ABdhPJzoR8hWi0TTFKaza0g6P3fEa1fH1Mej3RlmPEr6AHXq6uPtjaZB/MhB1Brgqh+O4Ux9WzfRUw==
X-Received: by 2002:a17:907:6d87:b0:6f0:1e1d:dfb1 with SMTP id
 sb7-20020a1709076d8700b006f01e1ddfb1mr14994362ejc.678.1650872657709; 
 Mon, 25 Apr 2022 00:44:17 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 b25-20020a056402139900b0041904036ab1sm4237897edv.5.2022.04.25.00.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 00:44:17 -0700 (PDT)
Message-ID: <64411bc7-ce4d-9f85-be8f-c93d6b2a0360@linaro.org>
Date: Mon, 25 Apr 2022 09:44:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 11/17] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8192-sys-clock
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Q2h1bi1KaWUgQ2hlbiAo6Zmz5rWa5qGAKQ==?=
 <Chun-Jie.Chen@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>,
 =?UTF-8?B?UnVueWFuZyBDaGVuICjpmYjmtqbmtIsp?= <Runyang.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-12-rex-bc.chen@mediatek.com>
 <288f55f3-b3ed-32b8-9a44-652f3d53617d@linaro.org>
 <fdedea6f20738bfe2ede7e526aa653af1ac35768.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fdedea6f20738bfe2ede7e526aa653af1ac35768.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_004420_832039_2420A841 
X-CRM114-Status: GOOD (  17.54  )
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

On 25/04/2022 04:37, Rex-BC Chen wrote:
>>> +  '#reset-cells':
>>> +    maximum: 2
>>
>> Why this is a maximum? Usually this is const, so how do you use it
>> (with
>> what values)?
>>
> We need to let the driver compatible with previous setting in
> drivers/clk/mediatek/reset.c

Then it should be enum [1, 2], because '0' is not valid.

> There are two use cases in our reset driver:
> (Refer to [1])
> 
> 1. #reset-cells = <1>
>    When we input the argument, the older driver
> use is to calculate  
>    bank and bit by different method. From the implementation of
>    reset_xlate(), we can see if the argument number is 1, it will
>    return directly.

I understand this is an old binding with older compatibles, so this
should be restricted per each variant (allOf:if:then)... but wait, old
binding did not allow any reset-cells! You add an entirely new binding
property and already want to support some older (deprecated?) way.

> 
> 2. #reset-cells = <2>
>    The input arguments is offset and bit. When we input two arguments,
>    we can use reset_xlate() to calculate the corresponding id to assert
>    and deassert.
> 
> [1]:
> https://lore.kernel.org/all/20220422060152.13534-10-rex-bc.chen@mediatek.com/
> 
> If it's acceptable, I will add this in commit message.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
