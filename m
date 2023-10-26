Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41171C25B6B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 08:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tpflp7nolFCRkF6qs8WLhfgANMxdKFrl9BlFaj/VsGA=; b=MqNyx7qnQOC5shLhMrEonZka6L
	q159h0FrBStunhLtnCdEfpFsYuC4kCBCSlWq62V6uhd3kxwP7ggJgGqmQkHPQpR1PNWSHfbmtSskQ
	sBv4oyY0v0cybtFBxgHlpSFvdK3VMTlkkVYXWIvoAvVr81tTUfXbdBYQx+tZ9idfAPakGl13xocq8
	mo/pHy19nFpkMbYt7V1t6W0DLjO+IJqVVHIhrSwK16iNsYxto3ROCv/7LetdMa5tPxkDgavjzC7jf
	LUpftl9+wSZms08YVeogQpQWx4TSxk1Bg1GyG8ZYvBbWjoHVKvSSZGgHR3C0lf2njAECcWCH+dYi3
	o6PZ+3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvfj-00Dwmo-0y;
	Thu, 26 Oct 2023 08:24:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvfe-00Dwlv-2I;
	Thu, 26 Oct 2023 08:24:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 991F6660737B;
	Thu, 26 Oct 2023 09:24:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698308689;
	bh=xFr+dcF//FmM0tUjLIKhS6D6UUL0Ug+PSZV1DwTl5/A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eNTBdOIMSW9ZNkW1K86v8hoE1kbJkzrak/LxbVXkK8x2H42pJzu0f8XO98dwr6x46
	 unD18Ed+z4bw+tq2jHMLrNwqyDUy4UMGl/K/yR8296Yg7NV7+LW5rZkytBYgZAengt
	 XWYj508wsiPDvgZACKzoRJWfmtLDXAvb+HEDLSlOn6mGt3KL+3vrvF48qCmApBqqx1
	 ce5Q8KK4s3R58jhCcPH6kUeGGnF47uC1P3XMazItcQJwb/i+AFdk+xZMt8Xtc2AaP3
	 kdAdVC5lYWAkYKVJq5bXOo+lbx4Ud2mxpqq6edP5wP20RPQjFvmofUsIAXPDfDxHqP
	 O0HK55irXi4pw==
Message-ID: <32d51e40-5d9c-47dd-bb62-2ccc811ac6dc@collabora.com>
Date: Thu, 26 Oct 2023 10:24:45 +0200
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
 <eb4f7d6e-0e4c-4b2d-b889-cad9fc9262d8@collabora.com>
 <1a734157709adc0cd85e084174bb4889301f1c1a.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1a734157709adc0cd85e084174bb4889301f1c1a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_012451_012576_4BDB40BC 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 26/10/23 05:49, Yu-chang Lee (李禹璋) ha scritto:
