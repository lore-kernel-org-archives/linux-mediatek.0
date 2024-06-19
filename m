Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CBAC2BA15
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2yscDCF3+dfP4Cs8Q0wqLUEmaZApVG8aLFF5tCrBu0=; b=JYfbstMguKp2ONOW27FKMuoU3t
	LM1ygYyhKouVp8dBE5VFVgna1Bq3CVlGD9qF17aDDvjjtvGVZKmMsJXUAR/iA8yYC8jxhVhA/Rcz1
	Gcf4ZgP4eR7mVZ5j3+BsCEf7NlApygLDZE5E6x4ARrBUmH9LzGrD0eVkMVqJTeWq8yQLrKlaKBEhY
	poNmtx43ZmTTBYGDcSug2dp6kWRPQVCAnnsFKP5g27oYy76IHmpVHCyB1LEiFr3P7NpXGgM83ZkBB
	/vJJPa9PoIfHNAS4QJPZckYzt56YUslSqg0WEuyCP5/ohsUisc/CbDtaFug12lj43rGbZmuXS+Rx2
	m172kZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJqjm-00000000OW0-1Q4d;
	Wed, 19 Jun 2024 08:32:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJqji-00000000OU4-3jWe;
	Wed, 19 Jun 2024 08:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R2yscDCF3+dfP4Cs8Q0wqLUEmaZApVG8aLFF5tCrBu0=; b=l8+eKRfNIsFXfp/wyZ3/k43Fll
	UNDwT6Xcx37V3IP7XEq0A2mnLZLe7Ki00Ay8C0YLUVFt4SjyYlb1gtwH2DDZ6ZlF8NSsaelTpalOe
	d0JmJZys/ARESp+k7XtoeVaNxRISbwI1gf9tOg75zt+8QmPXW5auJfxbGIy7q3T+7WUhzhENUC0mZ
	4qNom5NPKYWHSHEiz0G3y7V3KCF5wpFI6t7JvI5SrGhsRZ3to0SbBhU1M7To9be38P54WonUN9YCE
	s2jtXSIB/2t9mrAsjf936r3j8NGS200YJR40vm3VOTZicERw+4glf6dCDzVHUQkwq5oiIcS4kMohm
	WnLhmwrA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48842)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sJqjM-0007zd-1N;
	Wed, 19 Jun 2024 09:31:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sJqjL-0006bp-Ee; Wed, 19 Jun 2024 09:31:47 +0100
Date: Wed, 19 Jun 2024 09:31:47 +0100
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
Subject: Re: [PATCH net-next v7 1/5] net: phy: mediatek: Re-organize MediaTek
 ethernet phy drivers
Message-ID: <ZnKXc/UglBxayJtv@shell.armlinux.org.uk>
References: <20240613104023.13044-1-SkyLake.Huang@mediatek.com>
 <20240613104023.13044-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613104023.13044-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_013211_264096_DDE785E6 
X-CRM114-Status: GOOD (  14.53  )
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

On Thu, Jun 13, 2024 at 06:40:19PM +0800, Sky Huang wrote:
> diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
> similarity index 99%
> rename from drivers/net/phy/mediatek-ge-soc.c
> rename to drivers/net/phy/mediatek/mtk-ge-soc.c
> index f4f9412..47af872 100644
> --- a/drivers/net/phy/mediatek-ge-soc.c
> +++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
> @@ -1415,7 +1415,7 @@ static int mt7988_phy_probe_shared(struct phy_device *phydev)
>  	 * LED_C and LED_D respectively. At the same time those pins are used to
>  	 * bootstrap configuration of the reference clock source (LED_A),
>  	 * DRAM DDRx16b x2/x1 (LED_B) and boot device (LED_C, LED_D).
> -	 * In practise this is done using a LED and a resistor pulling the pin
> +	 * In practice this is done using a LED and a resistor pulling the pin

If you are moving files around, there should be no extraneous changes
in the commit that is doing the move. This is a spelling fix, and that
should be a separate patch (and probably should be done as the first
patch.)

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

