Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743FBC0032E
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Oct 2023 09:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiRQw3JVo7CVRHS4YrqVN+xHaSdr88jKnb69gh9us5k=; b=IlPlOHq+f+egNpSBWOko69C4qz
	PjbdduUBNpZviQbJfxhFSm5DSobnlTAT8yrAQ516hQ2xJPoge5qfPTcHlPn4KNepyjK9SxRZC8VQX
	p65NUpfiI8hrfxxQxoeQY7SC60iCPWeY+0tXbgDqtQFywCyCm0hG0ExcBCp7QAcSS/1DniMaUJBCY
	9/Nja+JodXXyl+HGmprrqf0t8PJR6anlwE1BfDN4gR0wX9ZIO9UpdqW0oKKic3vD4b4X+5YxjqqRh
	BgaKt5YJwl+Xbcez+ffqQqv0bV7Mo2WZaQhK7mjgU2zWWDvETbA7NRSweL99SnVV/LN16ciMBq1xE
	Y1zO0g8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwfLC-000DFj-17;
	Sat, 28 Oct 2023 09:10:46 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwfL9-000DEn-1A
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Oct 2023 09:10:45 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5079f9ec8d9so3188969e87.0
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Oct 2023 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698484231; x=1699089031; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiRQw3JVo7CVRHS4YrqVN+xHaSdr88jKnb69gh9us5k=;
        b=MXsY7p9ScN0Y9iqKdO77ZxXAhBwNxKHjVR+5x5nNtkf7zsxYrYWERR63r4iO8oPs5A
         TWfuL1UTYYciRo2/XPhjbd6x7PS+09AL1O2KjtVsMcIi706LZe8ltNqSfkC3VKeI3TdN
         CzhOc0V+i7lSauigifLpXBAJL64KKxgNWlB3mWGJzoKLY4oenHQm0ClnIU532lR8Bs/L
         tdTQUftjK8V4JAtzipK3IP9nH+W/GJU+Z1ktS8BdJjAxCbehPoqv4fotiQtJ/NgvHT97
         mleO/27c+aBcKYDs/63n/LqcVAOE8vg2j2i3xCrXSQ1aUmibXA02qc5eZvoxOgVgUoBX
         d2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698484231; x=1699089031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RiRQw3JVo7CVRHS4YrqVN+xHaSdr88jKnb69gh9us5k=;
        b=xStV3FEne/yPYDpXU4iTzQVzFTlCd64f1/Jdx1axRS9w7MhhCIGqxvPelXu4BoTH4k
         qypJh2axdEt16WxjbX9H9yWv5xxvvvGczrRQ8B7HBLZ2KM+ECWCCgnKJXVn7ySXJZ72y
         lDQRj8dHWa9XfVnEKBORilMSB1VuuA3auAEhUaAXPRTIuuuIDTlUiUSuK/hyloSRfH2Z
         mp8SCvyELxsLbLjPQ4coyPEwldSb+IZpNX9sSykvJYge0muTwaU4/36IgAgExZ/uK2Zl
         SptwZI0xqMXULSOIl8kguilVbOct9ta3njY1ErxIwVDkg4UZVSjxQZIZkWoC67yZZZCS
         zPjA==
X-Gm-Message-State: AOJu0Yw+0ypajqbgtrQM2vbD+3WE6DMLGZ1e26+cXaX4X9uy4qMM0P5B
	+wQS97Ep/JOjiK4swDs7mQxX5Q==
X-Google-Smtp-Source: AGHT+IHGiXAdvPS5Bqqb1yd9rOjeYrzC9VjJrUDozq+YnoTQOhChm7NQv7446Uwtkfa+/xegf273Ug==
X-Received: by 2002:a19:644e:0:b0:504:3499:7c2b with SMTP id b14-20020a19644e000000b0050434997c2bmr1594540lfj.21.1698484230726;
        Sat, 28 Oct 2023 02:10:30 -0700 (PDT)
Received: from [192.168.0.22] ([78.10.206.168])
        by smtp.gmail.com with ESMTPSA id a25-20020ac25219000000b005057830c24dsm587389lfl.141.2023.10.28.02.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Oct 2023 02:10:30 -0700 (PDT)
Message-ID: <f9dd6f3f-4608-4cec-9e54-eeaeb95bca97@linaro.org>
Date: Sat, 28 Oct 2023 11:10:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] dt-bindings: mailbox: Add property for CMDQ secure
 driver
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "jkardatzke@google.com" <jkardatzke@google.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
 <20231023043751.17114-3-jason-jh.lin@mediatek.com>
 <374a6fe3-23f5-4450-8ef6-8e0478c7ade5@linaro.org>
 <c04109bb54d6d4cf728488a8ed697df0b71f4e46.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c04109bb54d6d4cf728488a8ed697df0b71f4e46.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_021043_483757_970AD840 
X-CRM114-Status: GOOD (  20.55  )
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

On 24/10/2023 18:37, Jason-JH Lin (林睿祥) wrote:
> Hi Krzysztof,
> 
> Thanks for the reviews.
> 
> On Mon, 2023-10-23 at 09:49 +0200, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 23/10/2023 06:37, Jason-JH.Lin wrote:
>>> Add mboxes to define a GCE loopping thread as a secure irq handler.
>>> Add mediatek,gce-events to define a GCE event siganl sent from CMDQ
>>> TA driver in secure world as a secure irq.
>>>
>>> These 2 properties are required for CMDQ secure driver.
>>>
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> ---
>>>  .../bindings/mailbox/mediatek,gce-mailbox.yaml         | 10
>> ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git
>> a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml 
>> b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>>> index cef9d7601398..65fb93bb53b6 100644
>>> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-
>> mailbox.yaml
>>> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-
>> mailbox.yaml
>>> @@ -49,6 +49,16 @@ properties:
>>>      items:
>>>        - const: gce
>>>  
>>> +  mboxes:
>>> +    maxItems: 1
>>> +
>>> +  mediatek,gce-events:
>>> +    description:
>>> +      The event id which is mapping to the specific hardware event
>> signal
>>> +      to gce. The event id is defined in the gce header
>>> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>
>> Nothing improved.
>>
>> This is a friendly reminder during the review process.
>>
>> It seems my previous comments were not fully addressed. Maybe my
> 
> Sorry, I didn't find your comments in the previous patch here:
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20230918192204.32263-2-jason-jh.lin@mediatek.com/
> 
> Could you please comment again?
> Thank you very much.

Please implement Rob's feedback.
> 
> 
> And I do see Rob's comment, so I sync the mediatek,gce-events property
> definition from other yaml where used this property.
> 
> Should I also modify the definition of mediatek,gce-events property to
> reference to mediatek,gce-mailbox.yaml for other yaml?

You need single definition in one of the bindings or in shared bindings.
Depends on the users of this property.


Best regards,
Krzysztof


