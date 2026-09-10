Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25AAC79FB7
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 02:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7umdtFMYt4QzNXyY0z0IHE2wl7o8dhXEhulEfNUzqAM=; b=zXoakKkoTXCWgfeqUo/ZSHSxc3
	PBI46n0DwDiTU1bjyLmk9vN2f8sJGY6ZVpxGlXVo3bF6EbpF5TWOGWHHrfM5Y4+po1xUAziBDfO0y
	GXTaC4XXnvjv7gANaJS+vE1i2poF3+iuw8/edCMboolzB/bevMwDHUKkK9cULo0ReVxrm0dNBcdN+
	ZWktOyVpIDrzncrzUH3Gz3J0UvVENBc4MeLcDQDrXG622PUVC5N8djMlCaaaOAQkGe0lYLZdrkKx3
	ubrhmYJ3hzZOfycwUGS2QHZyY00hc8cpjRT9GRI4FTc+3yhdtpa955DCBKW9+yPLaVFNY6Xbi8sN3
	QxclLwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4U9E-0000000DE5f-0fJg;
	Thu, 10 Sep 2026 02:04:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4U9C-0000000DE5G-2weW;
	Thu, 10 Sep 2026 02:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7umdtFMYt4QzNXyY0z0IHE2wl7o8dhXEhulEfNUzqAM=; b=Gm+YMTLbMryJJ/p6W8PX6x7sHB
	nYfzB9SK1PIWLGIOEL/gqx8znaJLz8r35svH0ckGVEVQXKKEGL1j/RPK9HO97VOz6mZ/UzhUKAULL
	E6pwqsD9qZd/c9XyFZVVORu99rzlJgIxthtfpLWrIx9ZPW/pGuICpw6CD0tTmXK+SolmoZWBjkGGd
	rVmD8vlKlJkcxqbBoY5Qhwd+PEg685i9QxhavnxJLeKIlFtJCManZkpybFvBGjpYlb0dMa5EOqPlH
	jInZVBnae5yXq4Fq3MktnT7qDci7TvvLg+4if7hDSEv8XFijAtIkWqFOU7sGlRf9kFKAcFzdE+PCN
	z9s/zC3Q==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4U8g-00000001trN-0NU0;
	Thu, 10 Sep 2026 02:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7umdtFMYt4QzNXyY0z0IHE2wl7o8dhXEhulEfNUzqAM=; b=vj6WK+cbok/TUQYZrOVxfYfxuR
	hQLFsrOXPkfyzWMRvmxhISh6Fqdh53D4aZYMNtU/iyEx1SYFtLx4tUtK+ngJuTjxSSVpyIX4vQ9jN
	uVt2q7w7DvTFAKFOJbhOujBClJaZDAHFTgiTKuKD8oiG9e1rIrdMhWVXTTHGVcXRpcTc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x4U8F-004Pvj-3b; Thu, 10 Sep 2026 04:03:19 +0200
Date: Thu, 10 Sep 2026 04:03:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, dqfext@gmail.com,
	SkyLake.Huang@mediatek.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
Message-ID: <746ebc26-e4ad-4988-a839-c5805d7ab319@lunn.ch>
References: <20260909213250.3184238-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909213250.3184238-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_030355_569925_23901A83 
X-CRM114-Status: UNSURE (   8.36  )
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

> +	/* Clause 22 local data. */
> +	ret = phy_write(phydev, MII_CTRL1000, 0x1e00);

Please express this using

/* 1000BASE-T Control register */
#define ADVERTISE_1000FULL	0x0200  /* Advertise 1000BASE-T full duplex */
#define ADVERTISE_1000HALF	0x0100  /* Advertise 1000BASE-T half duplex */
#define CTL1000_PREFER_MASTER	0x0400  /* prefer to operate as master */
#define CTL1000_AS_MASTER	0x0800
#define CTL1000_ENABLE_MASTER	0x1000

Once we have symbolic names, it might be obvious what this is doing,
and if there is a better way to do it.


> +	/* Vendor profile disables 100/1000BASE-T EEE advertisement. */
> +	ret = phy_write_mmd(phydev, MDIO_MMD_AN, 0x003c, 0x0000);
> +	if (ret < 0)
> +		return ret;

Any idea why? Is EEE broken? If it is, phy_disable_eee().

    Andrew

