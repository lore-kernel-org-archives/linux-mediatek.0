Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00762C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 14:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GlVc4zKREU56WDvqLuwnTVjc2xWO2Zq6nWl+7hmFE0=; b=XZR0uk44BUx45s
	JLReyI9DijZhqcAfkZJjwWrXAeZztuQhYxl9d7RpATZTD0dPJZjzR2cyzyMhwlU97ER7ID3Lef7vy
	M3IGijzmEybZ1okGf+smjq+bo+wE3QbQzCIT+plSH9qMe1SElbTrpFmbknga6+vdBkU2jofoqyZ1m
	/ZSPXEKCS+WpYWKJ/YjdT7Icimw1JLW1OWwhPL9uVtoUbLaae53aYjDfo+OF/UgLENQX8BgYVim44
	WqVbXzFqpqwL8vjLpqAfmVILf2U1IDyttTTJzQSf9fIgA9XHVT81gPbKZVyjbv6Th/lGsO13EyjJL
	6EIMx3UVQxkmO9AWB94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nonPA-007ELD-PO; Wed, 11 May 2022 14:33:32 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nonOx-007EDT-2P; Wed, 11 May 2022 14:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=bEAJtgnMEKMbBgh9iYBqIdW4JqbXFYk0M7Z0CTygwNQ=; b=EK9OTj7tkiqGEEdsbkjzOt8cx+
 9PIAG7mefFSDJPIn5ZVbt62K5LHyorLQQHfuhVglXto87oC3GVbpSJdKrSltBrOQo9vm0W42kpgC1
 J7XQo/TiiBKbxVnZD+Xs1NW4V73B38KhiaGIbhVXlliV8iLudKNUzPMu10egYaNWJf64=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nonOY-002Jqv-2H; Wed, 11 May 2022 16:32:54 +0200
Date: Wed, 11 May 2022 16:32:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
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
Message-ID: <YnvJFmX+BRscJOtm@lunn.ch>
References: <20220510094014.68440-1-nbd@nbd.name>
 <20220510123724.i2xqepc56z4eouh2@skbuf>
 <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
 <20220510165233.yahsznxxb5yq6rai@skbuf>
 <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
 <20220510222101.od3n7gk3cofwhbks@skbuf>
 <376b13ac-d90b-24e0-37ed-a96d8e5f80da@nbd.name>
 <20220511093245.3266lqdze2b4odh5@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511093245.3266lqdze2b4odh5@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_073319_146644_5A67D4A6 
X-CRM114-Status: GOOD (  12.63  )
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

> Let's see what others have to say. I've been wanting to make the policy
> of whether to call __skb_put_padto() standardized for all tagging protocol
> drivers (similar to what is done in dsa_realloc_skb() and below it).
> We pad for tail taggers, maybe we can always pad and this removes a
> conditional, and simplifies taggers. Side note, I already dislike that
> the comment in tag_brcm.c is out of sync with the code. It says that
> padding up to ETH_ZLEN is necessary, but proceeds to pad up until
> ETH_ZLEN + tag len, only to add the tag len once more below via skb_push().
> It would be nice if we could use the simple eth_skb_pad().

There are some master devices which will perform padding on their own,
in hardware. So for taggers which insert the header at the head,
forcing such padding would be a waste of CPU time.

For tail taggers, padding short packets by default does however make
sense. The master device is probably going to pad in the wrong way if
it does padding.

   Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
