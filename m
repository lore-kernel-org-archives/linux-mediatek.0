Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48642C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KN0V0b1cvZhsr3ZgIxKHJ6DjqlcYAL+J/k6uHOW7PXA=; b=LA1HlRGJdTBfULsamhUA8xbU0Z
	r3vqqUwJRN1fzu1C4TdWYxcINrf6UDValatzM2JQNxvgj5gX78qaUGhuoDtjqETjU0YcQ8CzQ4u6p
	kAnDtRpYW4L/dvY2bqAylG1Lwzq9Gf5M2pdIPBBYlkiEBZXO51f44JeNEP32YWpwgcG+f9z1vmpkl
	3EMBTNDvzrcQlN6wbUJ9G32xm1fTfGO2X3E1zw6Jf/mmK+8gP7xbKFTAn+cpHSh7zeJyUKOTifv2z
	EHnfUioKaGysxM5/EvVwIVB1nN4XL6wAr5MJLkzXTL7vcR8jLKLP18hsL4cF4RiTgC/tvJYYkzcS6
	gN3l/Www==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qURxq-00Ahbj-2z;
	Fri, 11 Aug 2023 13:14:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qURxo-00AhZk-0Y;
	Fri, 11 Aug 2023 13:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KN0V0b1cvZhsr3ZgIxKHJ6DjqlcYAL+J/k6uHOW7PXA=; b=wt33i2aFCwO/UD9kZdJmfxF/bR
	N3rrqMROnewUrRHVo6Hoi6K0T3ppHWrKOdQIhGwOhKqqJ+1lv6D3meiHphfmCgrTDVHqKczMDxMRh
	SWlJA2DMlyhgfpwBfNQ4a2dfIK0C8IyijJs2NbTk7o8ENQjvydZ+KoSEcgsrR7Tsz1/k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qURxS-003o6u-6j; Fri, 11 Aug 2023 15:13:38 +0200
Date: Fri, 11 Aug 2023 15:13:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: phy: mediatek-ge-soc: support PHY LEDs
Message-ID: <9727375d-8d89-489b-bd3f-4f18930ff42c@lunn.ch>
References: <a21288bf80f26dda6c9729edb5b25d0995df5e38.1691724757.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a21288bf80f26dda6c9729edb5b25d0995df5e38.1691724757.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_061400_205906_4D438A0D 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

>  
> +#define MTK_PHY_LED_STATE_FORCE_ON	BIT(0)
> +#define MTK_PHY_LED_STATE_FORCE_BLINK	BIT(1)
> +#define MTK_PHY_LED_STATE_NETDEV	BIT(2)
> +struct mtk_socphy_priv {
> +	unsigned long		led_state;
> +};

Hi Daniel

A blank line between the #defines and the struct would be nice.

> +
> +struct mtk_socphy_shared {
> +	u32			boottrap;
> +	struct mtk_socphy_priv	priv[4];
> +};
> +
>  static int mtk_socphy_read_page(struct phy_device *phydev)
>  {
>  	return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
> @@ -1071,6 +1112,370 @@ static int mt798x_phy_config_init(struct phy_device *phydev)
>  	return mt798x_phy_calibration(phydev);
>  }
>  
> +static int mt798x_phy_hw_led_on_set(struct phy_device *phydev, u8 index,
> +				    bool on)
> +{
> +	struct mtk_socphy_priv *priv = phydev->priv;
> +	u32 mask = MTK_PHY_LED_STATE_FORCE_ON << (index ? 16 : 0);
> +	bool changed;

Reverse christmass tree please.

Otherwise, this looks good.

	   Andrew

