Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60B1C41513
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/clXXo7kzRknH8ikk7V5RxPUinKJGSpvokwBZ9o/tc=; b=oXKbc6yakm8Q9kTxyXJE7ZyXBV
	CA3gyohkwb3wRH43DsU+yDtFH4uXauiS9qvb3XheurP06f+ZNal2AC0cJ9ngDjz09wkotM5SOoiwp
	xUqn4LzDkb/uGACoZt9ptkq/EIwXgPoM/lNEgqo1EjljMxC/2EbkpM57TGcO1r+stPffex3KNBfVx
	zcXRPsFliMejx89oSCZO/DUklNszj3McJxJndnoU7V6YSA9a/gO1wA+2CphHnq//gr3Osmrpee3Le
	FKDf/kjxFmG2mWj8S+sRcfAd04RUGtcYFWGlZqb1AhYYABhi2kONEntDAKVx1hrW51s5Gu7ryZQbD
	JQYcEtkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAtj-0000000AYpZ-0QfU;
	Mon, 17 Jun 2024 11:51:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAtf-0000000AYod-3WkB;
	Mon, 17 Jun 2024 11:51:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA5A561255;
	Mon, 17 Jun 2024 11:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9DCC2BD10;
	Mon, 17 Jun 2024 11:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718625098;
	bh=mc0bGXWJFZ4yGc+KJkzDwcQtkgRCAWRR3tEfYbXyIuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l+oBvuNh6ziIKKRNICnMZeU0cB+khP6dnovw3xE/Ot4mNRf+Bqy1Ap8yu4OGexTcp
	 giIpK+xqCu3YiTLaXxTVSc/2ycOOCgiX53oHmtwE6cFiT8+aLwFdNB6N8Xyk5vqNp7
	 jpG4qKeEfyyzi2ifWAVyqBOamnVZJHP7FxApnNo+dNqxvfaSFW15brcimSJ/zjezD+
	 XkFwIdFyiJxaQ1uA9bExGlMv6B16ARH08Lel0W6QlZDKhG6ocLrFK61+o28wLm4Q2X
	 8fPPREB8kQHLQR8WxU97DEmoeCtQFNX9sm+OJsanfg4wMOrh8Bq2ILfqM6S0k7yayT
	 NOvGvtq/BmolA==
Date: Mon, 17 Jun 2024 12:51:32 +0100
From: Simon Horman <horms@kernel.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v7 2/5] net: phy: mediatek: Move LED and
 read/write page helper functions into mtk phy lib
Message-ID: <20240617115132.GR8447@kernel.org>
References: <20240613104023.13044-1-SkyLake.Huang@mediatek.com>
 <20240613104023.13044-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613104023.13044-3-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_045140_034345_F99FAA06 
X-CRM114-Status: GOOD (  15.46  )
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

On Thu, Jun 13, 2024 at 06:40:20PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch moves mtk-ge-soc.c's LED code into mtk phy lib. We
> can use those helper functions in mtk-ge.c as well. That is to
> say, we have almost the same HW LED controller design in
> mt7530/mt7531/mt7981/mt7988's Giga ethernet phy.
> 
> Also integrate read/write pages into one helper function. They
> are basically the same.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

...

>  static int mt798x_phy_led_blink_set(struct phy_device *phydev, u8 index,
>  				    unsigned long *delay_on,
>  				    unsigned long *delay_off)
>  {
>  	bool blinking = false;
>  	int err = 0;
> +	struct mtk_socphy_priv *priv = phydev->priv;

Hi Sky,

A minor nit from my side.

If you need to respin this patchset for some other reason, please consider
preserving reverse xmas tree order - longest line to shortest - in this
function.

Likewise there are a few other changes in this patch which look like they
could be trivially updated to preserve or adopt reverse xmas tree order.

Edward Cree's tool can be of assistance here:
https://github.com/ecree-solarflare/xmastree

>  
>  	if (index > 1)
>  		return -EINVAL;

