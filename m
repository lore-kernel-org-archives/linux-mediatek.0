Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6245BC636CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 21:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLYRWm36jDHyrJ/xX9LMtctKjSCkN3DC4rkS0zbuYQE=; b=r3FzdJ+bbDeuXc5obWSHUtcKig
	hbkrJIvI3VLNTaqRU7CQGqvoZkbHUfORIrtpsRK9WcbMzokHw2tBQD/PmO71RE3YnynIYM203O4iW
	xq1gf5vvWrtr/nQVb8OK2gNuAuVLunSDVYA13iMfd8C4Rf6QLQ2M1uHg0KvUB5CPZ1QC4nRgWGYkb
	bd3JrQUZ0K/sCammDMSyoz0BrFM8vD1+CigRSmnY/cSYXPxcQlIeuShL1AK4OQ8F/We4BphujP+au
	KFhiiUBfP4sel0537hhXx1gkDY+8wpkzcIFtudEqXKAiwfK0zV0v/8EFC6N2Hy3CK9afwWX0THdcP
	jflBYt9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO42o-003hxI-VK; Fri, 03 Feb 2023 21:56:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO42m-003hvK-Dl; Fri, 03 Feb 2023 21:56:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id n13so4863937wmr.4;
        Fri, 03 Feb 2023 13:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WLYRWm36jDHyrJ/xX9LMtctKjSCkN3DC4rkS0zbuYQE=;
        b=Qk+HYzdq+zR56sRUSNTwsQqSHz9Sav9H9gHScDEHhj1gdB2XTpsn0dq/KvP4gB9oIs
         UJ3gGIyW+rVWFBVaCSrBpaHjFswBgn8e8AioqGgp+zYzda9mXfphwms03d92QzmVe6qT
         0xQgE5RlpBGNVBGGGGJtAIsP1A4N6uw8PfswAdyhFCG3VzxnDXF1gQghV9+GJ1AMez9q
         WEhsAkVKNIFyUXD+EWKPaRdRVALD/ZgtfXUKNi3pK8o8zAjETmGo5+yyFz50CRpFWgJl
         PJgJnuEN+orNPxUQNAPKf9/zWsYrPh+iQ8Va8VMGHMLA7Gzd+rv959eH4WQuQLu7C/QO
         9JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLYRWm36jDHyrJ/xX9LMtctKjSCkN3DC4rkS0zbuYQE=;
        b=mm6BhOroyBiX3aro7GAGl1GP7X6aOzYkhuhqC7kJpWfLN6e5xJcP86z6oEK9i2Ek0j
         pxxDdpLjBdZN2gr+4EGHWFDKUQLjNXlWy2dK6ffFzXqi7DV9jfclthZFVQHbbHQ0SGq4
         hlOKywlmydcayViJxPFKFHBg2aUd9+MCoRiCDCLXoSDlvtl7hdFail5FE58Pj5umpPv+
         Zl7Nb/iTKf8jOO4wtLxqgGWw+NJ1VPnuKpK4ae6l8odpw9P7R11LZOTXg4pYZHrk/6WP
         svk7b6pAB0IxfAudBc8AnQqtQkjk+eKi28pyrzTOM572j5MbpcWnKWXhTFot1IM249ft
         sYIA==
X-Gm-Message-State: AO0yUKVM/9qXYFaDwRgNMLBmWifHYnZd9l83Ksb1/DjiU8j9cCoKIUb4
	ViTQ8qzL55jtMaUAZVOEPxE=
X-Google-Smtp-Source: AK7set8WbE4oVAMvAPbuXINI7wua/bASKG9onl4W65ZkN77tNd4gw8BIkIAl2J2XDFKgBRNuGMtbFg==
X-Received: by 2002:a05:600c:4f83:b0:3db:1a41:663a with SMTP id n3-20020a05600c4f8300b003db1a41663amr11248121wmq.20.1675461385802;
        Fri, 03 Feb 2023 13:56:25 -0800 (PST)
Received: from skbuf ([188.26.57.116])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c314900b003dfeea6a85csm1428578wmo.31.2023.02.03.13.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 13:56:25 -0800 (PST)
Date: Fri, 3 Feb 2023 23:56:22 +0200
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
Subject: Re: [PATCH 8/9] net: ethernet: mtk_eth_soc: switch to external PCS
 driver
Message-ID: <20230203215622.z6mzsu37dipwg2bd@skbuf>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <cover.1675407169.git.daniel@makrotopia.org>
 <3bac780184867e111c3a1567d8b55658abd931da.1675407169.git.daniel@makrotopia.org>
 <3bac780184867e111c3a1567d8b55658abd931da.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bac780184867e111c3a1567d8b55658abd931da.1675407169.git.daniel@makrotopia.org>
 <3bac780184867e111c3a1567d8b55658abd931da.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_135628_481579_45CB5B74 
X-CRM114-Status: GOOD (  12.91  )
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

On Fri, Feb 03, 2023 at 07:06:10AM +0000, Daniel Golle wrote:
>  int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_rgc3)
>  {
>  	struct device_node *np;
>  	int i;
> +	u32 flags;
> +	struct regmap *regmap;
>  
>  	for (i = 0; i < MTK_MAX_DEVS; i++) {
>  		np = of_parse_phandle(r, "mediatek,sgmiisys", i);
>  		if (!np)
>  			break;
>  
> -		ss->pcs[i].ana_rgc3 = ana_rgc3;
> -		ss->pcs[i].regmap = syscon_node_to_regmap(np);
> -
> -		ss->pcs[i].flags = 0;
> +		flags = 0;
>  		if (of_property_read_bool(np, "pn_swap"))
> -			ss->pcs[i].flags |= MTK_SGMII_FLAG_PN_SWAP;
> +			flags |= MTK_SGMII_FLAG_PN_SWAP;
>  
>  		of_node_put(np);
> -		if (IS_ERR(ss->pcs[i].regmap))
> -			return PTR_ERR(ss->pcs[i].regmap);
>  
> -		ss->pcs[i].pcs.ops = &mtk_pcs_ops;
> -		ss->pcs[i].pcs.poll = true;
> -		ss->pcs[i].interface = PHY_INTERFACE_MODE_NA;
> +		regmap = syscon_node_to_regmap(np);

Not supposed to use "np" after of_node_put().

> +		if (IS_ERR(regmap))
> +			return PTR_ERR(regmap);
> +
> +		ss->pcs[i] = mtk_pcs_create(ss->dev, regmap, ana_rgc3, flags);
>  	}

