Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB012C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 15:44:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AD7961154
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 15:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AD7961154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EjS34cpB3QaG2nQoriJMqRQBDQBEp/PkDWVVcXKgPyU=; b=S458IkcQCMliHLaXEjoLvBkgxV
	QD2EX3rESdP3Xka+qvuDDoM3oTfSfH3RmNM50//TpmXzUiMmiOCrWwUrnVcS9KVxhSGSlEIm57cVW
	w9DsgNYZW37DMPjS0RClCgZzJOeWi5qVGrjlX0mdPZMtS9DIZUN710E27/XjzHeifbt+7y7g3l6oM
	7YPE6XNa9HBSpqPv4UzwtppmLm1hJK4rhRjLd4mp7QX6pYkOnbZ8mCa7APgVdk2vD8FwCBJhh4Mp2
	S61OHReHa0Hiamu4wdNrzlmsrBfCi4oss97VyTJ8X5dfn47VR9r6DrCKuVfbi6f3qLj31UKg4eJBX
	LvvoQIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBfY7-00A6id-Qa; Thu, 05 Aug 2021 15:44:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBfY5-00A6hO-0a; Thu, 05 Aug 2021 15:44:46 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h13so7180665wrp.1;
 Thu, 05 Aug 2021 08:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YBz32Zc1hS/Utm9NDrz5XfahFXSnSf4FuPBsWrfn/uI=;
 b=dRF1c9/iNO/iVAApPWP7U5HVVhiv2M/PKerE0/OipM5SjXj9f0T7MXkcxNt5JK91eZ
 1G6954Dft7l/4YukvC6uzB0Yv3bP5+KOZ9rsfz1Kg26TW6Db8T16G2rkTd0GBQfowg9I
 lBqkbUarYZwuAXrJYoLspjtJ0poMp6MCQkOU2OdzwqSVD2LMgBxe9QvuHL2jVKDsbEZo
 jnlzGy/3u8bTL2Ayx1eAKReL5ZUjuuplumMx9MPujoHrOzb4Goutx0+GgAYmXMz3IPAg
 VIjzj4TQ4rh16Sfz4xj6puFUvudt4PnYNuhT9v3jlojmdDz/B6HLF/jTej0wAQ/EZZwZ
 3uEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YBz32Zc1hS/Utm9NDrz5XfahFXSnSf4FuPBsWrfn/uI=;
 b=k33c+PyuhdDvck9e8LoJkx3NHYwCaxyNSZdEfc4b+QBoAZhkz2FwGGQNXd9fK+txAt
 FDQPZYMEfaTAbyi8qjiVUR9SP1lTaE86SUcxBJtKmOikAB5b8lJ5VhQOryyTInFbF2dY
 Q/h722OON69cg26MLhnjnqd9NT9eOiJuERLolmqPWIab1SORlIIc3POyhcEK1QrEFbka
 yiQFG7m6UsoqYaEqIVYbht10nGwEKRm21Nxh+M4FR/TINqJlcrvHhePpTHk2l2gIUlMy
 lO/Nx+RCWtbJi3PS3ZwDugQtyeQwJKEe4Id0AzvaWXHyL4rd/N94ICx2F1SLbB3+yL0I
 6lmA==
X-Gm-Message-State: AOAM531OD2mfdEo0y2o3lK3Z70AaygJ+lCoYjv00BjV7xYIGyiv4LQ1s
 6q7RJXAB2zWUdNoHLDXS3DLZSzQZwsbsBw==
X-Google-Smtp-Source: ABdhPJzNORHs8XIHw6I8Pf3K2O0fqWTFwMp8h4ii9PDd1CqMokAZ+7r6d+RapJOhfI2M4l6lyRzl3g==
X-Received: by 2002:adf:ef4b:: with SMTP id c11mr5983081wrp.35.1628178283614; 
 Thu, 05 Aug 2021 08:44:43 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id g16sm7692559wro.63.2021.08.05.08.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 08:44:43 -0700 (PDT)
Subject: Re: [v6 2/2] arm64: dts: mediatek: Correct UART0 bus clock of MT8192
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20210727023205.20319-1-chun-jie.chen@mediatek.com>
 <20210727023205.20319-3-chun-jie.chen@mediatek.com>
 <CAATdQgC-X6pijkgTBsWJJKp__J6N=7JNKHQJmOMvTAjivwPM5w@mail.gmail.com>
 <a48525422d4c953a2dac2a907895c20b9fd6d232.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <913973ef-e3ee-5015-a010-b436fe620e1c@gmail.com>
Date: Thu, 5 Aug 2021 17:44:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a48525422d4c953a2dac2a907895c20b9fd6d232.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_084445_117749_BEEAC33A 
X-CRM114-Status: GOOD (  18.65  )
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



On 30/07/2021 04:43, Chun-Jie Chen wrote:
> On Wed, 2021-07-28 at 14:14 +0800, Ikjoon Jang wrote:
>> Hi,
>>
>> On Tue, Jul 27, 2021 at 10:43 AM Chun-Jie Chen
>> <chun-jie.chen@mediatek.com> wrote:
>>>
>>> infra_uart0 clock is the real one what uart0 uses as bus clock.
>>>
>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>>> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
>>> ---
>>>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> index c7c7d4e017ae..9810f1d441da 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> @@ -327,7 +327,7 @@
>>>                                      "mediatek,mt6577-uart";
>>>                         reg = <0 0x11002000 0 0x1000>;
>>>                         interrupts = <GIC_SPI 109
>>> IRQ_TYPE_LEVEL_HIGH 0>;
>>> -                       clocks = <&clk26m>, <&clk26m>;
>>> +                       clocks = <&clk26m>, <&infracfg
>>> CLK_INFRA_UART0>;
>>>                         clock-names = "baud", "bus";
>>>                         status = "disabled";
>>>                 };
>>
>> There're many other nodes still having only clk26m. Will you update
>> them too?
>>
> 
> Others will be updated by IP owner.
> 

As it seems we will have some time before this can be merged, could you help
work with the other IP owners to get one big patch that updates all clocks?

Thanks a lot,
Matthias

> Best Regards,
> Chun-Jie
> 
>>> --
>>> 2.18.0
>>> _______________________________________________
>>> Linux-mediatek mailing list
>>> Linux-mediatek@lists.infradead.org
>>>
> https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!1bIz6X2EiFbigCImzQmbqtezIFfl1LRBuPOYTqBdl5wfx8b-zp0zQP68R7RhaIcAAXXF$
>>>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
