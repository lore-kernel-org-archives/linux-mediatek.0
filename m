Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBBCFA3750
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 19:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/fJdEFiVV1xIWs3tBqysiFVv3X6oa6gDDk7YeJVw8s=; b=iXYT/AWdC0ek5HW7oyIU1m2e6Z
	8GSBrCogqPhENrZSl+qNE+6x835w7PXPbOTtgTof/UEFo5HH7pg02LzP2/YiXKGFpMSkrrN0pkgWp
	zoKvv/V0YlWgA7Xb4I14NQoyPraRD7Ur4dDuM15EAPHAtEhvwOAqtI3fiM4Hf+tJfEpFrRB//PTN3
	sT9BFiZ7raNo/FY7UbF942TmIME06NB1pFBnS5oLssuh1TH0pOML47znvwhi/RVJWHZvzqO7yqiha
	oMkry/v2fREKw8pV9wirHRlXL/isFDUose112HIWOiLzYr1Uy5rtQBsGAV6HM8XqWs8EBjRcypaee
	rseXqL1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spBxM-0000000GwRN-3Hnr;
	Fri, 13 Sep 2024 19:27:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spBxK-0000000GwQm-0TkZ
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 19:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=V/fJdEFiVV1xIWs3tBqysiFVv3X6oa6gDDk7YeJVw8s=; b=3s/5LffkanL6JgKJdCkpMVN4mA
	gvWbJIwLXl8SJgWI2e05xTlPRuVo02f26hMdxNDCq1K/0UM+dKCgrnRS5RSztGn0G7endKpcSNkVK
	CWv9lipO+ZXgG68QJje6llHwbX++Tsc8PqQgyr3rll+5m1jDJwpxUCuWUvea+uKXgiSU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1spBwx-007Q0o-Hv; Fri, 13 Sep 2024 21:27:23 +0200
Date: Fri, 13 Sep 2024 21:27:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "A. Sverdlin" <alexander.sverdlin@siemens.com>, netdev@vger.kernel.org,
	=?iso-8859-1?Q?Ar1n=E7_=DCNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	UNGLinuxDriver@microchip.com,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	linux-mediatek@lists.infradead.org, bridge@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] net: dsa: RCU-protect dsa_ptr in struct net_device
Message-ID: <28d0a7a5-ead6-4ce0-801c-096038823259@lunn.ch>
References: <20240910130321.337154-1-alexander.sverdlin@siemens.com>
 <20240910130321.337154-2-alexander.sverdlin@siemens.com>
 <20240913190326.xv5qkxt7b3sjuroz@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913190326.xv5qkxt7b3sjuroz@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_122746_175189_A4146E30 
X-CRM114-Status: GOOD (  11.36  )
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

> >  drivers/net/dsa/mt7530.c                    |   3 +-
> >  drivers/net/dsa/ocelot/felix.c              |   3 +-
> >  drivers/net/dsa/qca/qca8k-8xxx.c            |   3 +-
> >  drivers/net/ethernet/broadcom/bcmsysport.c  |   8 +-
> >  drivers/net/ethernet/mediatek/airoha_eth.c  |   2 +-
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c |  22 +++--
> >  drivers/net/ethernet/mediatek/mtk_ppe.c     |  15 ++-
> >  include/linux/netdevice.h                   |   2 +-
> >  include/net/dsa.h                           |  36 +++++--
> >  include/net/dsa_stubs.h                     |   6 +-
> >  net/bridge/br_input.c                       |   2 +-
> >  net/core/dev.c                              |   3 +-
> >  net/core/flow_dissector.c                   |  19 ++--
> >  net/dsa/conduit.c                           |  66 ++++++++-----
> >  net/dsa/dsa.c                               |  19 ++--
> >  net/dsa/port.c                              |   3 +-
> >  net/dsa/tag.c                               |   3 +-
> >  net/dsa/tag.h                               |  19 ++--
> >  net/dsa/tag_8021q.c                         |  10 +-
> >  net/dsa/tag_brcm.c                          |   2 +-
> >  net/dsa/tag_dsa.c                           |   8 +-
> >  net/dsa/tag_qca.c                           |  10 +-
> >  net/dsa/tag_sja1105.c                       |  22 +++--
> >  net/dsa/user.c                              | 104 +++++++++++---------
> >  net/ethernet/eth.c                          |   2 +-
> >  25 files changed, 240 insertions(+), 152 deletions(-)
> 
> Thank you for the patch, and I would like you to not give up on it, even
> if we will go for a different bug fix for 'stable'.
> 
> It's just that it makes me a bit uneasy to have this as the bug fix.

+1

We should try for a minimal fix for stable, and keep this for
net-next, given its size.

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

* It must be obviously correct and tested.
* It cannot be bigger than 100 lines, with context.

	Andrew

