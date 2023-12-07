Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E022C10DC1
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 00:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a7WGq/Q1VmA74C6RCoEzcxtkMSaMJKT84Yz/Ifv3Ko=; b=lnhR/f0+BFtiq3l1SI6rGYjJSx
	NmsM8la7kci0e6WSGqKAQBUfc3J6RAexFgSwK2S9CZ77w6wuPzNm6o3cMP8+5fxSgInRVbcJnFLDX
	Zc4YicqBAkAkqAbQY2qpfUP0wXQDao9AYeZ7U53ttbSfxg71jLgK8OlOUVTXjQRy1+71InUbtfIJI
	y7S7sHiOa07Q0zMmzxC2/OVY4ukHLMCC9v1oDF/lf7Ic7SeafCvpnBtXtUZNME+Ea1esJYLROCdrr
	DISuxRwZ2nasYgv0dT6JQQYdB4IFam6YUetjsFZyVQP8APSNsFDHGWQYNK/FqB3jvkhH1gv4NAiq1
	k9/J714w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB1vj-00BXCT-06;
	Thu, 07 Dec 2023 00:07:51 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB1ve-00BXBH-0H;
	Thu, 07 Dec 2023 00:07:48 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rB1vB-0000Eb-3C;
	Thu, 07 Dec 2023 00:07:19 +0000
Date: Thu, 7 Dec 2023 00:07:14 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <ZXEMsugMy6_gPRRi@makrotopia.org>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <68bb81ac6bf99393c8de256f42e5715626590af8.1701826319.git.daniel@makrotopia.org>
 <ZXC0pq2C6iRmeF4B@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXC0pq2C6iRmeF4B@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_160746_119800_EB0650F6 
X-CRM114-Status: GOOD (  27.92  )
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

On Wed, Dec 06, 2023 at 05:51:34PM +0000, Russell King (Oracle) wrote:
> On Wed, Dec 06, 2023 at 01:44:17AM +0000, Daniel Golle wrote:
> > +struct phylink_pcs *mtk_pcs_lynxi_select_pcs(struct device_node *np, phy_interface_t mode)
> > +{
> > +	struct platform_device *pdev;
> > +	struct mtk_pcs_lynxi *mpcs;
> > +
> > +	if (!np)
> > +		return NULL;
> > +
> > +	if (!of_device_is_available(np))
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	if (!of_match_node(mtk_pcs_lynxi_of_match, np))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	pdev = of_find_device_by_node(np);
> > +	if (!pdev || !platform_get_drvdata(pdev)) {
> > +		if (pdev)
> > +			put_device(&pdev->dev);
> > +		return ERR_PTR(-EPROBE_DEFER);
> > +	}
> > +
> > +	mpcs = platform_get_drvdata(pdev);
> > +	put_device(&pdev->dev);
> > +
> > +	return &mpcs->pcs;
> > +}
> > +EXPORT_SYMBOL(mtk_pcs_lynxi_select_pcs);
> 
> If you're going to play games like this, then you must mark the driver
> with .suppress_bind_attrs = true to remove the bind/unbind attributes
> in userspace that could wreak havoc with the above - because there is
> _nothing_ that guarantees that the memory you're returning from this
> function will remain intact. Basically, it's racy.

Ack, I've set .suppress_bind_attrs = true in the usxgmii driver but
forgot to add it here.

> Also, I'm not sure I approve of using the "select_pcs" suffix (I
> haven't spotted _where_ you use this, but returning EPROBE_DEFER to
> phylink's mac_select_pcs() method doesn't do anything to defer any
> probe, so that's an entirely misleading error code.

EPROBE_DEFER is handled when the function is called by mtk_add_mac()
during probe of the Ethernet driver -- which we do want to postpone
in case the PCS hasn't been probed yet as at this point that's the
best we can do without adding lots of intrastructure to dynamically
attach the PCS later on...

But true, later the function is being called by mac_select_pcs() and
what ever it returns is returned to the caller of mac_select_pcs().
If you think it's better to return ENODEV (or EAGAIN?) I can change
that -- from what I could tell, the only error which receives special
handling by phylink is -EOPNOTSUPP, everything else just gets passed-
through to the callers.

> If we are going to have device drivers for PCS, then we need to
> seriously think about how we look up PCS and return the phylink_pcs
> pointer - and also how we handle the PCS device going away. None of
> that should be coded into _any_ PCS driver.

I agree -- just wasn't up to design and implement all that at once.

