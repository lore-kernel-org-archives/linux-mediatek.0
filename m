Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A27CC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:52:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE4B604D7
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAE4B604D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMNwp97vr6wWEz54eA1AXhzcJAB4hPBRxisiEgLlKSs=; b=HN0N6Ao0ETCSob
	uXeewQHDh1EnkDAcmN9ZmDyjocPvUWayt7W9cLo6+wim7gQXnObFbpBeXyWTkE+iBeJ5NBXP5EyHk
	D4VBBv9bvDe8bezcHvQ1xtFWkUU5ml5I6ZoI1wtOfSQD+NXrpqJzjN3smodK1EjDOaX6ppK/8HlUM
	68kX4EOi0Gv9A7AX9ifxqHaQO3Lw7lXKrAkpJO0X14Ti6QSdrkUI80E2CeBjP20zBb2o6ae/+0TiP
	fiupkPAQvLF6nNu8do0HkplZ4DlR3nYxuDAjU0L2gruj1JxRjUzZJ9JMWu4owd7//GfqUyq6HpO3Z
	rVr6JR30kqNbWvoZ+meQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7wLY-00AIey-K5; Mon, 26 Jul 2021 08:52:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7wLV-00AIcr-P7; Mon, 26 Jul 2021 08:52:23 +0000
X-UUID: c5d1eb183d6a4ee181327f568b52bdb0-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ftaXOS/3o1K5e9QIw95Gptsd+LQrskymUwHdm4HqRmo=; 
 b=GbILj7WarPTCnRJlbYaiIMHV8CjxMqFun0YmUUCBKwrrKAEftW1VoaVllklV5x/SRq/lOHCiS4ZR0/f3mhycaw1eQz2I2CIO4OmGYDgjgbtqAtfWdfR2zolbuWtOus1daUlsX4ksjn2lNBiupW9z5MElO4uGhY/fkhpQEhKo5Bw=;
X-UUID: c5d1eb183d6a4ee181327f568b52bdb0-20210726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chihhao.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1897851360; Mon, 26 Jul 2021 01:52:17 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 01:42:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 16:42:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 16:42:14 +0800
Message-ID: <2db5d44b88ace1c25af4a45b3469a425fe1d81a5.camel@mediatek.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
From: chihhao chen <chihhao.chen@mediatek.com>
To: Geraldo Nascimento <geraldogabriel@gmail.com>, Takashi Iwai <tiwai@suse.de>
CC: <alsa-devel@alsa-project.org>, <wsd_upstream@mediatek.com>,
 <damien@zamaudio.com>, <tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Mon, 26 Jul 2021 16:42:14 +0800
In-Reply-To: <CAEsQvcumEDOKgUB6h2-im5QabhPfaSaU63RF8pegPt5ZCPx+Pw@mail.gmail.com>
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
 <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
 <s5hwnpehm7y.wl-tiwai@suse.de>
 <CAEsQvcumEDOKgUB6h2-im5QabhPfaSaU63RF8pegPt5ZCPx+Pw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_015221_859132_C49DFEC5 
