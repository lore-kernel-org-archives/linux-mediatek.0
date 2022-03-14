Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32B6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vx1+gDphufOQrP6YjGS4dJFDqIADkVpXR8mBbkVBSkk=; b=CXWyg7r/khPj6b
	hh56w9njLRBO2Qxy4VYvq44sejfzeG57rdrjA/oORN4I6eG0IX9w0BrduRbEevr9sebefSJwUpCnm
	2cdRN4jzfeU0qhOnXKNiqxCx5UrgaXsXNy7AlUmMDE5nlfMxt9zCynL9UgfwHzEVX4P6u2b1B8ZxO
	px5vKvy7tm1QeLVRGWDiqXxgRw8uFrubtNboyKI+//qtUQgootjNJleZw16Q7+8dVNVquHZbtR6Ry
	/gaNmE0MEyNvEnmgnI6+1g7jgM/IsQTrhrY6BGTJqs/9baFwaxvbRM+owGPes8wG6b+MkrQWwVR7C
	jhFBxvz0fvypgkvUynTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTn4U-005tj2-5o; Mon, 14 Mar 2022 15:57:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTn4H-005teb-7h; Mon, 14 Mar 2022 15:57:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AECCE61305;
 Mon, 14 Mar 2022 15:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAA1C340E9;
 Mon, 14 Mar 2022 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647273427;
 bh=/rB6touVORwKOdNua1VLyFTBI38m6etM0LeyJRkf28I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lbnAbiB+xjtDfrTmBLaXAYV0gtMZi9Op4qc2ltgm1cEv8n6G4KIxXomoqHSWaULAO
 LjQIGlmHSernXc6PVtJmbUXfB7KeqA2jtNkS0fBMvDGPDNJZPKRvScjuqunoa5V0tx
 EBpQfls3GUeL8A4qVU/c7CtWOQOqudfnrrF3qM1zc7qHZ/IVRayFbKZNVkf623qzHX
 OmbIIALwcruJM1jt8LpHEdV/chD2JR9rinCrpDaNuK1XcLXOASi9kq5DssTAsvu0jr
 tT97BeNNgh7Rzrmc+PlBkUBQ2rSgc4iZQ8+ezp6HZMGJvb6iGa9rUSgn+zuUC1PPdW
 a90I4ankoPeSw==
Date: Mon, 14 Mar 2022 08:57:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Fabien Parent <fparent@baylibre.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Yinghua Pan
 <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>
Subject: Re: [PATCH net-next v2 9/9] net: ethernet: mtk-star-emac: separate
 tx/rx handling with two NAPIs
Message-ID: <20220314085705.32033308@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <2d0ab5290e63069f310987a4423ef2a46f02f1b3.camel@mediatek.com>
References: <20220127015857.9868-1-biao.huang@mediatek.com>
 <20220127015857.9868-10-biao.huang@mediatek.com>
 <20220127194338.01722b3c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <2bdb6c9b5ec90b6c606b7db8c13f8acb34910b36.camel@mediatek.com>
 <20220128074454.46d0ca29@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <2d0ab5290e63069f310987a4423ef2a46f02f1b3.camel@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_085709_741400_15B80D4C 
X-CRM114-Status: GOOD (  16.28  )
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

On Mon, 14 Mar 2022 15:01:23 +0800 Biao Huang wrote:
> > Drivers are expected to stop their queues at the end of xmit routine
> > if
> > the ring can't accommodate another frame. It's more efficient to stop
> > the queues early than have to put skbs already dequeued from the
> > qdisc
> > layer back into the qdiscs.  
> Yes, if descriptors ring is full, it's meaningful to stop the queue 
> at the end of xmit; 
> But driver seems hard to know how many descriptors the next skb will
> request, e.g. 3 descriptors are available for next round send, but the
> next skb may need 4 descriptors, in this case, we still need judge
> whether descriptors are enough for skb transmission, then decide stop
> the queue or not, at the beginning of xmit routine.
> 
> Maybe we should judge ring is full or not at the beginning and the end
> of xmit routine(seems a little redundancy).

Assume the worst case scenario. You set the default ring size to 512,
skb can have at most MAX_SKB_FRAGS fragments (usually 17) so the max
number of descriptors should not be very high, hard to pre-compute,
or problematic compared to the total ring size.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
