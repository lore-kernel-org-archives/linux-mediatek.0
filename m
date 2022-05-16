Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB76C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 11:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLrQAkT1HoSZKjrMxbn31KyBbS2qlOUas7osPWdEsX4=; b=LW9TMvJ2dFmXn3
	yF0ZnhIsT9DoaBmscDXK31QT9C/fFTFl22zJWCPvKfJ7f2uyfnQRz7O/V5G1Ii97/u+HuUYL9yWbf
	5pfyme0vceHA4QfOU5ZuS9KVzbA7I3Nkwx56tQZE3Hlp+prF2wBO0SSOpfCzrO2uEXpY48r0/1e9+
	QJ+Q4ZOYhRjXiXqkct9JZzI2qQxiAvfjmFsN/T1nj+P87ns9uIGEotcShulD7zMFDHhjZUHaQVFlL
	kF+ZLESnDSiK33CC21RYOMpuQm4FHEq5SmTYANrVzhd/ZlfNpKAFCJ5MDQZ763pJGvYp/cTrkR++V
	WBxfg+ghndX8sIf1TAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqYZ5-007ETM-O7; Mon, 16 May 2022 11:07:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqYYu-007ES3-Bn; Mon, 16 May 2022 11:06:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 185B01F42BC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652699207;
 bh=cuIpTwvM6Wp6EPsCrNGnkRiHx0Cg+OXQRwrHe5I0Obo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VWKf1M6Z3XGlPerCoCGieGG0m47NRZp43NpK9jLnuhMEV2hgS7F2ItS22PN0kHSFw
 Pgj2LvvXGB2mkwug2qo196Rbv1hfSZFvl3e+Vk6uGTJAfknrDNPGXmA8rnHESHnF4m
 i2gjcv+59r9XJK3EyCdfnYjs2kLGZybX2DRCs3g4xZLBKIuM7KS+qRS7Yqxl26HsYH
 NAao8JteBAXK+xMf2V+dYRNMlzAGYVo40EtmMezAlm9bsJTbTIFPLR2Tq2MAOn4MMT
 fZAkAi6kN02ER+4dlJKOPTkSl3Cw4ypxvEcHdcTAzA+IBPg1lrOeox2lqgs6P9UXD9
 PK9bZGs6t4sgw==
Message-ID: <4a7bcbfb-12da-0e3f-8732-ecc53046a4ff@collabora.com>
Date: Mon, 16 May 2022 13:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RESEND PATCH 1/2] Input: mt6779-keypad - fix hardware code
 mapping
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
 <20220513151845.2802795-2-mkorpershoek@baylibre.com>
 <YoHf6Z4HTfh4Y+bn@google.com> <874k1qkk7n.fsf@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <874k1qkk7n.fsf@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_040652_670420_66E6C1BF 
X-CRM114-Status: GOOD (  23.65  )
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

Il 16/05/22 09:30, Mattijs Korpershoek ha scritto:
> Hi Dmitry,
> 
> Thank you for your review,
> 
> On dim., mai 15, 2022 at 22:23, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
>> On Fri, May 13, 2022 at 05:18:44PM +0200, Mattijs Korpershoek wrote:
>>> In mt6779_keypad_irq_handler(), we
>>> 1. Read a hardware code from KPD_MEM1 -> KPD_MEM5
>>> 2. Use that hardware code to compute columns/rows for the standard
>>>     keyboard matrix.
>>>
>>> According to the (non-public) datasheet, the
>>> map between the hardware code and the cols/rows is:
>>>
>>>          |(0)  |(1)  |(2)
>>>      ----*-----*-----*-----
>>>          |     |     |
>>>          |(9)  |(10) |(11)
>>>      ----*-----*-----*-----
>>>          |     |     |
>>>          |(18) |(19) |(20)
>>>      ----*-----*-----*-----
>>>          |     |     |
>>>
>>> This brings us to another formula:
>>> -> row = code / 9;
>>> -> col = code % 3;
>>
>> What if there are more than 3 columns?
> That's not supported, in hardware, according to the datasheet.
> 
> The datasheet I have states that "The interface of MT6763 only supports
> 3*3 single or 2*2 double, but internal ASIC still detects keys in the
> manner of 8*8 single, and 3*3 double. The registers and key codes still
> follows the legacy naming".
> 
> Should I add another patch in this series to add that limitation in the
> probe? There are no checks done in the probe() right now.
> 

I've just checked a downstream kernel for MT6795 and that one looks like
being fully compatible with this driver as well... and as far as downstream
is concerned, apparently, mt6735, 6739, 6755, 6757, 6758, 6763, 6771, 6775
all have the same register layout and the downstream driver for these is
always the very same one...

...so, I don't think that there's currently any SoC that supports more than
three columns. Besides, a fast check shows that MT8195 also has the same.
At this point, I'd say that assuming that there are 3 columns, nor less, not
more, is just fine.

To stay on the safe side, though, perhaps add a comment explaining that
this driver works on that assumption? ..but that's clear, anyway, if you
actually read the code.

 From my perspective, this commit is good to go.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
