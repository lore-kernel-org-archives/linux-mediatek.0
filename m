Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D19C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGBOT8OTohW7/COq9mdVEqzeGYKhKe6FxtEGmt1DLuU=; b=x9errVhgcjaWe6mtmGQPZMJxWc
	2wQ6qfbB4UpFY4ibpXyaf0DRMdPH9MtW/e22Zca3HKBb9VG85w85z1rdmHijNoTZ1Dr4oT1ub11qZ
	J8wfLkFMFQwx/8VQoOl9zx5J410u1ZfzuQouZ5mvcAW84QA+ABzVHnFHrObwoSYYUqA9xtIoK7Xpw
	XFkgzJ3bzrIzyXHGVDbFrNbeKy5EWtw8P0wmgzbZzYcoI19TtHwegF6bnlG55yTbGc+DxAmERsJHK
	ejgSm9r39+QbOQ3lVI74n/LPQ7u5N+GsnOCye0qQWW56mjz46xrl/q1hZMdEzV+34ukF8VpZn/N5Q
	VWoo2C6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQVoh-006wYx-JV; Tue, 23 Aug 2022 15:27:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQVof-006wWN-1f
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 15:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WGBOT8OTohW7/COq9mdVEqzeGYKhKe6FxtEGmt1DLuU=; b=shphAs2/laF9F0tecgG6Rk9wqs
	SnvnTahX4U2LqcGRCYRmuRwKRLQWBeS9BACJYuMR6dILrr18fG4fqw3djD8LPEJrpi6wag2sn6dmF
	o4IGVdwvp+YmoaQxnY6fwdK/nR+LZOc99tHEs6503VS/gjLUtWzJoeG8l7nIDq9bQ23CW67BZaYbj
	zysb/6AJT/6D8lxDPTKyTk2G5lDJZ1VIhjuhZTOYZFcd1GdV+gM7swDnEySv9EJq38YEjqolW0cYR
	9ighveL2OMqtguxRtjGOKKDUPjKN9bTWH3u8tUwTAjwqqMfER5fHp+tQWXM7KVR/WWn4eF6Zf6ttT
	eGcGxojA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33894)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oQVoF-0003Kq-4z; Tue, 23 Aug 2022 16:27:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oQVo7-0003FO-FE; Tue, 23 Aug 2022 16:27:11 +0100
Date: Tue, 23 Aug 2022 16:27:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH 4/4] net: mediatek: sgmii: set the speed according to the
 phy interface in AN
Message-ID: <YwTxzyQd4eUlf3j+@shell.armlinux.org.uk>
References: <20220820224538.59489-1-lynxis@fe80.eu>
 <20220820224538.59489-5-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220820224538.59489-5-lynxis@fe80.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_082745_124247_A06E1FBA 
X-CRM114-Status: GOOD (  22.99  )
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

On Sun, Aug 21, 2022 at 12:45:38AM +0200, Alexander Couzens wrote:
> The non auto-negotiating code path is setting the correct speed for the
> interface. Ensure auto-negotiation code path is doing it as well.
> 
> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> ---
>  drivers/net/ethernet/mediatek/mtk_sgmii.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> index aa69baf1a42f..75de2c73a048 100644
> --- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
> +++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> @@ -21,13 +21,20 @@ static struct mtk_pcs *pcs_to_mtk_pcs(struct phylink_pcs *pcs)
>  }
>  
>  /* For SGMII interface mode */
> -static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
> +static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs, phy_interface_t interface)
>  {
>  	unsigned int val;
>  
>  	/* PHYA power down */
>  	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
>  
> +	/* Set SGMII phy speed */
> +	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
> +	val &= ~RG_PHY_SPEED_MASK;
> +	if (interface == PHY_INTERFACE_MODE_2500BASEX)
> +		val |= RG_PHY_SPEED_3_125G;
> +	regmap_write(mpcs->regmap, mpcs->ana_rgc3, val);
> +

It looks to me like, after this commit, the initial part of
mtk_pcs_setup_mode_an() and mtk_pcs_setup_mode_force() are identical.
Also, I think that the tail of each of these functions is also
identical.

So, would it make sense for a final patch to tidy this code up?

>  	/* Setup the link timer and QPHY power up inside SGMIISYS */
>  	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
>  		     SGMII_LINK_TIMER_DEFAULT);
> @@ -100,7 +107,7 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
>  	if (interface != PHY_INTERFACE_MODE_SGMII)
>  		err = mtk_pcs_setup_mode_force(mpcs, interface);
>  	else if (phylink_autoneg_inband(mode))
> -		err = mtk_pcs_setup_mode_an(mpcs);
> +		err = mtk_pcs_setup_mode_an(mpcs, interface);

What is the situation when PHY_INTERFACE_MODE_SGMII is being used, but
we're not using inband mode? Right now, we don't do any configuration
of this block, and that seems rather wrong.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

