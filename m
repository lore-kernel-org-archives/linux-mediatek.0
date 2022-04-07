Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21A1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2THYxRVxU5zvX0w/bDsOxoQXj7NtT+0qdn5HMgXg7E=; b=cfWZP1ttlInb7i
	VSSA3WyXTKp8LDsGamxnM9oi+vjn9gAMgJByCojYSzOth69+1ciDqC/gWJ4Zeo37KjUzBIUX7xfxt
	x7WyKRDm1/9Yzo9161jFFi2m82XpEYRAjar4FiJYVgaw3Ey9LckbiH+7p2K2w2yvBz/X7tldwpTCP
	r/DfsN0UxQE7uZBLKRphvowwGVmv4Ahd5c5hgvvCev0/V8XgJUGfNqIUm1nQDCGMZ2CqldRbo5ydL
	wxdXD3czc2t+F3L605abqfwGXHySijwyUxmaIaC/3VBwMV7G4mGAYiEgHH5mlc7uUbeU93ZH5A9Fu
	pM4vyCXwy/Mnm6t1wVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncVwH-00DNZ0-6H; Thu, 07 Apr 2022 17:28:57 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncVw3-00DNPq-CS; Thu, 07 Apr 2022 17:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=+CcXuAo3p6A3oY3eBmd5VnRnmY9mVb6FELo/+Al/yL8=; b=Wm6nmdHrggU7RYx9EbUjwSxr0Z
 g1LZtbl1NG7YHZh8crIPPm1vTxuLCkLRRAjNVHV/aszw/VieTFPXYUBDmcYDyeYN/85b+JT/X93YX
 cupDZFwHLxGu79J2o1djWEyaC4mZESgI22qNtgRY6wZSitF2E3YkilNN0WeXwC24Z+eU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ncVvp-00EgQL-JM; Thu, 07 Apr 2022 19:28:29 +0200
Date: Thu, 7 Apr 2022 19:28:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Felix Fietkau <nbd@nbd.name>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 00/14] MediaTek SoC flow offload improvements +
 wireless support
Message-ID: <Yk8fPe6wWFFfXESJ@lunn.ch>
References: <20220405195755.10817-1-nbd@nbd.name>
 <164925181755.19554.1627872315624407424.git-patchwork-notify@kernel.org>
 <Yk8J1xjbClhuAdBG@lunn.ch>
 <d3414eb8-bcf5-094c-8f27-66743dbbd441@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3414eb8-bcf5-094c-8f27-66743dbbd441@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_102843_458278_9E72FD48 
X-CRM114-Status: GOOD (  24.66  )
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

On Thu, Apr 07, 2022 at 07:00:36PM +0200, Felix Fietkau wrote:
> On 07.04.22 17:57, Andrew Lunn wrote:
> > On Wed, Apr 06, 2022 at 01:30:17PM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> > > Hello:
> > > 
> > > This series was applied to netdev/net-next.git (master)
> > > by David S. Miller <davem@davemloft.net>:
> > > 
> > > On Tue,  5 Apr 2022 21:57:41 +0200 you wrote:
> > > > This series contains the following improvements to mediatek ethernet flow
> > > > offload support:
> > > > > - support dma-coherent on ethernet to improve performance
> > > > - add ipv6 offload support
> > > > - rework hardware flow table entry handling to improve dealing with hash
> > > >   collisions and competing flows
> > > > - support creating offload entries from user space
> > > > - support creating offload entries with just source/destination mac address,
> > > >   vlan and output device information
> > > > - add driver changes for supporting the Wireless Ethernet Dispatch core,
> > > >   which can be used to offload flows from ethernet to MT7915 PCIe WLAN
> > > >   devices
> > 
> > Hi David
> > 
> > It seems very early to merge this. The discussion of if the files are
> > even in the right places has not even finished. And Arnd seems to not
> > want parts of this in his subsystem. And there are some major
> > architecture issues which need discussing...
> > 
> > I think you should revert this.
> How about I simply send follow-up patches that move the relevant pieces to
> net?

There has just been comments from Rob about the binding. I've not yet
looked at the code, but if i remember correctly, v1 had some
interaction with the DSA tagger, so i do want to look at it.

I'm also wondering if there is anything common here with IPA. It is an
accelerator which sits between the WiFi and the mobile phone baseband
device.

I really would prefer that a proper review of this code was made, by
netdev people, and the bigger architecture questions looked at. So
far, all the reviewers have been from outside netdev.

       Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
