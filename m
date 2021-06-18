Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2992C48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 13:51:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5735B610EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 13:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5735B610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=M8fNpBpdCXTTtwa0vnBthvakJfAp3ARG/D5LhBnpilU=; b=B7W9pYyG98IKSr/P96EHlORyJb
	PNqwV5s6AWXoex6k1oOMqjSBkajJIQ+JHmQN/G+x+8dliKw9l0q+zrLdUdBk/gx+hSOHlDx0x3qp6
	FhBwYacXgaLv6XJSHI9kdaknw+AIJtOYOQg8iMlMuV9Np8IZASbaLva1IROfD3aaBPla5wjH+hiD7
	XHyPHXlCzOROKmf4Km5lups8JWHUDW921mvUECQwIiulKjECIEwXvZODat/582y0k+69N34SUTPmA
	aEwboJZtbKQXGyIYINuahspC9wJ+Kj9uxe3msAE08QrDAYJlhr6V1ZO46frsWxd/w0O48sQhiTRhC
	f9uyrkZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luEtg-00EM9n-Pe; Fri, 18 Jun 2021 13:51:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luEte-00EM8U-M4; Fri, 18 Jun 2021 13:51:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so5826134wmq.5; 
 Fri, 18 Jun 2021 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dtovv/K8yfnYJqOxDgzB30UQELk3d/5XWOox6hnEDLs=;
 b=OANY3fHjjNRTHesTx7eEJ2yCXhvqLh87yoeuA9tuGDeMyIjcYjWrwKohJdhcIMSotC
 ntV80jttyIgF+UPVSR2Kj/6KjCNVDtbA6ewIsYpKwYxG+WwRFNUy+dnIwwKTnwYlZpXL
 /0N5bPyINXIrCWRjeG7ww8E0XSCtm5ySomovkrZfLgv1KYM0N0F/FfJbh+e9DkQ+yZky
 B32TSuhbVQXm22LVvvpLVPN9lhyZ6sdDC2aALH72ZpPOXRUG2+lTA+mX8el4YyZtTO21
 iT6JNAkv82bf7AF/pzsvSAg0XKtJeJfAHkz4EEKEHRihT8ImRLwIVAKpi5ptk+p11Nbm
 PU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dtovv/K8yfnYJqOxDgzB30UQELk3d/5XWOox6hnEDLs=;
 b=OefAtAaS/vkefkomRf+ibUcLMZP20dxf/2lN42LKYqjWs80kP4OcSRI9C7tdyX+hJ0
 Kpew/4HQDlWQgnUO4LPc9zF3EHfbrKzJHiHUWPH3zNhQYm1h8TdSUmrWN/7zacB1vOYc
 Qxp//031x2uRmlPe8fVC9ATgRsAxTOqUytA3RIAgBQG3EM3IHDE16xnuStTLPVEtPcWq
 ZHpXNTwBPzYW2sxDCn/Ye3zWuT9gkAubifsYpCN3GPnu0+HD6l47NHJsZYItaaivFYKN
 a0XaWwT1ht9zmkR6GqE6tW/K6g89ag5QAFLDC5sUAirRSIyVfNti5q/+FvN3wRaPHSnA
 jukQ==
X-Gm-Message-State: AOAM533w6R8fvVOTwPYVkWq4oGVVsL99OVT1JnOgPvYBugroq7FD0k2l
 jqa39/b35EO7uuUuMLcptU0=
X-Google-Smtp-Source: ABdhPJzZl84wUFGxHgDS72TiTUz7fnPfBKmWjvV/GpBzDDa8v0y6BvkqlGsDIMkcKmEOni1iHfohBA==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr11678131wmc.71.1624024254592; 
 Fri, 18 Jun 2021 06:50:54 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id l9sm7753655wme.21.2021.06.18.06.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 06:50:54 -0700 (PDT)
