Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC689C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdvrcAZE1EPFKfjlz9uiWm6tLrgoi3e11AtXEZMwK1w=; b=fQlIWTyPGgtdItEHJAn1vMXwnq
	M9KnACwA7Bg9cZNv9SbL6X/QnjqJNy8kBsT2DuNU29gHFaVuGQKlr0xc9I9Ia9azSCPZHmmBXIP4N
	iadqhgAB2IuAaLjtJ490Fhfd37ODA3XQ3abmM3VPQxljd18WPm5zoYqGVuo5a53GrNfRqnW+vTHnS
	ZII770nR63OQGOPMPVGlV8LTlErqyD1Pcu+O26mAYNZsynNnAwIZnz7aXy+AXrUdQ6g06luOHx6IF
	lybOFMf+6bTN7ih6BUpiiA3zCpTo1USWChchvPLb8cU+636WfNjs4EbtBBABHD8HDzSKUFuegpyBA
	98OicfMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVCc-00FD6p-QG; Thu, 20 Oct 2022 13:03:14 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olV5Z-00F6zU-HI; Thu, 20 Oct 2022 12:55:58 +0000
Received: by mail-ed1-x536.google.com with SMTP id a67so29724163edf.12;
        Thu, 20 Oct 2022 05:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fdvrcAZE1EPFKfjlz9uiWm6tLrgoi3e11AtXEZMwK1w=;
        b=IWGLeBFGsZqMWZu8NBa/5dv5ja5/cw8FaXj7wp6edzJDwcLJj6NIDrLC+M4WHRna9D
         W/HVQMcSF6esNg0rdN16No22xc3RXNXtqC+d9MIwWWH6OraR3CEpdZlZkXd0vUfIPJmc
         r76gdPx5puJhBChIud7soYMaAJ0xDETQQUIVLRMeRctA0r9t2d7V5VzVBTljkqjwVwzN
         xk+sjzPjB9NuQXcw43TV0QX8WHVLExkPruQp0pob9BJFWnTMsxqoV6Lp9yXB/rKr+P2X
         2pqwPSREhVfXotOpf0+Nbs64TnnBegLM9Dc0G+er8ZPI55mGP3UBqvZXxq5cUyuqaNJQ
         NTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdvrcAZE1EPFKfjlz9uiWm6tLrgoi3e11AtXEZMwK1w=;
        b=v0AJsjC1uMJsl2arY03tOwUSOOAAy3myPDTD+U3OKACnkdcAcAFiYHgHHY+1kSlLpn
         Yy6JpKd8TrfpyMdkGsnAzGMIWZYWf2YMOBeul44WbkSp8DTJWEdWkqYZWEOs1MjHhJK2
         eZTwzsTRxp/RUymllwwIgW6VNuMl5U3fFUAHnLKdISy758xf9nfyHF0goWXpA45OR2GL
         DuS6tDsc8tFrzO9ItzoTqK4kZjNU5z9bf2dt4sFizEOybmMICf2fiBkY4nqsk3zUuFol
         Y4pQqZ2pTARr8A8t//xiaLRDTeKAeEHdF6CSC/21Pj/osdktSY4paKeNKojRBcH8mjae
         2wRQ==
X-Gm-Message-State: ACrzQf05lxzTNEZuWaa+t/3DPszudSZYkF2i6V1Y9hU6UG/6jT4yqiws
	U8C4UAZ1TY8BSeGVlCVudy8=
X-Google-Smtp-Source: AMsMyM6HB1XTjI180WP9OH8hwcZzkR92cAa1uSRgWwfsf86U4j6iQ/5OrlRR6/R6eQbEuvuZKarM3Q==
X-Received: by 2002:a05:6402:1393:b0:457:ea9e:ba20 with SMTP id b19-20020a056402139300b00457ea9eba20mr12266779edv.109.1666270553914;
        Thu, 20 Oct 2022 05:55:53 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id q5-20020aa7d445000000b0044bfdbd8a33sm11955944edr.88.2022.10.20.05.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 05:55:53 -0700 (PDT)
Date: Thu, 20 Oct 2022 15:55:49 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Hans J. Schultz" <netdev@kapio-technology.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
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
	Ido Schimmel <idosch@nvidia.com>,
	Florent Fourcot <florent.fourcot@wifirst.fr>,
	Hans Schultz <schultz.hans@gmail.com>,
	Joachim Wiberg <troglobit@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 03/12] net: bridge: enable bridge to install
 locked fdb entries from drivers
Message-ID: <20221020125549.v6kls2lk7etvay7c@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-4-netdev@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018165619.134535-4-netdev@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_055557_617103_C234EBBA 
X-CRM114-Status: GOOD (  11.84  )
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

On Tue, Oct 18, 2022 at 06:56:10PM +0200, Hans J. Schultz wrote:
> diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
> index 8f3d76c751dd..c6b938c01a74 100644
> --- a/net/bridge/br_switchdev.c
> +++ b/net/bridge/br_switchdev.c
> @@ -136,6 +136,7 @@ static void br_switchdev_fdb_populate(struct net_bridge *br,
>  	item->added_by_user = test_bit(BR_FDB_ADDED_BY_USER, &fdb->flags);
>  	item->offloaded = test_bit(BR_FDB_OFFLOADED, &fdb->flags);
>  	item->is_local = test_bit(BR_FDB_LOCAL, &fdb->flags);
> +	item->locked = test_bit(BR_FDB_LOCKED, &fdb->flags);

Shouldn't this be set to 0 here, since it is the bridge->driver
direction?

>  	item->info.dev = (!p || item->is_local) ? br->dev : p->dev;
>  	item->info.ctx = ctx;
>  }
> -- 
> 2.34.1
> 

