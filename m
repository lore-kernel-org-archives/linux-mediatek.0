Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE68C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 10:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8pf6YD6PYPOxhuxnDNwdGpGAeMHzezf+cUCwL+fh0o=; b=eboQZ4PrXfyL5jn5xDwIBy2sTy
	EBtgashuXFQqMJQ0bE+sM/Mavt4LW5UHGg4IiZ0S5zD6A6AZRtoSFNOCthKi5dURKGl13mxD58PIu
	lcTScbFSMLYO/mbRRS4ePWcyeRr/wSeey9y5wlg1BGvUezU04G7Ep5esx//QzjweZZVXjPDdaqC7C
	nYxqAM+TflHhslrraDJrZB4hjKzfPhHImcFdTbFwAoVABgJ23cllGyjUBrd89D+tAqBI+07+950Xy
	iPPShvpO15j4gcWivtrUcbgVEMY6jAYxv1mw8wjk2B61j1AgI8lw+Zs6VAbkihGYt0uZVQhMiQkcH
	QLEHaZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCczF-00000006z6P-1kXs;
	Thu, 30 May 2024 10:26:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcz8-00000006yXE-2U09;
	Thu, 30 May 2024 10:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J8pf6YD6PYPOxhuxnDNwdGpGAeMHzezf+cUCwL+fh0o=; b=aWhB0q8FGQSlqKpGjJIcrnT3F7
	Zx/XgjYvWTYLMXoHUeY8mv0PKp85aDgd8vJDRO0Fk1T9t9mc409SY5JpH350Izgo+CFy8ePIF4yDU
	Vl0Dpi4nCJNm3K1qIk78HHqkPICKrFp9IHwh65eynTxZk1R6AoSxnaqUXmvEVehq4klMP7DZU6MWx
	N9iwij8balZT7Ly1MLxQq+TnRIYoXkQaQ9GjC9FyXA9pq9wVsXMotY8zUmMAfvR/1dj/zQ3udRX3q
	C5b2WwFnaS2DyuTgXgamN/N8sjbUnING7J9ih0sVJkqNhV5wsGy5UHGMG7gHU5852NdzAu7IQZXu2
	UmqcMNbg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40714)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sCcwo-0007FG-2a;
	Thu, 30 May 2024 11:23:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sCcwn-00054M-LC; Thu, 30 May 2024 11:23:49 +0100
Date: Thu, 30 May 2024 11:23:49 +0100
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
Subject: Re: [PATCH net-next v5 4/5] net: phy: mediatek: Extend 1G TX/RX link
 pulse time
Message-ID: <ZlhTtSHRVrjWO0KD@shell.armlinux.org.uk>
References: <20240530034844.11176-1-SkyLake.Huang@mediatek.com>
 <20240530034844.11176-5-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530034844.11176-5-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_032614_654151_B41CEF78 
X-CRM114-Status: GOOD (  11.98  )
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

Hi,

A few suggestions:

On Thu, May 30, 2024 at 11:48:43AM +0800, Sky Huang wrote:
> +static int extend_an_new_lp_cnt_limit(struct phy_device *phydev)
> +{
> +	int mmd_read_ret;
> +	u32 reg_val;
> +	int timeout;
> +
> +	timeout = read_poll_timeout(mmd_read_ret = phy_read_mmd, reg_val,
> +				    (mmd_read_ret < 0) || reg_val & MTK_PHY_FINAL_SPEED_1000,
> +				    10000, 1000000, false, phydev,
> +				    MDIO_MMD_VEND1, MTK_PHY_LINK_STATUS_MISC);

	timeout = phy_read_mmd_poll_timeout(phydev, MDIO_MMD_VEND1,
					    MTK_PHY_LINK_STATUS_MISC,
					    reg_val,
					    reg_val & MTK_PHY_FINAL_SPEED_1000,
					    10000, 1000000, false);

> +	if (mmd_read_ret < 0)
> +		return mmd_read_ret;

So, what if the poll times out (timeout == -ETIMEDOUT) ? If you want to
ignore that, then:

	if (timeout < 0 && timeout != -ETIMEDOUT)
		return timeout;

> +int mtk_gphy_cl22_read_status(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = genphy_read_status(phydev);
> +	if (ret)
> +		return ret;
> +
> +	if (phydev->autoneg == AUTONEG_ENABLE && !phydev->autoneg_complete) {
> +		ret = phy_read(phydev, MII_CTRL1000);
> +		if ((ret & ADVERTISE_1000FULL) || (ret & ADVERTISE_1000HALF)) {

This is equivalent to:

		if (ret & (ADVERTISE_1000FULL | ADVERTISE_1000HALF)) {

which is easier to read.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

