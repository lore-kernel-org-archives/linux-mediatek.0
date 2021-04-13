Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619ADC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 12:56:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E90613B6
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 12:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E90613B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=77W9dZL8w6CtvNuBTjuZ731sO+TAUOBgsV2HR47UeaM=; b=BbLea/lt65RLCNd5ujvwL/t0H
	3wOsbM+AekrzXEyLNkFr8SlRDqw1A2dWgDHlioOWICYAOVn+PjO5+8lZAgsmFcXfv6GpUmsyrhRQQ
	uCxfB1ebNKaWMyv93CeE+EhMxpp7M42tc7/6XgdlJtWdi0L7l0QLuGljLTSQo1yXlYwm5OKQtEbbP
	mGm5WeFRbmcbT2LfzkWQeykF6Km0O7E2X4rjirZkl+lRPgmRR3PIjYjYSVwqHkG88JU5A9h3y+0oe
	lgGYExcUf+M08swvsEF1m2af+pBLhNJH39wTdeh97V8YDeT8NriRyToLmpX1mUm/J0UXJDCPlKR7U
	ku0TK6Fpg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWIao-009J01-Ur; Tue, 13 Apr 2021 12:56:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWIXZ-009Ib7-7Y
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 12:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=q+rIYcR+QjBUGTWuYDNjE9QBf2cnma/979dqdAG9TX0=; b=NVdDLGY67r5PGZ4f4taVlMMtDO
 US1dWgTbDBENWZTg5acRAJlFTCLZ0ZJEaHwRmplPez125lhi85r7BpLOUoyrDEBm+b7zY2hWWm4e1
 gtbwxxlxYbGnsev4Sxg8PkfUb+Do8mz7bHdQb6WAlnSjZCJ3pFSRxVnLGT3FlpAHs8hEs1UmkSusg
 hlowLxsmOJMYRKSDkXFGcypgqIrntMiSPxNf9twKVxPGpGnAaSgxVHa/d+++M80T9RfvmsjroWqGq
 aMYZ/XqZFqkEjcmRJVucMTuYw5MLpJUkx6xLJlfiIaVZFNpnknjrqEGTt09pfEWYRc0xGLEQrMWF6
 PfuznW/A==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWIXW-0072Sa-ON
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 12:53:12 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lWIXL-00GTYv-RL; Tue, 13 Apr 2021 14:52:59 +0200
Date: Tue, 13 Apr 2021 14:52:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marc Zyngier <maz@kernel.org>
Cc: DENG Qingfang <dqfext@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Greg Ungerer <gerg@kernel.org>
Subject: Re: [RFC v4 net-next 2/4] net: dsa: mt7530: add interrupt support
Message-ID: <YHWUK+tG3v9ZU/DT@lunn.ch>
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-3-dqfext@gmail.com>
 <87fszvoqvb.wl-maz@kernel.org>
 <20210412152210.929733-1-dqfext@gmail.com>
 <YHTgu1+6GZFdFgWJ@lunn.ch> <8735vuobfo.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8735vuobfo.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_055310_809351_B8FBED4B 
X-CRM114-Status: GOOD (  15.46  )
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

> I guess this is depends whether the most usual case is to have all
> these interrupts being actively in use or not. Most interrupts only
> use a limited portion of their interrupt space at any given time.
> Allocating all interrupts and creating mappings upfront is a waste of
> memory.
> 
> If the use case here is that all these interrupts will be wired and
> used in most cases, then upfront allocation is probably not a problem.

Hi Marc

The interrupts are generally used. Since this is an Ethernet switch,
generally the port is administratively up, even if there is no cable
plugged in. Once/if a cable is plugged in and there is a link peer,
the PHY will interrupt to indicate this.

The only real case i can think of when the interrupts are not used is
when the switch has more ports than connected to the front panel. This
can happen in industrial settings, but not SOHO. Those ports which
don't go anywhere are never configured up and so the interrupt is
never used.

      Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
