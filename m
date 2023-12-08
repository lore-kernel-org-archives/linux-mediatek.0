Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18ECC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dr8lBkPk/gRBWTFsMFs5wXdj0/vhpvGhmgseUu0tAY=; b=Rmh/ZPDzSF9WSVvtMZ/cYl7dZq
	Bm3nUdVEXMH1Ao2R27qc4GeymhgtSQIgagUnvwTZy5giz7omf8I8k2xp22hSeCmcM83/Sazw6cUet
	tInIwZmZ+CE9q+44NkUDast0fuWWtB64JPIDdG1GJw02+plD1K1upnHzF5DmbFK6unB92xEhcMVYE
	irG6FXQDak5hs/bTb+F2pmBoXxEf/CcGdgq+N3aciYEwnCC5AKJDmRjcyMeomrb1X1LochC1rebVK
	iAqY4i5yUXReJNoODaYXVSZdxtt154wW6XBMcXFc7d+XNya3jUIJLjKsqwdDcSBHELqfkQ4GS+gwM
	YCB6Ytbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBfsM-00GKQx-0O;
	Fri, 08 Dec 2023 18:47:02 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBfsJ-00GKQR-0x;
	Fri, 08 Dec 2023 18:47:00 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a1c8512349dso318919866b.2;
        Fri, 08 Dec 2023 10:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702061216; x=1702666016; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+dr8lBkPk/gRBWTFsMFs5wXdj0/vhpvGhmgseUu0tAY=;
        b=b8DY8RbraOoSQXKGH4ji9GG0sCz0PeFHh4wHmmfE5TANDudk4OQLKwiUZjSwgMCRq8
         59sfZXNJaO9uiHPNey0vRNZB0aVKISnoLsumiLXeMTX7cyx20aqdayb+/eGuIeaD11bN
         wHpx6GLB83sk36KbN0I0mqCYVD4tvu5EgxiQ416w8/eMQKTwxZcYcs4thAoe4llADUWe
         2UrzHpwqOs9yuU9KkFBHEWHv2VJXAUqUk8rJszpNsyW/GUSJxdRmyV74dKMboYXWVHAz
         eYqFqrX+ngc0tkoahee1WsigVJiWSOxoBpVsLQG/BZBJWal3o+RfS3INnX84tW9pURA0
         lOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702061216; x=1702666016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dr8lBkPk/gRBWTFsMFs5wXdj0/vhpvGhmgseUu0tAY=;
        b=fXQzUf5x5a+49su+f42VzfVwu9KZ7ddFtgHQwH6Sb4gyTkwQDQobxnDINFLV2FcQzt
         RiFRkyw3yC45Zx/VJFP3NuZR7+zNypBAO7dWgxW88+iVfoUIQCUbFX2FG+FnarkkC8jp
         49VobQpiBAHDjMPeg5iKfWZXx53OBKT3X3BlH79HXXI/IfiVmOA0332fCpcSURAsIs7w
         HQ7/9IwlhZ/A7MtXyHuhmPvnjUTegshUrnWDLpBanyh0Uox2NEPlT7+R46ho2AArdySM
         hFwx2KuKCEtTJgC5s2gVSZxgtsD7KUFHIPqtjFO2YTxGzvhb9Y3WDdXOtDObWZqMrfrs
         kexA==
X-Gm-Message-State: AOJu0Ywi5Xsk8aqdaK9y4CEirUlC4BfYG7MiwfRtLRFww2nSo2/xMa7R
	IiiVnOThGc3AoT0wl3xxQ10=
X-Google-Smtp-Source: AGHT+IFqVjj8BiPjTfdPUSjvMIkmUsDvvm2h6RNnCjnqfatSpcv/EcTXmwiu33Eu6zdyUdHxlBmCSA==
X-Received: by 2002:a17:907:94d5:b0:9b8:b683:5837 with SMTP id dn21-20020a17090794d500b009b8b6835837mr301541ejc.46.1702061215767;
        Fri, 08 Dec 2023 10:46:55 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id d11-20020a170907272b00b00a1e2aa3d094sm1317479ejl.173.2023.12.08.10.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:46:55 -0800 (PST)
Date: Fri, 8 Dec 2023 20:46:52 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <20231208184652.k2max4kf7r3fgksg@skbuf>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-8-arinc.unal@arinc9.com>
 <20231121185358.GA16629@kernel.org>
 <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
 <90fde560-054e-4188-b15c-df2e082d3e33@moroto.mountain>
 <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
 <9b729dab-aebc-4c0c-a5e1-164845cd0948@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b729dab-aebc-4c0c-a5e1-164845cd0948@suswa.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_104659_360562_7B39F62F 
X-CRM114-Status: GOOD (  20.30  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 08, 2023 at 07:23:38AM +0300, Dan Carpenter wrote:
> On Thu, Dec 07, 2023 at 08:40:15PM +0200, Vladimir Oltean wrote:
> > 
> > We could be more pragmatic about this whole sparse false positive warning,
> > and just move the "if" block which calls mt7530_setup_port5() right
> > after the priv->p5_intf_sel assignments, instead of waiting to "break;"
> > from the for_each_child_of_node() loop.
> > 
> > for_each_child_of_node(dn, mac_np) {
> > 	if (!of_device_is_compatible(mac_np,
> > 				     "mediatek,eth-mac"))
> > 		continue;
> > 
> > 	ret = of_property_read_u32(mac_np, "reg", &id);
> > 	if (ret < 0 || id != 1)
> > 		continue;
> > 
> > 	phy_node = of_parse_phandle(mac_np, "phy-handle", 0);
> > 	if (!phy_node)
> > 		continue;
> > 
> > 	if (phy_node->parent == priv->dev->of_node->parent) {
> > 		ret = of_get_phy_mode(mac_np, &interface);
> > 		if (ret && ret != -ENODEV) {
> > 			of_node_put(mac_np);
> > 			of_node_put(phy_node);
> > 			return ret;
> > 		}
> > 		id = of_mdio_parse_addr(ds->dev, phy_node);
> > 		if (id == 0)
> > 			priv->p5_intf_sel = P5_INTF_SEL_PHY_P0;
> > 		if (id == 4)
> > 			priv->p5_intf_sel = P5_INTF_SEL_PHY_P4;
> > 
> > 		if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 || <---- here
> > 		    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
> > 			mt7530_setup_port5(ds, interface);
> 
> This doesn't solve the problem that Smatch doesn't know what the
> original value of priv->p5_intf_sel.  And also I don't like this code
> because now we call mt7530_setup_port5() on every iteration after
> we find the first P5_INTF_SEL_PHY_P0.

You seem to have not parsed the "break" from 4 lines below. There is at
most one iteration through for_each_child_of_node().

And why would the "original" value of priv->p5_intf_sel matter? Original
or modified by the "if (id == 0)" and "if (id == 4)" blocks, the code
has already executed the of_get_phy_mode(&interface) call, by the time
we reach the "if" that calls mt7530_setup_port5().

Hmm, maybe the problem, all along, was that we let the -ENODEV return
code from of_get_phy_mode() pass through? "interface" will really be
uninitialized in that case. It's not a false positive.

Instead of:

	ret = of_get_phy_mode(mac_np, &interface);
	if (ret && ret != -ENODEV) {
		...
		return ret;
	}

it should have been like this, to not complain:

	ret = of_get_phy_mode(mac_np, &interface);
	if (ret) {
		...
		return ret;
	}

> > 	}
> > 	of_node_put(mac_np);
> > 	of_node_put(phy_node);
> > 	break;
> > }

