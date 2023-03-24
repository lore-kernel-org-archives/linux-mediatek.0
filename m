Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F49AC6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXWnXT+vMftLSgCZUwgPYWG7VVeG1aJgPSZukDW7ZA8=; b=mIZxFo7O/0LkzOEKGL10b+Bb+I
	PdnsIu2ZZAUMxCHk9baD+f8/zmrl57FDP7spPSzykSr54kb1GNbG8Lz/vlaTBM007QwYWJCzeMV6y
	ip9qg8Xea8yqNLS53UkRosfHlpWmbCT1OfzQrv6H3VQmc6CtNabdabskyoPdUyXKSeUqiGJ8R82aO
	BtvGofZKcZbxJqx5606NZOpafnNDeHMg7QohWhF5/2jTsq6LQI2SYAMHmvkQy0Pi+Lq06/HcVyx8E
	E8XKsstCyDZjS8/wU526yJrmCH1BW1iUA3UzVaY1YjB0EdF3/RGIkJ0LZLLX1inMWrK4BX6VmUQSN
	awYNh6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhnG-004X7a-0b;
	Fri, 24 Mar 2023 13:49:22 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhnB-004X6d-0v;
	Fri, 24 Mar 2023 13:49:18 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pfhmm-0006Oz-2c;
	Fri, 24 Mar 2023 14:48:52 +0100
Date: Fri, 24 Mar 2023 13:47:10 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>
Subject: Re: Aw: Re: [BUG] MTK SoC Ethernet throughput TX only ~620Mbit/s
 since 6.2-rc1
Message-ID: <ZB2p3kMLF2cWd8f/@makrotopia.org>
References: <trinity-92c3826f-c2c8-40af-8339-bc6d0d3ffea4-1678213958520@3c-app-gmx-bs16>
 <4a229d53-f058-115a-afc6-dd544a0dedf2@nbd.name>
 <ZBBs/xE0+ULtJNIJ@makrotopia.org>
 <trinity-b2506855-d27f-4e5c-bd20-d3768fa7505d-1679077409691@3c-app-gmx-bap25>
 <trinity-e199fc72-77d9-47f3-acb6-e11fbf66360b-1679144877213@3c-app-gmx-bs63>
 <4462a0c2-f7ea-c81c-e12f-ec629113fc40@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4462a0c2-f7ea-c81c-e12f-ec629113fc40@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_064917_325628_A660F2B5 
X-CRM114-Status: GOOD (  16.17  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Felix,
Hi Frank,

On Fri, Mar 24, 2023 at 12:52:09PM +0100, Felix Fietkau wrote:
> On 18.03.23 14:07, Frank Wunderlich wrote:
> > on BPI-R2 the eth0/gmac0 (tested with wan-port) is affected. here i have in TX-Direction only 620Mbit.
> > 
> > I have no idea yet why there the gmac0 is affected and on r3 only gmac1.
> > 
> > But it looks differently...on r3 the gmac1 is nearly completely broken.

If it looks "completely broken" as in you see only kilobits or even
complete starvation of RX, then you probably miss this fix:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=193250ace270fecd586dd2d0dfbd9cbd2ade977f

> Please try this patch and let me know if it resolves the regression:
> 
> ---
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -718,8 +718,6 @@ static void mtk_mac_link_up(struct phyli
>  		break;
>  	}
> -	mtk_set_queue_speed(mac->hw, mac->id, speed);
> -
>  	/* Configure duplex */
>  	if (duplex == DUPLEX_FULL)
>  		mcr |= MAC_MCR_FORCE_DPX;
> 
> 

I was about to suggest exactly this fix, and yes, it resolves the issue
and now I see full 1 Gbit/s speed on both, switch ports (even while 100M
connection is also used) and eth1 (via 1000Base-T SFP module).

Thank you for taking care of this!


