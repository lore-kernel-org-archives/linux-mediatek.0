Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADB5C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 21:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yiqjm2GJKiAhMsjSwqVu0iOvQhZTBvR/aRJbtjvQRb0=; b=HX31FVjwPPDcJBK+uqIfbQyMCa
	I3iQlb6KI9Lcy8GvbhuA1JH+sMir883UwVF2GDnIWo/o2PpQqFUQkQPdmrF2Qt68P0iKxpimOCfhc
	gFA0BSQKafkyhf4c/ZmhWtosGHw04pbkwLFwLw2vQpD8YOfoFQFcVDZyHN94L02l8ZkG6TKgxGc28
	v6rXorqQd1e69C3T33G86jcQDmB9Jcojr/SmwiSz7pRuSBIALcdDOAzf6R2aDZceagdHHgssTQKLR
	3ttQ8pRaT6hskbDm6x5X5TC4YOJJ234fbh7Zz+HbR9ObK/jHUcF4w7wGASs6qhvjT0lRXR6AdLHz3
	Ihw29XSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXZK-00EylK-Pq; Thu, 05 Jan 2023 21:14:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUq8-00DUWS-Bi
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=Yiqjm2GJKiAhMsjSwqVu0iOvQhZTBvR/aRJbtjvQRb0=; b=Ntt7j/PTG7kMk9sFZ6MibVC6MB
	DYCh4iA3ZtW/tOXPQmxkO+AsoGgXlhe6Cwm5J0BrAOvUeERATBV/BEST+usk8Jb5jBRqGAlVbpuX0
	7xi/So1GnNmXSxtgliobk9St9JmbkRe+JZjiqCQjJo++Piq6OKZ3IqtfHYNfCGa2+bRsoFgL2cVLY
	w5E01WqIB3WnXhf+P9OVBYPdU48+lijNUs3eAQutiVeJ2zFPQZO3Gt+hneeKOFYJiuJeSnvsjJyam
	P3FedDeNsc+ZLS+eDhsgzKggp0K7D+fAJjwJLa17aopc0MUEsarCwJtPaP3/0F68nKCrJXR4Jz5v4
	ZBEoV8wQ==;
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDQOI-001LgB-1l
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 13:34:44 +0000
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pDQOK-0008QQ-H1; Thu, 05 Jan 2023 14:34:44 +0100
Message-ID: <1cbfec6f-1f93-379e-608e-17a0d904834d@leemhuis.info>
Date: Thu, 5 Jan 2023 14:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [BUG] 6.2-rc1 spi-mt65xx broken on mt7986
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
To: Ricardo Ribalda <ribalda@chromium.org>
References: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
 <24ef21b2-d1db-1525-7d3f-2c978e73c25b@leemhuis.info>
 <CANiDSCunU4dqiDgNr2mz=MxD+wzTu6V2vZWqY+AC4DqQvwVh4w@mail.gmail.com>
 <752823ee-1aec-7536-095d-6a018e1dd909@leemhuis.info>
In-Reply-To: <752823ee-1aec-7536-095d-6a018e1dd909@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672925688;7970e7fe;
X-HE-SMSGID: 1pDQOK-0008QQ-H1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_133442_775827_6826F795 
X-CRM114-Status: GOOD (  16.28  )
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
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mark Brown <broonie@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 05.01.23 13:59, Thorsten Leemhuis wrote:
> On 05.01.23 13:40, Ricardo Ribalda wrote:
>>
>> I replied on my phone, so the mail came out in html and the list did
>> not pick it up, then Frank also answered in html.
>>
>> I believe we are good with this:
>> https://lore.kernel.org/all/Y7WOlkuLaLt1DdY+@sirena.org.uk/
> 
> Ohh, that was the same issue? I had missed that (and it's pretty obvious
> when I look at it now :-/ ). Sorry for the noise then, but these things
> happen when dealing with so many different regressions.
> 
>> Thanks for headsup anyway
> 
> Many thx for clarifying!
> 
> #regzbot fix: spi: mediatek: Enable irq when pdata is ready

Sigh, seem I'm too stupid for proper copy'n'paste today and want to fix
it up now; sorry for the noise:

#regzbot fix: spi: mediatek: Enable irq before the spi registration

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

>> On Thu, 5 Jan 2023 at 13:21, Thorsten Leemhuis
>> <regressions@leemhuis.info> wrote:
>>>
>>> [CCing the regression mailing list, as it should be in the loop:
>>> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>>>
>>> On 27.12.22 11:28, Frank Wunderlich wrote:
>>>> Hi,
>>>>
>>>> the following commit breaks SPIM-NOR on mt7986:
>>>>
>>>> c6f7874687f7 2022-11-28 spi: mediatek: Enable irq when pdata is ready
>>>
>>> Ricardo, do you have this report on your radar? Just wondering, as it
>>> was posted a week ago and didn't even get a single reply afaics. This of
>>> course can happen at this time of the year, but I thought a quick status
>>> inquiry wouldn't hurt.
>>>
>>>>> [    2.145931] pc : mtk_spi_can_dma+0x0/0x34
>>>>> [    2.155212] lr : mtk_spi_interrupt+0x74/0x360
>>>>>
>>>>> [    2.091801] mtk-spi 1100a000.spi: spi-mem transfer timeout
>>>>> [    2.097310] spi-nor: probe of spi0.0 failed with error -110
>>>>> [    2.102930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000010
>>>>
>>>> after reverting the commit, no trace happens and nor is recognized on my board
>>>
>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>> --
>>> Everything you wanna know about Linux kernel regression tracking:
>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>> If I did something stupid, please tell me, as explained on that page.
>>>
>>> #regzbot poke
>>
>>
>>

