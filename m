Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6751C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 14:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOe6ftm83MjcbSsPzfhXQYYG0KG1pAc9ELl18Zq14Gs=; b=Pe39b2B+j9/4k2Lll541Mm94vC
	9E8dw10ShgBlnuDwSOXdrz/C1mrGLURgfjxkRiFk6rp+gqNIe6zOD8xfwWkU+FYv8vSnW7d3GZ1PC
	MK1RLpSLDCbt/BQ1PReI+i3lg4+ioku69admKuGdFHbQy9QbEu69qmaVqodk496T0GEYa1cSRDpXj
	yp6hAsuwZf4alCjM2JRWDuI2p2dCRTfCsMmYY+sqjThqrhwVxr5bj6bWqxPOd9l4QvoMgR80AsK/I
	QVA2tsJH59lQ29moPnbyrVT11H+jjDjXKDYA7oORTAkcYwBk683IgKxt1zXqAO4VtRN9RZjjMqwQ1
	qOx4mndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8itP-008n7x-HD; Fri, 23 Dec 2022 14:19:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8it4-008mrw-5o; Fri, 23 Dec 2022 14:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yOe6ftm83MjcbSsPzfhXQYYG0KG1pAc9ELl18Zq14Gs=; b=M2rXfeoOXsELTA+n9t49bHnxKd
	/wuaZLFU+jz64uDHhv+ghw745Z3XrazuJOTRWkpzlOBC0e51iNCGGcb2N2OsIve322+kf9B8NNdAd
	MgP4OMuifOp1S+jNaZxbtOGlrLO2D1WYbDiWEi9FP9JNPOUohxdVdgQYtOPQN94VVw5c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1p8ish-000LAe-KP; Fri, 23 Dec 2022 15:18:39 +0100
Date: Fri, 23 Dec 2022 15:18:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biao Huang <biao.huang@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	macpaul.lin@mediatek.com
Subject: Re: [PATCH v5 1/2] stmmac: dwmac-mediatek: enable 2ns delay only for
 special cases
Message-ID: <Y6W4vwJHG+6PI8fd@lunn.ch>
References: <20221223015029.24978-1-biao.huang@mediatek.com>
 <20221223015029.24978-2-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223015029.24978-2-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_061902_287767_4060C1E4 
X-CRM114-Status: GOOD (  19.15  )
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

On Fri, Dec 23, 2022 at 09:50:28AM +0800, Biao Huang wrote:
> In current driver, MAC will always enable 2ns delay in RGMII mode,
> but that will lead to transmission failures for "rgmii-id"/"rgmii-txid"
> cases.
> 
> Modify the implementation of fix_mac_speed() to ensure the 2ns delay
> will only take effect for "rgmii-rxid"/"rgmii" cases, then user can
> choose phy-mode freely.

This does not seem correct. There are three ways the delays can be added:

1) The MAC
2) The PHY
3) Extra long lines on the board.

What the four RGMII modes tell you is what is needed in addition to
whatever the board provides. So it describes the combination of 1) and
2). Your board does not appear to be applying any delays, so you
should be using rgmii-id.

The MAC and PHY driver then need to decide how to add these delays,
and in most cases, the MAC does nothing, and passes phy-mode to the
PHY and the PHY adds the delay.

The MAC can add delays, but if it does, it need to mask out the delays
it added to the value passed to the PHY. Otherwise the PHY will add
the delay as well.

>  
> -	if ((phy_interface_mode_is_rgmii(priv_plat->phy_mode))) {
> +	switch (priv_plat->phy_mode) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
>  		/* prefer 2ns fixed delay which is controlled by TXC_PHASE_CTRL,
>  		 * when link speed is 1Gbps with RGMII interface,
>  		 * Fall back to delay macro circuit for 10/100Mbps link speed.

So this is wrong. PHY_INTERFACE_MODE_RGMII means the board is adding
the delay via long lines. You should not be added any delay at all.

For PHY_INTERFACE_MODE_RGMII_RXID, you need to mask the RXID bit from
phy_mode when connecting the MAC to the PHY. Otherwise the PHY is
going to add this delay as well.

	 Andrew

