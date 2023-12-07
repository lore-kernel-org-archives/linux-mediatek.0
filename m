Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E711C46CA0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 06:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P021h3HtosWIlf7YJKZvwxMCdUSfZ2ZSmafpEm4qnvY=; b=RtWjLM6mswgoW2pJdzklINxPH+
	PSKtuHeRhLCVJCOME++GcfZB8jEUagiWTKoA28p1knITqgbJK4dAng8K9F+X9KDzCgP0j3bBggP4i
	hJU53scdoa82oCCLw3REPKyctqJWizdOqrCiymymY+2s/Ej6erKwsJEDtZc9DqFFgpSscLimq6Jr1
	qG0oMuVEr0C855rr9lQp+n4WeEcHeGty0VENBc64Qq5QMN9K8s0+EJDGlYswXYrEFk1hKCWKR60i2
	swF8SUqVqTioVfcm3dADjnWfDa4MPZCMturZA3GvmUinjUG/ts72cUYS/qSNjtxdw2vpE+HXQ7Shq
	lR3huWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB8EB-00C1rE-39;
	Thu, 07 Dec 2023 06:51:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB8E9-00C1pb-17
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 06:51:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so956835e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Dec 2023 22:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701931873; x=1702536673; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P021h3HtosWIlf7YJKZvwxMCdUSfZ2ZSmafpEm4qnvY=;
        b=aoM3V2h+e78xP/Bqj3+84cnCvUQOtRp2LMw8uuZ2w0c7fwL7269xFTQWIdYjgh7Rmk
         UDIFee8T+dBR5fGxUfKrhAYOxn135F/asoLNgO0VVC+WEfYd2ZvENLDeKeLN2RLgarDg
         1muck3hcz5WwcvMHuDwf5OcCFi2JNFms65ZyYe1Pw8Ypmo2dKGLC4X3GYNJHguvWt49F
         GKAeOt7aHU/lRKEpgtevLUJHBugYTXkaBw6yKdifHqXl3BsprArfsD/V9iwEp0sDNUbs
         jBEAr8bAdvBsWFEj545ZK4Av6lbI9l4eCNtg77NPXwG1LSayT1LoPEF6seMgm9B3GN9u
         qOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701931873; x=1702536673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P021h3HtosWIlf7YJKZvwxMCdUSfZ2ZSmafpEm4qnvY=;
        b=QVlPS/DGtsDq0LhK/oM83yBZM3lJsavioRejK0K5VoO/JzpafcJSs0VgfOZ5rAwC36
         1hz5NJTI9p1lSqwaugY0/N7jmwngvoOPFrEx8RG8ya3TlZbTN1HF3FsbZ71u4z40gQiB
         IB6945szMGygVBI/TeajxzeWmcxVqVI/OfHHINXCwNQIMsZHsyxGgxZJJVacaLO5+Os/
         /AUo4EEVglXRr1gTxUEg54GmlWwyTn5cqVT+05Z2Npqwk6XuLAmpQVf3UDqzjUu5xvwT
         6EHVZTu1KKz0I5b4slQcVEDsnKQMkvfMj5Z6QabGla1QBsXXwJhjR6U7xvgS18znUA4u
         2u9A==
X-Gm-Message-State: AOJu0YwaMV3/05OmG2xLzynpg07cY0loowNfTBo2ccn8x5Gp0ZbmbN2o
	K6Tti1xQyCpsq3d2tpsrHv8l1g==
X-Google-Smtp-Source: AGHT+IFhsEzLwvQ1xEOGNTKHZpCXxRYgK+1SXpQhMJn2ZA471m64pWH+rUiU1rMJx9WFhAf1qzAyhw==
X-Received: by 2002:a05:600c:3381:b0:40b:5f03:b3f6 with SMTP id o1-20020a05600c338100b0040b5f03b3f6mr670880wmp.280.1701931873077;
        Wed, 06 Dec 2023 22:51:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l7-20020a1c7907000000b0040b4562ee20sm450698wme.0.2023.12.06.22.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 22:51:12 -0800 (PST)
Date: Thu, 7 Dec 2023 09:51:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <90fde560-054e-4188-b15c-df2e082d3e33@moroto.mountain>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-8-arinc.unal@arinc9.com>
 <20231121185358.GA16629@kernel.org>
 <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_225117_408587_EFEA77EC 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Simon Horman <horms@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Dec 02, 2023 at 11:45:42AM +0300, Arınç ÜNAL wrote:
> 
> I'm not sure why it doesn't catch that for mt7530_setup_port5() to run
> here, priv->p5_intf_sel must be either P5_INTF_SEL_PHY_P0 or
> P5_INTF_SEL_PHY_P4. And for that to happen, the interface variable will be
> initialised.
> 
> for_each_child_of_node(dn, mac_np) {
> 	if (!of_device_is_compatible(mac_np,
> 				     "mediatek,eth-mac"))
> 		continue;
> 
> 	ret = of_property_read_u32(mac_np, "reg", &id);
> 	if (ret < 0 || id != 1)
> 		continue;
> 
> 	phy_node = of_parse_phandle(mac_np, "phy-handle", 0);
> 	if (!phy_node)
> 		continue;
> 
> 	if (phy_node->parent == priv->dev->of_node->parent) {
> 		ret = of_get_phy_mode(mac_np, &interface);
> 		if (ret && ret != -ENODEV) {
> 			of_node_put(mac_np);
> 			of_node_put(phy_node);
> 			return ret;
> 		}
> 		id = of_mdio_parse_addr(ds->dev, phy_node);
> 		if (id == 0)
> 			priv->p5_intf_sel = P5_INTF_SEL_PHY_P0;
> 		if (id == 4)
> 			priv->p5_intf_sel = P5_INTF_SEL_PHY_P4;
> 	}
> 	of_node_put(mac_np);
> 	of_node_put(phy_node);
> 	break;
> }
> 
> if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 ||
>     priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
> 	mt7530_setup_port5(ds, interface);

Smatch doesn't know:
1) What the value of priv->p5_intf_sel is going into this function
2) We enter the for_each_child_of_node() loop
3) That if (phy_node->parent == priv->dev->of_node->parent) { is
   definitely true for one element on the list.

Looking at how Smatch parses this code, I could probably improve problem
#1 a bit.  Right now Smatch sees "struct mt7530_priv *priv = ds->priv;"
and "priv->p5_intf_sel" is unknown, but I could probably improve it to
where it says that it's in the 1-3 range.  But that doesn't help here
and it doesn't address problems 2 and 3.

It's a hard problem.

regards,
dan carpenter


