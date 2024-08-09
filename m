Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32410C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vki4wtnHRXTTskSJFhd+KIf6rSnsqvEzjaOpn0X3xQc=; b=JB0n3CT1biTyv+tO4KRdhzifOu
	USyKxlwuICCEhl/JQ0jgjLEjPCtuQhGK3SkieiccGV0rYFPxSdHr9ba6KzlmgvLGFdkImKWeqkJV1
	OBbEpRRAEf6Sp8m5WSrcWi8rq020dxOm4QiGpVrL5DS4YnNKdiGz+L0GunmfT8HpH2XyhdyrmvMP7
	Wxe0ZzWj+6zVj0b6WQj8IDTbRNccCse5+b/6zJBU4CTXPHYsgbQmiAv9LfguHjfXZ/P2dFOAmpoOJ
	NWZ5RBAy8zKTEUx0w+C9JjFdEmJVMJ4p+vaPycAiaXtH9a2C46eEg2VGgkcTsWHMAGoKiq8P8ywW2
	u7EE68fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQSg-0000000BVIB-2esv;
	Fri, 09 Aug 2024 14:19:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQRS-0000000BUiK-0dsg;
	Fri, 09 Aug 2024 14:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vki4wtnHRXTTskSJFhd+KIf6rSnsqvEzjaOpn0X3xQc=; b=l8FsXVL/pau0I+mwggEpPFkvxo
	gNtlpPd49bNoRAhKXlO7llgDiSQZynrvymwVOZ8i/tZhNCFP4sA3yVR+Cbvmh6CS1zDGpPuZ1AS6b
	/XV88Owx0175FrEmgyKVNQzFgB2MZuPCrMpQCC6CLN9lmnIhDOhz9WNLG3iN/xMoUSbY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1scQRE-004NvL-7s; Fri, 09 Aug 2024 16:17:52 +0200
Date: Fri, 9 Aug 2024 16:17:52 +0200
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
Subject: Re: [PATCH net-next v10 11/13] net: phy: add driver for built-in
 2.5G ethernet PHY on MT7988
Message-ID: <ebeb75a3-a6b1-46b3-b1e8-7d8448eb23f6@lunn.ch>
References: <20240701105417.19941-1-SkyLake.Huang@mediatek.com>
 <20240701105417.19941-12-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701105417.19941-12-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_071806_332517_79351A34 
X-CRM114-Status: GOOD (  10.20  )
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

> +static int mt798x_2p5ge_phy_config_aneg(struct phy_device *phydev)
> +{
> +	bool changed = false;
> +	u32 adv;
> +	int ret;
> +
> +	/* In fact, if we disable autoneg, we can't link up correctly:
> +	 * 2.5G/1G: Need AN to exchange master/slave information.
> +	 * 100M/10M: Without AN, link starts at half duplex (According to
> +	 *           IEEE 802.3-2018), which this phy doesn't support.
> +	 */
> +	if (phydev->autoneg == AUTONEG_DISABLE)
> +		return -EOPNOTSUPP;

I assume you have seen Russells patches in this area. Please could you
test and review them. Depending on which gets merged, you might need
to come back and clean this up later.

   Andrew

