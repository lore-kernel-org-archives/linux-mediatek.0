Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57502C27C53
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jun 2024 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZK35UKRjoOKYFhurJCkNTHut1SmtzsCztmANaZj1AbM=; b=XFELmAV+xanAGtvJQ5VtiwKTp5
	voHIofSP5Loc0B7qub/WfSxTjeJVhqoDJYeVGar8DwrxtIqL9BO+MO7SbeGDZagr7J6bjk60DZZnn
	ixsm0OR2KI7LFBDnW5wus2mooEf1qftI/tZVOGyQXzKkNsCqmOiIxL5HeMQagBe8J8LrusfrGtQBA
	3bxuigHuC69nfcSzZ7Ynw/w+nWua4O1TrSsl0f+B88mWffrVVOK3dGrgRKmdwowOufSihPvSDFGMa
	MVaFL7PM5fpF++ac10GB6aI9yjjdq5qHkwSI+EIt5YMpaeCJKClSrJD6TJtxDb1OKkn/lTCClKgQM
	8PqrjYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4Yy-0000000CVeS-2vZo;
	Sat, 22 Jun 2024 17:30:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4Yu-0000000CVdJ-1GO9;
	Sat, 22 Jun 2024 17:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZK35UKRjoOKYFhurJCkNTHut1SmtzsCztmANaZj1AbM=; b=wrAds5SADLPr0Os1vmzBTGmoOi
	FxMvcYrCrTyie1niDYeLmFq1ZQs9kmr1NaiMt4PfQPUzvqv5EuGB3fLPPGfdr+aRUyuC7ghH5gWCd
	tXRhQD7YqIaO9hrQnjJ14fiZmW+9hPdTw+eng3HC4H4GRe68cRpJ44XXX4QsueO8WosQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sL4Yb-000k1P-BW; Sat, 22 Jun 2024 19:29:45 +0200
Date: Sat, 22 Jun 2024 19:29:45 +0200
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
Subject: Re: [PATCH net-next v8 06/13] net: phy: mediatek: Hook LED helper
 functions in mtk-ge.c
Message-ID: <e1ed191f-7c70-4c34-ad1f-40aaae18582b@lunn.ch>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
 <20240621122045.30732-7-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122045.30732-7-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_103004_364659_2E9DFB2D 
X-CRM114-Status: GOOD (  12.68  )
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
> +
> +	if (index > 1)
> +		return -EINVAL;
> +

It looks like this test could be moved into the common code. It seems
like all variants have a single LED.

> +	if (delay_on && delay_off && (*delay_on > 0) && (*delay_off > 0)) {
> +		blinking = true;
> +		*delay_on = 50;
> +		*delay_off = 50;
> +	}

Do the different hardware variants have different blink speeds? If
not, maybe also move this into the common code. Otherwise maybe add a
comment in the commit message explaining the differences between the
hardware variants.

    Andrew

---
pw-bot: cr

