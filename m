Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D335FC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjRmVROgCVCrD68mnMllqSYMo0WntjWjA9LHp6o9oqA=; b=pgMeXnuAttZgC1x4IrpDB0/WzL
	+K2PJqJfNkEHr1/vzrVEbovjgh5IZRWBMJ7cuRRluWHIL0la67E7GP5FZkGtfcnxakm9Qfm+hZVyH
	7kybY8HCHPHNxC7NbxOjweLiJcziKeRwga0MxyoAQMf0NvBzovtd9AAVO2jCZMALoVkAfvG3GVVyg
	prmsmQPbC9jPJ75pQiuBMmma11AMN1i9ZPV6Y3AApZ+T4V5yj4rc5M5Fo9CBUVxPfMYSOQUntmMsJ
	vd6Z6tcKW/PbO4CqMHEeLjXMUOaFI6NgvE542Ch255RJRfQiAcLSXuVIS+JAld3Ub3gY7dpPoZc03
	/2qefo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o92PK-008duN-Et; Wed, 06 Jul 2022 10:37:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o92Em-008ScM-MV; Wed, 06 Jul 2022 10:26:30 +0000
Received: by mail-ej1-x62c.google.com with SMTP id q6so26232361eji.13;
        Wed, 06 Jul 2022 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SjRmVROgCVCrD68mnMllqSYMo0WntjWjA9LHp6o9oqA=;
        b=h452JCJnpG7zK1uEExxGDG1FY4Hi8dSeNLe1kHcxTsFX4KW+GQOfDktDGUWDlvzn8+
         KFs53/28jO+EcrGpZE/lAigEIpSL29aYT4vl2tVBb7tPgmNF9V5W/pCIoWRmtUvcXPRG
         AzgMPQNFOF8+m1TCzBV0ptAu/kpEFHUcEn6qSqTpPTU6kKwyaEIocypEW7TpULcEvDwe
         sHH4UjWMGX1/cTWXz7LwBKz+eLB2cUuEHqxjvyswRi3ARvO7SuscsBKrN2hwqIlHQPmg
         e3at6kDn8WVtg5QxYJGj+S1nlY70le1uFqmt5iMMOXQ/uSGq7v370lGVA8G6DBrqzcnn
         H4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SjRmVROgCVCrD68mnMllqSYMo0WntjWjA9LHp6o9oqA=;
        b=JQCegfbdt1qkbIZBT5Gl5SCpfVa97nFyly/UMMETG90NqnDZi9Nb7LVTqVPT3/84NQ
         gKICgI6Pa+vgUxpacLNYMCqmWT7FJ1hzM5xeSZ+b9tznfR5DuUwkT8fDlBQ5AFsZc/YS
         D/GBw94LNfitLp7j5FoTCtK/qhRyBrGfZL4sPtgp967BmWeJTuotc00ItnQkJQxx/azg
         N+ywF/2zr/0cZtkTSF3SzGBcMcimLzrWVsGOo0U5A0fAkyhKsFHSp3Wb4zhGgJxvGpNm
         rLK2RJAFXEy8666dTmZj54mFjeWl5trXH8uLB16nibZC0Oyv8uM59n/2GW1Dz8iGGjuQ
         POgQ==
X-Gm-Message-State: AJIora9DFCGgxftMH3PvMqx8DnRHq0hAqUwXNchSukfSq9Qk7VMuxY8S
	EBL3FYYLdQOyE5v2yLSQ2R8=
X-Google-Smtp-Source: AGRyM1uku0il88KlzBKlOIlDgPqYgrK6xuOSEqnGuVCo1KHCmKWAVPGNlq/47Q03sMFpOBjdzU1G9g==
X-Received: by 2002:a17:907:7e81:b0:726:2912:7467 with SMTP id qb1-20020a1709077e8100b0072629127467mr38178464ejc.373.1657103185019;
        Wed, 06 Jul 2022 03:26:25 -0700 (PDT)
Received: from skbuf ([188.26.185.61])
        by smtp.gmail.com with ESMTPSA id p4-20020a056402154400b0043a46f5fb82sm7370964edx.73.2022.07.06.03.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 03:26:23 -0700 (PDT)
Date: Wed, 6 Jul 2022 13:26:21 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH RFC net-next 5/5] net: dsa: always use phylink for CPU
 and DSA ports
Message-ID: <20220706102621.hfubvn3wa6wlw735@skbuf>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
 <E1o8fA7-0059aO-K8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1o8fA7-0059aO-K8@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_032628_804302_E85543FC 
X-CRM114-Status: GOOD (  19.03  )
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

Hello,

On Tue, Jul 05, 2022 at 10:48:07AM +0100, Russell King (Oracle) wrote:
> diff --git a/net/dsa/port.c b/net/dsa/port.c
> index 35b4e1f8dc05..34487e62eb03 100644
> --- a/net/dsa/port.c
> +++ b/net/dsa/port.c
> @@ -1525,6 +1525,7 @@ int dsa_port_phylink_create(struct dsa_port *dp)
>  {
>  	struct dsa_switch *ds = dp->ds;
>  	phy_interface_t mode, def_mode;
> +	struct device_node *phy_np;
>  	int err;
>  
>  	/* Presence of phylink_mac_link_state or phylink_mac_an_restart is
> @@ -1559,6 +1560,13 @@ int dsa_port_phylink_create(struct dsa_port *dp)
>  		return PTR_ERR(dp->pl);
>  	}
>  
> +	if (dp->type == DSA_PORT_TYPE_CPU || dp->type == DSA_PORT_TYPE_DSA) {
> +		phy_np = of_parse_phandle(dp->dn, "phy-handle", 0);
> +		of_node_put(phy_np);
> +		if (!phy_np)
> +			err = phylink_set_max_fixed_link(dp->pl);

Can we please limit phylink_set_max_link_speed() to just the CPU ports
where a fixed-link property is also missing, not just a phy-handle?
Although to be entirely correct, we can also have MLO_AN_INBAND, which
wouldn't be covered by these 2 checks and would still represent a valid
DT binding.

> +	}
> +
>  	return 0;
>  }
>  
> @@ -1663,20 +1671,14 @@ static int dsa_port_phylink_register(struct dsa_port *dp)
>  int dsa_port_link_register_of(struct dsa_port *dp)
>  {
>  	struct dsa_switch *ds = dp->ds;
> -	struct device_node *phy_np;
>  	int port = dp->index;
>  
>  	if (!ds->ops->adjust_link) {
> -		phy_np = of_parse_phandle(dp->dn, "phy-handle", 0);
> -		if (of_phy_is_fixed_link(dp->dn) || phy_np) {
> -			if (ds->ops->phylink_mac_link_down)
> -				ds->ops->phylink_mac_link_down(ds, port,
> -					MLO_AN_FIXED, PHY_INTERFACE_MODE_NA);
> -			of_node_put(phy_np);
> -			return dsa_port_phylink_register(dp);
> -		}
> -		of_node_put(phy_np);
> -		return 0;
> +		if (ds->ops->phylink_mac_link_down)
> +			ds->ops->phylink_mac_link_down(ds, port,
> +				MLO_AN_FIXED, PHY_INTERFACE_MODE_NA);

Can you please align these arguments to the open bracket?

> +
> +		return dsa_port_phylink_register(dp);
>  	}
>  
>  	dev_warn(ds->dev,
> -- 
> 2.30.2
> 

