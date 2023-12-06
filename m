Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0AFC10DC1
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKSBsZAZJfjo9et72d0mSM7YqoMxniSM0jUJH+gRhQM=; b=eRBABuVd4dxqKd3MranNezrrpn
	wyFFgb61kRxJPNYpjog300rj95gpfncShisCz7F4CDCsZAafblBS4KPlMyKdjGpRprNle7HjX2k+d
	CB0kPaF1BtM2rq22/tblUeDatTO54Bp9peXp/Lg+CXqwkWWSEeAMGKNSOJwU9c6kbySHaXnFYsEd2
	cg5oCBuY+HqH1fWixbi6TUiedXIV3TVb2rcIjdFUTom4GsrbH6yBn4tnidw9bzVodnO1IN3GFFfWa
	IEP06t8y5dX2Y6XjGyUVydP8N5Bbn39Cr7jaSMqujc3M2lcLPCBoEZdNjcCSG419dMA4X23JLqnJc
	YS5IHARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAw8Y-00Ayu6-2b;
	Wed, 06 Dec 2023 17:56:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAw8W-00Aysv-0E;
	Wed, 06 Dec 2023 17:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PKSBsZAZJfjo9et72d0mSM7YqoMxniSM0jUJH+gRhQM=; b=ZsX3DpsK1aSucSyC1aqbU4xygy
	N8wt7Ogr1sfm32PjJkPFRnQPSNYMX3CE8rwBxp3Rk+ixAED/33xJ6I3U1Dm/OlIHGIs9z+gMJ2w0W
	mrv2ctMvSzhTL4rQx7fxvWYlt9gs4pHnDrKa8B5K5m4RZ+ZGUnsSNPorJfmLsx2Yo4+6Y+HCRE9yo
	ITyW8z8FgroOvK1JsWNh01emWtxzxYT5wQhHtcRUXbtZEJf7MRctIN+kj4UF93xKSQ4f8Bs5Y7dr3
	X8x0HACW5cfJaRQ/scLQxXzj8WUleRz4tUutzCMBnU06SwLKQVKWea+ToU9+nMD9GiBEUBGjO+z9Q
	ieYKAnlA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53542)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rAw88-0000DD-09;
	Wed, 06 Dec 2023 17:56:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rAw89-0002uf-PY; Wed, 06 Dec 2023 17:56:17 +0000
Date: Wed, 6 Dec 2023 17:56:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH v2 5/8] net: pcs: add driver for MediaTek USXGMII PCS
Message-ID: <ZXC1wRWEx3f9MMMq@shell.armlinux.org.uk>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <3cd8af5e44554c2db2d7898494ee813967206bd9.1701826319.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cd8af5e44554c2db2d7898494ee813967206bd9.1701826319.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_095640_107185_0CB490EA 
X-CRM114-Status: GOOD (  10.84  )
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

On Wed, Dec 06, 2023 at 01:44:38AM +0000, Daniel Golle wrote:
> +struct phylink_pcs *mtk_usxgmii_select_pcs(struct device_node *np, phy_interface_t mode)
> +{
> +	struct platform_device *pdev;
> +	struct mtk_usxgmii_pcs *mpcs;
> +
> +	if (!np)
> +		return NULL;
> +
> +	if (!of_device_is_available(np))
> +		return ERR_PTR(-ENODEV);
> +
> +	if (!of_match_node(mtk_usxgmii_of_mtable, np))
> +		return ERR_PTR(-EINVAL);
> +
> +	pdev = of_find_device_by_node(np);
> +	if (!pdev || !platform_get_drvdata(pdev)) {
> +		if (pdev)
> +			put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	mpcs = platform_get_drvdata(pdev);
> +	put_device(&pdev->dev);
> +
> +	return &mpcs->pcs;
> +}
> +EXPORT_SYMBOL(mtk_usxgmii_select_pcs);

All the same arguments apply here as per the lynxi driver.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