X-CRM114-Status: GOOD (  36.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

Attach USB descriptor of clock source and selectior for this earphone.

AC Clock Source Descriptor:
------------------------------

Value	Valuename
0x08	bLength
0x24	bDescriptorType
0x0A	bDescriptorSubtype
0x09	bClockID
0x03	bmAttributes
0x07	bmControls
0x00	bAssocTerminal
0x00	iClockSource
Hex dump: 
0x08 0x24 0x0A 0x09 0x03 0x07 0x00 0x00 

AC Clock Selector Descriptor:
------------------------------

Value	Valuename
0x09	bLength
0x24	bDescriptorType
0x0B	bDescriptorSubtype
0x0B	bClockID
0x02	bNrInPins
0x09	baCSourceID(1)
0x0A	baCSourceID(2)
0x03	bmControls
0x00	iClockSelector
Hex dump: 
0x09 0x24 0x0B 0x0B 0x02 0x09 0x0A 0x03 0x00 

AC Clock Source Descriptor:
------------------------------

Value	Valuename
0x08	bLength
0x24	bDescriptorType
0x0A	bDescriptorSubtype
0x0A	bClockID
0x03	bmAttributes
0x07	bmControls
0x00	bAssocTerminal
0x00	iClockSource
Hex dump: 
0x08 0x24 0x0A 0x0A 0x03 0x07 0x00 0x00 

AC Clock Selector Descriptor:
------------------------------

Value	Valuename
0x09	bLength
0x24	bDescriptorType
0x0B	bDescriptorSubtype
0x0C	bClockID
0x02	bNrInPins
0x09	baCSourceID(1)
0x0A	baCSourceID(2)
0x03	bmControls
0x00	iClockSelector
Hex dump: 
0x09 0x24 0x0B 0x0C 0x02 0x09 0x0A 0x03 0x00

Thanks
Chihhao

On Mon, 2021-07-26 at 02:16 +0000, Geraldo Nascimento wrote:
> On Sun, Jul 25, 2021 at 7:44 AM Takashi Iwai <tiwai@suse.de> wrote:
> > 
> > On Sat, 24 Jul 2021 17:04:13 +0200,
> > Geraldo Nascimento wrote:
> > > 
> > > On Sat, Jul 24, 2021 at 8:05 AM Takashi Iwai <tiwai@suse.de>
> > > wrote:
> > > > 
> > > > This looks like a regression introduced by the recent commit
> > > > d2e8f641257d ("ALSA: usb-audio: Explicitly set up the clock
> > > > selector"), which is a fix for certain devices.  Too bad that
> > > > the
> > > > behavior really depends on the device...
> > > 
> > > Dr. Iwai, perhaps we could restrict the generalized fix for the
> > > Behringer UFX1604 / UFX1204 with some simple logic to devices
> > > that
> > > only have *one* clock source.
> > > 
> > > In that case the clock selector must be set to the only clock
> > > source.
> > > 
> > > This way we keep the generalization without breaking devices with
> > > more
> > > than one clock source.
> > > 
> > > Just an idea.
> > 
> > I don't think it's easy to generalize.  All those bugs are more or
> > less BIOS bugs, and a logic doesn't apply always, just because it's
> > a
> > bug :)  For example, setting the clock selector itself should be a
> > valid operation from the specification POV, while this leads to
> > breakage on some devices.  So, even if we add a more generic
> > workaround, we need to see which side effect is more commonly seen
> > at
> > first.
> > 
> > 
> > Takashi
> 
> Hello,
> 
> Like I said in one of the other emails in this thread, it's hard to
> pinpoint a cause for the breakage of Samsung USBC Headset (AKG) with
> VID/PID (0x04e8/0xa051) without the lsusb -v of the device in
> question.
> 
> But from the description Chihhao Chen gave in the original message,
> I'm *guessing* the Clock Source for the Samsung USB Headset (AKG)
> runs
> at 48000hz and that we'd see a 2x Clock Multiplier in the lsusb -v
> 
> This is all a wild guess, without the lsusb -v it's impossible to be
> sure, but if I'm right then the valid setting for the Microphone's
> Clock Selector is the Clock Multiplier, not the Clock Source, which,
> remember, runs at half the clock, hence why Chihhao Chen sees half
> the
> data rate for USB IN.
> 
> Unfortunately our kernel code presently *does* always set the Clock
> Selector to the Clock Source, which is a bad assumption to make in my
> humble opinion.
> 
> The only valid case for setting the Clock Selector to the Clock
> Source
> is when there's precisely one Clock Selector, precisely one Clock
> Source and no Clock Multipliers.
> 
> In that special case we may be able to touch the setting of the only
> Clock Selector to match the only Clock Source.
> 
> And, frankly, the only reason we're forced to do that explicitly is
> because some Behringer gear (Archwave AG DACs) gets confused and
> seems
> to somehow keep the old rate on the Clock Selector upon sample rate
> change.
> 
> Thank you,
> Geraldo Nascimento
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
