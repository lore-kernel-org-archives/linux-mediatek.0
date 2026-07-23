Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6145AC531CF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duiX4GQAAvmX5L/FcIQzGfBvyrqwOSAAZLOGfQW5+ks=; b=Cyv9nUGBpeU06aEMPWx4syx2xj
	wfdP2tnvGxSAwesUa+ExdQL6ge7S5KoiTtduyB1pbLSeXxW7x2jDUkB5LrnEXlE9AoIFLCRsVi4Ny
	fSVXFV8NTILWy8VpbqOkDr0KASdUzZP4SYX26J6VUoMyEDIxqc4ACog/Vil2+W3ak0saDoDC11/+h
	66bfqGhJupb/c7hC6MY1oF61zdBhc2MFBn5XPnfeMAOb9vi2x2gHTL+yeHUIJmmN960jXjudiXDjW
	CNFTl+JL56kTur1ONVfgesfiMSoxVgmwkHmwoL/NlH5XoVNWzjZNZ1LtJH9qmem9jAZ0KTjaNHxND
	PoWK+yHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmteG-0000000EOiJ-0Sd0;
	Thu, 23 Jul 2026 13:39:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmteE-0000000EOi1-1VGt;
	Thu, 23 Jul 2026 13:39:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24A89600AD;
	Thu, 23 Jul 2026 13:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37ACB1F000E9;
	Thu, 23 Jul 2026 13:39:36 +0000 (UTC)
Date: Thu, 23 Jul 2026 06:39:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: <zhaoping.shu@mediatek.com>
Cc: <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <horms@kernel.org>, <ncardwell@google.com>, <kuniyu@google.com>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <willemb@google.com>, <alice@isovalent.com>, <sd@queasysnail.net>,
 <eilaimemedsnaimel@gmail.com>, <imv4bel@gmail.com>, <hw.he@mediatek.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <haijun.liu@mediatek.com>,
 <xiayu.zhang@mediatek.com>, <lambert.wang@mediatek.com>,
 <Iven.Yang@mediatek.com>
Subject: Re: [PATCH net v2] net: gro: avoid nesting TCP GSO skbs in
 skb_gro_receive_list()
Message-ID: <20260723063935.75bf55e3@kernel.org>
In-Reply-To: <20260723091601.72103-1-zhaoping.shu@mediatek.com>
References: <20260723091601.72103-1-zhaoping.shu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 23 Jul 2026 17:16:01 +0800 zhaoping.shu@mediatek.com wrote:
> From: HW He <hw.he@mediatek.com>
> 
> On devices that support both NETIF_F_GRO_HW and NETIF_F_GRO_FRAGLIST,

"devices that support FRAGLIST"? Isn't it a software feature?

> the hardware or driver may deliver packets that have already been

If you have a driver in mind please name it.

> aggregated into a TCP GSO skb with frags[]. GRO may then
> aggregate the skb again in skb_gro_receive_list().
> 
> This can create a nested GSO skb, which is not handled correctly by the
> later GSO segmentation paths. When the skb is segmented by
> skb_segment_list(), it not be fully restored to the original packets.
> 
> Avoid this by setting NAPI_GRO_CB(skb)->flush for GSO skbs before
> aggregation.

I don't think we can do this. For GRO_HW devices re-aggregating
in SW is quite helpful, HW often runs out of contexts or times
out too soon, generating skbs with 16kB..32kB of data, the SW
can help bring it up to full TSO.

Also - you're missing a Fixes tag.

