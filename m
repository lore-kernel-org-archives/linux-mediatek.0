Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4114C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Aug 2024 13:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiPz6vhSe0Y74SHgHnMh+G/Dz9fcXwIzccVX20RECMg=; b=rVhdkUQs0EsNGZprwrkR/p0hpJ
	O6l1adZ3W11WDjiEQj2GDri9T+KZgazhaBrYLwFjNmIc/QxisdQDZRjo/cVlcNIbpO8VCLifI3j1k
	yqUlcUYzIqvqIbJWbsqNGuywmxrZHohDSP4kIu+Q/27j5opTm7XqbPaE49+4kXK3DwzjTsRh8hWaX
	T8bJe6ajShD/lrtrqJJAEV2JIxPPDChl4pO7yfegZrk5nTxWHf22r2cmU6bC5K/zU7VfFn4oU/Rc8
	TFsHSbB7qyewkZeRJfiXMcx8NDhp4aSDMEG4wrUUsN3spBrVBcHdkf2PsqWXXXwH38u3ChWF9OPRF
	Rx3klIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scm5H-0000000EC9k-0tXs;
	Sat, 10 Aug 2024 13:24:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scm4g-0000000EC7e-1Rfo
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Aug 2024 13:24:04 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3687f8fcab5so1534098f8f.3
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Aug 2024 06:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723296240; x=1723901040; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XiPz6vhSe0Y74SHgHnMh+G/Dz9fcXwIzccVX20RECMg=;
        b=dWerFYgf4wgDw4LLJWZwbQAdLIXNOrsn75SNm/vLbBIWty7+3+Dsa2JSqLsFF8qThv
         I586+u9GLwxzukp6C3rMPHfEwaMcO4tgmPW81YL1jhIsBEIJvJTw4eCODLK18WlCAZie
         A7bx+W2H8c0uI0sPKlSb7gtViB5szAnzoQU215dYWg1GiKa4uUzjhSlDsGUAPYDKgmTG
         H+6+YNxLkXcO5Mmr8j/CN08H6IXti32tiJBisE8k6NOqcuk2XlN1/8tj2r6g3xxK9+oo
         oYFB5QZMDGtglqVVACgG+zfHVoebRHHAHwgcbmj1JbnTvOrBHTfap3YdFjuOSofja6Ii
         pe7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723296240; x=1723901040;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiPz6vhSe0Y74SHgHnMh+G/Dz9fcXwIzccVX20RECMg=;
        b=UXzyBXOFZUX9xOhR+xVrCxuYaBToRh1efWYQUAURCXBnqNkdliA98vfOtu3hoqcFtt
         S8uYg95DJEvxbewDvPjR2zLfT9yEGaojduLkzAXlKymR89W6CxGJFZayBJyR5/oiPx6f
         VkZ9STeuHDnwhc8nqjH+nFJ2eCmKkpye/M7nMcyjgk5o+da78f2b3s+lnvEj+2dYinY3
         ksT+lpuhcWSF7dxs7P0kHhfvmTP+qmA/8ZLD0TG9B4zTummfgxQ5k5I2Zr+oJohjpvxu
         kdZwfxt1GnKPVWESlEAZvKHV4w0EwpdC1VgBlyEmoxcu99nigmsLyqtZeoEQ1HEYbPO9
         RPig==
X-Forwarded-Encrypted: i=1; AJvYcCV2lbxTlD1CWfoIUXDXJOQqIJOPcCA8mYTS8LkW678ntrZpoHdP3bwN+cYvaGMQ6Xz/9awia8B9uiqkVRt6RaJtCfay2jBrxedsHXftaIg0RUAH
X-Gm-Message-State: AOJu0YxKLE8enXpi3B32ceS7SQj7pagfigUD/ts16zXzPmC7fdAekNNo
	VgChj8Ktb4YJQUGnQAuxvFIY+9IhElTTUfbvUOhcZeZjO9rY5uDCecZXH6BaWOc=
X-Google-Smtp-Source: AGHT+IEdDjsrYgvZDon2xhBVQHWuFMzxKxk/zc+YIYk66q24J5so7wVLIlRj+WUpG13xqXDxMoQpng==
X-Received: by 2002:a5d:494e:0:b0:368:7f4f:9ead with SMTP id ffacd0b85a97d-36d5de93578mr3030114f8f.7.1723296239657;
        Sat, 10 Aug 2024 06:23:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c36bea4sm2349677f8f.13.2024.08.10.06.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Aug 2024 06:23:58 -0700 (PDT)
Message-ID: <acba7e77-b403-432d-aa8c-35b5a5371c31@linaro.org>
Date: Sat, 10 Aug 2024 15:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: regulator: mediatek,mt6397-regulator:
 convert to YAML
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
 =?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, =?UTF-8?B?U2VuIENodSAo5YKo5qOuKQ==?=
 <Sen.Chu@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>,
 =?UTF-8?B?Q2hyaXMtcWogQ2hlbiAo6Zmz5aWH6YCyKQ==?=
 <Chris-qj.Chen@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20240806122507.2766-1-macpaul.lin@mediatek.com>
 <dcc40975-93f6-440e-8887-7a40a0cb3898@linaro.org>
 <31f7251a-7759-1260-7cb7-e239c9baa0a7@mediatek.com>
 <ce5757c6-0bd9-47b9-b5f5-dd5a33953fdd@linaro.org>
 <340d52e0-43b8-73db-7308-3ffbe4217419@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <340d52e0-43b8-73db-7308-3ffbe4217419@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_062402_394743_E588AF69 
X-CRM114-Status: GOOD (  18.20  )
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

On 09/08/2024 07:59, Macpaul Lin wrote:
> 
> 
> On 8/8/24 20:05, Krzysztof Kozlowski wrote:
>> 	
>>
>> External email : Please do not click links or open attachments until you 
>> have verified the sender or the content.
>>
>> On 07/08/2024 12:32, Macpaul Lin wrote:
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +
>>>>> +    pwrap {
>>>>> +       pmic {
>>>>> +            compatible = "mediatek,mt6397";
>>>>
>>>> Messed indentation.
>>>>
>>>> Use 4 spaces for example indentation.
>>>>
>>>> Anyway, drop top node or better move the example to the parent device
>>>> schema making it complete.
>>
>> Look at this comment. I asked you to move to the parent device schema...
>>
>> Best regards,
>> Krzysztof
>>
> 
> I would like to ensure that the progress can be made step by step.
> 
> Since I am not specifically responsible for this driver, I cannot 
> determine when I will be able to modify the next file after completing 
> one today.
> Will it be tomorrow? Perhaps in a few months?
> There is also the possibility that I might have to pause midway due to 
> other job assignments.
> 
> Additionally, I need to obtain approval from other internal colleagues.
> I am pleased to have received permission to modify 
> mfd/mediatek,mt6397.yaml the day after I submitted this conversion of 
> mt6397-regulator.

Heh, that's surprising. Anyone can change any piece of code, that's the
beauty of open-source.

> 
> I was intend to split the example parts of the patches into 3 parts 
> seprately, mt6397-regulator.yaml, mfd/mediatek,mt6397.yaml,i
> then moving the examples from mt6397-regulator.yaml to 
> mfd/mediatek,mt6397.yaml, move the content to parent device step by step.
> 
> I will include the example part in next version patch in 
> mfd/mediatek,mt6397.yaml.

Sure, do it step-by-step, but then due to dependencies wait till each
one gets into released kernel...


Best regards,
Krzysztof


