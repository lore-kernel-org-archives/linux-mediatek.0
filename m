Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4340C624DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFBkR9T0SQCtUDwL8PQObCORwH0zWTKutCjB4dzETP4=; b=ybgZhoRsyDiO0qvwvSOKFY34X/
	+ZVZrH4EI9pInDdVuXDlzD/YmRwR+rWCo0oh2RJg3uw5TP2lkEUukdSsu2jGDhG8jYl2G4BsrmQhV
	YQVDW5i9GGAQNd5y9GFCDduIKvDD68YXaniPozEq7NVB1lpYe4ykF1Msot30GJ/H6jRZqh3cx3HUT
	t8ULg2Bf6PkncVT31m3VY6UzMi3RNWtukmarQvNJG7Q2N1Vl3OYiJyQLRbkWedvMU6aANZtR0NJL+
	1HIhNP+yLrU1UfVIYcFC7om722dbcSOZAkvFSHp4tV5ds/nL97GBaMNFvWb+423ef+PWYVFKRiqVs
	HSJW+BPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WIy-00000002bGw-1MBA;
	Fri, 04 Sep 2026 15:58:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WIw-00000002bGa-12oj;
	Fri, 04 Sep 2026 15:58:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B92E600C8;
	Fri,  4 Sep 2026 15:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D661F00A3D;
	Fri,  4 Sep 2026 15:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537493;
	bh=xFBkR9T0SQCtUDwL8PQObCORwH0zWTKutCjB4dzETP4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YeoORvmHxqLmUVtXYpglFo8Xgu1ji5AKGIXIO6Mm8N5xIm4dXmqXD+clgqcWKLeY3
	 TQXS47+v9ZKtzRnB9bwcmz/xuaotwZQZt+msSrow1xFdWHhWuZI7rpSimHlnU7ercc
	 qq8732lFwY9ju3z4VMdciwyPv6/45agXQqEHVc/j1wIeyMWtwmURw6TnxLOh6kUjXE
	 qt2RQj1/NpPKFcBnXJsX+gLYdYGuK6yw7/7pPoiKZQlxG6bMMx5OD2cxw6yQjanA0O
	 l6mxQekLsEfYk02DnMQQtBWF+b1uSpc35BoRUjFKJ/MvNqfSS5szwk94rmCJUfqbjD
	 pTinIofYxQYWg==
Date: Fri, 4 Sep 2026 08:58:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: <dario.binacchi@amarulasolutions.com>, <mkl@pengutronix.de>,
 <mailhol@kernel.org>, <msp@baylibre.com>, <florian.fainelli@broadcom.com>,
 <jonas.gorski@gmail.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <kurt@linutronix.de>, <hauke@hauke-m.de>, <chester.a.unal@arinc9.com>,
 <daniel@makrotopia.org>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <ansuelsmth@gmail.com>,
 <linusw@kernel.org>, <luizluca@gmail.com>, <alvin.sipraga@analog.com>,
 <clement.leger@bootlin.com>, <justin.chen@broadcom.com>, <dlan@kernel.org>,
 <rogerq@kernel.org>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
 <rjui@broadcom.com>, <sbranden@broadcom.com>,
 <bcm-kernel-feedback-list@broadcom.com>, <opendmb@gmail.com>,
 <andrei.botila@oss.nxp.com>, <wangruikang@iscas.ac.cn>,
 <amadeus@jmu.edu.cn>, <kees@kernel.org>, <tmshlvck@gmail.com>,
 <c-vankar@ti.com>, <horms@kernel.org>, <vadim.fedorenko@linux.dev>,
 <daniel.zahka@gmail.com>, <nora.schiffer@ew.tq-group.com>,
 <v-singh1@ti.com>, <oss@vassilevski.com>, <haokexin@gmail.com>,
 <alex@sverdlin.org>, <aleksandr.loktionov@intel.com>,
 <lgs201920130244@gmail.com>, <linux-can@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH net-next 00/33] Remove comma after sentinel entries in
 match table
Message-ID: <20260904085811.7e2c2db6@kernel.org>
In-Reply-To: <20260904043724.2955444-1-s-vadapalli@ti.com>
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 4 Sep 2026 10:06:06 +0530 Siddharth Vadapalli wrote:
> This series removes the comma present after sentinel entries in the match
> tables across all networking subsystem drivers, with the exception of the
> davinci_mdio.c driver, for which, the patch posted by Geert at:
> https://lore.kernel.org/r/e481b6de46cecc6ea604ae165272c667274cc621.1788437140.git.geert+renesas@glider.be/
> does the same.
> 
> Since I inquired about a cleanup across the entire networking subsystem but
> didn't get a response:
> https://lore.kernel.org/r/b3d19098-eccd-4619-b667-ad3b7e0a4422@ti.com/
> I decided to post this series. Given that Andrew Lunn acknowledged the
> cleanup of the davinci_mdio driver:
> https://lore.kernel.org/r/abec6831-d344-489d-b70c-1e5dd4d43c2d@lunn.ch/
> and I don't see why the cleanup is specific to davinci_mdio driver alone,
> I am hoping that this series is treated identically to the patch that
> Geert had posted for the davinci_mdio driver.
> 
> Series is based on commit
> 6ebcf5074cff net: openvswitch: don't schedule rebalancing if there are no datapaths
> of the 'main' branch of the net-next tree.

You failed to specify why this "cleanup" makes a difference.
have you ever seen the sentinel not be the last entry?

