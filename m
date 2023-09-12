Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1314CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkg4dOxircu0CypR4iVJaC4UA5MgleI1a7GPOXfeFc0=; b=TXWNsp6DxvfVWeFSbQ3S4mqTRl
	wyeyfOxj3sQe028vJ0D0nGp8bClKPNCafQuqSk3aKdfAtjRR4f+4vFMqbWjU9FswYcVwCet0nN6BI
	ta5Nu5IrQS2X1Z181dP+o4rgjJLgkzpHFNJHrs4absR9BEfqNcytk56t7fE9JQzaL1oLj/A+ZQScD
	iXjlyKsggyyWujQF4mwb967tNq3A2uFGL3iVqvxJgHwAfuu3y5Yw0PTafoGEZYx2QTaCtzD4+TLJm
	OjTmxPoz3SNeyXtkxKd4YmdGT8z6dXavjGQ470l58F5TcD7PzhRgFu0WQkwOKvlWdBuxrEM1R0wNh
	l8VoYmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg39w-003OcD-1h;
	Tue, 12 Sep 2023 13:10:28 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg39r-003Oaj-2u
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 13:10:26 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52c9be5e6f0so6774089a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 06:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694524218; x=1695129018; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkg4dOxircu0CypR4iVJaC4UA5MgleI1a7GPOXfeFc0=;
        b=0QRLmldXvwatktK+TnoeYgX0HeIHrB7tR+fUwnXFTAWIixOIwW2hDUprtuo4RHk6Xn
         7KZPBt4h/kXl+YKxQAeAuGjrsy4+TADq2DIJ0JOhgIM+9HGYBEXxt7iaoy4/Pgi+LgO4
         njzAqUdNEiOxDzYyGaz1VKdSHoSfZqRy8b1QrfdpwjypbI37ZMSqelVuv9ZUW0MxgPpb
         IEuDTk7d8e32UkQxq+pEbwfaYU5fLAlLKpwD3nvAe1PnUmKdx6iAsh3oijf9/BZrTbnA
         WMxxQDdyBnLbuACmOLUcHzeueJfnWEETgDmvrNIm2Avs4tpOebOApZwp8zZ3NXLrkc2f
         IlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694524218; x=1695129018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkg4dOxircu0CypR4iVJaC4UA5MgleI1a7GPOXfeFc0=;
        b=DDUxLOkHIbwrqQZ1CKzWoYyELeMsP1eSX4g03h3igF0alXHoCY0Ea6Ofr7FOevy+GK
         IMuR5uqI9abANcOgg66yy1mJdbv0ZWcLtHWaMFZssPsOK6KswItSHOJPlMJ0lZ5fAjMv
         C8jnD1kKSbSD8v9dthAYqfBc1dTI79t+SkAhnSSKRhnwZZGCEuIK17ONJOVwYuN11b9S
         qjk1E4KpKXFQuc55XkuQBuiSEp+a4C+A+FDXdNvXxyjc47tp1JZvsTfylbkN9Opo4wEw
         d0uAgFW3DlGYQCI+EA/A0w+3dhzTcpL/EUpT2em0zp8YBm+He0qkq6EpMX0B5HLrWdGH
         a25w==
X-Gm-Message-State: AOJu0YxaBfPIDfIp1aPArBptCRoPPhoBJBel6h68fRGACw6QJMNFmo8h
	aXUIKLxdNxmO0opUVl4TXrzvuQ==
X-Google-Smtp-Source: AGHT+IF9FtG/P/CA2bdUyaN9tNAyaXDTWKcSZgO8Knq6251cqFC3kMveGTT42yqBJk4qwEUbkIX6tg==
X-Received: by 2002:a17:907:2cc9:b0:994:577:f9dd with SMTP id hg9-20020a1709072cc900b009940577f9ddmr9981438ejc.9.1694524218002;
        Tue, 12 Sep 2023 06:10:18 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id v14-20020a170906338e00b00992b1c93279sm6758341eja.110.2023.09.12.06.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 06:10:17 -0700 (PDT)
Message-ID: <4c99c180-3b79-6aef-6ff2-d430e575957d@baylibre.com>
Date: Tue, 12 Sep 2023 15:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RESEND PATCH] arm64: dts: mediatek: Fix "status" values
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20230804225813.12493-1-robh@kernel.org>
 <f8759d51-f808-8082-ceaf-6c6dcaebe2d9@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <f8759d51-f808-8082-ceaf-6c6dcaebe2d9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_061023_939398_DEDAED77 
X-CRM114-Status: GOOD (  21.39  )
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



On 12/09/2023 14:54, AngeloGioacchino Del Regno wrote:
> Il 05/08/23 00:58, Rob Herring ha scritto:
>> The defined value for "status" is "disabled", not "disable".
>>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Reviewed-by: AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>> Arnd, Please take this directly I guess. I think Mediatek maintainership
>> needs some help. Maybe AngeloGioacchino should be co-maintainer as
>> that's the only response I seem to be getting.
> 
> Sorry but I've seen this message just now as I've been on holiday in 
> August.
> 
> Thing is, the MediaTek scene is starting to see more and more code, 
> bringing
> an obvious increase in the amount of reviews to be done and in the required
> efforts to maintain the MTK bits - and we will possibly (hopefully) see 
> even
> more of that.
> 
> If Matthias needs/wants a co-maintainer for MediaTek I'm here and I will be
> proud to become one.
> 
> Cheers,
> Angelo
> 

I started reviewing MediaTek patches for some months now, so I'm still 
new. From my PoV, I'm agree with Angelo when he say the amount of patch 
is increasing. I support Angelo if he wants to become a co-maintainer 
and continue to do my best to review patches. ;)

>>
>> I think for future .dts patches I will not bother splitting them up by
>> sub-arch because it's a pain to chase down the maintainers to apply
>> stuff in a timely manner. /rant
>>
>>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts 
>> b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
>> index e4605d23fdc8..86cedb0bf1a9 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
>> @@ -585,11 +585,11 @@ &pwrap {
>>   };
>>   &sata {
>> -    status = "disable";
>> +    status = "disabled";
>>   };
>>   &sata_phy {
>> -    status = "disable";
>> +    status = "disabled";
>>   };
>>   &spi0 {
> 
> 

-- 
Regards,
Alexandre

