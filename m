Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A67C636CC
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Feb 2023 12:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAAmRt3jcfod+Fg8h7tuu5DlJvKnp6xC/dkRDO8nz/M=; b=eYgYF19FzIsFfv8lOkPcodSF8U
	oZ4iKiczqwRGIxb475SLvNYcGiiY/NiY3xHFi10dtZrbfhx52wA9KWmRq/33mgmxzGPJyf7rv6FKb
	JuF7wTsiv0QiCxW+Ttf7Ks3223TPks1nT6z7GAbSWSj9zUIU/g6B+rQREzQXfERCnnpgj+rffA7/N
	3rffFNMouZbUgFoiazI4MztsoD2xaWB6MZTnVswiNgUE5kPE5cedzbKcS0hH4Nq+GIk32FD6z3FO/
	UjE4UKnm3QtujRjxudj2lTA+MwtYGkFh+aQmRjL6EEHz4qe839Gkiymurq8GQBSgW5ustBoyW2neM
	hzu9/hBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOdtr-006JyE-9G; Sun, 05 Feb 2023 12:13:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOdto-006JwU-Os; Sun, 05 Feb 2023 12:13:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso8947202wms.5;
        Sun, 05 Feb 2023 04:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kAAmRt3jcfod+Fg8h7tuu5DlJvKnp6xC/dkRDO8nz/M=;
        b=I742z+RfnbvkgojmdXHbNkCvUNyrzvuV8qFacugqAkmBnWyXxul8+MCM/G+0cUnXAp
         ShRg9Z0RJH1C1oqVCEJIXGRt6/ha1KkKCcqKqQD5B/Z+4SazsCHBUq6OHHiMgN7nr/ZZ
         fBmTHSaofkSRnuDNo/6y5Y3BDskFPBtu5R5dzlj0ke7ZECG1L3KyL+kGgelGv/gXTWWU
         C/xsPbrGwjX72WfFzEkCFgSlivkWysoeF0TsiW66mkq/9meYv1EXPfffMoRpA4yFkRAf
         tNoxkT5tjbCeiDA61zl48eMvxjpJ/2RU+OvGmO/oC6h9zHCinwlZVbvpBJCgyR/R++nf
         uCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAAmRt3jcfod+Fg8h7tuu5DlJvKnp6xC/dkRDO8nz/M=;
        b=gnh4h+8HG/B/OzKFYDJAW4ziWnpbPh1R8eA7Z3lQNj2Zjf7WOjVJbCXdnGX2u0+IBR
         WsX5vPiM8enOz1h/m2pOea9XswuQZg24+t0GOTre792NaYEPVp3AgOnNW76AFhZcu5QM
         2zepU9YFxxa4wiaIKYJp5UkCaE4d9ohythucviaoiNnkcd4dJ4s54kDaVm/5Ne4iV9nE
         glVltlVVhwc39SSLgmxrU0dG/t+Ngyg+bd8T4ANFWHwPRVvmMd9vJDeKa0i1eZCbDqdK
         YJrUK6sDrEqUM4qpmyULoHSvGfGdwu190i0ogr+cgs/Eev8S8tiiZnfsVGenK2zRw3s8
         UnVQ==
X-Gm-Message-State: AO0yUKURXN5XxkD9p/V1gKPJWhMQm5bbXhHpmvwd1pqB2ORRpQ941hcT
	AcMQ3PmhLzx/WAlUbT4eFRE=
X-Google-Smtp-Source: AK7set9bkIfJteTm9JoUtPZPOtkDJ5gNgWAED7jQCuTbU8Em/dyiZifnw4V+m+TvJbbNc/fKEoAiaw==
X-Received: by 2002:a05:600c:2286:b0:3df:fbc7:5b10 with SMTP id 6-20020a05600c228600b003dffbc75b10mr1668757wmf.0.1675599207357;
        Sun, 05 Feb 2023 04:13:27 -0800 (PST)
Received: from skbuf ([188.26.185.183])
        by smtp.gmail.com with ESMTPSA id hg15-20020a05600c538f00b003df7b40f99fsm10949027wmb.11.2023.02.05.04.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 04:13:26 -0800 (PST)
