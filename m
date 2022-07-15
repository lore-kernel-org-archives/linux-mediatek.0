Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E60DC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 20:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hezb8LC6VHhsVv2dBKdkiaPfHcKVomwV2NQgIck5DiA=; b=pIxBYN7X78f0bCGJzauLbtulaS
	SAEv3kPpZat/La8wR1xFV0FjwUATwEqIa5sbCSsppIr78BZSFUzkCh30X/9xkttlVqlDfh0VMWra2
	gfSOuqnInzvmO6myjFhiMgFlFQGNErgfwP/CrYds4vRtbjjIt92kYb179NYxB2QYY68HIJrQPOxal
	IvjRKgvPnpcxud6BksoAhPJVyYRwIjtMm1O2hsaaYRSUW8ey2FZwlYmi7LKxCpUpkqHak1XKzKXaO
	a2NdlDcGEozy1e8yBV+1S4+409LbOsVWR1pE4pqWkz2OEJ8a9iyF532aeYNNFfPslo6WAXUZoaKGW
	KnZLXyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCSF9-00AHPG-Hw; Fri, 15 Jul 2022 20:48:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCSEy-00AHLq-5t; Fri, 15 Jul 2022 20:48:49 +0000
Received: by mail-ed1-x532.google.com with SMTP id m16so7732001edb.11;
        Fri, 15 Jul 2022 13:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hezb8LC6VHhsVv2dBKdkiaPfHcKVomwV2NQgIck5DiA=;
        b=Tq3ph/DejmAhUdUnV/JlESyMZHwcbbvwsbqDyONdf2PoZYL5sTPOQW3l+3djGe21AW
         exlkz+WqTjsLukDWZ9z5cGKAF9OXPAfu9ZLPsjvPo5IE3yb29+WgnMA4dqZHoLJ7e4Fx
         /UlliBn0U99ltvo523p4f/yZ2C3upzo6XXgczcADPhyokG7g1kZyEzUWMgiUvD8uuAEn
         NwSd7z2ejZiWY+8Zit+20+Pt8ffsv/p4jl2PsJu8EUbPJAbs158z8o2re6XM7n/0m3ml
         DKCRfQ8zxcb2R+Ra3ubr5ZHftWB/fNzWWpduY/MIUQ3WRk2q/WOnE/8Pkv3vEQdA0H7p
         BJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hezb8LC6VHhsVv2dBKdkiaPfHcKVomwV2NQgIck5DiA=;
        b=Rolpxme0KR69RXNdU5F0L2tQZiQKEhFnVT9Vabn0ShtYOT+/1wBL7DAQPgik6xHi9p
         c9v593ARYeLFNP4VgA6hlZO2DzrO8Qj4bkTw41KI+cFsfOWBSbzlHu97RPCU7TbwYUHv
         jhFXcftmcgT6Fkh5z144do0yqnxN/jIKGLhC+vo0fJufeJxWDFW8bras+BEtbW7ecXmE
         7lLRf0VCJOcuEc0VVis3jlaY+p5lwAWuBRIfjARYP3lIIzEFHedhvdKeoq96+SxlUAfW
         yMPjmYW1onPmp6Gh01pMytHhogwFmKN2h/KUJiaDKXHKJIpEBk7c7tGSuLLTIXbwxvOl
         oppQ==
X-Gm-Message-State: AJIora+BlSLpeQkAIA1u3GbuQfe7mur26YWXxPb/v1AMI8nI5OuOSdz5
	7YqKVZrkROKx0/D+Afcl5gY=
X-Google-Smtp-Source: AGRyM1s+Y76WXlbBm2G6MIgUB/L/JKHKdvm9y3kQlZgGEy8jIEzPyxJkhr6XpR9Q9VObhdQhKtQt5Q==
X-Received: by 2002:a05:6402:1d97:b0:43a:7b45:8e14 with SMTP id dk23-20020a0564021d9700b0043a7b458e14mr21354226edb.418.1657918125279;
        Fri, 15 Jul 2022 13:48:45 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id kw5-20020a170907770500b0072f07213509sm742435ejc.12.2022.07.15.13.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 13:48:44 -0700 (PDT)
Date: Fri, 15 Jul 2022 23:48:41 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 2/6] software node: allow named software node to
 be created
Message-ID: <20220715204841.pwhvnue2atrkc2fx@skbuf>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNky-006e3g-KA@rmk-PC.armlinux.org.uk>
 <YtHGwz4v7VWKhIXG@smile.fi.intel.com>
 <20220715201715.foea4rifegmnti46@skbuf>
 <YtHPJNpcN4vNfgT6@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtHPJNpcN4vNfgT6@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_134848_261529_8F8D7111 
X-CRM114-Status: GOOD (  21.05  )
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

On Fri, Jul 15, 2022 at 11:33:40PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 15, 2022 at 11:17:15PM +0300, Vladimir Oltean wrote:
> > On Fri, Jul 15, 2022 at 10:57:55PM +0300, Andy Shevchenko wrote:
> > > On Fri, Jul 15, 2022 at 05:01:32PM +0100, Russell King wrote:
> > > > From: Vladimir Oltean <vladimir.oltean@nxp.com>
> > > > 
> > > > Allow a named software node to be created, which is needed for software
> > > > nodes for a fixed-link specification for DSA.
> > > 
> > > In general I have no objection, but what's worrying me is a possibility to
> > > collide in namespace. With the current code the name is generated based on
> > > unique IDs, how can we make this one more robust?
> > 
> > Could you be more clear about the exact concern?
> 
> Each software node can be created with a name. The hierarchy should be unique,
> means that there can't be two or more nodes with the same path (like on file
> system or more specifically here, Device Tree). Allowing to pass names we may
> end up with the situation when it will be a path collision. Yet, the static
> names are easier to check, because one may run `git grep ...` or coccinelle
> script to see what's in the kernel.

So won't kobject_init_and_add() fail on namespace collision? Is it the
problem that it's going to fail, or that it's not trivial to statically
determine whether it'll fail?

Sorry, but I don't see something actionable about this.

