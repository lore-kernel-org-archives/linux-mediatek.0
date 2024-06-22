Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB244C2BB85
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jun 2024 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GyVIihLUx0nGqKGEegbeYIidd0aXz6jh9AS4kbhq8k=; b=wc5lnjc/UujD6DaoHr0WMtnv7v
	lPf7epwd/s3TStCfo7vuLYblA9NO7puFEoJDoXLhEm6o9EWRGQBqJSmUPZNJSCRG7J9Q4NeE86LsS
	tRal5y0RA0+UJAby/hA983ULxOKZ6d6EBt2PMQWmyDrrsdItFJUTyp5kUPOPQThw1aJAbb/FMNwZU
	GbeEOFp7R8i6wtQPNQqZ0T1kzdanUY1s+G11Ucc6Uf9+siGd5oGcXNOfSb4vysreln6S0r2RE0wjp
	I9juL6J7CMrHePJkA57mKCudcx9S/56GUWnTqbwuHj0N8eTXVjz+tzIjoR6tRIoIiOemX53Ry9PEj
	tJzICJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL7tr-0000000CnTY-1XWl;
	Sat, 22 Jun 2024 21:03:55 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL7tl-0000000CnSu-0D8r;
	Sat, 22 Jun 2024 21:03:50 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sL7tS-000000005kt-28az;
	Sat, 22 Jun 2024 21:03:30 +0000
Date: Sat, 22 Jun 2024 22:03:24 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v8 06/13] net: phy: mediatek: Hook LED helper
 functions in mtk-ge.c
Message-ID: <Znc8HI6noTr7myYP@makrotopia.org>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
 <20240621122045.30732-7-SkyLake.Huang@mediatek.com>
 <e1ed191f-7c70-4c34-ad1f-40aaae18582b@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1ed191f-7c70-4c34-ad1f-40aaae18582b@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_140349_187368_5A9EE2DB 
X-CRM114-Status: GOOD (  10.06  )
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

On Sat, Jun 22, 2024 at 07:29:45PM +0200, Andrew Lunn wrote:
> > [...]
> > +	if (index > 1)
> > +		return -EINVAL;
> > +
> 
> It looks like this test could be moved into the common code. It seems
> like all variants have a single LED.

Exactly two LEDs, which is what index > 1 checks for, but yes, it
should be moved to common code.


