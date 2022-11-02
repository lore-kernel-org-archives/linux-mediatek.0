Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04995C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 01:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByeRLxikMYM3ac/zYAwjbHrnz6wxVOIg1IVLvVaHMRU=; b=ImFvG/8SuONq768F6NX+fHbEo0
	0M0oQAKisXdeGBSfVrY54CoCijGct57ipCCI/oAA2eQJ9DR67p7hOJOYTaRlxNCkQ8xNJlvoZPPY8
	X8wXkr9Pna90hC8j2OfslMVHhDpKjoAj1CPTc4wbSTFif2mKYu6GTz1vH5pCpBHn92mqOxsJ03TPv
	/lQbqtxrjHlzuMBW0UyQq4n78MfveUUhkTQVo07+63egU7kZOcsjXouHI8ZMGxcngICcyMhv5hdPz
	H0TgfPWCFlG+dL+S1b1Qf9TEab3na0T+ZKNyT+Xccj2fmCMN84ZZyDpveXFqJVlG5Z32g/ryhu3n2
	U+wV2KBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq2XC-007tP6-RC; Wed, 02 Nov 2022 01:27:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq2Wq-007tH2-4W; Wed, 02 Nov 2022 01:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ByeRLxikMYM3ac/zYAwjbHrnz6wxVOIg1IVLvVaHMRU=; b=VXXWehq9WzJBIX74BuCCaQ/2c3
	qZ3Rzqevza6vojM2of3R/UGOD8gtT+DGPvDpHQ/BAPp754ld7gQqwkFYJj3UfGeA+uFDn0pF/b7Rk
	DnK9lNRCFD5SdpCxwkM1oxxf+YcLAWw5OBH+PzeuJYiz375yj2QHwVhWKV74VGn6TpKg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oq2WH-0019fw-Kb; Wed, 02 Nov 2022 02:26:17 +0100
Date: Wed, 2 Nov 2022 02:26:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <Y2HHOSaYQGAhWL/E@lunn.ch>
References: <Y2G9ANkdaaENNnOd@makrotopia.org>
 <Y2G/CaPrTVsYeGWB@lunn.ch>
 <Y2HBzEdmiKK9IPFK@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2HBzEdmiKK9IPFK@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_182652_199058_10321BE3 
X-CRM114-Status: GOOD (  20.53  )
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

On Wed, Nov 02, 2022 at 01:03:08AM +0000, Daniel Golle wrote:
> Hi Andrew,
> 
> On Wed, Nov 02, 2022 at 01:51:21AM +0100, Andrew Lunn wrote:
> > On Wed, Nov 02, 2022 at 12:42:40AM +0000, Daniel Golle wrote:
> > > The PPE units found in MT7622 and newer support packet and byte
> > > accounting of hw-offloaded flows. Add support for reading those
> > > counters as found in MediaTek's SDK[1].
> > > 
> > > [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/bc6a6a375c800dc2b80e1a325a2c732d1737df92
> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > 
> > Sorry, but NACK.
> > 
> > You have not explained why doing this correctly via ethtool -S cannot
> > be done. debugfs is a vendor crap way of doing this.
> 
> The debugfs interface is pre-existing and **in addition** to the
> standard Linux interfaces which are also provided. It is true that
> the debugfs interface in this case doesn't provide much additional
> value apart from having the counter listed next to the hardware-
> specific hashtable keys. As the debugfs interface for now aims to
> be as complete as possible, naturally there is some redundance of
> things which can also be accessed using other (standard) interfaces.

debugfs is by definition unstable. It is not ABI. Anything using it is
expected to break in the near future when it changes its layout. It is
also totally option, you cannot expect it to be mounted.

I hope you don't have any user space code using it.

Maybe i should submit a patch which just for the fun of it rearranged
the order in debugfs and change the file name?

    Andrew

