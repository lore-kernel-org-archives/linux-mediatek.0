Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F370C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7lsyDmXvCNiEPOFashcsUY/7OuFnGm+wWNSpHyjjlQ=; b=UyzhyMyEKWtS//
	YX66dqbEXtSIHRGxUWN+spq7+V6wGjEw67IDrwek3vnKuVfniKLuRruS1fEUrp0diUT0OH0vOQPRu
	P0qGjedvyeHSxCoyF+fZDwpQLVDHoSQvejd/A7u0nsNjeIYe6TxzTG9jRA/WuQGzY/fDGbtbSsFqA
	7Yv6SX6hUBnP3tRHAjalDubW3PI/XFNoSc/SsXeyNCVwFNS1tvit/tkUAw4/NFMZnFiVDi1Zy1Qo/
	AMbzP2x3wHZbOKPfpqDPmj7acnEJCXCNL1V5GWXNsws/oif3PUdvbKBGBBb50PRYySYG/kdfqWNXH
	62kIAyd8+4l4ZQP6u6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nonVQ-007GWT-8u; Wed, 11 May 2022 14:40:00 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nonV8-007GOA-Bz; Wed, 11 May 2022 14:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=FiKDI9HhA7r1AHskj6iUp9mVld6qQ9o+A800DaQAHwQ=; b=XlpCopCA1tvMM4IGD6BfsvKJJ3
 6Ne4J4K8ICTVijFI20gMdznQKN26v+HzXDOqQM+gLJnQNUlf18YCULwS+DYBTr1W2CT//sXr/pzm/
 N3v2xqYRQugLIno12BUCu9wbMJJ9pYaAWEJDtK/7iqRJ4KtfCExbag4imqu4x1d6YffI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nonUx-002Jv1-LY; Wed, 11 May 2022 16:39:31 +0200
Date: Wed, 11 May 2022 16:39:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Felix Fietkau <nbd@nbd.name>
Cc: Vladimir Oltean <olteanv@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
Message-ID: <YnvKo2sMChiXaiFN@lunn.ch>
References: <20220510094014.68440-1-nbd@nbd.name>
 <20220510123724.i2xqepc56z4eouh2@skbuf>
 <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
 <20220510165233.yahsznxxb5yq6rai@skbuf>
 <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
 <20220510222101.od3n7gk3cofwhbks@skbuf>
 <376b13ac-d90b-24e0-37ed-a96d8e5f80da@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <376b13ac-d90b-24e0-37ed-a96d8e5f80da@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_073942_438730_A39A0716 
X-CRM114-Status: GOOD (  12.39  )
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

> The garbage data is still present in the ARP packets without my patch
> though. So regardless of whether ARP packets are processed correctly or if
> they just trip up on some receivers under specific conditions, I believe my
> patch is valid and should be applied.
> 
> Who knows, maybe the garbage padding even leaks some data from previous
> packets, or some other information from within the switch.

I somewhat agree with Vladimir at the moment. We don't seem to fully
understand why the change makes things work better. And without that
understanding, it is hard to say if this is the correct fix or not.

If this fix is making the transmitter work around bugs in the
receiver, we really should be fixing the receiver, otherwise the
receiver is going to be broken in other scenarios involving padded
short packets.

	 Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
