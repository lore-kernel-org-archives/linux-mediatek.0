Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22BEC38142
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 05:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fu40e8RKK34NvCHYIuaClUtcfG1TOlQku9GsJJ+aQa4=; b=1MJI/UtP7wO/3uHeuGA+8xQ/k0
	zBIOmkWQcYhfoJ0sLd0DdjRXwSycNk9n2bb0LNNoIds8a5drAkTO+zwSLqeP161XIC3u9wJxtzgh3
	2lZcBsMq1WbQliggiEgEgqn/OHXVP4Z5YNj5Qa+YTqvvJAY0spgevhU61DNZtzVan8U83DVakXhlD
	b3a932s4mBJsq1otf1swTVh9JNhft88pFRruBK2eN+iqSGO7qD/nvpUV7jd6KHiUPz4b3Jis7yBwo
	wOqYJay7GvMAAhn4QZbLwoKvwC7fGRcopIt5xus52PMlb8ZQoT4+dbfwfbMzhapYoq6J4AZCVFR5T
	f/zefZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIN4R-003cpR-KE; Thu, 19 Jan 2023 05:02:39 +0000
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIN4G-003coR-6e; Thu, 19 Jan 2023 05:02:29 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 2AA562B06398;
	Thu, 19 Jan 2023 00:02:25 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Thu, 19 Jan 2023 00:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674104544; x=1674111744; bh=fu40e8RKK3
	4NvCHYIuaClUtcfG1TOlQku9GsJJ+aQa4=; b=niveqFVmdI3XG32zed5l1bc0mp
	IKA0Jkdx/+fZ2tNQSyG/tFd38tRV7BasA/ERh+NOMPUsP2kf5ZiWDLWnjJlwLE23
	YFTuWglgESWTBuXB2YTeA9Au50fqRvK4OR90ZhFpjHV7IpKcHav5H+YN8hZMKxYE
	5AfD5As7/h43RNVj0fJ1GHsIqLnD5DozNgi2ozIBvOUEn+QeYwaSELbY2+M/qcgR
	KM02+HADixF9qP8WJ7JLcNjMIw5WUOapy3z+8fB3Jc5xjF51J7fJBmAAIJ+6E7u7
	+Vkp7+0PbYKml1UdNARoqtSF2NokrTcBLqM8i7eWJO6yq9ZHW/cx8fWLzPbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674104544; x=1674111744; bh=fu40e8RKK34NvCHYIuaClUtcfG1T
	OlQku9GsJJ+aQa4=; b=jlNWVJu99w72/n2Tkp2UbpJxJ371tfwWtRCurZnYOXqw
	o9a0OksINXmlcCUDRouTiPVN1WsKEDTXZ71s7o/RhREvPOkj8eCQYJd68MmcIoU7
	dUVEAa0s8jpFfA47OG1ivTZhbgEpERo968T32XxbNiSbd6uCioM2dAN/dhp+4A6j
	MZYMbJRM6XojTZNauRJBzikZAC8h46SjzzQ0bGYO3NBhS0SQxb5EMaqPXlwXuPhf
	YsSGitWjoYVXbsWqd+RwnauXdQ4R6K541WNzUmY7WLsVVnC3KfUG5ze6chnX8dgc
	HHYxjojS8h7BC1e2V1NWE2p3JJzNnr6cWT8V+M1kng==
X-ME-Sender: <xms:3s7IY-xqKErPH6RiKYJ9XefoO3TYAKUWFG4clxebOvCxjLC78UhHtw>
    <xme:3s7IY6Sqy2S4zobDhaFTIw2Gplc65pRkmx1CIClopeFHRFltC_COHtgxDXfhL8biB
    3EEnFJtHs2mvewXTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdljedmnecujfgurhepofgfggfkjghffffhvfevufgtsehttdertder
    redtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
    hjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeet
    teduvedtffdtledutdfhheevfeetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:3s7IYwVYl2S1Sksqg2sBvwuWvkzknIaNaHdy3IacePoOFH91nLOreg>
    <xmx:3s7IY0hkBI2Hffxm4Rc0Xh2JJ757mV0V8yrJiruvGxdcAFXFFOxvvQ>
    <xmx:3s7IYwAnmxtzUf2Y6vBc-oyaBG3HKjIz9OV9Qa2ezN7ZymSUcSTquw>
    <xmx:4M7IYzauEzxGa9jG18p-HgSTD6yji4XoXQLiuVFmrUoqLKOm-lhvkc83hUs>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C367E1700089; Thu, 19 Jan 2023 00:02:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <61140466-6195-4309-8f46-3edf084731c2@app.fastmail.com>
In-Reply-To:  <20230116-net-next-remove-probe-capabilities-v2-6-15513b05e1f4@walle.cc>
References:  <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
 <20230116-net-next-remove-probe-capabilities-v2-6-15513b05e1f4@walle.cc>
Date: Thu, 19 Jan 2023 15:32:02 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Michael Walle" <michael@walle.cc>,
 "Heiner Kallweit" <hkallweit1@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "David Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Felix Fietkau" <nbd@nbd.name>,
 "John Crispin" <john@phrozen.org>, "Sean Wang" <sean.wang@mediatek.com>,
 "Mark Lee" <Mark-MC.Lee@mediatek.com>,
 "Lorenzo Bianconi" <lorenzo@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Bryan Whitehead" <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, "Giuseppe Cavallaro" <peppe.cavallaro@st.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Jose Abreu" <joabreu@synopsys.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Joel Stanley" <joel@jms.id.au>
Cc: netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Jesse Brandeburg" <jesse.brandeburg@intel.com>
Subject: Re: [PATCH net-next v2 6/6] net: phy: Remove probe_capabilities
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_210228_316229_6A1A071D 
X-CRM114-Status: UNSURE (   9.47  )
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



On Wed, 18 Jan 2023, at 20:31, Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
>
> Deciding if to probe of PHYs using C45 is now determine by if the bus
> provides the C45 read method. This makes probe_capabilities redundant
> so remove it.
>
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
> ---
>  drivers/net/ethernet/adi/adin1110.c               | 1 -
>  drivers/net/ethernet/freescale/xgmac_mdio.c       | 1 -
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c       | 1 -
>  drivers/net/ethernet/microchip/lan743x_main.c     | 2 --
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 3 ---
>  drivers/net/mdio/mdio-aspeed.c                    | 1 -

For the Aspeed change:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

