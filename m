Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD71C25B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfldnoFCtlXjDUGIkjCxDruNAojvgZwZWzyNtsiBzQI=; b=sFA9EHYMj7grRGIXesrJzkg07s
	iUU76/H1WG6wcKCqw7qFCztJR3Jptrbw1yqgRTtOf3wUZWKBhJ6gmauiBGo06parIvi9ndvzArPeq
	mr8goXedE5PZTLYUTe5Y/swuigPDWm1zbjdwIvoDmaD45Ydpw5BfhzZF2yKykDJ5eb1QoO2/ikfZS
	/9GeEqv6Tav7UXKbxD2kjketVyxLs5CtvEiiLrdvJTiZvGgkUpqTJ4CKpe5i1tJNIm901+HsD8fKy
	zZYvwutrTrRf3uTIuJissbQqheuAj8JTL90LAeDgdGWxLaejue2POR5DyxkLUOOyAUpsW4hDN/DDr
	84JTNRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s978O-0000000FAh8-1nsg;
	Mon, 20 May 2024 17:49:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s978F-0000000FAc6-313E;
	Mon, 20 May 2024 17:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XfldnoFCtlXjDUGIkjCxDruNAojvgZwZWzyNtsiBzQI=; b=HOEcB3m6VMMOMDPp2cPBpKomlO
	FekL9B6kRdA3i7PGuGVL6jOAl8+l8w4sUza98ZBCYB/she/YBJ87BuBH/uYaxdE0EVgc3NuHmKYlW
	G1Ufav1ydalYq60mo06uVnnWf/kBK2CQ8r2vQNHzg4CLAw1v9RiQvAk9/zNTZjnT/kfcomuOfzkX6
	5T7DUyMXFY3xpexzATBep97nyKXYp78EbdrCUPVIVzmv5gisGMe3TS8KECo+DwihcrSHB0zDyCcvH
	4nTUFM0bejLOuEE2KQzySqDJv7nHOjAlIOYeDIK/HOKE000QjQLooBC1E7cXoNEvMFVCsonX1lTb3
	+UnysHNg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52632)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s977m-0007BC-2Y;
	Mon, 20 May 2024 18:48:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s977k-0004Tz-AX; Mon, 20 May 2024 18:48:36 +0100
Date: Mon, 20 May 2024 18:48:36 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next v2 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <ZkuM9C0Yd/uwwzUA@shell.armlinux.org.uk>
References: <20240517102908.12079-1-SkyLake.Huang@mediatek.com>
 <20240517102908.12079-6-SkyLake.Huang@mediatek.com>
 <cc0f67de-171e-45e1-90d9-b6b40ec71827@lunn.ch>
 <283c893aa17837e7189a852af4f88662cda5536f.camel@mediatek.com>
 <8a5f14f4-4cd9-48b5-a62c-711800cee942@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a5f14f4-4cd9-48b5-a62c-711800cee942@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_104909_652301_53B730F0 
X-CRM114-Status: GOOD (  11.33  )
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

On Mon, May 20, 2024 at 03:02:21PM +0200, Andrew Lunn wrote:
> > Actually this phy is strictly binded to (XFI)MAC on this platform.
> > So I directly disable HDX feature of PHY.
> 
> Sorry, i don't follow your answer:
> 
> Can the PHY do half duplex?
> Can the MAC do half duplex?
> 
> The part which cannot do half-duplex should be the part which disables
> half-duplex.

Note that if the PHY is doing rate adaption (preferably in a form that
it can control the MAC transmission rate), then even if the MAC can't
do half-duplex, the PHY can still do half-duplex.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

