Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6BFC4707C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chfl3tr8q5G3BktBajbTAtXlZfOgVnnzo/7m67rMfKU=; b=0G+kvZZdY1x84cztmL4hXMkrXv
	cl8/MKbylH2eY3oaQGsfzR0+Dx67cIAagWnJY9igxFP1UzXE+uEsHvZC4A4ZZjbZrYS/k4RbDEeTR
	QlF9UhxA01xnJeh0kiIJxw9nYD05/Z7PnD2voHx31ApzdEwdxt94mkcKwJSBvYMWoJ7Kig2fsrNLU
	xAJwL9qK9/XH0FQ8HU5lcq1k4SVHOd8c3/KyswwWLuAiQgJpc+rMxtaZ45JrsNDoajzOFWfZjxIKF
	/caTfsdbI0cYi/+sYVWw99s+xrwY8qpJeKhCLfvGrBoq+ZAp1HIbQOen7RUoPFM+vOzlOF25PzhVM
	WTDpUkPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZYK-00CJmb-0P;
	Wed, 10 Jan 2024 14:27:32 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZYF-00CJlJ-1h;
	Wed, 10 Jan 2024 14:27:29 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-55590da560dso5213693a12.0;
        Wed, 10 Jan 2024 06:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704896845; x=1705501645; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=chfl3tr8q5G3BktBajbTAtXlZfOgVnnzo/7m67rMfKU=;
        b=TpWKLIpqrDOrECqUbpdUrku8O0t59fzhLWC5nyb+thHQ879e5WTYJx/CgWupYU4uSN
         wXcPoH1Cq5fnjCFjKwDZxyR6PqPojyQPK/iIDhbBzzZL3GvOvybuv3DVz2t3JRcHhCMv
         /f26Sq/bXF6+rr33NQACpGJenDSwJCoQ63SXMVESUF8jJRtN+IKe3iOA0CiPUpEHhzSz
         kG53BhZbZoBE2YgKQM6vS8ebHwQlDRRJe+1WVzC8x7kKCHWY0HGCCp1lYz3wYmwu0/J8
         qOrgUMeLb9ecr8xZfi3EqsHtquDxMu5yWOamrVjwoOfALxA2owksm2Hl/vypOoo+mZRK
         aZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704896845; x=1705501645;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chfl3tr8q5G3BktBajbTAtXlZfOgVnnzo/7m67rMfKU=;
        b=lVfkludacOmRZ2JvC5YHV/QjrolWvaeoWwanQXu0yo0tOz7+ZuykVvos+WQsoOqj+o
         SLPJevN1XfNUAHZygR3XiwbxD14COXXgME5M0MlKGpNx+/Nakt93di2c4MeuHGh+eRRN
         G2AU2XARQvcAE1k8rkgW6SsIXkdVo/Sxqrc8r3J9Ze06+vepWaMhsKut6QZVYtBy+rB9
         /9U5czKQ+sN+OyKcKWw8is4LHsCxCTeMuJio3BN4OT1jHY6ZU8xuF0o6Jzz8F5wN3hzr
         i+AReeYUpmFUfpJsweSwLyiiWy7ZkiveLttOwWZY7zZjLCNIq61rAOJO+NtI8/pI24GR
         S1hA==
X-Gm-Message-State: AOJu0YwOXizJV0EfhjYhidNZNfNZe+DeZRNffqTFjJi3wbLsl3ktWu/+
	cA+VZOQXIPTu/yv7ULMoZ6M=
X-Google-Smtp-Source: AGHT+IFSUPvynqUoB7QIBe3n5brdaCpftnQhB5StMnPBUtTSIDvE7da2Nbxo/oAQZLeeGoLRCB72Nw==
X-Received: by 2002:a50:8e18:0:b0:553:4ec4:6980 with SMTP id 24-20020a508e18000000b005534ec46980mr490982edw.80.1704896844343;
        Wed, 10 Jan 2024 06:27:24 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id f21-20020a056402195500b00558267aca09sm1320669edz.57.2024.01.10.06.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:27:24 -0800 (PST)
Date: Wed, 10 Jan 2024 16:27:21 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Message-ID: <20240110142721.vuthnnwhmuvghiw4@skbuf>
References: <d269ac88-9923-c00c-8047-cc8c9f94ef2c@arinc9.com>
 <ZHyqI2oOI4KkvgB8@shell.armlinux.org.uk>
 <ZHy1C7wzqaj5KCmy@shell.armlinux.org.uk>
 <ZHy2jQLesdYFMQtO@shell.armlinux.org.uk>
 <0542e150-5ff4-5f74-361a-1a531d19eb7d@arinc9.com>
 <7c224663-7588-988d-56cb-b9de5b43b504@arinc9.com>
 <20230610175553.hle2josd5s5jfhjo@skbuf>
 <22fba48c-054d-ff0a-ae2c-b38f192b26f7@arinc9.com>
 <9308fa1a-6de3-490b-9aeb-eb207b0432df@arinc9.com>
 <9308fa1a-6de3-490b-9aeb-eb207b0432df@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9308fa1a-6de3-490b-9aeb-eb207b0432df@arinc9.com>
 <9308fa1a-6de3-490b-9aeb-eb207b0432df@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_062727_640404_C23E34A7 
