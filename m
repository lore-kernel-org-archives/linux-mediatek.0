Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630CEFC6172
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 20:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xolFhNsDxZ0oUZ4unxP8L8jNHdIcN6NCApuBWLejIs=; b=gaLhia1ttRCfIjbC5jTLeQ+Nb6
	HhsBtFpmpbPd41yZdOJBYwg/EHUffRXwxwAO/kH6sx9G6/9y/1Ca4AEd17pGDiWbQJX67eWVNXgGE
	nzcWNakt5L8vaAFiPQ1BfxJFYPUXhFc6o0LWOHz3/FPCz+JyniSyNJN39Yh8VPmX8G5bbi+Re7T7N
	p3C1LlLeDAJ2P/wot4O3Zo6G9wF14rKqr1VFfDL587mdDhbnMBvhiF/YoIhIHssa1AVIBQOSgnJsj
	5pNAfB9mpNsnVSY9ZzVVYeuOThwwpO7NFb/B3K6SttBvPX7rHDLXb50+L4m2mid2VT3NiMCHXULDw
	gFztHiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spCv1-0000000H4Ty-3sVD;
	Fri, 13 Sep 2024 20:29:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spCuy-0000000H4TS-078w;
	Fri, 13 Sep 2024 20:29:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42ca5447142so4048755e9.2;
        Fri, 13 Sep 2024 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726259362; x=1726864162; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5xolFhNsDxZ0oUZ4unxP8L8jNHdIcN6NCApuBWLejIs=;
        b=ahMYVXARgIzUmW5S+96fepWpqHKqV8XQVzJAi9Q9CGWH9PC+kTna6MFZkgAuzs3sa8
         EnSbJn6+C2/94kGLzGYsETVN3744skmeWvwxhUWFXbqfX3CKJ/fUBsqUkx/kPCbGI1WA
         GFlgAQuVcQ8/wj/4kMiQn8YEeIz3/arkLxzkYrCN0biwilLn19M3VEmiFTO7lto3+NSZ
         NQd373EzxfJ2PV/Tlmc0+R9NsbZWDd1KHIEFjimD9w4T11hP4TTxYsab0dMqS3v0RwQr
         C6m1T/bEtKTOixU5QTcDu45oNKrJHgWMWHZSKL9unIJQA/Efr2Sm0ay2Do2q4yrJE0ox
         Z+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726259362; x=1726864162;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xolFhNsDxZ0oUZ4unxP8L8jNHdIcN6NCApuBWLejIs=;
        b=MsFhiySL/XlIXkDIteWBcPNgbalAkzwFybEBU+zmxvA8DBsHDQTrEPj6DWorntWOam
         v2BLtFmGaAovD4+Bqex3oZZ3qODVEXySJ6Ky/Aa33V13j8rfRmfiRKew4GfO3YWAvjUQ
         45dGyOX0XlDK92GH35Px4bnDoWBCNey7gVv+kMLTYHrSvs9/5+1VKpPuyOhsaCn38QGK
         iGEM7Mx9HSpLtkhQzpffq4Jq1z8z/nstKi39w+tXgdgZ2xu6i+GqO9EMaV6mWX/JPmnG
         bmyCmraxZAjVBaYuTPlxLxYg3lADyI51Ft2tHgqci74K59sIs8pzRP0wagrs/Eyq49nA
         9HLg==
X-Forwarded-Encrypted: i=1; AJvYcCU/rAg4VBqm9JBU6mpVxV0/kjGijCJ3CceOQ/IapA9Qy5B/cGpHfv4OhwmSZwdf4YJ2ksBre7opuaCat0fV5Pg=@lists.infradead.org, AJvYcCUT8DJ++VrWRVvpEFNr29DEoyoTM3zgYjaQAH8GH7CAfpjjx7q3QFrhuDHPT9DFVv9sxiF/wwhm5KoUaicXYW79@lists.infradead.org
X-Gm-Message-State: AOJu0YwWqLQP8CpSAWWHq4D23lFqYcjQi/6Yv88lXEe9qdervtYdbb0Q
	myJZPytERq4F+0s1NDTmhs1er3wavTuVQ8tFnYNpk+tqAUTs/Ina
X-Google-Smtp-Source: AGHT+IGpvt0S5W8aCBGJ6NArrRUubl0oaLk1rGoOiTAa8dDF48WlXMqbFY0nwTaGKoLmpUpJSlcmPQ==
X-Received: by 2002:a05:600c:3506:b0:42c:ba6c:d9b7 with SMTP id 5b1f17b1804b1-42cdb57e85emr30075965e9.5.1726259361289;
        Fri, 13 Sep 2024 13:29:21 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b189a83sm35598185e9.34.2024.09.13.13.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 13:29:19 -0700 (PDT)