> On Wed, 2023-10-25 at 13:29 +0200, AngeloGioacchino Del Regno wrote:
>> Il 25/10/23 11:50, Yu-chang Lee (李禹璋) ha scritto:
>>> On Tue, 2023-10-24 at 17:20 +0800, Chen-Yu Tsai wrote:
>>>>    	
>>>> External email : Please do not click links or open attachments
>>>> until
>>>> you have verified the sender or the content.
>>>>    On Tue, Oct 24, 2023 at 3:47 PM Yu-chang Lee (李禹璋)
>>>> <Yu-chang.Lee@mediatek.com> wrote:
>>>>>
>>>>> On Tue, 2023-10-24 at 10:58 +0800, Chen-Yu Tsai wrote:
>>>>>> On Tue, Oct 24, 2023 at 10:52 AM Stephen Boyd <
>>>>>> sboyd@kernel.org>
>>>>>> wrote:
>>>>>>>
>>>>>>> Quoting Chen-Yu Tsai (2023-10-19 22:06:35)
>>>>>>>> On Thu, Oct 19, 2023 at 8:49 PM AngeloGioacchino Del
>>>>>>>> Regno
>>>>>>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>>>>>>
>>>>>>>>> Fix the parenting of clocks
>>>>>>>>> imp_iic_wrap_ap_clock_i2c{4-6},
>>>>
>>>> as
>>>>>>>>> those
>>>>>>>>> are effectively parented to infra_ao_i2c{4-6} and not
>>>>>>>>> to
>>>>
>>>> the
>>>>>>>>> I2C_AP.
>>>>>>>>> This permits the correct (and full) enablement and
>>>>
>>>> disablement
>>>>>>>>> of the
>>>>>>>>> I2C4, I2C5 and I2C6 bus clocks, satisfying the whole
>>>>>>>>> clock
>>>>
>>>> tree
>>>>>>>>> of
>>>>>>>>> those.
>>>>>>>>>
>>>>>>>>> As an example, when requesting to enable
>>>>>>>>> imp_iic_wrap_ap_clock_i2c4:
>>>>>>>>>
>>>>>>>>> Before: infra_ao_i2c_ap -> imp_iic_wrap_ap_clock_i2c4
>>>>>>>>> After:  infra_ao_i2c_ap -> infra_ao_i2c4 ->
>>>>>>>>> imp_iic_wrap_ap_clock_i2c4
>>>>>>>>>
>>>>>>>>> Fixes: 66cd0b4b0ce5 ("clk: mediatek: Add MT8186 imp i2c
>>>>
>>>> wrapper
>>>>>>>>> clock support")
>>>>>>>>> Signed-off-by: AngeloGioacchino Del Regno <
>>>>>>>>> angelogioacchino.delregno@collabora.com>
>>>>>>>>
>>>>>>>> I'm curious about what led to discovering this error?
>>>>>>>>
>>>>>>>
>>>>>>> Is that an acked-by?
>>>>>>
>>>>>> MediaTek engineers are saying the original code already
>>>>>> matches
>>>>
>>>> the
>>>>>> documentation provided by their hardware engineers. I'm
>>>>>> trying to
>>>>
>>>> get
>>>>>> them to respond on the mailing list.
>>>>>>
>>>>>> ChenYu
>>>>>>
>>>>>
>>>>> After checking with I2C clock hardware designer there is no
>>>>> infra_ao_i2c{4-6} clock gate in between. And the clock document
>>>>> at
>>>>
>>>> hand
>>>>> aslo shows the same result. Generallly speaking, we would like
>>>>> to
>>>>
>>>> keep
>>>>> sw setting align with the hardware design document. I would
>>>>
>>>> recommand
>>>>> not to change this part of code, but enable infra_ao_i2c{4-6}
>>>>> prior
>>>>
>>>> to
>>>>> the usage of imp_iic_wrap_ap_clock_i2c clock.
>>>>
>>>> Are infra_ao_i2c{4-6} actually used by the hardware? If so, for
>>>> what
>>>> purpose?
>>>
>>> According to hardware designer it servers no purpose. Just a legacy
>>> of
>>> previous design...
>>>
>>>> If it is actually needed by the hardware and it is not in the
>>>> existing path,
>>>> then it needs to be described in the device tree and handled by
>>>> the
>>>> driver.
>>>>
>>>> ChenYu
>>>
>>> After reviewing hardware design diagram, hardware designer
>>> concludes
>>> that the clock tree is indeed
>>>
>>> top_i2c -> infra_ao_i2c{4-6}
>>> top_i2c -> infra_ao_i2c_ap -> imp_iic_wrap_ap_clock_i2c{4-6}
>>>
>>> so I think we should keep this clock relation unchanged.
>>>
>>> Thanks
>>> YuChang
>>>
>>
>> Can you please also expand on CLK_INFRA_AO_I2C{1,2,5}_ARBITER clocks?
>> Is the I2C arbiter also legacy of previous designs?
>>
>> Please check [1], as I've sent a commit adding those in the
>> devicetree.
>>
>> Thanks,
>> Angelo
>>
>> [1]:
>>
> https://lore.kernel.org/all/20231020075540.15191-1-angelogioacchino.delregno@collabora.com/
> 
> According to Hardware designer this arbiter clock is also lagecy of
> previous design and serve no function. And they are conneted to top_i2c
> as well.
> 
> top_i2c-> CLK_INFRA_AO_I2C{1,2,5}_ARBITER
> 
> Also may I know the experiment that lead to the conclusion that you
> need the ARBITER clock, and the clock tree is incorrect? I will bring
> it back to discuss with our I2C owner.
> 

I had lockups during boot and PM suspend/resume, plus, I was getting issues with
losing trackpad functionality; adding the arbiter clocks fixed the issue.

Regards,
Angelo


