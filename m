Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B47C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 11:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGnMREyDDGJIN58aJJKcAy1OpZorqiOEeiQkd8TXN9U=; b=19JkxySKnJL6G79jbRJaUUdrRA
	kVoFj+p2AkFG0MhLYLDCqFui+d5L8jGJMXNWTiocHOSgMnROAXo3QnnZqv9nfVUdlZOzlYgYqe22l
	+TJdNgoeci1G26/DnNH9rgU/bj3DnP06rmtYsB+Zg+TtjuQ5oOqlQQVBI2/V7dhO6CmJviXA7bXPJ
	qitR+QUSyV6zkyTsPQpf1JGTzrwKMQwA8Dwwh3WkTi20W/5+iCn93rchNQnU+pUlGC4BJQF4xDrpV
	921s0SaenQvq1Y41B8OceRuDaLvq9x43b3Nkmx5dFVQNfn/bg+af7SHwGg0kf81dTXkGCNHfZXCNb
	liDkBw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px4tt-008glC-0I;
	Thu, 11 May 2023 11:56:01 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4tq-008gki-2L;
	Thu, 11 May 2023 11:55:59 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1px4tm-0008Rg-01;
	Thu, 11 May 2023 11:55:57 +0000
Date: Thu, 11 May 2023 13:53:53 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/8] net: phy: realtek: rtl8221: allow to configure
 SERDES mode
Message-ID: <ZFzXPGeob0q4DTza@pidgin.makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
 <302d982c5550f10d589735fc2e46cf27386c39f4.1683756691.git.daniel@makrotopia.org>
 <81c3f04d-ec48-4ac0-ac16-b69dc6ae72e0@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81c3f04d-ec48-4ac0-ac16-b69dc6ae72e0@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_045558_781926_42C6B78F 
X-CRM114-Status: GOOD (  11.92  )
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

On Thu, May 11, 2023 at 02:41:07AM +0200, Andrew Lunn wrote:
> > +#define RTL8221B_MMD_SERDES_CTRL		MDIO_MMD_VEND1
> > +#define RTL8221B_MMD_PHY_CTRL			MDIO_MMD_VEND2
> 
> I suggest you don't do this. Use MDIO_MMD_VEND[1|2] to make it clear
> these are vendor registers.

Ack, I will not introduce new macros to label them, but just use
MDIO_MMD_VEND1 and MDIO_MMD_VEND2 then.

> 
> > +	case RTL8221B_SERDES_OPTION_MODE_2500BASEX_SGMII:
> > +	case RTL8221B_SERDES_OPTION_MODE_2500BASEX:
> > +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6a04, 0x0503);
> > +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f10, 0xd455);
> > +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f11, 0x8020);
> > +		break;
> > +	case RTL8221B_SERDES_OPTION_MODE_HISGMII_SGMII:
> > +	case RTL8221B_SERDES_OPTION_MODE_HISGMII:
> > +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6a04, 0x0503);
> > +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f10, 0xd433);
> > +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f11, 0x8020);
> > +		break;
> > +	}
> 
> Is there anything in the datasheet to indicate register names and what
> the values mean? It would be good to replace these magic values with
> #defines.

Unfortunately they are only mentioned as magic values which have to be
written to magic registers also in the datasheet :(


