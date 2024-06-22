Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C54DC27C53
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jun 2024 18:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fIMwbUzHN4iz5w0V7HIL86j5pwhlLZgaN9zrCy1ciM=; b=NwvimedAfAr7dsAjcdzgeZDgC6
	vq6KNBqwT51HfbNIqKkLVykbXG2O5grkVvgW38LwlSyHzsdI6ajWrngDDUIVoB89ioxb8GswVHkJt
	Zqj/p1SMMgZRjDNQZrG1qDCAzkLXgJYzrHh3oKb47WIsKHszSo8iEnKAeP9mq5kGCOVTVu4y/u7vX
	52+90aCz4PpdHLK1eewEFXSCtmd/vTcPZ5Y2wdV3AoG/htYH/TZZgnhFtP4SUM6T1Vsvjp0iujPaV
	cLeK65jj1GGV6E7pAP+4Rgw0RP67bPobl1Y2galmjfTovaY4p7pZ+h9x5aWXPxZcsKqsvCBsoFnh2
	iDS89rzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL5WE-0000000CbXi-48KA;
	Sat, 22 Jun 2024 18:31:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL5W9-0000000CbWO-1ZGT;
	Sat, 22 Jun 2024 18:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7fIMwbUzHN4iz5w0V7HIL86j5pwhlLZgaN9zrCy1ciM=; b=2pEnDPoR0Majl9M3HZM1qbMsw5
	rgv3cLtbDjMrupC7vkdbgk2OII3A22nkK9G7dfDTZw3hLG0ucndqT9wMLpGdpy8YjAFXEjd2M3fxC
	7Q5Q9gpmhq9++wk3Cxp3EOC8ew6ToCvshdgpUyKQGzCAlELqY/pFX+vyI7Kq4F52MGj8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sL5Vq-000kE5-HH; Sat, 22 Jun 2024 20:30:58 +0200
Date: Sat, 22 Jun 2024 20:30:58 +0200
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
Subject: Re: [PATCH net-next v8 12/13] net: phy: mediatek: Fix alignment in
 callback functions' hook
Message-ID: <2a040d91-3514-4502-b6d6-7c147f91cf6b@lunn.ch>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
 <20240621122045.30732-13-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122045.30732-13-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_113117_439722_F6C29BBB 
X-CRM114-Status: UNSURE (   7.90  )
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

On Fri, Jun 21, 2024 at 08:20:44PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> Align declarations in mtk_gephy_driver(mtk-ge.c) and
> mtk_socphy_driver(mtk-ge-soc.c). At first, some of them are
> ".foo<tab>= method_foo", and others are ".bar<space>= method_bar".
> Use space instead for all of them here in case line is longer than
> 80 chars.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

