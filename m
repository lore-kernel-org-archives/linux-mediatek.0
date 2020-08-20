Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B15C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 14:53:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 274E12075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 14:53:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GCYxu8at";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K87nPqzP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 274E12075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FXXrP7fONTT4fIZ+vVSnyGi49tM0qRd1ib9xm5BEWNk=; b=GCYxu8athAwWhlzux+c5LDX0R
	2R3Jp1JjREx2FAF2QDlNvZyT9BD1MK4EAdsbkd52HlL98nsapjLIL+JirIa1JKpDbDw/5flxQ9cLc
	qOrB3q6gOrxMswqyBfm6sqsrLhLcbW3RVSo/8z/6ZFT+C4yVdgPTGsgsafUmOBU+kx+/PIWeAgDL6
	EdiX64Y8io83DU8MEN9PjvAfAX4GS5X+SXVYciu8M/qyeKm0/3P/WaXmm+vGjAK7XH+sq3hpY8cFe
	MnWLwaCVw3FqQYpG+Cm+yUsrRCfvc/WquKpgcqdLvdTxLJGk+U8RHXfbUWaUGstEpS6xansJhcKkV
	BRp2DhN6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8lwo-0007v0-Oj; Thu, 20 Aug 2020 14:53:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8lwk-0007u6-2C; Thu, 20 Aug 2020 14:53:43 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41AAF2075E;
 Thu, 20 Aug 2020 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597935221;
 bh=pSyLCSjLNaoL9qhpLxOpTdvEKBIbz4IpNwyffAy0eto=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K87nPqzPK7zV2HjLW+4JGIe56cVVNM47n1uO+JdtyZzahMd4fCF9hYerAz6I5YYqa
 QNtTO5/sg6lDgORj+sVp3XVTjzak81uojvgFjx26rcdLkKfUmFhx0uPKuCay1Pphgx
 dspdb2jKjT4b7GG2zkDuDbDoX8pcO/i9YXeANkRg=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k8lwh-004bi9-P2; Thu, 20 Aug 2020 15:53:39 +0100
MIME-Version: 1.0
Date: Thu, 20 Aug 2020 15:53:39 +0100
From: Marc Zyngier <maz@kernel.org>
To: Saravana Kannan <saravanak@google.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>
Subject: Re: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
In-Reply-To: <CAGETcx-NpRzzeXYN-UBP1eAsC3s_AofSQ9rXOEmCjhLhKLnxWg@mail.gmail.com>
References: <20200819161907.1155110-1-enric.balletbo@collabora.com>
 <C9E59107-CE83-4554-9447-5DE5BEE09A3B@fw-web.de>
 <CAGETcx9_A-E5b-JxT2G142mGxqoo8xqFNEgT+CNWt=oOv0Z5+w@mail.gmail.com>
 <a23bac35d20eb002bdfb5263bf5dd213@kernel.org>
 <CAGETcx-NpRzzeXYN-UBP1eAsC3s_AofSQ9rXOEmCjhLhKLnxWg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <14b8f4b9667d29ee25e25eb19c69e3f7@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: saravanak@google.com, enric.balletbo@collabora.com,
 wichtig@fw-web.de, linux-kernel@vger.kernel.org, kernel@collabora.com,
 linux@fw-web.de, matthias.bgg@gmail.com, drinkcat@chromium.org,
 hsinyi@chromium.org, hanks.chen@mediatek.com, jason@lakedaemon.net,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_105342_331597_9E5A0D5A 
X-CRM114-Status: GOOD (  27.51  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Jason Cooper <jason@lakedaemon.net>, Hanks Chen <hanks.chen@mediatek.com>,
 Frank Wunderlich <wichtig@fw-web.de>, LKML <linux-kernel@vger.kernel.org>,
 "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-20 09:07, Saravana Kannan wrote:
> On Thu, Aug 20, 2020 at 12:56 AM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On 2020-08-19 19:51, Saravana Kannan wrote:
>> > On Wed, Aug 19, 2020 at 9:52 AM Frank Wunderlich <wichtig@fw-web.de>
>> > wrote:
>> >>
>> >> hi,
>> >>
>> >> does the fix you've linked to my revert [1] not work in your case?
>> >>
>> >> [1] https://patchwork.kernel.org/patch/11718481/
>> >
>> > Thanks for pointing it out Frank. Also, might want to avoid top
>> > posting in the future.
>> >
>> > Enric, Can you please try that other fix and see if that solves your
>> > issue?
>> 
>> I think Enric was clear that the driver does probe correctly
>> (meaning that he has the fix in his tree). It is everything else
>> that breaks, because none of the drivers on the platform are
>> equipped to defer their own probing.
>> 
>> I think we need to change this works right now, meaning that we can't
>> blindly change the behaviour of *built-in* drivers. I'll see if I can
>> come up with something quickly, but I'll otherwise take Enric patch.
> 
> Sounds fair Marc.
> 
> Btw, Enric, out of curiosity, can you try adding "fw_devlink=on" to
> your kernel command line to see if it helps? It basically ensures
> proper probe ordering without depending on the drivers. There are some
> corner cases where it still can't work properly (too much to explain
> for a late night email), but if the platforms don't have those corner
> cases it'll work perfectly.
> 
> I'm fine with the revert if Marc isn't able to find a quick fix to the
> drivers, but this might also fix your problem right away.

I'm afraid there is no quick fix if we want to preserve the current
behavior with built-in drivers, and not having "fw_devlink=on" by
default makes it irrelevant for most people.

fw_devlink also prevents my test platforms from booting (my rk3399
doesn't find its PCI devices with it), while the same kernel boots
just fine without it. It could well be that the corner case is
likely to be more prevalent than you seem to expect.

I will probably end-up end-up queuing reverts for both mtk-sysirq,
mtk-cirq, and qcom-pdc (the first two can't be built as module with
mainline anyway, and I seem to remember that the latter caused some
controversy as well).

As an experiment, I have pushed out a branch[1] that implements
a "hybrid" probe, retaining the previous early probe mechanism when
the driver is built-in, and letting things rip when built as a
module (if you do that, you hopefully know what you are doing).
I'd welcome some testing on affected platforms (I don't have
anything I can run mainline on that'd be affected).

Thanks,

         M.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/hybrid-probe
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
