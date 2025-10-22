Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397BDCCD1AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Oct 2025 15:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v34jR6XfoNqMzn9lTfdNjb6BXo4wLlHzfL+v18pFZE=; b=wZxbtM36Ai//qvZTr7170Fn8dH
	jDd0oVSQVwSYI/d3795Ie/3vdvxVRuu3i3B5BVUSUGwD9FXY0dezNd68tZQr+HmilunXJYOhCk8cD
	yajYW3lao1Dp6Df2l8q0MN7TMGRENrhna4tX6NB+Cl3vP9+5AYYEKfSEKhtLAX+ia9W4DGONJEjOG
	9MKFMUQgC/SopyWIw5H8kNzaw0xJ9SEOCSrFR9mjfDbnGkBJXwOPad+FZZsmCN5sJ9/0DUbQbtODB
	Gz0BMB+2L0r5fqaHvHSUxC1+c1bIhiPO08gCtCRHUNoIzl7DQ7n8lQqzo4k6/WaZXYKp/iPOu1C8d
	K7AIRE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBb27-00000003Rd1-3Di2;
	Wed, 22 Oct 2025 15:45:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBb24-00000003Rcc-44y7;
	Wed, 22 Oct 2025 15:45:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6580460514;
	Wed, 22 Oct 2025 15:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A03C4CEE7;
	Wed, 22 Oct 2025 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761147948;
	bh=n/aPoNdQ21y4oZH7+SOnFwRgtsp0E1SRcb2RGzXobT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PnBG/HLxnp6OcHuQQ1ZU4ewu7ZJ9b2U19vQsoHAXaGoHjp6318QMBWVXhDMj/eI3B
	 L/IB0AcgbRdGkPnGYyDyJkgLWUVIyQ1lKl+v9T6oli5GzPcKAHV/vKowVbAtnhfReo
	 QYSqfCOZOxu4FqfbSDj6w4wDMsRW1KD8SlyPJTXIaeb+Oh6HEWryIwyFA4ENZIRpy0
	 nJuOUBZr1PGzHht5v9w5bzje/eoqa5lBKAfQ5SA/LcnmSmXeB0dHttu2qr1ZBNYLSw
	 d4Ap60ccVA1Vx9M3L6HjeRg8azju3RxowKVlreSs9mtWg4kBqqYSquRoyqb0LFloTQ
	 ontLbGDny9ukg==
Date: Wed, 22 Oct 2025 16:45:43 +0100
From: Simon Horman <horms@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH 2/2] net: airoha: add phylink support for GDM1
Message-ID: <aPj8J5ntvDGLPYaY@horms.kernel.org>
References: <20251021193315.2192359-1-ansuelsmth@gmail.com>
 <20251021193315.2192359-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021193315.2192359-3-ansuelsmth@gmail.com>
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

On Tue, Oct 21, 2025 at 09:33:12PM +0200, Christian Marangi wrote:

...

> +static int airoha_setup_phylink(struct net_device *netdev)
> +{
> +	struct airoha_gdm_port *port = netdev_priv(netdev);
> +	struct device *dev = &netdev->dev;
> +	phy_interface_t phy_mode;

Hi Christian,

phy_interface_t is an enum and thus may in practice be unsigned...

> +	struct phylink *phylink;
> +
> +	phy_mode = device_get_phy_mode(dev);
> +	if (phy_mode < 0) {

... if so, this condition will always be false.

I suspect the correct approach here is to change the type of phy_mode to int.

Flagged by Smatch.

> +		dev_err(dev, "incorrect phy-mode\n");
> +		return phy_mode;
> +	}
> +
> +	port->phylink_config.dev = dev;
> +	port->phylink_config.type = PHYLINK_NETDEV;
> +	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> +						MAC_10000FD;
> +
> +	__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> +		  port->phylink_config.supported_interfaces);
> +
> +	phylink = phylink_create(&port->phylink_config, dev_fwnode(dev),
> +				 phy_mode, &airoha_phylink_ops);
> +	if (IS_ERR(phylink))
> +		return PTR_ERR(phylink);
> +
> +	port->phylink = phylink;
> +
> +	return 0;
> +}
> +
>  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
>  				 struct device_node *np, int index)
>  {

...

-- 
pw-bot: cr

