Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FF9C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcPr+nIc3ijL/Rb5Ba12S1Dt5ntJfABr9bBl6dDL1kI=; b=UZKTnv2sJrwt7i0P0J6vo1Xj35
	AJg5PpLgtWDQ6yGkr1U5qTCpv6pAYUmcHEfBhmxV220+g1+4qIiLNqkdch6okw0IA6BiPZTsflqzL
	+nUaZBj5wWjnnDotAyXZHPLjJFVprnp+DqOtLiXvFWvmVL2nrVs4lO6OHjT9UsIb7GwzZvUsBfdQf
	v6EHSxiTdZJUBTZFeUCwEWNEWTnNTzul5EfbO6BKDvqhGVh9Erc+761N1cY8m0E3uMSsfyLCAVwuB
	kMMHpcLKRI/I6cXPFqqifAV16nTKjq+Bb2inz0L9ECoZGV9Ccbti5+/DcxVbzZHFB5yxpo7XY7F/h
	WhDDud6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofJdG-005T9W-Sp; Mon, 03 Oct 2022 11:29:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofJd6-005T87-Ho; Mon, 03 Oct 2022 11:29:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C30BE6601F8A;
	Mon,  3 Oct 2022 12:28:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664796537;
	bh=a5oSX0ceJpHAh8O/8zS5a5WFF20/Wc0S1JUkk7Q60Uc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j6Zb8obh981BH2ZWyV2nXwoQFshP0kUo/hvK0kMKL509IYXvn1LSnOA6vVaccvzKn
	 zislmLYKBKSeAqSBZovh2CaPLkkqdaT5GLLAwlitTDz9Ltd56kR/qJ1wAEKsfDX/LX
	 8CA3rxjUt4ZLYcVQL75whDVnk4cGVs2v9lGDx+/yt157aQVZRGS7Fa0Cj/lqF+ln1Z
	 UBtbAeqrWrc6x1t+parm7XLfXq6i/tCM+du1J7dTFnpStRVb+OjMAPOl2+3Ygf67d6
	 XpwVKOFwOz7jhXKPs5U/pwhv26unBJE/WMJ7WKC2V+Ty9c25HkvGQ0YPQzzj6GGfUl
	 69TJO6kmEIaPQ==
Message-ID: <26ca8837-6cdd-2523-014d-8651ba48862a@collabora.com>
Date: Mon, 3 Oct 2022 13:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] reset: mediatek: Move mediatek system clock reset to
 reset folder
To: Stephen Boyd <sboyd@kernel.org>, Bo-Chen Chen <rex-bc.chen@mediatek.com>,
 matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de
Cc: runyang.chen@mediatek.com, miles.chen@mediatek.com, wenst@chromium.org,
 nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220929121031.17523-1-rex-bc.chen@mediatek.com>
 <17c5cc9c-50ea-aeac-04e0-20b6c093c7ec@collabora.com>
 <20220930185953.41810C433C1@smtp.kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220930185953.41810C433C1@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_042900_771880_C5A8B7E3 
X-CRM114-Status: GOOD (  20.56  )
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

Il 30/09/22 20:59, Stephen Boyd ha scritto:
> Quoting AngeloGioacchino Del Regno (2022-09-29 05:50:38)
>> I've just analyzed this idea a bit more, and there's the outcome.
>>
>> This driver would be fine, if some MediaTek SoCs weren't shipped with
>> a bootloader that supports only very small kernels... because then, if
>> the reset controller is not available at boot time, it's unlikely that
>> you can probe the eMMC or the uSD, so it won't be possible to actually
>> compile this driver as a module and load it afterwards.
>>
>> Please don't misunderstand me: I like the idea of having the MediaTek
>> SoC sysclk reset controller as a ... reset controller driver but, to
>> make that work, one fundamental issue must be solved...
>>
>> If the kernel is configured for, let's say, MT2701 and MT2712, we're
>> always building in reset controller support for MT7622, 7629, 8135, 8173,
>> 8183, 8186, 8192, 8195 - and this list will grow with MT8188, and others.
>>
>> Obviously, it's useless to have support for, say, MT7622, if the MT7622
>> system clock controllers aren't built-in, nor modules.
>>
>> So, to make this idea to work, we have to find a way to:
>> 1. Build in support only for the required SoC(s)
> 
> Use Kconfig
> 
>> 2. Put the reset index mapping arrays in SoC-specific files, or this
>>      single file driver will see an exponential growth.
> 
> Split the reset driver into different files compiled for different SoCs
> based on the SoC Kconfig made in step 1.
> 
>>
>> Wrapping it up - as the driver is right now - we're losing flexibility:
>> we need to maintain the current flexibility while keeping the improvements
>> that are made with this proposal.
>>
>> Ideas?
>>
> 
> It should work and your concerns are alleviated?

With this solution, my concerns are practically solved.

Regards,
Angelo

