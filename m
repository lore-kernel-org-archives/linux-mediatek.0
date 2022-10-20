Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB9DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 13:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6W8i9o8o3JEGbLuSjyxc6XgXvQsYfIY429ZrCGIGH7A=; b=Ch0DdPkGD0KhMrvCwJYDaq13Z9
	0mz0MT/I6sWgFowGDuJahU+L0yUSmNVAbKWxiul4jmySP8Jjcv/26rqtOGWiy2Sfy/YZaMRRPff77
	MgJ7Ycbhf7qFsTWRQbRYlRI0jUTLO2KJRa547wPr+S0q/DdmX8LKsFJIImIwgQaD4q4xKl5tEUYis
	uP8hIQPY+gohnk0gPAZsS208gTsQI7RuN2ELBIpNruwFkeTDEwY0h0q2kUgd5DpPC22ZngTN7Oc7h
	dX+LQLMQ4HC9k1YMEMisCnpY7zDJLyuyLpmH7cUussjiZS652NGZhuykOELzycmyTkqy96IozeBhU
	nyQ+gCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVrh-00Fgix-OP; Thu, 20 Oct 2022 13:45:41 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVhZ-00FWva-29; Thu, 20 Oct 2022 13:35:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id d26so47409419eje.10;
        Thu, 20 Oct 2022 06:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6W8i9o8o3JEGbLuSjyxc6XgXvQsYfIY429ZrCGIGH7A=;
        b=LT6l9n3GBTcSQvOt/Zkq2tCDu4edixzNqa/k2gkqkki+ohFuVM0AsUxiNrQDPuQ9dp
         B8LzUHG6JrjRQj4yo+Fwtsf2X3kIvJkaCeWMmiC9fn/wkKNB9HLSlhiilFT9xxo2Q0Ih
         HVR2Qu+RkqbyPNfTZMGYM8QuIDe2OXDl1NiUSgEQw4kpsBwGGTf7cdDbkST3rJPXldCJ
         jyEqdtUxCuylTDY808GKyiUgzYWXGtEZgj/ZGKEFBlt5lPjfOcKiZQzgZ3JhNwwsKskM
         g5Jte+zUA232UjbG0/dLOu5ZfzViovNPhkJSQ9NdfP82wKAyVo5fcwzQMVmg/eq3Labc
         enPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W8i9o8o3JEGbLuSjyxc6XgXvQsYfIY429ZrCGIGH7A=;
        b=R2SRkx1kwmkiN5zGgDNF/EAkj7UR+2w4XIgoM8EeaSzz+fZYD44CfoGlfD9szHcqOj
         +ScuuoIvapzHJp5i9/sMwhJm20cOQlI0WB+koRBvrAtq7fG7qyqZGMjHLmOxSrOMZzBc
         IKdFQnrKBXmzXzWjK5oNSDbw0fq0jH0JLVI2ZJ9A1/1na+9K2VQyk5Rg20G9wNoA5+QA
         dT8YkkoXOQqaaQUffjrNwcVY897vioOe1rXeOx5cx7/yiRlByjw+PT/kIWEmMfG3bFc3
         7e0K5eRUGlEHS1BsJZO0OMTI9uUYQ0i8rCeuv2Yo/HsE3sL6Bf2IGX0Q91ndxoYzrnEB
         k5IA==
X-Gm-Message-State: ACrzQf1WSwSWO4t62t3axV7H/VYqN7VWmvsldWxkKtGXNHJwXKyl0eth
	5fyhyUupLYeAKg/9GtnDVHM=
X-Google-Smtp-Source: AMsMyM6f3BkbQSlnxpGOl1q4sqOax51EJCundMlge5h6nlzLLygpGchZIAl/FmUda0BaXUPlLWUgAg==
X-Received: by 2002:a17:907:b0b:b0:78d:8877:9f9e with SMTP id h11-20020a1709070b0b00b0078d88779f9emr10889846ejl.693.1666272910757;
        Thu, 20 Oct 2022 06:35:10 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id rp7-20020a170906d96700b00730bfe6adc4sm10390698ejb.37.2022.10.20.06.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 06:35:09 -0700 (PDT)
Date: Thu, 20 Oct 2022 16:35:06 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: "Hans J. Schultz" <netdev@kapio-technology.com>, davem@davemloft.net,
	kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Yuwei Wang <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>,
	Florent Fourcot <florent.fourcot@wifirst.fr>,
	Hans Schultz <schultz.hans@gmail.com>,
	Joachim Wiberg <troglobit@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 05/12] net: dsa: propagate the locked flag
 down through the DSA layer
Message-ID: <20221020133506.76wroc7owpwjzrkg@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221020130224.6ralzvteoxfdwseb@skbuf>
 <Y1FMAI9BzDRUPi5Y@shredder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1FMAI9BzDRUPi5Y@shredder>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_063513_192845_4848A1CC 
X-CRM114-Status: GOOD (  19.50  )
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

On Thu, Oct 20, 2022 at 04:24:16PM +0300, Ido Schimmel wrote:
> On Thu, Oct 20, 2022 at 04:02:24PM +0300, Vladimir Oltean wrote:
> > On Tue, Oct 18, 2022 at 06:56:12PM +0200, Hans J. Schultz wrote:
> > > @@ -3315,6 +3316,7 @@ static int dsa_slave_fdb_event(struct net_device *dev,
> > >  	struct dsa_port *dp = dsa_slave_to_port(dev);
> > >  	bool host_addr = fdb_info->is_local;
> > >  	struct dsa_switch *ds = dp->ds;
> > > +	u16 fdb_flags = 0;
> > >  
> > >  	if (ctx && ctx != dp)
> > >  		return 0;
> > > @@ -3361,6 +3363,9 @@ static int dsa_slave_fdb_event(struct net_device *dev,
> > >  		   orig_dev->name, fdb_info->addr, fdb_info->vid,
> > >  		   host_addr ? " as host address" : "");
> > >  
> > > +	if (fdb_info->locked)
> > > +		fdb_flags |= DSA_FDB_FLAG_LOCKED;
> > 
> > This is the bridge->driver direction. In which of the changes up until
> > now/through which mechanism will the bridge emit a
> > SWITCHDEV_FDB_ADD_TO_DEVICE with fdb_info->locked = true?
> 
> I believe it can happen in the following call chain:
> 
> br_handle_frame_finish
>    br_fdb_update // p->flags & BR_PORT_MAB
>        fdb_notify
>            br_switchdev_fdb_notify
> 
> This can happen with Spectrum when a packet ingresses via a locked port
> and incurs an FDB miss in hardware. The packet will be trapped and
> injected to the Rx path where it should invoke the above call chain.

Ah, so this is the case which in mv88e6xxx would generate an ATU
violation interrupt; in the Spectrum case it generates a special packet.
Right now this packet isn't generated, right?

I think we have the same thing in ocelot, a port can be configured to
send "learn frames" to the CPU.

Should these packets be injected into the bridge RX path in the first
place? They reach the CPU because of an FDB miss, not because the CPU
was the intended destination.

