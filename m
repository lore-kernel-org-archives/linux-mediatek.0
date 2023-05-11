Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45D8C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 00:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BN583I8JA4xBDBDJJI1YSRZLOSYl2nhQFCQHGlsJAI=; b=avv5beIn8M7b0FufwyX2WkTsJk
	w35mWZnc9fMWCqQiKnk/mY6N9ZvDjaQf7Joe9N04GgqD83/lQC9ODxLQgNtj+VipVJ1M3rFuuEVCJ
	XZv1LW72kuBs3lwDT421wHSzrn8EWZoA80EY3H+pH6ZZTudyU9hLwLrRUIGuouMxnrZ9Mtlvqm9hy
	R4h29tA6/zfE2giVOQCOZa8i0ygJtTwfv99xmqZaaS8fFtnb6+gZblpwn3EpUnaXB6eMT56VSBe/v
	ZuW6LNskoqmm9MuEsHnJefEhUrspc48kxabbPWl3bvFsu+uie4b7KpT/l2VR1digW/O1LTiU8ka/U
	n9b+mFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuMp-007Lx6-1m;
	Thu, 11 May 2023 00:41:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuMm-007LwP-2o;
	Thu, 11 May 2023 00:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+BN583I8JA4xBDBDJJI1YSRZLOSYl2nhQFCQHGlsJAI=; b=JZxiQgB1wWSDGgPLYsTFeGKp7M
	VJUbiRuk9Y0L8mqpqggvAjEvMLn60zg+dr0DcvbXivxzjVz6Uz+FhbqLwyvGH0Ko0yyC+nj+W7xCV
	H9Kw4K7dDw8kpaB70FIQ/8sKWCgOa6OSByL6mFuM0ZcGc7em+7ceYprAZjRZ+EaWehPk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pwuMl-00CUvb-3c; Thu, 11 May 2023 02:41:07 +0200
Date: Thu, 11 May 2023 02:41:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <81c3f04d-ec48-4ac0-ac16-b69dc6ae72e0@lunn.ch>
References: <cover.1683756691.git.daniel@makrotopia.org>
 <302d982c5550f10d589735fc2e46cf27386c39f4.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <302d982c5550f10d589735fc2e46cf27386c39f4.1683756691.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_174108_912863_70E8E36F 
X-CRM114-Status: UNSURE (   8.24  )
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

> +#define RTL8221B_MMD_SERDES_CTRL		MDIO_MMD_VEND1
> +#define RTL8221B_MMD_PHY_CTRL			MDIO_MMD_VEND2

I suggest you don't do this. Use MDIO_MMD_VEND[1|2] to make it clear
these are vendor registers.

> +	case RTL8221B_SERDES_OPTION_MODE_2500BASEX_SGMII:
> +	case RTL8221B_SERDES_OPTION_MODE_2500BASEX:
> +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6a04, 0x0503);
> +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f10, 0xd455);
> +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f11, 0x8020);
> +		break;
> +	case RTL8221B_SERDES_OPTION_MODE_HISGMII_SGMII:
> +	case RTL8221B_SERDES_OPTION_MODE_HISGMII:
> +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6a04, 0x0503);
> +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f10, 0xd433);
> +		phy_write_mmd(phydev, RTL8221B_MMD_SERDES_CTRL, 0x6f11, 0x8020);
> +		break;
> +	}

Is there anything in the datasheet to indicate register names and what
the values mean? It would be good to replace these magic values with
#defines.

	Andrew

