Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C66C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8HnwlLIuUW6GQ7MF6wb6CuJekIWr1nSvjXjmRhkscs=; b=IidP85491YEyUDeWTD6WCWrKC8
	0EtM9GiPzTJK0Ey43ehpzl25rj2GKEe9aJVvIyIw2HLwyVzeog0Fja9r68AhCwozuXcNc1yKBxXMh
	qqD5imqPexJMCmSYPYISnnus2KKvkjEkzwnnDTgfTfsSTkKsWT2KSBFjf4WUKBSBioQ17uOp0Bc96
	Xng/doOavPO+dxIt6toh9dqgSErgX4FHjmpQnC6j+DSr1bmfK7fnzm20w28KefusCuchxKUvEfeKg
	yiTC4DhRG/9GUMhLRK0qNvS9xldi7ZAUyNBYKA+R7sFxvj15mQV0AQuLmNl/Dv7Ra37cfeP6ynRxh
	z8P8YG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPXq-006ysM-Ra; Tue, 22 Nov 2022 09:26:22 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPWj-006yAD-KR
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 09:25:15 +0000
Received: by mail-lf1-x129.google.com with SMTP id g7so22711806lfv.5
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Nov 2022 01:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8HnwlLIuUW6GQ7MF6wb6CuJekIWr1nSvjXjmRhkscs=;
        b=IiWqDjT6H1cRpC90wd65AWT/9WXUU+5hNY7FkQZBesPVQr9IdCFRIGTV34ehmgTZZK
         3Jus1oyGfk+IMtnQAxdJLPDiOq9V8rNWApdkLIk+5alXBEh5o14B1MyG8uWIV2dzOuG8
         toUTbMdScxGAqDtDb0qvamE57LbdJBuSEqdLOyuNLT5l/LGKQEuiZyH71dfr2IUMi0q6
         /HKVLbgm1JY3WWz3viCNGwcOBt3cG7lrcIpnxAeIs2ULThxcyFaW0M58yA0S7mFSw+xQ
         UNrZYm4Z5E5U0rleIsGfQlNV5rp5siEptUh093+4dlwIS7VXqJ063vgla6ASbpcWJ7++
         9+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8HnwlLIuUW6GQ7MF6wb6CuJekIWr1nSvjXjmRhkscs=;
        b=b43cruPOrG52i81pr8vMB8kNXwXHEk83VklTE1Y9NKFLqyXPIoWo+QU4TuMNVKNUb9
         NrAfSzoLKMEFLJ6cVTN5/8bO2Bx8EsED/RLBXeaEgpEBqlYmmmlAar7WUvk2mvrOP+UZ
         yLDdufwGPiEI2qUzpF3mvXW6mKTFcQJv10evN/44M4XmfeJ3IcN4pdAjsK5YjBneys2p
         N+IuDaHKTI7RP9MIG7iJwU8g2FFZL0u2LFlTD4Lt0Ml7sGoTEV9CK21fmSNgyOeovuK8
         mnldUbx+B6S2OvLOnA/GIzNBjP8O6K6IfNlqnOZ8InybhQ4v0HDCU7ISqrZgKXwWgeql
         msuw==
X-Gm-Message-State: ANoB5pnZnm8UIO7KqLqXG/4sRNbNE4Xtu2Z89kh+c51JCd0qUX4KDFGQ
	IpeUwLvyB81gRxYSPyeeQari6g==
X-Google-Smtp-Source: AA0mqf5byVk5N0XWLkFNIEkusMvYIeYHdcBQgOYQ8RWpuWexV58KEhN68yvC6R+ZBH9j/xzMZoTDiw==
X-Received: by 2002:ac2:4424:0:b0:4a2:2dc9:3e0e with SMTP id w4-20020ac24424000000b004a22dc93e0emr8339106lfl.272.1669109110296;
        Tue, 22 Nov 2022 01:25:10 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q6-20020ac25fc6000000b004a45f2e49b1sm2378780lfg.273.2022.11.22.01.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 01:25:09 -0800 (PST)
Message-ID: <09aaf26a-7377-a4f6-6145-5301304927b7@linaro.org>
Date: Tue, 22 Nov 2022 10:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] dt-bindings: gce: add gce header file for mt8188
Content-Language: en-US
To: =?UTF-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
 <yongqiang.niu@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20221104074443.26172-1-Elvis.Wang@mediatek.com>
 <20221104074443.26172-2-Elvis.Wang@mediatek.com>
 <bdb46b7c-6e08-26cf-491d-ca68d36f29af@linaro.org>
 <fcec5536-6ba8-9cac-2001-710a7170df70@gmail.com>
 <5ad6c51677e1476d08ae6de6bd5021384a689b31.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5ad6c51677e1476d08ae6de6bd5021384a689b31.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_012513_759499_64C06433 
X-CRM114-Status: GOOD (  16.00  )
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

On 22/11/2022 10:10, Elvis Wang (王军) wrote:
> On Mon, 2022-11-07 at 12:18 +0100, Matthias Brugger wrote:
>>
>> On 06/11/2022 11:27, Krzysztof Kozlowski wrote:
>>> On 04/11/2022 08:44, Elvis.Wang wrote:
>>>> From: Elvis Wang <Elvis.Wang@mediatek.com>
>>>>
>>>> add gce header file to define the gce thread priority, gce subsys
>>>> id,
>>>> event and constant for mt8188.
>>>>
>>>> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
>>>> ---
>>>> Thanks for the reviews, I have removed the incorrect reviewed
>>>> message.
>>>> ---
>>>>   include/dt-bindings/gce/mediatek,mt8188-gce.h | 966
>>>> ++++++++++++++++++
>>>>   1 file changed, 966 insertions(+)
>>>>   create mode 100644 include/dt-bindings/gce/mediatek,mt8188-
>>>> gce.h
>>>>
>>>> diff --git a/include/dt-bindings/gce/mediatek,mt8188-gce.h
>>>> b/include/dt-bindings/gce/mediatek,mt8188-gce.h
>>>> new file mode 100644
>>>> index 000000000000..e2e2c56016a1
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/gce/mediatek,mt8188-gce.h
>>>
>>>
>>> What is a "gce" subsystem or type of hardware? Why do you put
>>> headers in
>>> "gce"?
>>>
>>
>> Yes, I think we should move all header files from the gce folder into
>> the 
>> mailbox folder.
>>
>> Regards,
>> Matthias
> 
> There are still a lot of header files undre gce. If all of them are
> moved, it will also involve the modification of yaml and corresponding
> project dts files, which requires more effort. Can we deal with the
> 8188 part first?

Sure, just put the new bindings in proper location (mailbox if this is a
Mailbox).

Best regards,
Krzysztof


