Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4878C25B47
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 11:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBlzUDe7molAlnbmIJNhUZ2nKO3s8gbkzApjpS3+tys=; b=GT2bX9CuEbDkXxb6Y8Dlig4Rhd
	KsdmW5fwlJrafMY46IlAREmF4pFupQnMyOQKp66S113KjHnfqCKUq5EbLpyBGPjlVRYV9pWIDVG05
	+4J5K5FQ3wogvWbBmofniotifzmYVmmTty3qE57/Er2wtiayXgipDsKOMgVDtA0scIYmp7PmKbKhZ
	ge1XN1CFuFCDVt456sz3qtMIJhIFG19ZTk/RLZZBqXWrZw0QssYl7IQQ6oXckdVTycv5IrjuJy6nN
	oFmLXjE5Qv79UakvLjU+LAta2V4tt/dPh7LG0yrEtb5BloxR8GKahsWKw5+bLz3BXKZhMqF+FiZDy
	kI2lPrEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvc4X-00CBbV-2W;
	Wed, 25 Oct 2023 11:29:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvc4U-00CBZb-10;
	Wed, 25 Oct 2023 11:29:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 34B9766071C9;
	Wed, 25 Oct 2023 12:29:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698233348;
	bh=YcIUG+bFG3gCP/KGT755SKLbRpNGiug2TGJ8Qy80gUA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aAfy4Taoi7eEhWJhC0q5SXJZ6OWE+V4gv4d7aT6Ge/Roi5iW8GZvhJzVM0rO7hjtb
	 JtZPD7oPTYddIwZ7+EhBn/b/D48b/05qyX8kI3vVAtRtbn3ZZFKzMlWRcETrqmJeHq
	 M/ZqnMeOWCOmdNxN+4wVA7NuYugeYveW/TmbkoibFU3D675qvpeTK6VFQiAr/58jl4
	 Yq2+v8bEWgufMNBSdpIE3L2qUQrnu5pLz7E5NnZEGZuocWpcQwprwrv2oOM7s049La
	 240tPMxBQPDCROAJZNkUxnlXE1oVjlOTTtKT//ea/3D6mKtMBis43FF20Uh7hoRNt8
	 7wyGG/inj3fEQ==
Message-ID: <eb4f7d6e-0e4c-4b2d-b889-cad9fc9262d8@collabora.com>
Date: Wed, 25 Oct 2023 13:29:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt8186: Change I2C 4/5/6 ap clocks parent
 to infra
Content-Language: en-US
To: =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?Q2h1bi1KaWUgQ2hlbiAo6Zmz5rWa5qGAKQ==?=
 <Chun-Jie.Chen@mediatek.com>, =?UTF-8?B?TWlsZXMgQ2hlbiAo6Zmz5rCR5qi6KQ==?=
 <Miles.Chen@mediatek.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20231019124914.13545-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5H0rUajeU-i8nYyV2xWFQTnzqxioZCCyyP_RZXKqmcugQ@mail.gmail.com>
 <283d18028590d57025e5654d18b8b5b7.sboyd@kernel.org>
 <CAGXv+5EpBLnXVdxnk9wBZi5F7U5wdJRfYH7fgg4Lkr1HJXm+WA@mail.gmail.com>
 <9c1e10b56db315e03daa3df5918cde844297c680.camel@mediatek.com>
 <CAGXv+5HQ2sVx=F3my2jOGMw3j3pU2aarEg+Dj1XgNzwio98ezA@mail.gmail.com>
 <e049985de9da9958ba425824ab5f38c7cf41025b.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e049985de9da9958ba425824ab5f38c7cf41025b.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_042910_640323_120120F9 
X-CRM114-Status: GOOD (  22.94  )
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

