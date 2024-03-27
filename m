Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC677C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhQ9HD7CHMMgyCBCsFB59rsHA3mlpnsH3nF/ASvIemg=; b=IwBJBWajvPlU+eNq+d5V0P+67q
	tkgkW2d2r+2wxz+DZfou3Xy9/WLxbugPyP0JxCqn94GYotakic2hIt3vziNni4HkmSjjJawEmdm6W
	9j2MH0oMec/N0RXc0OnrF+fZFYNRRzQMbUqggjOmv5hvkFTnwr6SQ5BxWT25Y1iomHS2Sp99yEgeU
	u9n74zUXL/WzqDPwFppTZRnGrtEWBZtv+HHZqlSB5Rc1QjAikzR6YnLGZMVRPyBiUrt/BJXFimJZu
	Ldw3fyOKlhehGBrlHtlGdnIRcUp/tJuRDFOm6EBSz/I2ZxFEWXcu1FU89p/uuyc5K61xtokU805qN
	Bbemxqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQEy-00000008Lq0-3Cyl;
	Wed, 27 Mar 2024 10:10:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQEw-00000008LpG-455h
	for linux-mediatek@bombadil.infradead.org;
	Wed, 27 Mar 2024 10:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=FhQ9HD7CHMMgyCBCsFB59rsHA3mlpnsH3nF/ASvIemg=; b=OtjnPFK+u2WLA7BsmtpOZJ8Ezo
	S7U7ru2n5RdZJbtmD5Z8hzhETd2pFw5Wi63b6TuDrFM8Rl95asHMhxjTHIy9Ptx2/RXE0dCGYsiI/
	9OLyNpS4kofPoTqQ0sZ0A/BlGIqeommRRJImwkE5tr7NM+o/I2jV2lQTmWTRH3rFLo/Pgb8ulVWbZ
	z4kEKWzljaZQmt+io/VI9lHmohSH/0acrSSSFDLf9sFiuFdeQN3Qbva264Bq7pdIqr0jZ7QrCSt72
	AZJRFgxiKl1bwdKT0oz2c+/uj62tSqvVVUw4oJyJCvLc31vaTelmxTe4jteOVW1yJKBVZXSSEXQl8
	WmgTkD5Q==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQEr-00000003b3d-2DjV
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Mar 2024 10:10:37 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-56c3689ad2cso1463690a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711534230; x=1712139030; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FhQ9HD7CHMMgyCBCsFB59rsHA3mlpnsH3nF/ASvIemg=;
        b=etJo8PL9BQYH8SS0IhaEFo+EG16wn+xL6d3eF7GiIIXij7yzJanXpGbihM8K31ge0Q
         U4fd+buto5juoouVQTVKEgK+IYYbSeTEsQH6UdhPtZxQ5y1IFbubLm0xKC61hLcUt87E
         SqH4nxnV3Z3PAvE5YRxSfm88cdXdfcgjwBrCPoEbUgzafN97vVSDZUTtNA1XAV5tP8R3
         F8SO90l5wY8351ubzvKOUAnK82bO8ZZ8X0GMJ7C9pY+WPjz0DATBegDZmQkMB6IuQ+sM
         HzakSaNoi0BYZbpfAmMgmNddCY2WYsuV4Wu/k4nTAGnlxyk1+TvQf4jPRNRnVGbCf3wl
         yGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711534230; x=1712139030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhQ9HD7CHMMgyCBCsFB59rsHA3mlpnsH3nF/ASvIemg=;
        b=kezN3zV358pw6uNWgweQVHW+PxY4cFvA58Hfi6o9X4VyHsciAxbVdsAKShBITygWpp
         7uWVYY2fSRcYFgbppa4eiLgIIB7B+cPxtM8bmarP+ZGmk+7TiyqfJ6YHqy4A1oV7HBnj
         CV/DPlUNGpqtH4DZAH8tl6wEYUnRX5s0H/HY2tgC13RLh4UzEfFn1229secozR5yMbFv
         cOXJPJuTcgnfL54mnV/GuVsJ+M37UZYAW9Dts1MW4WJhqcow8Ud4zeITiuAYvdES5rMV
         mwzeF89XRcSFUTTmpoSBlCrAl8VxDfZmcGc5SGJIy2XhWfQHgIBXuO0eWC9zRwluWf9g
         mGJg==
