Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF954C77B71
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 09:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ve0v3BXcHpnURI/mRbAt/4SoyLt6cZkubqd3vxYNGhc=; b=lVToOPWMtLCOIXKrG0Jwy5GKSo
	cIpOxpfW3BhqEM993rtZB9v6WNO1KJhxIfUtv4HjIqp1NOi8GD2rYIem4WM5IjZ4ETLUh5bo2yGTD
	Z5agHaCB61be/uGxe2T6UDSS3Lx51R56RRxH31IKIcJDmsTZUJHWVaJeU18RklFDf1STZjv5/Iwvi
	Rg03w4bWJsLmigvS8S8LRJefoTQlS9ZnZ3EhYbz4Jj7MdAwEwuEnSwnMj6GPSpmjZTwQ9yJUvL0ak
	1v0gf/5Ze8rPSSAmxuVUCSCG5h2IMKdRC8o1Qd/++adLdx8R+VZ5NpxDFoh6uOq+ydkQ097+4N+B4
	BcEiLbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prF0F-000e0F-0W;
	Tue, 25 Apr 2023 09:30:27 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3u-000UcW-1E;
	Tue, 25 Apr 2023 08:30:11 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1prE3Z-0001vV-1h;
	Tue, 25 Apr 2023 10:29:49 +0200
Date: Tue, 25 Apr 2023 09:27:56 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] net: phy: add driver for MediaTek SoC built-in GE PHYs
Message-ID: <ZEePDK2oW5xkiEIv@makrotopia.org>
References: <ZEPU6oahOGwknkSc@makrotopia.org>
 <20230424183755.3fac65b0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424183755.3fac65b0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013010_418412_24023595 
X-CRM114-Status: GOOD (  20.28  )
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

On Mon, Apr 24, 2023 at 06:37:55PM -0700, Jakub Kicinski wrote:
> On Sat, 22 Apr 2023 13:36:58 +0100 Daniel Golle wrote:
> > Some of MediaTek's Filogic SoCs come with built-in gigabit Ethernet
> > PHYs which require calibration data from the SoC's efuse.
> > Despite the similar design the driver doesn't share any code with the
> > existing mediatek-ge.c, so add support for these PHYs by introducing a
> > new driver for only MediaTek's ARM64 SoCs.
> 
> Andrew, Heiner, how do you feel about this driver?
> 
> Daniel, is it high prio for you to get it into 6.4 or 6.5 is okay?

No rush, as this is mostly relevant for OpenWrt the thing which matters
most to me is having it in the next LTS kernel, so 6.5 should still be
fine I suppose.

> 
> I'm trying to get a read on whether we should merge it because it's 
> kind of on the goal line for this merge window. 
> 
> If nobody feels strongly we can do this the traditional way - I'll 
> just complain about RCT, hence kicking it back out into the field :)

I understand Andrew's concerns and will resubmit for the next merge
window in 2 weeks, and without the LED part for now until PHY LED
infrastructure is more ready (ie. able to offload 'netdev' trigger
to hardware)