X-CRM114-Status: GOOD (  39.56  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 10, 2024 at 02:15:57PM +0300, Arınç ÜNAL wrote:
> On 11.06.2023 10:23, Arınç ÜNAL wrote:
> > 
> > On 10.06.2023 20:55, Vladimir Oltean wrote:
> > > On Sat, Jun 10, 2023 at 01:57:27PM +0300, Arınç ÜNAL wrote:
> > > > I was able to confirm all user ports of the MT7531BE switch transmit/receive
> > > > traffic to/from the SGMII CPU port and computer fine after getting rid of
> > > > priv->info->cpu_port_config().
> > > > 
> > > > Tried all user ports being affine to the RGMII CPU port, that works too.
> > > > 
> > > > https://github.com/arinc9/linux/commit/4e79313a95d45950cab526456ef0030286ba4d4e
> > > 
> > > Did you do black-box testing after removing the code, or were you
> > > also able to independently confirm that the configurations done by
> > > cpu_port_config() were later overwritten? I'm trying to disambiguate
> > > between "works by coincidence" and "works because the analysis was
> > > correct".
> > 
> > I did my testing, merely to make sure we didn't miss anything as Russell already stated that the configuration from cpu_port_config() is later overwritten.
> > 
> > I could put some dev_info around to confirm the code path that overwrites the configuration.
> 
> I have finally tested this.

Replying to a question from 6 months ago is nice of you, like replying
to any question is. But everybody's short memory is by now hit like a
cold cache, everything has been forgotten. I don't even have this thread
in my inbox anymore, it's in the "seen" folder.

There's something to be said about having to re-read a long thread and
the code for 30 minutes, just to reply "Ok".

I think you need to develop a better feeling for when to let go of past
discussions when they become stale, summarize the essence in the commit
description of a patch, and then just resubmit that new patch. People
will have to open the code and make a fresh analysis anyway, so just
help them skip reading past discussions and just focus on the conclusion.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index a4468468b53c..7b60a67d016a 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -968,9 +968,11 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
>  	/* Setup max capability of CPU port at first */
>  	if (priv->info->cpu_port_config) {
> +		dev_info(priv->dev, "running cpu_port_config()\n");
>  		ret = priv->info->cpu_port_config(ds, port);
>  		if (ret)
>  			return ret;
> +		dev_info(priv->dev, "cpu_port_config() ran\n");
>  	}
>  	/* Enable Mediatek header mode on the cpu port */
> @@ -1024,6 +1026,9 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
>  		   priv->ports[port].pm);
>  	mt7530_clear(priv, MT7530_PMCR_P(port), PMCR_LINK_SETTINGS_MASK);
> +	if ((port == 5 || port == 6) && dsa_port_is_cpu(dp))
> +		dev_info(priv->dev, "MT7530_PMCR_P%d PMCR_LINK_SETTINGS_MASK is cleared\n", port);
> +

FYI, you can prefix your prints with something like this to make the log
easier to follow in terms of code paths taken.

	"%s called from %pS <- %pS: ...\n",
		__func__, __builtin_return_address(0), __builtin_return_address(1)

>  	mutex_unlock(&priv->reg_mutex);
>  	return 0;
> @@ -2693,6 +2698,9 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  	mcr_new |= PMCR_IFG_XMIT(1) | PMCR_MAC_MODE | PMCR_BACKOFF_EN |
>  		   PMCR_BACKPR_EN | PMCR_FORCE_MODE_ID(priv->id);
> +	if ((port == 5 && dsa_is_cpu_port(ds, 5)) || (port == 6 && dsa_is_cpu_port(ds, 6)))
> +		dev_info(priv->dev, "MT7530_PMCR_P%d PMCR_CPU_PORT_SETTING equivalent is set\n", port);
> +
>  	/* Are we connected to external phy */
>  	if (port == 5 && dsa_is_user_port(ds, 5))
>  		mcr_new |= PMCR_EXT_PHY;
> @@ -2760,6 +2768,9 @@ static void mt753x_phylink_mac_link_up(struct dsa_switch *ds, int port,
>  	}
>  	mt7530_set(priv, MT7530_PMCR_P(port), mcr);
> +
> +	if ((port == 5 && dsa_is_cpu_port(ds, 5)) || (port == 6 && dsa_is_cpu_port(ds, 6)))
> +		dev_info(priv->dev, "MT7530_PMCR_P%d PMCR_LINK_SETTINGS_MASK equivalent is set\n", port);
>  }
>  static int
> @@ -2796,6 +2807,9 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
>  	mt7530_write(priv, MT7530_PMCR_P(port),
>  		     PMCR_CPU_PORT_SETTING(priv->id));
> +
> +	dev_info(priv->dev, "MT7530_PMCR_P%d PMCR_CPU_PORT_SETTING is set\n", port);
> +
>  	mt753x_phylink_mac_link_up(ds, port, MLO_AN_FIXED, interface, NULL,
>  				   speed, DUPLEX_FULL, true, true);
> 
> [    1.763066] mt7530-mdio mdio-bus:00: running cpu_port_config()
> [    1.769237] mt7530-mdio mdio-bus:00: MT7530_PMCR_P5 PMCR_CPU_PORT_SETTING is set
> [    1.776724] mt7530-mdio mdio-bus:00: MT7530_PMCR_P5 PMCR_LINK_SETTINGS_MASK equivalent is set
> [    1.785254] mt7530-mdio mdio-bus:00: cpu_port_config() ran

