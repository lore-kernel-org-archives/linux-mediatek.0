Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C32C3E8C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 18:56:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6352521973
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 18:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TR/uLu8I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6352521973
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EZBdLCzQVphM5J2P4XE/Su2ostT0SCd+cWzBY8w72hE=; b=TR/uLu8ItZ6p9qjIa2N+39NgF
	WmrXqWkuD/jF5J7Y6Ih8eBNaUboRzm9WFajIDn4xbz9aGc0l4r7B+pSEvwMHZrzvm6BzH6GHtaEQt
	ZfFhWcCoWPllPVmmXEG2OWBHdPrOX4oa8xkZ5iirLbaAkmqV5S5CTiz9sSjcgPUccU7seD/QMzjSy
	CjOuOIibk+4nKgx6hLTFmFb/j6nHpLsHKShT6/clOapJHacHAo9jfxVz5weGcchroSAsfPAbejcKP
	JgmHprNM5s+98iQ6ME3R8ybRNre/kuXGW3UcmKgitrFRjH9yyum4INiksojt4SPnMVU2NVkDCLvsw
	656NrBZyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiiuq-0001UZ-T7; Fri, 27 Nov 2020 18:56:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiium-0001TK-BK; Fri, 27 Nov 2020 18:56:17 +0000
Received: from gaia (unknown [95.146.230.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30EE421D7A;
 Fri, 27 Nov 2020 18:56:13 +0000 (UTC)
Date: Fri, 27 Nov 2020 18:56:10 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v1 1/3] irqchip/gic: enable irq target all
Message-ID: <20201127185610.GA30096@gaia>
References: <1606486531-25719-1-git-send-email-hanks.chen@mediatek.com>
 <1606486531-25719-2-git-send-email-hanks.chen@mediatek.com>
 <a3bd54fb5fe1c8ea11559d7459710263@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3bd54fb5fe1c8ea11559d7459710263@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_135616_471538_FCB2AD29 
X-CRM114-Status: GOOD (  17.39  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, CC Hwang <cc.hwang@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 27, 2020 at 06:11:01PM +0000, Marc Zyngier wrote:
> On 2020-11-27 14:15, Hanks Chen wrote:
> > Support for interrupt distribution design for SMP system solutions.
> 
> As far as I know, we have been supporting interrupt distribution on
> ARM SMP systems pretty well for the past... what... 15 years?
> I'm sure Russell can dig out an ARM926 SMP system that even predates
> that.
> 
> > With this feature enabled ,the SPI interrupts would be routed to
> > all the cores rather than boot core to achieve better
> > load balance of interrupt handling.
> 
> Please quantify this compared to the current distribution method.
> 
> > That is, interrupts might be serviced simultaneously on different CPUs.
> 
> They already can. What is new here? Or do you mean the *same* interrupt
> being serviced by different CPUs *at the same time*? That'd be fun.

IIRC (it's been many years since I looked at the GIC), more than one CPU
is woken and if they all read the INTACK, only one of them gets the
actual IRQ number, the others see a spurious interrupt. I thought we
decided that's not an efficient way to handle interrupts, so a software
irqbalancer is better.

Has anything changed since then?

I'm also concerned that in a big.LITTLE system, you may see the big CPUs
taking the interrupts all the time, which is nice for energy efficiency.

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
