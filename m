Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC23C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 16:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lESwXvm7/TM1xJl1haYY/cX2oj4VfSDfgY65rchWdvg=; b=zMIaLLJ60Lp6w0r96W/1To0GrP
	FURbvYy/+b+0rrsfyh+UkpKZjBxyXkB5QvyDFQgs56nkyx7zgAVepPt8qwhLgrX0B1kuu/Btnf7k0
	NXOJ2duBpERgh43tnSaxQsKECLT7GZNGekddMOrQoxpMYMoB088b7k8rfgZuw8nQDvESPYdgNU9yR
	Ukz0a5lChuvtrLzVkz39RNJjAxJ1llc31Q5q79U1deVWrFO9Q/pFPcZC9DqHaly7dg52Zvka4BcyB
	Q7pZXihv/hGQ+lz2AVhXV9jAdzzV7SAmHIikVHCH07QkWIlPgNnGBrrBzPRvPVlWcgHmwFCGTnwSQ
	+/qqzMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYF3-000FAV-M5; Thu, 20 Oct 2022 16:17:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYEz-000F7i-E4; Thu, 20 Oct 2022 16:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lESwXvm7/TM1xJl1haYY/cX2oj4VfSDfgY65rchWdvg=; b=QvK+ioe3eZ2LCAB86gz7Gd5G95
	x0fPcG2Db25FHsXiK/+Sw24enuFw55evax9BQKac4ROlOtV4+Q/AGvtRu2zCpjUdS+eUlFdJaCj4x
	RToIx5OUJMTOe74dz3GKKjvingM8LPXxAT3crT+3oOy9acGTgfzr0bZqAFuFTf1ZXJmJu3P+7majd
	mBCgwI1R5d3DCeoJ/+omEjyTxcL+oKtRS+wbca543Mz5cVhxgdoJ/qmkLsxPVLmhx0WkNLZYKXA6K
	CzK5goRxtiHEORaGz2DoZVCYCxgsXfv5ZXuMC/McJEeEsdN/ewB7uxoUqmCqsbzIqFVUQtNJbuVN8
	XHZH51KQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34828)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1olYEr-0007UG-6T; Thu, 20 Oct 2022 17:17:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1olYEn-0003IX-Hp; Thu, 20 Oct 2022 17:17:41 +0100
Date: Thu, 20 Oct 2022 17:17:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y1F0pSrJnNlYzehq@shell.armlinux.org.uk>
References: <20221020144431.126124-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020144431.126124-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_091753_493150_884F2292 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 20, 2022 at 04:44:31PM +0200, Frank Wunderlich wrote:
> diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> index 736839c84130..8b7465057e57 100644
> --- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
> +++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> @@ -122,7 +122,21 @@ static void mtk_pcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
>  	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
>  }
>  
> +static void mtk_pcs_get_state(struct phylink_pcs *pcs, struct phylink_link_state *state)
> +{
> +	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
> +	unsigned int val;
> +
> +	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
> +	state->speed = val & RG_PHY_SPEED_3_125G ? SPEED_2500 : SPEED_1000;
> +

Sorry, looking back at my initial comment on the first revision of this
patch, I see my second point was confused. It should have read:

"2) There should also be a setting for state->duplex."

IOW, "duplex" instead of "pause".

Also, is there no way to read the link partner advertisement?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

