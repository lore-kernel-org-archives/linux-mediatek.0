Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054A6C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 13:41:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC32B20772
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 13:41:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uYgf2XOJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC32B20772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T403RWkDiQYlUF/XbNvQflXLL0KnwXJ7Y3bA6tVjWqM=; b=uYgf2XOJnaeNjD5d0ryPkrI2B
	nkAZBsVQzDUs1ZdNptFCH1vbz4FpYgYk4cUa0EqORU/w2fbvNnPlcn3/sTKCXhm3PRbaTA/Ha90F7
	AriKI0qyuJB6u1BqQKWGPooOQzGrFxwn59/JqQwIlfglHkJ4niUW4ivijdVIsHKlB9o78EAsag3Fn
	qqVJEv+WXxpAV0Ye2omTpmPZ+90ks5uqGOz2uZFF/B/rQAKs3WbJ3tmuBhpn75INYPyzbYi+0yllX
	liYzB/yeCGX/Q69KC2XditCxLULjW7t0YR5ia38ekXzaneOzyVzPVKOR853xAq3HSAkuG4uuyWqmM
	ouZRsdJpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtWo1-0006NB-2v; Thu, 09 Jul 2020 13:41:41 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtWny-0006Mg-Ok; Thu, 09 Jul 2020 13:41:39 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1jtWnb-004L5F-7c; Thu, 09 Jul 2020 15:41:15 +0200
Date: Thu, 9 Jul 2020 15:41:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix mtu warning
Message-ID: <20200709134115.GK928075@lunn.ch>
References: <20200709055742.3425-1-frank-w@public-files.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709055742.3425-1-frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_094138_815568_7622C709 
X-CRM114-Status: GOOD (  17.48  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 09, 2020 at 07:57:42AM +0200, Frank Wunderlich wrote:
> From: Ren=E9 van Dorst <opensource@vdorst.com>
> =

> in recent Kernel-Versions there are warnings about incorrect MTU-Size
> like these:
> =

> mt7530 mdio-bus:00: nonfatal error -95 setting MTU on port x
> eth0: mtu greater than device maximum
> mtk_soc_eth 1b100000.ethernet eth0: error -22 setting MTU to include DSA =
overhead
> =

> Fixes: bfcb813203e6 ("net: dsa: configure the MTU for switch ports")
> Fixes: 72579e14a1d3 ("net: dsa: don't fail to probe if we couldn't set th=
e MTU")
> Fixes: 7a4c53bee332 ("net: report invalid mtu value via netlink extack")
> Signed-off-by: Ren=E9 van Dorst <opensource@vdorst.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes in v2:
>   Fixes: tag show 12-chars of sha1 and moved above other tags
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index 85735d32ecb0..00e3d70f7d07 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2891,6 +2891,10 @@ static int mtk_add_mac(struct mtk_eth *eth, struct=
 device_node *np)
>  	eth->netdev[id]->irq =3D eth->irq[0];
>  	eth->netdev[id]->dev.of_node =3D np;
> =

> +	eth->netdev[id]->mtu =3D 1536;

Hi Frank

Don't change to MTU from the default. Anybody using this interface for
non-DSA traffic expects the default MTU. DSA will change it as needed.

> +	eth->netdev[id]->min_mtu =3D ETH_MIN_MTU;

No need to set the minimum. ether_setup() will initialize it.

> +	eth->netdev[id]->max_mtu =3D 1536;

I assume this is enough to make the DSA warning go away, but it is the
true max? I have a similar patch for the FEC driver which i should
post sometime. Reviewing the FEC code and after some testing, i found
the real max was 2K - 64.

     Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
