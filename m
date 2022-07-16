Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA0EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vypCuEq/rCX9HvlkITtGSPUFoDxSLRPZn98T+qV3Xf4=; b=m799K0VVytSU//pFbplFgA+gCk
	zbj6uWlSNEi1n6omzLftBqqRjgXRNhf1W2CJE7wRVSWyt0ntN+WU9odT+eeBErDme7Qpm5ihuoQHi
	kMTvuoPx86qnks9ue4jLivem0YfKeR0OpYI9OZ6Vkg3xr5TxUGO6jt15jZ3xxkm+c1rdk1N73xt0a
	Fpcx2FGTWZweOlffrqQZ/5eJaNSD09Qk0g26/ZkFLvDeFMwQEVRmizzOc1e/0DYQ6gB8F5+PeOJJf
	hflBfwCPZ1Z6pLk76+w2YRZSGeow6q4blXFC+yBtGkIfXcs3WmkmV4eXX8I++K4fW6Cf0fwDW8tcm
	UdnaGkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oChcW-00GCb7-Ue; Sat, 16 Jul 2022 13:14:08 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oChcJ-00GCV9-G0; Sat, 16 Jul 2022 13:13:59 +0000
Received: by mail-ej1-x62e.google.com with SMTP id va17so13454051ejb.0;
        Sat, 16 Jul 2022 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vypCuEq/rCX9HvlkITtGSPUFoDxSLRPZn98T+qV3Xf4=;
        b=WjA5VfCC/rZXpbOeSX9aHYmBGP49eby3ugoPBRHLpX5UQxvaT/LsKYkLfAIFJtNSGd
         ca1rd41z4niKpWi5tihqGcMdIdgzf+++E86A0mPqYKnHofAEF+Jbo2LcVRyh5Qq4a7HV
         +POutI91tGrQq1pj6ZraycCRcfSRfXZ+/h9Dg6SjBqtdgD7/09e3VSyN8KdPzF+gTmFQ
         mwZ8nFqh2whpQExmhq+sIyGjsw8m/1lz3zX1rH89jSw7++GBy7EZBVdVesFaxfqMwf+f
         sGWjTuslkljUN/35i8ZAkIOev5RTwINOlmLBOpKCG+YG8AVNRVkl2Hu0jGZmW/EyHMvB
         fMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vypCuEq/rCX9HvlkITtGSPUFoDxSLRPZn98T+qV3Xf4=;
        b=E6/OB+iAHouxnfQMR84ItZXnCyATXEYLgeRiEBFAqzXNEuVYocpgvkKIcXFIngKGNw
         4lkWV0qJQkykTGsGAakE2u1qf3FzqKdNo5ICs30dCXs6y2HfCzY2lrmENCq8qHOGdOr6
         MU0jSvxtgH9/lf6pzK+G/NCZliwlqkFqjuj+9639isfB8ccWjKJzVpcprpzu+WU0zwzS
         m1xElXJX00ysNaXkZ0ApociIIJ359+1Pg/1x8jYYRlNzAVimJyCLIZUl0SCqbDA87FKm
         Zz9U29vmM5xKzAg2OeqgeRWnOjiAFbAuK7F6fNSPB230lrZ3Ay8WGUvLuEqKUBotJs2G
         +ihg==
X-Gm-Message-State: AJIora9qFeYG9pY3DJfXubWqzQfKw7wst/iKpz8STU4WvdPTYeR3Bwwt
	XDFLEEezGztNP8KpPhJIo98=
X-Google-Smtp-Source: AGRyM1v6lwArwzwqDjUSKayn7lfOf6YdBDjzkR+KmWYHKQQRa+FZwUV3F3Eo1RWzpX/X4H1xYJfwPg==
X-Received: by 2002:a17:907:6d01:b0:72f:53f:7a25 with SMTP id sa1-20020a1709076d0100b0072f053f7a25mr6177694ejc.126.1657977229200;
        Sat, 16 Jul 2022 06:13:49 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id jl10-20020a17090775ca00b0072ed9efc9dfsm3203279ejc.48.2022.07.16.06.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 06:13:48 -0700 (PDT)
Date: Sat, 16 Jul 2022 16:13:45 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 0/6] net: dsa: always use phylink
Message-ID: <20220716131345.b2jas3rucsifli7g@skbuf>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <20220715171719.niqcrklpk4ittfvl@skbuf>
 <YtHVLGR0RQ6dWuBS@shell.armlinux.org.uk>
 <20220715160359.2e9dabfe@kernel.org>
 <20220716111551.64rjruz4q4g5uzee@skbuf>
 <YtKkRLD74tqoeBuR@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtKkRLD74tqoeBuR@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_061355_559121_17E54EBB 
X-CRM114-Status: GOOD (  17.94  )
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

On Sat, Jul 16, 2022 at 12:43:00PM +0100, Russell King (Oracle) wrote:
> In the first RFC series I sent on the 24 June, I explicitly asked the
> following questions:
(...)
> I even stated: "Please look at the patches and make suggestions on how
> we can proceed to clean up this quirk of DSA." and made no mention of
> wanting something explicitly from Andrew.
> 
> Yet, none of those questions were answered.
> 
> So no, Jakub's comments are *not* misdirected at all. Go back and read
> my June 24th RFC series yourself:
> 
> https://lore.kernel.org/all/YrWi5oBFn7vR15BH@shell.armlinux.org.uk/

I don't believe I need to justify myself any further for why I didn't
leave a comment on any certain day. I left my comments when I believed
it was most appropriate for me to intervene (as someone who isn't really
affected in any way by the changes, except for generally maintaining
what's in net/dsa/, and wanting to keep a clean framework structure).
Also, to repeat myself, blaming me for leaving comments, but doing so
late, is not really fair. I could have not responded at all, and I
wouldn't be having this unpleasant discussion. It begs the question
whether you're willing to be held accountable in the same way for the
dates on which you respond on RFC patches.

> I've *tried* my best to be kind and collaborative, but I've been
> ignored. Now I'm hacked off. This could have been avoided by responding
> to my explicit questions sooner, rather than at the -rc6/-rc7 stage of
> the show.

I think you should continue to try your best to be kind and collaborative,
you weren't provoked or intentionally ignored in any way, and it isn't
doing these patches any good.

