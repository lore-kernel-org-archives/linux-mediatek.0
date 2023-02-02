Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FBCC05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 16:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIhEi6ttvP0lJU+5WCdxSL+GeMSa1GjHCMM3WgC2HbI=; b=mTGPSNiQo7oncvF0MSZXAsb3d9
	JzN8naBCnpDnce7K/vgvKrrCxZrbqaZKh1gnW32Udwsl/qQiPLaHOdrnujGPrA4DB/CHEAB5/w/s/
	qBxIruLRcBv7TV2iyLsc9QPuwNS5JX0nHx7/bCeXwJcquRLUwaANKoz++uV3/9P2bl4PNu01D42xX
	zExzVKS0+AXQoLqkroIEtR/pRU5grxbwmIIvMMkO94b1aXldUDtdcz+eeEp8MfrAkdbOyNEJNAhMS
	lERQzxv2Rxuw5lZeMb9/lrwl2w0ozMd/pIAS5aZJF3796mWp51Ces3NzeqCRv8tmjRiFOwRKdlIAC
	YBoCrCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcZa-00Gg1U-AU; Thu, 02 Feb 2023 16:36:30 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcZQ-00Gfxy-3P; Thu, 02 Feb 2023 16:36:21 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 10E625C00EE;
	Thu,  2 Feb 2023 11:36:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 02 Feb 2023 11:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675355779; x=1675442179; bh=TIhEi6ttvP0lJU+5WCdxSL+GeMSa
	1GjHCMM3WgC2HbI=; b=VSnQjrveDF/yWKN17jbl9A9KQ/20d/BLeyFmh0sJKD56
	mr2sArWTxPJqrq0t21IsDdsmuGPwzjV8N3BCxZkYApxD4AySNsR8Q5pubCcrm6N9
	v0HNjbvyq7XNxz9EYe+S74z9J/64clwZjICyOemliKqsmTlJfD7umrgNMaGtDvZF
	7JacA/sjYffBIvZagOMjNOrS0z10yFIYqa8FiZMC5IFBwQCfv4xQy+FRhe582e1k
	A8T2NY+LPGDILcFXSBNzbXL2a2UtxlBylDyeMxSkQTdTwfh7P3BFj3neTk9MmiRM
	rIWs41yaVPnc6rZqsp87EV/xcK6pkXDGagWgLvyOJQ==
X-ME-Sender: <xms:gubbY2mWtJKWdeSSVE06Aek0cGNbhJzeMMrGAKxcn_TK2Ng30JRL2Q>
    <xme:gubbY918yLTkJYlAhXXKg7cr5nOcIaWwfpawyVv8QpWxsOTyUcJs3gKe0eRv9K5qm
    wRW_yI1PUHKIf0>
X-ME-Received: <xmr:gubbY0oQqNIg5AkMnNYrS2sf6vsC6ickC58MFja4vDCJD0xJs59FdJXmtSCv5MKEiC5UYqrMui9ZEyLRluPc83UrD2Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepkfguohcu
    ufgthhhimhhmvghluceoihguohhstghhsehiughoshgthhdrohhrgheqnecuggftrfgrth
    htvghrnhepjeekleettddtgfeuvdffieffudegffetgedtteffvefgjeejvefhffehtddv
    ueevnecuffhomhgrihhnpehpohhrthdrshhhnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepihguohhstghhsehiughoshgthhdrohhrgh
X-ME-Proxy: <xmx:gubbY6nXTCXRXeWi6bB90tWCVKo-qovC2w_L8YAeoAMmQ7YZa3RVIA>
    <xmx:gubbY01tiYUQjZ5IqExcJAnycYueDhINqRyRNAGYB8hpy1z37n9Iew>
    <xmx:gubbYxtUmV23mFbKOXD0zibUfsJe8o69CY22lGbvqSx0lYiz_IijZw>
    <xmx:g-bbY7DyFj7busEn_AKs8QZ42D8JPz7UDRQ4WGE-ObJwnhEtyASZDg>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 11:36:17 -0500 (EST)
Date: Thu, 2 Feb 2023 18:36:14 +0200
From: Ido Schimmel <idosch@idosch.org>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,	Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,	Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>,	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>,	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [PATCH net-next 0/5] ATU and FDB synchronization on locked ports
Message-ID: <Y9vmfoaFxPdKvgxt@shredder>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <Y9lrIWMnWLqGreZL@shredder>
 <e2535b002be9044958ab0003d8bd6966@kapio-technology.com>
 <Y9vaIOefIf/gI0BR@shredder>
 <3cecf4425b0e6f38646e25e40fd8f0fd@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cecf4425b0e6f38646e25e40fd8f0fd@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_083620_235331_163FB606 
X-CRM114-Status: GOOD (  22.33  )
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

On Thu, Feb 02, 2023 at 05:19:07PM +0100, netdev@kapio-technology.com wrote:
> On 2023-02-02 16:43, Ido Schimmel wrote:
> > On Thu, Feb 02, 2023 at 08:37:08AM +0100, netdev@kapio-technology.com
> > wrote:
> > > On 2023-01-31 20:25, Ido Schimmel wrote:
> > > >
> > > > Will try to review tomorrow, but it looks like this set is missing
> > > > selftests. What about extending bridge_locked_port.sh?
> > > 
> > > I knew you would take this up. :-)
> > > But I am not sure that it's so easy to have selftests here as it is
> > > timing
> > > based and it would take the 5+ minutes just waiting to test in the
> > > stadard
> > > case, and there is opnly support for mv88e6xxx driver with this
> > > patch set.
> > 
> > The ageing time is configurable: See commit 081197591769 ("selftests:
> > net: bridge: Parameterize ageing timeout"). Please add test cases in the
> > next version.
> 
> When I was looking at configuring the ageing time last time, my finding was
> that the ageing time could not be set very low as there was some part in the
> DSA layer etc, and confusion wrt units. I think the minimum secured was like
> around 2 min. (not validated), which is not that much of an improvement for
> fast testing. If you know what would be a good low timeout to set, I would
> like to know.

My point is that the ageing time is parametrized via 'LOW_AGEING_TIME'
in forwarding.config so just use '$LOW_AGEING_TIME' in the selftest and
set it as high as it needs to be for mv88e6xxx in your own
forwarding.config.

