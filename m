Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A435D6B6DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2024 21:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eaav/kHiULYtRFO7qGHqUzM2GyuXCQUp8En/mARPwCQ=; b=a9cc4KrfufKSAPR/krE8ite342
	T5m79OdpWkhOjDdiwxUUtZ2SvKzaB0DJ/eWhk+v+HqY7yPfcnPYZmdiLh5skZ1zlWOXGLrAcdHdIQ
	HABUX1m1Nx3OENDkiZESbH+zjcsE8HIfxJAdYZpudjXwYJq7wtgS8WbQYU/9rtygCT3Qx63lN7oCM
	QEg0AXGgRQQ5ZYEk6CUjbHOhCMPM/Y402SnBN3WFozXv4hqTdoVOfZWDYrCHqjk0KUS+naG6Aayh4
	Kh7k3HsXXHJ6ZXXMK4rh3SyIjZxON13QtKw9uYdeliLi4ewgO8hTKeAkokImyAo+BX2XNW6ZVDab4
	thLrseyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6GYW-00000001vSh-0Fki;
	Wed, 30 Oct 2024 21:48:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6GWq-00000001v5j-2b2g;
	Wed, 30 Oct 2024 21:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Eaav/kHiULYtRFO7qGHqUzM2GyuXCQUp8En/mARPwCQ=; b=EKYDfn3Vh58p9C5n1lAe40Lvqf
	ucFYM5n2r+44VJfBuIUPFlcpOTPfwsyXCjnQX9eaegFSdB4v4LkAe5m1ur3BuhS9bT5jjp3qf0Ffk
	kpaQjznr4/fcD0MP0DPukyvCULZA2pTqtP9rT+KPXq9goFjH8pZaBjua6XOujBirCyjE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t6GWd-00BjVC-67; Wed, 30 Oct 2024 22:46:47 +0100
Date: Wed, 30 Oct 2024 22:46:47 +0100
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
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next 2/5] net: phy: mediatek: Move LED helper
 functions into mtk phy lib
Message-ID: <7cb014a6-ec64-4482-b85c-44f29760d186@lunn.ch>
References: <20241030103554.29218-1-SkyLake.Huang@mediatek.com>
 <20241030103554.29218-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030103554.29218-3-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_144700_676892_63889064 
X-CRM114-Status: GOOD (  11.08  )
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

> +void mtk_phy_leds_state_init(struct phy_device *phydev)
> +{
> +	int i;
> +
> +	for (i = 0; i < 2; ++i)
> +		phydev->drv->led_hw_control_get(phydev, i, NULL);
> +}

This does appear to be the same as what it is replacing, but it also
seems odd.

Why is an init function doing a get? I assume it is to do with setting
priv->led_state? But led_state is not used in setting *rules, which is
what led_hw_control_get() is all about. So maybe in a follow up patch,
move the actual init code out of led_hw_control_get()?

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

