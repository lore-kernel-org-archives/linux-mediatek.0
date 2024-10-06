Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BFCCFB43F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 21:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znbGOoRua4eKtsN6Lv/azCVLjOVWsV4FVkU5wyTzlN4=; b=ucWLLu8MkIXT//Ls/aGpjuuLUu
	HXndiM4pjFlLuiuyXyoueg6Wz14h77zcuGmkt2+fZ1E48zPUZagayVp8ukhfqSuHb4vioQJWFrR+Y
	AVeW5nGhwfVctp5gBGZR7EekklZhOl5JBnKLQIiohSmRuqRuvXg9HdhrVt+zBYwa2bNy14dskplwV
	IV6yFJ7PdCp8Wt7D9TvfAgbjQxlJZwRbtY1O64mclmw0goRcH6O6SaRNUmvPBU4Gdq2xodof+u/Ds
	OT+EMVZU6v1JRRCI/wUIb5kaXGy7Tgg591gRG+Oj8mjjXuws5TGJ0i9hTznYfvVHzEhg6GSOYBsMH
	htl34w7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxYos-00000000eh0-14NG;
	Sun, 06 Oct 2024 21:29:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxYnZ-00000000eXA-0tKG;
	Sun, 06 Oct 2024 21:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=znbGOoRua4eKtsN6Lv/azCVLjOVWsV4FVkU5wyTzlN4=; b=4J0CDH3I+nVeFL+4KEs0xw7+a7
	XE05gqtIEpBn/hrG54uJ8snlmORlkwO4TOcNuYFUA+F+e/LlvWprmWcZjUGZpgRJgjWXYdenQKswP
	AhFbFq6JZbsAF++AzTbEdO9w2L2FiuyDU/r+3sCnXSm0XcYJx8YxzZtjjoWv1bmZ3vQY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sxYnK-009D0A-C9; Sun, 06 Oct 2024 23:28:02 +0200
Date: Sun, 6 Oct 2024 23:28:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH net-next 3/9] net: phy: mediatek: Move LED helper
 functions into mtk phy lib
Message-ID: <afd441fc-7712-4905-83e2-e35e613df64a@lunn.ch>
References: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
 <20241004102413.5838-4-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004102413.5838-4-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_142817_279116_2879F9F5 
X-CRM114-Status: GOOD (  11.45  )
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

>  static int mt798x_phy_led_blink_set(struct phy_device *phydev, u8 index,
>  				    unsigned long *delay_on,
>  				    unsigned long *delay_off)
>  {
> +	struct mtk_socphy_priv *priv = phydev->priv;
>  	bool blinking = false;
>  	int err = 0;
>  
> -	if (index > 1)
> -		return -EINVAL;
> -
> -	if (delay_on && delay_off && (*delay_on > 0) && (*delay_off > 0)) {
> -		blinking = true;
> -		*delay_on = 50;
> -		*delay_off = 50;
> -	}
> +	err = mtk_phy_led_num_dly_cfg(index, delay_on, delay_off, &blinking);
> +	if (err < 0)
> +		return err;
>  
> -	err = mt798x_phy_hw_led_blink_set(phydev, index, blinking);
> +	err = mtk_phy_hw_led_blink_set(phydev, index, &priv->led_state,
> +				       blinking);
>  	if (err)
>  		return err;
>  
> -	return mt798x_phy_hw_led_on_set(phydev, index, false);
> +	return mtk_phy_hw_led_on_set(phydev, index, &priv->led_state,
> +				     MTK_GPHY_LED_ON_MASK, false);
>  }
>  
>  static int mt798x_phy_led_brightness_set(struct phy_device *phydev,
>  					 u8 index, enum led_brightness value)
>  {
> +	struct mtk_socphy_priv *priv = phydev->priv;
>  	int err;
>  
> -	err = mt798x_phy_hw_led_blink_set(phydev, index, false);
> +	err = mtk_phy_hw_led_blink_set(phydev, index, &priv->led_state, false);
>  	if (err)
>  		return err;

If this is just moving code into a shared helper library, why is priv
now needed, when it was not before?

Maybe this needs splitting into two patches, to help explain this
change.

	Andrew

