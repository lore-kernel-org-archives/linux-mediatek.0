Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72400C34024
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 18:52:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A521207FD
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 18:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VTahNm3+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="yhcdWpgX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A521207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0OfY9KAxRQYXSKyMJSDgLbTHTRY+ahx7IE82g0nREo=; b=VTahNm3+uQPrbz
	FxY30LStNlgMnYpd8tBN+i3xXBdwsSpjxDidnNItOHNjfDeTDbeytrwnSQ6TVXe5tqTaW6iy642bj
	Tq3vSz+QUtP9r9RIx+s2V0D2TDx2y36U9lPP07t25kPtgxlL+ZaCrxIwLDy33j3MVzDwzMyPFH1/5
	oyo5UoVr9Fk5ZkLaKjaaEca+dTU5SC3IW8NVubxrAsOeyViaw9qqEpgOHYvCT4kda/Kh/YvqaA3Cm
	yxPK8se+htqVJPMvaB+PGQq4mtYzmp68ySniSIt5ZyyC1O2J9UGC5goJmPT5i63cpXlgfuPKJV98w
	FfDytFbtMLFS9as1kkZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3lV0-0000KC-6S; Mon, 17 Feb 2020 18:52:06 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3lUs-0000Bx-EF; Mon, 17 Feb 2020 18:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KvB6f7fGXolTqd/wL5HLgEvOSRwBBfxjMW4EXoEa9po=; b=yhcdWpgXTLtsE1Z1omWazoICP
 DWJVggwX8ttrSOzK7AZnClBhh+SAi72l40EFLARh3Jt0rVM2r6xk1Jz88S9JIiJbImkK1IPxmu0/e
 BU5wTD4PxDU4Vxrpj/2JsoAWktKHWB3LiN7E0FMjcZEE9aSIe+YD3fGyyaWanHJD01AyaRf+mfC/X
 vfmW1ikUx1qrGertc+ueZLBDpuy2NdsBjPL/GjHm6b22OVdCPM3bfgQ9cLdBFmM0V2Zg1Jc85HXxO
 oNRaL6CyA4ZnRywnqi5b7IVcoTtCVvXeqnXTixlkAA/EftaDf56IEL9tJAX8V7/7DEnxIs1Z8zlRP
 5zZhq40hg==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:41636)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j3lUU-0002YH-Ho; Mon, 17 Feb 2020 18:51:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j3lUR-0006Xg-CX; Mon, 17 Feb 2020 18:51:31 +0000
Date: Mon, 17 Feb 2020 18:51:31 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [CFT 0/8] rework phylink interface for split MAC/PCS support
Message-ID: <20200217185131.GC25745@shell.armlinux.org.uk>
References: <20200217172242.GZ25745@shell.armlinux.org.uk>
 <20200217173324.GI31084@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217173324.GI31084@lunn.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_105158_520885_DA32DD2A 
X-CRM114-Status: GOOD (  12.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-doc@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Felix Fietkau <nbd@openwrt.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 17, 2020 at 06:33:24PM +0100, Andrew Lunn wrote:
> On Mon, Feb 17, 2020 at 05:22:43PM +0000, Russell King - ARM Linux admin wrote:
> > Hi,
> > 
> > The following series changes the phylink interface to allow us to
> > better support split MAC / MAC PCS setups.  The fundamental change
> > required for this turns out to be quite simple.
> 
> Hi Russell
> 
> Do you have a branch i can pull and test?

Nothing beyond the branches I've mentioned in the previous heads-up as
yet, sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
