Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BD2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4JhDILOenYEHHP+r8qTrz3F8xKfeqT0QG4dU7KwOGo=; b=lKzShhVm0gHhak
	k/Hp+yIWTCJ+w+HHJfVE8++8KRKANCzFG45NCnubU92tmLR/3xk9KkDOvR+NEpm618uvU4aSbjv0f
	RwGSyMfkzZ4Aei9tjF/3WLAQf50awk8ppZff00jlsfU1YqZT8HxQlqS9SPbzqeOW9ELEpWXTLcugm
	Wl+tPWH0e6f0SMsYYcLzvQH32sJpXYDFOqgkx1lIqfF17yj1qp7YXqEFDzTwLSvCPUqQhxW6z39Tz
	nYU48Yf8WTN81hMm6mHCSenpiwuwHfiY6lZNkOB9B8qvZIuMozAhsIogiy/bnuf/f3HsZ1D2jPFzm
	Yel5EK0T0MTT1av1DPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrLtv-002uh7-9G; Wed, 18 May 2022 15:47:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrLts-002ufv-Dq
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 15:47:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E57E9B81E9C;
 Wed, 18 May 2022 15:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271A6C385A5;
 Wed, 18 May 2022 15:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652888862;
 bh=bs9W7OCncR8gEQ1uTaOzOqEwcuKz+nCPcAJadJVgxNc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UZO5OfN2DSJz+BoS0Xq/rGAZmjmQFfex307IwzNHldkA4Vv4MOaL7foOTDUtx5nrz
 lcrHqDjXUlzNbILx2j+RCzjKef4u+1+KU5nijpNWHslUOP0c7bBcdTJlpQrihfIDFP
 r9/RbSc7YCHUl5bZ3PS2GR1p85XvHNB941mxhRSFMX2gW5+FOKPtgkDgI8SpGC7fr1
 gxKIO4d10CjWcuKxgpTV5YMrpI92I2YeFYESDvKGyAVDvZpVgBjVdxVfQBhU7x5+J3
 FsCml0JYbo+G68tWS2N+jP7KeltVjyLy7aQ8AsdFaOfPe8hxfksyKvtSITNf9+FRvy
 2OG72z6kkUvIw==
Date: Wed, 18 May 2022 08:47:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 12/15] net: ethernet: mtk_eth_soc: introduce
 MTK_NETSYS_V2 support
Message-ID: <20220518084740.7947b51b@kernel.org>
In-Reply-To: <YoTCCAKpE5ijiom0@lore-desk>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <cc1bd411e3028e2d6b0365ed5d29f3cea66223f8.1652716741.git.lorenzo@kernel.org>
 <20220517184433.3cb2fd5a@kernel.org> <YoTCCAKpE5ijiom0@lore-desk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_084748_645068_079A704B 
X-CRM114-Status: GOOD (  12.69  )
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

On Wed, 18 May 2022 11:53:12 +0200 Lorenzo Bianconi wrote:
> > > +	WRITE_ONCE(desc->txd7, 0);
> > > +	WRITE_ONCE(desc->txd8, 0);  
> > 
> > Why all the WRITE_ONCE()? Don't you just need a barrier between writing
> > the descriptor and kicking the HW?   
> 
> I used this approach just to be aligned with current codebase:
> https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/mediatek/mtk_eth_soc.c#L1006
> https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/mediatek/mtk_eth_soc.c#L1031
> 
> but I guess we can even convert the code to use barrier instead. Agree?

Oh, I didn't realize. No preference on converting the old code 
but it looks like a cargo cult to me so in the new code let's 
not WRITE_ONCE() all descriptor writes unless there's a reason.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
