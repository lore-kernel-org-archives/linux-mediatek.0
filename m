Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1027ACA5515
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 08:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vc1DY5wzwzaibqui8TMdK8lO4RUiDXh6n26JHSshLyk=; b=qlDjMGIdr34d9O6MArXLqIJa6q
	wKsiIDhPfJj/MqQdEyjOnC+1IYf7Ggg7UpGrl8aDC2xp5DmZGdYc2tay4kcXrTvg1tV9CMY+B1Cnd
	c0dN7Gy4YV/U6dZ82QNm/mXC1Ti55LCf9NIFYyPc8lJB9oRwGe9i0gGX9gbOnF6Oi/Pd0IwB4ZqIF
	LQjK1IKFHMsx4Ga1hSDYlDHsrNdTp8HJkoZKZpFhAoXyf56HbcJaYZi9at1uLS7Z7UarIQwR3EO6O
	ENV2Z50wLhksW+oLSMZyLyivbdgcJoJcu6Xt/9RGVqKZEG88sduaaYhlDjJvLcNFz0VppX31r+E4r
	qckh+xSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLhu-005DTH-08;
	Wed, 13 Sep 2023 08:58:46 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLhr-005DRZ-24
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 08:58:44 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52f3ba561d9so1552411a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694595521; x=1695200321; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vc1DY5wzwzaibqui8TMdK8lO4RUiDXh6n26JHSshLyk=;
        b=oyOb2WcerlpJ/r5q6gRVHpJlJ95PDcPW/fv10o4wXR6zh2Qg++QhVeySZUc+rjzzw+
         HzpleCM1WZHPoZuGWySW8RJkK1J0Sn/AJbACSkJok4nOjLFyoVIJfDmJx8t5LiVmfHR2
         VLg3fRURLYi4yhxaBzroQYg+dX/2sGxL0HCchD2YwHudZJRl0S0QOI8ezMhMPAPGsbKf
         LsK2sqgKVD1lUFw6S2KZzp4jYsiwmJNT2UPgJ+7NC3tE7HFS0vGI1XEfU5e6KfCQ3qGO
         6UDErDJ7u+PDazFIS8HUt14LKG+5NUNfQrL5ELbHgb5AljAEIO0ee1mbkWNieFX+1ssy
         vb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694595521; x=1695200321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vc1DY5wzwzaibqui8TMdK8lO4RUiDXh6n26JHSshLyk=;
        b=wCEi4Yi0vI45KECETgG2SwZGsBNiFEYeIBIlZMOsVtBsEwKotblAey4OiSbiYPnGuu
         26hSTQ06dsqykEpkVz6jvWO8y9KDtPm2kejeXUrvC+gsDXKgjVbLzeAMVTnZtwry+u1Z
         jqIVxBKsBh0nfpru7vsMpwiATLx0i87OhIoh1b++lE3JS6jA+sWCWHP8uYylEvbjQZ1F
         0OLeCe5bMrVwzPYPibZp6eiW4xKsfjHsvtPoYgB94SB69jVtgqbOrkytwkomiOVNgdT6
         UQe2hg8HDq3TKqf3mSU2+IBIWOKpUVTtrQX+C8h8vvDDes+zCv+HOgkcbSzEQ8VWJ5rR
         y1hw==
X-Gm-Message-State: AOJu0YyzvfuVMiQa0AHGd3T0Km0i8l2DQEWmDgXYxjhC5XvHgABZarMJ
	g5i5i7aUbMFdHS+2sCmIKlq6gQ==
X-Google-Smtp-Source: AGHT+IGmJS6RbMoHG5npa8M9J1HCW+qcpAcwXT+onT2fFYSrjW4H0h6ONgbWtYQVCYNkV70DiYAXSA==
X-Received: by 2002:aa7:d8d0:0:b0:523:b37e:b83b with SMTP id k16-20020aa7d8d0000000b00523b37eb83bmr3001054eds.13.1694595521375;
        Wed, 13 Sep 2023 01:58:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id w7-20020aa7d287000000b0052a063e52b8sm6952013edq.83.2023.09.13.01.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:58:40 -0700 (PDT)
Message-ID: <c0cf592a-3cde-4bad-431b-6d80c1970638@linaro.org>
Date: Wed, 13 Sep 2023 10:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 3/3] dt-binding: mediatek: add MediaTek mt8195 MDP3
 components
Content-Language: en-US
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230912075651.10693-1-moudy.ho@mediatek.com>
 <20230912075651.10693-4-moudy.ho@mediatek.com>
 <e4119fa6-a4b7-f59e-7115-044fa83c9063@linaro.org>
 <0b4f1ab2753d4fdb4934e8f76df6e584bba2d628.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0b4f1ab2753d4fdb4934e8f76df6e584bba2d628.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_015843_680069_B64DC763 
X-CRM114-Status: GOOD (  13.71  )
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

On 13/09/2023 10:39, Moudy Ho (何宗原) wrote:

>>> @@ -63,7 +64,6 @@ properties:
>>>  required:
>>>    - compatible
>>>    - reg
>>> -  - interrupts
>>
>> Why? commit msg tells nothing about it. Why interrupt is not erquired
>> in
>> mt8173? How dropping such requirement is anyhow related to mt8195?
>>
>>
> The signals of the MDP engines are completely controlled by MTK's MUTEX
> for starting and stopping frame processing, eliminating the need for
> additional interrupts.

Then it does not look like related to this patch at all.

...

>>>  
>>>    reg:
>>>      maxItems: 1
>>> @@ -50,17 +51,19 @@ properties:
>>>      maxItems: 1
>>>  
>>>    clocks:
>>> -    items:
>>> -      - description: RDMA clock
>>> -      - description: RSZ clock
>>> +    oneOf:
>>> +      - items:
>>> +          - description: RDMA clock
>>> +          - description: SRAM shared component clock
>>> +      - items:
>>> +          - description: RDMA clock
>>
>> Why now mt8183 can have SRAM clock optional? How changing mt8183 is
>> related to this patch?
>>
>> I'll finish the review, sorry fix basics here.
>>
>> Best regards,
>> Krzysztof
>>
> The RDMA of only the 8183 needed to share SRMA with other component due
> to the old desgin.
> I attempted to describe both the situation of the 8183 and new designs
> like the 8195, but it appears that this writing style may lead to
> misunderstandings.
> I am unsure if there are any ways to enhance it.

Just like many other bindings, just look at Qualcomm, use allOf to
restrict entries per variants.

Best regards,
Krzysztof


