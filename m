Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE2FC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 22:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezBxF58/iYt4ytGREKmk4EHJi+NewNz9aFNzcPhEcYw=; b=JkSMOG2hGn2RJu73vw2Yj7qq+1
	CHBSHl/XbYhfTB29Bkt7XMn89++MF5KJH36Fr0cEMu00Q1bMiRKR6l7xARxRY57PsrJlj+w2nWzjR
	RniE4IPH/xfwtTdHkBmvcVdptH2Zh33x4haORSX+ycMjIg7+ss3OB7Ryva/HnDKbqbYEy8rhk/nzI
	AwxGLvMbXd3n6mmfVbKBApzuFaDT8ohlF9uO0mUO2GLZLusRqaDCkr2g4e2XuMPjT8bHYzsP81ie9
	nfHwhPqz++uCSiOdqPUoOzuprxzmYgCXcmHkUZKMqh+8sWqscpX5Gw1KAdb4yr2cjg0DWW+2eSx49
	jjSqRA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCph8-005OZR-T4; Tue, 03 Jan 2023 22:23:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCpdt-005NZm-Qn; Tue, 03 Jan 2023 22:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ezBxF58/iYt4ytGREKmk4EHJi+NewNz9aFNzcPhEcYw=; b=Un/ZBjj4THLRJFaI3jBbBXkucy
	xUI45WocO2gEO94eHnU3fsLtEM94vFQJoIlVZX/9HlebD8cYZ7AqzkZbTzQyfpm0busc46Zl6wGIt
	orx2qJbtdDR/A1TDXLQ7OuLpdyKD1cZGfboGkfGZTaIqpEBt9qpW3+rKCOOc0Vaow2HK5bdhWWEC8
	r5gDwaYGw4UWlrG6yIp6FVO6QyJLujP2p0BqvDTT/bJOW+4aVLyerujnJl7TQK2UWv/0/aekLlGsV
	YmDgPgPWpRE2fqy4vb9DmQJznADN+64HklkJ1Lop1Ji3UZM0WuswEq/SYcVpdud1/JF7ssBuVDZhL
	lBF6XAkQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35956)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pCpdY-0005wc-Hc; Tue, 03 Jan 2023 22:20:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pCpdR-0002SM-O6; Tue, 03 Jan 2023 22:19:53 +0000
Date: Tue, 3 Jan 2023 22:19:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Michael Walle <michael@walle.cc>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH RFC net-next v2 03/12] net: mdio: mdiobus_register:
 update validation test
Message-ID: <Y7SqCRkYkhQCLs8z@shell.armlinux.org.uk>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-3-ddb37710e5a7@walle.cc>
 <Y7P/45Owf2IezIpO@shell.armlinux.org.uk>
 <37247c17e5e555dddbc37c3c63a2cadb@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37247c17e5e555dddbc37c3c63a2cadb@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_142021_967600_B2CD8A8D 
X-CRM114-Status: GOOD (  15.09  )
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

Hi Michael,

On Tue, Jan 03, 2023 at 11:21:08AM +0100, Michael Walle wrote:
> Hi Russell,
> 
> Am 2023-01-03 11:13, schrieb Russell King (Oracle):
> > On Wed, Dec 28, 2022 at 12:07:19AM +0100, Michael Walle wrote:
> > > +	if (!bus || !bus->name)
> > > +		return -EINVAL;
> > > +
> > > +	/* An access method always needs both read and write operations */
> > > +	if ((bus->read && !bus->write) ||
> > > +	    (!bus->read && bus->write) ||
> > > +	    (bus->read_c45 && !bus->write_c45) ||
> > > +	    (!bus->read_c45 && bus->write_c45))
> > 
> > I wonder whether the following would be even more readable:
> > 
> > 	if (!bus->read != !bus->write || !bus->read_c45 != !bus->write_c45)
> 
> That's what Andrew had originally. But there was a comment from Sergey [1]
> which I agree with. I had a hard time wrapping my head around that, so I
> just listed all the possible bad cases.

The only reason I suggested it was because when looked at your code,
it also took several reads to work out what it was trying to do!

Would using !!bus->read != !!bus->write would help or make it worse,
!!ptr being the more normal way to convert something to a boolean?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

