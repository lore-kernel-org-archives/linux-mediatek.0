Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FC8C32792
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 10:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1E0cCe5cEaQJfe86WNnJmjkEbqjIELBXQL3k/KZdD48=; b=Z2f+TmfZ+w5WhoogmlFhQ0NT2F
	NkHYSFyswwRTBBh+csC7oMod/8D44kcMj/2kn9glcDLY4n/4oHyN+2eHr+5IlBcM6nAm5eYvhlZh9
	I6O1ccS8NOTB86p7IN+/Jbx9P0gqTeNzqIlHNhI/nHLcxh6IzmYrg46W/bcTrpcc4eVijLM17h0Te
	UvfwkHppRo9huyM1WGP/Rzgp6uBAy907RAfWyR/yol/xeE/psb34iLt0Qg8hNCxweplrp1Q9cRkOC
	HXXA5k7p+EPNCcEd6pQygyHe3qKEBs1Bb16ikvL2mCzw+PAqwgC9Nh9Ce8HHcNw2SRMuyyqiI944E
	cQTz+ybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQR5u-004vIs-Nf; Tue, 23 Aug 2022 10:25:14 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQR5I-004uxk-Bl
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 10:24:39 +0000
Received: by mail-lf1-x129.google.com with SMTP id q7so15354799lfu.5
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 03:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1E0cCe5cEaQJfe86WNnJmjkEbqjIELBXQL3k/KZdD48=;
        b=QSA3yhWCG+SVJuohL5IMAtHe2qODfXcRxnbjC0pXCGrCLc01hGLKlYJjItBNEgYh4P
         2oqodZ1jRtDXD5Oc3bAfumtqxB5IQ6YdRiiPRZ7OrrnwI3Pu4U3mMOjhhgnvx877F1ch
         jtf1HReSx9JOob/Orgo1zPyhaK2lJsT7nxaXQsiraZ8a68CQwQp1q4W8+7L3CTN6YwC9
         f8XJY2cEoQvDXtcfWF/QPBl1q54iQfuUwh4R3Gb7chQMxLr07oGYnUKawwkyE/qfQQIZ
         I640N+no44vjt4uJ172x7uqbiH+3N1d2WMGNnw+9A4G9Drc3v+qgsFLUOQuUs4rUYPET
         b7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1E0cCe5cEaQJfe86WNnJmjkEbqjIELBXQL3k/KZdD48=;
        b=vmsxwuEoCHONU9KMf+OhP9NzgkkVuauQVI2gHyEvQeH/EAZUfNkHKwqhGwKnzM1/no
         5tU0+ng1gMM1L3ZGzU+UoG1VBHVuOwGIvIclxTOpAXrGwpIC572Ybr7L3PL9MBXiRPIm
         on8KhYtTV+d455Aw30VDo6kdNP1YRGR1UAmjBPO+v0QyFmQvHpf3R1LCkmtkeqfyJmCb
         gq3sbbPP2a1FZu/F8oHTCzUToecMs7XOaxNm9yEkGVsZRrUCBEhgKI3UgyM7BcEUJ7Rg
         6nZQYolnSgZVJlbNcIR2D9bHfas8TL7Nk3ydOZbuz7Reh05/M3Fp0hKGn1MZrmntG/D4
         6akQ==
X-Gm-Message-State: ACgBeo36DNhQMTDGJ9NpjAroJFg8wfMUjOl7xZdwF4oZ+I4sT4ZCW0UZ
	teMUxHPQ/aTIx11t4vfnxO0vuA==
X-Google-Smtp-Source: AA6agR6el3uDAHqHIosEoBa7BJJVdeCX9cSrpx/F0nnzHgPz/5FfAVCMOm6iQIFk/R8G13WzCYBggA==
X-Received: by 2002:a05:6512:3e25:b0:492:db16:4636 with SMTP id i37-20020a0565123e2500b00492db164636mr4317221lfv.657.1661250271586;
        Tue, 23 Aug 2022 03:24:31 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id o3-20020ac24e83000000b00492d7a7b4e3sm1655294lfr.4.2022.08.23.03.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:24:31 -0700 (PDT)
Message-ID: <bee8abe5-0299-d05e-643c-4810aa33f978@linaro.org>
Date: Tue, 23 Aug 2022 13:24:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/7] dt-bindings: phy: mediatek,tphy: add property to set
 pre-emphasis
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20220819091344.2274-1-chunfeng.yun@mediatek.com>
 <20220819091344.2274-2-chunfeng.yun@mediatek.com>
 <438da392-f419-ad76-7e91-aa4aab36e12c@linaro.org>
 <816ecf6287533137b750c8bde9de5830e4229c56.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <816ecf6287533137b750c8bde9de5830e4229c56.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_032436_440067_51776F4B 
X-CRM114-Status: GOOD (  13.94  )
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

On 22/08/2022 10:07, Chunfeng Yun wrote:
> On Fri, 2022-08-19 at 15:15 +0300, Krzysztof Kozlowski wrote:
>> On 19/08/2022 12:13, Chunfeng Yun wrote:
>>> Add a property to set usb2 phy's pre-emphasis.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>> ---
>>>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 7
>>> +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>> b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>> index 848edfb1f677..aee2f3027371 100644
>>> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>> @@ -219,6 +219,13 @@ patternProperties:
>>>          minimum: 1
>>>          maximum: 15
>>>  
>>> +      mediatek,pre-emphasis:
>>> +        description:
>>> +          The selection of pre-emphasis (U2 phy)
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        minimum: 1
>>> +        maximum: 3
>>
>> Instead of hard-coding register values in bindings, you should rather
>> describe here feature/effect. If it is in units, use unit suffixes.
>> If
>> it is some choice, usually string enum is appropriate.
> How about changing description as bellow:
> 
> "The level of pre-emphasis, increases one level, boosts the relative
> amplitudes of signal's higher frequencies components about 4.16% (U2
> phy)"
> 

Still the question is what is the unit. 4.16%?

Best regards,
Krzysztof

