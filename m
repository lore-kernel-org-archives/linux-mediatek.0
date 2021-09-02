Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D397C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 05:59:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 267EB60FC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 05:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 267EB60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nd3km8wfXN08WljKwA2ibFYdujFcBDuuJIP+zrLTyY=; b=MGX+cy5SXAo0wz
	GvirJP0oxJhb6qx7lnJAhvpdoSCIiMVgITiO36oIM/ar6ILUGJBphjN897i54fHGljcx+aPv1lPNJ
	B90/oH9Y/XahY8jzfwCeaSwOBiYofuUEjqCz86DKDhn6jEZ9DmKX6PPpZnxz55GqETpO6V9ZODIqx
	Dfnzl2v2B5uG4Av31s+jXpSih4yVnuWdwzkDmuvPkffeWsIzEmGdsI364HvxYRwjPSHy5M9mMXvD9
	Qgr2U2n5iWpjCl6qWP5jqsKLiBRH3mTM5bs5CSLZTCbG0qGUYRaQyccFOEUqgh5QF+GqYsEhtw6WC
	diYvZ/Nz8l2y7l+2SWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfka-008bpK-Ny; Thu, 02 Sep 2021 05:59:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfkJ-008bmP-Ev; Thu, 02 Sep 2021 05:58:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6434760FC4;
 Thu,  2 Sep 2021 05:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1630562323;
 bh=BwqwkSdoVWCyqzWTEEXTceIXMVKRB8SwogsNaQ7lvZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C7LSfgtMMuexPix16DaTOH3ZmOTPFUlZ+0QlunclyfNWrFDaXWWHvVjHPECgfEZNb
 A8ffnAGdS3xUa7OtW6S3+ctupWMoTHuRTgRJOhCHlMCqlz25kbNNQzi5CBFAuINy64
 fiNXWS1ZVAoh+5Zr6BccQx/iRX55Ibv2TcML/o+0=
Date: Thu, 2 Sep 2021 07:58:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 4.19.y] net: dsa: mt7530: disable learning on standalone
 ports
Message-ID: <YTBoDaYDJfBz3YzN@kroah.com>
References: <20210824055509.1316124-1-dqfext@gmail.com>
 <YSUQV3jhfbhbf5Ct@sashalap>
 <CALW65ja3hYGmEqcWZzifP2-0WsJOnxcUXsey2ZH5vDbD0-nDeQ@mail.gmail.com>
 <YSi8Ky3GqBjnxbhC@kroah.com>
 <20210902053619.1824464-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210902053619.1824464-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_225843_602935_151F0555 
X-CRM114-Status: GOOD (  21.90  )
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

On Thu, Sep 02, 2021 at 01:36:19PM +0800, DENG Qingfang wrote:
> On Fri, Aug 27, 2021 at 12:19:23PM +0200, Greg KH wrote:
> > On Tue, Aug 24, 2021 at 11:57:53PM +0800, DENG Qingfang wrote:
> > > Standalone ports should have address learning disabled, according to
> > > the documentation:
> > > https://www.kernel.org/doc/html/v5.14-rc7/networking/dsa/dsa.html#bridge-layer
> > > dsa_switch_ops on 5.10 or earlier does not have .port_bridge_flags
> > > function so it has to be done differently.
> > > 
> > > I've identified an issue related to this.
> > 
> > What issue is that?  Where was it reported?
> 
> See Florian's message here
> https://lore.kernel.org/stable/20210317003549.3964522-2-f.fainelli@gmail.com/

THat is just the patch changelog text, or is it unique to this
stable-only patch?  It is not obvious at all.

> > > > 2. A partial backport of this patch?
> > > 
> > > The other part does not actually fix anything.
> > 
> > Then why is it not ok to just take the whole thing?
> > 
> > When backporting not-identical-patches, something almost always goes
> > wrong, so we prefer to take the original commit when ever possible.
> 
> Okay. MDB and tag ops can be backported as is, and broadcast/multicast
> flooding can be implemented in .port_egress_floods. 

So what are we supposed to do here?

totally confused,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
