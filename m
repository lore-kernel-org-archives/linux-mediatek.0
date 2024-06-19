Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9C6C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9PKKylfRBuzRvuUiF1zKICvSEqxHX59AEwlzsBgY+w=; b=eYeLCMhknUIUNFqE5xBGdJZnjA
	3a2aLCPrCNfW9G/SpisXOKpvtmnY3TquWB/MvlKxMQQHAjRaGZZrFwnQxLOn9QQPk/aAEzJMJijvz
	G64mtAcfezxLKwcy3HgtKTTZkEdK/5tAri4XkTj1o1vQBluMcZNzKXTD30bOpee1VgGI5/BNnGvhK
	u2/FIAqVa+UBso1IvK1RrcnhI/q92/vXW3XlvSYjmbRAYbmVhrX2DTJuhPknoUVAQ0sF/zmHp9u0J
	2yxe40xwIq4N77EIfNhmPHDg8yCByNj7gJLa9CU1EMMGjLmbeudepmSUg44OYVFv/g6er/ech8tKE
	PB42ag4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJqWv-00000000MNl-0V0H;
	Wed, 19 Jun 2024 08:18:57 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJqWr-00000000MMb-403G;
	Wed, 19 Jun 2024 08:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718785132;
	bh=oYlLSyjsTtd58Hpnqjjem769849ygCKg/WUYhs0fxjo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n3CsIwOQjzqur/lgnMMCJeWF+WdN7WWBQdSJM8x/5Mm4LAA9KuedLEeHCp9xp8JUH
	 lqBdEj531tJ8zD2SsMwBImswIEk8+3/xWMhKwsaPkzfBUCLl6tLyaG4phf3YZTteo4
	 pnPU7NwMTN3Y6ieN7XAaTXGLeWr3Izry9Om11ilgSCcWKY6ADOA0Xhqir9EULW1O5m
	 AF9aRF5CxSb+JcvLah2zSgosdnFd5mE1djnyMHXYwV1N8ISAO6ylVU0N+/AFlpB6tR
	 p/s+kX5KFQ1h6sTDK9z1Lsv9Io23Wvn8ZwbHRcxV0L95xski/bi4vQrJ6w03SnXEGv
	 d4g9I+9g8/dLw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 704B43782176;
	Wed, 19 Jun 2024 08:18:51 +0000 (UTC)
Message-ID: <1f815ff8-2b7a-48de-8b47-0bc9b3cb67ab@collabora.com>
Date: Wed, 19 Jun 2024 10:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to
 mbox_chan_ops API
To: Jassi Brar <jassisinghbrar@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CABb+yY1L+YGjf6O9UgPYkS2gWAdo=7QoojSAUNWC_8o7XtZQSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_011854_170547_89E45C70 
X-CRM114-Status: GOOD (  20.69  )
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

Il 18/06/24 17:59, Jassi Brar ha scritto:
> On Tue, Jun 18, 2024 at 3:42 AM Jason-JH Lin (林睿祥)
> <Jason-JH.Lin@mediatek.com> wrote:
>>
>> On Mon, 2024-06-17 at 13:18 -0500, Jassi Brar wrote:
>>>
> ......
> 
>>> As in, how often and long are the "channel idle" periods? And when
>>> active, how many transfers/sec ?
>> Is there any debug logs in mailbox can measure this?
>>
>> This mailbox channel is use to configure display hardware in every
>> VSYNC, so the channel idle periods may be less than 16.66ms.
>>
>> It should call rx_callback() before VACTIVE, but sometimes it will be
>> dropped by mbox_flush() if the new message is coming.
>>
>>> I see every TX is acked by one RX packet. How long is the typical gap
>>> between a TX and its ack?
>>
>> Typical gap between a TX and its ack is less than 16.66ms.
>>
> So basically the usecase is driving some display at 60Hz. And I
> believe the display is driven
> continuously for at least some minutes ?
> If so, RPM between xfers is not really in effect because the
> autosuspend delay is 100ms while you
> get() it every 16.66ms. So all that is happening is some variables
> changed under a spinlock.
> I think you should consider get/put RPM in cmdq_mbox_startup() and
> cmdq_mbox_shutdown().
> 
> Thanks

With at least MediaTek (but surely more than just mtk), a system that is idling
while having display ON doesn't mean that the display is continuously refreshed
by the CPU and with CMDQ messaging.

For example, when static content is displayed on screen, the CMDQ mailbox never
gets shut down, but no communication happens for a relatively long time; the
overhead of actually shutting down the mailbox and setting it back up would be
increasing latency in an unacceptable manner.

This is why I opted for autosuspend - it's only bringing down certain clocks for
the CMDQ HW, adding up a bit of power saving to the mix which, for some use cases
such as mobile devices with relatively small batteries, is definitely important.

I'll also briefly (and only briefly) mention that 120Hz displays are already a
common thing and in this case the gap between TX and ACK is ~8.33ms instead, let
alone that displays with a framerate of more than 120Hz also do exist even though
they're less common.

All of the above describes a few of the reasons why autosuspend is a good choice
here, instead of a shutdown->startup flow.
And again - I can place some bets that PM would also be applicable to SoCs from
other vendors as well, with most probably different benefits (but still with some
power related benefits!) compared to MediaTek.

....And that's the reason why I think that implementing a way to cleanly perform
this kind-of-aggressive power management in mailboxes is something that needs to
be done.

Cheers,
Angelo

