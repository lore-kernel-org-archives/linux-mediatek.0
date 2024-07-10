Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E686BC3DA41
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 12:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atC9bpx1ZQqA8NkDeiUtUd1QALLXKoSInb5BB3D/dy4=; b=Q661cuIXRLLwkV+vhLYb7r8viJ
	tgMlb8Z5yc2o0PYwlc9OQcbLMk2uwcFMwHWtQBNABBvDPnws9rviALnzleqDnbyD18E6OWXFqweAU
	VGpp+In/y6IF7VpcXDeHvMojC40kFXZRZrAYj6JD9fk2GJlcqC7PznIMf/zpOII2YV8qjPY5z+9Kb
	9jO8gWFn6kr2bFpZsuggthT9gW4AyR4JJokr78xEb/57mjzlNMkrcxThHcQ2Bbb+kc+NW1LwxNbO7
	qUFhBIVA8jEQsXhlcSfTJ0hicQ3ku3gcVZNTo4mlbakmPRlxfcFrPDay1kKvpsCZRJNpLaAj+k5HT
	1MVEGAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWmm-0000000AY2G-02AG;
	Wed, 10 Jul 2024 12:51:04 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWmT-0000000AXwU-2D9r;
	Wed, 10 Jul 2024 12:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720615844;
	bh=sPxM8NaCsBvhlryktLPvPiUn7nj8vj/D3dzAifCOTmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U3krA5jBxVGjqTr4jjxuUNvlDgil7oP64q+KUqpJGEUP6+i1DMqZFNTgCHA14mqdx
	 J5JZfEIQpi5VJYQUy69C3lWEaSVpab/097nZMmDl3ao9akZTBLsGtxcicNpKqehAKT
	 asRnUAx+ysAr1FMXjKaX82z8pzzBE1tw7CdkqVsUt23rvqLRvO6v17QbYUSw/8ikbL
	 gY7Cey1BX+s4I/0VkXwIfsQq0nh8Fo0BRiFehRHAQiHXD8MfMa6vZK+H3OMDDGbKn0
	 knas+p3BJQZTxZK2ijQwlNZb6h37Ivo7P9jbduNRF1bXY8MFZ1QnqO6IagcLKVw99s
	 vWrQ0q2hu9SCA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 304093780029;
	Wed, 10 Jul 2024 12:50:43 +0000 (UTC)
Message-ID: <23369ea1-12d2-4386-a8ac-431620b75e2e@collabora.com>
Date: Wed, 10 Jul 2024 14:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: [PATCH v1 0/4] add syscon requirement for mt7988
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Golle <daniel@makrotopia.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20240709101328.102969-1-linux@fw-web.de>
 <126053ef-3bfb-47c2-aa17-eb1d26d99102@collabora.com>
 <trinity-93a5ed81-b890-4d49-bfec-1bbb1219cb65-1720611282583@3c-app-gmx-bs04>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <trinity-93a5ed81-b890-4d49-bfec-1bbb1219cb65-1720611282583@3c-app-gmx-bs04>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_055045_734289_9579DBA1 
X-CRM114-Status: GOOD (  20.86  )
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

Il 10/07/24 13:34, Frank Wunderlich ha scritto:
> Hi
> 
>> Gesendet: Mittwoch, 10. Juli 2024 um 12:45 Uhr
>> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
>> Betreff: Re: [PATCH v1 0/4] add syscon requirement for mt7988
>>
>> Il 09/07/24 12:13, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Some nodes require the syscon fallback at least in u-boot when using
>>> OF_UPSTREAM.
>>>
>>> This is because uboot driver uses syscon_node_to_regmap in mtk_eth.c for
>>> "mediatek,toprgu", "mediatek,xfi_pll" and reset pointing to watchdog-node.
>>>
>>
>> I wonder what's the major blocker here to modify the u-boot driver to take
>> the upstream devicetree as-is, instead of using syscon_node_to_regmap?
> 
> in uboot there is no driver for all syscon and to handle parallel access this is done with the syscon fallback.
> 
> The syscon uclass is a small driver which is generic and only handle the regmap in global context.
> 
> In theory it could be possible that regmap is aquired twice when used from 2+ other drivers...to prevent this without
> adding the syscon fallback each syscon needs a dedicated driver like in linux which does only syscon stuff (code
> duplication at its best :) ).
> 
> of course i can use regmap_init_mem in the uboot ethernet driver
> 
> https://elixir.bootlin.com/u-boot/latest/source/drivers/core/regmap.c#L242
> 
> like it's done once for syscon-uclass.
> 
> but i will cause issues when a second device tries to access this regmap. So it was be much easier (for me) to add this
> fallback and not writing 3 device-drivers in uboot doing the exactly same as syscon.
> 
> if you have a better idea how to handle it, let me know :)
> 

I see. The problem is that, from your description, it looks like u-boot
uses that as a kind of workaround for concurrent access to MMIO...

...looks like a good topic to discuss in the u-boot mailing lists.

Definitely, the TOPRGU and the XFI PLL are not system controllers, so the actual
"syscon" definition would be wrong for these, that's it.

Cheers

> regards Frank
> 
>> Regards,
>> Angelo
> 




