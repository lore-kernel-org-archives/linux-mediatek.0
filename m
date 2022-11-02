Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B19DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmE62GcMonPmMd9spbHg/5bl23c/MNVw2vFohUZ4uq4=; b=nvRTDk/25+E5uwEr1zDk8+jujJ
	u+JTquv9wFRHF5KOq81Xpqzh6SuJhZPsSYzfRFmT4TLVyYPewUo4WSz5y/ESFhQI1RGOTCKwKi+gy
	1V0DydY1JJFdwUOOSe9aSpqPdHH4ukT9hQszqIetfGOZbdQgx9CrcIMuBapXuXrXw0TPJZrOrh3jF
	Ls3LliwbhoiScQYtinXuMaU0w/lk0w+52BFgsD4DGphv24O1Zp9NbgxKdO8SECjQnUPVio4KRkdHj
	13fyvHxAwMEDz7KIhXMw7kQmMH5Aen/JCmfRhrSlPQBC7nHOuCQyFxplqw0f+yWIjCuiaID2d1nsB
	hxemeoIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqAni-00ATUe-Nu; Wed, 02 Nov 2022 10:16:50 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqAnY-00ATS4-AA; Wed, 02 Nov 2022 10:16:41 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1oqAnE-0002Os-TL; Wed, 02 Nov 2022 11:16:21 +0100
Date: Wed, 2 Nov 2022 10:16:16 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] net: ethernet: mediatek: ppe: add support for flow
 accounting
Message-ID: <Y2JDcBovstxCHCTJ@makrotopia.org>
References: <Y2G9ANkdaaENNnOd@makrotopia.org>
 <Y2G/CaPrTVsYeGWB@lunn.ch>
 <Y2HBzEdmiKK9IPFK@makrotopia.org>
 <Y2HHOSaYQGAhWL/E@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2HHOSaYQGAhWL/E@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_031640_368375_A7D46110 
X-CRM114-Status: GOOD (  26.60  )
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

On Wed, Nov 02, 2022 at 02:26:17AM +0100, Andrew Lunn wrote:
> On Wed, Nov 02, 2022 at 01:03:08AM +0000, Daniel Golle wrote:
> > Hi Andrew,
> > 
> > On Wed, Nov 02, 2022 at 01:51:21AM +0100, Andrew Lunn wrote:
> > > On Wed, Nov 02, 2022 at 12:42:40AM +0000, Daniel Golle wrote:
> > > > The PPE units found in MT7622 and newer support packet and byte
> > > > accounting of hw-offloaded flows. Add support for reading those
> > > > counters as found in MediaTek's SDK[1].
> > > > 
> > > > [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/bc6a6a375c800dc2b80e1a325a2c732d1737df92
> > > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > 
> > > Sorry, but NACK.
> > > 
> > > You have not explained why doing this correctly via ethtool -S cannot
> > > be done. debugfs is a vendor crap way of doing this.
> > 
> > The debugfs interface is pre-existing and **in addition** to the
> > standard Linux interfaces which are also provided. It is true that
> > the debugfs interface in this case doesn't provide much additional
> > value apart from having the counter listed next to the hardware-
> > specific hashtable keys. As the debugfs interface for now aims to
> > be as complete as possible, naturally there is some redundance of
> > things which can also be accessed using other (standard) interfaces.
> 
> debugfs is by definition unstable. It is not ABI. Anything using it is
> expected to break in the near future when it changes its layout. It is
> also totally option, you cannot expect it to be mounted.
> 
> I hope you don't have any user space code using it.
> 
> Maybe i should submit a patch which just for the fun of it rearranged
> the order in debugfs and change the file name?

Go ahead and have fun ;)
The debugfs interface is not used for anything except for the human
developer wanting to validate that PPE is working properly. It's
literally for debugging, and nothing else.

For productive use, you can access the counters by setting up an
nftables rule with a counter.

