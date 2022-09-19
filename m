Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F79EECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKIMbyBd6IxrYdJrLOS4dKO9Osny5oknx5qOjXOku6A=; b=FBNFvJ81ovIhnCy48Y8dIMy88+
	sgKIp/4uf7PIb2htTlumzwSCRkWJp00pLVILF7iPCfcM537uxVdgiVpHB6j8v4EIvkb4uys+kieyK
	OPt5DGRiUAiwNJH5OXUkXZ6iSYRAgwlPaoYnMEAIrIlv9m+z+sJd1oM9YwPmUQCQFkvht98CEJi2s
	sUELrMr/IURWKu/kzTtqHZJarPUzYlQhXahacSWO+NqX4pjv2ABsK0OEF/q2ZspS7RXN96CqfFOox
	hm2tecMk29SS/F8zLv0FJfbMMajpOXkh1A6SabZzYJshLoARCJ3QGUL4x/8jW99z6a8wQTXkh0G0j
	y+AA4ceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEn8-00BTyA-Fu; Mon, 19 Sep 2022 11:18:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEmx-00BTl9-2b; Mon, 19 Sep 2022 11:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YKIMbyBd6IxrYdJrLOS4dKO9Osny5oknx5qOjXOku6A=; b=PMlXkKi9U/nQtThWYCKYmdGKPk
	oD1BZJQEVOCRaQjFboOvk91o80FgT8rqXPr8sO7rmfBCw3uCcBvsHaskN6786FIsnCr2R9c2u5Us2
	8ox2jbAKJMq17DZ+ZZmPfzPc7E0c9JENCrk1426mWmdXHZd8FizZjBPEejvBGj6npzy+9BtNUw50X
	CWvvO1FPQ3OP8rK4DQvoGTXPBQHDLJv/3EWZaNt0LAVXduaTCuhIg/2TduauC8NZMfCI6FrMlHlHl
	9iIO3UR8NKo5VA8nTpeis0NLti4hROIxXzKwW0F+8RXXfme/MFA1bUY0ICE/biBWelDXzwzXqaloP
	gdiiOKHg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34398)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oaEkf-0000mu-1J; Mon, 19 Sep 2022 12:15:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oaEkZ-0006LY-JK; Mon, 19 Sep 2022 12:15:43 +0100
Date: Mon, 19 Sep 2022 12:15:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/5] net: mediatek: sgmii: set the speed
 according to the phy interface in AN
Message-ID: <YyhPX33PPbV/XyoY@shell.armlinux.org.uk>
References: <20220919083713.730512-1-lynxis@fe80.eu>
 <20220919083713.730512-5-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919083713.730512-5-lynxis@fe80.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_041811_154775_74F5BBC5 
X-CRM114-Status: GOOD (  11.23  )
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

On Mon, Sep 19, 2022 at 10:37:11AM +0200, Alexander Couzens wrote:
> The non auto-negotioting code path is setting the correct speed for the
> interface. Ensure auto-negotiation code path is doing it as well.

While I see the logic in doing this in the autoneg path, if you look
at mtk_pcs_config(), you'll notice that this code you're adding is
unreachable.

If interface is PHY_INTERFACE_MODE_2500BASEX, then we will call
mtk_pcs_setup_mode_force(). We only call mtk_pcs_setup_mode_an() for
the PHY_INTERFACE_MODE_SGMII case when in-band mode is selected, so
this can become:

	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
	val &= ~RG_PHY_SPEED_MASK;
	regmap_write(mpcs->regmap, mpcs->ana_rgc3, val);

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