X-Forwarded-Encrypted: i=1; AJvYcCULxQldN1Y58tCaprY8OI3MDq/+nX753V5NCph8J009JUiObDyG/BFTDCyJ14F42Pu0Q7vku23ItTXic93MFuqpUkJyXUfijIzCU7rD1VEb6PLc
X-Gm-Message-State: AOJu0YzOyw9p6GXz5rlRIuPMbNhsmiTWnGStD6hIx3q9yqn6HClLrCMi
	P9vj0g9aws4gSQHt64J7PSU3xXHl0UudhZ1jUPoXTOwJJatKvTHRLVZsicub3Q0=
X-Google-Smtp-Source: AGHT+IGyYWgSi83PMwUdN2ZBu4//s1bSwYh+8Wy7h9Nn6YKWw+5InswMCp8CiP8LxHoG/vg8HhvMag==
X-Received: by 2002:a17:906:a085:b0:a4d:8481:5ea8 with SMTP id q5-20020a170906a08500b00a4d84815ea8mr3033473ejy.73.1711534229982;
        Wed, 27 Mar 2024 03:10:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id b4-20020a170906708400b00a46da83f7fdsm5264403ejk.145.2024.03.27.03.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 03:10:29 -0700 (PDT)
Message-ID: <1e21524d-318e-4ba0-8142-719c249aa2dd@linaro.org>
Date: Wed, 27 Mar 2024 11:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: power: Add mediatek larb definition
To: =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>,
 =?UTF-8?B?TWFuZHlKSCBMaXUgKOWKieS6uuWDlik=?= <MandyJH.Liu@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?WGl1ZmVuZyBMaSAo5p2O56eA5bOwKQ==?= <Xiufeng.Li@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?=
 <fan.chen@mediatek.com>
References: <20240327055732.28198-1-yu-chang.lee@mediatek.com>
 <20240327055732.28198-3-yu-chang.lee@mediatek.com>
 <6dd9959e-f741-47af-b10a-1894f72ae78f@linaro.org>
 <f25b4d913a584d753888e7a3c32502eae1f7fbf0.camel@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f25b4d913a584d753888e7a3c32502eae1f7fbf0.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_101033_642331_183B95A5 
X-CRM114-Status: GOOD (  11.65  )
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

On 27/03/2024 11:01, Yu-chang Lee (李禹璋) wrote:
> On Wed, 2024-03-27 at 09:39 +0100, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 27/03/2024 06:57, yu-chang.lee wrote:
>>> Add Smart Multimedia Interface Local Arbiter to mediatek
>>> power domain.
>>>
>>> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
>>> ---
>>>  .../devicetree/bindings/power/mediatek,power-controller.yaml  | 4
>> ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git
>> a/Documentation/devicetree/bindings/power/mediatek,power-
>> controller.yaml
>> b/Documentation/devicetree/bindings/power/mediatek,power-
>> controller.yaml
>>> index 8985e2df8a56..228c0dec5253 100644
>>> --- a/Documentation/devicetree/bindings/power/mediatek,power-
>> controller.yaml
>>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-
>> controller.yaml
>>> @@ -125,6 +125,10 @@ $defs:
>>>          $ref: /schemas/types.yaml#/definitions/phandle
>>>          description: phandle to the device containing the SMI
>> register range.
>>>  
>>> +     mediatek,larb:
>>> +        $ref: /schemas/types.yaml#/definitions/phandle
>>> +        description: phandle to the device containing the LARB
>> register range.
>>
>> Why do you need it?
>>
>> Plus I also see mediatek,larbs and mediatek,larb-id... so now we have
>> third one similar.
>>
> MM driver used "mediatek,larbs" for it larb node.
> Power domain driver used "mediatek,larb".
> "mediatek,larb-id" is for larb in dts.
> 
> The naming is no related to each other.

Then it is just confusing.

Best regards,
Krzysztof


