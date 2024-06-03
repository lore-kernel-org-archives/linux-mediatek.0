Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA46C25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWf90TqEv33tkhaPkxRH0Ei2G5Na7AiQ0T1KjGRgchw=; b=YZ/s4MU0k81cOo2v/lojhApwK5
	7j5QJ6kRZWC5rACcJgu6p8Pr4a4ZJyQs2idcDTx4RibuaJAmMxScQcwPzo0lPD3aV0HbvtGQDcUu+
	29B+YtGGltBj2Bhb6mA7rJf2csVtWc5ry+C3Rdq+v8quWbnh5LJKwoGgoRv2S00j2ZDy7zu2QWWl6
	pICgDgkmKYkRl5YUOeBOdGPCb7rmhomJL6b6CzI62HTHRUOe0QTcNkzh0xHugJHpCvzBjOunVLtg5
	faSLbaKK9Rol0knzcYm1PgbWl/yLRbfCigThRrSEzjkGphqf1lsDF69lKJd48D5oqWCxDYNqLUqHE
	upSRNtlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7gi-0000000GtMb-0OoJ;
	Mon, 03 Jun 2024 13:25:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7ge-0000000GtLm-3Kfl;
	Mon, 03 Jun 2024 13:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tWf90TqEv33tkhaPkxRH0Ei2G5Na7AiQ0T1KjGRgchw=; b=KEveu3xARg02n//HGVdyAS3k0L
	0+OpND2w3tEvWcNfABvyknDo0o4Q3G8SkiWap/eZf6kwJ+ySQmBG9ZX/j3s5aiUwRrTDge/PuDKf3
	JKEvayPNO0SyM13/UbRXnO51WTWvW7FDqovIWEDp0OyYn8kqbL4e9Su8kHXIK2NiyP6TKYfVGKRr1
	VQZSW8WjTL5OHx5X6+TOjBiHSpNEFf5Fp+Y4UFRQgBFxC6/wbJ3hhIgski9LdhdeUEgQf6pyPNMMW
	0IlL2dpuX5/ambYbTQEFw52BvsCWq+Y3KeCUMTWLtL2DA2irbleJ9rTIRye4KE1/OoykgFQHk5Eas
	Pb+GEH2g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52102)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sE7gL-0002mY-2H;
	Mon, 03 Jun 2024 14:25:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sE7gL-0000T6-H9; Mon, 03 Jun 2024 14:25:01 +0100
Date: Mon, 3 Jun 2024 14:25:01 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: Re: [PATCH net-next v6 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <Zl3ELbG8c8y0/4DN@shell.armlinux.org.uk>
References: <20240603121834.27433-1-SkyLake.Huang@mediatek.com>
 <20240603121834.27433-6-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603121834.27433-6-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_062520_852122_3AB81C84 
X-CRM114-Status: GOOD (  10.85  )
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

On Mon, Jun 03, 2024 at 08:18:34PM +0800, Sky Huang wrote:
> Add support for internal 2.5Gphy on MT7988. This driver will load
> necessary firmware, add appropriate time delay and figure out LED.
> Also, certain control registers will be set to fix link-up issues.

Based on our previous discussion, it may be worth checking in the
.config_init() method whether phydev->interface is one of the
PHY interface modes that this PHY supports. As I understand from one
of your previous emails, the possibilities are XGMII, USXGMII or
INTERNAL. Thus:

> +static int mt798x_2p5ge_phy_config_init(struct phy_device *phydev)
> +{
> +	struct pinctrl *pinctrl;
> +	int ret;

	/* Check that the PHY interface type is compatible */
	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL &&
	    phydev->interface != PHY_INTERFACE_MODE_XGMII &&
	    phydev->interface != PHY_INTERFACE_MODE_USXGMII)
		return -ENODEV;

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