Il 25/10/23 11:50, Yu-chang Lee (李禹璋) ha scritto:
> On Tue, 2023-10-24 at 17:20 +0800, Chen-Yu Tsai wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   On Tue, Oct 24, 2023 at 3:47 PM Yu-chang Lee (李禹璋)
>> <Yu-chang.Lee@mediatek.com> wrote:
>>>
>>> On Tue, 2023-10-24 at 10:58 +0800, Chen-Yu Tsai wrote:
>>>> On Tue, Oct 24, 2023 at 10:52 AM Stephen Boyd <sboyd@kernel.org>
>>>> wrote:
>>>>>
>>>>> Quoting Chen-Yu Tsai (2023-10-19 22:06:35)
>>>>>> On Thu, Oct 19, 2023 at 8:49 PM AngeloGioacchino Del Regno
>>>>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>>>>
>>>>>>> Fix the parenting of clocks imp_iic_wrap_ap_clock_i2c{4-6},
>> as
>>>>>>> those
>>>>>>> are effectively parented to infra_ao_i2c{4-6} and not to
>> the
>>>>>>> I2C_AP.
>>>>>>> This permits the correct (and full) enablement and
>> disablement
>>>>>>> of the
>>>>>>> I2C4, I2C5 and I2C6 bus clocks, satisfying the whole clock
>> tree
>>>>>>> of
>>>>>>> those.
>>>>>>>
>>>>>>> As an example, when requesting to enable
>>>>>>> imp_iic_wrap_ap_clock_i2c4:
>>>>>>>
>>>>>>> Before: infra_ao_i2c_ap -> imp_iic_wrap_ap_clock_i2c4
>>>>>>> After:  infra_ao_i2c_ap -> infra_ao_i2c4 ->
>>>>>>> imp_iic_wrap_ap_clock_i2c4
>>>>>>>
>>>>>>> Fixes: 66cd0b4b0ce5 ("clk: mediatek: Add MT8186 imp i2c
>> wrapper
>>>>>>> clock support")
>>>>>>> Signed-off-by: AngeloGioacchino Del Regno <
>>>>>>> angelogioacchino.delregno@collabora.com>
>>>>>>
>>>>>> I'm curious about what led to discovering this error?
>>>>>>
>>>>>
>>>>> Is that an acked-by?
>>>>
>>>> MediaTek engineers are saying the original code already matches
>> the
>>>> documentation provided by their hardware engineers. I'm trying to
>> get
>>>> them to respond on the mailing list.
>>>>
>>>> ChenYu
>>>>
>>> After checking with I2C clock hardware designer there is no
>>> infra_ao_i2c{4-6} clock gate in between. And the clock document at
>> hand
>>> aslo shows the same result. Generallly speaking, we would like to
>> keep
>>> sw setting align with the hardware design document. I would
>> recommand
>>> not to change this part of code, but enable infra_ao_i2c{4-6} prior
>> to
>>> the usage of imp_iic_wrap_ap_clock_i2c clock.
>>
>> Are infra_ao_i2c{4-6} actually used by the hardware? If so, for what
>> purpose?
> 
> According to hardware designer it servers no purpose. Just a legacy of
> previous design...
> 
>> If it is actually needed by the hardware and it is not in the
>> existing path,
>> then it needs to be described in the device tree and handled by the
>> driver.
>>
>> ChenYu
> 
> After reviewing hardware design diagram, hardware designer concludes
> that the clock tree is indeed
> 
> top_i2c -> infra_ao_i2c{4-6}
> top_i2c -> infra_ao_i2c_ap -> imp_iic_wrap_ap_clock_i2c{4-6}
> 
> so I think we should keep this clock relation unchanged.
> 
> Thanks
> YuChang
> 

Can you please also expand on CLK_INFRA_AO_I2C{1,2,5}_ARBITER clocks?
Is the I2C arbiter also legacy of previous designs?

Please check [1], as I've sent a commit adding those in the devicetree.

Thanks,
Angelo

[1]: 
https://lore.kernel.org/all/20231020075540.15191-1-angelogioacchino.delregno@collabora.com/