Subject: Re: [PATCH v9 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of imp i2c wrapper controller
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>, Rob Herring
 <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-2-chun-jie.chen@mediatek.com>
 <20210602171201.GA3566462@robh.at.kernel.org>
 <66e017401ab93aa02c5d2bbf11be9589b36649ac.camel@mediatek.com>
 <1f59ed31-4a0e-9719-bf84-1fe4cdd6c57d@gmail.com>
 <162334689784.9598.2709970788186333494@swboyd.mtv.corp.google.com>
 <de082c64-ace3-30b5-7404-1f4b607a83e1@gmail.com>
 <c8e8535cef67adeaefcfe943bbd8287806921e03.camel@mediatek.com>
 <CAGXv+5HcV6jbyDdZGzRX-2NHMztSONBKxmLxLQX6k+aQrwJ1ww@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <5c0a88c7-7f64-fd00-4e0c-2b3163926f71@gmail.com>
Date: Fri, 18 Jun 2021 15:50:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAGXv+5HcV6jbyDdZGzRX-2NHMztSONBKxmLxLQX6k+aQrwJ1ww@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_065058_799444_0203A3CE 
X-CRM114-Status: GOOD (  30.10  )
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



On 18/06/2021 08:32, Chen-Yu Tsai wrote:
> On Wed, Jun 16, 2021 at 2:34 AM Chun-Jie Chen
> <chun-jie.chen@mediatek.com> wrote:
>>
>> On Fri, 2021-06-11 at 11:56 +0200, Matthias Brugger wrote:
>>>
>>> On 10/06/2021 19:41, Stephen Boyd wrote:
>>>> Quoting Matthias Brugger (2021-06-08 07:45:49)
>>>>>
>>>>>
>>>>> On 07/06/2021 07:20, Chun-Jie Chen wrote:
>>>>>> On Wed, 2021-06-02 at 12:12 -0500, Rob Herring wrote:
>>>>>>>> +
>>>>>>>> +description:
>>>>>>>> +  The Mediatek imp i2c wrapper controller provides
>>>>>>>> functional
>>>>>>>> configurations and clocks to the system.
>>>>>>>> +
>>>>>>>> +properties:
>>>>>>>> +  compatible:
>>>>>>>> +    items:
>>>>>>>> +      - enum:
>>>>>>>> +          - mediatek,mt8192-imp_iic_wrap_c
>>>>>>>> +          - mediatek,mt8192-imp_iic_wrap_e
>>>>>>>> +          - mediatek,mt8192-imp_iic_wrap_s
>>>>>>>> +          - mediatek,mt8192-imp_iic_wrap_ws
>>>>>>>> +          - mediatek,mt8192-imp_iic_wrap_w
>>>>>>>> +          - mediatek,mt8192-imp_iic_wrap_n
>>>>>>>
>>>>>>> Looks to me like these are all the same h/w, but just have
>>>>>>> differing
>>>>>>> sets of clocks. That's not really a reason to have different
>>>>>>> compatibles.
>>>>>>>
>>>>>>> If you need to know what clocks are present, you can walk the
>>>>>>> DT for
>>>>>>> all 'clocks' properties matching this clock controller
>>>>>>> instance. Or
>>>>>>> use
>>>>>>> 'clock-indices' to define which ones are present.
>>>>
>>>> Is the idea to use clock-indices and then list all the clock ids in
>>>> there and match them up at driver probe time to register the clocks
>>>> provided by the IO region? Feels like we'll do a lot of parsing at
>>>> each
>>>> boot to match up structures and register clks with the clk
>>>> framework.
>>>>
>>>> If it's like other SoCs then the clk id maps to a hard macro for a
>>>> type
>>>> of clk, and those hard macros have been glued together with other
>>>> clks
>>>> and then partitioned into different IO regions to make up a clock
>>>> controller. Or maybe in this case, those clk hard macros have been
>>>> scattered into each IP block like SPI, i2c, uart, etc. so that the
>>>> clock
>>>> controller doesn't really exist and merely the gates and rate
>>>> control
>>>> (mux/divider) for the clk that's clocking some particular IP block
>>>> all
>>>> live inside the IP wrapper. If it's this case then I hope there are
>>>> a
>>>> bunch of PLLs that are fixed rate so that the i2c clk doesn't have
>>>> to go
>>>> outside the wrapper to change frequency (of which there should be
>>>> two
>>>> "standard" frequencies anyway).
>>>>
>>>>>>>
>>>>>>> Rob
>>>>>>
>>>>>> Some module is divided to sub-modules which are designed in
>>>>>> different
>>>>>> h/w blocks for different usage, and if we want to use the same
>>>>>> compatible to present these h/w blocks, we need to move the
>>>>>> clock data
>>>>>> provided by these h/w blocks to dts, but we usually use
>>>>>> different
>>>>>> compatible to get the h/w blocks data in
>>>>>> Mediatek's clock driver, so do you suggest to register clock
>>>>>> provided
>>>>>> by different h/w blocks using same compatible?
>>>>>>
>>>>>
>>>>> The mapping of them is as following:
>>>>> imp_iic_wrap_c:  11007000
>>>>> imp_iic_wrap_e:  11cb1000
>>>>> imp_iic_wrap_s:  11d03000
>>>>> imp_iic_wrap_ws: 11d23000
>>>>> imp_iic_wrap_w:  11e01000
>>>>> imp_iic_wrap_n:  11f02000
>>>>>
>>>>
>>>> Sure. What is their purpose though? Are they simply a bunch of
>>>> different
>>>> i2c clks?
>>>>
>>>
>>> That would be need to be answered by MediaTek as I don't have access
>>> to any
>>> documentation.
>>>
>>> Regards,
>>> Matthias
>>
>> We describe which clock controllers are exist in dts and
>> get the clock data provided by clock controller in driver data
>> by matching device compatible.
>>
>> The clock data contains several clocks which includes the clock index,
>> parent clock source and the details of reg control inside the IP block
>> of clock controller.
>>
>> In MT8192 platform, some IP block is divide to several sub-blocks and
>> each sub-block provides clock control by itself.
> 
> Some more information:
> 
> Based on what I read in the datasheets, I'm guessing that MediaTek groups
> the I2C controllers into several groups and places them in different parts
> of the die. The suffix of imp_iic_wrap_XXX is likely pointing to the
> placement of the group. And the imp_iic_wrap_XXX is what the name suggests
> a wrapper around the group of I2C controllers. The wrapper contains clock
> and reset controls, as well as other things that I can't make out.
> 

Thanks for the clarification. If the wrapper contains more then just clocks,
then probably we will need a solution as done by MMSYS subsystem. Would be good
if you could work with MediaTek to find out what exactly this wrappers contain,
to get a better picture of if we need an additional driver or not.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
