Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E650CC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 04:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPl6U0GokDKYjf8mFtBabOMqth1qqIW6W4U8DQpUoFQ=; b=tgu9CKrwrw+jjH6BgJatPKVcb/
	GwZxuo/xdPS44GWD9xtRaHC0G39cbkam2S1zU2kftegdjh9kgF8QzWuJQzb8OhtaO5d40+BAgU1P9
	gOhs9X1DafiBtrDev2Uank0jfhdRo//4L5YGs8s6QkhmC89qvPN1jOnmTAjAOJyOFXqMDuf5N4dgT
	45U4tGchjsoZB1lodMaLHR7y3TtSQmsbFO24b9SxEaxVRLVw0Nagp/HrCL1qmVbVUmi+hLTa/YuAk
	5KQ7gYXYAnmwKgzt1l0l8M8lfxXhsL2gSi4p2U2lsYHLR7tTfMfklKWzRQ2nLcmdfUwqfY4oX2sEr
	G8Vx4RlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSP2-00EftR-01;
	Fri, 08 Dec 2023 04:23:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSOy-00EfrC-12
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Dec 2023 04:23:49 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so1895895e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 20:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702009424; x=1702614224; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPl6U0GokDKYjf8mFtBabOMqth1qqIW6W4U8DQpUoFQ=;
        b=nS2COlaq1hasfkPdBx0Qo7skhKddz7oEIzNmvke04B3PeGvZS5PPcviwttfXIjeNpR
         Ig0SbS9UsHhGzngC0mhRO0v84JB0VivW7i2iLRm/YbF9+rcd5rfpaUjTvi597rtztw3m
         ni7Uq6AWx8jNSgDPlqNBNmwq68xCzH1ncKceviYJ96WE7YGGFBNmpVWMUkJLWaVaUDXX
         xtHIcXudreBmIs5s+8Hc/efZDoPOqRqLXn/Ljiim9WBpApn70zyDZVwsDUI1zRuX0Ccv
         0UmlWg0MSd/QA3v5WXZNOES2y3gJQj3Rh5h5dCmU4amG/5it9Pjnhjsu2vjfoNkusQyb
         3ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702009424; x=1702614224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPl6U0GokDKYjf8mFtBabOMqth1qqIW6W4U8DQpUoFQ=;
        b=demx6I1nNIkpxeDI931P11EolEHnN9mB5xYt59Mkge/9JWszt0TfeKkcqjVMbYgXsE
         EobKa27MYj8s93reX5Er3aq9DR5OmniShZ5VPBlf3NwVF2eFxR8aEaj8eC5S7wKuZVVO
         y7aonvHhPV7rTfcYgmhIx3f/1JioaxXVRz4xJYKPxoWKCWz+I4yJvrfX1SpkRfAxG9w7
         Hza1xIimnlXUWJBNtJz3H1fS7zY/uT6MeJFYFNM7+jTsYYiq97TobAC7XioHlP0YIoCg
         WS5peZ9/XMFcItWBKkraQU6QIlLRPT9kkyLmrkUYFTfelQKm2gn0p2RG7GC+GJQSlvJ6
         i2Ow==
X-Gm-Message-State: AOJu0Yx8aUjXYPEK1aO/pBmQlyStklXtpsb9X+z6aHyxhTF9sEW8PDCG
	xb8+3bQHh0Iuml5WOt0u0fUJZg==
X-Google-Smtp-Source: AGHT+IGb8HNYcf4CwqR2mNQtwvE2sIxWS6ha8l/UWovNTRhq1viL+9jJuZvP6Uejra7pVJ3NHVKIxA==
X-Received: by 2002:a05:600c:4651:b0:40c:2518:687c with SMTP id n17-20020a05600c465100b0040c2518687cmr1507452wmo.61.1702009423621;
        Thu, 07 Dec 2023 20:23:43 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id gw18-20020a05600c851200b004063c9f68f2sm1470710wmb.26.2023.12.07.20.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 20:23:43 -0800 (PST)
Date: Fri, 8 Dec 2023 07:23:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <9b729dab-aebc-4c0c-a5e1-164845cd0948@suswa.mountain>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-8-arinc.unal@arinc9.com>
 <20231121185358.GA16629@kernel.org>
 <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
 <90fde560-054e-4188-b15c-df2e082d3e33@moroto.mountain>
 <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_202348_433546_F7F361D5 
X-CRM114-Status: GOOD (  15.34  )
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

On Thu, Dec 07, 2023 at 08:40:15PM +0200, Vladimir Oltean wrote:
> 
> We could be more pragmatic about this whole sparse false positive warning,
> and just move the "if" block which calls mt7530_setup_port5() right
> after the priv->p5_intf_sel assignments, instead of waiting to "break;"
> from the for_each_child_of_node() loop.
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
> 
> 		if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 || <---- here
> 		    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
> 			mt7530_setup_port5(ds, interface);

This doesn't solve the problem that Smatch doesn't know what the
original value of priv->p5_intf_sel.  And also I don't like this code
because now we call mt7530_setup_port5() on every iteration after
we find the first P5_INTF_SEL_PHY_P0.

> 	}
> 	of_node_put(mac_np);
> 	of_node_put(phy_node);
> 	break;
> }

Let's not worry too much about false positives.  We can just ignore
them.  There is always a trade off between false positives and false
negatives.  With GCC we try to get a clean run with no warnings, but
with Smatch I'm targetting the false positive ratio at "this is worth
reviewing one time."

regards,
dan carpenter


