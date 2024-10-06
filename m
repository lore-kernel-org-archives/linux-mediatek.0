Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F58DCFB43F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 21:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXMG2Z09dsxVPz1ySWzPmMvuK9suEebz7Xj94z8NvIc=; b=twzKiqXvllT+6IQ/mo8279K1eK
	xjsCKx4msQlgdaBTGRBnizMCge0ULewgt3ZOJ/8KCA+2SAd9dI/dk+r90I98i6hvyWq0KCFdgxeaV
	KhtyvXCV+bA4whQJ44ZED73AiI+Jw5T00k5eIUwHV6bSoWDk6Hq78Q+TJpHi+y8hm4g1AA3qxH/jJ
	GW3hHPxyidhP3l7nLar7Og0SdsrYAol66NQ5q9A89TKHoQstRUFfcAiE4utJz+tuv/gCi7Ql0voph
	Ua4zQdpeVcOEWlfP7crgmBqhCMYVRxmHkzCWuHu5hLV1dv0qLh0/C+0dIOt5OqMJA4ghEwXs8GNRV
	1etCGPbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxYsi-00000000fNy-2Xi7;
	Sun, 06 Oct 2024 21:33:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxYrM-00000000f56-2Xjb;
	Sun, 06 Oct 2024 21:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rXMG2Z09dsxVPz1ySWzPmMvuK9suEebz7Xj94z8NvIc=; b=U3bo49WdJkqQnHQFGpUaObggd3
	P5kvBkTE5IOQqT/8x0isC7sFsQSGIgZuPLqIdvXE6eKgBjtMvhXHANEx/aUpH5xQH3/Q103ADIghP
	JeF2ap9Zzked66JrRcWw4q1wYlpTVSL5kaKBFkGB6AB7zZc6tx0lAcfC/FZsHBfXG88Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sxYrA-009D3J-68; Sun, 06 Oct 2024 23:32:00 +0200
Date: Sun, 6 Oct 2024 23:32:00 +0200
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
Subject: Re: [PATCH net-next 6/9] net: phy: mediatek: Hook LED helper
 functions in mtk-ge.c
Message-ID: <3e27eddb-91c6-4903-9de5-f3df8098a38c@lunn.ch>
References: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
 <20241004102413.5838-7-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004102413.5838-7-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_143212_666376_547F2839 
X-CRM114-Status: UNSURE (   8.50  )
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

> +static int mt753x_phy_led_blink_set(struct phy_device *phydev, u8 index,
> +				    unsigned long *delay_on,
> +				    unsigned long *delay_off)
> +{
> +	struct mtk_gephy_priv *priv = phydev->priv;
> +	bool blinking = false;
> +	int err = 0;

There is no need to set err.

> +
> +	err = mtk_phy_led_num_dly_cfg(index, delay_on, delay_off, &blinking);
> +	if (err < 0)
> +		return err;


    Andrew

---
pw-bot: cr

