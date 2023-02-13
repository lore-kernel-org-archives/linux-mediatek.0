Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A9CC636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 12:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Kt/ROz9GCT+psVlOSyjKfrnfI3lyNaAQ9FWHqO+GUY=; b=DYArGn11Tek2nDZniKZ9vFhKXN
	Xk9xqUiUcvMWQKfY2VAU7SdSb3zOGnhcdqDAuSVx8LoDx8kIqXErjv1NVC8pXHycM7suC/1lmXB60
	YNb3aoGqj7LNpt/zlf7h29dxTHhZjv9aGawJ2hh3n2ASh9zqseJWGgt4HkDLD45b5hswGVtC1yLQP
	4munpHJMvHzrBS9laxJG7X5jHBN8c9h9TvBj9WO+JZuAmeZLZeXzaAcgrpVRw1svtYtSE8dU7B6Ln
	8KEBmVYEpRwo9cWCK3NhzvRNcw9sk8gX0SMHR6Og4Mrz8FZqaZd+/ajESm4qLngok/b2ekKFyvdca
	7MJHcZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXw3-00EdQh-68; Mon, 13 Feb 2023 12:27:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXw0-00EdPt-G6; Mon, 13 Feb 2023 12:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2Kt/ROz9GCT+psVlOSyjKfrnfI3lyNaAQ9FWHqO+GUY=; b=HdLK7ImOrfYSnVEnuS1Zbhl/tx
	4kKSVabjF3tnKWtjOYv8tqBImy0Lh1rqP/nXivw3hMngCPhDJwsV4OojcLJZ1gIh3kVcth9XCidsK
	7fCNtC77k2+Q05lCOkiLv/fL9RtCeZmO6rVgY6W76NBI2T0pcyeyt6yrMVbskGS788Ca8SAMCNqeN
	ifm6/h/8/qE7hLdaVrKdX4tmuM6IT6J9iRCyza/hPBtSu2TzsWfNmVbRP8ZcLUfj9Izfp8AkTzq7G
	apjcxu/L2Zn0bj4pUfQhWFjCMgx78cfDI3Lsulh5rjFzPcsj0X30wa977LA71bmpextg6Fs21Jpzu
	xJlJMnIg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33454)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pRXvx-000428-P2; Mon, 13 Feb 2023 12:27:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pRXvw-0002xh-2E; Mon, 13 Feb 2023 12:27:48 +0000
Date: Mon, 13 Feb 2023 12:27:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v5 11/12] net: ethernet: mtk_eth_soc: switch to external
 PCS driver
Message-ID: <Y+osxNlwxPFLZAWx@shell.armlinux.org.uk>
References: <cover.1676128246.git.daniel@makrotopia.org>
 <a5360b8156aa6bda0bed01300e723c51f02c0de0.1676128247.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5360b8156aa6bda0bed01300e723c51f02c0de0.1676128247.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_042752_556974_C72294DD 
X-CRM114-Status: GOOD (  10.92  )
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

On Sat, Feb 11, 2023 at 04:05:18PM +0000, Daniel Golle wrote:
> @@ -4582,6 +4583,7 @@ static int mtk_probe(struct platform_device *pdev)
>  		if (!eth->sgmii)
>  			return -ENOMEM;
>  
> +		eth->sgmii->dev = eth->dev;

My comment on this appears unaddressed (and not responded to either).

>  int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_rgc3)
>  {
...
> +		ss->pcs[i] = mtk_pcs_lynxi_create(ss->dev, regmap, ana_rgc3,
> +						  flags);

This appears to be the only place that sgmii->dev is used, and this
function is only called immediately after the above assignment.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

