Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01C6C3ABC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 May 2025 19:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RRf6RpbZFMGDm/skMJjOUMF1/wLcxLuxgWCPrHq/74=; b=wQtbshj2HOlQdGiVAf3/FLWhYs
	M3AhSTfb/p+p7QhX29eKnwTum+0zG7ZMPDt1bpH7cU1253zQoWVIBjHPBnRPLzRMu31xK70R8ZgNu
	bn35ZPwaQtmOaMKcbYi7SQWKoBymbBAtwO6zDaBDmDaYtlfM8rPltAJ9wjeDVuM3L49+t3xMKncKi
	fsKInpmC5+QhQL2rhX7TfBBCdMIw44qqFZUS7ydSWmjSJf6TNvZk5rNOvumb6VpVA+m2jEdXm00t+
	LHFpBPl81hWDxzVkHNLuHTrWxVJQlY/Mqtt1M32BP5xJ2MBnU2miilmocd0TyOk91E+59ulA675K5
	4RBqV63w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvPu-0000000DO0f-3OyH;
	Tue, 13 May 2025 19:35:54 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEv9o-0000000DLtp-45Qb
	for linux-mediatek@lists.infradead.org;
	Tue, 13 May 2025 19:19:18 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uEv9i-0002eV-00; Tue, 13 May 2025 21:19:10 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 45646C0895; Tue, 13 May 2025 17:12:23 +0200 (CEST)
Date: Tue, 13 May 2025 17:12:23 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org,
	tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
Message-ID: <aCNhVw7oMRhHQNq_@alpha.franken.de>
References: <20250507134500.390547-1-cjd@cjdns.fr>
 <aCNWM5Xq7wnHVCrc@mai.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCNWM5Xq7wnHVCrc@mai.linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_121917_164686_7FD6F82B 
X-CRM114-Status: GOOD (  17.98  )
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

On Tue, May 13, 2025 at 04:24:51PM +0200, Daniel Lezcano wrote:
> On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
> > EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
> > processors. They are found in xDSL and xPON modems, and contain PCM
> > (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
> > 
> > The EcoNet MIPS SoCs are divided broadly into two families, the
> > EN751221 family based on the 34Kc, and the EN751627 family based on
> > the 1004Kc. Individual SoCs within a family are very similar, only
> > with different peripherals.
> > 
> > This patchset adds basic "boots to a console" support for the EN751221
> > family and adds SmartFiber XP8421-B, a low cost commercially available
> > board that is useful for testing and development.
> > 
> > Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
> > peripherals, and for historical reasons Airoha chips are sometimes
> > referred to with the EN75xx prefix. However this is a different
> > platform because Airoha chips are ARM based.
> > 
> > This patchset is against mips-next.
> > 
> > v4 -> v5
> > * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
> >   * Improve explanation of HPT timer in changelog
> >   * Move pr_info to pr_debug per recommendation
> >   * Remove pointless debug on spurious interrupt
> >   * Small code-style change
> 
> Shall I pick the clocksource + bindings changes through my tree ?

please do, I'll take the remaining patches.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

