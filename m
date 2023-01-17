Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55003C38147
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 23:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzoFsN2BtIwkV7J9p1OybyavGXclmQ9kcPW4uj8vI+4=; b=dpKCJZ6HQA55bMfHwlG9dk23ED
	4U1lL9f13VoHUzfMidwb/7SAs5HsKMqmd5TGP6KdU3+Tve1awrhIXSX1mugowx5EWRRvsnsJjv/M3
	/j7C3VTUttDuyVkzgDzLZd8XlP86hvy1Ji6Tu52/ehi9lGXGqCn5qm58rwivEjjn6rtea4w6gHZI6
	SImsm40rkn9nC4kiBYF0j9nSw3jtB3vu99knoxS7L+kQQXKIFIdPW7y68T+TF+0YwiIo+2GGuqMS6
	Q6uPOa0b4Ocjlp3HNKfWseFcR4d0NzwwmOZug1b3zImT//PzpylDJ4NxokUHT7YxLesoncHu2987O
	xWui4eMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHvDi-00GDzO-Dl; Tue, 17 Jan 2023 23:18:22 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHvDW-00GDqb-8G; Tue, 17 Jan 2023 23:18:11 +0000
Received: by mail-ej1-x632.google.com with SMTP id tz11so14748597ejc.0;
        Tue, 17 Jan 2023 15:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzoFsN2BtIwkV7J9p1OybyavGXclmQ9kcPW4uj8vI+4=;
        b=WHkz1zPwXkTNrAiIJUYxeLo3UGJReyuX52LQMNDjwPjA7k3W/kAYzvCsEzteUoEbu4
         yPAJWqnKYjN3T9Y0xfzCw8HsGJQdEZTqj4u0qMr0hYP9TSroZy6ZGbd1QX0+RpWNR5h/
         OigdrmABYXR+MFv/Ar3o2IjM9bOQZkEATabOuTvlr4F6PSGsFeKKtNt4P6DfO8grzL8a
         Wlt6QM8UkV7I4gD+iqf96i0VPn97OK4iwvJSA5WSIRl3e3GhvaJZFO4S+kKSuRBvmNOP
         8p7Mgj/QnaBU9sQdFLHhnetF3dMl9apL4Ry5w8QJZIcBcBEM2uC+DT6QDtQpH8K0QaS4
         1+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzoFsN2BtIwkV7J9p1OybyavGXclmQ9kcPW4uj8vI+4=;
        b=xF5NujpxvjQHr625J3mtv4utfvvH1L9J33Fs0yorcTHFb+3h7MTsMnieACnQNu+7wo
         hjBPWa6BttE3UxYKAuo00dijtmLJEdKjIQzT+5Rwia4Jr4SsWit/u8Xee6TIcIQxc2ZP
         DXRhXmomHB/6FVeRTNrCUDTlksQHQzXg4GL9RFJ9gVSZAQddE3i3ixdCaxRfpCN25Ufq
         nGH9gfi+mlJvqQaDUlQIp8Scf6Dj7+px3TFJdpJy0fu+6zzO68Qoh/gaEpVyvA0/rSpi
         Ftf23d/wLG86MZ2s7BaSjC+W0GoHByPj7F3+hs9iHjLc3bEsp5yLZ/804q/5xHRQsDy7
         2HOg==
X-Gm-Message-State: AFqh2kppqar0Y80yv0kkKg9aMahXYMp09hX49q8N9PhMNUoBdHF6Ywj8
	cDJF+YgoV3HJ1dVAb/iJanY/ndk2iAY=
X-Google-Smtp-Source: AMrXdXsHkUY7XfIE1B2bjhbcIkUoum8bNrkbJ1XX/wIp0s+lBwNIEiBdSnR4Jk843e+5/9ZDSuNesw==
X-Received: by 2002:a17:906:358f:b0:829:6064:bc52 with SMTP id o15-20020a170906358f00b008296064bc52mr4616096ejb.74.1673997473518;
        Tue, 17 Jan 2023 15:17:53 -0800 (PST)
Received: from skbuf ([188.27.184.249])
        by smtp.gmail.com with ESMTPSA id g18-20020a1709061c9200b007c1675d2626sm13977440ejh.96.2023.01.17.15.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 15:17:53 -0800 (PST)
Date: Wed, 18 Jan 2023 01:17:50 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Hans J. Schultz" <netdev@kapio-technology.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [RFC PATCH net-next 2/5] net: dsa: propagate flags down towards
 drivers
Message-ID: <20230117231750.r5jr4hwvpadgopmf@skbuf>
References: <20230117185714.3058453-1-netdev@kapio-technology.com>
 <20230117185714.3058453-3-netdev@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117185714.3058453-3-netdev@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_151810_333182_2CEA412E 
X-CRM114-Status: GOOD (  17.10  )
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

On Tue, Jan 17, 2023 at 07:57:11PM +0100, Hans J. Schultz wrote:
> Dynamic FDB flag needs to be propagated through the DSA layer to be
> added to drivers.
> Use a u16 for fdb flags for future use, so that other flags can also be
> sent the same way without having to change function interfaces.
> 
> Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
> ---
> @@ -3364,6 +3368,7 @@ static int dsa_slave_fdb_event(struct net_device *dev,
>  	struct dsa_port *dp = dsa_slave_to_port(dev);
>  	bool host_addr = fdb_info->is_local;
>  	struct dsa_switch *ds = dp->ds;
> +	u16 fdb_flags = 0;
>  
>  	if (ctx && ctx != dp)
>  		return 0;
> @@ -3410,6 +3415,9 @@ static int dsa_slave_fdb_event(struct net_device *dev,
>  		   orig_dev->name, fdb_info->addr, fdb_info->vid,
>  		   host_addr ? " as host address" : "");
>  
> +	if (fdb_info->is_dyn)
> +		fdb_flags |= DSA_FDB_FLAG_DYNAMIC;
> +

Hmm, I don't think this is going to work with the assisted_learning_on_cpu_port
feature ("if (switchdev_fdb_is_dynamically_learned(fdb_info))"). The reason being
that a "dynamically learned" FDB entry (defined as this):

static inline bool
switchdev_fdb_is_dynamically_learned(const struct switchdev_notifier_fdb_info *fdb_info)
{
	return !fdb_info->added_by_user && !fdb_info->is_local;
}

is also dynamic in the DSA_FDB_FLAG_DYNAMIC sense. But we install a
static FDB entry for it on the CPU port.

And in your follow-up patch 3/5, you make all drivers except mv88e6xxx
ignore all DSA_FDB_FLAG_DYNAMIC entries (including the ones snooped from
address learning on software interfaces). So this breaks those drivers
which don't implement DSA_FDB_FLAG_DYNAMIC but do set ds->assisted_learning_on_cpu_port
to true.

I think you also want to look at the added_by_user flag to disambiguate
between a dynamic FDB entry added from learning (which it's ok to
offload as static, because software ageing will remove it) and one added
by the user.

>  	INIT_WORK(&switchdev_work->work, dsa_slave_switchdev_event_work);
>  	switchdev_work->event = event;
>  	switchdev_work->dev = dev;
> @@ -3418,6 +3426,7 @@ static int dsa_slave_fdb_event(struct net_device *dev,
>  	ether_addr_copy(switchdev_work->addr, fdb_info->addr);
>  	switchdev_work->vid = fdb_info->vid;
>  	switchdev_work->host_addr = host_addr;
> +	switchdev_work->fdb_flags = fdb_flags;
>  
>  	dsa_schedule_work(&switchdev_work->work);
>  

