Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE346C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 16:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65bEymJ6ebXyukg1mYJd0nAb5NJZzFAYYGuH+aczhNo=; b=Eye/Wfa7GRVUBmiEXd9pr4UufZ
	GcHcUyEEnsC3TQyZ84qgtp8MUqY405tmtgvp+hMqfwmfq0ehnyj7yWrgBFSP5CbTnfcCeZqlsVIP0
	ww1KXNkpe5nb9gYNap2DMGhe6QkrSG5cOdvM/6UZN/kvGxtbKFS8qxM+kyhk6c0BUUISDSXzGCus1
	tzHV3Xbf1tXJa4p9ISyvFYmx1rPu8VXQ5ZLY5AoZ6luwgb5IzfQ93eNKbU03WAJcf0rcynjclIfQZ
	MrXA5Pi94ytzxWqEe0F83xCg4PvZhQd7kFdMG0o+/RtQLQOUyhZOD4qAee37/PHmEgRbD2d/kCS64
	a23sOTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okpee-008zGK-DK; Tue, 18 Oct 2022 16:41:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okpeb-008yOZ-JX; Tue, 18 Oct 2022 16:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=65bEymJ6ebXyukg1mYJd0nAb5NJZzFAYYGuH+aczhNo=; b=ltF5gg985jvEOsX9L5HsHuiNyj
	D4uQN4/DjloYOv61pSRgwUw1yX1BLI6JFTTK5UAj8sDMvgKtWsMmgVmmbQP2aoSqNIXA6QCAw/fA/
	Mp88Z1BxtyzUK0YyAbFWKvLSkHEgBrluaSe+0hskBmQTtfnb7WTDvMMyzb2CLR2MGjuOX7fFFBrjx
	ZNyfNDnlsVoQaZi8ur0uwR/lilvC1Lr7lObOz4jvlGe8aJDCU51XV1yoXmou9S6epiKiVz65gVmgO
	Fv3uEQmzgcYzuFRc/TJQ6GBSZ595tH/pbmD5Hn9/nnxXmnY+ZsKG7VcaO818LigTO20kkydB0hsPN
	9PfgsUjA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34774)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1okpcR-0004ga-9F; Tue, 18 Oct 2022 17:39:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1okpcL-0001DJ-1a; Tue, 18 Oct 2022 17:39:01 +0100
Date: Tue, 18 Oct 2022 17:39:01 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y07Wpd1A1xxLhIVc@shell.armlinux.org.uk>
References: <20221018153506.60944-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018153506.60944-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_094121_677112_1A4CB847 
X-CRM114-Status: GOOD (  16.85  )
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

Hi,

A couple of points:

On Tue, Oct 18, 2022 at 05:35:06PM +0200, Frank Wunderlich wrote:
> diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> index 736839c84130..9614973fd9c4 100644
> --- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
> +++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> @@ -122,10 +122,25 @@ static void mtk_pcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
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
> +	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &val);
> +	state->an_complete = !!(val & SGMII_AN_COMPLETE);
> +	state->link = !!(val & SGMII_LINK_STATYS);
> +	state->pause = 0;

Finally, something approaching a reasonable implementation for this!
Two points however:
1) There's no need to set state->pause if there is no way to get that
   state.
2) There should also be a setting for state->pause.

> +}
> +
>  static const struct phylink_pcs_ops mtk_pcs_ops = {
>  	.pcs_config = mtk_pcs_config,
>  	.pcs_an_restart = mtk_pcs_restart_an,
>  	.pcs_link_up = mtk_pcs_link_up,
> +	.pcs_get_state = mtk_pcs_get_state,

Please keep this in order - pcs_get_state should be just before
pcs_config.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

