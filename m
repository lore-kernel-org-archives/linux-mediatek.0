Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D86C10F04
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtEyYJ2fL6Bd/0ZQMBJdBd4JHYGCVwVdwTisB+sS+6c=; b=eOsge/p7wvYBx1zGIvET2xZxbo
	CANJ1H3KKPo5vgrbagCXkTjYuFOeVRgMa4MARnxSSZNhtkRNLy4bc79vpXUVfWNUoTB2/4ngtCGs5
	Mre3/yVgy/DOp7hNJwL8osU3ZucxdN3YFfWw/nNeW6S34whE1WWXRdmnzJ9qcDdWDgYlH/1QbBnYo
	YDFAU8iDDScocV2Yk3A2uDS0jABtZIM6ebvlkkMZ9uhRX8r3gLbGs89YfpxC+y58+U0PiNgIHx8ci
	RM5eaIaqpZieKM7DYr0chTbUt4LadwopvCl3kum0T2g64cpiVdKGztz1zyWe7iB5RvHPL13mpGG5+
	FNT3LYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAw6E-00AyZT-14;
	Wed, 06 Dec 2023 17:54:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAw6A-00AyEW-2e;
	Wed, 06 Dec 2023 17:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xtEyYJ2fL6Bd/0ZQMBJdBd4JHYGCVwVdwTisB+sS+6c=; b=zH/nzGG9C8Rq19EuObrG0yz4pf
	R93eD9OUVT4C3HY1QMdnol7HJPeIhWZROomiVjeEA5vOZl+0VpkragNpePVgochBymEUcb4tqXCE3
	+cjT7SYIHITZerFDewzgXH17u0OEX74lJJgr1l0RhzVh/6LqsKCJhwiwCF7e2roBz4pIBnMbfKqer
	rsm1nvLceBhbmqXohGYuaIJpwIMyIwAia2po95HwUoKD2VVBzltSdO2VPi64RXLRe2cWd+jlWTZg7
	LkNLQNz1yJGIvo73+eEPhriyAPciIpXk+54b0oGxPr5VdsfZ3ol0O1LZA6f3oOXKHIkbRLhsIHA6d
	4E4Aed3w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45446)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rAw3e-0000CW-1J;
	Wed, 06 Dec 2023 17:51:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rAw3a-0002uY-MH; Wed, 06 Dec 2023 17:51:34 +0000
Date: Wed, 6 Dec 2023 17:51:34 +0000
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
Subject: Re: [RFC PATCH v2 3/8] net: pcs: pcs-mtk-lynxi: add platform driver
 for MT7988
Message-ID: <ZXC0pq2C6iRmeF4B@shell.armlinux.org.uk>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <68bb81ac6bf99393c8de256f42e5715626590af8.1701826319.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68bb81ac6bf99393c8de256f42e5715626590af8.1701826319.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_095414_865174_ED7C2AA0 
X-CRM114-Status: GOOD (  16.82  )
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

On Wed, Dec 06, 2023 at 01:44:17AM +0000, Daniel Golle wrote:
> +struct phylink_pcs *mtk_pcs_lynxi_select_pcs(struct device_node *np, phy_interface_t mode)
> +{
> +	struct platform_device *pdev;
> +	struct mtk_pcs_lynxi *mpcs;
> +
> +	if (!np)
> +		return NULL;
> +
> +	if (!of_device_is_available(np))
> +		return ERR_PTR(-ENODEV);
> +
> +	if (!of_match_node(mtk_pcs_lynxi_of_match, np))
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
> +EXPORT_SYMBOL(mtk_pcs_lynxi_select_pcs);

If you're going to play games like this, then you must mark the driver
with .suppress_bind_attrs = true to remove the bind/unbind attributes
in userspace that could wreak havoc with the above - because there is
_nothing_ that guarantees that the memory you're returning from this
function will remain intact. Basically, it's racy.

Also, I'm not sure I approve of using the "select_pcs" suffix (I
haven't spotted _where_ you use this, but returning EPROBE_DEFER to
phylink's mac_select_pcs() method doesn't do anything to defer any
probe, so that's an entirely misleading error code.

If we are going to have device drivers for PCS, then we need to
seriously think about how we look up PCS and return the phylink_pcs
pointer - and also how we handle the PCS device going away. None of
that should be coded into _any_ PCS driver.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

