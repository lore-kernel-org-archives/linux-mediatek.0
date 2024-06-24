Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D5CC2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 11:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJfms8bBWpPvpzkfegQLdg1YyZRcV9AsM7OlSghDxgs=; b=A1jw20GrIURgnBLXA2LPPp/5UA
	ANZUl0o0Gky9AIabwUqfNKj1/e2MdG/ONqE9b72lHqyakuWViJymhU5qVIXsXm5JBoBCGTwNPjcsJ
	q0LJZ05KvccP5YnN5+4KGQZ0VhVTI+Xm2iXxBkV5/r6DDv3MiMGuWhvcn7PT1qL+V2/mfVMpwYL5c
	4dgIskPsSuOAu/hw+eanboEzra4YIojrUcGg/R6+Cs7GGCFCLJghMX6tP0JRfIo1gHFpG9YRmLADX
	M5Nm18iRRL7fKbjKyUZHDnsbelKm+Wyx2cBbUakJo1NYd9MNwXZcgT8wct7XW7bm4jZURCqRnMCRS
	UwWLkFeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhsv-0000000GbUw-1OKI;
	Mon, 24 Jun 2024 11:29:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhsq-0000000GbSz-1umL;
	Mon, 24 Jun 2024 11:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719228554;
	bh=hTxLy8mO7Anc77JfGNkN5gSzBb+4yPjURLOhsckT0Vc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V+3exPVo3fN28ivEtBAzZHG6zdNKfQzCR16LvupCem+0C9ynGEJ5dJ6Dn3/J9ekX9
	 bYhYB5oim5Yx7yL1CO+Tse7c7WK97VjoiOkXnY9zfrRHrl/gMMA+4+IMNL1jzTzLC2
	 YCi1Byh5ng8vkHKnsBHoAypLduDwNWasR20qs5pTmnZJu0U8pt8PbjaVcH0zzpGUoD
	 gc/ECsw934Tv+8/XMRANn7oAP2YPcLTNSJD4QbVeu3jXUV0GaxpR2FOuxEWwD3iy0O
	 sHD9UIi9PX1700bRnkFYgTWrsh7Ydym2zmmiQVZLhFE52sT3JDHUlvvD25QzvHt/GY
	 9QdSp7Dv1DD4A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3870C37804C6;
	Mon, 24 Jun 2024 11:29:14 +0000 (UTC)
Message-ID: <4e5d4362-4940-4ba0-95aa-627b82e21e41@collabora.com>
Date: Mon, 24 Jun 2024 13:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to
 mbox_chan_ops API
To: Jassi Brar <jassisinghbrar@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
 <20240614040133.24967-3-jason-jh.lin@mediatek.com>
 <CABb+yY2bwj2BcdJLGe1ZYwCrnXL3LtcePMb=wQPaBKorBSs2yA@mail.gmail.com>
 <fc92d51cc6e55301c081ea2d589e1ba6cdd295ee.camel@mediatek.com>
 <CABb+yY1L+YGjf6O9UgPYkS2gWAdo=7QoojSAUNWC_8o7XtZQSg@mail.gmail.com>
 <1f815ff8-2b7a-48de-8b47-0bc9b3cb67ab@collabora.com>
 <CABb+yY1Yy8o3ofAiC-uV+gDrO3QDTWz3_XTUMai_2uyrnj-VrQ@mail.gmail.com>
 <b7ebc021d391452eaf2149976ea2d53fba3d89fc.camel@mediatek.com>
 <CABb+yY3+pnuXDK_jZMDYOAzahdSZ5iig51VqzM=FFHrFpK+9LA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CABb+yY3+pnuXDK_jZMDYOAzahdSZ5iig51VqzM=FFHrFpK+9LA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_042916_651901_7457F2ED 
X-CRM114-Status: GOOD (  21.03  )
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

Il 20/06/24 16:39, Jassi Brar ha scritto:
> On Thu, Jun 20, 2024 at 1:33 AM Jason-JH Lin (林睿祥)
> <Jason-JH.Lin@mediatek.com> wrote:
>>
>> On Wed, 2024-06-19 at 10:38 -0500, Jassi Brar wrote:
>>>
>>> External email : Please do not click links or open attachments until
>>> you have verified the sender or the content.
>>>   On Wed, Jun 19, 2024 at 3:18 AM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>> Il 18/06/24 17:59, Jassi Brar ha scritto:
>>> .....
>>>
>>>> For example, when static content is displayed on screen, the CMDQ
>>> mailbox never
>>>> gets shut down, but no communication happens for a relatively long
>>> time; the
>>>> overhead of actually shutting down the mailbox and setting it back
>>> up would be
>>>> increasing latency in an unacceptable manner.
>>>>
>>> Hmm...  in your driver,  startup() is _empty_   and  shutdown() is
>>> all
>>> under a spin-lock with irqs disabled, so that too shouldn't be
>>> expensive. Right?
>>> Then what causes unacceptable latencies?
>>>
>>
>> I found that the BUG report only occurred when opening the camera APP.
>> Maybe something in imgsys_cmdq_sendtask() is too expensive or somewhere
>> else in imgsys driver.
>>
> If you move anything from submit() into startup(), which is once per
> lifetime of a channel, it will only make imgsys_cmdq_sendtask()
> cheaper.
> Btw, the imgsys code is not public, I don't know how it looks.
> 
> 
>> I'm wondering why this BUG report is not occurred in display use case
>> which is more frequent than imgsys use case.
>> Does this mean sleep() is not always called in pm_runtime_get_sync()
>> and if we can guarantee this sleep() won't be called, then using
>> pm_runtime_get_sync() in atomic context is OK?
>>
> Instead of hacking around, maybe try using startup() and shutdown()
> which is for such uses? Maybe request/release channel as part of RPM
> in your client driver if you are worried about the noise?
> 
> 
>>>> This is why I opted for autosuspend - it's only bringing down
>>> certain clocks for
>>>> the CMDQ HW, adding up a bit of power saving to the mix which, for
>>> some use cases
>>>> such as mobile devices with relatively small batteries, is
>>> definitely important.
>>>>
>>>> I'll also briefly (and only briefly) mention that 120Hz displays
>>> are already a
>>>> common thing and in this case the gap between TX and ACK is ~8.33ms
>>> instead, let
>>>> alone that displays with a framerate of more than 120Hz also do
>>> exist even though
>>>> they're less common.
>>>>
>>> I don't know how even busier channels help your point.
>>>
>>>> All of the above describes a few of the reasons why autosuspend is
>>> a good choice
>>>> here, instead of a shutdown->startup flow.
>>>> And again - I can place some bets that PM would also be applicable
>>> to SoCs from
>>>> other vendors as well, with most probably different benefits (but
>>> still with some
>>>> power related benefits!) compared to MediaTek.
>>
>> I agree with Angelo's point!
>>
> Ok, but you or Angelo still don't explain "unacceptable latencies"
> when your startup() and shutdown() are empty. You just want api
> changed, which we can but at least do you part and tell me where the
> bottleneck (unexpected latency) comes from.
> 

"I want numbers" is a sensible request, honestly I would do the same so I totally
understand that.

Jason, can you please perform latency measurements on 60Hz and *especially* ISP/cam
cases while "continuously" calling startup() and shutdown() for every power saving
operation?


Thanks,
Angelo

