Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB23C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 12:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DdiJJW2KMfOiNRsqXeyzvsPa+tiQ685iR7M7gsvOIw=; b=gD+BzXSsaPnL1F4WjpPABn1kEm
	I9ik98ZixGJqkCEsRGvHmyuVmfb9+bqr4h2QR5cMpLVyBzbG4k/Dfna8mHeQrTRC4QG6JUnN+2zkX
	GWoeYyiKNGJuTi7GheVEJW5WK2fl3e0leKKGgRAq7f7T4XXK9UXCUgP7vDTtmoKuyuQvsiX3lUsX3
	9qOf8u88JiKPKc8tX9KnodKHRboTc65EMPVZ2Lf+kgXRiND4mlhYVByNOjjSjrdpCP9T0r//WAS3A
	FvCtzs06IO1X1Q7NNcyCDhAjpL1SYlyFoYCSCR1eog1hfL/WOqllNj+Md/N5vFzpT1a3ojBRn+Wt1
	TCzpMNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZW22-0000B3-GD; Tue, 07 Mar 2023 12:03:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZW0o-00HaXo-98; Tue, 07 Mar 2023 12:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/DdiJJW2KMfOiNRsqXeyzvsPa+tiQ685iR7M7gsvOIw=; b=R2Qb1TE8dqEBMGg7VF0Dpe19ee
	hwjqzoiTKKi07io0ZMqiVYyM5u9bzjnQQTVVoSzx9jZ65pIh40pUSAT0gKdLJxqle8PKE1orcHzsy
	F3KgegTzmjJhVakafY4SuCJioqn0+3aevIpZN87oxB9nTRFIANxkHKYggDcz7niX4UxmA+fImIsvI
	7eXgUBImPC62skToo1ycHrXW2WkdpF3zU2gPzWKFGoUYMmbihzmKImoxY7/D00OvEe+dFn2aVGaA4
	h/Z8fBdrklVOc+qizDVNHSWSVOrK2wvj+3OEagH8vXQuVoskHe/yRjdibMLMTVG6xGEHGJZwFd/Qi
	PVwF2npg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36490)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pZW0R-00007V-Bc; Tue, 07 Mar 2023 12:01:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pZW0L-0001Ub-7W; Tue, 07 Mar 2023 12:01:17 +0000
Date: Tue, 7 Mar 2023 12:01:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next 4/4] net: mtk_eth_soc: note interface modes
 not set in supported_interfaces
Message-ID: <ZAcnjXxLfeE9UIsO@shell.armlinux.org.uk>
References: <Y/ivHGroIVTe4YP/@shell.armlinux.org.uk>
 <E1pVXJK-00CTAl-V7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1pVXJK-00CTAl-V7@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_040146_623616_204AC578 
X-CRM114-Status: GOOD (  16.27  )
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

To any of those with Mediatek hardware... Any opinions on what we should
do concerning these modes?

If I don't get a reply, then I'll delete these. There's no point having
this code if it's been unreachable for a while and no one's complained.

Thanks.

On Fri, Feb 24, 2023 at 12:36:26PM +0000, Russell King (Oracle) wrote:
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index f78810717f66..280490942fa4 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -530,9 +530,11 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
>  		case PHY_INTERFACE_MODE_GMII:
>  			ge_mode = 1;
>  			break;
> +		/* FIXME: RMII is not set in the phylink capabilities */
>  		case PHY_INTERFACE_MODE_REVMII:
>  			ge_mode = 2;
>  			break;
> +		/* FIXME: RMII is not set in the phylink capabilities */
>  		case PHY_INTERFACE_MODE_RMII:
>  			if (mac->id)
>  				goto err_phy;
> -- 
> 2.30.2
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