Date: Fri, 13 Sep 2024 23:29:16 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	"andrew@lunn.ch" <andrew@lunn.ch>,
	"vivien.didelot@gmail.com" <vivien.didelot@gmail.com>,
	"claudiu.manoil@nxp.com" <claudiu.manoil@nxp.com>,
	"woojung.huh@microchip.com" <woojung.huh@microchip.com>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"george.mccollister@gmail.com" <george.mccollister@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"linux@rempel-privat.de" <linux@rempel-privat.de>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"hauke@hauke-m.de" <hauke@hauke-m.de>,
	"LinoSanfilippo@gmx.de" <LinoSanfilippo@gmx.de>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"sean.wang@mediatek.com" <sean.wang@mediatek.com>,
	"kurt@linutronix.de" <kurt@linutronix.de>,
	"m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"Landen.Chao@mediatek.com" <Landen.Chao@mediatek.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 net 2/5] net: dsa: be compatible with masters which
 unregister on shutdown
Message-ID: <20240913202916.t7bpdc6ubfdpv47s@skbuf>
References: <20210917133436.553995-1-vladimir.oltean@nxp.com>
 <20210917133436.553995-3-vladimir.oltean@nxp.com>
 <2d2e3bba17203c14a5ffdabc174e3b6bbb9ad438.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d2e3bba17203c14a5ffdabc174e3b6bbb9ad438.camel@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_132924_096812_61342F88 
X-CRM114-Status: GOOD (  22.02  )
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

Hi Alexander,

On Wed, Sep 04, 2024 at 08:31:13AM +0000, Sverdlin, Alexander wrote:
> > +static void lan9303_mdio_shutdown(struct mdio_device *mdiodev)
> > +{
> > +	struct lan9303_mdio *sw_dev = dev_get_drvdata(&mdiodev->dev);
> > +
> > +	if (!sw_dev)
> > +		return;
> > +
> > +	lan9303_shutdown(&sw_dev->chip);
> > +
> > +	dev_set_drvdata(&mdiodev->dev, NULL);
> >  }
> 
> This unfortunately didn't work well with LAN9303 and probably will not work
> with others:
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> CPU: 0 PID: 442 Comm: kworker/0:3 Tainted: G           O       6.1.99+gitb7793b7d9b35 #1
> Workqueue: events_power_efficient phy_state_machine
> pc : lan9303_mdio_phy_read+0x1c/0x34
> lr : lan9303_phy_read+0x50/0x100
> Call trace:
>  lan9303_mdio_phy_read+0x1c/0x34
>  lan9303_phy_read+0x50/0x100
>  dsa_slave_phy_read+0x40/0x50
>  __mdiobus_read+0x34/0x130
>  mdiobus_read+0x44/0x70
>  genphy_update_link+0x2c/0x104
>  genphy_read_status+0x2c/0x120
>  phy_check_link_status+0xb8/0xcc
>  phy_state_machine+0x198/0x27c
>  process_one_work+0x1dc/0x450
>  worker_thread+0x154/0x450
> 
> as long as the ports are not down (and dsa_switch_shutdown() doesn't ensure it),
> we cannot just zero drvdata, because PHY polling will eventually call
> 
> static int lan9303_mdio_phy_read(struct lan9303 *chip, int addr, int reg)
> {
>         struct lan9303_mdio *sw_dev = dev_get_drvdata(chip->dev);
> 
>         return mdiobus_read_nested(sw_dev->device->bus, addr, reg);
> 
> There are however multiple other unsafe patterns.
> I suppose current
> 
> dsa_switch_shutdown();
> dev_set_drvdata(...->dev, NULL);
> 
> pattern is broken in many cases...

Unfortunately the code portion which you've quoted for your reply does not
show the full story. dsa_switch_shutdown(), at the time of this patch,
was implemented like this (stripped of comments):

void dsa_switch_shutdown(struct dsa_switch *ds)
{
	struct net_device *master, *slave_dev;
	LIST_HEAD(unregister_list);
	struct dsa_port *dp;

	mutex_lock(&dsa2_mutex);
	rtnl_lock();

	list_for_each_entry(dp, &ds->dst->ports, list) {
		if (dp->ds != ds)
			continue;

		if (!dsa_port_is_user(dp))
			continue;

		master = dp->cpu_dp->master;
		slave_dev = dp->slave;

		netdev_upper_dev_unlink(master, slave_dev);
		unregister_netdevice_queue(slave_dev, &unregister_list);
	}
	unregister_netdevice_many(&unregister_list);

	rtnl_unlock();
	mutex_unlock(&dsa2_mutex);
}

I believe you would be wrong to blame this patch for exiting with the
slave/user ports still running (and thus ds->ops->phy_read() still
callable), because, as you can see, it doesn't do that - it unregisters
them, which also stops the net_device prior. So, both phylink_stop() and
phylink_destroy() would be called.

The patch had other problems though, and that led to the rework in
commit ee534378f005 ("net: dsa: fix panic when DSA master device unbinds
on shutdown"), rework which is in fact to blame for what you're reporting.

Given that we are talking about a fix to a fix, it doesn't really matter
in terms of backporting targets which one it is, but for correctness sake,
it is the later patch that fixed some things while introducing the race
condition.

