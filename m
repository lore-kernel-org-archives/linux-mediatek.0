Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDAECFB424
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 21:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPQoYBPRMNpwQ09B3tMXU8XkIK482ejuRAvIGOjeGC8=; b=la5SiG2mwRf7u0/J69gT8IzA+0
	ANj+LU+2Twax1CdA1HSSLISApy840JryRUHO285ttvT7TYPRyjUusc2ijO8kNxMZKMffuZ6SntBIB
	b+vlxFhKHUnr+e3VB0DgKjy7p3u5f49qmqSefI2DcbSKlYqyNl8us2hhkQFX7jwbujUL3h+Moxqnk
	MCXNXFWIM4pyfoOiGI5x5xZk2tYf2B2y2lTPl6seCwegUOEI0rwZriuDyKr1QlN9TfrR09lQa6ClF
	oaw32tB0drXT0y7RxDhn4xc4+k1eLjIJRl7Kr2BEknMlm7rjPJ8UFq0H5rSL++17yuraHXDBHEnEE
	FMp7ox1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxYgS-00000000e9l-448C;
	Sun, 06 Oct 2024 21:20:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxYfB-00000000dzO-1nng;
	Sun, 06 Oct 2024 21:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HPQoYBPRMNpwQ09B3tMXU8XkIK482ejuRAvIGOjeGC8=; b=RxntyarEm99B8+D21x7hEOXplJ
	3CedBEN/9qwKK7ruacxgznIdUdAOGhcv57KMKCZGt9Gzicxa1M78dfCNLWEtz+/8NbU8ePChZvMrJ
	8CAgvY5UYFU8kALnpsree0pc4rbwm0G+3UTwca3BM6woBJ0ipoHh7i/G3q6Xgp94da+0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sxYet-009CxQ-Ae; Sun, 06 Oct 2024 23:19:19 +0200
Date: Sun, 6 Oct 2024 23:19:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: Re: [PATCH net-next 1/9] net: phy: mediatek: Re-organize MediaTek
 ethernet phy drivers
Message-ID: <1b313678-1241-4e2e-a36d-d4eb28d2fbc8@lunn.ch>
References: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
 <20241004102413.5838-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004102413.5838-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_141937_492457_92456C86 
X-CRM114-Status: UNSURE (   7.71  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 04, 2024 at 06:24:05PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> Re-organize MediaTek ethernet phy driver files and get ready to integrate
> some common functions (and add new 2.5G phy driver).
> mtk-ge.c: MT7530 Gphy on MT7621 & MT7531 Gphy
> mtk-ge-soc.c: Built-in Gphy on MT7981 & Built-in switch Gphy on MT7988
> (mtk-2p5ge.c: Planned for built-in 2.5G phy on MT7988
>  --> in another patchset)
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

