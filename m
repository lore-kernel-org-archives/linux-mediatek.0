Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C02C25B7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFRehB/GDW22WEVdSVIndBEfguGCbpOMzZOO/CrlY5Y=; b=CAXAwqyp2BtaZSmd7miIesdGba
	GJ+IcDospqYOkuUUoAINPNx/Wvocp513bSm2d7YrofUGQKcpGvKgsToCQusQXFkvUgl1mjLTzSrkJ
	fKyXVHXi3IkCwFzzDSWzMOzm0Xx9H/gCLVFVZW0YCfR87GGIctW2aVc4Xh14+hyJtplnoIT7jcLHd
	nsobzI5jxDMakrZAQY7UWjqX5wQFgpy9TA/WYlB3U01GEQWZnibznV6MQjrOgNOgYLJ0P8z0S/Ztb
	8/i17uMpdcPdZ8WspSnswrZUWZSGrwt9qM1yRBZrwXEv0fG9yT/Ngw/4Sy00rF/z6l/plQO28NXf3
	iV/N1Saw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PLZ-0000000HZWT-3muI;
	Tue, 21 May 2024 13:16:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PLW-0000000HZVa-1Qyr;
	Tue, 21 May 2024 13:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BFRehB/GDW22WEVdSVIndBEfguGCbpOMzZOO/CrlY5Y=; b=zFDyqK+Gfj3rf8gORrZJRRY6b4
	mfuVqCNU39JlBT6l5vhjeF+ZSDPOFpY4CAwAJ6rOIZf2R533tkFBYX0RvH1VM+rgG4tAua7x12BeJ
	R7/YdlQAEpSyDNOj5WUQgYTkalfcPrBpr+NJeSYqj5qgvH9bFcYPgGMkUsfm+FxNT8Ss=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s9PLD-00FlFs-Hj; Tue, 21 May 2024 15:15:43 +0200
Date: Tue, 21 May 2024 15:15:43 +0200
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
Subject: Re: [PATCH net-next v4 0/5] net: phy: mediatek: Introduce
 mtk-phy-lib and add 2.5Gphy support
Message-ID: <80186a3c-8e9a-4a7e-9ead-6773c0bf0ebf@lunn.ch>
References: <20240521101548.9286-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521101548.9286-1-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_061602_413204_3E6B89E0 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, May 21, 2024 at 06:15:43PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> e-organize MTK ethernet phy drivers and integrate common manipulations
> into mtk-phy-lib. Also, add support for build-in 2.5Gphy on MT7988.
> 
> v2:
> - Apply correct PATCH tag.
> - Break LED/Token ring/Extend-link-pulse-time features into 3 patches.
> - Fix contents according to v1 comments.
> 
> v3:
> - Fix patch 4/5 & 5/5. Please see changes in 4/5 & 5/5's commit log.
> - Rebase code and now this patch series can apply to net-next tree.
> 
> v4:
> - Fix patch 4/5 & 5/5. Please see changes in 4/5 & 5/5's commit log.

Please slow down. Discussion on the previous version has not come to a
conclusion yet. Posting a new version just wastes reviewer time.

Also, we are in the merge window at the moment, so nothing is going to
get merged until it closes.

	Andrew