Date: Sun, 5 Feb 2023 14:13:24 +0200
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
Message-ID: <20230205121324.a7ah2upjpzij5rsc@skbuf>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <cover.1675407169.git.daniel@makrotopia.org>
 <677a5e37aab97a4f992d35c41329733c5f3082fb.1675407169.git.daniel@makrotopia.org>
 <677a5e37aab97a4f992d35c41329733c5f3082fb.1675407169.git.daniel@makrotopia.org>
 <20230203221915.tvg4rrjv5cnkshuf@skbuf>
 <Y95zaIJbCj3QIdqC@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y95zaIJbCj3QIdqC@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_041336_835536_61CC8A23 
X-CRM114-Status: GOOD (  32.35  )
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

On Sat, Feb 04, 2023 at 03:02:00PM +0000, Daniel Golle wrote:
> Hi Vladimir,
> 
> thank you for the review!
> 
> On Sat, Feb 04, 2023 at 12:19:15AM +0200, Vladimir Oltean wrote:
> > On Fri, Feb 03, 2023 at 07:06:53AM +0000, Daniel Golle wrote:
> > > @@ -2728,11 +2612,14 @@ mt753x_phylink_mac_select_pcs(struct dsa_switch *ds, int port,
> > >  
> > >  	switch (interface) {
> > >  	case PHY_INTERFACE_MODE_TRGMII:
> > > +		return &priv->pcs[port].pcs;
> > >  	case PHY_INTERFACE_MODE_SGMII:
> > >  	case PHY_INTERFACE_MODE_1000BASEX:
> > >  	case PHY_INTERFACE_MODE_2500BASEX:
> > > -		return &priv->pcs[port].pcs;
> > > +		if (!mt753x_is_mac_port(port))
> > > +			return ERR_PTR(-EINVAL);
> > 
> > What is the reason for returning ERR_PTR(-EINVAL) to mac_select_pcs()?
> 
> The SerDes PCS units are only available for port 5 and 6. The code
> should make sure that the corresponding interface modes are only used
> on these two ports, so a BUG_ON(!mt753x_is_mac_port(port)) would also
> do the trick, I guess. However, as dsa_port_phylink_mac_select_pcs may
> also return ERR_PTR(-EOPNOTSUPP), returning ERR_PTR(-EINVAL) felt like
> the right thing to do in that case.
> Are you suggesting to use BUG_ON() instead or rather return
> ERR_PTR(-EOPNOTSUPP)?

I was not suggesting anything, I was just asking why the inconsistency
exists between the handling of SERDES protocols on ports != 5 or 6
(return ERR_PTR(-EINVAL)), and the handling of unknown PHY modes
(return NULL). If you don't want to convey any special message, then
returning NULL to phylink should be sufficient to say there is no PCS.
The driver already ensures that phylink validation fails with wrong PHY
mode on wrong port due to the way in which it populates supported_interfaces
in mt7531_mac_port_get_caps().

Also, no BUG_ON() for the reasons Andrew pointed out.

> > > +		return priv->sgmii_pcs[port - 5];
> > 
> > How about putting the pcs pointer in struct mt7530_port?
> 
> There are only two SerDes units available, only for port 5 and port 6.
> Hence I wouldn't want to allocate additional unused sizeof(void*) for
> ports 0 to 4.

I asked the question fully knowing that there will be no more than 2
ports with a non-NULL PCS pointer. There's a time and place for
(premature) optimizations, but I don't think that the control path of a
switch is one particular place that comes at the top. Between
priv->ports[port].sgmii_pcs and priv->sgmii_pcs[port - 5], my personal
sensibilities for simple and maintainable code would always choose the
former. However I'm not going to cling onto this. Whichever way you prefer.

> > > +	for (i = 0; i < 2; ++i)
> > 
> > There is no ++i in this driver and there are 11 i++, so please be
> > consistent with what exists.
> 
> As most likely in all cases a pre-increment is sufficient and less
> resource consuming than a post-increment operation we should consider
> switching them all to ++i instead of i++.
> I will anyway use i++ in v2 for now.

And what would you suggest is the difference in the compiled code between
"for (i = 0; i < n; i++)" and "for (i = 0; i < n; ++i)"?

