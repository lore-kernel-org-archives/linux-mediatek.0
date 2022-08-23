Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D846AC32789
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Rl6PT1536lA2IP06YI5LrnFMzs1N1iwWlAcF8miKJ4=; b=krXy79NNC6Hkw/L/sSLk7AEF1f
	/e1DQom3BAy1ji5RT6TQzb950xvjoUCJQWuFim7eOVcnbO83Hco9DMC8wC9SyyEKICHyFDqxFWjEH
	/EjNZWMAlwXDF4NM3OJWz1XTPLbCjwooB7qvHIK9qP1g/YjzdG8VZABvsRpyAYRLB0KD4TDF2X59u
	4kpGPwQLiPLtQhjpU2QKQlOHKe2XofN6BMdx1uSGPlkejYdzhQZjKSLEiH9hc4e8pKqAQSckaHoQX
	WGq1iiG2DUYCiQnt3/gRLqu/zTcnjjyCwU5FxRMFmEYYchSN7goStIWycxTIGfax1RGxFNexpElPB
	5Xcmoecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQVps-006ws8-R4; Tue, 23 Aug 2022 15:29:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQVpq-006wrJ-Ok
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 15:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2Rl6PT1536lA2IP06YI5LrnFMzs1N1iwWlAcF8miKJ4=; b=UuDNQGRbnDfbUd/dTOHyoFNsug
	ySjHNNXvPl5QocbaJbT/BU33sKvz0veJEl8H+Kh2JI1YfGzM+xgusg/EeYSrBULWGMvl/1WsVI4WZ
	a3SHRDdjb8nnjl39oCCwPOi5/D+STPY5Gm+BXpJDwmHTJb0klkNtdUif3HLw3fFVYdUR3tMK7OfLE
	RKZfuDt5yh5MiBdDWu4gVV0HCVWXw/ab3A/FJZa+P86RDzee397qzSuRTcxtfhHqjYqHyIgDTFtlV
	/vREv5cn8A0uu63W5+VJx+K2wtXB41ZIPKf+yfxR/nrjtUmN/ePsNKQ1rjhNZQzM9HJyqwDhjmAXn
	AhKJktKw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33896)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oQVph-0003LE-16; Tue, 23 Aug 2022 16:28:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oQVpg-0003FV-0u; Tue, 23 Aug 2022 16:28:48 +0100
Date: Tue, 23 Aug 2022 16:28:47 +0100
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
Subject: Re: [PATCH 3/4] net: mediatek: sgmii: mtk_pcs_setup_mode_an: don't
 rely on register defaults
Message-ID: <YwTyLwRnQ+eTXeDr@shell.armlinux.org.uk>
References: <20220820224538.59489-1-lynxis@fe80.eu>
 <20220820224538.59489-4-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220820224538.59489-4-lynxis@fe80.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_082858_824010_B3AE27CA 
X-CRM114-Status: GOOD (  14.12  )
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

On Sun, Aug 21, 2022 at 12:45:37AM +0200, Alexander Couzens wrote:
> Ensure autonegotiation is enabled.
> 
> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> ---
>  drivers/net/ethernet/mediatek/mtk_sgmii.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> index 782812434367..aa69baf1a42f 100644
> --- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
> +++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> @@ -32,12 +32,13 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
>  	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
>  		     SGMII_LINK_TIMER_DEFAULT);
>  
> +	/* disable remote fault & enable auto neg */
>  	regmap_read(mpcs->regmap, SGMSYS_SGMII_MODE, &val);
> -	val |= SGMII_REMOTE_FAULT_DIS;
> +	val |= SGMII_REMOTE_FAULT_DIS | SGMII_SPEED_DUPLEX_AN;

Does SGMII_SPEED_DUPLEX_AN need to be cleared in
mtk_pcs_setup_mode_force(), so mtk_pcs_link_up() can force the
duplex setting for base-X protocols?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

