Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560ECC05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 22:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZSj7NkMSla+GkyCGF3UqN19IfprqFMOCBTdRtc6Qng=; b=X2AebwLtaYLCBtq8vX+zsCrfTA
	kFMqQLaAIKByHMaAvlU2ULlXPloB04UdVlbq82eJQM45zHRCPlzrm1epCvfowZPKyyDDae3SJoO1k
	qVUjqUMFMB4hcOlzBi8MUwSjjYS+R+TuynyxaAP30Y6FZb8p57ekSjgM2IJZCjt8WoX7FJtXLInyg
	AdaRINy08sKAmY/PT/HrbkVWEH27kHrkblFxg6iNiqOHWm+b1RvkHgxhhqr/aoGz5VMRbKmrG+ugO
	2LAwM3w5oLzRTtcuO7l9XKCxxkUoikWpKCKcPJKCZq9l4QzuQ1s65p0/6KS/49+CHLcKYmGzK1Bzj
	9KIHMr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO4dz-003u2P-1i; Fri, 03 Feb 2023 22:34:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO4Ow-003okl-QY; Fri, 03 Feb 2023 22:19:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso4915511wms.3;
        Fri, 03 Feb 2023 14:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZSj7NkMSla+GkyCGF3UqN19IfprqFMOCBTdRtc6Qng=;
        b=fGo45Gg3GJfhVsnqXzTT5/hvGSWrGt74oj+smXLIngwC5m5OMcubaqXfnMtWQQl6Cb
         B/XphNjWWIQ08bz9/Y2EuF9carLUvovnUdZHW8JN2gbfqohcz1fu+EECxDZfZzMXw0/I
         5cM1UwJXH19bzovsSP2P0/AaBp0YnyOwp4Brhwr/VNIbLWhCjWH55Hbjs6CHgmSL1Anv
         E5Js7/GotJJ/sIiaERCcPb4x/maWgsNjqqTxoO/KkPixhU0lH0ywSQQs1JQZhn2JlIAA
         MN05tNo30BFNog/4F3V4V1IzDugRVsJVVsYe/xsrE8KFWgT1H//l+Jd6HOhhx+tPp2wl
         tr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZSj7NkMSla+GkyCGF3UqN19IfprqFMOCBTdRtc6Qng=;
        b=zug5ra57DhhuyIyvgeRHU6dbdIEtY7h2v5gN9NewwMahHh62IR5yGux9Hpz1ALOYCF
         5xUQbsSn/IkMMmkKPKzysRxGwP9xfWheDCXkuDplsoHFl4mZ6H2vmalUSqFyYGtLhwPY
         oEZEfe/Oz74+g1ATBeWnzJkja3FBprmT+obZG5ooJnnu0jLutHNllO9FSCOv9z6izO13
         2Ad9Yi3u/OFFJnyCWOSa11YV4rlqFxQwpIuUEKxmZCLFl5361xubgmSMcKuFFPLnTOfS
         oHkcGs/F/Il7KZ7pHPCpUc+65C+fWzk+MY1ESihj7fpj3KZb0uyvelS7GNyP9JmmJTyH
         u0qw==
X-Gm-Message-State: AO0yUKX9m0jmxVq2ZCP/+53fV6LRfeWRNitJYVoasx0ojtonsSdXcshh
	74P+bioQCOK/NS7dyxOa7Dc=
X-Google-Smtp-Source: AK7set8BQK81yNRXXBNQtdT+Ovom+nfIfvLxSS3qd30v6e2UwtfU8OZSjopvJ1LJUnNGgo+ogaqN1Q==
X-Received: by 2002:a05:600c:3795:b0:3c6:e61e:ae71 with SMTP id o21-20020a05600c379500b003c6e61eae71mr12233725wmr.1.1675462758859;
        Fri, 03 Feb 2023 14:19:18 -0800 (PST)
Received: from skbuf ([188.26.57.116])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d690a000000b002bbedd60a9asm2935905wru.77.2023.02.03.14.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 14:19:18 -0800 (PST)
Date: Sat, 4 Feb 2023 00:19:15 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 9/9] net: dsa: mt7530: use external PCS driver
Message-ID: <20230203221915.tvg4rrjv5cnkshuf@skbuf>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <cover.1675407169.git.daniel@makrotopia.org>
 <677a5e37aab97a4f992d35c41329733c5f3082fb.1675407169.git.daniel@makrotopia.org>
 <677a5e37aab97a4f992d35c41329733c5f3082fb.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <677a5e37aab97a4f992d35c41329733c5f3082fb.1675407169.git.daniel@makrotopia.org>
 <677a5e37aab97a4f992d35c41329733c5f3082fb.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_141922_921373_3E242C53 
