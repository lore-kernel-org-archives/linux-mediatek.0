Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9892C6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uLY05c49ecqS91zmmiEb12QI7sOr+RmFbptlGn3Ypk=; b=3tN2xDzLZEdLn0Q5Qs0tt6WMMW
	No7n5V4a0sD94v9EfRgH6zkrcWOGH1l4mUe8d+Nd1NKRaKccxZqP+MpMA4d1YWLQZMfcwfVWex9ri
	/+zQQez67BS9pVJ3wr+O8bSs+bDVztx4D5KSSG0Ag3YTfxpEn0zD3PZ8JRQeLbhHd84A9ic5RjWBF
	Iy4b55d4aNcjbsEuKzntQhaztaKhBwulfE2IFSm3VL/ZqshhUL4PP6aHFIQo+iMOd3Q8/rOU50R1Q
	zZ7z7WQqGDsEFJ2zaRK/3ZtgQ4dxTQ7mT5RYtPQlhW/eyA6zT1jDdSfdzE9mWXdyXuoAsovpuDzIo
	2l8hvQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEyQ-00BVwr-Dr; Mon, 19 Sep 2022 11:30:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEyE-00BVtM-Nf; Mon, 19 Sep 2022 11:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+uLY05c49ecqS91zmmiEb12QI7sOr+RmFbptlGn3Ypk=; b=SgKWhnBdZUGfUYaD7jCyqSh3sQ
	Vpr2XdOB5RPtruhHeZGTRUWQy/IsQI8LMNoSGlQBXH6h6Nrbxur2rTe8F/ufqVAZvE1eZEXhAJiUq
	RMmWDjHBXwk0X1bC8KfUv5njGb03/l3r/ZXpRw822B3fP2R2GaSTVICBunqjRgA+w1WbYhyWXl2vW
	h6QrbkibWGsH9bFMoV/044qDwnWfD4LYW8SLFAEDidHd7r+MNCw2ij6P/IPSAv+XHL9E/8Wy+XuAo
	XrIfdpyZMCY7ge8+aLWwKfyjJyNa3cRkcrLdKcTbAOfdYxJ6sa8P4hCWXQW3JikQ90klKN7vmLqyW
	05msk2Tw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34402)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oaEy0-0000oO-TO; Mon, 19 Sep 2022 12:29:36 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oaExy-0006Lv-GH; Mon, 19 Sep 2022 12:29:34 +0100
Date: Mon, 19 Sep 2022 12:29:34 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/5] net: mediatek: sgmii:
 mtk_pcs_setup_mode_an: don't rely on register defaults
Message-ID: <YyhSnqacAE4ajRdy@shell.armlinux.org.uk>
References: <20220919083713.730512-1-lynxis@fe80.eu>
 <20220919083713.730512-4-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919083713.730512-4-lynxis@fe80.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_042950_793382_4BE77BF5 
X-CRM114-Status: GOOD (  17.25  )
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

On Mon, Sep 19, 2022 at 10:37:10AM +0200, Alexander Couzens wrote:
> Ensure autonegotiation is enabled.
> 
> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> ---
>  drivers/net/ethernet/mediatek/mtk_sgmii.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> index 18de85709e87..6f4c1ca5a36f 100644
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
>  	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
>  
>  	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &val);
> -	val |= SGMII_AN_RESTART;
> +	val |= SGMII_AN_RESTART | SGMII_AN_ENABLE;

I'm not sure if I've asked this before, but why does SGMII_AN_RESTART
need to be set here? It could do with a comment in the code.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

