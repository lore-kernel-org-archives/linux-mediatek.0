Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96627C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 23:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqG3eRlHUbK1Lyl7ksi3Aw/n8LhVJQ09Kf9OQGt9voM=; b=qTDkjWa6W/hLwOBB4wbJBNO8fx
	Og/GTzQxx2JzxXP1CucITHXzBoT0ZPUz4hSO3POI863p2EAfzldiMqSALoPM3ePhFHVO2z5Wx/mKV
	2E4wZSdjX5dTd0QtptwmeQHAsF55X1wqjIp5dcg/dbnxK0BKhfFFX/ifBJOypxBTzxT7f1rccBP0b
	Xx2o+cQBlRC9hoT36YP/ko7ucUt+fqSOH+fyTKUC9ho7u8SfpYIvr8PDiVy8v5JolRiE1nLdc21dA
	vAdTnNwxITQTgEWfcMWLeiCwxPBQYWeJ7KAEq+jh9KQqGFOuVUDxC2nQEEfMslFfhlEaymfT+c1V+
	DudAHnTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHv48-00GC9N-RN; Tue, 17 Jan 2023 23:08:28 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHv3y-00GC5J-54; Tue, 17 Jan 2023 23:08:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ss4so71820538ejb.11;
        Tue, 17 Jan 2023 15:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqG3eRlHUbK1Lyl7ksi3Aw/n8LhVJQ09Kf9OQGt9voM=;
        b=ZxbOGkUgPd0sW7VsqQdDiiEezFqOj9G5epZuy25qVAeqJo4VqKuLhaIPdKMzhI4z49
         p7zUZjGRsXHV8muavKDc+qsjH1FkBmWBjW+cqLq/8GvqNU/upQ1x+F5Jp0DS/UQubeEc
         Ac4pdDjxJ5+Rbs4rzkL6WHY3Tpy6HeGJAgAD5JIRBPG5U2Ky+kVUXKioILZsLd1X8STR
         5WGXAL/RbSZkGtOsoqpI0S4xqkIrGul9Gr3ihrlJ5WzcxZx44Wqff26av8mbjq5i8SDN
         WP0YICTHvV0Ho573spiFUOC0blUJaCDC4sjx0e1IQk1UaOFuCmdvVJKufiUSoXFeYeaX
         FT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqG3eRlHUbK1Lyl7ksi3Aw/n8LhVJQ09Kf9OQGt9voM=;
        b=Jl+62KWP71ZznTECCsZSc5EMZgkTXNa65IOkJC7Z93kB+bFsb5Q+16eN0C/Sj41pZE
         yfgbXkJvfGtldmszyDYNsRo7Wm8CSPxuogJbvspLOHqiG4zi9ehM+yTvWEf2yEJAhfdU
         3ZqVKg44JsvYLchgs76JWFpyBP7tBfKgY4SU/I9HYi+YPfnc0GcLKMnVOj6AYxX/13B8
         MDCUyylCLG+usyn2O47wIeuPvwbOH4N/jo3DPBc7ieUph2ugf9pEACF9BvpU7SrSUK8q
         vC+KOzRk1mKcGUGBy2j0jbxrjatSXJh9PWilLzug5RzdRPpkJS6xMvy7M1YkzGjNvPVR
         llaw==
X-Gm-Message-State: AFqh2krjWfW2DmHq23bPKZteUSoHZaPx8m0newHO3iJHQHQwj28xK/Ga
	CbWI0ovf8zI3uczCuBvjZEA=
X-Google-Smtp-Source: AMrXdXsNsFKUYz2t3yHJIzHFLh/nyECIcVDxNeg65wxo6D6FxRXy0K+cvrA+72ZPq62T6qBGsedr5g==
X-Received: by 2002:a17:907:100c:b0:870:e329:5f3d with SMTP id ox12-20020a170907100c00b00870e3295f3dmr4810199ejb.19.1673996890349;
        Tue, 17 Jan 2023 15:08:10 -0800 (PST)
Received: from skbuf ([188.27.184.249])
        by smtp.gmail.com with ESMTPSA id g9-20020a17090604c900b0085ca279966esm8773118eja.119.2023.01.17.15.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 15:08:10 -0800 (PST)
Date: Wed, 18 Jan 2023 01:08:06 +0200
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
Subject: Re: [RFC PATCH net-next 1/5] net: bridge: add dynamic flag to
 switchdev notifier
Message-ID: <20230117230806.ipwcbnq4jcc4qs7z@skbuf>
References: <20230117185714.3058453-1-netdev@kapio-technology.com>
 <20230117185714.3058453-2-netdev@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117185714.3058453-2-netdev@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_150818_215575_9F110465 
X-CRM114-Status: GOOD (  17.31  )
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

On Tue, Jan 17, 2023 at 07:57:10PM +0100, Hans J. Schultz wrote:
> To be able to add dynamic FDB entries to drivers from userspace, the
> dynamic flag must be added when sending RTM_NEWNEIGH events down.
> 
> Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
> ---
>  include/net/switchdev.h   | 1 +
>  net/bridge/br_switchdev.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/include/net/switchdev.h b/include/net/switchdev.h
> index ca0312b78294..aaf918d4ba67 100644
> --- a/include/net/switchdev.h
> +++ b/include/net/switchdev.h
> @@ -249,6 +249,7 @@ struct switchdev_notifier_fdb_info {
>  	u8 added_by_user:1,
>  	   is_local:1,
>  	   locked:1,
> +	   is_dyn:1,
>  	   offloaded:1;
>  };
>  
> diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
> index 7eb6fd5bb917..60c05a00a1df 100644
> --- a/net/bridge/br_switchdev.c
> +++ b/net/bridge/br_switchdev.c
> @@ -136,6 +136,7 @@ static void br_switchdev_fdb_populate(struct net_bridge *br,
>  	item->added_by_user = test_bit(BR_FDB_ADDED_BY_USER, &fdb->flags);
>  	item->offloaded = test_bit(BR_FDB_OFFLOADED, &fdb->flags);
>  	item->is_local = test_bit(BR_FDB_LOCAL, &fdb->flags);
> +	item->is_dyn = !test_bit(BR_FDB_STATIC, &fdb->flags);

Why reverse logic? Why not just name this "is_static" and leave any
further interpretations up to the consumer?

>  	item->locked = false;
>  	item->info.dev = (!p || item->is_local) ? br->dev : p->dev;
>  	item->info.ctx = ctx;
> -- 
> 2.34.1
> 

