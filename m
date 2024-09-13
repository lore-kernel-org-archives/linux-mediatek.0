Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE70FC6171
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 19:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBIMwqenBTlQyVFFphBQuwVmjoh+DZcsKHp9ZHR5PXg=; b=gPUZPAzLBGEFtb6nDOoWtYomrz
	FW4eAmNtFnz6kAGyx5X1f5wXuGgeIgNheHvxts1200ZjTnhwAyQb7wcg11r6LixrX4ZGYVmckS/y5
	irUudhh62wK01kMHCNOkhzPYB/x7UOPJYxYv3Smy0Xs/AtWaaUwwLECCbEIPFy+JXz725bB60QIU+
	1QiQy03rqSVnaoZIgYLMA3AUhi1BovwQmivmCbbfUw5Y02PPmsuqr4zgl6KD9OPEP9OF23//yguu8
	8/Nz24WkwTEV6tA3oOvt8ka8powCv8/JzczpnJtTIfmXuaedwsI3/YRT4d6lmjwMYUP/aztIVWPg6
	HsDi0axQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spBZy-0000000Gt3T-13oO;
	Fri, 13 Sep 2024 19:03:38 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spBZu-0000000Gt0I-0qXq
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 19:03:35 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a8a7dddd2aaso28018866b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 12:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726254211; x=1726859011; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TBIMwqenBTlQyVFFphBQuwVmjoh+DZcsKHp9ZHR5PXg=;
        b=gcl3m/abcTbne8ml1LeeZWjwhBE11vGZBM6Tcx8VmCTY4Q9NzW81Mhf3HJblZ9LIr7
         vZlzCaS44tbcQEYxJTLKNJ09hT6FIaJdslP9ugKlQxKvj3MiwkqP03PvXJfoX50hQQ0p
         afUemo0/nuqy5mOddF7lLz6BI7+xY/taG2JCc9ftLaQvc4tTp3Ulc7z7p183WoJKgXAz
         sNbQEA3SARHmCLpgN72vI0vbeOkn5RCeHDztZgq+rQQqtGYGyRhJ4oKwykQLvVMH/xuT
         mJ3qyff2IV90dlSURdVqbAvEiLQW/4eLT2JZr6WRzitiQWOQ4o4V222/0o3U+t2IDctW
         HZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726254211; x=1726859011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBIMwqenBTlQyVFFphBQuwVmjoh+DZcsKHp9ZHR5PXg=;
        b=kEwuajkcNOdgSon7Vkyty4IUxRNji0Lrju15YZeEFZs4JgoOVDBqetY7RhsUjqwsQp
         Jcs6qfuVT6tVDFREIWvilh/TYYYgsRVAEEAj8NSpHIJTZ15VAU2aXDbVc/F8jIfsNwAy
         aqTQTHTHWdxTzKWY7fqDcaU2mFir3ZSRfT2PUXK2tTXeyUWfnTAcq9C1Vw5TbpaeDlwq
         mlb1pBL8SraN4/4PLSkWygAUD3faVuJj+dK0KNY8vrPdDlCpZPT6ZFfQ8uSl5xwkW3f2
         9wowok6DJ2nnwJu/TNklsjfbV9X2AnVdRSP20+1VUXBED/hJJciU9Y/Ic8w0QKjHRk4G
         TVng==
X-Forwarded-Encrypted: i=1; AJvYcCWBExOI6j2vheRwswBx5aGR2UI61fG2VI7hKKwQ14vU5T4cdOSPwnF6W9V0ref1fZgze2FqQ9wLymzIiUuPLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTdmbKOsBOUr6tLMKL+7TgkDxoW8mExrmGCiIg3qjkfD2ulv7o
	r/Xn18DA9xu9x8cqNFJGwuSUQhGSsL/YZwbijNFr0EB5A+hTgIMn
X-Google-Smtp-Source: AGHT+IEFcJdzMYFYOmvlUuhnXhTbuLeCY0FzC6g7bkBjN8v5ZD4dSVxjAxsr9KFndBGPhyGR7ijAZA==
X-Received: by 2002:a17:907:3d8e:b0:a8d:2623:dd19 with SMTP id a640c23a62f3a-a902966809fmr261184066b.14.1726254210706;
        Fri, 13 Sep 2024 12:03:30 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d55709sm901937966b.210.2024.09.13.12.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 12:03:29 -0700 (PDT)