X-CRM114-Status: GOOD (  21.87  )
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

On Fri, Feb 03, 2023 at 07:06:53AM +0000, Daniel Golle wrote:
> @@ -2728,11 +2612,14 @@ mt753x_phylink_mac_select_pcs(struct dsa_switch *ds, int port,
>  
>  	switch (interface) {
>  	case PHY_INTERFACE_MODE_TRGMII:
> +		return &priv->pcs[port].pcs;
>  	case PHY_INTERFACE_MODE_SGMII:
>  	case PHY_INTERFACE_MODE_1000BASEX:
>  	case PHY_INTERFACE_MODE_2500BASEX:
> -		return &priv->pcs[port].pcs;
> +		if (!mt753x_is_mac_port(port))
> +			return ERR_PTR(-EINVAL);

What is the reason for returning ERR_PTR(-EINVAL) to mac_select_pcs()?

>  
> +		return priv->sgmii_pcs[port - 5];

How about putting the pcs pointer in struct mt7530_port?

>  	default:
>  		return NULL;
>  	}
> @@ -3088,8 +2934,6 @@ mt753x_setup(struct dsa_switch *ds)
>  		priv->pcs[i].pcs.ops = priv->info->pcs_ops;
>  		priv->pcs[i].priv = priv;
>  		priv->pcs[i].port = i;
> -		if (mt753x_is_mac_port(i))
> -			priv->pcs[i].pcs.poll = 1;
>  	}
>  
>  	ret = priv->info->sw_setup(ds);
> @@ -3104,6 +2948,15 @@ mt753x_setup(struct dsa_switch *ds)
>  	if (ret && priv->irq)
>  		mt7530_free_irq_common(priv);

You need to patch the previous code to "return ret".

>  
> +	if (priv->id == ID_MT7531)

if the code block below is multi-line (which it is), put braces here too

or can return early if priv->id != ID_MT7531, and this reduces the
indentation by one level.

> +		for (i = 0; i < 2; ++i) {

could also iterate over all ports and ignore those which have
!mt753x_is_mac_port(port)

> +			regmap = devm_regmap_init(ds->dev,
> +						  &mt7531_regmap_bus, priv,
> +						  &mt7531_pcs_config[i]);

can fail

> +			priv->sgmii_pcs[i] = mtk_pcs_create(ds->dev, regmap,
> +							    0x128, 0);

can fail

Don't forget to do error teardown which isn't leaky

0x128 comes from the old definition of MT7531_PHYA_CTRL_SIGNAL3(port),
so please keep a macro of some sorts to denote the offset of ana_rgc3
for MT7531, rather than just this obscure magic number.

> +		}
> +
>  	return ret;
>  }
>  
> @@ -3199,7 +3052,7 @@ static const struct mt753x_info mt753x_table[] = {
>  	},
>  	[ID_MT7531] = {
>  		.id = ID_MT7531,
> -		.pcs_ops = &mt7531_pcs_ops,
> +		.pcs_ops = &mt7530_pcs_ops,
>  		.sw_setup = mt7531_setup,
>  		.phy_read_c22 = mt7531_ind_c22_phy_read,
>  		.phy_write_c22 = mt7531_ind_c22_phy_write,
> @@ -3309,7 +3162,7 @@ static void
>  mt7530_remove(struct mdio_device *mdiodev)
>  {
>  	struct mt7530_priv *priv = dev_get_drvdata(&mdiodev->dev);
> -	int ret = 0;
> +	int ret = 0, i;
>  
>  	if (!priv)
>  		return;
> @@ -3328,6 +3181,11 @@ mt7530_remove(struct mdio_device *mdiodev)
>  		mt7530_free_irq(priv);
>  
>  	dsa_unregister_switch(priv->ds);
> +
> +	for (i = 0; i < 2; ++i)

There is no ++i in this driver and there are 11 i++, so please be
consistent with what exists.

> +		if (priv->sgmii_pcs[i])
> +			mtk_pcs_destroy(priv->sgmii_pcs[i]);
> +
>  	mutex_destroy(&priv->reg_mutex);
>  }
>  

