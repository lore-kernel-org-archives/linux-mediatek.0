Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FC7C001DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmBybq/PLCY6PDdTWfelJ8wonDUCgtyNRFP2V85KFN0=; b=lBqM5gZHZ3qN+qosVKts9KVV7R
	ownsmxJWg5SJ1Qm4pFrpxLn6wxsf0RhX96OtThHaqLooV/dUiRAYph4ARBgOCGEe6/v5W5PwS62fy
	PQS+mYWmtNCF25rrpZYWvZvbSe/6jcrmTDbXkTne+mxvNFz/7EXWh19KeC8UemL1hRcK3ZOPxgQkx
	3zxsXMh8bEaW+aVSNUIeMeu+4Hfdl9DzCHfP/AztLj2QVctpc8NhiURHudZkdXFVM/ENPFzpfocZx
	HTO57LcA70EThQ/Z5T0YwienjgmxGfSSPj2CwKnRCgYYdd9pmPFxFxTcR1AYV5upMAe6GIVjZFHvJ
	EcE+4FbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVEVH-00FUK8-2G;
	Sun, 13 Aug 2023 17:03:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVEVE-00FUJ0-2z;
	Sun, 13 Aug 2023 17:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WmBybq/PLCY6PDdTWfelJ8wonDUCgtyNRFP2V85KFN0=; b=eYpaQEBmAmBQZDi1I2sNEOXpLI
	WqQQXXjTLhi63xFCG3Eg2ELzVwU6rVnVDIabnn91BfnSfhhYEdmOHpTbEFOqXVL3AgvEfhGv5HQZW
	vt7IPUJSz2EbKRqmt8CIuurJxDM9E7RURfw0ajuVGt/90hTVVrvBOxcNP1dz9K7NRFuc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qVEUr-003yrz-DY; Sun, 13 Aug 2023 19:03:21 +0200
Date: Sun, 13 Aug 2023 19:03:21 +0200
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
Subject: Re: [PATCH net-next v2] net: phy: mediatek-ge-soc: support PHY LEDs
Message-ID: <9bae16cd-501e-4fe5-9736-d32d958aec7c@lunn.ch>
References: <32e534441225c62e3bf9384b797d9beda7475053.1691943605.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32e534441225c62e3bf9384b797d9beda7475053.1691943605.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_100344_970019_128C9B6F 
X-CRM114-Status: UNSURE (   8.99  )
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

Hi Daniel

> This requires syscon phandle 'mediatek,pio' present in parenting MDIO bus
> which should point to the syscon holding the boottrap register.

If i'm reading the code correct, if this property is missing, the PHY
will fail to probe? Since this was never a mandatory property, it
looks like this will break old DT blobs?

If there are LED properties, then it should be mandatory, otherwise it
should be optional. That way you keep backwards compatibility with old
blobs.

	Andrew

