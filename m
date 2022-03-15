Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1515CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 01:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSyMi3znoynGC7FPQX6VcZBdrNt50VyrppKSWd0z+8I=; b=sjLRTTdMZqgple
	iBcMd2lTq/lwgb/P2khJqClW9C6NkyBcq8NywSPdLS36WvQeA8K0S9B2IzJB0Cw2/ZAqfYJpYFlak
	txtneyDBTvEJ6mcqqwiJHLoOQQC8a8UnwHRKY5OSN9s9fzvZvsx32Uv1XZFQ0Of1l5uzOEEyO6Hju
	7i8YmE23AEdfAuQrbE8XtSqhntd4o6+Y4C5fszmoxc7p77s1s0GMuV2QbNs93Oem8h2KZe1hG+roR
	tt5nuTyuS+SA1itTU9gojrR7aUSzY0BZXmkE6BybzgNf1JtqhciBSd++KW+LyPGXao4m90pP5hcYu
	VJeGeRk9K62weDm3QXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTvXZ-007RbL-9f; Tue, 15 Mar 2022 00:59:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTvXM-007RYC-6Q; Tue, 15 Mar 2022 00:59:47 +0000
X-UUID: 088c1f73452c4d5da540696db71db83b-20220314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ENspejv9JruENf6baz1W4bN9VyRQrb+FGoCU8qGZQxQ=; 
 b=f821ZSniX+8HKLkevipwnNR2TMQarUOi7l2RR5FfFbIejC77eiBSBvEIbXerE21b8dsLz07o8PeJgU5KUJgxfWRvhiKtmb+2J2wvGZx5PjkU+d5oi7AgnnntaMf4LsjvS+WRZgn6qfPvUDY1tyKlTFsn7rcUT1Bm5j26feVEYPU=;
X-UUID: 088c1f73452c4d5da540696db71db83b-20220314
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 509493465; Mon, 14 Mar 2022 17:59:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Mar 2022 17:59:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 15 Mar 2022 08:59:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Mar 2022 08:59:35 +0800
Message-ID: <b681a7e0abc76e196c6bc3afa14402af23bba454.camel@mediatek.com>
Subject: Re: [PATCH net-next v2 9/9] net: ethernet: mtk-star-emac: separate
 tx/rx handling with two NAPIs
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Fabien Parent <fparent@baylibre.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Date: Tue, 15 Mar 2022 08:59:35 +0800
In-Reply-To: <20220314085705.32033308@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20220127015857.9868-1-biao.huang@mediatek.com>
 <20220127015857.9868-10-biao.huang@mediatek.com>
 <20220127194338.01722b3c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <2bdb6c9b5ec90b6c606b7db8c13f8acb34910b36.camel@mediatek.com>
 <20220128074454.46d0ca29@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <2d0ab5290e63069f310987a4423ef2a46f02f1b3.camel@mediatek.com>
 <20220314085705.32033308@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_175944_273510_4274458B 
X-CRM114-Status: GOOD (  20.32  )
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

Dear Jakub,
	Thanks for your comments~

On Mon, 2022-03-14 at 08:57 -0700, Jakub Kicinski wrote:
> On Mon, 14 Mar 2022 15:01:23 +0800 Biao Huang wrote:
> > > Drivers are expected to stop their queues at the end of xmit
> > > routine
> > > if
> > > the ring can't accommodate another frame. It's more efficient to
> > > stop
> > > the queues early than have to put skbs already dequeued from the
> > > qdisc
> > > layer back into the qdiscs.  
> > 
> > Yes, if descriptors ring is full, it's meaningful to stop the
> > queue 
> > at the end of xmit; 
> > But driver seems hard to know how many descriptors the next skb
> > will
> > request, e.g. 3 descriptors are available for next round send, but
> > the
> > next skb may need 4 descriptors, in this case, we still need judge
> > whether descriptors are enough for skb transmission, then decide
> > stop
> > the queue or not, at the beginning of xmit routine.
> > 
> > Maybe we should judge ring is full or not at the beginning and the
> > end
> > of xmit routine(seems a little redundancy).
> 
> Assume the worst case scenario. You set the default ring size to 512,
> skb can have at most MAX_SKB_FRAGS fragments (usually 17) so the max
> number of descriptors should not be very high, hard to pre-compute,
> or problematic compared to the total ring size.
Yes, we'll check the available descriptor number at the end of xmit
routine, and ensure it will larger than (MAX_SKB_FRAGS + 1) in next
send. (refer to stmmac_main.c)

Regards!
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
