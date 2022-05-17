Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E794C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMGr1N25x16bKQ1K5gBA8nDHVq0THpu8P3tp+1ZmEG0=; b=0klPVElCeWuZDn
	AUm6kQCtD4wKA0BcWiEqRjXm02eboV1HwqZMp/6zAKwEZRg9sXyfKai+xXF9hjvFeNQ9bfEtr9lau
	aPhubUjLcOCN3/VetR0qcqv5ibJFnFhYbXIc0Y87xOjbgKbfYwhJvJa/H7YDDZTcL4brdLMMe88jO
	uzo88w8qS0i9NdHnLWMD882/+dZJCP9zEm55q0s3HE6uQPY9zB4CZYABOoC1zYj8y0eRfkapMPhsh
	sjBTlYYVzKuJiFZsDKys3wlNdE1aNPml859aUjF9ZbJqR3ItqSP+u7uxR240ZnxVjuRz8cyOACVlf
	LO/dPcyewMNz+LL5sQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqsLv-00CNxL-7K; Tue, 17 May 2022 08:14:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqsLj-00CNta-HV; Tue, 17 May 2022 08:14:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 219F71F4423C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652775273;
 bh=e71S4wIuVuA79Q95c0v+L8CnYV43+ZQVjRchLsfKsx4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AgCoAKkvvp4nrjNV6aZz6RXQXb+Cbzt9PK5dhhR/erkMhq0ItVYzF1/P1PhHRKphY
 fLHouYqsatBCKHd13F/oHLAs1qXZm3VB6Lce50gDDVQdjP6+Kvowpjpk/XfQvr9PA5
 oZB4W1Lwo7z3O5LqI6W9ob1uw2YQ3D7BkKMSegMcFRr+rdooEx1H5u+zWnNCsgnDt2
 xMA5crRT44j96Is+3ExKju/RWR5c5lUzWqZKbP7aZ+LQ6xAa9M0CEq6GT9VMZ8CYAS
 Eb92pow2UakeOR+Y6Bdh6Xc8/hdxs3Tue8G2sTBpPN5mzcv5fVfG+xB2xxRrUIXhNZ
 LycdNcCNjLVYg==
Message-ID: <32c97e47-47a8-d033-4948-3c73a4313703@collabora.com>
Date: Tue, 17 May 2022 10:14:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: mt6795: Add fixed clocks for
 32kHz and 26MHz XOs
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
 <20220513171617.504430-6-angelogioacchino.delregno@collabora.com>
 <03e99a02-1233-3882-e1e5-24ab1bbaf257@linaro.org>
 <0f303425-3b12-7573-b201-030d4d044db8@collabora.com>
 <d78e1936-a0ab-663d-1381-b537bfd7f07d@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <d78e1936-a0ab-663d-1381-b537bfd7f07d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_011435_762222_F1E4DEDC 
X-CRM114-Status: GOOD (  20.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/05/22 16:51, Krzysztof Kozlowski ha scritto:
> On 16/05/2022 10:51, AngeloGioacchino Del Regno wrote:
> 
>>>
>>>
>>
>> I should reword the commit description to be clearer, sorry about that: I
>> went with "exactly what I've done", but looking at the actual diff, it is
>> just a rename. What my brain was ticking on here was about removing clocks
>> that didn't really exist (uart_clk is not a fixed clock, etc), and adding
>> the ones that do exist.... but then again, the result, casually, is a rename.
> 
> Yes, some better explanation would help.
> 

Will do for v2 then!

>>
>> In any case... no, these clocks are not board-specific for two reasons:
>> 1. AFAIK, these fixed clock outputs are from the SoC itself, not from
>>      external components placed on the board, and
> 
> This would be fine.
> 
>> 2. Even if these were from external components, the SoC *needs* these
>>      ones to work and any board that doesn't have these fixed XOs simply
>>      wouldn't be able to work.
> 
> This is common pattern and Mediatek is not different here. In all cases
> these are needed by SoC and in (almost?) all cases these should be
> provided by board DTS. The DTS describes here the hardware, the board
> has the clock thus the board DTS should define it.
> 

Right. If external components are strictly necessary, physically, they're
still external components and not inside of the SoC, and anything external
*may* change depending on the (hardware) implementation.

Anyway - I was wondering if splitting this change in two commits would be
better to let people understand what's going on... probably it would, as
that would clearly show both the addition of the 32K/26M clocks and the
subsequent removal of the other two: I would at this point do that, what
do you think?

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
