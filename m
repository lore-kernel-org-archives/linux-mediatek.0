Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432C6C5475B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C1vWvpThk9LFBq5lMa+8FHc/z2raOYhMCzGiVt452k=; b=44X27x4Nj9SzZfqzQgzduK83Jp
	WVscbJU2C91oU7alsAETN/m5a91dobDbEqnGe6TOLWEXQ7/HdIecIj510PA5zRyQB4HSaUT0UDVgN
	fzV/mJPbBApCDyHmLEe44ACoTHCNuHvwXCncuOQ7hNb8rDjXHUdstLPa76D38TQdiIVIWJ1LPifJN
	ZBNxmvkax/RZxRR/2z4S6G2VhkWYOd2VGnmI87aAtXP7BVKn+nX9/R84Y92pwucOEqm7LkutYeJIG
	oqj0U3siyhzAzrG1GdEbhR2Wqnr9TA9gwhLcPwLG0j+e5u26d1ILB/JDvtl5/lR0DhtYT8Kr6P9oI
	ebvfEdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnts-0000000HFRW-35Sk;
	Wed, 06 Mar 2024 09:49:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhntp-0000000HFPf-2fLr;
	Wed, 06 Mar 2024 09:49:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 101F21FB;
	Wed,  6 Mar 2024 01:49:53 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A8093F738;
	Wed,  6 Mar 2024 01:49:14 -0800 (PST)
Date: Wed, 6 Mar 2024 09:49:11 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Flash Liu =?utf-8?B?KOWKieeCs+WCsyk=?= <Flash.Liu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	Cylen Yao =?utf-8?B?KOWnmueri+S4iSk=?= <cylen.yao@mediatek.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] firmware: arm_scmi: Avoid to call mbox_client_txdone
 on txdone_irq mode
Message-ID: <Zeg8F6VVaZtpmH8n@pluto>
References: <20240201095754.25374-1-flash.liu@mediatek.com>
 <ZbzKckIhn8HQv5pW@pluto>
 <053cb4a2edfe576412942daed2f7055b2ba9e207.camel@mediatek.com>
 <56e1b2f5adbca437a14b738e1c58a054f6302fcd.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56e1b2f5adbca437a14b738e1c58a054f6302fcd.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_014921_885005_12FE3FFF 
X-CRM114-Status: GOOD (  22.27  )
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

On Wed, Mar 06, 2024 at 06:13:48AM +0000, Flash Liu (劉炳傳) wrote:
> Hi Cristian,
> 
> Kindly ping :)
> 

Hi Pin-Chuan,

sorry for the delay...I have NOT forgot :D, indeed I was just testing
yesterday with some mailbox IP of ours equipped with a TxAck IRQ and I
would have some question for you because I've seen some anomalies while
using this: does your solution work reliably in your setup ALSO when
multiple SCMI transactions are attempted ? (like cpufreq issuing cmds
while polling a sensor from some other thread)

...I'll dig deeper today in this matter, but my current suspect is that
using the mailbox TXAck IRQ to let the controller tick the internal mailbox
queues does not play well with SCMI, since the SCMI TX channel is really the
SCMI "a2p" bidirectional channel and it is associated with just only one shmem
area used to hold both the egressing CMD and to receive the incoming REPLY
from the platform: so if you let the controller tick the queues as soon as you
received the TXAck you are telling the mailbox subsystem to queue another message
on the same area while you are not really done, since only the client know
when it's done with the whole SCMI transaction and the reply has been fetched.

Indeed, for these reasons we have the BUSY/FREE bit in the shmem to protect it
from pending new requests until the previous one has completed, but when the
waited-for reply comes in, the platform would have cleared the BUSY bit and
let the new queued message overwrite the pending reply prematurely, and one
message is lost...

...but as said I want to delve deeper into this, as of now just suppositions
and maybe I am just missing something more that has to be configured
properly...

Thanks,
Cristian

> Thanks.
> Pin-Chuan
> 
> On Fri, 2024-02-02 at 20:36 +0800, Pin-Chuan Liu wrote:
> > Hi Cristian,
> >
> > Thanks for kindly review and explains. Yeah, I have ever tried
> > another
> > way to skip the call (i.e. let mark_txdone be null). However, it
> > looks
> > not easy and also to backport.
> >
> > Awaiting your test results and further suggestions, thanks.
> >
> > Regards,
> > Pin-Chuan
> >
> 
> 
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