Date: Fri, 13 Sep 2024 22:03:26 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: netdev@vger.kernel.org,
	=?utf-8?B?QXIxbsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	UNGLinuxDriver@microchip.com,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	linux-mediatek@lists.infradead.org, bridge@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] net: dsa: RCU-protect dsa_ptr in struct net_device
Message-ID: <20240913190326.xv5qkxt7b3sjuroz@skbuf>
References: <20240910130321.337154-1-alexander.sverdlin@siemens.com>
 <20240910130321.337154-2-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910130321.337154-2-alexander.sverdlin@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_120334_268530_55F7832B 
X-CRM114-Status: GOOD (  21.82  )
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

On Tue, Sep 10, 2024 at 03:03:15PM +0200, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> There are multiple races of zeroing dsa_ptr in struct net_device (on
> shutdown/remove) against asynchronous dereferences all over the net
> code. Widespread pattern is as follows:
> 
> CPU0					CPU1
> if (netdev_uses_dsa())
> 					dev->dsa_ptr = NULL;
>         dev->dsa_ptr->...
> 
> One of the possible crashes:
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> CPU: 0 PID: 12 Comm: ksoftirqd/0 Tainted: G O 6.1.99+ #1
> pc : lan9303_rcv
> lr : lan9303_rcv
> Call trace:
>  lan9303_rcv
>  dsa_switch_rcv
>  __netif_receive_skb_list_core
>  netif_receive_skb_list_internal
>  napi_gro_receive
>  fec_enet_rx_napi
>  __napi_poll
>  net_rx_action
> ...
> 
> RCU-protect dsa_ptr and use rcu_dereference() or rtnl_dereference()
> depending on the calling context.
> 
> Rename netdev_uses_dsa() into __netdev_uses_dsa_currently()
> (assumes ether RCU or RTNL lock held) and netdev_uses_dsa_currently()
> variants which better reflect the uselessness of the function's
> return value, which becomes outdated right after the call.
> 
> Fixes: ee534378f005 ("net: dsa: fix panic when DSA master device unbinds on shutdown")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  drivers/net/dsa/mt7530.c                    |   3 +-
>  drivers/net/dsa/ocelot/felix.c              |   3 +-
>  drivers/net/dsa/qca/qca8k-8xxx.c            |   3 +-
>  drivers/net/ethernet/broadcom/bcmsysport.c  |   8 +-
>  drivers/net/ethernet/mediatek/airoha_eth.c  |   2 +-
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c |  22 +++--
>  drivers/net/ethernet/mediatek/mtk_ppe.c     |  15 ++-
>  include/linux/netdevice.h                   |   2 +-
>  include/net/dsa.h                           |  36 +++++--
>  include/net/dsa_stubs.h                     |   6 +-
>  net/bridge/br_input.c                       |   2 +-
>  net/core/dev.c                              |   3 +-
>  net/core/flow_dissector.c                   |  19 ++--
>  net/dsa/conduit.c                           |  66 ++++++++-----
>  net/dsa/dsa.c                               |  19 ++--
>  net/dsa/port.c                              |   3 +-
>  net/dsa/tag.c                               |   3 +-
>  net/dsa/tag.h                               |  19 ++--
>  net/dsa/tag_8021q.c                         |  10 +-
>  net/dsa/tag_brcm.c                          |   2 +-
>  net/dsa/tag_dsa.c                           |   8 +-
>  net/dsa/tag_qca.c                           |  10 +-
>  net/dsa/tag_sja1105.c                       |  22 +++--
>  net/dsa/user.c                              | 104 +++++++++++---------
>  net/ethernet/eth.c                          |   2 +-
>  25 files changed, 240 insertions(+), 152 deletions(-)

Thank you for the patch, and I would like you to not give up on it, even
if we will go for a different bug fix for 'stable'.

It's just that it makes me a bit uneasy to have this as the bug fix.
"Stable" kernels are supposedly named as such because you're not backporting
such a major usage pattern change from the core down to all switch drivers
and N other Ethernet drivers which you can't even test. The diffstat
here says it all, I believe.

This kind of change, in principle, is okay for an early net-next opening.
I have it in my tree, have made a few changes to it, will run more tests
on the HW I have, and will let you know over the course of the following
weeks when it reaches a stage that I'm also comfortable with.

