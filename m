Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27814C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8EnhWnwszf0qr8z5+wPtUgbjgq6MRr3dIr/Z/EQU9c=; b=L6TBAh/J48uLKLs+3R+FDXe7vh
	YKPPQ9PMeKZ9xUdkO73IjwF3sCsMYGGha3tLH/NYE8buvEP51E07qkmu2bQ/+cx+NDqWWXMNlHIbw
	hweBdbdcvwSEJ0tkcPu42xmv+Giw6eA0glqGIvGyzM225jIqiZruqsTnWVVAycXm0O/pvbEKMNAoj
	Z8rX3+WinOYSLQSOpkTJkD1QE0IzGxdso/kF4SQSHPIiCfiZEqewIrm9hLUoH3cXNRHeVJBGWIOWx
	gxhynuzwIotYWDla+SRBq85kIMmucZaCyTwvhsl1rZQPOTQpXs0c2vy8SzeDoktXZqfGOEGeHQ5cI
	TsVzbO9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWJZ-00FH9f-Cy; Thu, 02 Feb 2023 09:55:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWJN-00FH6a-Lh; Thu, 02 Feb 2023 09:55:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id q8so921130wmo.5;
        Thu, 02 Feb 2023 01:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z8EnhWnwszf0qr8z5+wPtUgbjgq6MRr3dIr/Z/EQU9c=;
        b=TvqFHFwagLxB1rxmJuY4K7HYNruvzblKn97uEc0ZoJyWESaSBp53RH7YJRw/mSQR3r
         xJaf1N8A7YBBWJhCJKawNXow4sLXInXZMFcpCqJV4xSOIzE3Te/D3znVNQrzQeUXN5FB
         rpdIp+ZDdgnIv/GSbTBPKq3J5VQWmxU1uIKeNDrYF2DnkhQG8EsIQwLj/t8SnAphgqQx
         lMVthwwQPoi+rpPYdHkHgOrM/2KETd5X4W6zhgaXvbu6/HuEGBic5ZFlPD3wyTdVS6ek
         LdkSrfz68mselAT4dNi+vulRummyGiLeq0jw+sA6Rq7993S1hZtvNp0fOKK58O0Q+wmA
         tUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8EnhWnwszf0qr8z5+wPtUgbjgq6MRr3dIr/Z/EQU9c=;
        b=VdIDIpOUgcEt4Vde0LZsgR51fOmJVQIKtwothVabJsd3/+iNVZnxtieXUbZdWN0eWi
         BbW9ZOxfw0aaSPX/4bsSzbu2cT//xApQwRqaWJjmPDWxGzM/xfkoz/uUsacGwQxBOiwi
         6Bi6tgBh8xfGJ+wYsu4t6BUJWC0uaBuwDhcgP5EYJ0df6kp9KIIo9aO9232RUHgbRlag
         D1LGWFbhkH6PYZcGZ8+K1Aq9ykMM8OuzgMs2rOVwsgR4kR/HTvTAW2NjJ4QGtiljzNwZ
         SA6GyRkZowwXtPd+SEcNjLczzNOxUGmmFmxeG2SRQI13w4GXoiFKEDZRmlHeW3qP0zpp
         yx1w==
X-Gm-Message-State: AO0yUKVNOZoN0cmKJoXCi9Fc7l/y6yYfqfDavteLFq+tPjQqEYgMoanj
	YbjBerSHAuxmZvvDmuSzBdA=
X-Google-Smtp-Source: AK7set8sKz/UU4df3SC+11Rw2FrDgvYF6OZErkElcifAIA8x4teukttDBCFRgb6Q9oYMhmoE5bmLag==
X-Received: by 2002:a05:600c:538b:b0:3df:a04a:1a7 with SMTP id hg11-20020a05600c538b00b003dfa04a01a7mr2300590wmb.22.1675331717450;
        Thu, 02 Feb 2023 01:55:17 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j14-20020a05600c130e00b003df241f52e8sm2877394wmf.42.2023.02.02.01.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:55:16 -0800 (PST)
Message-ID: <1423871e-7dd1-4582-3bb9-85913868e951@gmail.com>
Date: Thu, 2 Feb 2023 10:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] MAINTAINERS: Update entry for MediaTek SoC support
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@kernel.org, arm@kernel.org, soc@kernel.org, arnd@arndb.de,
 olof@lixom.net
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230201152256.19514-1-matthias.bgg@kernel.org>
 <4db8fb55-a02b-d98e-65f4-1a095c43104f@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <4db8fb55-a02b-d98e-65f4-1a095c43104f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_015521_764709_FFEFE592 
X-CRM114-Status: GOOD (  10.62  )
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



On 02/02/2023 10:08, AngeloGioacchino Del Regno wrote:
> Il 01/02/23 16:22, matthias.bgg@kernel.org ha scritto:
>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> The linux-mediatek IRC channel has moved to liber.chat for quite some
>> time. Apart from that, not all patches are also send to LKML, so add
>> this ML explicitly.
>>
>> And last but not least:
>> Angelo does a wunderfull job in reviewing patches for all kind of
>> devices from MediaTek.
>>
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Is a R-b tag appropriate here to say "yes, go on with setting me as a reviewer"?
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In general yes, but I think it got already merged :D

> 
> P.S.: Thank you :-)
> 

Thank you to you for all the effort!

Regards,
Matthias

> Cheers,
> Angelo
> 

