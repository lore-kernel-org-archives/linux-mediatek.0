Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA18CC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 09:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZPCE7bDbCBCJxvXyCnEG/PIPyH9SX836CQZUsB/9WE=; b=Be0cDwg6rBVMw2o7ImE+RCKIHm
	0PshAaOXV8DqAzssbRXR3fnsvtKztNonyIwKcWkvS8Sv11tqvgIya0cojirYpzbO64ghIrmFZFNjX
	KOBOgOkh10InMQQm2vd+izP29tq9gyMb4S8oo1uoUJJRW5p9PdiYYzCvG1AbC+e+idG3pomTuJ2io
	xelsbcj057Qrb/TDIc6/EfMsSeHZ0iwgbie8TljkJ/zY6sunz61oIYK2NSQ4ppCN64A36vPDlwnCG
	lsUsbsDhqElhIbKBVV5Ib8LnC9k/GC5jqpXB/v0pq616hpU03cpSTtueNKdS2ELyHI7bS9m1tYRrO
	MAPt0sxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJrKb-00000000W86-0x9P;
	Wed, 19 Jun 2024 09:10:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJrKW-00000000W3o-0C3d;
	Wed, 19 Jun 2024 09:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XZPCE7bDbCBCJxvXyCnEG/PIPyH9SX836CQZUsB/9WE=; b=oX5LzuC2K6FLF5l89DJSwL40Iw
	qRtT/Ti0Co6QpZ/PmYuNy93+M0pKDqqNhn93L1vV/WFvbEHF0zRZ2Uop2JUkJmSHKJwU0zsV/9Wdn
	uZ+rIIwq4ob4+RhM0zLZqrGXu7ptaunWqZvePtiekwrIA8iS65EkpGc/xRB90Ezvjld+SA84W1r6v
	hOa3ekJlt9Qgaoqy8qaq/ztMyOeo/S7jiF/jdjRYLCZhI3gF35BdS2Oj9QCfiaZ3ceZZKUWBISHuS
	mPHk7G1G/oHlimw0qEkXW2MnCJW6GzTVDu/BGmCMwFCXt83iDNkiXSSp7AsPMgOyt8dyxEL/EThzt
	2Te6fj7w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44894)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sJrKD-00083a-2i;
	Wed, 19 Jun 2024 10:09:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sJrKE-0006dv-7S; Wed, 19 Jun 2024 10:09:54 +0100
Date: Wed, 19 Jun 2024 10:09:53 +0100
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
Subject: Re: [PATCH net-next v7 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <ZnKgYSi81+JdAdhC@shell.armlinux.org.uk>
References: <20240613104023.13044-1-SkyLake.Huang@mediatek.com>
 <20240613104023.13044-6-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613104023.13044-6-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_021012_214407_17966863 
X-CRM114-Status: GOOD (  12.72  )
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

On Thu, Jun 13, 2024 at 06:40:23PM +0800, Sky Huang wrote:
> +static const unsigned long supported_triggers =
> +	(BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
> +	 BIT(TRIGGER_NETDEV_LINK)        |
> +	 BIT(TRIGGER_NETDEV_LINK_10)     |
> +	 BIT(TRIGGER_NETDEV_LINK_100)    |
> +	 BIT(TRIGGER_NETDEV_LINK_1000)   |
> +	 BIT(TRIGGER_NETDEV_LINK_2500)   |
> +	 BIT(TRIGGER_NETDEV_RX)          |
> +	 BIT(TRIGGER_NETDEV_TX));

Absolutely no need for the outer parens around this.

type foo assignment-operator expr;

There is no reason to ever put parens around expr in this kind of thing.
assignment-operator are things like =, |=, &=, <<=, >>=, and so forth.

Excessive parens detracts from readability, and leads to mistakes. If
operator precedence is a worry, then knowing the common C precedence
rules rather than littering code with extra parens would be good so
that code can remain readable.

> +static struct phy_driver mtk_gephy_driver[] = {
> +	{
> +		PHY_ID_MATCH_MODEL(MTK_2P5GPHY_ID_MT7988),
> +		.name		= "MediaTek MT7988 2.5GbE PHY",
> +		.probe		= mt798x_2p5ge_phy_probe,
> +		.config_init	= mt798x_2p5ge_phy_config_init,
> +		.config_aneg    = mt798x_2p5ge_phy_config_aneg,
> +		.get_features	= mt798x_2p5ge_phy_get_features,
> +		.read_status	= mt798x_2p5ge_phy_read_status,
> +		.get_rate_matching	= mt798x_2p5ge_phy_get_rate_matching,
> +		.suspend	= genphy_suspend,
> +		.resume		= genphy_resume,
> +		.read_page	= mtk_phy_read_page,
> +		.write_page	= mtk_phy_write_page,
> +		.led_blink_set	= mt798x_2p5ge_phy_led_blink_set,
> +		.led_brightness_set = mt798x_2p5ge_phy_led_brightness_set,
> +		.led_hw_is_supported = mt798x_2p5ge_phy_led_hw_is_supported,
> +		.led_hw_control_get = mt798x_2p5ge_phy_led_hw_control_get,
> +		.led_hw_control_set = mt798x_2p5ge_phy_led_hw_control_set,

I don't see the point of trying to align some of these method
declarators but not others. Consistency is important.

I know several PHY drivers do this, this will be because new methods
with longer names have been added over time, and to reformat the
tables of every driver would be noise. However, new implementations
should at least make an effort to have consistency.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