This is from mt7531_setup_common(), for port 5.

> [    1.792098] mt7530-mdio mdio-bus:00: running cpu_port_config()
> [    1.798019] mt7530-mdio mdio-bus:00: MT7530_PMCR_P6 PMCR_CPU_PORT_SETTING is set
> [    1.805502] mt7530-mdio mdio-bus:00: MT7530_PMCR_P6 PMCR_LINK_SETTINGS_MASK equivalent is set
> [    1.814023] mt7530-mdio mdio-bus:00: cpu_port_config() ran

This is from mt7531_setup_common(), for port 6.

> [    1.844941] mt7530-mdio mdio-bus:00: MT7530_PMCR_P5 PMCR_LINK_SETTINGS_MASK is cleared

This is from mt7530_port_enable() for port 5, undoing what mt7531_setup_common() has done.
It also seems bogus BTW, the enable() function is doing the same "clear"
as mt7530_port_disable() is doing, rather than mt7530_set(). Were it not
for what's to come [1], this would be a bug with an actual user impact.

> [    1.852972] mt7530-mdio mdio-bus:00: configuring for fixed/rgmii link mode
> [    1.859944] mt7530-mdio mdio-bus:00: MT7530_PMCR_P5 PMCR_CPU_PORT_SETTING equivalent is set

This is from mt753x_phylink_mac_config(), for port 5, partially
overwriting what mt7531_setup_common() has done.

> [    1.868658] mt7530-mdio mdio-bus:00: MT7530_PMCR_P5 PMCR_LINK_SETTINGS_MASK equivalent is set

[1] This is from mt753x_phylink_mac_link_up(), for port 5, overwriting what
mt7530_port_enable() has done. I suspect that, in addition to Russell's
analysis, modifying PMCR_LINK_SETTINGS_MASK from the port_enable()/
port_disable() ops is also something that can be removed.

> [    1.868913] mt7530-mdio mdio-bus:00: MT7530_PMCR_P6 PMCR_LINK_SETTINGS_MASK is cleared
> [    1.877190] mt7530-mdio mdio-bus:00: Link is Up - 1Gbps/Full - flow control rx/tx
> [    1.885179] mt7530-mdio mdio-bus:00: configuring for fixed/2500base-x link mode
> [    1.899973] mt7530-mdio mdio-bus:00: MT7530_PMCR_P6 PMCR_CPU_PORT_SETTING equivalent is set
> [    1.910147] mt7530-mdio mdio-bus:00: MT7530_PMCR_P6 PMCR_LINK_SETTINGS_MASK equivalent is set
> [    1.918681] mt7530-mdio mdio-bus:00: Link is Up - 2.5Gbps/Full - flow control rx/tx
> [    1.920654] mt7530-mdio mdio-bus:00 wan (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7531 PHY] (irq=137)
> [    1.948453] mt7530-mdio mdio-bus:00 lan0 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7531 PHY] (irq=138)
> [    1.970382] mt7530-mdio mdio-bus:00 lan1 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7531 PHY] (irq=139)
> [    1.992423] mt7530-mdio mdio-bus:00 lan2 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7531 PHY] (irq=140)
> [    2.014310] mt7530-mdio mdio-bus:00 lan3 (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7531 PHY] (irq=141)
> [    2.025396] mtk_soc_eth 1b100000.ethernet eth1: entered promiscuous mode
> [    2.032160] mtk_soc_eth 1b100000.ethernet eth0: entered promiscuous mode
> [    2.038912] DSA: tree 0 setup
> 
> Arınç

And this is all the same for port 6.

So yes, it would be good to consolidate the code to follow a simple principle.
Any register fields should be modified only by the set of methods that
they pertain to. In this case, MT7530_PMCR_P appears to only hold link
control information, so it pertains to phylink's methods. Otherwise,
the natural consequence is that they will get unexpectedly overwritten.

It seems outside of the competence of ds->ops->port_enable() and
ds->ops->port_disable(). Those would be appropriate, for example, to
control the switching matrix settings between a user port and its
corresponding CPU port (but not any more switching matrix settings -
those pertain to port_bridge_join() and port_bridge_leave()).

I hope this helps.

