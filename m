Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B106C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 17:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtF4TWVZ7Fb1fvpOPOUkeR6eY8gtFqrdC32AYabBIIo=; b=TD3H4BqVZz6JI83+tAIsplgrxH
	Y6duVmA06ZsqIUrSFm/MKSf2RIKG6xZsNbUq1FGSqwPNg1ypLw80o833aJyBuONJN8khAY9NGsRDa
	91axOesbnQahcJRmFXlqXOI4hV/Bgbm6mx3evq5HfsI/lAtk+1ydj04qP83gZcf4UrTwaLtAolnUC
	eUKJZvL2uhMClVXmIPcgAB0qW+jADBWgDM0jKqx0s3ZaiYOowgIxZX/WF/MIuk2o8kpg3Fh2utPqW
	TzrQe81EL+Ta00dSAS2kZemG7qTzNoPzYdZwBOLNzLexzMibRT9vDOVSvTG7a+6Skv9I7rCU+Uvkl
	9ETX3vYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPRS1-00Csiy-VH; Tue, 07 Feb 2023 17:08:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPRRy-00CsiH-Je; Tue, 07 Feb 2023 17:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BtF4TWVZ7Fb1fvpOPOUkeR6eY8gtFqrdC32AYabBIIo=; b=QUWLlT535g9Pp1HOsnV/ZfVl4a
	7SC+c2zT4nKjaZLPFLshFeXdAWVfsGIHN8A49D3zyeVS06F63DihkP3ymZ5LY2JegFBOcbr9rZgAQ
	9RcByhVdDCWS1cGbcb3IjN/1noMM6d7M/qbLMSmfDugmXoIepSDPWYu2UfEhlQ0Ho5mY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pPRRm-004K8H-90; Tue, 07 Feb 2023 18:07:58 +0100
Date: Tue, 7 Feb 2023 18:07:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v2 04/11] net: ethernet: mtk_eth_soc: set MDIO bus clock
 frequency
Message-ID: <Y+KFbuumUJ83tRHj@lunn.ch>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <4bd0d0c834b7e8852504f27fc2db586b3c95979e.1675779094.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bd0d0c834b7e8852504f27fc2db586b3c95979e.1675779094.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_090810_660834_29BA8313 
X-CRM114-Status: UNSURE (   8.70  )
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

On Tue, Feb 07, 2023 at 02:20:40PM +0000, Daniel Golle wrote:
> Set MDIO bus clock frequency and allow setting a custom maximum
> frquency from device tree.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

