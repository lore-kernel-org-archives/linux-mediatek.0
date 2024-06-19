Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083A5C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCK/d6LsdyqUObs9myr+jxM6HgEQAvSWILmG4c5rbI0=; b=DmscPplnH4GXIfeafx4/GLjzOI
	nOXXIiL4vEh6h3mHS9kBpBcO18BDyvfAnrLnrt4ueXYDT5Y6G9WG5FBWjvvncVVkJkl9ZBM8OzQYH
	oEea/+Dw31a6sE7yrh72Kn+vU6tq/faBD6/wq20bp2WjB33deN97Dw+LfIpQ6E4DDvm7Cx7E3a8V8
	ws5eqRHhQOByi2X9c8OLYd7B2nYTLzt1jN97xKF7fHg476Q0WzbXBvMr/5Jnp+OJs4y448kmEuOVV
	BCr0+LJKDr+i7pA75pivWZs8iVeYg5FwgnqtxI2IuPpCTSl4BmaNjGYPgNONEbxVrHmPhy1YIAO0f
	seQ0y3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJrCN-00000000UZ3-11mR;
	Wed, 19 Jun 2024 09:01:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJrCK-00000000UXv-03vl;
	Wed, 19 Jun 2024 09:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DCK/d6LsdyqUObs9myr+jxM6HgEQAvSWILmG4c5rbI0=; b=SjIPIWMR6vYDO11xAvVomGVBP+
	4ZtUNpBPCLFYDtIO9jLFDYSpnmIWE75y/J3uWdxKSy5NgBL53BGWosYGNbSpqKWjMLx9ij/3vcFWV
	s5+5kCH643kbFX7cnIUZi+e4suDVbn29yUTywKZ4FNCsNE6WUrYE5tGeal8RH3koM8IUubZR2aQi4
	BZKniTbI4je0tj3mQRGMBI/AQjkAbmqYfGHFZ/Ti3gWsShmsmgWiIRaA9rFL/uFfIhqPew3ej/AwY
	86EsvXOOXZBxA+iEI2BgqW06rR8VMusGNwxRY1S8UYHlc5tiCFmViZlzT81SQCH/GKVo1hsWWX9ZA
	aZfP0o7A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42546)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sJrC2-00082o-0w;
	Wed, 19 Jun 2024 10:01:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sJrC3-0006cy-7R; Wed, 19 Jun 2024 10:01:27 +0100
Date: Wed, 19 Jun 2024 10:01:27 +0100
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
Subject: Re: [PATCH net-next v7 3/5] net: phy: mediatek: Add token ring
 access helper functions in mtk-phy-lib
Message-ID: <ZnKeZ91TOYvSyjuN@shell.armlinux.org.uk>
References: <20240613104023.13044-1-SkyLake.Huang@mediatek.com>
 <20240613104023.13044-4-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613104023.13044-4-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_020144_077692_76F5E44F 
X-CRM114-Status: GOOD (  10.58  )
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

On Thu, Jun 13, 2024 at 06:40:21PM +0800, Sky Huang wrote:
> +/* Difference between functions with tr* and __tr* prefixes is
> + *   tr* functions: wrapped by page switching operations
> + * __tr* functions: no page switching operations

Please don't align "tr" like this  the lack of __ doesn't stand out with
this formatting.

> +void __tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
> +		 u8 data_addr, u32 mask, u32 set)
> +{
> +	u32 tr_data;
> +	u16 tr_high;
> +	u16 tr_low;
> +
> +	__tr_read(phydev, ch_addr, node_addr, data_addr, &tr_high, &tr_low);
> +	tr_data = (tr_high << 16) | tr_low;
> +	tr_data = (tr_data & ~mask) | set;
> +	__tr_write(phydev, ch_addr, node_addr, data_addr, tr_data);
> +}
> +EXPORT_SYMBOL_GPL(__tr_modify);

These __tr_* symbols will be visible to the entire kernel, so they
should be more specific to ensure that they won't clash in the future.
Maybe __mtk_tr_* ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

