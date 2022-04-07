Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9859C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 16:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISIAtFZo7RjhdtgAPze5fZEMh2PY98PoZ3HOz3sBXD4=; b=WodVOIvAzSD/rB
	SnKehqO4fiyyzKV+6VPHZHdPk55dkjBoXX4ATk3UwGqKcn69XRQW1U4Xjj3cQTv1aES28jLTskSPD
	LNH5e+0Xq5BGWnOqPuQUoeOngRL8gLF+savPQjFLpX6HGhvRL0Q8giqbIRIOXpmkM4UDgx8FGf0P1
	zPvjgdnJbiqOIjEb08J5fpr7mpmm2SJ74khn3MSdhzR3rUFJXpjn2NkKUMrkHgLyfPyvPX4Vdt5K6
	rs/CSejuXwNUyzlM3WAdPaK/W2beMkcRBZ5SPIchnXhbmpB5UdGMZYpMVnv7uuL3gcBiFKCzLGsns
	u0BPoZjBxKuGZ2RsqZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncV2X-00D4zz-AQ; Thu, 07 Apr 2022 16:31:21 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncUVc-00Crth-Pe; Thu, 07 Apr 2022 15:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=WHtWvCcHvMLeywzN7JpkaBHNxci5M6pW3QAKDubNUGw=; b=Vt9fOuMQ+XZbc1Hg8cG7dALhQZ
 zyOkOodipJYPS5Z/dlC8f3jNyytKuS9+aspqiSNcVkXYf3fugvOsBfH9hPY0cmvfdD9cgiWL8BRB9
 6QCmblGe82BXRSoImz17zfNgs+NN9TxRJ068pbLuF2u3zO0/8qn0Dm7S8ZCaMcv6Y0j4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ncUVT-00Efe5-Gp; Thu, 07 Apr 2022 17:57:11 +0200
Date: Thu, 7 Apr 2022 17:57:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 00/14] MediaTek SoC flow offload improvements +
 wireless support
Message-ID: <Yk8J1xjbClhuAdBG@lunn.ch>
References: <20220405195755.10817-1-nbd@nbd.name>
 <164925181755.19554.1627872315624407424.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <164925181755.19554.1627872315624407424.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_085720_882316_32248143 
X-CRM114-Status: GOOD (  14.38  )
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

On Wed, Apr 06, 2022 at 01:30:17PM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net-next.git (master)
> by David S. Miller <davem@davemloft.net>:
> 
> On Tue,  5 Apr 2022 21:57:41 +0200 you wrote:
> > This series contains the following improvements to mediatek ethernet flow
> > offload support:
> > 
> > - support dma-coherent on ethernet to improve performance
> > - add ipv6 offload support
> > - rework hardware flow table entry handling to improve dealing with hash
> >   collisions and competing flows
> > - support creating offload entries from user space
> > - support creating offload entries with just source/destination mac address,
> >   vlan and output device information
> > - add driver changes for supporting the Wireless Ethernet Dispatch core,
> >   which can be used to offload flows from ethernet to MT7915 PCIe WLAN
> >   devices

Hi David

It seems very early to merge this. The discussion of if the files are
even in the right places has not even finished. And Arnd seems to not
want parts of this in his subsystem. And there are some major
architecture issues which need discussing...

I think you should revert this.

  Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
