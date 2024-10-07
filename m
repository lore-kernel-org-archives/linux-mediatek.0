Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779C3CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pquIMmRJb+KkggxSXxZn38XG6QFiG5AL/oQVEaWjRJw=; b=qXtrog3qsvUwAMsYKxDeLfaEjd
	8QxDaNgiBnfj/wYKcRkfw0hSV2WN8mY1isrWrVqENrIqY8YTS/rKPSaPOgir2o648/iY66mG8wHD/
	3TMkEwyj1BbSmwwnomELgwoucFaGaJUqMZNeXOw46up+XK9wYCEAPIei+/eYFcERlo7tNAwo44jMc
	PUYd5NoQwsFt85sMJfXCsypY+cV+zXZytH+j6fk1wVIwIbFO1sWEX41CMm02KQoHh/kzMcKiy8X4R
	hYc8YAy9CHnQUvuAcBofYoJ0lOzmdmaLs8TnNysQ22Ka3+TeV4bniqwzS3p1i4f0CYuNiUVqdZCor
	rnyXUY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxovR-00000002lvZ-1z3g;
	Mon, 07 Oct 2024 14:41:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxonq-00000002kOs-32tb;
	Mon, 07 Oct 2024 14:33:40 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37cdbdbbb1cso2160599f8f.3;
        Mon, 07 Oct 2024 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728311616; x=1728916416; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pquIMmRJb+KkggxSXxZn38XG6QFiG5AL/oQVEaWjRJw=;
        b=MppJvuf2slyX2rQT2onJTTcThtPshNfDgTVugjlpU/bX9sUeFET8AV2oXqgSnkvYNL
         QMUt3ib9wL3RSmdxLgJ7ye7+2YD061jsiZv3+IL3FCdiig6P6ihYqv6qAE1LsGSjk7oD
         GeitDCFKU6U72M6G205kxsDISnVvUlT2JSei66Wqnc0arjuyEmRuncmM3ncpsbJ9nlkv
         gwmH2h7F/MOmUPYNkCMe59IXVKGSx16Z03HShmZYp9swGy5O46bDZcYPvVCjyXbeocI0
         1577uMG0t5jfOlICuOQPix1vb71SbDvOwpwlxtba187r8f5/2rqjAuFYWlZikbqn2yGU
         tnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728311616; x=1728916416;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pquIMmRJb+KkggxSXxZn38XG6QFiG5AL/oQVEaWjRJw=;
        b=uMe6DyNFVmoy9CsxXU9Yhan+wMqqqic6Uo0fxc9K6x59scOTtThv/YomcYl03bwq0P
         oXMJDYgxAeCY9ghNgTdZaUja/rD3mzV8bDDd18aENvKXmubQZmWu0pmQtr79E9KZj9hG
         UtSsJ7VQ7TLuMT1ogvbzT+BRfpMPBJjoNguBu7fKmlD1KOkcQFrnINc68iHRICvwaXDh
         ItH40JltDL9iUHbnRf5KzIo8Z9TqJolQQ6o+YtrEU4/AlyfjeaTaqlbxGAFRzbnTslQR
         q/Kz9RLuHj/GIIEwRHddGusd6VIEpkXe7hyTyHI0tvsZ76ObX063HM3TJ/qrjySVAwxY
         QDXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWED3d+3nRf19j0AOqYnM5+bhDtH3ZVgIphjkEetZQ/h3YXFKZBHgF1Ayx0fWULcBCi3yvqRX1vcq2QNUWtbbI=@lists.infradead.org, AJvYcCXMsH4odCsRm5J9qlvbaLBVEv3WvPwjXU34BNaUZReZzg9CYlgy9x8owDAuirL8fp9WR1Waj9vywe6FNml1EPtg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq1+wZxLX5HppanKmsdlgLMidJIGT14m8oBOVR4kFYnu972JUe
	o9KKHyx3P0DhPTVDl+xlGh/d0ceU/1rMXUOOOct2Bm0PXmWRf4eZ
X-Google-Smtp-Source: AGHT+IGtDw1P67YU8ed+KwR/dMlgkRwHa0axwE4kRcUEVW+B+8NYH6S3Clnl2s86y1yFMOE4sWxKgA==
X-Received: by 2002:a5d:694f:0:b0:37c:cd0d:3433 with SMTP id ffacd0b85a97d-37d0e73891dmr7361425f8f.29.1728311616347;
        Mon, 07 Oct 2024 07:33:36 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f8671c82dsm71708695e9.1.2024.10.07.07.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 07:33:35 -0700 (PDT)
Message-ID: <2ebe6831-f213-4026-b7b9-689b3b5e78a3@gmail.com>
Date: Mon, 7 Oct 2024 16:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] soc: mediatek: mtk-cmdq-helper: Various cleanups
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
 <172786008674.33539.15432336067797076322.b4-ty@collabora.com>
 <3e0c8b18-81ce-4c9b-886f-d7c50fdf4c3d@gmail.com>
 <ae5eb5a8-d843-488a-8b68-9f6dd5d4603d@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <ae5eb5a8-d843-488a-8b68-9f6dd5d4603d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_073338_789409_59E89BF7 
X-CRM114-Status: GOOD (  13.01  )
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



On 03/10/2024 10:08, AngeloGioacchino Del Regno wrote:
> Il 02/10/24 15:00, Matthias Brugger ha scritto:
>>
>>
>> On 02/10/2024 11:08, AngeloGioacchino Del Regno wrote:
>>> On Wed, 18 Sep 2024 12:06:17 +0200, AngeloGioacchino Del Regno wrote:
>>>> This series performs various cleanups to the MediaTek CMDQ Helper lib,
>>>> reducing code duplication and enhancing human readability.
>>>>
>>>> This also avoids double initialization struct cmdq_instruction as,
>>>> in some cases, it was stack-initialized to zero and then overwritten
>>>> completely anyway a bit later.
>>>> I'd expect compilers to be somehow smart about that, but still, while
>>>> at it ... why not :-)
>>>>
>>>> [...]
>>>
>>> Applied to v6.12-next/soc, thanks!
>>>
>>> [1/3] soc: mediatek: mtk-cmdq: Move mask build and append to function
>>>        https://git.kernel.org/mediatek/c/2400e830
>>> [2/3] soc: mediatek: mtk-cmdq: Mark very unlikely branches as such
>>>        https://git.kernel.org/mediatek/c/21ab3dae
>>> [3/3] soc: mediatek: mtk-cmdq: Move cmdq_instruction init to declaration
>>>        https://git.kernel.org/mediatek/c/66705b89
>>>
>>
>> You probably oversaw the sparse warning email on 3/3?
>>
>> As I oversaw that you already merged this.
>>
> 
> Yeah, I did. There's no problem anyway, as we can always replace the commits
> without noise, I haven't pushed anything to -next :-)
> 
> I plan to do that (drop patch 2/3, delete `.mask = 0` on 3/3) soon, at max
> next week anyway.
> 

Perfect, before you do any locally please pull from remote as I did some 
changes, not sure if you saw my message on IRC.

Regarding -next: we don't need to keep commit history in linux-next neither, to 
even it got pushed to -next, we can drop patches in the queue with any problem.

Have a nice afternoon :)
Matthias

