Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597BDC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bE204A6j9jW8IP4ZSFNiQVkyrFQKzyAD+pAE674zLDY=; b=IHkdN4LIUvyO9RmIN1Hh9sSjK6
	aULwsb9pugV8IcpwDtv/k7Wttu5UVW+uAki3DNgjPjd2ur0ORvisxH8PvwjqUoMDRedWFEjEUm6sE
	+uOqhqdhwAIQPr5d+OVMS3mSaL1+AQruNw6eG5p+46MM3J+lCDjH2RRHBKuieGIvQiEXsRdAQnBVJ
	MfRZ1XvpQ2jZPb3vD9gFMEOIWv43olJMwISYl37Qj1VIZ5ls34c41pGVkQWn040IxC7v7LznPW+pe
	5splzXl9FJSjRCr3F0tGNQ490MtBiY6qXfaTQG2lJY7qQbWwu+NgSqcuRGU78tne2XZIkoZLpUEhj
	Znx6UQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYu4-0015Ic-7y; Tue, 07 Mar 2023 15:07:00 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYI8-000n5N-B0; Tue, 07 Mar 2023 14:27:49 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pZYHT-00012B-1d;
	Tue, 07 Mar 2023 15:27:07 +0100
Date: Tue, 7 Mar 2023 14:27:02 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next 4/4] net: mtk_eth_soc: note interface modes
 not set in supported_interfaces
Message-ID: <ZAdJtvKe1txMjp3f@makrotopia.org>
References: <Y/ivHGroIVTe4YP/@shell.armlinux.org.uk>
 <E1pVXJK-00CTAl-V7@rmk-PC.armlinux.org.uk>
 <ZAcnjXxLfeE9UIsO@shell.armlinux.org.uk>
 <ZAc7Q4VMzLjzQbRC@makrotopia.org>
 <ZAdEi2TsIw8Vjsh8@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAdEi2TsIw8Vjsh8@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_062748_407140_ED53CD5F 
X-CRM114-Status: GOOD (  19.60  )
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

On Tue, Mar 07, 2023 at 02:04:59PM +0000, Russell King (Oracle) wrote:
> On Tue, Mar 07, 2023 at 01:25:23PM +0000, Daniel Golle wrote:
> > A quick grep through the device trees of the more than 650 ramips and
> > mediatek boards we support in OpenWrt has revealed that *none* of them
> > uses either reduced-MII or reverse-MII PHY modes. I could imaging that
> > some more specialized ramips boards may use the RMII 100M PHY mode to
> > connect with exotic PHYs for industrial or automotive applications
> > (think: for 100BASE-T1 PHY connected via RMII). I have never seen or
> > touched such boards, but there are hints that they do exist.
> > 
> > For reverse-MII there are cases in which the Ralink SoC (Rt305x, for
> > example) is used in iNIC mode, ie. connected as a PHY to another SoC,
> > and running only a minimal firmware rather than running Linux. Due to
> > the lack of external DRAM for the Ralink SoC on this kind of boards,
> > the Ralink SoC there will anyway never be able to boot Linux.
> > I've seen this e.g. in multimedia devices like early WiFi-connected
> > not-yet-so-smart TVs.
> > 
> > Tl;dr: I'd drop them. If anyone really needs them, it would be easy to
> > add them again and then also add them to the phylink capability mask.
> 
> Thanks! That seems to be well reasoned. Would you have any objection to
> using the above as part of the commit message removing these modes?

Sure, go ahead, sounds good to me.

