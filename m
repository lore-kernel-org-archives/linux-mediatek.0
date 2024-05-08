Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23929C04FFE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 14:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tXdiWXCpmM5UR7kg8QYNclGPvK4YT+WPL9ep/mpbuc=; b=pY0T11ghY1MIskQR0rP6f1uRDz
	cSj9XjEQ1GM0uz8BNjEOSA26T/kP3L8afoCaJvyQxfQhvDjhqnQd8fTaMt7GuOPmONmr8JOokHTkp
	neo8sHKnUayQ+tj3EyLXWpJy4ISe9TXJWpIR+FoqA2gRjirN2/ydve6aCl8EWvHwFBWIhVT84x+p7
	LLzgID8R52vXBu35m0Ubml2lf2woSiB/mKUNTq1Ijp0mR20KjLI+TMb6s9p+LgXD0fmUGPhqWeBZ2
	90ImvujR7KH9d9cFEUGO6xMKH/iokjsqC5M68WoHj2f38A84gYM55LzuhQCfp38zUJhYn1p2SpxNx
	99LNh+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4hsR-0000000FmLR-2pGW;
	Wed, 08 May 2024 14:02:35 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4hsJ-0000000FmJu-3Ipz;
	Wed, 08 May 2024 14:02:32 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s4hs5-000000002fw-0jV9;
	Wed, 08 May 2024 14:02:13 +0000
Date: Wed, 8 May 2024 15:02:08 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Sky Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: Re: [PATCH 2/3] net: phy: mediatek: Add mtk phy lib for token ring
 access & LED/other manipulations
Message-ID: <ZjuF4L8xIwDqyMad@makrotopia.org>
References: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
 <20240425023325.15586-3-SkyLake.Huang@mediatek.com>
 <Zjo9SZiGKDUf2Kwx@makrotopia.org>
 <a005409e-255e-4633-a58c-6c29e6708b34@lunn.ch>
 <Zjt5iobHklvrVgtB@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zjt5iobHklvrVgtB@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_070227_853939_EB23210C 
X-CRM114-Status: GOOD (  16.34  )
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

On Wed, May 08, 2024 at 02:09:30PM +0100, Russell King (Oracle) wrote:
> On Wed, May 08, 2024 at 02:25:56PM +0200, Andrew Lunn wrote:
> > Please trim the email when replying to just what is relevant. If i
> > need to page down lots of time to find a comment it is possible i will
> > skip write passed a comment...
> 
> +1. There are _too_ _many_ people on netdev who just don't bother to do
> this, and it's getting to the point where if people can't be bothered
> to make it easier for me to engage with them, I'm just not going to be
> bothered engaging with them. People need to realise that this is a two-
> way thing, and stop making reviewers have extra work trying to find
> their one or two line comment buried in a few hundred lines of irrevant
> content. I might just send a reply, top posting, stating I can't be
> bothered to read their email.

Sorry about that, note taken. I'll take better care of that in future.

