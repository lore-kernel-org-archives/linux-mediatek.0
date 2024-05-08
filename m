Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEC5C04FFE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 12:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6FK8kE2E3qY4r3/M503lbKRVuqOuZQLe5oE7UqdJHg=; b=jKII3MdUyCQfudixXKJ0NWR5gy
	owDbM6lseITg/ctJNoFfpfKbJ+v1ejvkzcxvKDfUvCQ3UW7XK/Yv0OBJkLJK3h76qKNB5aIdYF+WS
	s1khv0aEW3NYBy7liQamn6fL2AhWI7i0BDFeG5cj+0q8IIb6mDSbCW1pSuXYBxb5SpXmMBjtoZ/Mq
	2ZRcH3lZR/oFLlST49EI+O0vlr3rq9/F7PGw6si7eMx3TMIdrWn5tLAMhWhVo54DhBXYutCQhGTlR
	JrUEl9FJposnQ4x/yz2kx9r+UCAGj66ighYI84qlebXyUt4XwIAS7725zPKeDj1zV+6HEBK7bckqA
	yZYi82lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4gNM-0000000FQnq-0Uq6;
	Wed, 08 May 2024 12:26:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4gNF-0000000FQmM-2IZj;
	Wed, 08 May 2024 12:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=c6FK8kE2E3qY4r3/M503lbKRVuqOuZQLe5oE7UqdJHg=; b=V+mV4j4inbuhAz6AIWRBNs3IQi
	NOZlDUdJ4zXWr1Ml995bvReYQczAhXUaZixVikHFfF9GMKnM/xQuazWx3+DtIV2MjnBM0/P03+NWY
	6aRqHq4BPcMEkSXNYwCAZtw1KVS35tu/FVWMSKmbsPG3tu4HKOZ7hjgDUoZ2/TAL54cc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s4gMu-00Ewpn-6b; Wed, 08 May 2024 14:25:56 +0200
Date: Wed, 8 May 2024 14:25:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH 2/3] net: phy: mediatek: Add mtk phy lib for token ring
 access & LED/other manipulations
Message-ID: <a005409e-255e-4633-a58c-6c29e6708b34@lunn.ch>
References: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
 <20240425023325.15586-3-SkyLake.Huang@mediatek.com>
 <Zjo9SZiGKDUf2Kwx@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zjo9SZiGKDUf2Kwx@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_052617_604527_60E66C49 
X-CRM114-Status: GOOD (  17.47  )
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

On Tue, May 07, 2024 at 03:40:09PM +0100, Daniel Golle wrote:
> > +/* Registers on MDIO_MMD_VEND2 */
> > +#define MTK_PHY_LED0_ON_CTRL			0x24
> > +#define MTK_PHY_LED1_ON_CTRL			0x26
> > +#define   MTK_PHY_LED_ON_MASK			GENMASK(6, 0)
> 
> Shouldn't this be
> GENMASK(6, 0) | BIT(7)
> 
> to include the MTK_PHY_LED_ON_LINK2500 bit as well?
> 
> I also noticed that this bit is the only difference between the LED
> controller of the internal 2.5G PHY in MT7988 and the Airoha EN8811H
> (driver air_en8811h.c, present in net-next). The EN8811H seems to use
> BIT(8) for LED_ON_LINK2500.
> 
> Could you create this helper library in a way that it would be useful
> also for the otherwise identical LED controller of the Airoha EN8811H,
> ie. supporting both variants with LED_ON_LINK2500 at BIT(7) as well as
> BIT(8) would be worth it imho as all the rest could be shared.

Please trim the email when replying to just what is relevant. If i
need to page down lots of time to find a comment it is possible i will
skip write passed a comment...

     Andrew

