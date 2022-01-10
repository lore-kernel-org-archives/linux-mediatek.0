Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C645C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 00:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOUC5RCowM30wxDq91VBf3NojljGmI/VPLAy5ldY4Qc=; b=nZBa9D1wTOQ5Hg
	mhPYL+DKUEAj+rgN0YF9llB8oJHePXyCQiwyCHEIu2V1fi1ZXdvmQ0ng974lDntlV34oTTvm+kfrs
	U7VMTGEww+s/f+KUtBWi9EA53H8yz8fzhZteXgTotCX1P/XLEqoytuowkVxbpSjD9LpeH6FMGBqQQ
	pWKCw6R0CGQp/NNmWv/pzJund3eA4A4NSZaQduJqZMZUjWH8z0Pbtk9pZO1tJBC6kztjexDrPc44d
	hl/mJFQfU1srSmWKkp0FiN1MoLT2aW1Ly+we9CZ3/O6XMdWEUBvUQwf7WEw4uDHYzHvpRdgBnVdjm
	rfkbp+OcIHrLlI5yRv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6imu-008dCi-IW; Mon, 10 Jan 2022 00:43:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6img-008dC9-Fd; Mon, 10 Jan 2022 00:43:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4C37B80FC0;
 Mon, 10 Jan 2022 00:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11D9C36AE3;
 Mon, 10 Jan 2022 00:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641775415;
 bh=DmH7M5tRFpzsUho15Vfl8GOzZSKDrQsO+NphZsKjRzY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dVEQZVvw4+aXfmrbaCeha9pUXDgrzWIW/lGiTDSlDegUr2oI2qMe8fIDAYm/kdmNK
 d9Hk/N1IsETmVVGyvi+mcg/wzrwYJgFidWGrlHR9CsVlUjvGAXH5+oU9pcJqUioNAa
 h4ZFdoeg5IGfWBgXJsNaE9xJMgftF7XIgPyMrhLhS2c3DMfAHuV0W3oUSXmEWWLvaY
 khC0FtMPJlv95ncdlj8eMudEbFLVhwhVbH6EkRs4dWwXEH3VAQnAsLj0ihOW7T6bm6
 Yb/AgSabCfvfUOeVzSQ3gIL5u3ZQQM8FGDzi8bfPPPjPheHgWXsm+A/1Du+VVXZq3G
 774u8bbBnKV+g==
Date: Sun, 9 Jan 2022 16:43:33 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: trix@redhat.com
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, matthias.bgg@gmail.com,
 linux@armlinux.org.uk, nathan@kernel.org, ndesaulniers@google.com,
 opensource@vdorst.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix error checking in
 mtk_mac_config()
Message-ID: <20220109164333.61dc2e89@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220108155003.3991055-1-trix@redhat.com>
References: <20220108155003.3991055-1-trix@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_164338_701372_8D8D80D5 
X-CRM114-Status: GOOD (  20.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat,  8 Jan 2022 07:50:03 -0800 trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this problem
> mtk_eth_soc.c:394:7: warning: Branch condition evaluates
>   to a garbage value
>                 if (err)
>                     ^~~
> 
> err is not initialized and only conditionally set.
> Check err consistently with the rest of mtk_mac_config(),
> after even possible setting.
> 
> Fixes: 7e538372694b ("net: ethernet: mediatek: Re-add support SGMII")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index b67b4323cff08..a27e548488584 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -385,14 +385,16 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
>  		       0 : mac->id;
>  
>  		/* Setup SGMIISYS with the determined property */
> -		if (state->interface != PHY_INTERFACE_MODE_SGMII)
> +		if (state->interface != PHY_INTERFACE_MODE_SGMII) {
>  			err = mtk_sgmii_setup_mode_force(eth->sgmii, sid,
>  							 state);
> -		else if (phylink_autoneg_inband(mode))
> +			if (err)
> +				goto init_err;
> +		} else if (phylink_autoneg_inband(mode)) {
>  			err = mtk_sgmii_setup_mode_an(eth->sgmii, sid);
> -
> -		if (err)
> -			goto init_err;
> +			if (err)
> +				goto init_err;
> +		}
>  
>  		regmap_update_bits(eth->ethsys, ETHSYS_SYSCFG0,
>  				   SYSCFG0_SGMII_MASK, val);

Why not init err to 0 before the if or add an else err = 0; branch?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
