Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136D3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thl9yam4Ych8wE/KIkl1VTfrB0UM+zKR2aL/ylFmSOM=; b=ofkNEb0V8UG7HG
	SsCY+GX8f12v93QQVSjF9oFZkPV1WsFsbQo3qVHnxJYo1fgXOYtlMZNGY1gR2I6jXZHU7aHWeFgY+
	vlEDHOIjK9upChfvtw+eJrbV7mm+SR5SsNWMXaOXI+cBQqMYHE1o8oyZiwZGPOy/SIA27LRDG8uT5
	CPiV5EpVTn0R2sF21Vdg9KGYxqOguFYlvr3ZC7NWhlmYoMn1WTAXiSHnYm79QmCVLxc/CrLAM5U9U
	OvZN90W28mxLs9hGG7mUn8/T2m1KarZ5kDvgTRlYGz8wtk5mZ0yOxgxabE4/p1UOde0pZk4n6UYAL
	suDQHU0WV4qjCeZdFZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAno-00CeGm-Ss; Thu, 12 May 2022 15:32:32 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAne-00CeB9-BN; Thu, 12 May 2022 15:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=mP150j04E/8jQ8B5g/+n8UgWwpaCq5hceVZHtLcU+78=; b=W91vqJCSDahiNvJzDzMjIzXcgX
 3OrdskRDyBToQfzQ9VxpWRoZZZSM3TkqG9OJgLXdU9Ay2q/5VWZZ4+6GozoMSSRxgjz9zp6BMRpQF
 OeXORs7whRYGslWtesZUceCqjI7fs3yHddlPh2wmt+SXfWFkJWS9yQ+gzoDV9ayrpAEc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1npAnK-002TL3-6U; Thu, 12 May 2022 17:32:02 +0200
Date: Thu, 12 May 2022 17:32:02 +0200
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
Message-ID: <Yn0ockLQ+5x+gCfl@lunn.ch>
References: <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
 <20220510165233.yahsznxxb5yq6rai@skbuf>
 <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
 <20220510222101.od3n7gk3cofwhbks@skbuf>
 <376b13ac-d90b-24e0-37ed-a96d8e5f80da@nbd.name>
 <20220511093245.3266lqdze2b4odh5@skbuf> <YnvJFmX+BRscJOtm@lunn.ch>
 <0ef1e0c2-1623-070d-fbf5-e7f09fc199ca@nbd.name>
 <Ynz/7Wh6vDjR7ljs@lunn.ch>
 <987a1cd5-6f35-d3ac-1d42-5346be7ecb1a@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <987a1cd5-6f35-d3ac-1d42-5346be7ecb1a@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_083222_404009_860A8AA1 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

> I guess if you guys don't think the issue is worth the price of a very small
> performance hit from padding the packets, I will just have to keep this as
> an out-of-tree patch.

I'm thinking it is worth fixing, but i also wonder if your receiver
has a bug. And if it does have a bug, it will probably come back to
bite you sometime in the future.

     Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
